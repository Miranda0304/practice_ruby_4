class Raffles::RaffleRepository
  def initialize(model = Raffle)
    @model = model
  end

  def find(id)
    @model.find(id)
  end

  def create(attrs)
    @model.create!(attrs)
  end

  def update(raffle, attrs)
    raffle.update!(attrs)
  end
end
