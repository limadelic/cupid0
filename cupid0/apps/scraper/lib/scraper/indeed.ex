defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  def view_job params \\ [] do
    query = %{
      jk: Keyword.get(params, :jk, ""),
      cmp: Keyword.get(params, :cmp, ""),
      t: Keyword.get(params, :t, "")
    }
    @base_url <> "/viewjob?" <> URI.encode_query(query)
  end
end
