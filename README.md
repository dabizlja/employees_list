## Setup

1. Clone the repository:

```bash
git clone https://github.com/yourusername/employee-importer.git
cd employee-importer
```

2. Install the dependencies:

```bash
bundle install
```

3. Setup the daatabase:

```bash
rails db:create
rails db:migrate
```

## Importing Employees

To import employees from the external API, run the following rake task:

```bash
rake import:employees
```

This will fetch the list of employees from the API and create them in the database.

## Viewing Employees

To view the list of employees, start the Rails server:

```bash
rails server
```

Then, navigate to http://localhost:3000/employees in your web browser.

## Credentials

This application uses Rails credentials for storing sensitive information such as passwords and client secrets. If you need to edit the credentials, please contact me privately and I will provide the master.key.