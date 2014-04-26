class VimCommandController < ApplicationController
  def index
    lang = params[:lang].presence || 'jp'
    @vim_commands = VimCommand.where(language: lang)
  end
end
