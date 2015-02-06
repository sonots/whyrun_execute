# This file is just for development. Run like
# $ rake install
# $ chef-solo -c solo.rb -o {cookbook_name}::{recipe_name}
cookbook_path %w(vendor/cookbooks ..).map {|path| File.expand_path(path) }
