class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :fname, :lname, :bio, :admin, :email, :imcanvas, :imartist, :password, :password_confirmation, :remember_me

  # Validations
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :case_sensitive => false

  has_many :posts, :dependent => :destroy
  has_many :comments, :through => :posts
  
  has_many :relationships,  :foreign_key => "follower_id",
                            :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships,  :foreign_key => "followed_id",
                                    :class_name => "Relationship",
                                    :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def feed
    Post.from_users_followed_by(self)
  end

  def commenter
    Comment.commented_by(self)
  end
end
