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
# Create a new app
app = Jackie::App.new(:name => "Hello")
app.save

# Find the app with id 1.
app = Jackie::App.find(1)
app.name = "HelloWorld"
app.save

# Delete an App
app.destroy

# Get all the existing Apps
Jackie::App.all

# Create a new Version of an App
version = Jackie::Version.new(:app_id => app.id, :bundle_url => "https://site.org/hello.app.zip")
version.save

# Find the version with id 1.
version = Jackie::Version.find(1)

# Get all the Versions
Jackie::Version.all

# GET all the Versions of an App
app.versions

# Delete a Version
version.destroy
```

For additional information read the [Kickfolio API docs](https://github.com/Kickfolio/ApiDocs)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

License
-------

Jackie is Copyright © 2013 Firebase. It is free software,
and may be redistributed under the terms specified in the LICENSE.txt file.
