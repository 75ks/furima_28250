require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context '投稿がうまくいくとき' do
      it 'commentが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context '投稿がうまくいかないとき' do
      it 'commentが空では登録できない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("コメントを入力してください")
      end
    end
  end
end
