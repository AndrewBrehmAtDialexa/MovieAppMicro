Pod::Spec.new do |s|
  s.name         = "MyLocalPod"
  s.version      = "0.1.0"
  s.summary      = "A local pod for demonstration purposes."
  s.description  = "A local pod for demonstration purposes."
  s.homepage     = "https://example.com"
  s.license      = "MIT"
  s.author       = { "Your Name" => "your.email@example.com" }
  s.source       = { :path => '.' }

  s.platform     = :ios, "13.0"
  s.swift_version = "5.0"

  s.source_files = "Classes/**/*.swift"
end
