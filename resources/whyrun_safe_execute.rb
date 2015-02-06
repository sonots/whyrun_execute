require 'chef/resource/execute'

class ::Chef
  class Resource
    # Execute command on even why-run mode
    #
    # HOW TO USE:
    #
    #     whyrun_safe_execute "#{name}" do
    #       command "#{command}"
    #     end
    #
    # OPTIONS:
    #
    # Other options are same with `execute` resource.
    # See https://docs.chef.io/resource_execute.html
    class WhyrunSafeExecute < Execute
      def initialize(name, run_context=nil)
        super
        @resource_name = :whyrun_safe_execute
      end
    end
  end
end
