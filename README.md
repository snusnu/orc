# orc

[![Gem Version](https://badge.fury.io/rb/orc.png)][gem]
[![Build Status](https://secure.travis-ci.org/snusnu/orc.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/snusnu/orc.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/snusnu/orc.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/snusnu/orc/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/orc
[travis]: https://travis-ci.org/snusnu/orc
[gemnasium]: https://gemnasium.com/snusnu/orc
[codeclimate]: https://codeclimate.com/github/snusnu/orc
[coveralls]: https://coveralls.io/r/snusnu/orc

## Usage

Whenever you want to communicate success or failure of an operation, the following might be handy

```ruby
describe Orc::Result do
  describe '.success' do
    subject { Orc::Result.success(object) }

    let(:object) { :object }

    it 'signals success' do
      expect(subject.success?).to be(true)
    end

    it 'returns :success status' do
      expect(subject.status).to be(:success)
    end

    it 'exposes the associated object' do
      expect(subject.object).to be(object)
    end
  end

  describe '.failure' do
    subject { Orc::Result.failure(status, context) }

    let(:status)  { :confused }
    let(:context) { :context }

    it 'signals failure' do
      expect(subject.success?).to be(false)
    end

    it 'exposes the given #status' do
      expect(subject.status).to be(status)
    end

    it 'exposes the associated #context' do
      expect(subject.context).to be(context)
    end
  end
end
```

## Credits

* [snusnu](https://github.com/snusnu)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Copyright

Copyright &copy; 2014 Martin Gamsjaeger (snusnu). See [LICENSE](LICENSE) for details.
