module Posts
  class UnlikePost
    def initialize(query: Posts::LikePostQuery.new, repository: Posts::LikePostRepository.new)
      @query = query
      @repository = repository
    end

    def call(id)
      post_liked = @query.find(id: id)
      @repository.unlike(post_liked)
    end
  end
end
