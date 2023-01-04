# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CostsController do
  let!(:user) { create(:user) }
  let(:category) { create(:category) }
  let!(:cost) { create(:cost, user:, category:) }

  before do
    sign_in user
  end

  describe 'GET /costs' do
    before do
      get :index
    end

    it 'returns 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /costs/new' do
    before do
      get :new
    end

    it 'returns 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /costs/:id/edit' do
    before do
      get :edit, params: { id: cost }
    end

    it 'returns 200 status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /costs' do
    let(:cost_params) { { cost: { description: 'test', amount: 1, user_id: user.id, category_id: category.id } } }

    context 'when user signed in and valid params' do
      before do
        post :create, params: cost_params
      end

      it 'redirect to correct path' do
        expect(response).to redirect_to(costs_path)
      end

      it 'return correct cost description' do
        expect(Cost.last.description).to eq(cost_params[:cost][:description])
      end
    end

    context 'when user signed in and invalid params' do
      let(:invalid_cost_params) { { cost: { description: 'test', user_id: user.id, category_id: category.id } } }

      before do
        post :create, params: invalid_cost_params
      end

      it 'redirect to correct path' do
        expect(response).to redirect_to(new_cost_path)
      end
    end

    context 'when user not signed in' do
      before do
        sign_out user
        post :create, params: cost_params
      end

      it 'redirect to correct path' do
        expect(described_class.new).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT /costs/:id' do
    let(:new_cost_params) { { description: 'test2' } }

    context 'when user signed in and valid params' do
      before do
        patch :update, params: { id: cost, cost: new_cost_params }
      end

      it 'redirect to correct path' do
        expect(response).to redirect_to(cost_path(cost))
      end

      it 'return correct cost description' do
        expect(Cost.last.description).to eq(new_cost_params[:description])
      end
    end

    context 'when user signed in and invalid params' do
      let(:new_invalid_cost_params) { { amount: nil } }
      let(:old_cost_params_description) { { description: 'test' } }

      before do
        patch :update, params: { id: cost, cost: new_invalid_cost_params }
      end

      it 'redirect to correct path' do
        expect(response).to redirect_to(edit_cost_path(cost))
      end

      it 'return correct cost description' do
        expect(Cost.last.description).to eq(old_cost_params_description[:description])
      end
    end

    context 'when user not signed in' do
      before do
        sign_out user
        patch :update, params: { id: cost, cost: new_cost_params }
      end

      it 'redirect to correct path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE /costs/:id' do
    before do
      delete :destroy, params: { id: cost }
    end

    it 'redirect to correct path' do
      expect(response).to redirect_to(costs_path)
    end

    it 'return correct cost count' do
      expect(Cost.count).to eq(0)
    end
  end
end
