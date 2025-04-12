# Suitors

## Overview

Suitors is a job opportunity storage service for Cupid0, designed to manage and organize job postings. It stores job opportunities as "hearts" waiting to find their perfect match.

## Core Functionality

- **Job Storage**: Efficiently stores job postings with all relevant details
- **Retrieval**: Provides fast access to stored job opportunities
- **Counting**: Tracks the number of stored job opportunities

## Architecture

Suitors uses Elixir's GenServer and ETS (Erlang Term Storage) for in-memory storage of job opportunities. The main components are:

- **Suitors.Job**: Data structure representing a job opportunity
- **Suitors.Hearts**: GenServer that manages the storage and retrieval of jobs

## Usage

```elixir
# Add a job to storage
job = %Suitors.Job{
  id: "job-123",
  title: "Software Engineer",
  company: "Awesome Tech",
  location: "Remote",
  salary: "$120,000",
  description: "Building the future of tech",
  posted_at: ~U[2025-04-01 12:00:00Z],
  url: "https://example.com/jobs/123"
}
Suitors.Hearts.add(job)

# Get all stored jobs
jobs = Suitors.Hearts.all()

# Count stored jobs
count = Suitors.Hearts.count()
```

## Testing

Suitors uses Cabbage for BDD-style testing with Gherkin syntax. Feature files can be found in the `test/features` directory.
