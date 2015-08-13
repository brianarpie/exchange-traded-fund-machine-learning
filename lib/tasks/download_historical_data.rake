namespace :data do
  task :import do
    ruby "scripts/data_import.rb"
  end
end