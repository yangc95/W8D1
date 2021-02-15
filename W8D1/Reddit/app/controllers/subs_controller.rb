class SubsController < ApplicationController
    before_action :require_logged_in!, only: [:new, :create, :edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = ["Unable to Create Sub"]
            render :new
        end
    end

    def edit
        @sub = current_user.subs.find_by(id: params[:id])

        if @sub
            render :edit
        else
            flash[:errors] = ["You are not the moderator of this sub, buddy"]
            redirect_to subs_url
        end
    end

    def update
        @sub = current_user.subs.find_by(id: params[:id])

        if @sub && @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description, :moderator_id)
    end

end
