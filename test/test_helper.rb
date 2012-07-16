$:.unshift File.join(File.dirname(__FILE__), "..", "lib")

ENV['ENV'] = 'test'

require 'rubygems'
require 'algoruby'
require 'set'
require 'minitest/autorun'
require 'mocha'
