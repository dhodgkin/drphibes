class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :post

  validates_presence_of :content, :length => { :maximum => 140 }
  validates_presence_of :post_id
  validates_presence_of :user_id

  default_scope :order => 'comments.created_at DESC'

  scope :users_commented_by, lambda { |user| commented_by(user) }

  private

    def self.commented_by(user)
      commenter = %(SELECT username FROM users
                        WHERE id = :user_id)
      where("user_id IN (#{commenter}) OR user_id = :user_id",
            { :user_id => user })
    end
end