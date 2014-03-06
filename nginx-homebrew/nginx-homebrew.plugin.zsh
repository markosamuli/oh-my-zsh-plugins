: ${NGINX_PATH:=/usr/local/opt/nginx}

function nginx_reload() {
  FILE="${NGINX_PATH}/logs/nginx.pid"
  if [ -e $FILE ]; then
    echo "Reloading nginx configuration..."
    PID=`cat $NGINX_PATH/logs/nginx.pid`
    sudo kill -HUP $PID
  else
    echo "nginx pid file not found"
    return 0
  fi
}

function nginx_stop() {
  FILE="${NGINX_PATH}/logs/nginx.pid"
  if [ -e $FILE ]; then
    echo "Stopping nginx..."
    PID=`cat $NGINX_PATH/logs/nginx.pid`
    sudo kill -INT $PID
  else
    echo "nginx pid file not found"
    return 0
  fi
}

function nginx_start() {
  FILE="${NGINX_PATH}/sbin/nginx"
  if [ -e $FILE ]; then
    echo "Starting nginx..."
    sudo $NGINX_PATH/sbin/nginx
  else
    echo "Couldn't start nginx"
  fi
}

function nginx_restart() {
  FILE="${NGINX_PATH}/logs/nginx.pid"
  if [ -e $FILE ]; then
    echo "Stopping nginx..."
    PID=`cat $NGINX_PATH/logs/nginx.pid`
    sudo kill -INT $PID
    sleep 1
    echo "Starting nginx..."
    sudo $NGINX_PATH/sbin/nginx
  else
    echo "nginx pid file not found"
    return 0
  fi
}
