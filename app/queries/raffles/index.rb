module Raffles
  class Index
    def initialize(scope: Raffle.all, filters: {})
      @scope = scope
      @filters = filters
    end

    def call
      @scope
      filter_by_status
    end

    def filter_by_status
      return [] unless @filters[:status].present?
      @scope = @scope.where(status: @filters[:status])
    end
  end
end
