# Jackie

 A Ruby interface to the Kickfolio API.

## Installation

Add this line to your application's Gemfile:

    gem 'jackie'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jackie

## Usage

### Configuring Jackie
```ruby
  # Set your Api Key
  Jackie.api_key =  "MyKickfolioApiKey"
```
### Basic Objects Operations
```ruby
# Create New app
app = Jackie::App.new(app_attributes)
app.save

# Find the app with app_id 1.
app = Jackie::App.find(1)
app.name = "new name"
app.save

# GET the App versions
app.versions

# Delete a App
app.destroy

# GET the Apps
Jackie::App.all

# Create New App Version
version = Jackie::Version.new(:app_id => app.id, :bundle_url => "https://bundle_url.com/myiosapp")
version.save

# Find the version with version id 1.
version = Jackie::Version.find(1)

# GET All Versions
Jackie::Version.all

# Delete a Version
version.destroy
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

License
-------

Nuvado is Copyright © 2013 Firebase. It is free software,
and may be redistributed under the terms specified in the MIT-LICENSE file.

