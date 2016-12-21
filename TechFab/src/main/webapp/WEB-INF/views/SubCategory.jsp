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
<div ng-app="app" ng-controller="myController" >

<div class="alert alert-info">
    <p>Sort Type: {{ sortType }}</p>
    <p>Sort Reverse: {{ sortReverse }}</p>
    <p>Search Query: {{ searchSubCategory }}</p>
    <input type="text" placeholder="Search the category" ng-model="searchSubCategory">
    
  </div>

        <form:form modelAttribute="subCategory" action="addSubCategory">
        <form:label  path="subCategoryId"> SubCategory Id </form:label>
        <form:input path="subCategoryId"/>
        
        <form:label path="subCategoryName"> SubCategory Name </form:label>
        <<form:input path="subCategoryName" />
        
       <form:label path="subCategoryDescription"> SubCategory Description </form:label>
        <form:input path="subCategoryDescription"/>
        
        <form:select path="category.categoryName" items="${categoryList}" itemValue="categoryName" itemLabel="categoryName"></form:select>
          <input type="submit" value="submit"/>
        
        </form:form>
        
        <br>
<h3>Category List</h3>  

    <table class="tg">  
    <tr>  
        <th width="80">subcategory Id</th>  
        <th width="120">subCategory Name</th>  
        <th width="120">subcategory description</th>  
        <th width="80">Edit subcategory</th>  
        <th width="80">Delete subcategory</th>  
        
         
    </tr>  
        
            
        <tr ng-repeat="sclist in jsonData | orderBy:sortType:sortReverse | filter:searchSubCategory">  
            <td>{{sclist.subCategoryId}}</td>  
            <td>{{sclist.subCategoryName}}</td>  
            <td>{{sclist.subCategoryDescription}}</td>  
            <td><a href="editSubCategory-{{sclist.subCategoryId}}" >Edit</a></td>  
           <td><a href="deleteSubCategory-{{sclist.subCategoryId}}">Delete</a></td> 
</tr>  
    
        
        
        </table>
    
    <script type="text/javascript">
    var app=angular.module('app',[]);
    app.controller("myController",function($scope){
    	$scope.sortType     = 'subCategoryName';
  	  $scope.sortReverse  = false; 
  	  $scope.searchSubCategory   = ''; 
  	
    	$scope.jsonData=${subCategoryList};
    });
    
    </script>
    
    
    
           </div> 
   
   </body>
</html>