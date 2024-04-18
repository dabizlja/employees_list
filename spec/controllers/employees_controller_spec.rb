# spec/controllers/employees_controller_spec.rb

require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  describe 'GET #index' do
    let!(:employees) { create_list(:employee, 3) }

    before do
      get :index
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'assigns @employees' do
      expect(assigns(:employees)).to match_array(employees)
    end
  end
end