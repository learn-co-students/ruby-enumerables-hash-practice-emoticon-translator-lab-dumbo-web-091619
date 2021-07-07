require "yaml"

def load_library (file)
  library = YAML.load_file(file)
  new_hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }
  
  library.each do |key, value|
    new_hash['get_emoticon'][value[0]] = library[key][1]
    new_hash['get_meaning'][value[1]] = key
  end
  
  new_hash
end

def get_japanese_emoticon (file, emoticon)
  jap_version = load_library(file)['get_emoticon'][emoticon]
  jap_version ? jap_version : "Sorry, that emoticon was not found"
end

def get_english_meaning (file, emoticon)
  eng_meaning = load_library(file)['get_meaning'][emoticon]
  eng_meaning ? eng_meaning : "Sorry, that emoticon was not found"
end