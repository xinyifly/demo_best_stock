Gem::Specification.new do |s|
  s.name = 'demo_best_stock'
  s.version = '0.1.1'
  s.summary = 'Find the stock that increased most'
  s.author = 'Zeyu Chen'
  s.files = Dir['LICENSE', 'lib/**/*', 'bin/*']

  s.license = 'GPL-3.0'
  s.homepage = 'https://github.com/xinyifly/demo_best_stock'

  s.add_development_dependency 'minitest', '~> 5.11'
  s.add_development_dependency 'rake', '~> 12.3'

  s.executables << 'demo_best_stock'
end
