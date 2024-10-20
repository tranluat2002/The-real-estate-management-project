<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building" />
<html>
<head>
    <title>Title</title>
</head>
<body>



    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->


            </div>

            <div class="page-content">


                <div class="page-header">
                    <h1>
                        Danh sách tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12 ">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">


                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>


                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                                <div class="widget-main" >
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-6 ">
                                                        <label class="name">Tên tòa nhà</label>
<%--                                                        <input id="name" type="text" class="form-control" name="name" value="${modelSearch.name}">--%>
                                                        <form:input class="form-control" path="name"/>
                                                    </div>
                                                    <div class="col-xs-6 ">
                                                        <label class="name">Diện tích sàn</label>
                                                        <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-2 ">
                                                        <label class="name">Quận</label>
                                                        <form:select class="form-control" path="district">
                                                            <form:option value="">---Chọn Quận---</form:option>
                                                            <form:options items="${districts}"/>

                                                        </form:select>
                                                    </div>
                                                    <div class="col-xs-5 ">
                                                        <label class="name">Phường</label>
<%--                                                        <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">--%>
                                                        <form:input class="form-control" path="ward"/>
                                                    </div>
                                                    <div class="col-xs-5 ">
                                                        <label class="name">Đường</label>
<%--                                                        <input type="text" class="form-control" name="street" value="${modelSearch.street}">--%>
                                                        <form:input class="form-control" path="street"/>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-4 ">
                                                        <label class="name">Số tầng hầm</label>
                                                        <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">
                                                    </div>
                                                    <div class="col-xs-4 ">
                                                        <label class="name">Hướng</label>
                                                        <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">
                                                    </div>
                                                    <div class="col-xs-4 ">
                                                        <label class="name">Hạng</label>
                                                        <input type="number" class="form-control" name="level" value="${modelSearch.level}">
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-3 ">
                                                        <label class="name">Diện tích từ</label>
                                                        <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">
                                                    </div>
                                                    <div class="col-xs-3 ">
                                                        <label class="name">Diện tích đến</label>
                                                        <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">
                                                    </div>
                                                    <div class="col-xs-3 ">
                                                        <label class="name">Giá thuê từ</label >
                                                        <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">
                                                    </div>
                                                    <div class="col-xs-3 ">
                                                        <label class="name">Giá thuê đến</label>
                                                        <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-4 ">
                                                        <label class="name">Tên quản lý</label>
                                                        <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">
                                                    </div>
                                                    <div class="col-xs-4 ">
                                                        <label class="name">Điện thoại quản lý</label>
                                                        <input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone}">
                                                    </div>
<%--                                                    <div class="col-xs-2 ">--%>
<%--                                                        <label class="name">Chọn nhân viên</label>--%>
<%--                                                        <select  class="form-control">--%>
<%--                                                            <option value="">---Chọn nhân viên---</option>--%>
<%--                                                            <option value="2">Nguyễn Văn Mạnh</option>--%>
<%--                                                            <option value="3">Nguyễn Xuân Nam</option>--%>
<%--                                                        </select>--%>
<%--                                                    </div>--%>

                                                    <div class="col-xs-2 ">
                                                        <label class="name">Chọn nhân viên</label>
                                                        <form:select class="form-control" path="staffId">
                                                            <form:option value="">---Chọn nhân viên---</form:option>
                                                            <form:options items="${listStaff}" />
                                                        </form:select>
                                                    </div>


                                                </div>

                                            </div>


                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-6 ">
                                                       <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <div class="col-xs-12 ">
                                                    <div class="col-xs-6 ">
                                                            <button type="button" class="btn btn-success" id="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                            </svg>
                                                            Tìm kiếm
                                                        </button>
                                                    </div>

                                                </div>
                                            </div>










                                        </div>
                                    </form:form>

                                </div>
                            </div>

                            <div class="pull-right" style="font-family: 'Times New Roman', Times, serif;">
                                <a href="/admin/building-edit">
                                    <button class="btn btn-info" title="Thêm tòa nhà" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>

                                <a href="">
                                    <button class="btn btn-info" title="Xóa tòa nhà" id="btnDeleteBuilding">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>


                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bảng danh sách -->
                <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" style="margin: 3em 0 1.5em;" class="table table-striped table-bordered table-hover" style="font-family: 'Times New Roman', Times, serif;">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" name="checkList" value="" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lý</th>
                                <th>Số điện thoại quản lý</th>
                                <th>Diện tích sàn</th>
                                <th>Diện tích trống</th>
                                <th>Diện tích thuê</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>


                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${buildingList}">
                                <tr>
                                    <td class="center">
                                        <label class="pos-rel">
                                            <input type="checkbox" name="checkList" value="${item.id}" class="ace">
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>${item.name}</td>
                                    <td>${item.address}</td>
                                    <td>${item.numberOfBasement}</td>
                                    <td>${item.managerName}</td>
                                    <td>${item.managerPhone}</td>
                                    <td>${item.floorArea}</td>
                                    <td>0</td>
                                    <td>${item.rentArea}</td>
                                    <td>${item.id}</td>
                                    <td>
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="13" fill="currentColor" class="bi bi-cursor-fill" viewBox="0 0 16 16">
                                                    <path d="M14.082 2.182a.5.5 0 0 1 .103.557L8.528 15.467a.5.5 0 0 1-.917-.007L5.57 10.694.803 8.652a.5.5 0 0 1-.006-.916l12.728-5.657a.5.5 0 0 1 .556.103z"/>
                                                </svg>
                                            </button>

                                            <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>

                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                        </div>


                                    </td>
                                </tr>
                            </c:forEach>




                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>

            </div>
        </div><!-- /.page-content -->
    </div>
