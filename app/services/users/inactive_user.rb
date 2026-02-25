module Users
  class InactiveUser
    def initialize(find_user: Users::FindUser.new, repository: Users::UserRepository.new)
      @find_user = find_user
      @repository = repository
    end

    def call(id)
      ActiveRecord::Base.transaction do
        user = @find_user.call(id)
        raise AlreadyInactiveError, "User already inactive." unless user.is_active?
        @repository.inactive(user)
      end
    end
  end

  class AlreadyInactiveError < StandardError; end
end
