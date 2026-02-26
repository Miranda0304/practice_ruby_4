module Comments
  class SoftDelete
    def initialize(find_comment: Comments::FindComment.new, repository: Comments::CommentsRepository.new)
      @find_comment = find_comment
      @repository = repository
    end

    def call(id)
      ActiveRecord::Base.transaction do
        comment = @find_comment.call(id)
        raise AlreadySoftDeletedError, "Comment already soft deleted." if comment.is_deleted?
        @repository.soft_delete(comment)
      end
    end
  end

  class AlreadySoftDeletedError < StandardError; end
end
