module Comments
  class FindComment
    def initialize(scope = Comment)
      @scope = Comment
    end

    def call(id)
      @scope.find(id)
    end
  end
end
