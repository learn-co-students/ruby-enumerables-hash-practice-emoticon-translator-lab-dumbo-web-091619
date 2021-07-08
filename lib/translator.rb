# require modules here
require "yaml"
  
def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  memo = { get_meaning: {}, get_emoticon: {} }
  
  english_index = 0
  japanese_index = 1
  
  emoticons.reduce( memo ) do |memo, (english_meaning, emoticons)|
    japanese_emoticon = emoticons[japanese_index]
    english_emoticon = emoticons[english_index]
    memo[:get_meaning][japanese_emoticon] = english_meaning
    memo[:get_emoticon][english_emoticon] = japanese_emoticon
    memo
  end
  
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  japanese_emoticon = emoticon_hash[:get_emoticon][emoticon]
  sorry_message = "Sorry, that emoticon was not found"
  return japanese_emoticon ? japanese_emoticon : sorry_message  
end

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  english_meaing = emoticon_hash[:get_meaning][emoticon]
  sorry_message = "Sorry, that emoticon was not found"
  return english_meaing ? english_meaing : sorry_message
end