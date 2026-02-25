module Posts
  class DestroyPost
    def initialize(find_post: Posts::FindPost.new, repository: Posts::PostRepository.new)
      @find_post = find_post
      @repository = repository
    end

    def call(id)
      post = @find_post.call(id)
      @repository.destroy(post)
    end
  end
end
