@if($menu)
	<div class="menu classic">
		<ul>
			@foreach($menu as $key => $value)
			<li>
			 <a href="{{ route($value) }}"> {{ $key }} </a>
			</li>
	    @endforeach
		</ul>
	</div>
@endif

