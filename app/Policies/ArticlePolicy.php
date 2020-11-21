<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Article;
use Illuminate\Auth\Access\HandlesAuthorization;

class ArticlePolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
	
	public function save(User $user){
	   return $user->canDo('ADD_ARTICLES');
	}
	
	public function edit(User $user) {
		return $user->canDo('UPDATE_ARTICLES');
	}
	
	public function destroy(User $user, Article $article) {
		return ($user->canDo('DELETE_ARTICLES')  && $user->id == $article->user_id);
	}
}
