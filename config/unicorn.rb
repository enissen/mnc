root = "/home/deploy/sites/miguelnager.com/current"

working_directory "#{root}"

pid "#{root}/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.miguelnager.sock"
#listen "/tmp/unicorn.myapp.sock"

# worker_processes 4
worker_processes 2

timeout 30