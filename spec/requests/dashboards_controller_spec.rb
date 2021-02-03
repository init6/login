require 'rails_helper'

describe DashboardsController, type: :request do
  describe 'ダッシュボード処理' do
    context 'サインインしていないとき' do
      before do
        get dashboard_path
      end
      it { expect(response).to redirect_to(new_session_url) }
    end
    context 'サインインしているとき' do
      let(:user) { create :user }
      before do
        allow_any_instance_of(ActionDispatch::Request)
          .to receive(:session).and_return(signed_in_user: user)
        get dashboard_path
      end
      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to include(user.name) }
    end
  end
end
