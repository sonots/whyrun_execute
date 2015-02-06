# whyrun_safe_execute Cookbook

Add `whyrun_safe_execute` resource which enables to run command on why-run mode for chef 

# Installation

## For Cookbook

For cookbook, write metadata.rb as:

```ruby
depends 'whyrun_safe_execute'
```

and Berksfile:

```ruby
source 'https://supermarket.chef.io'

metadata
cookbook 'whyrun_safe_execute', git: "https://github.com/sonots/chef-resource-whyrun_safe_execute.git"
```

## For Chef Repository

For chef-repo, write Berksfile as:

```ruby
source 'https://supermarket.chef.io'

cookbook 'whyrun_safe_execute', git: "https://github.com/sonots/chef-resource-whyrun_safe_execute.git"
```

# Usage

See http://sonots.github.io/chef-resource-whyrun_safe_execute/doc/frames.html.

# Example

recipes/test.rb

```ruby
whyrun_safe_execute "foo" do
  command "ls /tmp"
end
```

```
$ chef-solo -c solo.rb -o {cookbook}::test -W -l info
```
