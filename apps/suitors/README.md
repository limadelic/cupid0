# Suitors

Suitors manages the storage and processing of job candidates (suitors) through different stages.

## Workflow

1. **Inbox Stage**: Suitors enter the system in batches of JSON files
2. **Filtering Stage**: Filter out suitors with previously seen IDs
3. **Initial Screening**: Process through a lightweight AI for basic screening
4. **Advanced Evaluation**: Evaluate through a more comprehensive AI

## Repository Pattern

The Suitors module serves as a Repository for other processes that will interact with the suitors data. It provides a clean interface for storing, retrieving, and managing suitors throughout their lifecycle.


TODO

- RAG Rec book
- Update TCR