//When the page loads, get all the href links in pagination div and enable js
$(function(){
    $(".pagination a").live("click",function(){
        $.get(this.href, null, null, "script");
        return false;
    })
}
);
