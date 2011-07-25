
require 'rubygems'
require 'hoe'
require './lib/tidy_table.rb'

Hoe.new('tidy_table', TidyTable::VERSION) do |p|
  p.rubyforge_name = 'seattlerb'
  p.author = 'Geoffrey Grosenbach'
  p.email = 'boss AT topfunky.com'
  p.summary = 'Yet another library for converting a struct into an HTML table.'
  p.description = p.paragraphs_of('README.txt', 0..1).join("\n\n")
  p.url = "http://rubyforge.org/projects/seattlerb"
  p.changes = p.paragraphs_of('History.txt', 0..1).join("\n\n")
end

desc "Test task (actually runs specs)"
task "test" do
  system "spec --format specdoc --color spec"
end
