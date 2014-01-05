# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Auth::Application.config.secret_key_base = 'fb4ea307e3ddfc6dab7313510c29561b084c446c605f4119aaaf69a97bdefe7cdea649912c9ee18563639129f098e55d54a490a9855ad741a49d136186209342'
