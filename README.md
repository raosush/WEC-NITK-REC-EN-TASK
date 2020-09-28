## Introduction

* The web application has been built with Rails. This web application completes the following [task](https://github.com/WebClub-NITK/DSC-NITK-Recruitments-2020/blob/master/RECRUITMENT_TASKS_2020.md#task-id-email_notification).

## Tech stack

* [Devise](https://github.com/heartcombo/devise)
* [Active Admin](https://github.com/activeadmin/activeadmin)
* [Delayed Job](https://github.com/collectiveidea/delayed_job)

The above open source gems(library equivalent of Ruby) have been used to complete the task.

* Active Admin - Active admin has been used to build admin's interface.
* Delayed Job - Delayed Job is being used as the persistent backend for running queued jobs.
* Devise - Devise provides authentication solution in Rails.
* Kindly follow the [installation guide](INSTALLATION.md) provided in the repository to set up the web application.

## Configure mailer

* Change the `user_name` and `password` in the environment file that you are using. For ex, if you are running in development mode, navigate to `config/environments/development.rb`, an`d change the password in:
```
config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: '<Change email here>',
    password: '<Change passowrd here>',
    authentication: 'plain',
    enable_starttls_auto: true
  }
```
* Change the  `from` option to the email to be used in `app/mailers/application_mailer.rb`.
```
default from: <email>
```

## Run the enqueued jobs

* Open a new terminal and navigate to project directory.
* Run the following command:
```
rake jobs:work
```
* The above command will run all the enqueued jobs.

## Testing

* Navigate to "BASE_URL/admin/users".
* Select the users to whom the email is to be sent.
* Click on `Batch Actions`, and select `Email Selected Users` option from the dropdown.
* On clicking `Email Selected Users`, an alert dialog appears which accepts `subject` of the email, `title` of the email and `body` of the email.
* After entering the values, click on `Ok` and the emails will be sent to all the selected users.

## References

* [Mailing in Rails](https://dev.to/morinoko/sending-emails-in-rails-with-action-mailer-and-gmail-35g4)
* [Mailing in Rails](https://guides.rubyonrails.org/action_mailer_basics.html)
* [Mailing in Rails](https://stackoverflow.com/questions/11997192/how-to-set-up-mailer-in-rails-app-for-production-environment-on-heroku)
* [Error Handling](https://stackoverflow.com/questions/18124878/netsmtpauthenticationerror-when-sending-email-from-rails-app-on-staging-envir)