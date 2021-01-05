class PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

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
    @post.reason = params[:reason]
    @post.user_id = current_user.id
    # 投稿時、admin_bookも同時に生成
    if @post.save
      admin_book = @post.admin_books.build(
        user_id: current_user.id, book_id: @post.book_id, want_read: true
      )
      admin_book.save
      redirect_to post_path(@post)
    else
      @book = @post.book
      @post = Post.new
      flash.now[:alert] = '入力は必須です'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @book = @post.book
  end

  # 読みたい本→読んだ本にadmin_bookを変更
  def update
    @post = Post.find(params[:id])
    @post.score = Language.get_data(post_params[:comment])
    if @post.update(post_params)
      @post.admin_books.update(have_read: true)
      redirect_to post_path(@post)
    else
      @book = @post.book
      flash.now[:alert] = '評価とコメントを入力してください'
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def favorite
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    # 投稿削除時、userのadmin_bookも同時に削除
    if post.destroy
      post.admin_books.destroy_all
      redirect_to user_path(current_user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:book_id, :reason, :star, :comment)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to user_path(current_user)
    end
  end
end
