class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @search_params = post_search_params
    @eria_scene_params= eria_scene_params
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @search_params = post_search_params
    @eria_scene_params= eria_scene_params

    @eria_scene_all = params[:option]
    if @eria_scene_all == 1
       @search_eria = Post.search(params[:eria_id], @eria_scene_all)

    # else @eria_scene_all == "2"
    #       @search_scene = Post.search(params[:scene_id], @eria_scene_all)
    # # else
    #   @search_all = Post.search(params[:eria_id][:scene_id], @eria_scene_all)
     end

    @posts = Post.all
    @do_search = Post.search(params[:title])
  end

  private
  def post_params
    params.require(:post).permit(:user_id,:title, :detail, :image, :eria_id, :scene_id)
  end

  def post_search_params
    params.fetch(:search, {}).permit(:title)
  end

  def eria_scene_params
    params.fetch(:search, {}).permit(:eria_id, :scene_id)
  end
end
