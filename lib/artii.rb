# This gem takes a string and outputs ASCII art, generated by the
# FIGLET library. While it defaults to the 'big' font, an optional
# flag can be passed (-f or --font) with a string following it
# (e.g., slant) that will change the font that is used.
#
# The ruby Figlet implementation was written by Tim Fletcher
# (twoggle@gmail.com), and will only be curosrily maintained
# by the author of this rubygem (Michael Tierney,
# dev@panpainter.com).
#
# Author::    Michael Tierney (mailto:dev@panpainter.com)
# Copyright:: Copyright (c) 2010 Michael Tierney
# License::   Distributed under the MIT License

require 'rubygems'

$: << File.dirname(__FILE__)

require 'artii/base'

module Artii
  FONTPATH = File.expand_path(File.dirname(__FILE__) + '/../lib/figlet/fonts')

  def self.is_19?
    RUBY_VERSION[0, 3] == "1.9"
  end

  def self.encoding_of(string)
    if is_19?
      string.encoding.to_s 
    else 
      $KCODE
    end
  end

  def self.raise_19_incompat
    if is_19?
      raise "Artii::Figlet is not compatible with Ruby 1.9 at this time"
    end
  end
end

if !Artii.is_19?
  require 'artii/figlet'
end