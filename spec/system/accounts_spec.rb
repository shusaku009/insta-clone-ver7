require 'rails_helper'

RSpec.describe "Accounts", type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end
  describe 'アカウント更新' do
    it 'アカウントが更新できること' do
      find('#navbarDropdownMenuAvatar').click
      click_on 'プロフィール'
      expect(current_path).to eq '/mypage/account/edit'
      attach_file 'user[avatar]', "#{Rails.root}/spec/fixtures/dummy.jpg"
      fill_in 'メールアドレス', with: 'dhh@example.com'
      fill_in 'ユーザー名', with: 'dhh'
      click_on '更新する'
      sleep 1
      user.reload
      expect(user.email).to eq 'dhh@example.com'
      expect(user.username).to eq 'dhh'
      expect(user.avatar.attached?).to eq true
    end
  end
end
