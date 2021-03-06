class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create

    post = Post.new(post_params)
    post.user_id = current_user.id

    post.save!
    tags = Vision.get_image_data(post.image)
    tags.each do |tag|
      post.tags.create(name: tag)
    end
    redirect_to posts_path,flash:{success: "投稿が完了しました。"}
  end

  def index
    @posts = Post.page(params[:page]).reverse_order.order("id DESC")
    @search_params = params
    if params[:title].present?
      @do_search = Post.where('title LIKE ?', "%#{params[:title]}%").page(params[:page]).reverse_order
    end

    @eria_scene_search = params
    eria_scene_all = params[:add]
    if eria_scene_all == "1"
       @do_search = Post.where(eria_id: params[:eria_id]).page(params[:page]).reverse_order
    end

    if eria_scene_all == "2"
       @do_search = Post.where(scene_id: params[:scene_id]).page(params[:page]).reverse_order
    end
    if eria_scene_all == "3"
       @do_search = Post.where(eria_id: params[:eria_id], scene_id: params[:scene_id]).page(params[:page]).reverse_order
    end

      @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
   end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id),flash:{notice:"投稿の編集ができました."}
  end

  def destroy
    @post = Post.find(params[:id])
    @user = @post.user_id
    @post.delete
    redirect_to user_path(@user)
  end

  def search
    @search_params = params
    if params[:title].present?
      @do_search = Post.where('title LIKE ?', "%#{params[:title]}%").page(params[:page]).reverse_order
    end
    @eria_scene_search = params
    eria_scene_all = params[:add]
    if eria_scene_all == "1"
       @do_search = Post.where(eria_id: params[:eria_id]).page(params[:page]).reverse_order
    end

    if eria_scene_all == "2"
       @do_search = Post.where(scene_id: params[:scene_id]).page(params[:page]).reverse_order
    end
    if eria_scene_all == "3"
       @do_search = Post.where(eria_id: params[:eria_id], scene_id: params[:scene_id]).page(params[:page]).reverse_order
    end
     @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  private
  def post_params
    params.require(:post).permit(:user_id,:title, :detail, :image, :eria_id, :scene_id)
  end

end
