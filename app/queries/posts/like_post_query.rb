module Posts
  class LikePostQuery
    def initialize(scope = PostLike.all)
      @scope = scope
    end

    def find(id:)
      @scope.find(id)
    end

    def exists?(user_id:, post_id:)
      @scope.exists?(user_id: user_id, post_id: post_id)
    end

    def by_user(user_id)
      return self unless user_id.present?
      self.class.new(@scope.where(user_id: user_id))
    end

    def by_post(post_id)
      return self unless post_id.present?
      self.class.new(@scope.where(post_id: post_id))
    end

    def recent
      self.class.new(@scope.order(created_at: :desc))
    end

    def call
      @scope
    end
  end
end
