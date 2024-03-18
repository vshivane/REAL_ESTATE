function addToShortlist(id,type)
{
	$.ajax({
		url:'Short_List_Prop.jsp',
		type:'POST',
		data:'prodid='+id+'&type='+type,
		success:function(result){
			$('#'+id).removeClass("like-icon");
				alert("Successfully shortlisted for you..");
		},
	});
}
