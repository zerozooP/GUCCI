<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
		
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


		
        <script>
			function logout() {
				if (!confirm('정말로 로그아웃 하시겠습니까?')) {
					alert("취소했습니다");
					return false;
				}
				var b = eval(true)
				$.ajax({
					url:'/logout',
					method:'get',
					cache : false,
					dataType : 'text',
					success : function(eval) {
						alert(b ? '로그아웃 성공' : '로그아웃 실패');
						location.href = '/login';
					},
					error : function(xhr, status, err) {
						alert('에러:' + err);
					}
				});
				return false;
			}
		</script>
		
		<script>
			function update(){
				
				var serData = $('#form').serialize();
				$.ajax({
					url:'/location',
					method:'post',
					cache:false,
					data:serData,
					dataType:'json',
					success:function(res){
						
						var list = [];
						$.each(res, function(i){
						var datalist = res[i];
						
						list.push(datalist.demand_p);
						if(window.myLineChart!=undefined){
							window.myLineChart.destroy();
						}
						var ctx = document.getElementById("myAreaChart");
						 window.myLineChart = new Chart(ctx, {
						  type: 'line',
						  data: {
						    labels: ["0h", "1h", "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "10h", "11h", "12h", "13h", "14h", "15h", "16h", "17h", "18h", "19h", "20h", "21h", "22h", "23h"],
						    datasets: [{
						      label: "예측치",
						      lineTension: 0.3,
						      backgroundColor: "rgba(2,117,216,0.2)",
						      borderColor: "rgba(2,117,216,1)",
						      pointRadius: 5,
						      pointBackgroundColor: "rgba(2,117,216,1)",
						      pointBorderColor: "rgba(255,255,255,0.8)",
						      pointHoverRadius: 5,
						      pointHoverBackgroundColor: "rgba(2,117,216,1)",
						      pointHitRadius: 50,
						      pointBorderWidth: 2,
						      data: list,
						    }],
						  },
						  options: {
						    scales: {
						      xAxes: [{
						        time: {
						          unit: 'date'
						        },
						        gridLines: {
						          display: false
						        },
						        ticks: {
						          maxTicksLimit: 7
						        }
						      }],
						      yAxes: [{
						        ticks: {
						          min: 0,
						          max: 25000,
						          maxTicksLimit: 6
						        },
						        gridLines: {
						          color: "rgba(0, 0, 0, .125)",
						        }
						      }],
						    },
						    legend: {
						      display: false
						    }
						  }
						});
					});
					},
					error:function(xhr,status,err){
						alert('에러'+err);
					}
				});
				
				return false;
			}
		</script>
		
		
		<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#Date" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: 'yy-mm-dd'                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                  
 
            });
           
    });
</script>

		
    </head>
    <body class="sb-nav-fixed">
		<jsp:include page="/WEB-INF/topnav.jsp"></jsp:include>
        <div id="layoutSidenav">
			<jsp:include page="/WEB-INF/sidenav.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        
                        
                       
						<form id="form" onsubmit="return update();">
						    날짜: <input type="text" id="Date" name="Date">
						   지역: <select name="location" id="location">
					
						        <option value="강원">강원</option>
						        <option value="경기">경기</option>
						        <option value="경남">경남</option>
						        <option value="경북">경북</option>
						        <option value="광주">광주</option>
						        <option value="대구">대구</option>
						        <option value="대전">대전</option>
						        <option value="부산">부산</option>
						        <option value="서울">서울</option>
						        <option value="울산">울산</option>
						        <option value="인천">인천</option>
						        <option value="전남">전남</option>
						        <option value="전북">전북</option>
						        <option value="제주">제주</option>
						        <option value="충남">충남</option>
						        <option value="충북">충북</option>
						    </select>&nbsp;&nbsp;
						    <input type="submit">
						</form>


                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
	                                      
	                                       지역별 전력 수요예측(Day) 
	                                      
                                    </div>
                                    <div class="card-body">
                                    	<canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <!-- 수정할 예정 -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${list}" var="list">
                                        <tr>
                                            <td>${list.name}</td>
                                            <td>${list.position}</td>
                                            <td>${list.office}</td>
                                            <td>${list.age}</td>
                                            <td>${list.startdate}</td>
                                            <td>$${list.salary}</td>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
