<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAFNA";
try {
%>
<%
String session1 = (String) session.getAttribute("login_id");
if (session.getAttribute("login_id") != null) {
 String sessionName = (String) session.getAttribute("login_id");
} else
 response.sendRedirect("../common/login.jsp");
%>
<html lang="en">
<!--begin::Head-->
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
table.a {
	table-layout: auto;
	width: 100%;
}
</style>
</head>
<!--end::Head-->
<!--begin::Body-->
<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-rk4.jpg); 
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: 100vh;
    top: 0;">
	<!--begin::Main-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/navbar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container d-flex align-items-stretch justify-content-between">
							<div class="col-xl-12 offset-xl-1">
								<h2	class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 ml-4">City Wise Patient Count</h2>
								<div class="col-xl-10 offset-xl-0">
									<div class="example mb-10">
										<div class="example-preview">
											<div class="card card-custom">
												<form class="form" id="kt_form_1">
													<div class="card-body">
														<div class="row">
															<div class="form-group col-lg-6">
																<label>City Name:</label> <select name="village"
																	id="village" class="form-control form-control-solid">
																	<option value="" disabled selected hidden>Select City</option>
																</select>
															</div>
														</div>
														<div class="row  ">
															<div class="col-xl-6">
																<div class="form-group">
																	<label>Sorted By:</label> <select name="sort_by"
																		id="sort_by" class="form-control form-control-solid">
																		<option>Select Option</option>
																		<option value="city_desc">City Name</option>
																		<option value="patient_name">Patient Name</option>
																		<option value="visit_date">Visit Date</option>
																		<option value="age">Age</option>
																		<option value="blood_group">Blood Group</option>
																		<option value="gender">Gender</option>
																		<option value="diagnosis_desc">Diagnosis Name</option>
																	</select>
																</div>
															</div>
															<div class=" col-xl-6 form-group row mt-6 ml-1">
																<label class="col-form-label " id="ascending">Ascending</label>
																<div class="col-3">
																	<span
																		class="switch switch-outline switch-icon switch-danger switch-sm ">
																		<label> <input type="checkbox" name="select"
																			id="order" /> <span></span>
																	</label> <label class="col-form-label ml-3" id="decending">Decending</label>
																	</span>
																</div>
															</div>
														</div>
														<div class="row ">
															<div class="col-xl-6">
																<div class="form-group">
																	<label>From Date</label> <input type="date"
																		class="form-control h-40px  " name="from_date"
																		id="from_date" />
																</div>
															</div>
															<div class="col-xl-6">
																<div class="form-group">
																	<label>To Date</label> <input type="date"
																		class="form-control h-40px  " name="till_date"
																		id="till_date" />
																</div>
															</div>
														</div>
													</div>
													<div class="card-footer text-center">
														<div class="row">
															<div class="col-lg-3"></div>
															<div class="col-lg-6">
																<button type="button" id="show" onclick="printP()"
																	class="btn font-weight-bold btn-primary mr-2 ">Show
																	Report</button>
															</div>
														</div>
													</div>
												</form>
												<!--end::Form-->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--end::Container-->
			</div>
			<!--end::Entry-->
		</div>
		<!--end::Content-->
	</div>
	<!--end::Wrapper-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
				height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2"
					height="10" rx="1" />
						<path
					d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<jsp:include page="../common/jsfiles.jsp"></jsp:include>
	<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	var date = new Date();
	var today = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
	$('#from_date').val(today);
	$('#till_date').val(today);
	$.ajax({
		url : base + "/dssAPI/dfapi/getCityDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
			        $('#village').append($(document.createElement('option')).prop({
		                value: element.city_name,
		                text: element.city_name
		            }))
			});   
        }
	});	
	$.ajax({
		url : base + "/dssAPI/dfapi/getOpdYear",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
        {
			data.forEach((element)=> {
			        $('#year').append($(document.createElement('option')).prop({
		                value: element.opd_year,
		                text: element.opd_year
		            }))
			});   
        }
	});	
	var order = 'asc';
		    function printP() {
		    	var city_desc = $('#village').val();
		    	var sort_by = $('#sort_by').val();
		    	var year = $('#year').val();
		    	if ($("#order").prop('checked')==true){ 
					 order = 'desc';
					 }else{
						 order = 'asc'
					 }
		    	var from_date = $('#from_date').val();
		    	var till_date = $('#till_date').val();
		    	  if(from_date.length > 1 && till_date.length > 1){
				var url = "cityReport.jsp" + '?city_desc=' + city_desc  + '&order=' + order  + '&sort_by='  + sort_by +  '&from_date=' + from_date +  '&till_date=' + till_date;
				window.location.assign(url);
		    	  }
		            else{
		            	alert("Please select the Date Range");
		            }
			}  
	</script>
</body>
</html>
<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>








