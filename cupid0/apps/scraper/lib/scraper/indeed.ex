defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  def view_job params \\ [] do
    jk = Keyword.get params, :jk, ""
    @base_url <> "/viewjob?jk=" <> jk
  end
end
