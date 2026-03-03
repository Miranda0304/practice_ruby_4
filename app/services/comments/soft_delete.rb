module Comments
  class SoftDelete
    def initialize(repository: Comments::CommentsRepository.new)
      @repository = repository
    end

    def call(id)
      ActiveRecord::Base.transaction do
        comment = @repository.find(id)
        raise AlreadySoftDeletedError, "Comment already soft deleted." if comment.is_deleted?
        @repository.soft_delete(comment)
      end
    end
  end

  class AlreadySoftDeletedError < StandardError; end
end
