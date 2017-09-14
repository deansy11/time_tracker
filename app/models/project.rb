class Project < ApplicationRecord
  has_many :developers

  accepts_nested_attributes_for :developers, :reject_if => :all_blank
end
