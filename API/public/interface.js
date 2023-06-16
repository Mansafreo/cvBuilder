// Function to create an in-memory token storage using closure
const createTokenStorage = () => {
  let token = '';

  const setToken = (newToken) => {
    token = newToken;
  };

  const getToken = () => {
    return token;
  };

  return {
    setToken,
    getToken
  };
};
// Create an instance of in-memory token storage
const tokenStorage = createTokenStorage();

// Event listener for the registration form
const form = document.getElementById('registration-form');
form.addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the default form submission

  // Send an asynchronous request to the server
  const xhr = new XMLHttpRequest();
  xhr.open('POST', '/register');
  xhr.setRequestHeader('Content-Type', 'application/json');

  xhr.onload = function() {
    const response = JSON.parse(xhr.response);
    if (xhr.status === 200) {
      // Successful registration
      alert('Registration successful');
      form.reset(); // Reset the form fields
      tokenStorage.setToken(response.token);
    } else {
      document.getElementById('errors').innerHTML = response.message;
    }
  };

  const formData = new FormData(form);
  const jsonData = JSON.stringify(Object.fromEntries(formData));

  xhr.send(jsonData);
});

// Event listener for the login form
const signupForm = document.getElementById('signup-form');
signupForm.addEventListener('submit', function(event) {
  event.preventDefault(); // Prevent the default form submission behavior

  // Retrieve the form data
  const email = document.getElementById('email').value;
  const password = document.getElementById('password').value;

  // Create a payload object with the form data
  const payload = {
    email: email,
    password: password
  };

    // Check if there is a token in the in-memory storage
    const token = tokenStorage.getToken();

  // Make the AJAX request to the server
  fetch('/login', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' +  token
    },
    body: JSON.stringify(payload)
  })
    .then(response => response.json())
    .then(data => {
      // Handle the response from the server
      console.log(data);
      // Perform any necessary actions based on the response
    })
    .catch(error => {
      // Handle any errors that occurred during the request
      console.error(error);
    });
});
// Compare this snippet from API\controllers\login.js: