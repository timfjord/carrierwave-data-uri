# CarrierWave::DataUri

Carrierwave plugin that allows create image from data uri

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carrierwave-data-uri'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-data-uri

## Usage

```ruby
class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
```

Then we can create image from data

```
user = User.find 123
user.image_data_uri = 'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
user.save
```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/carrierwave-data-uri/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

* http://www.davehulihan.com/uploading-data-uris-in-carrierwave/
