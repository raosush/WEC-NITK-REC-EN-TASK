ActiveAdmin.register User do
  permit_params :email, :username, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :name, :location, :mobile, :age, :admin
  index do
    selectable_column
    id_column
    column :username
    column :name
    column :email
    column :location
    column :mobile
    column :age
    column :admin
    column :current_sign_in_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :username
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :age
  filter :admin

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :name
      f.input :username
      f.input :location
      f.input :mobile
      f.input :age
      f.input :admin
    end
    f.actions
  end
  batch_action :email, form: {
    subject: :text,
    title: :text,
    body: :textarea
  } do |user_ids, inputs|
    # Accept user_ids of users to whom the email needs to be sent,
    # and also accept subject, title and body of email.
    if inputs[:subject] && inputs[:title] && inputs[:body]
      # Split the user_ids to 100 per batch and enqueue each batch into
      # delayed_job for asynchronous processing.
      user_ids.each_slice(100) do |uids|
        AdminMailer.delay.send_mail_to_users(uids, inputs[:subject], inputs[:title], inputs[:body])
      end
      redirect_to collection_path, notice: 'Emails have been sent to selected users'
    else
      redirect_to collection_path, alert: 'Please fill in all the fields'
    end
  end
end
