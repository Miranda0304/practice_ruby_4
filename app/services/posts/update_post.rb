module Posts
  class UpdatePost
    def initialize(find_post: Posts::FindPost.new, repository: Posts::PostRepository.new)
      @find_post = find_post
      @repository = repository
    end

    def call(id, params)
      post = @find_post.call(id)
      @repository.update(post, params)
    end
  end
end
