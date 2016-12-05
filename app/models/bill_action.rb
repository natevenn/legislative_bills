class BillAction < ActiveRecord::Base
  belongs_to :bill
  belongs_to :action

  after_save :notify_users

  def notify_users
    #send action mailer bill id and action id
    UpdatedMailer.notification_email(bill_id, action_id).deliver_now
  end
end
