class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end
  def edit
    @post = current_user.posts.find(params[:id])
  end
  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_param)
    redirect_to account_posts_path, notice: "Update Success"
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to account_posts_path, alert: "delete Success"
  end
  private
  def post_param
    params.require(:post).permit(:content)
  end
end
