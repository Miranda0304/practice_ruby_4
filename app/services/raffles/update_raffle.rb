module Raffles
  class UpdateRaffle
    def initialize(repository: Raffles::RaffleRepository.new)
      @repository = repository
    end

    def call(id, params)
      raffle = @repository.find(id)
      @repository.update(raffle, params)
    end
  end
end
