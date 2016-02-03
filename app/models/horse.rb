class Horse < ActiveRecord::Base
  validates :name, :age, :breed, presence: true
  # validates :age, presence: true
  # validates :breed, presence: true

  belongs_to :owner, class_name: "User"
end
