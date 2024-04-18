# frozen_string_literal: true

# This service is responsible for creating employees.
# It sends a POST request to the API to fetch list of employees and then creates them in database.
#
# @example
#   CreateEmployeesService.new.create!
#
class CreateEmployeesService
  def create!
    employees.each do |employee|
      Employee.create!(employee)
    end
  end

  private

  def employees
    response = conn.get('assignment/employee/list') do |req|
      req.headers['Authorization'] = "Bearer #{authentication_token}"
    end

    @employees ||= JSON.parse(response.body)
  end

  def authentication_token
    response = conn.post('assignment/token/') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { 
        grant_type: 'password', 
        client_id: Rails.application.credentials.client_id,
        client_secret: Rails.application.credentials.client_secret, 
        username: Rails.application.credentials.username, 
        password: Rails.application.credentials.password 
      }.to_json
    end
    
    @authentication_token ||= JSON.parse(response.body)['access_token']
  end

  def conn
    @conn ||= Faraday.new(url: 'https://beta.01cxhdz3a8jnmapv.com/api/v1/')
  end
end
