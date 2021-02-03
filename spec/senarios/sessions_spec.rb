require "appium_helper"
require 'rails_helper'

describe "サインイン画面" do
  before do
    @driver.get "http://localhost:3000/sessions/new"
  end
  it { expect(binding.pry).to eq true }
end
