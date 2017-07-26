namespace :aca_rails do
  desc "Creat root user"
  task :root_user => :environment do
    AcaRails::User.create(name: 'Root',
                          login: 'root',
                          email: 'root@acarails.com',
                          is_admin: true,
                          is_active: true,
                          password: "root",
                          password_confirmation: "root",
                          is_email_confirmed: true
    )
  end

  desc "Create admin user"
  task :admin_user => :environment do
    AcaRails::User.create(name: 'Administrator',
                          login: 'admin',
                          email: 'admin@acarails.com',
                          is_admin: true,
                          is_active: true,
                          password: "admin",
                          password_confirmation: "admin",
                          is_email_confirmed: true
    )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:root_user, :admin_user]
end
