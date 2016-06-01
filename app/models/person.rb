class Person < ActiveRecord::Base
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :hobbies, dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.search(search)
	  if search
	  	where("gender LIKE ?" , "#{search}")
	  end
	end

end
