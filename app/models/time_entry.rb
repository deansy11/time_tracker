class TimeEntry < ApplicationRecord
  belongs_to :developer

  accepts_nested_attributes_for :developer, :reject_if => :all_blank
end
