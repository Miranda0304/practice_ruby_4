module Comments
  class Index
    def initialize(scope: Comment.all, filters: {})
      @scope = scope
      @filters = filters
    end

    def call
      no_deleted_comments
      filter_by_post
      filter_by_user
      order_comments
    end

    def no_deleted_comments
      @scope = @scope.no_deleted
    end

    def filter_by_post
      return unless @filters.key?(:post_id)
      @scope = @scope.where(post_id: @filters[:post_id])
    end

    def filter_by_user
      return unless @filters.key?(:user_id)
      @scope = @scope.where(user_id: @filters[:user_id])
    end

    def order_comments
      @scope = @scope.order(id: :asc)
    end
  end
end
