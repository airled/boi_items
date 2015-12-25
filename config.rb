set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

set :slim, {:format => :html}

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html do |html|
    html.remove_intertag_spaces = true
  end  
  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method          = :ftp
  deploy.host            = 'ftp.boi.96.lt'
  deploy.path            = '/public_html'
  deploy.user            = ENV['FTP_USER']
  deploy.password        = ENV['FTP_PASS']
end
