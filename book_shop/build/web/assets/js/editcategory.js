$( document ).ready(function() {
    
    /**
     * The event handler for submit button - add category.
     * It triggers a ajax POST call to api/v1/category
     * It will submit a category entry to a Serendipity database 
     */
    var $post_category_form = $('#post_category_form');
    
    $('#submit_add_category').click(function(e){
        
        e.preventDefault(); // cancel form submit
        
        var jsObj = $post_category_form.serializeObject();
        var ajaxObj = {};
        
        ajaxObj = {
                    type: "POST",
                    url: "http://localhost:8080/book_shop/api/v1/category/",
                    data: JSON.stringify(jsObj),
                    contentType: "application/json",
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log("Error " + jqXHR.getAllResponseHeaders() + " " + errorThrown);
                    },
                    success: function(data) {
                        if(data[0].HTTP_CODE == 200) {
                            console.log("Added category!");
                        } else {
                            console.log("Error adding category!");
                        }
                        $('ajax_add_category_response').text( data[0].MSG );
                    },
                    complete: function(XMLHttpRequest) {
                        //console.log(XMLHttpRequest.getAllResponseHeaders());
                        getCategory();
                    },
                    dataType: "json" // request json
        };
        
        $.ajax(ajaxObj);        
    });
    
    /**
     * The event handler for submit button - update category.
     * It triggers a ajax PUT call to api/v1/category
     * It will submit a category entry update to a Serendipity database 
     */
    
    var $put_category_form = $('#put_category_form');
    
    getCategory();
    
    $(document.body).on('click', ':button, .category_update_button', function(e) {
        var $this = $(this);
        var category_id = $this.val();
        var $tr = $this.closest('tr');
        var category_name = $tr.find('.container_category_name').text();
                    
        $('#set_category_id').val(category_id);
        $('#set_category_name').val(category_name);
        
        $('#ajax_update_category_response').text('HHHHHEEEEELLLLLOOOOO!');
    });
    
    $put_category_form.submit(function(e) {
       e.preventDefault(); // cancel form submit
       var obj = $put_category_form.serializeObject();
       updateCategory(obj);
    });
});

function updateCategory(obj) {
    
    ajaxObj = {
        
                type: "PUT",
                url: "http://localhost:8080/book_shop/api/v1/category/",
                data: JSON.stringify(obj),
                contentType: "application/json",
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR.responseText);
                },                    
                success: function(data) {
                if(data[0].HTTP_CODE == 200) {
                        console.log("Updated category!");
                    } else {
                        console.log("Error updating category!");
                    }
                    $('ajax_update_category_response').text( data[0].MSG );
                },
                complete: function(XMLHttpRequest) {
                    // reload inventory
                    // console.log( XMLHttpRequest.getAllResponseHeaders() );
                    getCategory();
                },
                dataType: "json"  // request json
    };
    
    return $.ajax(ajaxObj);
}

/**'
 * Get category names from the backend using ajax call and json response.
 */
function getCategory() {
    
    var d = new Date().getTime();
    
    ajaxObj = {
                type: "GET",
                url: "http://localhost:8080/book_shop/api/v1/category/",
                data: "ts="+d,
                contentType: "application/json",
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR.responseText());
                },
                success: function(data) {
                    var html_string = "";
                    
                    $.each(data, function(index, value){
                        //console.log(index + ": " + value);
                        html_string = html_string + templateGetCategory(value);
                    });
                    
                    $('#get_category').html("<table border='1'>" + html_string + "</table>");
                },
                complete: function(XMLHttpRequest) {
                    //console.log(XMLHttpRequest.getAllResponseHeaders());
                },
                dataType: "json" // request json
    };
    
    return $.ajax(ajaxObj);
}

/**
 * Format category names into the table rows and columns.
 * 
 * @param {type} category
 * @returns {String}
 */
function templateGetCategory(category) {
    
    return '<tr>' +
                        '<td class="container_category_name">' + category.category_name + '</td>' +
                        '<td class="container_update_button"> <button class="category_update_button" value="' + 
                                                    category.category_id + '" type="button">Update</button> </td>' +
            '</tr>';
    
}