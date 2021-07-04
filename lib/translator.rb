# require modules here
require 'yaml'
require "pathname"
path = Pathname.new("./lib/emoticons.yml")

def load_library(path)
  emoticons = YAML.load_file(path)
  # code goes here
  emoticon_hash = {
     "get_meaning" => {},
     "get_emoticon" => {}
   }
  emoticons.each do |meaning, emoticons|
    english_emoticon = emoticons[0]
    japanese_emoticon = emoticons[-1]
    emoticon_hash["get_meaning"][japanese_emoticon] = meaning
    emoticon_hash["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)
  if emoticon_hash["get_emoticon"].include?(emoticon)
    emoticon_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)

  if emoticon_hash["get_meaning"].include?(emoticon)
    emoticon_hash["get_meaning"][emoticon]
  else
     "Sorry, that emoticon was not found"
  end
end
