class Developer < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :time_entries

  accepts_nested_attributes_for :project, :reject_if => :all_blank

  validates :email,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

private

  def downcase_email
    email.downcase if email
  end

end
