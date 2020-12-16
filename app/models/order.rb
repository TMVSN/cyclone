class Order < ApplicationRecord
  belongs_to :manager, class_name: 'User', optional: true
  belongs_to :fixer, class_name: 'User', optional: true
  belongs_to :customer, class_name: 'User'

  validates :address, presence: true
  validates :date, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
