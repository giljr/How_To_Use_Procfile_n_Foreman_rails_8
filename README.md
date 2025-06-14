# Rails 8: Encrypted Credentials & Procfile Startup

Secure your secrets and streamline app startup using `credentials.yml.enc` and `foreman`.

Note: if you get stuck, please see my [page](https://medium.com/jungletronics/rails-8-credentials-procfile-secure-secrets-and-streamlined-startup-5af05b1d5ebc). See [this](https://medium.com/jungletronics/secure-secrets-in-rails-d52744a2e436) post too!

## 🔐 What You’ll Learn

- How to store and access encrypted credentials securely
- How to use a `Procfile` to run your app with `foreman`
- How to display secrets in the browser (demo)

## 🛠 Setup

```bash
rails new secure_app --skip-javascript --skip-hotwire
cd secure_app
echo "web: bundle exec puma -C config/puma.rb" > Procfile
bundle install
```
🔧 Add Encrypted Secrets
```bash
EDITOR="code --wait" bin/rails credentials:edit
```
Add:
```bash
myapp:
  startup_token: "Started via Procfile 🚀"
  environment: "development"
```
🌐 Generate a Home Page
```bash
bin/rails generate controller Home index
```
Update routes.rb:
```bash
root "home#index"
```
Access secrets in the controller:
```bash
@secrets = Rails.application.credentials[:myapp] || {}
```
Display them in the view:
```ruby
<% @secrets.each do |key, value| %>
  <p><strong><%= key %>:</strong> <%= value %></p>
<% end %>
```
🚀 Run with Foreman
```bash
gem install foreman
foreman start
```
Visit: http://localhost:5000
✅ Done!

You’ve securely managed secrets and standardized startup with Foreman.

Thanks for reading! 🚀
## License

[MIT](https://choosealicense.com/licenses/mit/)

