# frozen_string_literal: true

# comment
require 'rails_helper'

RSpec.describe 'task_controller', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'returns render_template' do
      get '/'
      expect(response).to render_template 'input'
    end
  end
end