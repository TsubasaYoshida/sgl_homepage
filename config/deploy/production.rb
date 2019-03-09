# conohaのサーバーのIP、ログインするユーザー名、サーバーの役割
# 10022はポートを変更している場合。通常は22
server '118.27.36.112', user: 'tsubasayoshida', roles: %w{app db web}, port: 10022

#デプロイするサーバーにsshログインする鍵の情報。サーバー編で作成した鍵のパス
set :ssh_options, keys: '~/.ssh/satsu6/id_rsa'