require 'rails_helper'

RSpec.describe 'ログイン', type: :system do
  describe 'ログイン機能' do
    let(:user) { create(:user) }
    context '入力情報に誤りがある場合' do
      it 'エラーメッセージが画面上に表示されること' do
        visit '/login'
        fill_in 'メールアドレス', with: 'wrong@example.com'
        fill_in 'パスワード', with: '12345678'
        click_on 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
      end
    end

    context '入力情報が正しい場合' do
      it 'ログインができること' do
        visit '/login'
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: '12345678'
        click_on 'ログイン'
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end