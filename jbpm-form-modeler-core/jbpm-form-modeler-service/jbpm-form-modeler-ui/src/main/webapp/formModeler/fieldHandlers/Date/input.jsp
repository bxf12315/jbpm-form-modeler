<%--

    Copyright (C) 2012 JBoss Inc

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="org.jbpm.formModeler.core.processing.fieldHandlers.DateFieldHandler" %>
<%@ taglib prefix="static" uri="static-resources.tld" %>
<%@ taglib uri="mvc_taglib.tld" prefix="mvc" %>
<%@ taglib uri="http://jakarta.apache.org/taglibs/i18n-1.0" prefix="i18n" %>
<%try {%>
<mvc:formatter name="DateFieldHandlerFormatter">
    <mvc:fragment name="output">
        <mvc:fragmentValue name="name" id="name">
            <mvc:fragmentValue name="title" id="title">
                <mvc:fragmentValue name="styleclass" id="styleclass">
                    <mvc:fragmentValue name="size" id="size">
                        <mvc:fragmentValue name="maxlength" id="maxlength">
                            <mvc:fragmentValue name="tabindex" id="tabindex">
                                <mvc:fragmentValue name="value" id="value">
                                    <mvc:fragmentValue name="accesskey" id="accesskey">
                                        <mvc:fragmentValue name="alt" id="alt">
                                            <mvc:fragmentValue name="cssStyle" id="cssStyle">
                                                <mvc:fragmentValue name="height" id="height">
                                                    <mvc:fragmentValue name="readonly" id="readonly">
                                                        <mvc:fragmentValue name="uid" id="uid">
                                                            <mvc:fragmentValue name="timePattern" id="timePattern">
                                                                <mvc:fragmentValue name="inputPattern" id="inputPattern">
                                                                        <table border="0" cellpadding="0"
                                                                               cellspacing="0"
                                                                               class="dynInputStyle <%=StringUtils.defaultString((String) styleclass, "")%>"
                                                                                <%=cssStyle != null ? " style=\"" + cssStyle + "\"" : ""%>>
                                                                            <tr valign="top">
                                                                                <td>
                                                                                    <input type="text"
                                                                                           name="<%=name%>"
                                                                                           onchange="processFormInputChange(this)"
                                                                                           id="<%=uid%>"
                                                                                            <%=title!=null?("title=\""+title+"\""):""%>
                                                                                           class="dynInputStyle <%=StringUtils.defaultString((String) styleclass, "skn-input")%>"
                                                                                            <%=size!=null ? " size=\""+size+"\"":""%>
                                                                                            <%=maxlength!=null ? " maxlength=\""+maxlength+"\"":""%>
                                                                                            <%=tabindex!=null ? " tabindex=\""+tabindex+"\"":""%>
                                                                                            <%=accesskey!=null ? " accesskey=\""+accesskey+"\"":""%>
                                                                                            <%=alt!=null ? " alt=\""+alt+"\"":""%>
                                                                                            <%=cssStyle!=null ? " style=\""+cssStyle+"\"":""%>
                                                                                            <%=height!=null ? " height=\""+height+"\"":""%>
                                                                                           readonly
                                                                                            <%=Boolean.TRUE.equals(readonly)? " disabled ":""%>
                                                                                           value="<%=value%>">
                                                                                    <%
                                                                                        if (!Boolean.TRUE.equals(readonly)) {
                                                                                    %>
                                                                                    <script >
                                                                                        $(function() {
                                                                                            $("input[id='<%=uid%>']").datetimepicker({
                                                                                                dateFormat:"<%=inputPattern%>",
                                                                                                timeFormat:"<%=timePattern%>"
                                                                                            })
                                                                                        });
                                                                                    </script>
                                                                                    <%
                                                                                        }
                                                                                    %>
                                                                                </td>
                                                                                <td style="padding-left:5px;">
                                                                                    <input type="hidden"
                                                                                           name="<%=name + DateFieldHandler.HAS_CHANGED_PARAM%>"
                                                                                           id="<%=uid + DateFieldHandler.HAS_CHANGED_PARAM%>"
                                                                                           value="false"/>
                                                                                    <a href="#"
                                                                                            <%
                                                                                                if (!Boolean.TRUE.equals(readonly)) {
                                                                                            %>
                                                                                       onclick="document.getElementById('<%=uid + DateFieldHandler.HAS_CHANGED_PARAM%>').value = true;
                                                                                               $('input[id=\'<%=uid%>\']').datetimepicker('show');
                                                                                               return false;"
                                                                                            <%
                                                                                            } else {
                                                                                            %>
                                                                                       onclick="return false"
                                                                                            <%
                                                                                                }
                                                                                            %>
                                                                                            >
                                                                                        <img src="<static:image relativePath="general/16x16/ico-calendar.png"/>"
                                                                                             border="0">
                                                                                    </a>
                                                                                </td>
                                                                                <%
                                                                                    if (!Boolean.TRUE.equals(readonly)) {
                                                                                %>
                                                                                <td>
                                                                                    <a href="#">
                                                                                        <img src="<static:image relativePath="general/16x16/ico-trash.png"/>"
                                                                                             border="0"
                                                                                             onclick="var dt = document.getElementById('<%=uid%>');
                                                                                                     dt.value='';
                                                                                                     $('input[id=\'<%=uid%>\']').datetimepicker('hide');
                                                                                                     document.getElementById('<%=uid + DateFieldHandler.HAS_CHANGED_PARAM%>').value = true;
                                                                                                     processFormInputChange(dt);
                                                                                                     return false;">
                                                                                    </a>
                                                                                </td>
                                                                                <%
                                                                                    }
                                                                                %>
                                                                            </tr>
                                                                        </table>
                                                                </mvc:fragmentValue>
                                                            </mvc:fragmentValue>
                                                        </mvc:fragmentValue>
                                                    </mvc:fragmentValue>
                                                </mvc:fragmentValue>
                                            </mvc:fragmentValue>
                                        </mvc:fragmentValue>
                                    </mvc:fragmentValue>
                                </mvc:fragmentValue>
                            </mvc:fragmentValue>
                        </mvc:fragmentValue>
                    </mvc:fragmentValue>
                </mvc:fragmentValue>
            </mvc:fragmentValue>
        </mvc:fragmentValue>
    </mvc:fragment>
</mvc:formatter>
<%
    } catch (Throwable t) {
        System.out.println("Error showing Date input " + t);
        t.printStackTrace();
    }
%>
