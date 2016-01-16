class ReaderUserNotebook < ActiveRecord::Base
  def self.sort_list
    notebook_obj = ReaderUserNotebook.find(1)
    notebook_list_hash =Oj.load(notebook_obj.list)
    book_id = ReaderUser.find(notebook_obj.user_id).book
    book_word_hash = ReaderPageWord.book_word_frequency_statistics(book_id)
    word_frequency_hash = WordFrequencyList.word_frequency_hash
    array = notebook_list_hash.keys
    array.sort! do |a, b|
      begin
        time_a = Time.mktime(notebook_list_hash[a])
        time_b = Time.mktime(notebook_list_hash[b])
        book_frequency_a = book_word_hash[a]
        book_frequency_b = book_word_hash[b]
        word_frequency_a = word_frequency_hash[a]
        word_frequency_b = word_frequency_hash[b]
        if time_a>time_b
          -1
        elsif time_a<time_b
          1
        else
          if book_frequency_a > book_frequency_b
            -1
          elsif book_frequency_a < book_frequency_b
            1
          else
            if word_frequency_a > word_frequency_b
              -1
            elsif word_frequency_a < word_frequency_b
              1
            else
              0
            end
          end
        end
      rescue
        0
      end
    end
    return array
  end
end
