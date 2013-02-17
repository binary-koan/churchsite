# Unmailer
# Deliberately blank since confirmations are done by the administrator rather
# than by email

class Churchsite::Unmailer < Devise::Mailer
  def confirmation_instructions(record, opts={})
  end
end
