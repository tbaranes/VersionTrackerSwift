Pod::Spec.new do |s|

# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.name            	= "VersionTrackerSwift"
s.version          	= "1.0"
s.summary          	= "Versions tracker for your iOS, OS X, and tvOS app"
s.description      	= "Versions / builds tracker for your iOS, OS X, and tvOS app. Also useful to get information such as versions / builds history..."
s.homepage         	= "https://github.com/tbaranes/VersionTrackerSwift"
s.license      		= { :type => "MIT", :file => "LICENSE" }
s.author           	= { "Tom Baranes" => "tom.baranes@gmail.com" }
s.source           	= { :git => "https://github.com/tbaranes/VersionTrackerSwift.git", :tag => "#{s.version}" }

# ―――  Spec tech  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.ios.deployment_target		= '8.0'
s.tvos.deployment_target 	= '9.0'
s.osx.deployment_target 	= '10.10'
s.watchos.deployment_target = '2.0'

s.requires_arc 	   			= true
s.source_files				= 'Source/*.swift'

end