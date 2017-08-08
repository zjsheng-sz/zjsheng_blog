# Customise this file, documentation can be found here:
# https://github.com/fastlane/fastlane/tree/master/fastlane/docs
# All available actions: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Actions.md
# can also be listed using the `fastlane actions` command

# Change the syntax highlighting to Ruby
# All lines starting with a # are ignored when running `fastlane`

# If you want to automatically update fastlane if a new version is available:
# update_fastlane

# This is the minimum version number required.
# Update this, if you use features of a newer version
fastlane_version "1.99.0"

default_platform :ios

platform :ios do
  before_all do
    # ENV["SLACK_URL"] = "https://hooks.slack.com/services/..."
    
  end
  
  
    def prepare_version(options)
      #say 'version number:'
      #say options[:version]
      increment_version_number( version_number: options[:version], xcodeproj: PROJECT_FILE_PATH)
      #say 'build number:'
      #say options[:build]
      increment_build_number( build_number: options[:build], xcodeproj: PROJECT_FILE_PATH )
    end

    def update_app_identifier(app_id)
        update_info_plist(
                          xcodeproj:PROJECT_FILE_PATH,
                          app_identifier:app_id,
                          plist_path:"#{PLIST_FILE_PATH}"
                          )
          update_info_plist(
              xcodeproj:PROJECT_FILE_PATH,
              app_identifier:app_id,
              plist_path:"#{UNITTEST_PLIST_FILE_PATH}"
          )
    end

    def set_info_plist_value(path,key,value)
        sh"/user/libexec/plistBuddy -c\"set:#{key} #{value}\" #{path}"
    end

    def set_channel_id(channelId)
        set_info_plist_value(
                             "./../xxxxxxx",
                             'ChannelID',
                             "#{channelId}"
                             )
    end
  

  OUTPUT_NAME = 'SCHCAEEOA.ipa'
  OUTPUT_DIRECTORY = '../../version/'
  FIR_TOKEN = 'ed9eae93673e8096b80f3e3be1f14750'
  FIR_MESSAGE = "update"
  SCHEME = "SHCAEEOA"
  SDK = "iphoneos9.3"

  desc "Deploy a new version to the App Store"
  lane :appstore do
    # match(type: "appstore")
    # snapshot
    #gym 打包   
    #
    
 
    gym(
	  sdk: SDK,
	  scheme:SCHEME,
          output_name:OUTPUT_NAME,
          output_directory:OUTPUT_DIRECTORY,
          export_method:'app-store')

    sh("fir publish #{OUTPUT_DIRECTORY}#{OUTPUT_NAME} -T #{FIR_TOKEN} -c #{FIR_MESSAGE}")
    #deliver(force: true)
    # frameit
  end 

  desc "Deploy a new version to the ad-hoc"
  lane :ad_hoc do
      
      increment_build_number
      sh''

      #cert
      #sigh(force: true)
 
      #match(type: "adhoc")

      #gym 打包    
      gym(
	  sdk:SDK,
	  scheme:SCHEME,
          output_name:OUTPUT_NAME,
          output_directory:OUTPUT_DIRECTORY,
          export_method:'ad-hoc')

      #上传到fir
      sh("fir publish #{OUTPUT_DIRECTORY}#{OUTPUT_NAME} -T #{FIR_TOKEN} -c #{FIR_MESSAGE}")
          
  end
  
  
  
  desc "Deploy a new entprise in_home version"
  lane :inhouse do
      # snapshot
      #gym 打包    
      gym(
	  sdk:SDK,
	  scheme:SCHEME,
          output_name:OUTPUT_NAME,
          output_directory:OUTPUT_DIRECTORY,
          export_method:'enterprise')

      #上传到fir
      sh("fir publish #{OUTPUT_DIRECTORY}#{OUTPUT_NAME} -T #{FIR_TOKEN} -c #{FIR_MESSAGE}")
      # frameit
  end


  # You can define as many lanes as you want

  after_all do |lane|
    # This block is called, only if the executed lane was successful

    # slack(
    #   message: "Successfully deployed new App Update."
    # )
  end

  error do |lane, exception|
    # slack(
    #   message: exception.message,
    #   success: false
    # )
  end
end


# More information about multiple platforms in fastlane: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
# All available actions: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Actions.md

# fastlane reports which actions are used
# No personal data is recorded. Learn more at https://github.com/fastlane/enhancer
