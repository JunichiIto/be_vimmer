# coding: utf-8
require 'spec_helper'

feature 'web pages' do
  background do
    mode = Mode.create(label: "test")
    jp = VimCommand.new(command: ":w", description: "保存", language: "jp")
    jp.mode = mode
    jp.save!
    en = VimCommand.new(command: ":w", description: "Save", language: "en")
    en.mode = mode
    en.save!
    cn = VimCommand.new(command: ":w", description: "你好", language: "cn")
    cn.mode = mode
    cn.save!
  end
  scenario "access pages" do
    visit root_path
    expect(page).to have_content "保存"

    within ".navbar" do
      click_link "English"
    end
    expect(page).to have_content "Save"

    within ".navbar" do
      click_link "Chinese"
    end
    expect(page).to have_content "你好"

    within ".navbar" do
      click_link "Japanese"
    end
    expect(page).to have_content "保存"
  end
end