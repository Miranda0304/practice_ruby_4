module Posts
  class LikePostRepository
    def initialize(model = PostLike)
      @model = model
    end

    def like(user_id:, post_id:)
      @model.create!(user_id: user_id, post_id: post_id)
    end

    def unlike(post_liked)
      post_liked.destroy!
    end
  end
end
