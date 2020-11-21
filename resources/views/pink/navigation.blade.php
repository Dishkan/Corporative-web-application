@if($menu)
	<div class="menu classic">
		<ul id="nav" class="menu">
		@foreach($menu as $item)
			<li>
			 <a href="{{ $item['path'] }}">{{ $item['title'] }}</a>
		<ul class="sub-menu">
			<li>
			@if($item['parent'] !== 0 && $item['parent'] !== 1)
			 <a href="{{ $item['path'] }}">{{ $item['title'] }}</a>
			</li>
			@endif
		</ul>
			</li>
	    @endforeach
		</ul>		
	</div>
@endif
