<%-- 
    Document   : checkout
    Created on : May 31, 2014, 8:33:48 PM
    Author     : Vladimir
--%>

<link type="text/css" rel="stylesheet" href="<c:url value="assets/css/checkout.css" />" />

<div id="centerColumn">

    <h2>checkout</h2>

    <p>[ text ]</p>

    <form action="purchase" method="post">

        <table id="checkoutTable">
            <tr>
                <td>[ form containing fields to
                    <br>capture customer details ]</td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td><input type="submit" value="submit button"></td>
            </tr>

        </table>

    </form>

    <div id="infoBox">

        <div style="border: black solid 1px; height:100px; padding: 10px">
            [ purchase conditions ]
        </div>

        <div id="priceBox">
            [ purchase calculations:<br>subtotal + delivery charge ]
        </div>
    </div>
</div>