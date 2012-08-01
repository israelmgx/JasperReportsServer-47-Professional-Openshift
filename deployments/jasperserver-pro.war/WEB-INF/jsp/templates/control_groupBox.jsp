<%--
  ~ Copyright (C) 2005 - 2011 Jaspersoft Corporation. All rights reserved.
  ~ http://www.jaspersoft.com.
  ~
  ~ Unless you have purchased  a commercial license agreement from Jaspersoft,
  ~ the following license terms  apply:
  ~
  ~ This program is free software: you can redistribute it and/or  modify
  ~ it under the terms of the GNU Affero General Public License  as
  ~ published by the Free Software Foundation, either version 3 of  the
  ~ License, or (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  ~ GNU Affero  General Public License for more details.
  ~
  ~ You should have received a copy of the GNU Affero General Public  License
  ~ along with this program. If not, see <http://www.gnu.org/licenses/>.
  --%>

<%--
Overview:
    To divide a panel into logical zones.
Usage:
	<tiles:insertTemplate template="/WEB-INF/jsp/templates/control_groupBox.jsp">
	    <tiles:putAttribute name="containerID" value="[OPTIONAL]"/>
	    <tiles:putAttribute name="containerClass" value="[OPTIONAL (fillParent)]"/>
	    <tiles:putAttribute name="bodyContent">
			[REQUIRED]
	    </tiles:putAttribute>
	</tiles:insertTemplate>
--%>


<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<tiles:useAttribute id="containerID" name="containerID" classname="java.lang.String" ignore="true"/>
<tiles:useAttribute id="containerClass" name="containerClass" classname="java.lang.String" ignore="true"/>

<!--/WEB-INF/jsp/templates/control_groupBox.jsp revision A-->
<span <c:if test="${not empty containerID}">id="<tiles:getAsString name="containerID"/>"</c:if> class="control groupBox ${containerClass}">
    <tiles:insertTemplate template="/WEB-INF/jsp/templates/utility_cosmetic.jsp"/>
    <div class="content">
        <div class="body">
            <tiles:insertAttribute name="bodyContent"/>
        </div><!--/.body -->
    </div><!--/.content -->
</span><!--/.control-->
