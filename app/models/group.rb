class Group < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :created_at, :logo
	
	belongs_to :category

	has_attached_file :logo, :styles => { :thumbnail => "100x100#", :small => "150x150>", :medium => "300x300>", :large => "400x400>" },
			  :url => "/assets/groups/:id/:style/:basename.:extension",
			  :path => ":rails_root/public/assets/groups/:id/:style/:basename.:extension"

	validates_attachment_size :logo, :less_than => 5.megabytes
	validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

	validates_presence_of :name, :description, :on => :create, :message => "Cant be blank"
	validates_uniqueness_of :name

	before_validation :clean_description, if: "description.present?"

	private
	def clean_description
		self.name.strip! if self.name
		self.description.strip! if self.description
	end

end
