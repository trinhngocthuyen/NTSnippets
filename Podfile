platform :ios, '9.0'
use_frameworks!

def shared_pods
    pod 'ReactiveCocoa', '~> 5.0.1'
    pod 'RxSwift', '~> 3.0.0'
    pod 'Alamofire', '4.2.0'
end

def testing_pods
    pod 'Quick', '1.0.0'
    pod 'Nimble', '5.1.0'
    pod 'Mockingjay', '2.0.0'
    pod 'Cuckoo', '0.8.2'
end

target 'NTSnippets' do
    shared_pods
end

target 'NTTesting' do
    testing_pods
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
