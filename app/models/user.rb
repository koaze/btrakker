class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    mount_uploader :avatar, AvatarUploader
    mount_uploader :cover, CoverUploader
    
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    
        has_many :posts, dependent: :destroy # remove a user's posts if his account is deleted.
        has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
        has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
        
        has_many :following, through: :active_relationships, source: :followed
        has_many :followers, through: :passive_relationships, source: :follower
        
        
        # helper methods
        
        # follow another user
        def follow(other)
            active_relationships.create(followed_id: other.id)
        end
        
        # unfollow a user
        def unfollow(other)
            active_relationships.find_by(followed_id: other.id).destroy
        end
        
        # is following a user?
        def following?(other)
            following.include?(other)
        end
    
    # Setup accessible (or protected) attributes for your model
    #attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar
    
    #validates_presence_of   :avatar, :cover
    #validates_integrity_of  :avatar, :cover
    #validates_processing_of :avatar, :cover
    
end
