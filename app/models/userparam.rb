class Userparam < ApplicationRecord
	belongs_to :user
	validates :firstname, :lastname, :age, :avatar, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 18, less_than_or_equal_to: 65}
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "50x50>" }, default_url: "/assets/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
