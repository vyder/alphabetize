$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

require 'alphabetize/version'

module Alphabetize
  def self.alphabetize_file
    filename = "Gemfile"
    file = File.new(filename)

    lines = file.readlines
    fileGroups = file_hash(lines)

    backupFilename = "old_#{filename}"
    %x( mv #{filename} #{backupFilename})

    file = File.open(filename, 'w')
    # file.truncate(0) # clear the file

    fileGroups.each do |group|
      group.keys.sort.each do |gem|
        line = group[gem]
        file.puts(line)
      end
      file.puts("")
    end

    file.close

  end

  private
  def self.file_hash(lines)
    groups = []
    group_lines = []
    lines.each do |line|
      if line == "\n" and !group_lines.empty?
        group = gem_hash(group_lines)
        groups << group
        group_lines = [] # reset group lines
      else
        group_lines << line if line != "\n"
      end
    end

    if !group_lines.empty?
      group = gem_hash(group_lines)
      groups << group
    end

    groups
  end

  def self.gem_hash(lines)
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
