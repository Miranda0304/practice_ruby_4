module Posts
  class FindPost
    def initialize(scope = Post)
      @scope = scope
    end

    def call(id)
      @scope.find(id)
    end
  end
end
