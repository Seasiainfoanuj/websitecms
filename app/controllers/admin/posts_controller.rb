class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: params[:per_page] || 10)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    @post.status = "draft" unless @post.status

    if params[:publish]
      @post.status = "published"
      @post.published_on = Time.zone.now
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_url, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if params[:publish]
      @post.status = "published"
      @post.published_on = Time.zone.now
    end

    params[:post][:category_ids] ||= []

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_posts_url, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  def bulk_destroy
    Post.where(:id => params[:ids]).destroy_all if params[:ids].present?
    redirect_to admin_posts_url, notice: 'Posts were successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :slug,
        :status,
        :visibility,
        :order,
        :content,
        :meta_description,
        :meta_keywords,
        :published_on,
        :author_id,
        category_ids: []
      )
    end
end
