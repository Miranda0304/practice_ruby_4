module Comments
  class CreateComment
    def initialize(repository: Comments::CommentsRepository.new)
      @repository = repository
    end

    def call(params)
      validate!(params)
      @repository.create(params)
    end

    def validate!(params)
      raise ArgumentError, "Body is required." if params[:body].blank?
    end
  end
end
