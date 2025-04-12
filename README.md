# Cupid0

Cupid0 is a job matching system that connects candidates with opportunities through AI-powered evaluation.

## Workflow

1. **Inbox Stage**: Candidates enter the system in batches of JSON files
2. **Filtering Stage**: Filter out candidates with previously seen IDs
3. **Initial Screening**: Process through a lightweight AI for basic screening
4. **Advanced Evaluation**: Evaluate through a more comprehensive AI

## Architecture

Cupid0 follows a modular design with separate applications for different concerns:

- **Suitors**: Repository for storing and managing job candidates
- *More modules to be added as the system evolves*

## Repository Pattern

The system uses the Repository pattern to provide clean interfaces for storing, retrieving, and managing data throughout its lifecycle.

## TODO

- RAG Rec book
- Update TCR
