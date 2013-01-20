if defined?(Capistrano) &&
  Capistrano::Configuration.respond_to?(:instance) &&
  instance = Capistrano::Configuration.instance

  instance.instance_eval do
    load File.dirname(__FILE__) + "/../recipes/cap_crontab.rb"
  end
end