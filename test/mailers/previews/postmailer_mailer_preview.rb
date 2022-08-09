# Preview all emails at http://localhost:3000/rails/mailers/postmailer_mailer
class PostmailerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/postmailer_mailer/post_created
  def post_created
    PostmailerMailer.post_created
  end

end
