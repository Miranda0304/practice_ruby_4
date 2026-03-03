module Raffles
  class FinishRaffle
    def initialize(repository: Raffles::RaffleRepository.new)
      @repository = repository
    end

    def call(id)
      raffle = @repository.find(id)
      raffle = raffle.finish!
    end
  end
end
