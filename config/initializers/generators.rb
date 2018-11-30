# これで、CSS, JS, Helper 関係のファイルは自動生成されません。
# また、Router にルーティングを自動的に追加することもありません。

Rails.application.config.generators do |g|
  g.stylesheets false
  g.javascripts false
  g.helper false
  g.skip_routes true
end