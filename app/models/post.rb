class Post < ActiveRecord::Base
	 has_attached_file :picture, syles: { medium: "300x300>" },
	  :storage => :s3,
  	:s3_credentials => {
    :bucket => 'hipstergram_makers',
    :access_key_id => Rails.application.secrets.s3_access_key_id,
    :secret_access_key => Rails.application.secrets.s3_secret_access_key
  }

  validates :user_id, presence: { message: 'You must be signed in to post' }
  validates :title, presence: { message: 'Your post must have a title' }
  validates :picture, attachment_presence: { message: 'You must attach a photo' }
  
  belongs_to :user
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  has_many :votes
  has_and_belongs_to_many :tags
  def tag_list
  end
  
  def tag_list=(some_tags)
  	return if some_tags.empty?

  	some_tags.split(', ').uniq.each do |tag|
  	self.tags << Tag.find_or_create_by(text: tag )
 	end 
  end	
end
