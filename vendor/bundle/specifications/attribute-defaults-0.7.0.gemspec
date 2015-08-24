# -*- encoding: utf-8 -*-
# stub: attribute-defaults 0.7.0 ruby lib

Gem::Specification.new do |s|
  s.name = "attribute-defaults"
  s.version = "0.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dimitrij Denissenko"]
  s.date = "2014-08-04"
  s.description = "ActiveRecord plugin that allows to specify default values for attributes"
  s.email = "dimitrij@blacksquaremedia.com"
  s.homepage = "https://github.com/bsm/attribute-defaults"
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.4.5"
  s.summary = "Specify default values for ActiveRecord attributes"

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["< 5.0.0", ">= 4.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["< 5.0.0", ">= 4.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["< 5.0.0", ">= 4.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
