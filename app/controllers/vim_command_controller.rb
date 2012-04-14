class VimCommandController < ApplicationController
  def index
    @vim_commands = VimCommand.find_all_by_language "cn"
  end
end
