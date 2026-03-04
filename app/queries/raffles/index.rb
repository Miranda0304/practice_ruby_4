module Raffles
  class Index
    def initialize(scope: Raffle.all, filters: {})
      @scope = scope
      @filters = filters
    end

    def call
      @scope
      filter_by_status
      order_result
    end

    def filter_by_status
      return unless @filters[:status].present?
      @scope = @scope.where(status: @filters[:status])
    end

    def order_result
      @scope = @scope.order(id: :asc)
    end
  end
end
