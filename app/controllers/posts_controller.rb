class PostsController < ApplicationController
  respond_to :html, :json
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.available

    respond_with @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = get_register(params[:id])

    respond_with @post
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_with @post
  end

  # GET /posts/1/edit
  def edit
    @post = get_register(params[:id])
   end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    flash[:notice] = 'Post was successfully created.' if @post.save
    respond_with @post
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = get_register(params[:id])
    flash[:notice] = 'Post was successfully updated.' if @post.update_attributes(params[:post])
    respond_with @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = get_register(params[:id])
    @post.destroy
	respond_with @post
  end

  private
  def get_register(id)
    Post.find(id)
  end
end
