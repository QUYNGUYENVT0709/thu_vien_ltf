require 'json'
require 'digest'
puts "Dang quet thu vien de tao ltf_manifest.json..."
manifest = {}
Dir.glob("**/*.skp").each do |file_path|
  file_hash = Digest::SHA256.file(file_path).hexdigest
  chuoi_duong_dan = file_path.gsub("\\", "/")
  manifest[chuoi_duong_dan] = file_hash
  puts "Da quet: #{chuoi_duong_dan}"
end
File.open("ltf_manifest.json", "w") do |f|
  f.write(JSON.pretty_generate(manifest))
end
puts "\nThanh cong! Da quet #{manifest.keys.length} file."
puts "Hay day file ltf_manifest.json nay cung voi cac file .skp len GitHub."