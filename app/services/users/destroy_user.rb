module Users
  class DestroyUser
    def initialize(find_user: Users::FindUser.new, repository: Users::UserRepository.new)
      @find_user = find_user
      @repository = repository
    end

    def call(id)
      user = @find_user.call(id)
      @repository.destroy(user)
    end
  end
end
