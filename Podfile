platform :ios, '9.0'
use_frameworks!

target 'NTSnippets' do
  pod 'ReactiveCocoa', '~> 5.0.0-alpha.3'
  pod 'RxSwift', '~> 3.0.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '3.0'
            
            # http://stackoverflow.com/a/38309091
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
            config.build_settings['EMBEDDED_CONTENT_CONTAINS_SWIFT'] = 'NO'
            
            # http://www.aerisweather.com/blog/playing-nicely-together-swift-dependencies-and-cocoapods/
            config.build_settings['CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES'] = 'YES'
        end
    end
end
