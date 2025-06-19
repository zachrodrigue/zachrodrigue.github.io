document.addEventListener('DOMContentLoaded', function () {
    const modal = document.getElementById('imgModal');
    const modalImg = document.getElementById('modalImg');
    const closeBtn = document.getElementById('closeModal');
    const img = document.getElementById('clickableImg');

    img.onclick = function () {
        modal.style.display = 'block';
        modalImg.src = this.src;
    };

    closeBtn.onclick = function () {
        modal.style.display = 'none';
    };

    modal.onclick = function (e) {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    };
});
