# require modules here

require 'yaml'


def load_library(file_path)
  emoticons = { "emoticon_meaning" => {}, "emoticons" => {} }
  library = YAML.load_file("#{file_path}").each do | meaning, symbols |
    
    english, japanese = symbols
    
    emoticons["emoticon_meaning"][japanese] = meaning
    emoticons["emoticons"][english] = japanese
    symbols.each do |name|
      name = {:english => english, :japanese =>japanese}
   end
 end
emoticons
end



def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path) 
  input = emoticons["emoticons"][emoticon]
  if input
    input
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticons = load_library(file_path)
  translation = emoticons["emoticon_meaning"][emoticon]
  if translation
    translation
  else
    "Sorry, that emoticon was not found"
  end
end