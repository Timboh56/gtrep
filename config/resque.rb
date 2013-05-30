require 'resque_scheduler'

Resque.redis = 'localhost:6379'
Resque.redis.namespace = 'resque:scheduler'

Dir["#{Rails.root}/app/workers/*.rb"].each { |file| require file }

Resque.schedule = YAML.load_file(Rails.root.join('config', '10_s_scheduler.yml'))