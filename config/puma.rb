# The directory to operate out of.
# The default is the current directory.

directory '/u/apps/lolcat'

# Load “path” as a rackup file.
# The default is “config.ru”.

rackup '/u/apps/lolcat/config.ru'

# Set the environment in which the rack's app will run. The value must be a string.
# The default is “development”.

environment 'production'

# Daemonize the server into the background. Highly suggest that
# this be combined with “pidfile” and “stdout_redirect”.
# The default is “false”.

daemonize
daemonize false

# Store the pid of the server in the file at “path”.

pidfile '/u/apps/lolcat/tmp/pids/puma.pid'

# Use “path” as the file to store the server info state. This is
# used by “pumactl” to query and control the server.

state_path '/u/apps/lolcat/tmp/pids/puma.state'

# Redirect STDOUT and STDERR to files specified. The 3rd parameter
# (“append”) specifies whether the output is appended, the default is
# “false”.

stdout_redirect '/u/apps/lolcat/log/stdout', '/u/apps/lolcat/log/stderr'
stdout_redirect '/u/apps/lolcat/log/stdout', '/u/apps/lolcat/log/stderr', true

# Disable request logging.
# The default is “false”.

quiet

# Configure “min” to be the minimum number of threads to use to answer
# requests and “max” the maximum.
# The default is “0, 16”.

threads 0, 16

# Bind the server to “url”. “tcp://”, “unix://” and “ssl://” are the only
# accepted protocols.
# The default is “tcp://0.0.0.0:9292”.

bind 'tcp://0.0.0.0:9292'
bind 'unix:///var/run/puma.sock'
bind 'unix:///var/run/puma.sock?umask=0777'
#bind 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert'

# Listens on port 7001
# The default is 9292
port 7001

# Instead of “bind 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert'” you
# can also use the “ssl_bind” option.

 #ssl_bind '127.0.0.1', '9292', { key: path_to_key, cert: path_to_cert }

# Code to run before doing a restart. This code should
# close log files, database connections, etc.

# This can be called multiple times to add code each time.

on_restart do
  puts 'On restart...'
end