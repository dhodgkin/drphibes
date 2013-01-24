class Post < ActiveRecord::Base
  attr_accessible :post_content

  belongs_to :user

  validates_presence_of :post_content, :length => { :maximum => 140 }
  validates_presence_of :user_id

  default_scope :order => 'posts.created_at DESC'

  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  has_many :comments, :dependent => :destroy

  private

    def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            { :user_id => user })
    end
end