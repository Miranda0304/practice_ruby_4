module Posts
  class Index
    def initialize(scope: Post.all, filters: {})
      @scope = scope
      @filters = filters
    end

    def call
      @scope = @scope.no_deleted
      filter_by_active
      order_result
    end

    def order_result
      @scope = @scope.order(id: :asc)
    end

    def filter_by_active
      return unless @filters.key?(:is_active)
      @scope = @scope.where(is_active: @filters[:is_active])
    end

    def filter_by_user
      return unless @filters.key?(:user_id)
      @scope = @scope.active
    end
  end
end
