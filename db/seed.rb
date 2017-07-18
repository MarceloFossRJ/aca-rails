# ruby encoding: utf-8
AcaRails::User.create(name: 'Administrator',
                      login: 'admin',
                      email: 'admin@acarails.com',
                      is_admin: true,
                      is_active: true,
                      password: "admin",
                      password_confirmation: "admin",
                      is_email_confirmed: true
                      )
AcaRails::User.create(name: 'Root',
                      login: 'root',
                      email: 'root@acarails.com',
                      is_admin: true,
                      is_active: true,
                      password: "root",
                      password_confirmation: "root",
                      is_email_confirmed: true
)
