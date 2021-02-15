class CommentsController < ApplicationController
    before_action :require_logged_in!

    def new
        @comment = Comment.new(post_id: params[:post_id])
        render :new
    end

    def create
        @comment = current_user.comments.new(comment_params)

        if @comment.save
            redirect_to post_url(params[:post_id])
        else
            flash[:errors] = @comment.errors.full_messages
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
