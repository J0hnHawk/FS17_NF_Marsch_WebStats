<div class="page-header">
	<h3>
		##PRICES##<small> (##SAVETIME##: ##DAY## {$currentDay}, {$dayTime})</small><small
			class="pull-right"><a href="#" data-toggle="modal"
			data-target="#optionsDialog"><span class="glyphicon glyphicon-cog"
				aria-hidden="true"></span> ##SETTINGS##</a></small>
	</h3>
</div>
<div class="row">
	<div class="col-sm-12">
		<table class="table table-hover table-bordered table-striped" id="bestPrices">
			<thead>
				<tr>
					<th class="text-center">##STOCK##</th>
					<th class="text-center">##SELLTRIGGER##</th>
					<th class="text-center">##MIN_PRICE##</th>
					<th class="text-center">##MAX_PRICE##</th>
					<th class="text-center">##BEST_PRICE##</th>
					<th class="text-center">##PERCENT##</th>
					<th class="text-center">##STOCKS##</th>
					<th class="text-center">##PROCEEDS##</th>
				</tr>
			</thead>
			<tbody>
				{foreach $prices as $fillType => $fillTypeData} {math equation="round(100 / max * current)" max=$fillTypeData.maxPrice-$fillTypeData.minPrice
				current=$fillTypeData.bestPrice-$fillTypeData.minPrice assign="percent"}
				<tr>
					<td>{$fillType}</td>
					<td>{$fillTypeData.bestLocation}</td>
					<td class="text-right col-sm-1">{$fillTypeData.minPrice|number_format:0:",":"."}</td>
					<td class="text-right col-sm-1">{$fillTypeData.maxPrice|number_format:0:",":"."}</td>
					<td class="text-right col-sm-1 {if $fillTypeData.greatDemand}text-info{elseif $percent>=60}text-success{elseif $percent<=40}text-danger{/if}">{$fillTypeData.bestPrice|number_format:0:",":"."}
						{if $fillTypeData.priceTrend == 1} <span class="glyphicon glyphicon-triangle-top text-success" aria-hidden="true"></span>{elseif
						$fillTypeData.priceTrend == -1} <span class="glyphicon glyphicon-triangle-bottom text-danger" aria-hidden="true"></span>{else} <span
						class="glyphicon glyphicon-arrow-down" style="visibility: hidden"><span>{/if} 
					
					</td>
					<td class="text-center">{$percent|number_format:0:",":"."} %</td> {if isset($commodities.$fillType) && $commodities.$fillType.overall > 0}
					<td class="text-right col-sm-1">{$commodities.$fillType.overall|number_format:0:",":"."}</td> {$proceeds = $commodities.$fillType.overall *
					$fillTypeData.bestPrice / 1000}
					<td class="text-right col-sm-1">{$proceeds|number_format:0:",":"."}</td> {else}
					<td></td>
					<td></td> {/if}
				</tr>
				{/foreach}
			</tbody>
		</table>
		<script>
		var rows = parseInt(($( window ).height() - 250) / 36)
		$(document).ready(function() {
		    var table = $('#bestPrices').DataTable( {
		    	"pageLength": rows,
		    	"dom":	"<'row'<'col-sm-6'><'col-sm-6'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",		
		    	"language": {
		    		"decimal": ",",
		            "thousands": ".",
		            "url": "./language/{$smarty.session.language}/dataTables.lang"
		    	}
		    } );
		} );
		</script>
	</div>
</div>