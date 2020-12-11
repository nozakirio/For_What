class PostsController < ApplicationController
  def index
    @book = Book.find_by(isbn: params[:isbn])
    @posts = Post.where(book_id: @book.id)
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def new
    @book = Book.find(params[:book])
    @post = Post.new
  end
  
  def update
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:book_id, :reason, :star, :comment)
  end
  
end
