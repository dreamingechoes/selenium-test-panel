Selenium Test Panel
===================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Just a simple (Work In Progress) proof of concept of an admin panel to create and automate tests with Selenium made with Ruby on Rails.

It uses the Bootstrap SB Admin Base V2 theme. You could find the Rails gem of this theme [here](https://github.com/dreamingechoes/bootstrap_sb_admin_base_v2).

Main features included by default:

- [Devise](https://github.com/plataformatec/devise) with default modules.
- [BootstrapSBAdminBaseV2](https://github.com/dreamingechoes/bootstrap_sb_admin_base_v2) theme included.
- [SendGrid](https://github.com/stephenb/sendgrid) gem for mailing.
- Continuous testing with [Guard](https://github.com/guard/guard).
- Thin server.
- MySQL database.
- ERB template engine.

There is an user example ready to use to login with email `user@example.com` and password `123456789`.

Ruby on Rails
-------------

This application requires:

- Ruby 2.3.0
- Rails 4.2.7.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

To start using this template, you only have to do the typical ***Rails*** things:

* Install ***Ruby*** version 2.3.0 (using [RVM](https://github.com/rvm/rvm) or [RBenv](https://github.com/sstephenson/rbenv) or whatever).

* Clone the repo and do the ***bundle install*** thing:

```sh
user@computer:~$ git clone git@github.com:dreamingechoes/selenium-test-panel.git YOUR_APP_NAME_HERE
user@computer:~$ cd YOUR_APP_NAME_HERE
user@computer:/YOUR_APP_NAME_HERE$ bundle install
user@computer:/YOUR_APP_NAME_HERE$ rake db:setup
user@computer:/YOUR_APP_NAME_HERE$ rake db:seed
```

Usage
-----

This proof of concept uses the automate capabilities of [BrowserStack](https://www.browserstack.com) to execute the Selenium tests on the cloud, so we don't need to execute it locally. Because of that, first of all you will need a [BrowserStack](https://www.browserstack.com/users/sign_up) account in order to be able to get your automate `username` and `access_key`.

The free account has some free uses, but it's preferible to get an `Automate` or `Automate Pro` plan if you want to do heavy testing.

Once you have this  automate `username` and `acces_key`, just go to the `Configurations` section and create two elements:

* **browserstack_username**: your BrowserStack automate `username`.
* **browserstack_key**: your BrowserStack automate `acces_key`.

And you're ready to go, start creating `CaseTests` to run.

Additionally, if you plan to deploy this example on Heroku, you'll need to the set the AWS configuration variables:

```
$ heroku config:set S3_BUCKET_NAME=your_bucket_name
$ heroku config:set AWS_ACCESS_KEY_ID=your_access_key_id
$ heroku config:set AWS_SECRET_ACCESS_KEY=your_secret_access_key
$ heroku config:set AWS_REGION=your_aws_region
```

Original author
---------------

Iván González, *a.k.a* [dreamingechoes](https://github.com/dreamingechoes)

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

License
-------

**Selenium Test Panel App** is released under the [MIT License](http://www.opensource.org/licenses/MIT).
