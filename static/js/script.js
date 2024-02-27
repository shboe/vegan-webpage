const radioButtons = document.querySelectorAll('input[type="radio"]');
const uncheckButton = document.getElementById('uncheckButton');

    uncheckButton.addEventListener('click', () => {
        radioButtons.forEach(button => {
            button.checked = false;
        });
    });
