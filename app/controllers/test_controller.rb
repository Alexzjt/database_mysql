class TestController < ApplicationController
  def add_date
    answer = Array.new
    ReaderUserNotebook.all.each do |item|
      arr = Oj.load(item.list)
      result = Hash.new
      arr.each do |x|
        result[x] = Time.new.to_s
      end
      item.update(list: Oj.dump(result))
      answer.push result
    end
    render :json => Oj.dump(answer)
  end

  def frequency
    render :json => Oj.dump(ReaderPageWord.book_word_frequency_statistics(params[:id].to_i))
  end

  def sort_list
    render :json => Oj.dump(ReaderUserNotebook.sort_list)
  end

  def word_frequency_hash
    render :json => Oj.dump(WordFrequencyList.word_frequency_hash)
  end
end
