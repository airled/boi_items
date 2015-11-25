task :build do
  system('middleman build')
end

task :server do
  system('middleman server')
end

task :deploy do
  system('middleman deploy')
end

namespace :imgs do

  task :get do
    require_relative('./img_fetcher.rb')
    Img_fetcher.new.fetch
  end

  task :clear do
    imgs = Dir.glob('./source/images/*').reject { |img| img.include?('favicon') }
    amount = imgs.size
    imgs.map { |img| File.delete(img) }
    puts "\e[31m#{amount} images deleted.\e[0m"
  end

  task :reget => [:clear, :get] do
  end

end
