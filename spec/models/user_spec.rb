require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should be_valid }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:admin) }
  it { should respond_to(:authenticate) }

  describe "should not be admin by default" do
    it { user.admin?.should be_false }

    it "but can be admin" do
      user2 = FactoryGirl.create(:user, admin: true)
      user2.admin?.should be_true
    end
  end

  describe "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        user.should_not be_valid
      end
    end
  end

  describe "when password is not present" do
    before { user.password = user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { user.password = user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { user.save }
    let(:found_user) { User.find_by_email(user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
