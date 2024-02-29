const form = document.getElementById('filterForm');
const storeSelect = document.getElementById('store');
const categorySelect = document.getElementById('category');

storeSelect.addEventListener('change', submitForm);
categorySelect.addEventListener('change', submitForm);

function submitForm() {
    form.submit();
}
