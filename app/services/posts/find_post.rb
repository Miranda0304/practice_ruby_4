module Posts
  class FindPost
    def initialize(repository: Posts::PostRepository.new)
      @repository = repository
    end

    def call(id)
      @repository.find(id)
    end
  end
end
