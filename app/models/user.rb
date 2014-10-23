class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    has_many :posts
    has_many :statuses
    acts_as_followable
    acts_as_follower

    def self.from_omniauth(auth)
      puts auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name_first = auth.info.first_name
        user.name_last = auth.info.last_name
        user.password = Devise.friendly_token[0,20]
        # user.name = auth.info.name   # assuming the user model has a name
        end
    end

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.avatar = data["image"] if user.avatar.blank?
        user.name_first = data["first_name"] if user.name_first.blank?
        user.name_last = data["last_name"] if user.name_last.blank?
        end
      end
    end

    def follow_status(other_user)
      if self.follows?(other_user)
        return "Following"
      else
        return "Follow"
      end
    end

end
