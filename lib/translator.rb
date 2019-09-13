require 'yaml'
require 'pry'

def load_library(file_path)
  file = File.read(file_path)
  emoticons = YAML.load(file)
  
  new_hash = {"get_emoticon": {}, "get_meaning": {} }
  
  temp_hash1 = {}
  emoticons.each do |english_meaning, emoticon_array|
    emoticon_array.each do |emoticon|
      temp_hash1[emoticon] = english_meaning
    #temp_hash[emoticon_array] = english_meaning
  end
  end
  
  temp_array = []
  emoticons.each do |english_meaning, emoticon_array|
    emoticon_array.each do |emoticon|
      temp_array.push(emoticon_array)
    end
  end
  
  temp_hash2 = Hash[temp_array.map { |eng_emoticon, jap_emoticon| [eng_emoticon, jap_emoticon]}]
  
    new_hash[:get_meaning] = temp_hash1
    new_hash[:get_emoticon] = temp_hash2
    
  return new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  
  if emoticon_hash[:get_emoticon][emoticon]
    return emoticon_hash[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
  

def get_english_meaning(file_path, emoticon)
  emoticon_hash = load_library(file_path)
  
  if emoticon_hash[:get_meaning][emoticon]
    return emoticon_hash[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  
end