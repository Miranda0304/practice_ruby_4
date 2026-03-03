module Comments
  class DestroyComment
    def initialize(repository: Comments::CommentsRepository.new)
      @repository = repository
    end

    def call(id)
      comment = @repository.find(id)
      @repository.destroy(comment)
    end
  end
end
