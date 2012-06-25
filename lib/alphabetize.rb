require "alphabetize/version"

module Alphabetize
  def alphabetize_file
    file = File.new(filename)

    lines = file.readlines
    lineHash = gem_hash(lines)

    backupFilename = "old_#{filename}"
    %x( mv #{filename} #{backupFilename})

    file = File.open(filename, 'w')
    file.truncate(0) # clear the file
    lineHash.keys.sort.each do |gem|
      line = lineHash[gem]
      file.puts(line)
    end
    file.close

  end

  def gem_hash(lines)
    hash = {}

    lines.each do |line|
      match_data = line.scan(/(\"([^"]*)\")|(\'([^']*)\')/)
      # The gem is either the second element or the 4th element of the array
      gem ||= match_data[0][1]
      gem ||= match_data[0].last

      hash[gem] = line
    end

    hash
  end
end
