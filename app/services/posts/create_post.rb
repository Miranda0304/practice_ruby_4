module Posts
  class CreatePost
    def initialize(repository: Posts::PostRepository.new)
      @repository = repository
    end

    def call(params)
      @repository.create(params)
    end

    def validate!(params)
      raise ArgumentError, "title required." if params[:title].blank?
    end
  end
end
