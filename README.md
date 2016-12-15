# Podspecdolly

As the global podspec on github of Cocoapods is growing larger, any process involving cocoapod is a pain especially if your project has 10 or more dependencies. The option is to run a local or self-hosted podspec. This tool will allow you to rely totally on your own podspec by cloning only the pods that you want, based on a podfile, without the need to send a pull request to Cocoapods/Specs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'podspecdolly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install podspecdolly

## Usage

- cd to a folder with a podfile
- $ podspecdolly clone
- All currently missing version of podspec will be download to a Specs folder

## Development

Features that are missing and are planned for next release, arrange from most to least prioritized :
- Automatically download pod dependencies
- Allow clone from other sources
- Writing tests

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/doraeminemon/podspecdolly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
