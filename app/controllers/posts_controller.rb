class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]


    @post.valid?
    puts @post.errors.messages
    
    if @post.valid?
      @post.save
      redirect_to @post
    else
      render "new"
    end
  end
end
