$:.unshift(File.dirname(__FILE__))

require 'gdata/http'
require 'gdata/client'
require 'gdata/auth'
# This is for Unicode "support"
require 'jcode' if RUBY_VERSION < '1.9'
$KCODE = 'UTF8'
