defmodule Scraper.Indeed do
  
  def search(criteria) when is_list(criteria) do
    {:ok, []}
  end

  def parse_title html do
    
    [_, title] = Regex.run ~r/<title>(.*?) - /, html
    title

  end



end
