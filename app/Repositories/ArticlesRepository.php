<?php

namespace App\Repositories;

use App\Models\Article;
use Gate;
use Image;
use Config;

class ArticlesRepository extends Repository {
	
	
	public function __construct(Article $articles) {
		$this->model = $articles;
	}
	
	public function one($alias,$attr = array()) {
		$article = parent::one($alias,$attr);
		
		if($article && !empty($attr)) {
			$article->load('comments');
			$article->comments->load('user');
		}
		
		return $article;
	}
	
	public function addArticle($request) {

		if(Gate::denies('save', $this->model)) {
			abort(403);
		}
		
		$data = $request->except('_token','image');
		
		if(empty($data)) {
			return array('error' => 'Нет данных');
		}
		
		if(empty($data['alias'])) {
			$data['alias'] = $this->transliterate($data['title']);
		}
		
		if($this->one($data['alias'],FALSE)) {
			$request->merge(array('alias' => $data['alias']));
			$request->flash();
			
			return ['error' => 'Данный псевдоним уже успользуется'];
		}
		
		if($request->hasFile('image')) {
			$image = $request->file('image');
			
			if($image->isValid()) {
				
				$str = \Illuminate\Support\Str::random(8);
				
				$obj = new \stdClass;
				
				$obj->mini = $str.'_mini.jpg';
				$obj->max = $str.'_max.jpg';
				$obj->path = $str.'.jpg';
				
				$img = Image::make($image);
				
				$img->fit(Config::get('settings.image_width'),
						Config::get('settings.image_height'))->save(public_path().'/'.'pink'.'/images/articles/'.$obj->path); 
				
				$img->fit(Config::get('settings.articles_img_max_width'),
						Config::get('settings.articles_img_max_height'))->save(public_path().'/'.'pink'.'/images/articles/'.$obj->max); 
				
				$img->fit(Config::get('settings.articles_img_mini_width'),
						Config::get('settings.articles_img_mini_height'))->save(public_path().'/'.'pink'.'/images/articles/'.$obj->mini); 
						
				
				$data['img'] = json_encode($obj);  
				
				$this->model->fill($data); 
				
				if($request->user()->articles()->save($this->model)) {
					return ['status' => 'Материал добавлен'];
				}                          
				
			}
			
		}
	}
	
	
	public function updateArticle($request, $article) {

		if(Gate::denies('edit', $this->model)) {
			abort(403);
		}
		
		$data = $request->except('_token','image','_method');
		
		if(empty($data)) {
			return array('error' => 'Нет данных');
		}
		
		if(empty($data['alias'])) {
			$data['alias'] = $this->transliterate($data['title']);
		}
		
		$result = $this->one($data['alias'],FALSE);
		
		if(isset($result->id) && ($result->id != $article->id)) {
			$request->merge(array('alias' => $data['alias']));
			$request->flash();
			
			return ['error' => 'Данный псевдоним уже успользуется'];
		}
		
		if($request->hasFile('image')) {
			$image = $request->file('image');
			
			if($image->isValid()) {
				
				$str = \Illuminate\Support\Str::random(8);
				
				$obj = new \stdClass;
				
				$obj->mini = $str.'_mini.jpg';
				$obj->max = $str.'_max.jpg';
				$obj->path = $str.'.jpg';
				
				$img = Image::make($image);
				
				$img->fit(Config::get('settings.image_width'),
						Config::get('settings.image_height'))->save(public_path().'/'.'pink'.'/images/articles/'.$obj->path); 
				
				$img->fit(Config::get('settings.articles_img_max_width'),
						Config::get('settings.articles_img_max_height'))->save(public_path().'/'.'pink'.'/images/articles/'.$obj->max); 
				
				$img->fit(Config::get('settings.articles_img_mini_width'),
						Config::get('settings.articles_img_mini_height'))->save(public_path().'/'.'pink'.'/images/articles/'.$obj->mini); 

				$data['img'] = json_encode($obj);  		
			}
	
		}
		
		$article->fill($data); 
				
		if($article->update()) {
			return ['status' => 'Материал обновлен'];
		} 

	}
	
	public function deleteArticle($article) {
		
		if(Gate::denies('destroy', $article)) {
			abort(403);
		}
		
		$article->comments()->delete();
		
		if($article->delete()) {
			return ['status' => 'Материал удален'];
		}
		
	}
	
	
}

?>