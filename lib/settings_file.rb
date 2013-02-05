require 'json'

module HipChatSecrets
  class SettingsFile
    attr_reader :config_file, :config

    def initialize setting_path=nil
      @config_file = find_configs(setting_path).first
      parse_config
    end

    # pass unknown method calls to the config object
    def method_missing meth, *args, &block
      if @config.include? meth.to_s
        @config[meth.to_s]
      else
        super
      end
    end

  private

    def find_configs additional_path=nil
      possible_configs = [
        additional_path,
        "~/Library/Preferences/com.hipchat.*/Local Store/hipchatConfig.json",
        # TODO: where does windows stash this file?
        # TODO: where does linux stash this file?
      ].compact.map {|path| File.expand_path path }

      Dir[*possible_configs]
    end

    def parse_config
      config_data = File.open(@config_file,'r') {|f| f.read }

      begin
        @config = JSON.parse config_data
      rescue JSON::ParserError => e
        raise e.exception("I cannot parse #{@config_file}! Is is a valid JSON hipchatConfig.json? (I doubt it!)")
      end


      # verify that config smells right
      # ['firstLogin','email'].each do |key|
      #   unless @config.include? key
      #     puts %Q{I was expecting key '#{key}' in the config, but it's missing. Strange.}
      #   end
      # end

      raise "The 'password' key is missing! I cannot continue." unless @config.include? 'password'
    end

  end
end
