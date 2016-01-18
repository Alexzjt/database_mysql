class OneHundredThousandWordFrequencyList < ActiveRecord::Base
  def self.word_frequency_hash
    frequency_hash = Hash.new(0)
    OneHundredThousandWordFrequencyList.all.each do |item|
      frequency_hash[item.word] = item.id*(-1)
    end
    return frequency_hash
  end
end
