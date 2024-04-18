# lib/tasks/import_employees.rake

namespace :import do
  desc 'Import employees'
  task employees: :environment do
    CreateEmployeesService.new.create!
  end
end