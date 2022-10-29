# coding: utf-8
require 'spec_helper'

feature 'web pages' do
  scenario "access pages" do
    visit root_path
    expect(page).to have_content "左に N 桁移動"

    within ".navbar" do
      click_link "English"
    end
    expect(page).to have_content "insert previously inserted text and stop insert"

    within ".navbar" do
      click_link "Chinese(cn)"
    end
    expect(page).to have_content "插入最近插入的文本并停止插入"

    within ".navbar" do
      click_link "Chinese(tw)"
    end
    expect(page).to have_content "插入最近插入的文字並停止插入。"

    within ".navbar" do
      click_link "Japanese"
    end
    expect(page).to have_content "左に N 桁移動"
  end
end
