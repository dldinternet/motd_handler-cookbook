require 'chef/handler'
require 'fileutils'


class Motd < Chef::Handler

  def report

    if run_status.success?
      FileUtils.cp '/tmp/motd', '/etc/motd'
    else
      f = File.open("/etc/motd", "w")
      f.write("\n\033[07;05;04;01;32;45m  **** Chef Run FAILED ****\033[0m\n")
      f.close
    end
  end

end
