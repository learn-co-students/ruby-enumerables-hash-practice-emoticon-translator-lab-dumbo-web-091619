# require modules here
require "yaml"

def load_library(file)
  file = YAML.load_file('./lib/emoticons.yml')
  emoticons = { :get_meaning => {}, :get_emoticon => {}}
  file.each do |meaning, describe|
    eng_emoticon, jap_emoticon = describe
    emoticons[:get_meaning][jap_emoticon] = meaning
    emoticons[:get_emoticon][eng_emoticon] = jap_emoticon
  end
  emoticons
  # code goes here
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library('./lib/emoticons.yml')
  result = emoticons[:get_emoticon][emoticon]
  result ?  result  : "Sorry, that emoticon was not found"
  # code goes here
end

def get_english_meaning(file, emoticon)
  emoticons = load_library('./lib/emoticons.yml')
  result = emoticons[:get_meaning][emoticon]
  result ?  result  : "Sorry, that emoticon was not found"
  # code goes here
end