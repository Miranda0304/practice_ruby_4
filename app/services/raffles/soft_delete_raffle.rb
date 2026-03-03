module Raffles
  class SoftDeleteRaffle
    def initialize(repository: Raffles::RaffleRepository.new)
      @repository = repository
    end

    def call(id)
      raffle = @repository.find(id)
      raffle.soft_delete!
    end
  end
end
