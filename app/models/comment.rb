class Comment < ApplicationRecord
    has_one :rating
    accepts_nested_attributes_for :rating

    belongs_to :user
    has_many :likes
    def like_by? user
         likes.where(comment_id: self.id, user_id: user.id).exists?
    end
end
