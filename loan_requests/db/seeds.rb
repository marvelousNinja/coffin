# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
LoanRequest.delete_all

request_approver = User.create! provider: :system,
  email: 'approval@bot.com',
  access_token: :none,
  uid: 1


loan_requests = LoanRequest.create! [
  {
    sum: 500501,
    interval: 'several_months',
    current_location_type: 'owning_a_flat',
    dependants_count: 0,
    average_income: 500500,
    has_a_real_estate: false,
    has_a_car: false,
    lives_by_registration_address: true,
    doesnt_have_a_job: true,
    profile: Profile.new({
      name: 'Александр',
      middle_name: 'Геннадьевич',
      surname: 'Сологуб',
      previous_surname: 'Котов',
      gender: 'male',
      birthdate: '23.12.1991',
      birthplace: 'Какой-то город',
      marital_status: 'single',
      mobile_phone: '+375299983953',
      email: 'alexsologoub@gmail.com',
      education: 'preschool',
      origin_country: 'Belarus'
    }),
    document: Document.new({
      document_type: 'passport',
      series: 'AB',
      number: '1234567',
      personal_number: '1234567A001AB1',
      issued_by: 'Какое-то ГУВД',
      issued_at: '23.12.2004',
      expires_at: '23.12.2014',
      latin_name: 'ALIAKSANDR',
      latin_surname: 'SALAHUB',
    }),
    registration_address: RegistrationAddress.new({
      country: 'Belarus',
      zip_code: '211440',
      address_line: 'Матусевича 1000',
      registered_at: '23.12.2007',
      phone: '+375299983953',
    })
  },
  {
    sum: 1000000,
      interval: 'several_years',
      current_location_type: 'owning_a_flat',
      dependants_count: 1,
      average_income: 500500,
      has_a_real_estate: true,
      has_a_car: true,
      lives_by_registration_address: true,
      doesnt_have_a_job: true,
      profile: Profile.new({
        name: 'Наталья',
        middle_name: 'Ивановна',
        surname: 'Штык',
        previous_surname: 'Тунгусова',
        gender: 'female',
        birthdate: '23.12.1991',
        birthplace: 'Какой-то город',
        marital_status: 'single',
        mobile_phone: '+375299983953',
        email: 'tungusova@gmail.com',
        education: 'preschool',
        origin_country: 'Belarus'
      }),
      document: Document.new({
        document_type: 'passport',
        series: 'AB',
        number: '2234567',
        personal_number: '2234567A001AB1',
        issued_by: 'Какое-то ГУВД',
        issued_at: '23.12.2004',
        expires_at: '23.12.2014',
        latin_name: 'NATALIA',
        latin_surname: 'SHTIK',
      }),
      registration_address: RegistrationAddress.new({
        country: 'Belarus',
        zip_code: '211440',
        address_line: 'Матусевича 1001',
        registered_at: '23.12.2007',
        phone: '+375299983953',
      })
    }
  ]

