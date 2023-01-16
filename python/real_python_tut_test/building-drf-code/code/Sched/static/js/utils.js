function csrfSafeMethod(method) { 
  return(/^(GET|HEAD|OPTIONS|TRACE)$/.test(method)); 
} 


function get_cookie(name) {
    if( document.cookie && document.cookie != '' ) {
        var cookies = document.cookie.split(';');
        for( var i=0; i<cookies.length; i++ ) {
            var cookie = jQuery.trim(cookies[i]);
            if( cookie.substring(0, name.length + 1) === (name + '=')) {
                return decodeURIComponent(cookie.substring(name.length + 1));
            }
        }
    }

    return null;
}


function ajax_setup(csrf_token) {
  $.ajaxSetup({ 
    beforeSend: function(xhr, settings) { 
      if( !csrfSafeMethod(settings.type) && !this.crossDomain) { 
        xhr.setRequestHeader("X-CSRFToken", csrf_token);
      } 
    } 
  });
}
