# crypt.rb
require 'base64'

module HipChatSecrets
  class Crypt

    def self.encode str
      Base64::encode64(xor str).strip
    end

    def self.decode str
      xor Base64::decode64(str)
    end

    def self.xor input
      input = input.unpack 'U*'
      output = []

      input.each_with_index do |num,index|
        output << (num ^ secret[index%secret.length])
      end

      output.pack 'U*'
    end

    # You have to figure out the Secret on your own. Good luck!

    def self.secret
      return @@key if defined? @@key
      key_file = File.expand_path('~/.hipchat_secret')

      self.secret =
        if ENV['HIPCHAT_SECRET']
          ENV['HIPCHAT_SECRET']
        elsif File.exists? key_file
          File.open(key_file, 'r') {|f| f.read }
        else
          raise "Could not locate HipChat Secret Key in HIPCHAT_SECRET or #{key_file}"
        end
    end

    def self.secret= key
      @@key = key.unpack 'U*'
    end

    def self.secret_str
      secret.pack 'U*'
    end

  end
end
