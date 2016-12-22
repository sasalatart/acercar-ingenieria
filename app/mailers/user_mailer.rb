class UserMailer < ActionMailer::Base
  def self.major_multiple(users, title, content)
    users.each do |recipient|
      major(recipient.email, title, content).deliver
    end
  end

  def major(user, title, content)
    @content = content
    mail(to: user, subject: title)
  end

  def request_distinguished_section(requester, name, description, reasons)
    @requester = requester
    @name = name
    @description = description
    @reasons = reasons

    emails = User.admins.collect(&:email).join(',')
    mail(to: emails, subject: "#{@requester} ha solicitado la creación de una sección destacada")
  end
end
