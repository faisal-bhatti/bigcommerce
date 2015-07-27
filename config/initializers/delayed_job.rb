require 'import_products_job'

Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 24.hours
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))