<div id="content-page" class="content group">
				            <div class="hentry group">

{!! Form::open(['url' => (isset($portfolio->id)) ? route('portfolios_panel.update',['portfolios_panel'=>$portfolio->alias]) : route('portfolios_panel.store'),'class'=>'contact-form','method'=>'POST','enctype'=>'multipart/form-data']) !!}
    
	<ul>
		<li class="text-field">
			<label for="name-contact-us">
				<span class="label">Заголовок:</span>
				<br />
				<span class="sublabel">Заголовок портфолио</span><br />
			</label>
			<div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
			{!! Form::text('title',isset($portfolio->title) ? $portfolio->title  : old('title'), ['placeholder'=>'Введите название портфолио']) !!}
			 </div>
		 </li>
		 
		 <li class="text-field">
			<label for="name-contact-us">
				<span class="label">Ключевые слова:</span>
				<br />
				<span class="sublabel">Заголовок портфолио</span><br />
			</label>
			<div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
			{!! Form::text('keywords', isset($portfolio->keywords) ? $portfolio->keywords  : old('keywords'), ['placeholder'=>'Введите название портфолио']) !!}
			 </div>
		 </li>
		 
		 <li class="text-field">
			<label for="name-contact-us">
				<span class="label">Клиент:</span>
				<br />
				<span class="sublabel">Клиент портфолио</span><br />
			</label>
			<div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
			{!! Form::text('customer', isset($portfolio->customer) ? $portfolio->customer  : old('customer'), ['placeholder'=>'Введите название портфолио']) !!}
			 </div>
		 </li>
		 
		 <li class="text-field">
			<label for="name-contact-us">
				<span class="label">Мета описание:</span>
				<br />
				<span class="sublabel">Заголовок портфолио</span><br />
			</label>
			<div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
			{!! Form::text('meta_desc', isset($portfolio->meta_desc) ? $portfolio->meta_desc  : old('meta_desc'), ['placeholder'=>'Введите название портфолио']) !!}
			 </div>
		 </li>
		 
		 <li class="text-field">
			<label for="name-contact-us">
				<span class="label">Псевдоним портфолио:</span>
				<br />
				<span class="sublabel">введите псевдоним портфолио</span><br />
			</label>
			<div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
			{!! Form::text('alias', isset($portfolio->alias) ? $portfolio->alias  : old('alias'), ['placeholder'=>'Введите псевдоним портфолио, например - project-10']) !!}
			 </div>
		 </li>
		 
		 <li class="textarea-field">
			<label for="message-contact-us">
				 <span class="label">Краткое описание портфолио:</span>
			</label>
			<div class="input-prepend"><span class="add-on"><i class="icon-pencil"></i></span>
			{!! Form::textarea('text', isset($portfolio->text) ? $portfolio->text  : old('text'), ['id'=>'editor','class' => 'form-control','placeholder'=>'Введите текст портфолио']) !!}
			</div>
			<div class="msg-error"></div>
		</li>
		@if(isset($portfolio->img->path))
			<li class="textarea-field">
				
				<label>
					 <span class="label">Изображения портфолио:</span>
				</label>
				{{ Html::image(asset('pink').'/images/projects/'.$portfolio->img->path,'',['style'=>'width:400px']) }}
				{!! Form::hidden('old_image',$portfolio->img->path) !!}
			
				</li>
		@endif
		
		
		<li class="text-field">
			<label for="name-contact-us">
				<span class="label">Изображение портфолио:</span>
				<br />
				<span class="sublabel">Изображение портфолио</span><br />
			</label>
			<div class="input-prepend">
				{!! Form::file('image', ['class' => 'filestyle','data-buttonText'=>'Выберите изображение','data-buttonName'=>"btn-primary",'data-placeholder'=>"Файла нет"]) !!}
			 </div>
			 
		</li>		
		<li class="text-field">
			<label for="name-contact-us">
				<span class="label">Фильтр портфолио:</span>
				<br />
				<span class="sublabel">Фильтр портфолио</span><br />
			</label>
			<div class="input-prepend">
 {!! Form::select('filter_alias', $filters , isset($portfolio->filter_alias) ? $portfolio->filter_alias  : '') !!}
			 </div>
			 
		</li>	 
		
		@if(isset($portfolio->id))
			<input type="hidden" name="_method" value="PUT">		
		
		@endif

		<li class="submit-button"> 
			{!! Form::button('Сохранить', ['class' => 'btn btn-the-salmon-dance-3','type'=>'submit']) !!}			
		</li>
		 
	</ul>
	
    
    
    
    
{!! Form::close() !!}

 <script>
	CKEDITOR.replace( 'editor' );
</script>
</div>
</div>