class LoanAgreement < ActiveRecord::Base
  include Concerns::LoanAgreement::Relationships
  include Concerns::LoanAgreement::Validations

  after_initialize :set_default_values

  def set_default_values
    if new_record?
      self.credit_product ||= CreditProduct.last
      self.initial_loan_sum ||= sum_policy.max.to_i
      self.loan_percent ||= percent_policy.max.to_i
      self.duration ||= duration_policy.max.to_i
      self.fine_percent ||= fine_policy.max
      self.payment_method ||= payment_policy.payment_methods.first
      self.advanced_repayment_percent ||= payment_policy.max
    end
  end

  def basic_loan
    initial_loan_sum - payments.where(processed: true).pluck(&:basic_part).sum
  end

  def period_count
    initial_length / payment_period - payments.where(processed: true).count
  end

  def initial_length
    duration_policy.period_in_days * duration
  end

  def payment_period
    payment_policy.period_in_days
  end

  def percent_period
    percent_policy.period_in_days
  end

  def percent
    loan_percent / 100 / (percent_period / payment_period)
  end

  def purge_unprocessed_payments
    payments.where(processed: false).delete_all
  end

  def generate_payments_plan
    purge_unprocessed_payments
    if payment_method == :annual
      generate_annual_plan
    elsif payment_method == :differential
      generate_differential_plan
    elsif payment_method == :percents_and_single_payment
      generate_percents_and_single_payment_plan
    end
  end

  def generate_annual_plan
    coef =  (percent * ((1 + percent)**(period_count))) /
            ((1 + percent)**period_count - 1)

    payment = basic_loan * coef

    loan = basic_loan
    period_count.times do
      percent_part = loan * percent
      basic_part = payment - percent_part
      loan -= basic_part

      payments.create({
        basic_part: basic_part,
        percent_part: percent_part
      })
    end
  end

  def generate_differential_plan
    basic_part = basic_loan.to_f / period_count

    period_count.times do |i|
      payments.create({
        basic_part: basic_part,
        percent_part: (basic_loan.to_f - basic_part * i) * percent
      })
    end
  end

  def generate_percents_and_single_payment_plan
    purge_unprocessed_payments
    percent_part = basic_loan * percent

    params = []
    period_count.times do
      params << {
        basic_part: 0,
        percent_part: percent_part
      }
    end
    params.last[:basic_part] += basic_loan

    payments.create params
  end
end