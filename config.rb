require 'slim'
require "uglifier"

# activate :sprockets

# Prevent HTML minification in development
::Slim::Engine.set_options pretty: true, format: :html

# Methods defined in the helpers block are available in templates
helpers do
  def nav_active(path)
    current_page.path == path ? {:class => "active"} : {}
  end
end

set :css_dir,     'stylesheets'
set :js_dir,      'javascripts'
set :images_dir,  'images'
set :fonts_dir,   'fonts'

# Prevent asset concatenation in development
#set :debug_assets, true

# Define 404 page
# page "/404.html", :directory_index => false

# Build-specific configuration
configure :build do

# For example, change the Compass output style for deployment
  activate :minify_css, :inline => true

  # Minify Javascript
  activate :minify_javascript, :inline => true, :compressor => Uglifier.new(:mangle => false, :comments => :none)

  # Minify HTML
  activate :minify_html, remove_input_attributes: false

  # Enable cache buster
  #activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Image optimization
  activate :imageoptim do |options|
    # Use a build manifest to prevent re-compressing images between builds
    options.manifest = true

    # Silence problematic image_optim workers
    options.skip_missing_workers = true

    # Cause image_optim to be in shouty-mode
    options.verbose = false

    # Setting these to true or nil will let options determine them (recommended)
    options.nice = true
    options.threads = true

    # Image extensions to attempt to compress
    options.image_extensions = %w(.png .jpg .gif .svg)

    # Compressor worker options, individual optimisers can be disabled by passing
    # false instead of a hash
    options.advpng    = { :level => 4 }
    options.gifsicle  = { :interlace => false }
    options.jpegoptim = { :strip => ['all'], :max_quality => 100 }
    options.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
    options.optipng   = { :level => 6, :interlace => false }
    options.pngcrush  = { :chunks => ['alla'], :fix => false, :brute => false }
    options.pngout    = { :copy_chunks => false, :strategy => 0 }
    options.svgo      = {}
  end

  #activate :sitemap, :hostname => "http://"

end
