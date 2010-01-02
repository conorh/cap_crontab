require 'erb'

namespace :crontab do
  desc "Show the existing installed crontab"
  task :show, :only => { :crontab => true } do
    puts capture("crontab -l")
  end

  desc "Install a new crontab on any servers that have :crontab => true"
  task :install, :only => { :crontab => true } do
    crontab_file = "#{current_path}/config/crontabs/#{rails_env}"
    cron_template = capture("test -e #{crontab_file} && cat #{crontab_file} || echo 'none'")

    if cron_template and cron_template.strip != "none"
      buffer = ERB.new(cron_template).result(binding)
      put buffer, "#{crontab_file}_crontab_out"
      run "crontab #{crontab_file}_crontab_out"
    else
      puts "No crontab installed. No file found at '#{crontab_file}'"
    end
  end
end