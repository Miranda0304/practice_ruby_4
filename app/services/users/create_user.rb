module Users
  class CreateUser
    def initialize(repository: Users::UserRepository.new)
      @repository = repository
    end

    def call(params)
      validate!(params)
      @repository.create(params)
    end

    def validate!(params)
      raise ArgumentError, "email required" if params[:email].blank?
    end
  end
end
