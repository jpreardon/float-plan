User.create!( first_name:             'Pat',
              last_name:              'Sailor',
              email:                  'pat@example.com',
              mobile:                 '2128675309',
              skipper:                'true',
              admin:                  'true',
              password:               'password',
              password_confirmation:  'password')
              
99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.safe_email("#{first_name}.#{last_name}")
  mobile = Faker::Number.number(10)
  password = 'password'
  password = 'password'
  User.create!( first_name:             first_name,
                last_name:              last_name,
                email:                  email,
                mobile:                 mobile,
                password:               'password',
                password_confirmation:  'password')
end
