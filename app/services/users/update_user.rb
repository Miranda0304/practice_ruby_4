module Users
  class UpdateUser
    def initialize(find_user: Users::FindUser.new, repository: Users::UserRepository.new)
      @find_user = find_user
      @repository = repository
    end

    def call(id, params)
      user = @find_user.call(id)
      @repository.update(user, params)
    end
  end
end
