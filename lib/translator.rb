require "yaml"

# def load_library(file)
# hash = {"get_meaning"=>{},"get_emoticon"=>{}}
#   YAML.load_file(file).each do |meaning,list|
#      eng,japn = list
#     hash["get_emoticon"][eng] = japn
#     hash["get_meaning"][japn] = meaning
#  end
#  hash
# end



def load_library(path)
  emoticons = YAML.load_file(path)
  emojis = {}
  emojis[:get_meaning] = {}
  emojis[:get_emoticon] = {}
  emoticons.each_pair do |meaning, (eng, jap)|
    emojis[:get_meaning][jap] = meaning
    emojis[:get_emoticon][eng] = jap
  end
  emojis
end


def get_japanese_emoticon(path, emoticon)
emojis = load_library(path)
jap_emoji = emojis[:get_emoticon].select { |eng, jap| eng == emoticon }.values.first
if jap_emoji
  return jap_emoji
else
  return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emojis = load_library(path)
  eng_meaning = emojis[:get_meaning].select { |jap, meaning| jap == emoticon }.values.first
  if eng_meaning
    return eng_meaning
  else
    return "Sorry, that emoticon was not found"
  end
end
