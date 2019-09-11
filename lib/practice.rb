# require modules here
require "yaml"

def load_library(file_path)
  file = YAML.load_file(file_path)
  new_hash = {"get_meaning": {}, "get_emoticon": {}}
  
  file.each do |key,value|
    new_hash[:get_meaning].store(value[1],key)
    new_hash[:get_emoticon].store(value[0],value[1])
  end
  
 puts new_hash
  
end

def get_japanese_emoticon(file_path, emoticon)
  loaded = load_library(file_path)

  emoticons = loaded[:get_emoticon]
  
  emoticons.each do |key,value|
    if key == emoticon
      puts value
    end
  end
end

def get_english_meaning
  # code goes here
end

load_library("./lib/emoticons.yml")