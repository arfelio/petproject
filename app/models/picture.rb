class Picture < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => {:medium => "300x300"}
  attr_accessible :asset, :asset_file_name
end
