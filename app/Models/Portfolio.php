<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    use HasFactory;
	
	protected $fillable = ['title','customer','img','alias','filter_alias','text','keywords','meta_desc'];
	
	public function filter() {
		return $this->belongsTo('App\Models\Filter','filter_alias','alias');
	}
}
