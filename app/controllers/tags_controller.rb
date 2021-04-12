class TagsController < ApplicationController
    before_action :find_tag, only: [:show, :edit, :destroy]

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.create(tag_params)
        if @tag.save
            redirect_to tag_path(@tag)
        else
            render :new
        end
    end

    def index
        @tags = Tag.all
    end
    
    def show
        @questions = @tag.questions
    end

    def edit
    end

    def update
        @tag = Tag.update(tag_params)
        if @tag
            redirect_to tag_path(@tag)
        else
            render :edit
        end
    end

    def destroy
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

    def find_tag
        @tag = Tag.find(params[:id])
    end
end
