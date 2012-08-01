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
    Usage:permit user to add a file to the repository

Usage:

    <t:insertTemplate template="/WEB-INF/jsp/templates/permissions.jsp">
    </t:insertTemplate>

--%>

<%@ page import="com.jaspersoft.jasperserver.api.JSException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:useAttribute id="containerClass" name="containerClass" classname="java.lang.String" ignore="true"/>
<t:useAttribute id="bodyContent" name="bodyContent" classname="java.lang.String" ignore="true"/>
<t:useAttribute id="selectFileButtonId" name="selectFileButtonId" classname="java.lang.String" ignore="true"/>
<t:useAttribute id="cancelButtonId" name="cancelButtonId" classname="java.lang.String" ignore="true"/>


<!--/WEB-INF/jsp/templates/permissions.jsp revision A-->
<t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
    <t:putAttribute name="containerID" value="permissions"/>
    <t:putAttribute name="containerClass">panel dialog overlay moveable sizeable centered_horz centered_vert permissions ${containerClass}</t:putAttribute>
    <t:putAttribute name="containerElements"><div class="sizer diagonal"></div></t:putAttribute>
    <t:putAttribute name="headerClass" value="mover"/>
    <t:putAttribute name="containerTitle"><spring:message code="permissionsDialog.title" javaScriptEscape="true"/>:&nbsp;<span class="path">the/path/to/the/object/here</span></t:putAttribute>
    <t:putAttribute name="bodyContent">
        <ul id="permissionsViewBy" class="list tabSet text control horizontal responsive">
            <li class="label first disabled" disabled="disabled"><p class="wrap"><spring:message code="permissionsDialog.viewBy" javaScriptEscape="true"/>:</p></li>
            <li class="tab"><p class="wrap button"><spring:message code="permissionsDialog.byUser" javaScriptEscape="true"/></p></li>
            <li class="tab last selected"><p class="wrap button"><spring:message code="permissionsDialog.byRole" javaScriptEscape="true"/></p></li>
        </ul>
        <t:insertTemplate template="/WEB-INF/jsp/templates/control_searchLockup.jsp">
            <t:putAttribute name="containerID" value="searchPermissionsBox"/>
            <t:putAttribute name="inputID" value="permissionsSearchInput"/>
        </t:insertTemplate>

        <t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
            <t:putAttribute name="containerID" value="permissionsListContainer"/>
            <t:putAttribute name="containerClass" value="control groupBox fillParent"/>
            <t:putAttribute name="bodyContent">${bodyContent}</t:putAttribute>
        </t:insertTemplate>
        <p class="message hint"><spring:message code="permissionsDialog.hint" javaScriptEscape="true"/></p>
        <p class="message warning"><spring:message code="permissionsDialog.navWarning" javaScriptEscape="true"/></p>
    </t:putAttribute>
    <t:putAttribute name="footerContent">
        <button id="permissionsApply" class="button action primary up"><span class="wrap"><spring:message code="button.apply"/></span><span class="icon"></span></button>
        <button id="permissionsOk" class="button action up"><span class="wrap"><spring:message code="button.ok"/></span><span class="icon"></span></button>
        <button id="permissionsCancel" class="button action up"><span class="wrap"><spring:message code="button.cancel"/></span><span class="icon"></span></button>
    </t:putAttribute>
</t:insertTemplate>
