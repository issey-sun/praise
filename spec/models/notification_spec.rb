require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "#create" do
    context "通知" do
      before do
        @answer = FactoryBot.build(:answer)
        @definition = FactoryBot.build(:definition)
      end

      it "回答が行われた場合に保存できる" do
        notification = FactoryBot.build(:notification, answer_id: @answer.id, answer_id: @answer.id, action: "answer")
        expect(notification).to be_valid
      end

      it "投稿が行われた場合に保存できる" do
        notification = FactoryBot.build(:notification, definition_id: @definition.id, definition_id: @definition.id, action: "definition")
        expect(notification).to be_valid
      end

      it "回答にいいねが行われた場合に保存できる" do
        notification = FactoryBot.build(:notification, answer_id: @answer.id, action: "like")
        expect(notification).to be_valid
      end

      it "投稿にレビューが行われた場合に保存できる" do
        notification = FactoryBot.build(:notification, definition_id: @definition.id, action: "review")
        expect(notification).to be_valid
      end
    end


    context "フォロー関連の通知" do
      it "フォローが行われた場合に保存できる" do
        user1 = FactoryBot.build(:user)
        user2 = FactoryBot.build(:user)
        notification = FactoryBot.build(:notification, visitor_id: user1.id, visited_id: user2.id, action: "follow")
        expect(notification).to be_valid
      end
    end

  end

  describe "アソシエーションのテスト" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Definitionモデルとのアソシエーション" do
      let(:target) { :definition }

      it "Definitionとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "Answerモデルとのアソシエーション" do
      let(:target) { :answer }

      it "Answerとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "visitorとのアソシエーション" do
      let(:target) { :visitor }

      it "Visitorとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context "visitedとのアソシエーション" do
      let(:target) { :visited }

      it "Visitedとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
     end
    end
end


describe "#create" do
  context "通知2" do
    before do
    @p_answer = FactoryBot.build(:p_answer)
    @p_definition = FactoryBot.build(:p_definition)
  end

  it "回答が行われた場合に保存できる" do
    notification = FactoryBot.build(:notification, p_answer_id: @p_answer.id, p_answer_id: @p_answer.id, action: "p_answer")
    expect(notification).to be_valid
  end

  it "投稿が行われた場合に保存できる" do
    notification = FactoryBot.build(:notification, p_definition_id: @p_definition.id, p_definition_id: @p_definition.id, action: "p_definition")
    expect(notification).to be_valid
  end

  it "回答にいいねが行われた場合に保存できる" do
    notification = FactoryBot.build(:notification, p_answer_id: @p_answer.id, action: "p_like")
    expect(notification).to be_valid
  end

  it "投稿にレビューが行われた場合に保存できる" do
    notification = FactoryBot.build(:notification, p_definition_id: @p_definition.id, action: "p_review")
    expect(notification).to be_valid
  end
 end
end
