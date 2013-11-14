class Team < ActiveRecord::Base
  attr_accessible :description, :name, :photo
  has_attached_file :photo, :styles => {:medium => "300x300"},
  :url => "/assets/products/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  validates_attachment :photo, presence: true,
  content_type:{content_type: /^image\/(png|gif|jpeg)/ }
  validates :name, presence: true, length:{minimum: 5}
  validates :description, presence: true, length:{maximum: 540}
end
