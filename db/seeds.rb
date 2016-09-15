User.create(username: "jack_noble", email: "jack@yahoo.com", password: "password")

Url.create(long_url: "https://www.reddit.com", short_url: SecureRandom.hex(4), creator_id: 1)
