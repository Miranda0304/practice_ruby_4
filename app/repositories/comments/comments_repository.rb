class Comments::CommentsRepository
  def initialize(model = Comment)
    @model = model
  end

  def create(attrs)
    @model.create!(attrs)
  end

  def update(comment, attrs)
    comment.update!(attrs)
  end

  def destroy(comment)
    comment.destroy!
  end

  def soft_delete(comment)
    comment.update(is_deleted: true)
  end
end
