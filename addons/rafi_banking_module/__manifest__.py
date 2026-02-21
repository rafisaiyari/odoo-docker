{
    'name': 'Banking Module',
    'version': '19.0.1.0.0',
    'category': 'Banking',
    'summary': 'Manage bank accounts with deposit and withdraw operations',
    'author': 'Rafi Saiyari',
    'depends': ['base'],
    'data': [
        'security/ir.model.access.csv',
        'data/sequence.xml',
        'views/bank_account_views.xml',
        'views/bank_transaction_views.xml',
        'views/menu.xml',
    ],
    'installable': True,
    'application': True,
    'auto_install':False,
}
