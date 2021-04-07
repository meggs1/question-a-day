class TagsController < ApplicationController

    def new
        @tag = Tag.new
    end

    def create
        tag = Tag.create(tag_params)
        if tag.save
            session[:tag_id] = tag.id
            redirect_to tag_path(tag)
        else
            redirect_to new_tag_path
        end
    end

    def index
        @tags = Tag.all
    end
    
    def show
        @tag = Tag.find_by_id(params[:id])
        @questions = @tag.questions
    end

    private
        
    def tag_params
        params.require(:tag).permit(:name)
    end

end
