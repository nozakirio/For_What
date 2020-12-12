class PostsController < ApplicationController
  def index
    @book = Book.find_by(isbn: params[:isbn])
    @posts = Post.where(book_id: @book.id)
  end

  def new
    @book = Book.find(params[:book])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    @admin_book = @post.admin_books.build(user_id: current_user.id, book_id: @post.book_id, want_read: true)
    @admin_book.save
    redirect_to post_path(@post)
  end

  def edit
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
