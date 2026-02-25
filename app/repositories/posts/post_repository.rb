class Posts::PostRepository
  def initialize(model = Post)
    @model = model
  end

  def create(attrs)
    @model.create!(attrs)
  end

  def update(post, attrs)
    post.update!(attrs)
  end

  def destroy(post)
    post.destroy!
  end

  def soft_delete(post)
    post.update!(is_deleted: true)
  end
end
