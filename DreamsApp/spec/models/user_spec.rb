require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { User.create(username: "brandon", password: "password") }
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#ensure_session_token" do
    it "automatically sets the session token" do
      expect(subject.session_token).not_to be_nil
    end
  end

  describe "password encryption" do
    it "encrypts password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("password")
      User.new(username: "some person", password: "password")
    end
  end

  describe "User::find_by_credentials" do
    it "finds user given username and password" do
      # expect(User.find_by_credentials("brandon", "password")).to eq(User.find_by(username: "brandon"))
      expect(User.find_by_credentials("brandon", "uglypassword")).to eq(User.find_by(username: "brandon"))
    end
  end
end
