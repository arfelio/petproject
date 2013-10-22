class Team < ActiveRecord::Base
  attr_accessible :description, :name, :photo
  has_attached_file :photo, :styles => {:medium => "300x300"}
  validates :name, presence: true, length:{minimum: 5}
  validates :description, presence: true, length:{maximum: 540}
end
