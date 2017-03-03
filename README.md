# CarrierWave::DataUri

[![Build Status](https://travis-ci.org/timsly/carrierwave-data-uri.svg)](https://travis-ci.org/timsly/carrierwave-data-uri)

Carrierwave plugin that allows create image from data uri

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

Then we can create image from data

```
user = User.find 123
user.avatar_data_uri = 'data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw=='
user.save
```

and then retrieve passed data

```
user.avatar_data_uri # => data:image/gif;base64,R0lGODlhAQABAJEAAAAAAP////8AAP///yH5BAEAAAMALAAAAAABAAEAAAICVAEAOw==
```

In case emtpy/invalid data error won't be raised.
Loud version should be used instead to raise an error on emtpy/invalid data:

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
