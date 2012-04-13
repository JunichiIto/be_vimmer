class VimCommand < ActiveRecord::Base
  attr_accessible :command, :description, :mode_id
  belongs_to :mode
end
