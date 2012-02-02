 namespace :db do
  desc "rebuilds the database and prepares sample data"
  task :bootstrap  do
    raise "this task should not be run in production" if Rails.env.production?
    puts "Dropping the database........"
    Rake::Task["db:drop"].invoke
    puts "Done...................."
    puts "Creating the database........"
    Rake::Task["db:create"].invoke
    puts "Done...................."
    puts "Migrating the database........"
    Rake::Task["db:migrate"].invoke
    puts "Done...................."
    puts "Seeding the database........"
    Rake::Task["db:seed"].invoke
    puts "Successfully bootstrap the db............"
  end
end