describe LyricsFinder do
  describe '#search' do
    context 'With LyricsWikia as the provider' do
      before :each do
        allow(LyricsFinder::Provider).to receive(:list).and_return([LyricsFinder::Provider::LyricsWikia])
        VCR.use_cassette 'LyricsWikia 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SampleSongs::LYRICS_WIKIA_EXAMPLE
      end
    end

    context 'With SongLyrics as the provider' do
      before :each do
        allow(LyricsFinder::Provider).to receive(:list).and_return([LyricsFinder::Provider::SongLyrics])
        VCR.use_cassette 'SongLyrics 200 search' do
          @song = LyricsFinder.search("american authors", "best day of my life")
        end
      end

      it 'returns an instance of Array' do
        expect(@song.class).to eq Array
      end

      it 'returns the desired song' do
        expect(@song).to eq SampleSongs::SONG_LYRICS_EXAMPLE
      end
    end

    context 'with a song that does not exist yet in any provider' do
      it 'raises HTTP Error' do
        expect{
          LyricsFinder.search('asdfqwerty', 'poiulkj')
        }.to raise_error(OpenURI::HTTPError)
      end
    end

    context 'with invalid parameters' do
      it 'raises HTTP Error' do
        expect{
          LyricsFinder.search('', '')
        }.to raise_error(OpenURI::HTTPError)
      end
    end
  end
end
