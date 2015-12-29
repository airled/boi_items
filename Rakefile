task default: :rebuild

task :build => :cookies do
  system('middleman build')
end

task :server do
  system('middleman server')
end

task :deploy do
  system('middleman deploy')
end

task :cookies do
  require_relative './cookies_fetcher'
  Cookies_fetcher.new.run
end

task :rebuild => ['imgs:clear', 'imgs:get', :build] do
end

task :update => [:rebuild, :deploy] do
end

namespace :imgs do

  def all_images
    Dir.glob('./source/images/*').reject { |img| img.include?('favicon') }
  end

  task :get => :cookies do
    require_relative './img_fetcher.rb'
    Img_fetcher.new.fetch
    puts "\e[32m#{all_images.size.to_s} images got.\e[0m"

  end

  task :clear do
    images = all_images
    amount = images.size
    images.map { |img| File.delete(img) }
    puts "\e[31m#{amount} images deleted.\e[0m"
  end

  #aliases
  task :c => :clear do
  end
  task :g => :get do
  end
  
end

#aliases
task :b => :build do
end
task :s => :server do
end
task :rb => :rebuild do
end
task :d => :deploy do
end
task :u => :update do
end
