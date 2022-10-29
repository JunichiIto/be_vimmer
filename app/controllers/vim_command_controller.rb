class VimCommandController < ApplicationController
  def index
    lang = params[:lang].presence || 'jp'
    @vim_commands = VimCommand.load_from_csv(lang)
  end
end
