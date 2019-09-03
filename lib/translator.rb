require 'yaml'
require 'pry'
def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |english_word, emoticon_set|
    emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon_eng)
  emoticon_hash = load_library(path)
  check_keys = emoticon_hash["get_emoticon"].keys
  if check_keys.include?(emoticon_eng)
    return emoticon_hash["get_emoticon"][emoticon_eng]
  else
    return "Sorry, that emoticon was not found"
  end  
end

def get_english_meaning(path, emoticon_jpn)
  emoticon_hash = load_library(path)
  check_keys = emoticon_hash["get_meaning"].keys
  if check_keys.include?(emoticon_jpn)
    return emoticon_hash["get_meaning"][emoticon_jpn]
  else  
    return "Sorry, that emoticon was not found"
  end
end