// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('user_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };

// export { initAutocomplete };

// const initAutocomplete2 = () => {
//   const addressInput2 = document.getElementById('company_address');
//   if (addressInput2) {
//     places({ container: addressInput2 });
//   }
// };

// export { initAutocomplete2 };


function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var userAddress = document.getElementById('user_address');

    if (userAddress) {
      var autocomplete = new google.maps.places.Autocomplete(userAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(userAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

function autocomplete2() {
  document.addEventListener("DOMContentLoaded", function() {
    var companyAddress = document.getElementById('company_address');

    if (companyAddress) {
      var autocomplete2 = new google.maps.places.Autocomplete(companyAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(companyAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete2 };
