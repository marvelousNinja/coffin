CreditProduct.delete_all
SumPolicy.delete_all
PercentPolicy.delete_all
DurationPolicy.delete_all
User.delete_all
FinePolicy.delete_all
PaymentPolicy.delete_all

sum_policies = SumPolicy.create! [
  {
    min: 500_000,
    max: 3_000_000
  }
]

percent_policies = PercentPolicy.create! [
  {
    min: 20,
    max: 25,
    fixed: false,
    period: 'year'
  }
]

duration_policies = DurationPolicy.create! [
  {
    min: 3,
    max: 12,
    period: 'month'
  }
]

fine_policies = FinePolicy.create! [
  {
    min: 1.5,
    max: 10,
    period: 'day'
  }
]

payment_policies = PaymentPolicy.create! [
  {
    allows_advanced_repayment: true,
    payment_methods: [:annual, :differential, :percents_and_single_payment],
    min: 1.5,
    max: 10,
    period: 'month'
  }
]

credit_products = CreditProduct.create! [
  {
    name: 'Легкий',
    sum_policy: SumPolicy.first,
    percent_policy: PercentPolicy.first,
    duration_policy: DurationPolicy.first,
    fine_policy: FinePolicy.first,
    payment_policy: PaymentPolicy.first
  }
]

loan_agreements = LoanAgreement.create! [
  {
    credit_product: CreditProduct.first
  }
]