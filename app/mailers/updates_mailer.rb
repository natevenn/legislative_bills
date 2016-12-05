class UpdatesMailer < ApplicationMailer
  def notification_email(bill_id, type_id)
    find bill
    find type of change
    mail(to: 'dev@aee.net', subject: 'some subject')
  end
end
