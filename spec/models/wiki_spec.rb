require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:public1) { RandomData.random_boolean }
  let(:user) { User.create!(email: RandomData.random_email, password: RandomData.random_sentence) }
  let(:wiki) { Wiki.create!(title: title, body: body, private: public1, user: user) }

  describe "attributes" do
    it "has title, body, private, and user attributes" do
      expect(wiki).to have_attributes(title: title, body: body, private: public1, user: user)
    end
  end
end
