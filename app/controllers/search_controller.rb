class SearchController < ApplicationController
  def index
      @result = @q.result(distinct: true)
  end
end
