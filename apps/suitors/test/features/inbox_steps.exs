defmodule Suitors.Features.InboxSteps do
  use Cabbage.Feature, file: "inbox.feature"
  
  # Setup for the test
  setup do
    # Create test directories
    File.mkdir_p!("test_inbox")
    File.mkdir_p!("test_lobby")
    
    on_exit(fn -> 
      # Clean up test directories
      File.rm_rf!("test_inbox")
      File.rm_rf!("test_lobby")
    end)
    
    :ok
  end
  
  # Step definitions
  defgiven ~r/^a new batch of suitors in the inbox$/, _state do
    # Create a test JSON file with suitors
    suitors = [
      %{
        "id" => "suitor1",
        "title" => "Software Engineer",
        "company" => "TechCorp",
        "location" => "Remote"
      },
      %{
        "id" => "suitor2",
        "title" => "Product Manager",
        "company" => "ProductCo",
        "location" => "New York"
      }
    ]
    
    # Write to a test file
    File.write!("test_inbox/batch1.json", Jason.encode!(suitors))
    
    :ok
  end
  
  defwhen ~r/^the inbox processor runs$/, _state do
    # This will be implemented when we create the Inbox module
    # For now, it's a placeholder
    :ok
  end
  
  defthen ~r/^suitor IDs should be recorded$/, _state do
    # This will verify that IDs are in the ETS table
    # For now, it's a placeholder
    :ok
  end
  
  defthen ~r/^the batch should move to the lobby$/, _state do
    # This will verify the file was moved to the lobby
    # For now, it's a placeholder
    :ok
  end
end
