$(document).ready(function () {
    $(document).ready(function () {
        $('#formDropdown').on('click', function () {
            // Prevent default dropdown behavior to avoid unnecessary page jumps
            $(this).dropdown('toggle');

            // Use a safer approach to toggle visibility based on user preference
            const localStorageKey = 'showSignup'; // Customize this key if needed

            let showSignup;
            try {
                showSignup = localStorage.getItem(localStorageKey) === 'true';
            } catch (error) {
                console.error('Error retrieving localStorage value:', error);
                showSignup = false; // Default to showing SignUp
            }

            const signupLink = $('#formDropdown').next('.dropdown-menu').find('a[href="/Core/Registration"]');
            const loginLink = $('#formDropdown').next('.dropdown-menu').find('a[href="/Core/Login"]');

            signupLink.toggle(!showSignup);
            loginLink.toggle(showSignup);

            localStorage.setItem(localStorageKey, !showSignup); // Update localStorage
        });
    });
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
});

