<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Gangplank</title>
    <r:require modules="gangplank"/>
  </head>
  <body>

   <div class="container-fluid">

     <div class="paginateButtons" style="text-align:center">
       <g:if test="${params.int('offset')}">
         Showing Results ${params.int('offset') + 1} - ${hits.totalHits < (params.int('max') + params.int('offset')) ? hits.totalHits : (params.int('max') + params.int('offset'))} of ${hits.totalHits}
       </g:if>
       <g:elseif test="${hits.totalHits && hits.totalHits > 0}">
         Showing Results 1 - ${hits.totalHits < params.int('max') ? hits.totalHits : params.int('max')} of ${hits.totalHits}
       </g:elseif>
       <g:else>
         Showing ${hits.totalHits} Results
       </g:else>
     </div>

     <div class="row-fluid">
       <span class="pull-right">
         <g:link action="download" params="${params+[format:'csv']}">Download CSV</g:link>
       </span>
       <table class="table table-bordered">
         <thead>
           <tr>
             <g:each in="${schemaInfo.props}" var="prop">
               <td>${prop.label}</td>
             </g:each>
             <td>Timestamp</td>
             <td>Source File</td>
           </tr>
         </thead>
         <tbody>
           <g:each in="${hits}" var="h">
             <tr>
               <g:each in="${schemaInfo.props}" var="prop">
                 <td>${h.source[prop.name]}</td>
               </g:each>
               <td>${h.source.gangplankTimestamp}</td>
               <td>${h.source.sourceFile}</td>
             </tr>
           </g:each>
         </tbody>
       </table>
     </div>

     <div class="paginateButtons" style="text-align:center">
       <g:if test="${hits}" >
         <span><g:paginate controller="browse" action="index" params="${params}" next="Next" prev="Prev" maxsteps="10" total="${hits.totalHits}" /></span>
       </g:if>
     </div>


   </div>
  
  </body>
</html>
