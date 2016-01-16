class WordFrequencyList < ActiveRecord::Base
  def self.word_frequency_hash
    frequency_hash = Hash.new(0)
    WordFrequencyList.all.each do |item|
      frequency_hash[item.word] = item.frequency
    end
    return frequency_hash
  end
end
