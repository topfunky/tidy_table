Dir['vendor/**/lib'].each do |dir|
  $: << dir
end

require 'rubygems'
require 'isolate/now'
require 'spec'

require File.dirname(__FILE__) + "/../lib/tidy_table"
