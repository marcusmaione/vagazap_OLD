import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('user_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };

const initAutocomplete2 = () => {
  const addressInput2 = document.getElementById('company_address');
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export { initAutocomplete2 };
