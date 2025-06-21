import json
import subprocess

## TODO: How to communicate with a lsp server; alrady initialize using the INPUT file Stream.

# Start the bash-language-server
process = subprocess.Popen(
    ["bash-language-server", "start"],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
    text=True
)

# Helper function to send JSON-RPC messages
def send_rpc(process, method, params, request_id=1):
    message = {
        "jsonrpc": "2.0",
        "id": request_id,
        "method": method,
        "params": params
    }
    message_str = json.dumps(message)
    content_length = len(message_str)

    # Send the LSP message to the server via stdin
    process.stdin.write(f"Content-Length: {content_length}\r\n\r\n{message_str}")
    process.stdin.flush()

# Initialize request (required by LSP)
initialize_request = {
    "processId": None,
    "rootUri": None,
    "capabilities": {},
    "trace": "off"
}

def read_response(process):
    """Read and parse a response from stdout."""
    header = process.stdout.readline().strip()  # Read Content-Length header
    if header.startswith("Content-Length:"):
        content_length = int(header.split(":")[1].strip())
        process.stdout.readline()  # Read empty line
        response = process.stdout.read(content_length)  # Read JSON body
        return json.loads(response)
    return None

# Send the initialization request
send_rpc(process, "initialize", initialize_request)

response = read_response(process)

print("Initialize Response:", response)

# Read the response from stdout
# response = read_response(process)
# response = process.stdout.read(1024)

print("Response:", response)
