export def --env start-default [] {
  if "HTTP_PROXY" not-in $env {
    echo "☀️ Use 10809 port, it's v2ray default port!"
    $env.HTTP_PROXY = http://127.0.0.1:10809
    $env.HTTPS_PROXY = https://127.0.0.1:10809
    return
  }
  echo "🌤️ Your proxy is ready!"
  echo "http  port: " $env.HTTP_PROXY
  echo "https port: " $env.HTTPS_PROXY 
}


export def --env hide-default [] {
  if "HTTP_PROXY" in $env {
    echo "🌨️ Now, you remove http proxy!"

    hide-env HTTP_PROXY
    hide-env HTTPS_PROXY

    return
  }
  echo "❄️ You even don't set http proxy!"
}
