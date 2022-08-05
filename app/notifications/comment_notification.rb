
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  # param :post
  # Define helper methods to make rendering easier.
  #
  def message
    @workshop = Workshop.find(params[:comment][:workshop_id])
    @comment = Comment.find(params[:comment][:id])
    @view = View.find(@comment.view_id)
    return "#{@view.full_name}   commented on #{@workshop.name.truncate_words(10)}"
  end
   
  def url
    workshop_path(Workshop.find(params[:comment][:workshop_id]))
  end
end
