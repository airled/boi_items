task :build do
  system('bundle exec middleman build')
end

task :server do
  system('bundle exec middleman server')
end

task :imgs do
  require_relative('./source/img_fetcher.rb')
  Img_fetcher.new.fetch
end

task :deploy do
  system('bundle exec middleman deploy')
end
