/**
 * Created with JetBrains RubyMine.
 * User: Devika
 * Date: 10/3/12
 * Time: 1:44 AM
 * To change this template use File | Settings | File Templates.
 */
$(function(){
    $(".pagination a").live("click",function(){
        $.get(this.href, null, null, "script");
            return false;
    });
}) ;
