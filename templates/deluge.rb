Eye.application 'deluge' do
  working_dir '/opt/deluge/deluge-1.3.14'
  stdall '/var/log/eye/deluge-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :deluge do
    pid_file '/var/run/deluge-eye.pid'
    start_command 'bash -c "source env/bin/activate && deluged -c /var/lib/deluge/.config/deluge -P /var/run/deluge-eye.pid"'

    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

  process :deluge_web do
    pid_file '/var/run/deluge-web-eye.pid'
    start_command '/deluge-web.sh'

    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
