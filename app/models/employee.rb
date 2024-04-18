# frozen_string_literal: true

# Employee represents an employee in the database.
class Employee < ApplicationRecord
  serialize :bio, ActiveRecord::Coders::YAMLColumn.new(Array)
end
