<div class="box"><p><b>Pruning Level: </b>{!implode(" &nbsp;|&nbsp; \n", $strlist)}</p>
<h2>FS#{!$task_id}: {L('dependencygraph')}</h2>
<div>{!$map}</div>
<img src="{$baseurl}{!$image}" alt="Dependencies for task {!$task_id}" usemap="#{!$graphname}" />
<p>Page and image generated in {$time} seconds.<p>
</div>