require 'yaml'

def load_library(file)
  library = YAML.load_file(file)
  emoji_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    emoji_hash["get_meaning"][emoticons[1]] = meaning
    emoji_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end

  emoji_hash
end

def get_japanese_emoticon(file_path, emoji)
  emoji_hash = load_library(file_path)
  
  unless emoji_hash["get_emoticon"][emoji] == nil
  
  translation = emoji_hash["get_emoticon"][emoji]
  
  p translation
  
else 
  p "Sorry, that emoticon was not found"
end
end 

def get_english_meaning(file_path, emoji)
  emoji_hash = load_library(file_path)
  
  unless emoji_hash["get_meaning"][emoji] == nil
  
  translation = emoji_hash["get_meaning"][emoji]
  
  p translation
  
else 
  p "Sorry, that emoticon was not found"
end
end 