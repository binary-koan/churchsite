# Churchsite

![Active](https://img.shields.io/badge/repo status-maintenance-blue.svg)

Rails setup intended for the [Lincoln Union Church website](http://lincolnchurch.org.nz) but which
could be made to work for other churches or organisations.

## Setup

This is a pretty standard Rails website, although you'll need to create a default user before you
can actually do anything. The easiest way to do that is to start a Rails console and enter:

```ruby
User.create!(name: "Your name", email: "you@domain.com", password: "secret", password_confirmation: "secret")
User.first.confirm!
```

There is no default homepage, so the first time you start the server you'll need to go to `/admin`
and create a page with type "Homepage".
