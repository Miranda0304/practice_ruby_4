module Users
  class SoftDeleteUser
    def initialize(find_user: Users::FindUser.new, repository: Users::UserRepository.new)
      @find_user = find_user
      @repository = repository
    end

    def call(id)
      ActiveRecord::Base.transaction do
        user = @find_user.call(id)
        raise AlreadyInactiveError, "User already inactive" unless user.is_active?
        @repository.soft_delete(user)
      end
    end
  end

  class AlreadyInactiveError < StandardError; end
end
