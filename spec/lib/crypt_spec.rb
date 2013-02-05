require 'spec_helper'
require 'crypt'

describe HipChatSecrets::Crypt do
  # The subject is static methods / don't create an object
  subject { HipChatSecrets::Crypt }

  before do
    subject.secret = 'not the real secret'
  end

  it "tests with a phoney secret" do
    subject.secret_str.should eq 'not the real secret'
  end

  it "xor of string => string" do
    subject.xor('hello').should be_a_kind_of String
  end

  it "xor of xor of string => string" do
    result = subject.xor(subject.xor 'hello')
    result.should be_a_kind_of String
    result.should eq 'hello'
  end

  it "decodes secrets" do
    subject.decode('Hg4aRBUb').should eq 'pandas'
  end

  it "encodes secrets" do
    subject.encode('pandas').should eq 'Hg4aRBUb'
  end

  it "is symmetric" do
    subject.decode(subject.encode 'pandas').should eq 'pandas'
  end

  it "is symmetric even with long strings" do
    subject.decode(subject.encode 'Hello, I noticed that you are reading my code. Enjoy and happy hacking!'*20)
      .should eq 'Hello, I noticed that you are reading my code. Enjoy and happy hacking!'*20
  end

end
