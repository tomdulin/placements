namespace :db do
  desc "PG Specific, db: terminate, drop, create, migrate, seed"
  task :rebuild => :environment do
    Rake::Task["db:terminate"].invoke
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke

    `bin/rails db:environment:set RAILS_ENV=development`
  end

  desc "Fix 'database is being accessed by other users'"
  task :terminate => :environment do
    begin
      ActiveRecord::Base.connection.execute <<-SQL
        SELECT
          pg_terminate_backend(pid)
        FROM
          pg_stat_activity
        WHERE
          -- don't kill my own connection!
          pid <> pg_backend_pid()
          -- don't kill the connections to other databases
          AND datname = '#{ActiveRecord::Base.connection.current_database}';
      SQL
    rescue
      puts "db:terminate :: Could not terminate db connection."
    end
  end
end