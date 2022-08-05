class Comment < ApplicationRecord
  belongs_to :view
  belongs_to :workshop
  # has_rich_text :body
  after_create_commit :notify_recipent
  before_destroy :cleanup_notifications 
  has_noticed_notifications model_name: 'Notification'

  private
  
  def notify_recipent
    CommentNotification.with(comment: self, workshop: workshop).deliver_later(workshop.view)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
