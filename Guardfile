# More info at https://github.com/guard/guard#readme
interactor :off

guard 'bundler' do
  watch('Gemfile')
  watch(%r{\.gemspec$})
end

guard 'rspec', cli: '--drb' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})      { |m| "spec/lib/#{m[1]}_spec.rb" }

  # watch('config.yml.example')                 { "spec/misc/config_spec.rb" }
  watch('spec/spec_helper.rb')                { "spec" }
  watch(%r{^spec/support/(.+)\.rb$})          { "spec" }
end
