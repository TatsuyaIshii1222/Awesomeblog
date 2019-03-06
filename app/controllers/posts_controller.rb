class PostsController < ApplicationController
    def create
        @post = current_user.posts.build(params_post)

        if @post.save
            redirect_to(root_url)
        else
            @posts = current_user.posts.paginate(page: params[:page],per_page: 5)
            render("users/home_feed")  
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to(root_url)
    end

    private 
    def params_post
        params.require(:post).permit(:content,:picture)
    end
end
