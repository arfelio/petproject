class MsgNotifier < ActionMailer::Base
  default from: "from@example.com" #тут добавить от кого письмо

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.msg_notifier.received.subject
  #
  def received(contact)
    @contact = contact

    mail to: contact.email, subject: "your message delivered" #наверно нужно добавить копию админу остілать
  end
end
