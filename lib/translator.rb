# require modules here
require "yaml"
hash = YAML.load_file("./lib/emoticons.yml")

def load_library(hash)
  # code goes here
  emoticons_file = YAML.load_file('./lib/emoticons.yml')
  
  emoticons = {"get_meaning" => {},
               "get_emoticon" => {}}
  emoticons_file.each do |meaning, value|
    eng = value[0]
    jp = value[1]
    
    emoticons["get_meaning"][jp] = meaning
    emoticons["get_emoticon"][eng] = jp
  end
  return emoticons
end

def get_japanese_emoticon(emoticon_file, emoticon)
  # code goes here
  emoticon_file = load_library(emoticon_file)
  jp_emoticon = emoticon_file['get_emoticon'][emoticon]
  jp_emoticon ? jp_emoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_file, emoticon)
  # code goes here
  emoticon_file = load_library(emoticon_file)
  eng_meaning = emoticon_file['get_meaning'][emoticon]
  eng_meaning ? eng_meaning : 'Sorry, that emoticon was not found'
end