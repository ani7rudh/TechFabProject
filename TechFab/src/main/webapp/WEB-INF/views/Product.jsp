<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <script src="resources/js/angular.min.js"></script>

<style>             
.blue-button{  
    background: #25A6E1;  
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',endColorstr='#188BC0',GradientType=0);  
    padding:3px 5px;  
    color:#fff;  
    font-family:'Helvetica Neue',sans-serif;  
    font-size:12px;  
    border-radius:2px;  
    -moz-border-radius:2px;  
    -webkit-border-radius:4px;  
    border:1px solid #1A87B9  
}       
table {  
  font-family: "Helvetica Neue", Helvetica, sans-serif;  
   width: 50%;  
}  
th {  
  background: SteelBlue;  
  color: white;  
}  
 td,th{  
                border: 1px solid gray;  
                width: 25%;  
                text-align: left;  
                padding: 5px 10px;  
            }  
</style>

</head>
<body>
<h2>product</h2>
<div ng-app="app" ng-controller="myController" >
<div class="alert alert-info">
    <p>Sort Type: {{ sortType }}</p>
    <p>Sort Reverse: {{ sortReverse }}</p>
    <p>Search Query: {{ searchProduct }}</p>
    <input type="text" placeholder="Search the product" ng-model="searchProduct">
    
  </div>


 <form:form method="POST" modelAttribute="product" action="addProduct" enctype="multipart/form-data">
   <table>
    <tr>
        <td><form:label  path="productId">Product Id</form:label></td>
        <td><form:input type="hidden" path="productId"/></td>
    </tr>
   
   
    <tr>
        <td><form:label path="productName">Product Name</form:label></td>
        <td><form:input path="productName" /></td>
    </tr>
    <tr>
        <td><form:label path="productDescription">product Description</form:label></td>
        <td><form:input path="productDescription" /></td>
    </tr>
    
    <tr>
        <td><form:label path="productQuantity">product Quantity</form:label></td>
        <td><form:input path="productQuantity" /></td>
    </tr>
    
    <tr>
        <td><form:label path="productPrice">product price</form:label></td>
        <td><form:input path="productPrice" /></td>
    </tr>
    
     <tr>
        <td><form:label path="productDiscount">product discount</form:label></td>
        <td><form:input path="productDiscount" /></td>
    </tr>
    
    <tr>
    <td><form:label path="productImage">product Image</form:label></td>
    <td> <form:input path="productImage" type="file" name="file"></form:input></td>
    
    </tr>
    
    
    
    <tr>
    <td><form:select path="category.categoryName" items="${categoryList}" itemValue="categoryName" itemLabel="categoryName"></form:select>
    </td>
    <td><form:select path="subCategory.subCategoryName" items="${subCategoryList}" itemValue="subCategoryName" itemLabel="subCategoryName"></form:select>
    </td>
    <td><form:select path="brand.brandName" items="${brandList}" itemValue="brandName" itemLabel="brandName"></form:select>
    </td>
    <td><form:select path="supplier.supplierName" items="${supplierList}" itemValue="supplierName" itemLabel="supplierName"></form:select>
    </td>
        <td colspan="2">
            <input type="submit" value="addProduct"/>
        </td>
    </tr>
</table>  
</form:form>

<br>
<h3>Product List</h3>  

    <table class="tg">  
    <tr>  
        <th width="80">product Id</th>  
        <th width="120">Product Name</th>  
        <th width="120">product description</th>  
        <th width="120">product quantity</th>  
        <th width="120">product price</th>  
        <th width="120">product discount</th>  
        
        <th width="80">Edit product</th>  
        <th width="80">Delete product</th>  
        
         
    </tr>  
        <tr ng-repeat="plist in jsonData | orderBy:sortType:sortReverse | filter:searchProduct">  
            <td>{{plist.productId}}</td>  
            <td>{{plist.productName}}</td>  
            <td>{{plist.productDescription}}</td>  
            <td>{{plist.productQuantity}}</td>  
            <td>{{plist.productPrice}}</td>  
            <td>{{plist.productDiscount}}</td>  
            
            <td><a href="editProduct-{{plist.productId}}" >Edit</a></td>  
           <td><a href="deleteProduct-{{plist.productId}}">Delete</a></td> 
</tr>  
    </table> 
    <script type="text/javascript">
    var app=angular.module('app',[]);
    app.controller("myController",function($scope){
    	$scope.sortType     = 'productName';
  	  $scope.sortReverse  = false; 
  	  $scope.searchProduct  = ''; 
    	$scope.jsonData=${productList};
    });
    
    </script>
   
    
   
</div>

</body>
</html>