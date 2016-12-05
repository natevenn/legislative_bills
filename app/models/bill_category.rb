class BillCategory < ActiveRecord::Base
  belongs_to :bill
  belongs_to :category

  after_save :notify_users

  def notify_users
    #send action mailer bill id and category id
    UpdatedMailer.notification_email(bill_id, category_id).deliver_now
  end
end
