default[:nginx][:user] = 'nginx'
default['nginx']['dir'] = '/etc/nginx'

# ssl / tls
default[:nginx][:ssl] = false
default[:nginx][:ssl_protocols] = 'TLSv1 TLSv1.1 TLSv1.2'
default[:nginx][:ssl_prefer_server_ciphers] = 'on'
default[:nginx][:ssl_ciphers] = 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AES:RSA+3DES:!ADH:!AECDH:!MD5:!DSS'
default[:nginx][:ssl_session_cache] = 'shared:SSL:10m'

# stapling support
default[:nginx][:ssl_stapling] = 'on'
default[:nginx][:ssl_stapling_verify] = 'off'
default[:nginx][:ssl_trusted_certificate] = nil

default[:nginx][:worker_processes] = 1
default['nginx']['worker_rlimit_nofile'] = nil

default[:nginx][:worker_connections] = 1024
default['nginx']['multi_accept']     = false
default['nginx']['event']            = nil

default['nginx']['server_names_hash_bucket_size'] = 64
default[:nginx][:sendfile] = 'on'
default[:nginx][:servertokens] = 'off'
default[:nginx][:keepalive] = 'on'
default[:nginx][:keepalive_timeout] = 65
default[:nginx][:tcp_nopush] = 'on'
default[:nginx][:tcp_nodelay] = 'on'


default[:nginx][:gzip] = 'on'
default['nginx']['gzip_http_version'] = "1.0"
default['nginx']['gzip_comp_level']   = "2"
default['nginx']['gzip_proxied']      = "any"
default['nginx']['gzip_vary']         = "off"
default['nginx']['gzip_buffers']      = nil
default['nginx']['gzip_types']        = [
  "text/plain",
  "text/css",
  "application/x-javascript",
  "text/xml",
  "application/xml",
  "application/xml+rss",
  "text/javascript",
  "application/javascript",
  "application/json"
]

default['nginx']['disable_access_log'] = false
default['nginx']['types_hash_max_size'] = 2048
default['nginx']['types_hash_bucket_size'] = 64
default['nginx']['proxy_read_timeout'] = 60
default['nginx']['client_max_body_size'] = '1000m'
default['nginx']['client_body_buffer_size'] = '128k'


