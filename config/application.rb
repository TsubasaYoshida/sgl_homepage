require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SglHomepage
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # アセットの自動生成を制御
    config.generators do |g|
      g.assets false
    end

    # タイムゾーン指定
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja

    # time型のカラムの値でorder句を書いた場合に、JSTの値に変換してからソートするようにする
    config.active_record.time_zone_aware_types = [:datetime, :time]

    # エラーメッセージ日本語化
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
  end
end
