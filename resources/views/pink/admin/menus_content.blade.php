<div id="content-page" class="content group">
<div class="hentry group">
<h3 class="title_page">Меню</h3>
<div class="short-table white">
	<table style="width: 100%" cellspacing="0" cellpadding="0">
	<thead>		
		<th>Name</th>
		<th>Link</th>		
		<th>Удалить</th>
	</thead>
	@if($menus)
@foreach($menus as $item)
		<tr>
			<td style="text-align: left;">
			@if($item['parent'] !== 0 && $item['parent'] !== 1) -- @endif
			{!! Html::link(route('menus.edit',$item['id']),$item['title']) !!}
			</td>
			<td>{{ $item['path'] }}</td>

			<td>
 {!! Form::open(['url' => route('menus.destroy',$item['id']),'class'=>'form-horizontal','method'=>'POST']) !!}
				{{ method_field('DELETE') }}
		{!! Form::button('Удалить', ['class' => 'btn btn-french-5','type'=>'submit']) !!}
		{!! Form::close() !!}
			</td>
		</tr>			
@endforeach
	@endif
	</table>
	</div>
	{!! HTML::link(route('menus.create'),'Добавить  пункт',['class' => 'btn btn-the-salmon-dance-3']) !!}
</div>
</div>