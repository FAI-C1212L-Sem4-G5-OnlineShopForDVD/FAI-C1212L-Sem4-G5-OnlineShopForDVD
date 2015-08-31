<%-- 
    Document   : cart.jsp
    Created on : Aug 23, 2015, 11:43:57 AM
    Author     : hainam1421
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@include file="head.jsp" %>

    <body>
        <%@include file="header.jsp" %>

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <s:if test="#session.car != null">    
                                <s:iterator value="#session.car" status="stat" var="ride">

                                    <tr>
                                        <td class="cart_product">
                                            <a href=""><img src="<s:property value="products.img"/>" alt="" /></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><a href=""><s:property value="products.name"/></a></h4>
                                            <p>Web ID: <s:property value="q_id"/></p>
                                        </td>
                                        <td class="cart_price">
                                            <p>$<s:property value="products.monney"/></p>
                                        </td>
                                        <td class="cart_quantity">
                                            <s:url action="Quantity" var="down">
                                                <s:param name="id">${products.p_id}</s:param>
                                                <s:param name="active">down</s:param>
                                            </s:url>
                                            <s:url action="Quantity" var="up">
                                                <s:param name="id">${products.p_id}</s:param>
                                                <s:param name="active">up</s:param>
                                            </s:url>

                                            <div class="cart_quantity_button">
                                                <s:a cssClass="cart_quantity_up" href="%{up}"> + </s:a>
                                                <input readonly class="cart_quantity_input" type="text" name="quantity" value="<s:property value="number"/>" autocomplete="off" size="2">
                                                <s:a cssClass="cart_quantity_down" href="%{down}"> - </s:a >
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price">$<s:property value="price"/></p>
                                        </td>
                                        <td class="cart_delete">
                                            <s:url action="Quantity" var="remove">
                                                <s:param name="id">${products.p_id}</s:param>
                                                <s:param name="active">remove</s:param>
                                            </s:url>
                                            <s:a cssClass="cart_quantity_delete" href="%{remove}"><i class="fa fa-times"></i></s:a>
                                            </td>
                                        </tr>
                                </s:iterator>
                            </s:if> 
                            <s:else>
                                <tr>
                                    <td class="cart_product">

                                    </td>
                                    <td class="cart_description">

                                    </td>
                                    <td class="cart_price">

                                    </td>
                                    <td class="cart_quantity">

                                    </td>
                                    <td class="cart_total">

                                    </td>
                                    <td class="cart_delete">

                                    </td>
                                </tr>
                            </s:else>

                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>What would you like to do next?</h3>
                    <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="chose_area">
                            <ul class="user_option">
                                <li>
                                    <input type="checkbox">
                                    <label>Use Coupon Code</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Use Gift Voucher</label>
                                </li>
                                <li>
                                    <input type="checkbox">
                                    <label>Estimate Shipping & Taxes</label>
                                </li>
                            </ul>
                            <ul class="user_info">
                                <li class="single_field">
                                    <label>Country:</label>
                                    <select>
                                        <option>United States</option>
                                        <option>Bangladesh</option>
                                        <option>UK</option>
                                        <option>India</option>
                                        <option>Pakistan</option>
                                        <option>Ucrane</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field">
                                    <label>Region / State:</label>
                                    <select>
                                        <option>Select</option>
                                        <option>Dhaka</option>
                                        <option>London</option>
                                        <option>Dillih</option>
                                        <option>Lahore</option>
                                        <option>Alaska</option>
                                        <option>Canada</option>
                                        <option>Dubai</option>
                                    </select>

                                </li>
                                <li class="single_field zip-field">
                                    <label>Zip Code:</label>
                                    <input type="text">
                                </li>
                            </ul>
                            <a class="btn btn-default update" href="">Get Quotes</a>
                            <a class="btn btn-default check_out" href="">Continue</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="total_area">

                            <ul>
                                <li>Shipping Cost <span>Free</span></li>
                                    <s:if test="#session.total != null"> 
                                    <li>Total <span>$<s:property value="#session.total"></s:property></span></li>
                                    </s:if>
                                    <s:else>
                                    <li>Total <span>$0</span></li>
                                    </s:else>
                            </ul>

                            <s:url action="CheckOut" var="checkout">
                                <s:param name="active">rlr</s:param>
                            </s:url>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <s:a cssClass="btn btn-default check_out" href="%{checkout}">Check Out</s:a>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!--/#do_action-->

        <%@include file="footer.jsp" %>



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
