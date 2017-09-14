class Project < ApplicationRecord
  has_many :developers

  accepts_nested_attributes_for :developers, :reject_if => :all_blank, allow_destroy: true

  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
end
