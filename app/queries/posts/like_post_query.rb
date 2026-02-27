module Posts
  class LikePostQuery
    def initialize(scope = PostLike)
      @scope = scope
    end

    def find(id:)
      @scope.find(id)
    end

    def exists?(user_id:, post_id:)
      @scope.exists?(user_id: user_id, post_id: post_id)
    end
  end
end
