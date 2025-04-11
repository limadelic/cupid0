defmodule Suitors.Features.StorageSteps do
  use Cabbage.Feature, file: "storage.feature"

  defwhen ~r/^jobs.json is imported into storage$/, _state do
    jobs = [
      %Suitors.Job{
        id: "job1",
        title: "Senior Software Engineer",
        company: "TechCorp",
        location: "Remote",
        salary: "$150,000",
        description: "Building amazing products",
        posted_at: "2025-04-10",
        url: "https://example.com/job1"
      },
      %Suitors.Job{
        id: "job2",
        title: "Full Stack Developer",
        company: "WebTech",
        location: "Remote",
        salary: "$140,000",
        description: "Creating web applications",
        posted_at: "2025-04-09",
        url: "https://example.com/job2"
      },
      %Suitors.Job{
        id: "job3",
        title: "Elixir Developer",
        company: "PhoenixSoft",
        location: "Remote",
        salary: "$145,000",
        description: "Building scalable systems",
        posted_at: "2025-04-11",
        url: "https://example.com/job3"
      },
      %Suitors.Job{
        id: "job4",
        title: "Backend Engineer",
        company: "DataFlow",
        location: "Remote",
        salary: "$155,000",
        description: "Working on data pipelines",
        posted_at: "2025-04-10",
        url: "https://example.com/job4"
      },
      %Suitors.Job{
        id: "job5",
        title: "Software Architect",
        company: "ArchSystems",
        location: "Remote",
        salary: "$170,000",
        description: "Designing system architecture",
        posted_at: "2025-04-08",
        url: "https://example.com/job5"
      }
    ]

    for job <- jobs do
      Suitors.Hearts.add(job)
    end
    
    :ok
  end

  defthen ~r/^Suitors sees (\d+) jobs$/, %{captures: [count]}, _state do
    assert Suitors.Hearts.count() == String.to_integer(count)
  end
end
