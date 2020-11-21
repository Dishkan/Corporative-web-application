<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasFactory;
	
	protected $fillable = ['title','img','alias','text','desc','keywords','meta_desc','category_id'];
	
	public function user() {
		return $this->belongsTo('App\Models\User');
	}
	
	public function category() {
		return $this->belongsTo('App\Models\Category');
	}
	
	public function comments()
    {
        return $this->hasMany('App\Models\Comment');
    }
}
