# CarrierWave::DataUri

![Build Status](https://github.com/timfjord/carrierwave-data-uri/actions/workflows/test.yml/badge.svg)

Carrierwave plugin that allows to create images from data uri

:warning: Please read the [migration notes](#migration-notes) before upgrading to a new major version.

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

Then a data string can be used as a source for the uploader

```
user = User.find 123
user.avatar_data_uri = 'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
user.save
```

the data string can be retrieved too

```
user.avatar_data_uri # => data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw==
```

There will be no error in case of empty or invalid data.
There is a loud version available that could be used to raise an error on empty or invalid data:

```
user = User.find 123
user.avatar_data_uri_loud = '' # will raise `CarrierWave::DataUri::InvalidData` error
```

Optionally, to customize the file name, specify the `#{column}_data_filename` and `#{column}_data_mimetype` attributes before the `#{column}_data_uri` attribute.

```ruby
user = User.find 123
user.avatar_data_filename = 'somefile.jpg'
user.avatar_data_mimetype = 'image/jpeg'
user.avatar_data_uri = 'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
user.save
```

## Migration Notes

#### Version 0.2.0

- Assigning empty data is not raising an error now. Use loud version(`model.field_data_uri_loud =`) instead.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/carrierwave-data-uri/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Credits

* http://www.davehulihan.com/uploading-data-uris-in-carrierwave/
