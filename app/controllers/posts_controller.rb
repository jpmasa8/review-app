class PostsController < ApplicationController
    before_action :set_target_post, only: %i[show edit update destroy]

    def index
        @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
        @posts = @posts.page(params[:page])
    end

    def new
        @post = Post.new(flash[:board])
    end

    def create
        post = Post.create(post_params)

        if post.save
            flash[:notice] = "「#{post.title}」のスレッドが投稿されました"
            redirect_to post
        else
            redirect_to new_post_path, flash: {
            post: post,
            error_messages: post.errors.full_messages
            }
        end
        
    end

    def show
   # @comment = @post.comments.new
        @comment = Comment.new(post_id: @post.id)
    end

    def edit
    end

    def update
        @post.update(post_params)
        flash[:notice] = "「#{@post.title}」のスレッドを更新しました"
        redirect_to @post
    end

    def destroy
        @post.destroy
        flash[:notice] = "「#{@post.title}」のスレッドを削除しました"
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:name, :title, :content, tag_ids: [])
    end

    def set_target_post
        @post = Post.find(params[:id])
    end
end
