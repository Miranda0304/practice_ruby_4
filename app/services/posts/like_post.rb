module Posts
  class LikePost
    def initialize(query: Posts::LikePostQuery.new, repository: Posts::LikePostRepository.new)
      @query = query
      @repository = repository
    end

    def call(params)
      raise AlreadyLiked, "User already liked this post." if exist?(params)
      @repository.like(user_id: params[:user_id], post_id: params[:post_id])
    end

    def exist?(params)
      @query.exists?(user_id: params[:user_id], post_id: params[:post_id])
    end

    class AlreadyLiked < StandardError; end
  end
end
