class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        

        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = current_user.posts.find_by(id: params[:id])
        
        if @post
            render :edit
        else
            flash[:errors] = ["Post not found"]
            redirect_to subs_url
        end
    end
    
    def update
        @post = current_user.posts.find_by(id: params[:id])
        
        if @post && @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end
    
    def destroy
        @post = current_user.posts.find_by(id: params[:id])

        if @post && @post.destroy
            redirect_to sub_url(@post.sub)
        else
            flash[:errors] = ["Failed Deletion"]
            redirect_to sub_url(@post.sub)
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

end