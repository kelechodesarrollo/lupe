class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file 	:image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "Perfil.png"
	else
  	has_attached_file 	  :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "Perfil.png",
				    		          :storage => :dropbox,
    					           	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    						          :path => ":style/:id_:filename"
  end
  	
    validates_attachment_presence :image
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates :name, :price, :description, presence: true

    belongs_to :user
    has_many   :orders
end
