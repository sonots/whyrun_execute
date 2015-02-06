require 'chef/provider/execute'

class ::Chef
  class Provider
    class WhyrunSafeExecute < Execute
      provides :whyrun_safe_execute

      def action_run
        puts
        puts "    - \e[#{32}mexecute #{@new_resource.command}\e[0m"
        result = shell_out!(@new_resource.command, opts)
        if result.exitstatus == 0
          Chef::Log.info("#{@new_resource} ran successfully")
          Chef::Log.info("STDOUT: #{result.stdout}")
          Chef::Log.info("STDERR: #{result.stderr}")
        else
          Chef::Log.warn("#{@new_resource} failed")
          Chef::Log.info("STDOUT: #{result.stdout}")
          Chef::Log.warn("STDERR: #{result.stderr}")
        end
        @new_resource.updated_by_last_action(true)
      end

      unless method_defined?(:opts)
        def opts
          opts = {}
          # original implementation did not specify a timeout, but ShellOut
          # *always* times out. So, set a very long default timeout
          opts[:timeout] = @new_resource.timeout || 3600
          opts[:returns] = @new_resource.returns if @new_resource.returns
          opts[:environment] = @new_resource.environment if @new_resource.environment
          opts[:user] = @new_resource.user if @new_resource.user
          opts[:group] = @new_resource.group if @new_resource.group
          opts[:cwd] = @new_resource.cwd if @new_resource.cwd
          opts[:umask] = @new_resource.umask if @new_resource.umask
          opts[:log_level] = :info
          opts[:log_tag] = @new_resource.to_s
          if STDOUT.tty? && !Chef::Config[:daemon] && Chef::Log.info? && !@new_resource.sensitive
            opts[:live_stream] = STDOUT
          end
          opts
        end
      end
    end
  end
end
