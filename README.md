Spree Intercom
=============

## Demo

Try Spree Intercom for Spree master with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-intercom-master)

Try Spree Intercom for Spree 3-4 with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-intercom-3-4)

## Introduction

It is a spree wrapper for Intercom, by which you can directly install Intercom on your store, create and update customers on Intercom, chat with customers, and track his movements on your store, without any hassle.

We currently support Rails 5 and Spree > 3.1

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_intercom', github: 'vinsol-spree-contrib/spree-intercom'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_intercom:install
  ```
4. Run the rake task to add intercom id to your pre-existing users.
  ```ruby
  bundle exec rake intercom:process_users
  ```

5. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Usage

1. Go to Admin Panel -> Configurations -> Intercom, and enter your Intercom application's id and access token.

   ![image](https://user-images.githubusercontent.com/8337530/40781632-41ff4ba2-64fa-11e8-8553-25d23f6fe996.png)

   ![image](https://user-images.githubusercontent.com/8337530/40781633-42371f8c-64fa-11e8-8b8e-7575eb091419.png)

   To get your application id, you can have a look [here](https://docs.intercom.com/faqs-and-troubleshooting/getting-set-up/where-can-i-find-my-app-id)

   You can read more about access tokens [here](https://developers.intercom.com/docs/personal-access-tokens)

2. If you have entered correct application id, and access token; AND have subscribed to Intercom's chat product [ message / inbox ], you should be able to see Intercom chat widget in your store.

   Please visit your Intercom admin panel to customise it as per your wish.

   ![image](https://user-images.githubusercontent.com/8337530/40781634-426dce06-64fa-11e8-8352-28d62290ef5f.png)

3. As soon as a user creates an account, or user updates his information [ name, phone ] is instantaneously uploaded on Intercom.

4. You can engage with customers through the Intercom message widget.

   As soon as the customer logs out of his account, his previous conversation is swiped off, to maintain customer's privacy.

   When user is logged in -

   ![image](https://user-images.githubusercontent.com/8337530/40781636-429bf0a6-64fa-11e8-975d-b55b68009656.png)

   After Logout -

   ![image](https://user-images.githubusercontent.com/8337530/40781638-42f9981e-64fa-11e8-97eb-89ac3bee2f2f.png)

5. Events - You can track your customer's movement on your store
   ![image](https://user-images.githubusercontent.com/8337530/40781637-42cc7366-64fa-11e8-924b-ead4d6dfc0b0.png)

   Currently, we are tracking the following events -
    * Customer created
    * Customer updated
    * Customer Login
    * Customer Logout
    * Add item in cart
    * Remove item from cart
    * Update cart
    * Product view
    * Product search
    * Filter applied
    * Checkout stages - address, delivery, payment, confirm.
    * Order placed
    * Order shipped
    * Order returned
    * Promotion applied
    * Promotion removed

## Testing

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_intercom/factories'
```


## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

Copyright (c) 2018 Vinsol, released under the New BSD License
