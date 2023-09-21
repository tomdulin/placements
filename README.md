# placements.io

* Ruby version
  - 3.1.4

* System dependencies
  - Faker: generic filler data
  - Factory_bot: generation of seeding and test objects
  - Paper trail: for monitoring changes in line item updates
  - Postgres: db

* Configuration
  - `bundle install`

* Projet setup
  - `rails db:rebuild`

* How to run the test suite
  - `rspec`

* Deployment instructions
  - `rails s`

* Supported Bundle functionality
  - Bundel 1
    - The user should be able to browse/filter/sort the invoice history, as well.
    - Multiple users should be able to edit the same invoice concurrently. '
    - The user should be able to sort the data. 
    - The user should be able to edit line-item "adjustments". 
    - The user should be able to see each line-item's billable amount (sub total = actuals + adjustments). 
    - The user should be able to see sub-totals grouped by campaign (line items grouped by their parent campaign).  
  - Bundel 2
    - The user should be able to see a history of all the adjustments/comments/changes/etc. made to the invoice by different users.
    - The user should be able to filter the data (ie. by campaign name, etc.,  should affect the grand-total).  


* User Accounts:
  - You are able to create a new user account by going through the user registration form
  - there are two premade accounts 
    - 'tom@placements.io', "P@ssword"
    - 'jesse@placements.io', "P@ssword"

* Assumptions
  - An invoice can only have one campaign
  - A campaign can only be in one invoice (no double billing)
  - A line item can only be in one campaign

* Usage:
  - Once logged in, you will land on the invoices index.
    - you can sort by column, change page size, or search by name
    - You will first need to create a campaign by selecting it from the campaigns list
    - click on an invoice name to view the invoice, line items, and history
  - The invoice page
    - there are three options on the left nav bar
      - back to invoices
      - invoice - invoice line item
      - history - all changes made by users
    - You may updated adjustments by changing the adjustment value and clicking enter
    - once you update an adjustment, the record is added to history
 