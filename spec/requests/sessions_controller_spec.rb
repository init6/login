require 'rails_helper'

describe SessionsController, type: :request do
  describe 'サインイン画面' do
    before do
      get new_session_path
    end
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'サインイン処理' do
    let!(:user) { create :user }

    context 'email と password が正しい' do
      before do
        post sessions_path, params: { user: { email: user.email, password: user.password } }
      end
      it { expect(binding.pry).to ne_nil }
      it { expect(response).to redirect_to(dashboard_path)}
    end

    context 'email と password が正しくない' do
      before do
        post sessions_path, params: { user: { email: user.email, password: 'XXXXXXXX' } }
      end
      it { expect(response).to redirect_to(new_session_url)}
    end

  end
end
