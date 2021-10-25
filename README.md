# README

## Installation

### Requirements

- :gem: Ruby version `2.7.2` (manage Ruby versions with [rvm](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv))
- :elephant: PostgreSQL

### Getting started

- Fork & clone the repository
- `bundle install`
- Run `rails db:create db:migrate`
- Run `bundle exec rspec` to validate the installation
- Run `rails server`
- You're good to go :tada:

## Challenge

See [`doc/challenge/README.md`](./doc/challenge/README.md)


## API

- send money
  - URL: {domain}/api/v1/payments 
  - METHOD: POST
  - BODY: { "user_id":1, "amount": 2, "note": "my notes...", "receive_by": {"email": "fernande@example.name"}}
    - (here we can also receive_by email by phone_number )
    - user_id is sender user id