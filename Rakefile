task :build do
  system('middleman build')
end

task :server do
  system('middleman server')
end

task :imgs do
  require_relative('./source/img_fetcher.rb')
  Img_fetcher.new.fetch
end

task :deploy do
  system('middleman deploy')
end
