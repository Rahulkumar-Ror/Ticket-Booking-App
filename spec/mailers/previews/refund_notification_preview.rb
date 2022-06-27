# Preview all emails at http://localhost:3000/rails/mailers/refund_notification
class RefundNotificationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/refund_notification/customer_refund_notification
  def customer_refund_notification
    RefundNotificationMailer.customer_refund_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/refund_notification/admin_refund_notification
  def admin_refund_notification
    RefundNotificationMailer.admin_refund_notification
  end

end
