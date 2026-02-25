class Users::UserRepository
  def initialize(model = User)
    @model = model
  end

  def create(attrs)
    @model.create!(attrs)
  end

  def update(user, attrs)
    user.update!(attrs)
  end

  def destroy(user)
    user.destroy!
  end

  def soft_delete(user)
    user.update!(is_active: false)
  end
end
