# RAILS STARTUP TEMPLATE

This template is generated from *[Jumpstart Rails Template](https://github.com/excid3/jumpstart)* 

#### Please check this [repo readme]((https://github.com/excid3/jumpstart)) for startup instructions.

The Repo Contains Rails Startup Template using Devise and 2 Factor Authentication.

#### Add .env to the root of the directory
```
OTP_KEY=xxxxx
```
You can generate the key from rails console
```ruby
rails c
SecureRandom.hex 16
```
copy the result and add it as above inside the `.env` file.
