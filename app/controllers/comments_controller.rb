class CommentsController < ApplicationController
	
	def create
    @workshop = Workshop.friendly.find(params[:workshop_id])
    @comment = @workshop.comments.create(comment_params)
		@comment.view_id = current_view.id
    if @comment.save
      redirect_to @workshop
    else
      flash.now[:danger] = "error"
    end
  end
  
	def destroy
    @workshop = Workshop.friendly.find(params[:workshop_id]) 
		@comment = @workshop.comments.find(params[:id])
		@comment.destroy
		redirect_to workshop_path(@workshop)
	end 

  def edit 
    @workshop = Workshop.friendly.find(params[:workshop_id]) 
  end

  def update
    @workshop = Workshop.friendly.find(params[:workshop_id]) 
    @workshop.comments.update(comment_params)
    @comment.view_id = current_view.id
    if @comment.save
      redirect_to @workshop
    else
      flash.now[:danger] = "error"
    end
  end
  
	private 
  def comment_params
    params.require(:comment).permit(:name, :body)
  end

	
end
