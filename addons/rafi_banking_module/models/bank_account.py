from odoo import models, fields, api
from odoo.exceptions import ValidationError

class BankAccount(models.Model):
    _name = 'banking.account'
    _description = 'Bank Account'
    _inherit = ['mail.thread', 'mail.activity.mixin']
    _rec_name = 'account_number'

    account_number = fields.Char(
        string='Account Number',
        required=True,
        readonly=True,
        copy=False,
        default='New'
    )
    account_holder = fields.Char(string='Account Holder', required=True, tracking=True)
    balance = fields.Float(string='Balance', compute='_compute_balance', store=True, tracking=True)
    currency_id = fields.Many2one('res.currency', string='Currency', required=True, 
                                   default=lambda self: self.env.company.currency_id)
    account_type = fields.Selection([
        ('savings', 'Savings'),
        ('checking', 'Checking'),
        ('business', 'Business')
    ], string='Account Type', required=True, default='savings', tracking=True)
    
    state = fields.Selection([
        ('draft', 'Draft'),
        ('active', 'Active'),
        ('suspended', 'Suspended'),
        ('closed', 'Closed')
    ], string='State', default='draft', tracking=True)
    
    transaction_ids = fields.One2many('banking.transaction', 'account_id', string='Transactions')
    partner_id = fields.Many2one('res.partner', string='Partner')
    
    opening_date = fields.Date(string='Opening Date', default=fields.Date.today, tracking=True)

    def _capitalize_account_holder(self):
        for rec in self:
            if rec.account_holder:
                rec.account_holder = rec.account_holder.title()

    @api.model
    def create(self, vals):
        if vals.get('account_number', 'New') == 'New':
            vals['account_number'] = self.env['ir.sequence'].next_by_code(
                'banking.account'
            )
        rec = super(BankAccount, self).create(vals)
        rec._capitalize_account_holder()
        return rec

    def write(self, vals):
        res = super(BankAccount, self).write(vals)
        self._capitalize_account_holder()
        return res

    @api.depends('transaction_ids.amount', 'transaction_ids.state')
    def _compute_balance(self):
        for rec in self:
            deposits = sum(rec.transaction_ids.filtered(
                lambda t: t.transaction_type == 'deposit' and t.state == 'done'
            ).mapped('amount'))
            withdrawals = sum(rec.transaction_ids.filtered(
                lambda t: t.transaction_type == 'withdraw' and t.state == 'done'
            ).mapped('amount'))
            transfers_out = sum(rec.transaction_ids.filtered(
                lambda t: t.transaction_type == 'transfer' and t.state == 'done'
            ).mapped('amount'))            
            transfers_in = sum(rec.transaction_ids.filtered(
                lambda t: t.transaction_type == 'transfer' and t.state == 'done'
            ).mapped('amount'))   
            rec.balance = deposits - withdrawals - transfers_out + transfers_in      
    
    def action_activate(self):
        self.write({'state': 'active'})
    
    def action_suspend(self):
        self.write({'state': 'suspended'})
    
    def action_close(self):
        if self.balance > 0:
            raise ValidationError('Cannot close account with positive balance. Please withdraw all funds first.')
        self.write({'state': 'closed'})
    
    @api.constrains('account_holder')
    def _check_account_holder(self):
        for rec in self:
            if not rec.account_holder or len(rec.account_holder.strip()) < 2:
                raise ValidationError('Account holder name must be at least 2 characters.')