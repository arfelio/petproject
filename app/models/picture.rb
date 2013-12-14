class Picture < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => {:medium => "300x300"}
  attr_accessible :asset, :asset_file_name
  validates_attachment :asset, presence: true,
  content_type:{content_type: /^image\/(png|gif|jpeg)/ }
end
