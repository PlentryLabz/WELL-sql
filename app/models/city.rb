class City < ActiveRecord::Base
  has_many :users

  validates :name_ru, presence: true
end
