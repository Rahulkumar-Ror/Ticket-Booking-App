class CommentsController < ApplicationController
  def create 
    @workshop = Workshop.friendly.find(params[:workshop_id])
		@comment = @workshop.comments.create(params[:comment].permit(:name, :body))
	  redirect_to workshop_path(@workshop)
	end

	def destroy
    @workshop = Workshop.friendly.find(params[:workshop_id]) 
		@comment = @workshop.comments.find(params[:id])
		@comment.destroy
		redirect_to workshop_path(@workshop)
	end 
end
