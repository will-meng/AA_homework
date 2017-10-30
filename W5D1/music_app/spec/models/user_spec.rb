require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:user) { User.create(email: 'a@b.com', password: 'hunter12') }

  describe "#matching_password?" do
    it "returns true for correct password" do
      expect(user.matching_password?('hunter12')).to be true
    end

    it "returns false for incorrect password" do
      expect(user.matching_password?('hunter1')).to be false
    end
  end

  describe "#reset_session_token!" do
    it "changes the session token" do
      original_token = user.session_token
      expect(user.reset_session_token!).to_not eq(original_token)
    end

    it "returns the session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    it "returns the user with correct credentials" do
      user.valid?
      expect(User.find_by_credentials('a@b.com', 'hunter12')).to eq(user)
    end

    it "returns nil with incorrect credentials" do
      user.valid?
      expect(User.find_by_credentials('a@b.com', 'hunter1')).to be_nil
    end
  end

end
