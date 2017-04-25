module Posts
  class ByTagController < PostsController
    expose_decorated(:posts) { posts_fetcher }

    private

    def posts_fetcher
      @posts ||= Post.tagged_with(params[:id]).includes(:user, :taggings)
    end
  end
end