module Raffles
  class FindRaffle
    def initialize(repository: Raffles::RaffleRepository.new)
      @repository = repository
    end

    def call(id)
      @repository.find(id)
    end
  end
end
