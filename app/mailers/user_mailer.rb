class UserMailer < ApplicationMailer
  def major_multiple(users, title, content)
    emails = users.collect(&:email).join(',')
    @content = content

    mail(to: emails, subject: title)
  end

  def request_distinguished_section(requester, name, description, reasons)
    @requester = requester
    @name = name
    @description = description
    @reasons = reasons

    emails = User.admins.collect(&:email).join(',')
    mail(to: emails,
         subject: "#{@requester} solicitó la creación de una sección destacada")
  end
end
