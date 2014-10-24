class Post < ActiveRecord::Base

    belongs_to :user
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                      :storage => :s3,
                      :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

       validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    reverse_geocoded_by :latitude, :longitude do | obj, results |
        if geo = results.first
            obj.town = geo.city
            obj.country = geo.country_code
        end
    end

    after_validation :reverse_geocode

    def s3_credentials
      {:bucket => "fhellow-photos", :access_key_id => Rails.application.secrets.aws_access_key_id, :secret_access_key => Rails.application.secrets.aws_secret_access_key }
    end
end
