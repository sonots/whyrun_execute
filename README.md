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

Example: 

```ruby
# recipes/test.rb
whyrun_safe_execute "foo" do
  command "ls /tmp"
end
```

```
$ chef-solo -c solo.rb -o {cookbook}::test -W -l info
```

# Options

Options are same with `execute` resource. See http://docs.chef.io/resource_execute.html
