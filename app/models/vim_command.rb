class VimCommand < ActiveRecord::Base
  attr_accessible :command, :description, :mode_id, :language
  belongs_to :mode
  default_scope order: 'vim_commands.id'
end
