# whyrun_execute Cookbook

Add `whyrun_execute` resource which runs command only on why-run mode for chef

# Installation

## For Cookbook

For cookbook, write metadata.rb as:

```ruby
depends 'whyrun_execute'
```

and Berksfile:

```ruby
source 'https://supermarket.chef.io'

metadata
cookbook 'whyrun_execute', git: "https://github.com/sonots/whyrun_execute.git"
```

## For Chef Repository

For chef-repo, write Berksfile as:

```ruby
source 'https://supermarket.chef.io'

cookbook 'whyrun_execute', git: "https://github.com/sonots/whyrun_execute.git"
```

# Usage

See http://sonots.github.io/whyrun_execute/doc/frames.html.

# Example

recipes/test.rb

```ruby
whyrun_execute "foo" do
  command "ls /tmp"
end
```

```
$ chef-solo -c solo.rb -o {cookbook}::test -l info
#=> does not run
$ chef-solo -c solo.rb -o {cookbook}::test -W -l info
#=> does run
```
