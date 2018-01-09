require 'thor'
require 'lyrics_finder'

module LyricsFinder
  class CLI < Thor
    desc 'search -a "author" -t "song"', 'Search the lyrics for the specified author and song'
    method_option 'author', :aliases => '-a', :type => :string
    method_option 'title', :aliases => '-t', :type => :string
    def search
      begin
        puts LyricsFinder.search(options[:author], options[:title])
      rescue SocketError => ex
        puts "lyrics_finder can't connect to the internet"
      rescue OpenURI::HTTPError => ex
        puts "lyrics_finder can't find any matching lyrics for that song"
      end
    end
  end
end