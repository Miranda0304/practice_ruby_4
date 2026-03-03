module Raffles
  class CreateRaffle
    def initialize(repository: Raffles::RaffleRepository.new)
      @repository = repository
    end

    def call(params)
      validate_params!(params)
      @repository.create(params)
    end

    def validate_params!(params)
      required = %i[title price]
      missing = required.select { |key| params[key].blank? }
      return if missing.empty?

      raise InvalidParamsError, "Missing required params: #{missing.join(", ")}"
    end
  end

  class InvalidParamsError < StandardError; end
end
