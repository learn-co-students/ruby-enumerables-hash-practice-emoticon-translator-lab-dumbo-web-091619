 require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  
  emoticons.each do |k, v|
    new_hash['get_emoticon'][v[0]] = emoticons[k][1]
    new_hash['get_meaning'][v[1]] = k
  end
  new_hash
end

def get_japanese_emoticon (file_path, emoji)
  result = load_library(file_path)['get_emoticon'][emoji]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoji)
  result = load_library(file_path)['get_meaning'][emoji]
  result ? result : "Sorry, that emoticon was not found"
end