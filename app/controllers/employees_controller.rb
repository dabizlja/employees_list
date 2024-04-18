# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end
end
