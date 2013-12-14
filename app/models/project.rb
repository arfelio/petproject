class Project < ActiveRecord::Base
  attr_accessible :description, :project_type, :title, :pictures_attributes
  has_many :pictures, :as => :attachable
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :title, presence: true, length:{minimum: 5}
  validates :description, presence: true, length:{maximum: 540}
  validates :project_type, presence: true
#  validates :pictures, presence: true
end
