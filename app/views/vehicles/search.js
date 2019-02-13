$("#vehicle-search .vs-results-items").html("<%= escape_javascript(render("vs_result")) %>");
$("#vs-preloader").hide();
