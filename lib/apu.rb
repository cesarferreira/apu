require 'optparse'
require 'colorize'
require 'fileutils'
require 'apu/version'
require 'apu/android_project'
# require 'pry'

module Apu
  class MainApp
    def initialize(arguments)

      # defaults
      @app_path = Dir.pwd
      @package_flag = false
      @uninstall_flag = false
      @install_flag = false
      @android_home_flag = false
      @launcher_flag = false
      @run_flag = false
      @clear_flag = false
      @android_studio_flag = false

      @require_analyses = true

      # if !!arguments
      #     arguments.push '-h'
      # end

      # Parse Options
      create_options_parser(arguments)

      manage_opts

    end

    ##
    ## Manage options
    ##
    def manage_opts

      if @require_analyses
        # instatiate android project
        android_project = AndroidProject.new(@app_path)

        # is a valid android project?
        unless android_project.is_valid
          puts "#{@app_path.red} is not a valid android project"
          exit
        end
      end

      if @package_flag
        puts android_project.get_package_name.green
      end

      if @uninstall_flag
        android_project.uninstall_application
      end

      if @install_flag
        android_project.install
      end

      if @android_home_flag
        puts android_home_is_defined
      end

      if @launcher_flag
        puts android_project.get_launchable_activity.green
      end

      if @android_studio_flag
        system('open -a Android\ Studio ' + @app_path)
      end

      if @run_flag
        #android_project.install
        system(android_project.get_execute_line)
      end

      if @clear_flag
        android_project.clear_app_data
      end
    end

    def create_options_parser(args)
      #@opt_parser = OptionParser.new do |opts|
      args.options do |opts|
        opts.banner = "Usage: apu [OPTIONS]"
        opts.separator  ''
        opts.separator  "Options"

        opts.on('-p PATH', '--path PATH', 'Custom path to android project') do |app_path|
          @app_path = app_path if @app_path != '.'
        end

        opts.on('-k', '--package', 'Retrieves package name (eg. com.example.app)') do |value|
          @package_flag = true
        end

        opts.on('-u', '--uninstall', 'Uninstalls the apk from your device') do |app_path|
          @uninstall_flag = true
        end

        opts.on('-i', '--install', 'Installs the apk on your device') do |install|
          @install_flag = true
        end

        opts.on('-a', '--android-home', 'Checks if the ANDROID_HOME variable is defined') do |home|
          @android_home_flag = true
          @require_analyses = false
        end

        opts.on('-l', '--launcher', 'Get the launcher activity path') do |app_path|
          @launcher_flag = true
        end

        opts.on('-o', '--open', 'Open the build on the device') do |flavour|
          @run_flag = true
        end

        opts.on('-A', '--android-studio', 'Opens project on android studio') do |flavour|
          @android_studio_flag = true
        end

        opts.on('-c', '--clear', 'Clear app data') do |flavour|
          @clear_flag = true
        end

        opts.on('-r', '--release', 'Create release version and opens the folder') do |flavour|
          @clear_flag = true
        end

        opts.on('-h', '--help', 'Displays help') do
          @require_analyses = false
          puts opts.help
          exit
        end
        opts.on('-v', '--version', 'Displays version') do
          @require_analyses = false
          puts Apu::VERSION
          exit
        end
        opts.parse!

      end
    end

    def android_home_is_defined
      sdk = `echo $ANDROID_HOME`.gsub("\n",'')
      !sdk.empty?
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
