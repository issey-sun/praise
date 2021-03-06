require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "内容に問題ない場合" do
        expect(@user).to be_valid
      end
      it 'emailが255文字以下のユーザーが作成可能' do
        @user.email = 'a' * 245 + '@sample.jp'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailが256文字以上のユーザーを許可しない' do
        @user.email = 'a' * 246 + '@sample.jp'
        @user.valid?
        expect(@user.errors).to be_added(:email, :too_long, count: 255)
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "passwordが全角であれば登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it "所属が空であれば登録できない" do
        @user.occupation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Occupationを入力してください")
      end
      it "役職が空であれば登録できない" do
        @user.position = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Positionを入力してください")
      end
      it "画像が空だと登録できない" do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Imageを入力してください")
      end
      it "生年月日が空だと登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth dayを入力してください")
      end
      it "性別が入力されていないとき" do
        @user.sex_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Sexを入力してください", "Sexは数値で入力してください")
      end
      it "性別が1を選択されているとき" do
        @user.sex_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Sexは1以外の値にしてください")
      end
     end
   end

  describe 'パスワードの検証' do
    it 'パスワードと確認用パスワードが間違っている場合、無効であること' do
      @user.password = 'password'
      @user.password_confirmation = 'pass'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it 'パスワードが暗号化されていること' do
      expect(@user.encrypted_password).to_not eq 'password'
    end
  end
  describe 'フォーマットの検証' do
    it 'メールアドレスが正常なフォーマットの場合、有効であること' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  describe 'フォローの検証' do
  it'ユーザーが他のユーザーをフォロー、フォロー解除可能である' do
    tester1   = FactoryBot.create(:user)
    tester2   = FactoryBot.create(:user)
    tester1.follow(tester2.id)
    expect(tester1.following?(tester2)).to eq true
    tester1.unfollow(tester2.id)
    expect(tester1.following?(tester2)).to eq false
  end
  
  it 'フォロー中のユーザーが削除されると、フォローが解消される' do
    tester1   = FactoryBot.create(:user)
    tester2   = FactoryBot.create(:user)
    tester1.follow(tester2.id)
    expect(tester1.following?(tester2)).to eq true
    tester1.destroy
    expect(tester1.following?(tester2)).to eq false
  end
end

    describe 'adminのバリデーション' do
        context 'adminが登録される' do
          it "adminの値が空欄の場合" do
            @user.admin = nil
            expect(@user).to be_valid
          end
          it "adminの値がfalseの場合" do
            @user.admin = false
            expect(@user).to be_valid
          end
        end
        context 'adminの登録がうまくいかないとき' do
          it "adminの値がtrueの場合" do
            @user.admin = true
            @user.valid?
            expect(@user.errors.full_messages).to include("Adminシステムエラー：不正な値が入力されました")
          end
        end
    end
end
