working_directory "/home/deploy/sites/miguelnager.com/current"

pid "#{working_directory}/pids/unicorn.pid"

stderr_path "#{working_directory}/log/unicorn.log"
stdout_path "#{working_directory}/log/unicorn.log"

listen "/tmp/unicorn.miguelnager.sock"
listen "/tmp/unicorn.myapp.sock"

# worker_processes 4
worker_processes 2

timeout 30