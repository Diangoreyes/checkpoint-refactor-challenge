class Horse < ActiveRecord::Base
  validates :name, :age, :breed, presence: true

  belongs_to :owner, class_name: "User"
end
