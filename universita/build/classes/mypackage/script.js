
/*document.addEventListener('DOMContentLoaded', function() {
  // Check if there's a "U win" message in the URL query string
  const params = new URLSearchParams(window.location.search);
  if (params.has('message')) {
    const winMessage = params.get('message');
    const messageElement = document.getElementById('winMessage');

    // Display the "U win" message
    messageElement.textContent = winMessage;

    // Hide the message after 5 seconds
    setTimeout(function() {
      messageElement.textContent = '';
    }, 5000);
  }
});*/