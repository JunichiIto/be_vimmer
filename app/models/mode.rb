class Mode < ActiveRecord::Base
  attr_accessible :label
  has_many :vim_commands
end
