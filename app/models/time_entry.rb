class TimeEntry < ApplicationRecord
  belongs_to :developer
  belongs_to :project

end
