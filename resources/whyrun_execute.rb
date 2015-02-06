require 'chef/resource/execute'

class ::Chef
  class Resource
    # execute command on only why-run mode
    #
    # HOW TO USE:
    #
    #     whyrun_execute "#{name}" do
    #       command "#{command}"
    #     end
    #
    # OPTIONS:
    #
    # Other options are same with `execute` resource.
    # See https://docs.chef.io/resource_execute.html
    class WhyrunExecute < Execute
      def initialize(name, run_context=nil)
        super
        @resource_name = :whyrun_execute
      end
    end
  end
end
