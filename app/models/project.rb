class Project < ActiveRecord::Base
  attr_accessible :description, :project_type, :title, :pictures_attributes
  has_many :pictures, :as => :attachable
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
