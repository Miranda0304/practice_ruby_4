module Comments
  class UpdateComment
    def initialize(repository: Comments::CommentsRepository.new)
      @repository = repository
    end

    def call(id, params)
      comment = @repository.find(id)
      @repository.update(comment, params)
    end
  end
end
