module Posts
  class SoftDelete
    def initialize(find_post: Posts::FindPost.new, repository: Posts::PostRepository.new)
      @find_post = find_post
      @repository = repository
    end

    def call(id)
      ActiveRecord::Base.transaction do
        post = @find_post.call(id)
        raise AlreadySoftDeletedError, "Post already soft deleted." if post.is_deleted?
        @repository.soft_delete(post)
      end
    end
  end

  class AlreadySoftDeletedError < StandardError; end
end
