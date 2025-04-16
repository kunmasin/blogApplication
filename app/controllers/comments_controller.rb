class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end


  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.expect(comment: [:name, :email, :body])  
    end
end
