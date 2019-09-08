require 'YAML'

def load_library
  emoticons = YAML.load_file('emoticons.yml')
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emotocons[0]] = emotocons[1]
  end
  result
end

def get_japanese_emoticon
  library = load_library(file_path)
  if library["get_emoticon"].include?(english_emoticon)
    library["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end  
end

def get_english_meaning
  # code goes here
end
