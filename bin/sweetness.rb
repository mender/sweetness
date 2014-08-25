#!/usr/bin/env ruby
# coding: utf-8
$:.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'sweetness/cli'
Sweetness::Cli.new(ARGV).run