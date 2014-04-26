# coding: utf-8
require 'spec_helper'

feature 'web pages' do
  scenario "access pages" do
    visit root_path
    expect(page).to have_content "Be Vimmer"
  end
end