
function goToTopLeft(img) {
    posLeft = img.position().left;
    posTop = img.position().top;
    img.animate({ top: '0', left: '600'}, 100);
}

function goToFrontFromTopLeft(img) {
    img.animate({ top: posTop, left: posLeft, height: 'toggle' }, 500);
}