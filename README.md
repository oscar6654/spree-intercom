Spree Intercom
=============

## Demo

Try Spree Intercom for Spree master with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-intercom-master)

Try Spree Intercom for Spree 3-4 with direct deployment on Heroku:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/vinsol-spree-contrib/spree-demo-heroku/tree/spree-intercom-3-4)

## Introduction

It is a spree wrapper for Intercom, using which you can directly install and use Intercom on your Spree store, create and update customers on [Intercom](https://www.intercom.com/), chat with customers, and track his movements on your store, without any hassle.

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

4. Restart your server

   If your server was running, restart it so that it can find the assets properly.

5. Go to Admin Panel -> Configurations -> Intercom, and enter your Intercom application's id and access token.

   ![image](https://user-images.githubusercontent.com/8337530/40781633-42371f8c-64fa-11e8-8b8e-7575eb091419.png)

   To get your application id, you can have a look [here](https://docs.intercom.com/faqs-and-troubleshooting/getting-set-up/where-can-i-find-my-app-id)

   You can read more about access tokens [here](https://developers.intercom.com/docs/personal-access-tokens)

   > Please ensure this step is performed before running the rake task.

6. Run the rake task to add intercom id to your pre-existing users and move your users to Intercom.

  ```ruby
  bundle exec rake intercom:process_users
  ```

## Usage

1. If you have entered correct application id, and access token; AND have subscribed to Intercom's chat product [ message / inbox ], you should be able to see Intercom chat widget in your store.

   Please visit your Intercom admin panel to customise it as per your wish.

   ![image](https://user-images.githubusercontent.com/8337530/40781636-429bf0a6-64fa-11e8-975d-b55b68009656.png)

2. As soon as a user creates an account, or user updates his information [ name, phone ] is instantaneously uploaded on Intercom.

3. You can engage with customers through the Intercom message widget.

   As soon as the customer logs out of his account, his previous conversation is swiped off, to maintain customer's privacy.

4. Events - You can track your customer's movement on your store

   Currently, we are tracking the following events -
    * Customer creates his account.
    * Customer updates his account.
    * Customer logs into his account.
    * Customer logs out from his account.
    * Customer adds item in his cart.
    * Customer removes item from his cart.
    * Customer updates his cart.
    * Customer views a product.
    * Customer searches a product.
    * Customer applies a filter.
    * Checkout stages - address, delivery, payment, confirm.
    * Customer places an order.
    * Customer's order is shipped.
    * Customer returns an order.
    * Customer applies promotion.
    * Customer removes promotion.

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
