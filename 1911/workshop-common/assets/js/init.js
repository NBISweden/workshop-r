(function($){
  $(function(){

    $('.button-collapse').sideNav();
    $('.collapsible').collapsible();
    $('.parallax').parallax();
    $(".dropdown-button").dropdown({ 
            hover: true,
            constrainWidth: false,
            belowOrigin: true, 
    });
            

    $('select').material_select();
  }); // end of document ready
})(jQuery); // end of jQuery name space

(function () {
    // Find all headings
    var headings = ['H1', 'H2', 'H3']
    var levels = [0,0,0];
    var elems = []
    for (h of headings) {
        for (e of document.getElementsByTagName(h)) {
            elems.push({ element: e});
        }
    }

    // Sort headings based on their position in the document
    elems.sort(function(a,b) {
        return a.element.getBoundingClientRect().top - b.element.getBoundingClientRect().top
    });

    // Create table of contents
    toc = document.getElementById('toc');
    var id_prefix = 'xyz';
    var id_num = 0;
    for (e of elems) {
        var zero_levels = false;
        for (i in headings) {
            if (zero_levels) {
                levels[i] = 0;
            }
            else if (headings[i] == e.element.tagName) {
                levels[i]++;
                zero_levels = true;
            }
        }
        if ( e.element.id == "" ) {
            e.element.id = id_prefix + "-" + levels.join('.');
        }
        var anchor = '#' + e.element.id;

        a = document.createElement('a');
        a.setAttribute('href', anchor);
        //a.innerText = levels.join('.') + ' ' + e.element.innerText;
        a.innerText = e.element.innerText;

        li = document.createElement('li');
        li.appendChild(a);
        li.classList.add( e.element.tagName );

        toc.appendChild(li);
        e.li = li;
    }

    sidebar = document.getElementById('toc-sidebar');
    // Scroll listener
    window.addEventListener('scroll', function () {
        if (window.pageYOffset > 80) {
            sidebar.classList.add('fix-scroll');
        }
        else {
            sidebar.classList.remove('fix-scroll');
        }
    });
})();

