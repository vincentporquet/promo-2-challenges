class Post < ActiveRecord::Base
  belongs_to :user

  validates :name, :date, :source_url, :rating, :user, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { only_integer: true }

end