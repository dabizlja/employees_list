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
      req.body = { grant_type: 'password', client_id: '6779ef20e75817b79605',
                   client_secret: '3e0f85f44b9ffbc87e90acf40d482602', username: 'hiring', password: 'tmtg' }.to_json
    end

    @authentication_token ||= JSON.parse(response.body)['access_token']
  end

  def conn
    @conn ||= Faraday.new(url: 'https://beta.01cxhdz3a8jnmapv.com/api/v1/')
  end
end
