<?php

namespace App\Repositories;

use App\Models\Portfolio;
use Gate;
use Image;
use Config;

class PortfoliosRepository extends Repository {
	
	public function __construct(Portfolio $portfolio) {
		$this->model = $portfolio;
	}
	
	public function one($alias,$attr = array()) {
		$portfolio = parent::one($alias,$attr);
		
		if($portfolio && $portfolio->img) {
			$portfolio->img = json_decode($portfolio->img);
		}
		
		return $portfolio;
	}
	
	public function addPortfolio($request) {
		
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
						Config::get('settings.image_height'))->save(public_path().'/'.'pink'.'/images/projects/'.$obj->path); 
				
				$img->fit(Config::get('settings.articles_img_max_width'),
						Config::get('settings.articles_img_max_height'))->save(public_path().'/'.'pink'.'/images/projects/'.$obj->max); 
				
				$img->fit(Config::get('settings.articles_img_mini_width'),
						Config::get('settings.articles_img_mini_height'))->save(public_path().'/'.'pink'.'/images/projects/'.$obj->mini); 
						
				
				$data['img'] = json_encode($obj);  
				
				if($this->model->fill($data)->save()) {
					return ['status' => 'Портфолио добавлен'];
				}                          
				
			}
			
		}
	}
	
	
	public function updatePortfolio($request, $portfolio) {


		$data = $request->except('_token','image','_method');
		
		if(empty($data)) {
			return array('error' => 'Нет данных');
		}
		
		if(empty($data['alias'])) {
			$data['alias'] = $this->transliterate($data['title']);
		}
		
		$result = $this->one($data['alias'],FALSE);
		
		if(isset($result->id) && ($result->id != $portfolio->id)) {
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
						Config::get('settings.image_height'))->save(public_path().'/'.'pink'.'/images/projects/'.$obj->path); 
				
				$img->fit(Config::get('settings.articles_img_max_width'),
						Config::get('settings.articles_img_max_height'))->save(public_path().'/'.'pink'.'/images/projects/'.$obj->max); 
				
				$img->fit(Config::get('settings.articles_img_mini_width'),
						Config::get('settings.articles_img_mini_height'))->save(public_path().'/'.'pink'.'/images/projects/'.$obj->mini); 

				$data['img'] = json_encode($obj);  		
			}
	
		}
		
		$portfolio->fill($data); 
				
		if($portfolio->update()) {
			return ['status' => 'Портфолио обновлено'];
		} 

	}
	
	
	public function deletePortfolio($portfolio) {
		
		if($portfolio->delete()) {
			return ['status' => 'Портфолио удалено'];
		}
		
	}
	
	
}

?>