class TagsController < ApplicationController
    def new
        @tag = Tag.new
    end

    def create
        tag = Tag.create(tag_params)
        if tag.save
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

    def edit
        @tag = Tag.find_by_id(params[:id])
    end

    def update
        tag = Tag.update(tag_params)
        if tag
            redirect_to tag_path(tag)
        else
            redirect_to new_tag_path
        end
    end

    def destroy
        @tag = Tag.find(params[:id])
        if @tag
          @tag.destroy
          redirect_to tags_path
        else
          redirect_to tag_path(@tag)
        end
    end

    private
        
    def tag_params
        params.require(:tag).permit(:name)
    end

end
