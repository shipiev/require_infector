# RequireInfector

The gem add 'require_infector' to ActionDispatch. It's using for patching.

## Installation

Add this line to your application's Gemfile:

    gem 'require_infector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install require_infector

## Usage

    plugins/awesome_plugin/lib/awesome_plugin
    plugins/awesome_plugin/lib/awesome_plugin/infectors/user.rb
    plugins/awesome_plugin/lib/awesome_plugin/infectors/issue.rb
    plugins/awesome_plugin/lib/awesome_plugin/infectors/users_controller.rb
    plugins/awesome_plugin/lib/awesome_plugin/infectors/issues_helper.rb

    # plugins/awesome_plugin/init.rb
    Rails.config.to_prepare do
        require_infector 'awesome_plugin', 'user', 'issue', 'user_controller', 'issue_helper'
    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/require_infector/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
