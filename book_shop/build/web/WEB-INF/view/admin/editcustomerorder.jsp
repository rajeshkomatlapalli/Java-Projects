<%-- 
    Document   : editcustomerorder
    Created on : Jun 6, 2014, 10:49:24 PM
    Author     : Vladimir
--%>

<!-- custom edit customer order css -->
<link type="text/css" rel="stylesheet" href="<c:url value="/assets/css/editcustomerorder.css" />" />

<!-- Datatable css -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0-beta.1/css/jquery.dataTables.css">

<!-- custom edit customer order page js -->
<script type="text/javascript" src="<c:url value="/assets/js/editcustomerorder.js" />" ></script>

<!-- Datatable js -->
<script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.0/js/jquery.dataTables.js"></script>

<p id="pageTitle">Edit Customer Order</p>

<div id="csrf" style="visibility: hidden;">${csrfPreventionSalt}</div>

<div id="centerColumn">
    
    <c:if test="${empty sessionScope.username}">
        <br><br>
        <p>You're not logged in!</p><a href="<c:url value='/login/login'/>" >Login</a>
        <br><br>
    </c:if>
    
    <c:if test="${not empty sessionScope.username && sessionScope.isAdmin == false }">
        <br><br>
        <p>You don't have sufficient permission to access the page!</p>
    </c:if>
    
    <c:if test="${not empty sessionScope.username  && sessionScope.isAdmin == true}">
        
        <!-- Update customer order -->
        <div id="ajax_update_customer_order_response_success" class="alert alert-success"></div>

        <!-- Delete customer order -->
        <div id="ajax_delete_customer_order_response_success" class="alert alert-success"></div>
        <div id="ajax_delete_customer_order_response_error" class="alert alert-danger"></div>
        <br />
    
        <div id="preloader"><img src="<c:url value="/assets/images/loader/loader.gif" />" alt="Get customer order preloader" ></div>
        <div id="preloader-text">Loading...</div>
        
        <!-- jQuery datatables -->
        <div id="customer_order-list">
            <table id="customer_order-list-table" class="display">
                <thead>
                    <tr>
                        <th>Expand</th>
                        <th>Customer Name</th>
                        <th>Confirmation Number</th>
                        <th>Amount</th>
                        <th>Date Created</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody></tbody>
                <tfoot>
                    <tr>
                        <th>Expand</th>
                        <th>Customer Name</th>
                        <th>Confirmation Number</th>
                        <th>Amount</th>
                        <th>Date Created</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </c:if>
       
    <!-- Update Customer Order Modal -->
    <div class="modal fade" id="update-customer_order-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="modalLabel">Customer Order Edit Info</h4>
          </div>
          <div class="modal-body">
              
            <!-- update customer order error -->
            <div id="ajax_update_customer_order_response_error" class="alert alert-danger"></div><br />
        
            <form id="update_customer_order_form" method="post" action="#">
                <div id="customer_order_name_update">
                    <label>Customer Name</label><br>
                    <input type="text" value="" name="customer_order_name_update" readonly>
                </div><br>
                <div id="customer_order_confirmation_number_update">
                    <label>Confirmation Number</label><br>
                    <input type="text" value="" name="customer_order_confirmation_number_update">
                </div><br>
                <div id="customer_order_amount_update">
                    <label>Amount</label><br>
                    <input type="text" value="" name="customer_order_amount_update">
                </div><br>
                <div id="customer_order_date_created_update">
                    <label>Date Created</label><br>
                    <input type="text" value="" name="customer_order_date_created_update" readonly>
                </div>
                    <input type="hidden" value="" name="customer_order_id_update">
                         
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id="update_customer_order_form_submit">Save changes</button>
          </div>
        </div>
      </div>
    </div>
</div>
<div id="nav-buttons">
    <ul>
        <li>
            <button type="button" class="btn btn-success btn-small" onclick="location='<c:url value="/admin" />'" >Admin Home</button><br>
        </li>
    </ul>
    <ul>
        <li>
            <button type="button" class="btn btn-success btn-small" onclick="location='<c:url value="/index" />'" >User Home</button><br>
        </li>
    </ul>
</div>
            
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js" />"></script>

<!-- Bootbox alerts plugin plugin -->
<script src="<c:url value="/assets/plugins/bootbox/bootbox.min.js" />"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<link href="<c:url value="/assets/bootstrap/css/bootstrap.min.css" />">