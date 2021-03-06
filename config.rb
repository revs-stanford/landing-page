
activate :i18n, :mount_at_root => :en
activate :livereload
activate :directory_indexes
set :relative_links, true
activate :relative_assets

set :trailing_slash, true
set :markdown_engine, :kramdown
set :markdown, :layout_engine => :slim,
  tables: true,
  coderay_line_numbers: nil

## site specific stuff
set :site_title, 'Data Driven'
set :site_description, "REVS/Stanford/Stanford Journalism Data Driven conference"
set :typekit_id, 'bwq4gyt' #'deu1taf'
# set :google_analytics_id, 'UA-55019978-1'


# Slim configuration
set :slim, {
  :format  => :html5,
  :indent => '    ',
  :pretty => true,
  :sort_attrs => false
}
::Slim::Engine.set_default_options lang: I18n.locale, locals: {}

# Compass configuration
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :files_dir, 'assets/files'
set :contact_info, ['Peter Johnson', 'peterjoh@stanford.edu']

# Build-specific configuration
configure :build do


  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end



activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'revs-landing-beta' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.delete                     = false # We delete stray files by default.
  s3_sync.after_build                = true # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = false
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
end

