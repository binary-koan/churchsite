# Churchsite

![Active](https://img.shields.io/badge/repo status-maintenance-blue.svg)

Rails setup intended for the [Lincoln Union Church website](http://lincolnchurch.org.nz) but which
could be made to work for other churches or organisations.

## Requirements

In addition to the [standard requirements for Ruby on Rails](http://guides.rubyonrails.org/getting_started.html#installing-rails)
you will need

- [MongoDB](https://www.mongodb.org/)
- [ImageMagick](http://www.imagemagick.org/script/index.php) or GraphicsMagick

Since this is intended to be deployed to OpenShift, you may also want to install the `rhc` gem.

## Setup

As with any Rails site, you can start a local development server with `bundle exec rails server`,
but you'll need to manually create an admin user before you can actually do anything. The easiest
way to do that is to start a Rails console and enter:

```ruby
User.create!(name: "Your name", email: "you@domain.com", password: "secret", password_confirmation: "secret")
User.first.confirm!
```

There is no default homepage, so the first time you start the server you'll need to go to `/admin`
and create a page with type "Homepage".
