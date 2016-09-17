User.create!([
  { password: "123456789", email: "user@example.com", name: "Example user" }
])

ConfigElement.create!([
  { key: "browserstack_key" },
  { key: "browserstack_username" }
])
