# Clumsy

An awkward tool for testing proxies with ngrok.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clumsy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clumsy

## Usage

Please note: This project is very new and likely has bugs. Contributions are very welcome!

Clumsy is a tool for testing proxies in an end-to-end fashion. The idea for this came about around a need to build tests for API gateway tools like Apigee or Amazon API Gateway. Because of the nature of these envronments, there isn't an easy way to test the implementation without deploying a server. Clumsy works by using a deployed *test* instance of a server and piping that output back to the testing machine using [ngrok](https://ngrok.com/). This allows the test to trigger a request and receive the output within the same process.

**Prerequisites:**

* A running ngrok tunnel
* A running instance of your proxy, pointing to your [ngrok](https://ngrok.com/) tunnel
* A ruby test environment (rspec, etc.)
* A "clumsy test" file to describe your test

With all of that in place, you can setup a test like this:

```ruby
describe 'Some Context' do

  it 'does what you expect' do

    test_file = Clumsy::TestFile.new('path/to/test_file')

    server = Clumsy::Server.new(test_file)
    server.start!

    runner = Clumsy::TestRunner.new(server, test_file)
    runner.process

    expect(server.did_receive_request("GET http://something.ngrok.com/foo/bar)).to be true

  end

end
```



## Clumsy Test File Structure

```json
{
  "request_method":"GET",
  "request_url":"REQUEST_URL",
  "downstream": [
    {
      "request": {
        "method":"GET",
        "url":"DOWNSTREAM_REQUEST_URL_1"
      },
      "response": {
        "payload": "JSON PAYLOAD"
      }
    },
    {
      "request": {
        "method":"GET",
        "url":"DOWNSTREAM_REQUEST_URL_2"
      },
      "response":{
        "payload": "JSON PAYLOAD"
      }
    },
    {
      "request":{
        "method":"GET",
        "url":"DOWNSTREAM_REQUEST_URL_3"
      },
      "response":{
        "payload": "JSON PAYLOAD"
      }
    },
    {
      "request":{
        "method":"GET",
        "url":"DOWNSTREAM_REQUEST_URL_4"
      },
      "response":{
        "payload": "JSON PAYLOAD"
      }
    }
  ],
  "response":{
    "status":200,
    "headers":"",
    "body":{
      "payload": "FINAL JSON PAYLOAD"
    }
  }
}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/darbyfrey/clumsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

