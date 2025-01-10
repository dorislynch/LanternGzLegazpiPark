
Pod::Spec.new do |s|
  s.name         = "RNLanternGzLegazpiPark"
  s.version      = "1.0.1"
  s.summary      = "RNLanternGzLegazpiPark"
  s.description  = <<-DESC
                  RNLanternGzLegazpiPark
                   DESC
  s.homepage     = "https://github.com/dorislynch/LanternGzLegazpiPark"
  s.license      = "MIT"
                   # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dorislynch/LanternGzLegazpiPark.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true

  s.preserve_paths = 'README.md', 'package.json', 'index.js'
  s.resources = ['fonts/*.ttf']              
                 
  s.dependency 'React'
  s.dependency 'CocoaSecurity'
  s.dependency 'AFNetworking'
  s.dependency 'GCDWebServer'
  #s.dependency "others"

end

  