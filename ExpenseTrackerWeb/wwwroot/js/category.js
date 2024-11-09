document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('category-add-id').addEventListener('click', function (event) {
        event.stopPropagation();

        let addCatModal = document.getElementById('add-category-cont');
        let blur = document.getElementById('category-add-blur');

        if (addCatModal.classList.contains('hide') && blur.classList.contains('hide')) {
            addCatModal.classList.remove('hide');
            blur.classList.remove('hide');
            addCatModal.classList.add('show');
            blur.classList.add('show');
        }
    });

    document.getElementById('category-add-blur').addEventListener('click', function (event) {
        event.stopPropagation();

        let addCatModal = document.getElementById('add-category-cont');
        let blur = document.getElementById('category-add-blur');

        if (addCatModal.classList.contains('show') && blur.classList.contains('show')) {
            addCatModal.classList.remove('show');
            blur.classList.remove('show');
            addCatModal.classList.add('hide');
            blur.classList.add('hide');
        }
    });
    document.querySelectorAll('.catDetails').forEach(function (element) {
        element.addEventListener('click', function (event) {
            event.stopPropagation(); 

            let detailsCatModal = document.getElementById('category-container');
            let blur = document.getElementById('category-add-blur');

            if (detailsCatModal.classList.contains('hide') && blur.classList.contains('hide')) {
                detailsCatModal.classList.remove('hide');
                blur.classList.remove('hide');
                detailsCatModal.classList.add('show');
                blur.classList.add('show');
            } else {
                detailsCatModal.classList.remove('hide');
                blur.classList.remove('hide');
                detailsCatModal.classList.add('show');
                blur.classList.add('show');
            }
        });
    });
    document.getElementById('category-add-blur').addEventListener('click', function (event) {
        event.stopPropagation();

        let detailsCatModal = document.getElementById('category-container');
        let blur = document.getElementById('category-add-blur');

        if (detailsCatModal.classList.contains('show') && blur.classList.contains('show')) {
            detailsCatModal.classList.remove('show');
            blur.classList.remove('show');
            detailsCatModal.classList.add('hide');
            blur.classList.add('hide');
        }
    });
});