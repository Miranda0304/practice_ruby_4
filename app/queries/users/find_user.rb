module Users
  class FindUser
    def initialize(scope = User)
      @scope = scope
    end

    def call(id)
      @scope.find(id)
    end
  end
end
