class ContactMailer < ActionMailer::Base
  default to: 'szymon32167@o2.pl'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Contact Form Message')
  end
end