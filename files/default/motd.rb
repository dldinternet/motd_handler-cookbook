require 'chef/handler'
require 'fileutils'


class Motd < Chef::Handler

  def report
    if run_status.success?
      FileUtils.cp '/tmp/motd', '/etc/motd'
    else
      FileUtils.cp '/var/chef/vendor/cookbooks/motd_handler/files/default/motd.failed', '/etc/motd'
    end
  end

end
