# Populate the database for testing.
# run rake db:seed to populate the database.
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
(1..200).each do |x|
  User.create!(
    email: "#{x}_demo@mail.com",
    name: "#{x}_demo_user",
    username: "#{x}_demo_user_name",
    mobile: '1234567890',
    admin: false,
    location: "#{x}_Location_#{x * 10}",
    password: "#{x}_demo_mailer",
    password_confirmation: "#{x}_demo_mailer"
  )
end
User.create!(email: 'rao.sush003@gmail.com', name: 'Sushanth', username: 'username',
             mobile: '1234567890', admin: false, location: 'locations',
             password: 'demomailer', password_confirmation: 'demomailer')
User.create!(email: 'rao.sush007@gmail.com', name: 'Sushanth', username: 'usernam',
             mobile: '1234567890', admin: false, location: 'locations',
             password: 'demomailer', password_confirmation: 'demomailer')