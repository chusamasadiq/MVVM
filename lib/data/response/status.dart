// Response
// 1. Hit request to server and wait (Show loading sign).
// 2. Request successful, Response has received successfully.
// 3. Hit request to server, Response not received, While error message received.

enum Status { LOADING, COMPLETED, ERROR }
