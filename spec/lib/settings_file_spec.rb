require 'spec_helper'
require 'settings_file'

describe HipChatSecrets::SettingsFile do

  context "with a valid config" do

    subject do
      HipChatSecrets::SettingsFile.new File.join(File.dirname(__FILE__), '../fixtures/hipchatConfig.json')
    end

    it "uses the fixture config" do
      subject.email.should eq 'test@pass.com'
    end

    it "can find a settings file" do
      subject.send(:find_configs).should be_a_kind_of Array
      subject.send(:find_configs,'~/a_file_that_shouldnt_exist').should be_a_kind_of Array
    end

    it "exposes the raw config" do
      subject.config.should be_a_kind_of Hash
    end

    it "exposes the config_file's path" do
      subject.config_file.should be_a_kind_of String
    end

    it "can pass missing method calls to the config hash" do
      subject.email.should be_a_kind_of String
      subject.password.should be_a_kind_of String
    end
  end

  context "with an invalid config" do
    subject do
      HipChatSecrets::SettingsFile.new File.join(File.dirname(__FILE__), '../fixtures/hipchatConfigBad.json')
    end

    it "aborts when the password is missing" do
      expect { subject }.to raise_error /'password' key is missing!/
    end
  end

  context "with a malformed config" do
    subject do
      HipChatSecrets::SettingsFile.new File.join(File.dirname(__FILE__), '../fixtures/hipchatConfigMalformed.json')
    end

    it "aborts when the config is garbage" do
      expect { subject }.to raise_error JSON::ParserError
    end
  end

end
