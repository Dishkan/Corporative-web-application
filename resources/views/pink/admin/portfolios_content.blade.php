@if($portfolios)
	<div id="content-page" class="content group">
				            <div class="hentry group">
				                <h2>Добавленные портфолио</h2>
				                <div class="short-table white">
				                    <table style="width: 100%" cellspacing="0" cellpadding="0">
				                        <thead>
				                            <tr>
				                                <th class="align-left">ID</th>
				                                <th>Заголовок</th>
				                                <th>Текст</th>
												<th>Изображение</th>
				                                <th>Псевдоним</th>
												<th>Клиент</th>
				                                <th>Дествие</th>
				                            </tr>
				                        </thead>
				                        <tbody>
				                            
											@foreach($portfolios as $portfolio)
											<tr>
				                                <td class="align-left">{{$portfolio->id}}</td>
				                                <td class="align-left">{!! Html::link(route('portfolios_panel.edit',['portfolios_panel'=>$portfolio->alias]),$portfolio->title) !!}</td>
				                                <td class="align-left">{!!\Illuminate\Support\Str::limit($portfolio->text,200)!!}</td>
				                                <td>
													@if(isset($portfolio->img->mini))
													{!! Html::image(asset('pink').'/images/projects/'.$portfolio->img->mini) !!}
													@endif
												</td>
				                                <td>{{$portfolio->alias}}</td>
				                                <td>{{$portfolio->customer}}</td>
				                                <td>
												{!! Form::open(['url' => route('portfolios_panel.destroy',['portfolios_panel'=>$portfolio->alias]),'class'=>'form-horizontal','method'=>'POST']) !!}
												    {{ method_field('DELETE') }}
												    {!! Form::button('Удалить', ['class' => 'btn btn-french-5','type'=>'submit']) !!}
												{!! Form::close() !!}
												</td>
											 </tr>	
											@endforeach	
				                           
				                        </tbody>
				                    </table>
				                </div>
								
								{!! HTML::link(route('portfolios_panel.create'),'Добавить портфолио',['class' => 'btn btn-the-salmon-dance-3']) !!}
                                
				                
				            </div>
				            <!-- START COMMENTS -->
				            <div id="comments">
				            </div>
				            <!-- END COMMENTS -->
				        </div>
@endif