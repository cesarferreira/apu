require 'optparse'
require 'colorize'
require 'fileutils'
require 'apk-utils/version'
require 'apk-utils/android_project'

module ApkUtils
  class MainApp
    def initialize(arguments)

      @app_path = `pwd`.tr("\n","")

      create_options_parser
      #@url = ['-h', '--help', '-v', '--version'].include?(arguments.first) ? nil : arguments.shift

      @opt_parser.parse!(arguments)

    end

    def create_options_parser
      @opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: apk-utils PATH [OPTIONS]"
        opts.separator  ''
        opts.separator  "Options"

        opts.on('-k', '--package', 'Retrieves package name (eg. com.example.app)') do |app_path|

          android_project = get_android_project_object
          android_project.package

          exit
        end

        opts.on('-u', '--uninstall', 'Uninstalls the apk from your device') do |app_path|
          android_project = get_android_project_object
          android_project.uninstall_application
          exit
        end

        opts.on('-i', '--install', 'Installs the apk on your device') do |app_path|
          android_project = get_android_project_object
          android_project.install
          exit
        end

        opts.on('-a', '--android-home', 'Checks if the ANDROID_HOME variable is defined') do |home|
          p android_home_is_defined
          exit
        end

        opts.on('-l', '--launcher', 'Get the launcher activity path') do |app_path|
          android_project = get_android_project_object
          puts android_project.get_launchable_activity.green
          exit
        end

        opts.on('-p PATH', '--path PATH', 'Custom path to android project') do |app_path|
          @app_path = app_path
        end

        opts.on('-r FLAVOUR', '--run FLAVOUR', 'Run the build on the device') do |flavour|
          #get_execution_line_command(path_to_sample)
        end

        opts.on('-c', '--clear', 'Clear app data') do |flavour|
          android_project = get_android_project_object
          android_project.clear_app_data
        end

        opts.on('-h', '--help', 'Displays help') do
          puts opts.help
          exit
        end
        opts.on('-v', '--version', 'Displays version') do
          puts ApkUtils::VERSION
          exit
        end


      end
    end

    def android_home_is_defined
      sdk = `echo $ANDROID_HOME`.gsub("\n",'')
      !sdk.empty?
    end

    def get_android_project_object
      android_project = AndroidProject.new(@app_path)

      # is a valid android project?
      unless android_project.is_valid
        puts "#{@app_path.red} is not a valid android project"
        exit
      end
      return android_project
    end

    def call
      unless android_home_is_defined
        puts "\nWARNING: your #{'$ANDROID_HOME'.yellow} is not defined\n"
        puts "\nhint: in your #{'~/.bashrc'.yellow} add:\n  #{"export ANDROID_HOME=\"/Users/cesarferreira/Library/Android/sdk/\"".yellow}"
        puts "\nNow type #{'source ~/.bashrc'.yellow}\n\n"
        exit 1
      end


    end
  end
end
