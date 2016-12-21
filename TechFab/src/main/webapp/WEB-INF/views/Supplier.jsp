<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supplier form</title>
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
<h2>Supplier</h2>
<div ng-app="app" ng-controller="myController" >
<div class="alert alert-info">
    <p>Sort Type: {{ sortType }}</p>
    <p>Sort Reverse: {{ sortReverse }}</p>
    <p>Search Query: {{ searchSupplier}}</p>
    <input type="text" placeholder="Search the supplier" ng-model="searchSupplier">
    
  </div>


<form:form method="POST" modelAttribute="supplier" action="addSupplier">
   <table>
    <tr>
        <td><form:label  path="supplierId">Supplier Id</form:label></td>
        <td><form:input type="hidden" path="supplierId"/></td>
    </tr>
   
   
    <tr>
        <td><form:label path="supplierName">Supplier Name</form:label></td>
        <td><form:input path="supplierName" /></td>
    </tr>
    <tr>
        <td><form:label path="supplierAddress">Supplier Address</form:label></td>
        <td><form:input path="supplierAddress" /></td>
    </tr>
    <tr>
        <td><form:label path="supplierContact">Supplier Contact</form:label></td>
        <td><form:input path="supplierContact" /></td>
    </tr>
    
    
    <tr>
        <td colspan="2">
            <input type="submit" value="addSupplier"/>
        </td>
    </tr>
</table>  
</form:form>

<br>
<h3>Supplier List</h3>  

    <table class="tg">  
    <tr>  
        <th width="80">Supplier Id</th>  
        <th width="120">Supplier Name</th>  
        <th width="120">Supplier Address</th> 
        <th width="120">Supplier Contact</th> 
         
        <th width="80">Edit supplier</th>  
        <th width="80">Delete supplier</th>  
        
         
    </tr>  
      <tr ng-repeat="slist in jsonData | orderBy:sortType:sortReverse | filter:searchSupplier">  
            <td>{{slist.supplierId}}</td>  
            <td>{{slist.supplierName}}</td>  
            <td>{{slist.supplierAddress}}</td>  
             <td>{{slist.supplierContact}}</td>  
            
            <td><a href="editSupplier-{{slist.supplierId}}" >Edit</a></td>  
           <td><a href="deleteSupplier-{{slist.supplierId}}">Delete</a></td> 
</tr>  
    </table> 
   <script type="text/javascript">
    var app=angular.module('app',[]);
    app.controller("myController",function($scope){
    	$scope.sortType     = 'supplierName';
  	  $scope.sortReverse  = false; 
  	  $scope.searchSupplier   = ''; 
  	
    	$scope.jsonData=${supplierList};
    });
    
    
    
    </script>
   
   
    
   </div>
   </body>
</html>
