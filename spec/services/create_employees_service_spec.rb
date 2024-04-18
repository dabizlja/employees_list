# frozen_string_literal: true

# spec/services/create_employees_service_spec.rb

require 'rails_helper'

RSpec.describe CreateEmployeesService, type: :service do
  describe '#create!' do
    let(:service) { described_class.new }
    let(:employee_data) { { 'id' => '1', 'first_name' => 'John', 'last_name' => 'Doe' } } # Add more fields as necessary
    let(:employees) { [employee_data] }

    context 'when valid' do
      before do
        allow(service).to receive(:employees).and_return(employees)
      end

      it 'creates employees' do
        expect { service.create! }.to change { Employee.count }.by(1)
      end
    end

    context 'when invalid' do
      it 'raises an error when unauthorized to access api' do
        stub_request(:post, 'https://beta.01cxhdz3a8jnmapv.com/api/v1/assignment/token/')
          .to_return(status: 403, body: '', headers: {})

        expect { service.create! }.to raise_error(JSON::ParserError)
      end
    end
  end
end
