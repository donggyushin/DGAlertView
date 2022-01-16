Pod::Spec.new do |s|
    s.name             = 'DGAlertView'
    s.version          = '1.0.1'
    s.summary          = 'A simple custom popup dialog view for iOS written in Swift. Replaces UIAlertController alert style.'
    s.homepage         = 'https://github.com/donggyushin/DGAlertView'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'donggyushin' => 'donggyu9410@gmail.com' }
    s.source           = { :git => 'https://github.com/donggyushin/DGAlertView.git', :tag => s.version.to_s }
    s.ios.deployment_target = '12.0'
    s.swift_version = '5.5'
    s.source_files = 'Sources/DGAlertView/**/*'
  end
