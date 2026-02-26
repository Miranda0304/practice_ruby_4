module Comments
  class UpdateComment
    def initialize(find_comment: Comments::FindComment.new, repository: Comments::CommentsRepository.new)
      @find_comment = find_comment
      @repository = repository
    end

    def call(id, params)
      comment = @find_comment.call(id)
      @repository.update(comment, params)
    end
  end
end
