require 'rails_helper'

describe User do
  # RSpecの動作確認用なので削除して良い
  example do
    user = create :user
    expect(user).to be_valid
  end
end