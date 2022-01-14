class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :origin, presence: true
  validates_length_of :origin, maximum: 50
  validates_length_of :cost, minimum: 1
  validates_length_of :name, maximum: 50
  before_save(:titleize_product)

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("tasks_count DESC")
    .limit(1)
  )}

  scope :three_most_recent, -> { 
    order(created_at: :desc).limit(3)
  }

  # scope :made_in_usa, -> (origin_parameter) { where(origin: )}

  private
    def titleize_product
      self.name = self.name.titleize
    end
end