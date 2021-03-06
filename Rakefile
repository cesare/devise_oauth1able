require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "devise_oauth1able"
    gem.summary = %Q{OAuth1.x plugin for Devise}
    gem.description = %Q{OAuth1.x plugin for Devise}
    gem.email = "cesare@mayverse.jp"
    gem.homepage = "http://github.com/cesare/devise_oauth1able"
    gem.authors = ["SAWADA Tadashi"]
    gem.add_dependency "oauth", "~> 0.4.2"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.files = FileList['app/**/*', 'lib/**/*', 'LICENSE', 'README.rdoc', 'Rakefile', 'Gemfile', 'Gemfile.lock', 'VERSION', '*.gemspec'].to_a
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "devise_oauth1able #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