<!-- /.main-content -->


<!-- /.main-container -->
<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="stafflist">
                    <thead>
                    <tr>
                        <th>Chọn</th>
                        <th>Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="buildingId" value="">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>

    <script>

        function assignmentBuilding(buildingId){
            $('#assignmentBuildingModal').modal();
            loadStaff(buildingId);
            $('#buildingId').val(buildingId);
        }


        function loadStaff(buildingId){
            $.ajax({

                url: "${buildingAPI}/" + buildingId  + '/staffs',
                type: "GET",
                // data: JSON.stringify(data),
                // contentType: "application/json",
                dataType: 'json',
                success: function (response) {
                    var row = '';
                    $.each(response.data, function (index, item) {
                        row += '<tr>';
                        row += '<td className="text-center"><input type="checkbox" value=' + item.staffId + ' id="checkbox_' + item.staffId +  '" class = "check-box-element"' + item.checked + '/></td>';
                        row += '<td className="text-center">' + item.fullName + '</td>';
                        row += '</tr>';
                    });
                    $('#stafflist tbody' ).html(row);
                    console.info("success");
                },
                error: function(response){
                    console.log("Fail");
                    window.location.href = "<c:url value= "/admin/building-list?message =error" />";
                    console.log(response);
                }
            });

        }


        $('#btnassignmentBuilding').click(function(e){
            e.preventDefault();
            var data = {};
            data['buildingId'] = $('#buildingId').val();
            var staffs = $('#stafflist').find('tbody input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            data['staffs'] = staffs;
            if(data['staffs'] != ''){
                assignment(data);
            }
            console.log("oke");
        });

        function assignment(data){
            $.ajax({

                url: "${buildingAPI}/" + 'assignment',
                type: "POST",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: 'json',
                success: function (response) {
                    console.info("success");
                },
                error: function(response){
                    console.info("Giao khong thanh cong");
                    window.location.href = "<c:url value= "/admin/building-list?message =error" />";
                    console.log(response);
                }
            });
        }

        $('#btnSearchBuilding').click(function (e){
            e.preventDefault();
            $('#listForm input[type="text"], #listForm input[type="number"]').each(function() {
                $(this).val($.trim($(this).val()));
            });
            $('#listForm').submit();
        });
        function deleteBuilding(id){
            var buildingId = [id];
            deleteBuildings(buildingId);
        }


        $('#btnDeleteBuilding').click(function(e){
            e.preventDefault();
            var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
                return $(this).val();
            }).get();
            deleteBuildings(buildingIds);
        });

        function deleteBuildings(data){
            $.ajax({
                type: "DELETE",
                url: "${buildingAPI}/" + data,
                data: JSON.stringify(data),
                contentType: "application/json",
                // dataType: "JSON",
                success: function (respond) {
                    console.log("Success");
                    window.location.reload(); // Load lại trang khi thành công
                },
                error: function(respond){
                    console.log("Fail");
                    console.log(respond);
                }
            });
        }



    </script>
</body>
</html>
