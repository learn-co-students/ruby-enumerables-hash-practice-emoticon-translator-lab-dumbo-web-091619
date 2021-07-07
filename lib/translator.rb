require "yaml"
def load_library(path)
  emo_file = YAML.load_file(path)
  out = {get_emoticon: {}, get_meaning: {}}
  emo_file.each do |key, val|
    out[:get_emoticon][val[0]] = val[1]
    out[:get_meaning][val[1]] = key
  end
  out
end

def get_japanese_emoticon(path, emote)
  hash = load_library(path)[:get_emoticon]
    if !hash.key?(emote)
      return "Sorry, that emoticon was not found"
    end
    hash[emote]
end

def get_english_meaning(path, emote)
  hash = load_library(path)[:get_meaning]
  return "Sorry, that emoticon was not found" if !hash.key?(emote)
  hash[emote]
end