# berks install to vendor/cookbooks. run once before running test
# require 'chefspec/berkshelf' does berks install && vendor everytime, so slow

desc "berks install (download cookbooks)"
task :install do
  require 'berkshelf'
  puts 'berks install to vendor/cookbooks'
  Berkshelf.ui.mute do
    ENV['BERKSHELF_PATH'] = 'vendor'
    Berkshelf::Berksfile.from_file('Berksfile').install
  end
end

desc "berks vendor (sync all cookbooks of even local paths and self)"
task :vendor do
  require 'berkshelf'
  puts 'berks vendor to vendor/cookbooks'
  Berkshelf.ui.mute do
    berksfile = Berkshelf::Berksfile.from_file('Berksfile')
    berksfile.vendor('vendor/cookbooks')
  end
end

task :clean do
  FileUtils.rm_rf('vendor/cookbooks') if File.exist?('vendor/cookbooks')
end
