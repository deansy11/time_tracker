class Developer < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :time_entries

  accepts_nested_attributes_for :projects, :reject_if => :all_blank

  accepts_nested_attributes_for :time_entries, :reject_if => :all_blank

  accepts_nested_attributes_for :developers_projects, :reject_if => :all_blank

  has_secure_password
  validates :email,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

private

  def downcase_email
    email.downcase if email
  end

end
