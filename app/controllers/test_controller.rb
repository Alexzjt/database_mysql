class TestController < ApplicationController
  def add_date
    answer = Array.new
    ReaderUserNotebook.all.each do |item|
      arr = Oj.load(item.list)
      result = Array.new
      arr.each do |x|
        result.push({x => Time.new.to_s})
      end
      item.update(list: Oj.dump(result))
      answer.push result
    end
    render :json => Oj.dump(answer)
  end
end
