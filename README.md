# ApexGPT Backend

This repository contains the backend code for ApexGPT, an AI-powered application. The backend is built using FastAPI and integrates with OpenAI's API to provide advanced conversational capabilities.

## Prerequisites

Before running the application, ensure you have the following installed on your system:

- **Python 3.12**: Ensure you have the correct Python version installed.
- **Docker**: Used for containerizing the application.
- **OpenAI API Keys**: Required for accessing OpenAI services. Make sure to set your API key as an environment variable.

## Getting Started

### Running the Application Directly

You can run the backend server directly using the command prompt. This method uses Uvicorn, an ASGI server for running FastAPI applications.

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/apexgpt-backend.git
    cd apexgpt-backend
    ```
    ### Environment Variables

    - Ensure the following environment variables (create .env file for that) are set before running the application:
    
    ```
    OPENAI_API_KEY= <Your OpenAI API key>
    ```


2. Install the required Python dependencies:

    ```bash
    pip install -r requirements.txt
    ```

3. Run the server:

    ```bash
    uvicorn chat:app --host 0.0.0.0 --port 8000 --reload
    ```

The server will start on port **8000** and be accessible at `http://0.0.0.0:8000`.

### Running with Docker

Docker can be used to build and run the application inside a container, making the setup process straightforward and ensuring consistency across different environments.

#### Step 1: Build the Docker Image

To build the Docker image for the backend, use the following command:

```bash
docker build -t apexgpt-backend .
```

#### Step 2: Run the Docker Container

Run the Docker container using the built image. This will start the backend server on port 8000.

```bash
docker run -d -p 8000:8000 apexgpt-backend
```

The backend will now be running on http://localhost:8000.





