class Job < ApplicationRecord
	belongs_to :user
	belongs_to :category
   
	
	
  has_attached_file :image, styles: {  medium: "800x800>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # validates_attachment_presence :image
  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 15}
  validates :description,length: {minimum: 10, maximum: 400}
  # validates_attachment_presence :image "Image cann't be blank
   validates :jobclosedate,presence: true
  
  # private
  # def future_date
  # errors.add(:jobclosedate, "can't be in the past") if jobclosedate < Date.today
  # end

  
  # validates :price, numericality: {greater_than: 20}
  # validates :intro, length: {in: 50..200}
  # validates :terms_of_service, acceptance: {on: :create} # only validates if new_record?
  # validates :sku, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  
end
