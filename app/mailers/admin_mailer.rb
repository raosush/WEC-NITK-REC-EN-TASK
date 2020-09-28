class AdminMailer < ApplicationMailer
  def send_mail_to_users(user_ids, subject, title, body)
    emails = User.where(id: user_ids).pluck(:email)
    @mail_hash = {
      title: title,
      body: body
    }
    mail(bcc: emails, subject: subject) do |format|
      format.html { render 'layouts/mailer/mail_user' }
    end
  end
end
