class AdvancedSearchesController < ApplicationController

  def new
    @advanced_search = AdvancedSearch.new
    
  end
end
