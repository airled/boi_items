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

  def all_images
    Dir.glob('./source/images/*').reject { |img| img.include?('favicon') }
  end

  task :get do
    require_relative('./img_fetcher.rb')
    Img_fetcher.new.fetch
    puts all_images.size.to_s + ' images got.'
  end

  task :clear do
    images = all_images
    amount = images.size
    images.map { |img| File.delete(img) }
    puts "\e[31m#{amount} images deleted.\e[0m"
  end

  task :reget => [:clear, :get] do
  end

end

task :rebuild => ['imgs:clear', 'imgs:get', :build] do
end

task :update => ['imgs:clear', 'imgs:get', :build, :deploy] do
end
