from odoo import models, fields, api
from odoo.exceptions import ValidationError, UserError

class BankTransaction(models.Model):
    _name = 'banking.transaction'
    _description = 'Bank Transaction'
    _order = 'transaction_date desc, id desc'

    name = fields.Char(string='Reference', required=True, readonly=True, copy=False,
                       default=lambda self: self.env['ir.sequence'].next_by_code('banking.transaction'))
    account_id = fields.Many2one('banking.account', string='Bank Account', required=True, 
                                  ondelete='restrict')
    transaction_type = fields.Selection([
        ('deposit', 'Deposit'),
        ('withdraw', 'Withdrawal'),
        ('transfer', 'Transfer'),
    ], string='Transaction Type', required=True)
    
    amount = fields.Float(string='Amount', required=True)
    transaction_date = fields.Datetime(string='Transaction Date', default=fields.Datetime.now, 
                                       required=True)
    description = fields.Text(string='Description')
    
    state = fields.Selection([
        ('draft', 'Draft'),
        ('done', 'Done'),
        ('cancelled', 'Cancelled')
    ], string='State', default='draft')
    
    balance_after = fields.Float(string='Balance After', readonly=True)
    
    @api.constrains('amount')
    def _check_amount(self):
        for rec in self:
            if rec.amount <= 0:
                raise ValidationError('Transaction amount must be greater than zero.')
    
    def action_confirm(self):
        for rec in self:
            if rec.state != 'draft':
                raise UserError('Only draft transactions can be confirmed.')

            if rec.account_id.state not in ['active', 'draft']:
                raise UserError('Account must be active to process transactions.')
            
            if rec.transaction_type == "transfer":
                if rec.account_id.balance < rec.amount:
                    raise ValidationError(
                        f'Insufficient funds. Available balance: {rec.account_id.balance:.2f}'
                    )

                rec.account_id.balance -= rec.amount

                if rec.destination_account_id:
                    rec.destination_account_id.balance += rec.amount            
                
            if rec.transaction_type == 'withdraw':
                if rec.account_id.balance < rec.amount:
                    raise ValidationError(
                        f'Insufficient funds. Available balance: {rec.account_id.balance:.2f}'
                    )
            
            rec.write({
                'state': 'done',
                'balance_after': rec.account_id.balance + 
                    (rec.amount if rec.transaction_type == 'deposit' else -rec.amount)
            })
            
            if rec.account_id.state == 'draft':
                rec.account_id.action_activate()
    
    def action_cancel(self):
        for rec in self:
            if rec.state == 'done':
                raise UserError('Cannot cancel a completed transaction. Create a reverse transaction instead.')
            rec.write({'state': 'cancelled'})
    
    def action_set_draft(self):
        self.write({'state': 'draft'})