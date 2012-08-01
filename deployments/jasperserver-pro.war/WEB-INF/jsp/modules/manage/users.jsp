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

<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="/spring" prefix="spring"%>
<%@ page import="com.jaspersoft.jasperserver.api.security.SecurityConfiguration" %>

<%@ include file="../common/jsEdition.jsp" %>
<c:choose>
    <c:when test="${isProVersion}">
        <c:set var="bodyColumnClass" value="threeColumn"/>
    </c:when>
    <c:otherwise>
        <c:set var="bodyColumnClass" value="twoColumn"/>
    </c:otherwise>
</c:choose>

<t:insertTemplate template="/WEB-INF/jsp/templates/page.jsp">
    <t:putAttribute name="pageTitle">
        <spring:message code="jsp.userManager.header" javaScriptEscape="true"/>
    </t:putAttribute>
    <t:putAttribute name="bodyID" value="manage_users"/>
    <t:putAttribute name="bodyClass">${bodyColumnClass} manager</t:putAttribute>
    <t:putAttribute name="headerContent" >
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/tools.infiniteScroll.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/mng.common.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/mng.common.actions.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/mng.main.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/org.user.mng.main.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/org.user.mng.components.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/org.user.mng.actions.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/encryption.utils.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/jquery/js/jquery.jcryption.min.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/jquery/js/ext.jquery.jcryption.js"></script>
        <script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/scripts/utils.common.js"></script>
        <script type="text/javascript" language="JavaScript">
            var isEncryptionOn = <%= SecurityConfiguration.isEncryptionOn()%>;
        </script>
    </t:putAttribute>
    <t:putAttribute name="bodyContent">
        <t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
            <t:putAttribute name="containerID" value="users"/>
            <t:putAttribute name="containerClass" value="column decorated primary showingToolBar"/>
            <t:putAttribute name="containerTitle">
                <spring:message code="jsp.userManager.users" javaScriptEscape="true"/>
            </t:putAttribute>
            <t:putAttribute name="headerContent">
            	    <t:insertTemplate template="/WEB-INF/jsp/templates/control_searchLockup.jsp">
				        <t:putAttribute name="containerID" value="secondarySearchBox"/>
				        <t:putAttribute name="inputID" value="secondarySearchInput"/>
				    </t:insertTemplate>
                <div class="toolbar">
                    <ul class="list buttonSet">
                        <li class="node open">
                            <ul class="list buttonSet">
                                <%--bug 18939: &#8230 changed to "..." --%>
                                <li class="leaf"><button id="addNewUserBtn" class="button capsule text up"><span class="wrap"><spring:message code="jsp.userManager.addUser" javaScriptEscape="true"/>...</span><span class="icon"></span></button></li>
                            </ul>
                        </li>
                        <li class="node open"><!-- NOTE: This node here in reference to bugzilla#13160, do not include unless bug given target/priority for Ruby -->
                            <ul class="list buttonSet">
                                <li class="leaf"><button id="enableAllUsersBtn" class="button capsule text first up" disabled="disabled"><span class="wrap"><spring:message code="jsp.userManager.enableAll" javaScriptEscape="true"/></span><span class="icon"></span></button></li>
                                <li class="leaf"><button id="disableAllUsersBtn" class="button capsule text middle up" disabled="disabled"><span class="wrap"><spring:message code="jsp.userManager.disableAll" javaScriptEscape="true"/></span><span class="icon"></span></button></li>
                                <li class="leaf"><button id="deleteAllUsersBtn" class="button capsule text last up" disabled="disabled"><span class="wrap"><spring:message code="jsp.userAndRoleManager.deleteAll" javaScriptEscape="true"/></span><span class="icon"></span></button></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </t:putAttribute>
            <t:putAttribute name="bodyID" value="listContainer"/>
            <t:putAttribute name="bodyContent">
                <ol id="entitiesList"></ol>
            </t:putAttribute>
            <t:putAttribute name="footerContent">
            </t:putAttribute>
        </t:insertTemplate>
        

        <t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
            <t:putAttribute name="containerID" value="folders"/>
            <t:putAttribute name="containerClass" value="column decorated secondary sizeable"/>
            <t:putAttribute name="containerElements">
                <div class="sizer horizontal"></div>
                <button class="button minimize"></button>
            </t:putAttribute>
            <t:putAttribute name="containerTitle">
                <spring:message code="jsp.userManager.organizations" javaScriptEscape="true"/>
            </t:putAttribute>
            <t:putAttribute name="bodyClass" value=""/>
            <t:putAttribute name="bodyContent" >
                    <ul id="orgTree"></ul>
                    <div id="ajaxbuffer"></div>
            </t:putAttribute>
        </t:insertTemplate>

        <t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
            <t:putAttribute name="containerID" value="properties"/>
            <t:putAttribute name="containerClass" value="column decorated tertiary sizeable"/>
            <t:putAttribute name="containerElements">
                <div class="sizer horizontal"></div>
                <button class="button minimize"></button>
            </t:putAttribute>
            <t:putAttribute name="containerTitle"><spring:message code="jsp.userAndRoleManager.properties" javaScriptEscape="true"/></t:putAttribute>
            <t:putAttribute name="bodyClass" value=""/>   

            <t:putAttribute name="bodyContent">
                <t:insertTemplate template="/WEB-INF/jsp/templates/nothingToDisplay.jsp">
                    <t:putAttribute name="bodyContent">
                        <p class="message"><spring:message code="jsp.userManager.properties.nothingToDisplay" javaScriptEscape="true"/></p>
                    </t:putAttribute>
                </t:insertTemplate>

                <fieldset class="group">
                    <legend class="offLeft"><span><spring:message code="dialog.file.nameAndDescription" javaScriptEscape="true"/></span></legend>
                    <label class="control input text" class="required" for="userName" title="<spring:message code="jsp.userManager.userCreator.fullName.title" javaScriptEscape="true"/>">
                        <span class="wrap"><spring:message code="jsp.userManager.userCreator.fullName" javaScriptEscape="true"/>:</span>
                        <input class="" id="userName" type="text" maxlength="100" value="" readonly="readonly"/>
                        <span class="message warning"></span>
                    </label>
                    <label class="control input text" for="userID" title="<spring:message code="jsp.userManager.userCreator.userId.title" javaScriptEscape="true"/>">
                        <span class="wrap"><spring:message code="jsp.userManager.userCreator.userId" javaScriptEscape="true"/>:</span>
                        <input class="" id="propUserID" type="text" maxlength="100" value="" readonly="readonly"/>
                        <span class="hint"><spring:message code="jsp.userManager.userEditor.userId.hint" javaScriptEscape="true"/></span>
                        <span class="message warning"></span>
                    </label>                  
                    <label class="control input text" class="required" for="email" title="<spring:message code="jsp.userManager.userCreator.emailAddress.title" javaScriptEscape="true"/>">
                        <span class="wrap"><spring:message code="jsp.userManager.userCreator.emailAddress" javaScriptEscape="true"/>:</span>
                        <input class="" id="email" type="text" maxlength="100" value="" readonly="readonly"/>
                        <span class="message warning"></span>
                    </label>
                </fieldset>
                <fieldset id="passwords" class="group">
                    <legend class="offLeft"><span><spring:message code="jsp.userManager.userCreator.password.legend" javaScriptEscape="true"/></span></legend>
                    <label class="control input password" class="required" for="password" title="<spring:message code="jsp.userManager.userCreator.password.title" javaScriptEscape="true"/>">
                        <span class="wrap"><spring:message code="jsp.userManager.userCreator.password" javaScriptEscape="true"/> (<spring:message code='required.field'/>):</span>
                        <%-- Input password max length dependent on the length of encoded password. Currently it is 47 characters. --%>
                        <input class="" id="password" type="password" maxlength="47" value=""/>
                        <span class="message warning"></span>
                        <span class="message hint"></span>
                    </label>
                    <label class="control input password" class="required" for="confirmPassword" title="<spring:message code="jsp.userManager.userCreator.password.title" javaScriptEscape="true"/>">
                        <span class="wrap"><spring:message code="jsp.userManager.userCreator.confirmPassword" javaScriptEscape="true"/> (<spring:message code='required.field'/>):</span>
                        <%-- Input password max length dependent on the length of encoded password. Currently it is 47 characters. --%>
                        <input class="" id="confirmPassword" type="password" maxlength="47" value=""/>
                        <span class="message warning"></span>
                        <span class="message hint"></span>
                    </label>
                </fieldset>
                <fieldset class="group">
                    <div class="control checkBox">
                        <label class="wrap" for="enableUser" title="<spring:message code="jsp.userManager.userCreator.enableThisUser.title" javaScriptEscape="true"/>">
                            <spring:message code="jsp.userManager.userCreator.enableThisUser" javaScriptEscape="true"/>
                        </label>
                        <input id="enableUser" type="checkbox" checked="checked" disabled="disabled"/>
                    </div>
                </fieldset>
                <fieldset class="group">
                    <div class="control checkBox">
                        <label class="wrap" for="externalUser" title="<spring:message code="jsp.userManager.userEditor.externallyDefined" javaScriptEscape="true"/>">
                            <spring:message code="jsp.userManager.userEditor.externallyDefined" javaScriptEscape="true"/>     
                        </label>
                        <input id="externalUser" type="checkbox" checked="checked" disabled="disabled"/>
                        <span class="hint"><spring:message code="jsp.userManager.userEditor.externallyDefined.hint" javaScriptEscape="true"/></span>
                    </div>
                </fieldset>
                <fieldset id="attributes" class="group">
                        <ul class="list type_attributes">
                            <li class="node"><span class="label wrap"><spring:message code="jsp.userManager.assignedRoles" javaScriptEscape="true"/>:</span>
                                <ol id="assignedViewList"></ol>
                            </li>
                            <li class="node"><span class="label wrap"><spring:message code="jsp.userManager.profileAttributes" javaScriptEscape="true"/>:</span>
                                <ol id="profileAttributes"></ol>
                            </li>
                        </ul>
                </fieldset>
                <fieldset id="editRoles" class="row twoColumn_equal pickWells">
                    <!-- start two columns -->
                        <div id="moveButtons" class="centered_horz">
                            <button id="addToAssigned" class="button action square move right up"><span class="wrap"><b class="icon"></b></span></button>
                            <button id="removeFromAssigned" class="button action square move left up"><span class="wrap"><b class="icon"></b></span></button>
                        </div>
                            
                    <t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
                        <t:putAttribute name="containerClass" value="column decorated primary showingSubHeader"/>
                            <t:putAttribute name="containerTitle"><spring:message code="jsp.userManager.assignedRoles" javaScriptEscape="true"/></t:putAttribute>
                            <t:putAttribute name="containerID" value="assigned"/>
                            <t:putAttribute name="headerContent">
                                <div class="sub header">
                                	<t:insertTemplate template="/WEB-INF/jsp/templates/control_searchLockup.jsp">
								        <t:putAttribute name="inputID" value="assignedSearchInput"/>
								    </t:insertTemplate>
                                </div>
                            </t:putAttribute>

                            <t:putAttribute name="bodyContent">    
                                <ul id="assignedList"></ul>
                            </t:putAttribute>
                        </t:insertTemplate>
                        
                        <t:insertTemplate template="/WEB-INF/jsp/templates/container.jsp">
                            <t:putAttribute name="containerClass" value="column decorated secondary sizeable showingSubHeader"/>
                            <t:putAttribute name="containerElements">
                                <div class="sizer horizontal"></div>
                                <button class="button minimize"></button>
                            </t:putAttribute>
                            <t:putAttribute name="containerTitle"><spring:message code="jsp.userManager.userEditor.roleEditor.available" javaScriptEscape="true"/></t:putAttribute>
                            <t:putAttribute name="containerID" value="available"/>
                            <t:putAttribute name="headerContent">
                                <div class="sub header">
                                	<t:insertTemplate template="/WEB-INF/jsp/templates/control_searchLockup.jsp">
								        <t:putAttribute name="inputID" value="availableSearchInput"/>
								    </t:insertTemplate>
                                </div> 
                            </t:putAttribute>

                            <t:putAttribute name="bodyContent">
                                <ul id="availableList"></ul>
                            </t:putAttribute>
                            
                        </t:insertTemplate>
                    <!-- end two columns -->
                </fieldset>
            </t:putAttribute>
            <t:putAttribute name="footerID" value="propertiesButtons"/>
            <t:putAttribute name="footerContent">
                <button id="edit" type="submit" class="button action primary up"><span class="wrap"><spring:message code="form.edit" javaScriptEscape="true"/></span><span class="icon"></span></button>
                <button id="save" type="submit" class="button action primary up"><span class="wrap"><spring:message code="form.edit.save" javaScriptEscape="true"/></span><span class="icon"></span></button>
                <button id="loginAsUser" type="submit" class="button action up"><span class="wrap"><spring:message code="button.loginAsUser" javaScriptEscape="true"/></span><span class="icon"></span></button>
                <button id="delete" type="submit" class="button action up"><span class="wrap"><spring:message code="button.deleteUser" javaScriptEscape="true"/></span><span class="icon"></span></button>
                <button id="cancel" type="submit" class="button action up"><span class="wrap"><spring:message code="form.edit.cancel" javaScriptEscape="true"/></span><span class="icon"></span></button>
            </t:putAttribute>
        </t:insertTemplate>
        
        <t:insertTemplate template="/WEB-INF/jsp/templates/addUser.jsp">
            <t:putAttribute name="containerClass" value="hidden"/>
        </t:insertTemplate>
        <jsp:include page="usersState.jsp"/>

        <form action="j_spring_switch_user" method="post" id="loginAsForm" name="loginAsForm">
            <input id="j_username"  name="j_username" type="hidden" />
        </form>
    </t:putAttribute>
        
</t:insertTemplate>
