defmodule Scraper.Indeed do
  @base_url "https://www.indeed.com"

  def view_job params \\ [] do
    @base_url <> "/viewjob"
  end
end
