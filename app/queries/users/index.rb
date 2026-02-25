module Users
  class Index
    def initialize(scope: User.all, is_active: nil)
      @scope = scope
      @is_active = is_active
    end

    def call
      filter_by_active
      order_result
    end

    def order_result
      @scope = @scope.order(id: :asc)
    end

    def filter_by_active
      return if @is_active.nil?
      @scope = @scope.where(is_active: @is_active)
    end
  end
end
