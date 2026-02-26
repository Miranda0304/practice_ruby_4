module Comments
  class DestroyComment
    def initialize(find_comment: Comments::FindComment.new, repository: Comments::CommentsRepository.new)
      @find_comment = find_comment
      @repository = repository
    end

    def call(id)
      comment = @find_comment.call(id)
      @repository.destroy(comment)
    end
  end
end
