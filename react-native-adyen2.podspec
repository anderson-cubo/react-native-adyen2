require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-adyen2"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  react-native-adyen2
                   DESC
  s.homepage     = "https://github.com/anderson-cubo/react-native-adyen2"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author       = { "author" => "oi@andersonribeiro.me" }
  s.platform     = :ios, "10.3"
  s.source       = { :git => "https://github.com/anderson-cubo/react-native-adyen2.git", :tag => "#{s.version}" }

  s.swift_version = "5.0"

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
  s.dependency "Adyen", "~> 3.0.1"
end

