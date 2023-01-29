class Contact < MailForm::Base

  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :file, attachment: true
  attribute :message
  attribute :nickname, captcha: true

  def headers
    {
    subject: "contact Form",
    to: 'farm-square@outlook.fr',
    from: %("#{name}" <#{email}>)
    }
  end

end
