class ReaderPageWord < ActiveRecord::Base
  def self.book_word_frequency_statistics(book_id)
    word_hash = Hash.new(0)
    ReaderPageWord.where("book_id = ?",book_id).select("list").each do |item|
      Oj.load(item.list).each do |word|
         if word_hash.has_key?(word)
           word_hash[word] += 1
         else
          word_hash[word] = 1
         end
      end
      # word_hash[item] = item.class
    end
    return word_hash
  end
end
