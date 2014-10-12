// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require ckeditor/init
//= require jquery.lockfixed.min

function drawtagcloud(data) {
	// define min max for posts and heat
	var posts = [];
	for (var key in data){
				posts.push(data[key]['posts']);
	}
	var heat = [];
	for (var key in data){
				heat.push(data[key]['heat']);
	}
	var minposts = Math.min.apply( null, posts );
    var maxposts = Math.max.apply( null, posts );
  	var minheat = Math.min.apply( null, heat );
    var maxheat = Math.max.apply( null, heat );
    var stepposts=(maxposts-minposts)/5;
    var stepheat=(maxheat-minheat)/5;

	// for each tag, 
    for (var key in data){
    	var classtag="tag posts-"+~~((data[key]['posts']-minposts)/stepposts);
	   	if ($.inArray(data[key]['word'], relatedwords) != -1) {
			classtag=classtag+" tag-selected";
		}
		else {
		   	var classtag=classtag+" heat-"+~~((data[key]['heat']-minheat)/stepheat);
		}
		if ($('#tag-'+data[key]['word']).length) {
    		$('#tag-'+data[key]['word']).attr('class', classtag);
    	}
    	else {
    	tag='<span draggable="true" id="tag-'+data[key]['word']+'" class="'+classtag+'">'+data[key]['word']+' </span>';
 		$('#ambertagscloud').append(tag);
 		}
	}
}

function updatetagcloud(relatedwords) {
	$.post('http://localhost:3000/blog/tags',
       {relatedwords: relatedwords},
       function(data,status) {
			drawtagcloud(data);
     });
     
};



$(document).on('click','.tag',function(){
		if ($(this).hasClass('tag-selected')) {
			var index=$.inArray($(this).attr('id').replace('tag-', ''), relatedwords);
			if (index != -1) {
				relatedwords.splice(index, 1);
			}
		}
		else {
			relatedwords.push($(this).attr('id').replace('tag-', ''));
		};
		updatetagcloud(relatedwords);
	});

$(document).ready(function() {
	relatedwords=[];
	updatetagcloud(relatedwords);
	});