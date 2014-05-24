# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/deploy/sites/miguelnager.com/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/deploy/sites/miguelnager.com/current/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/deploy/sites/miguelnager.com/current/log/unicorn.log"
stdout_path "/home/deploy/sites/miguelnager.com/current/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.miguelnager.sock"
listen "/tmp/unicorn.myapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30