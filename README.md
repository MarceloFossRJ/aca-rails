# AcaRails
ACA is an acronym for Access Control Application.  
It is an authentication and authorization solution for Ruby on Rails apps.
 

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'aca_rails'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install aca_rails
```

Run the generator to install:
```bash
$ rails generate aca_rails:install
```

## Configuration
### Email
Aca_Rails uses the application default configuration to send emails. Configure it before installing it.
### Admin/Root user
With the email properly configured, you can now create the 
To create a*root*admin user, run the use_root aca_rails rake task:
```bash
$ rake aca_rails:use_root
```
To create a named*admin*administrator user, run the use_admin aca_rails rake task:
```bash
$ rake aca_rails:use_admin
```
If you want to create both users:
```bash
$ rake aca_rails:all
```
The admin user is created with the default password*admin*.  
The root user is created with the default password*root*.  
**The password will be asked to be changed in the first login**  

### Aca_Rails parameters

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
