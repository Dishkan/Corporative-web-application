<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;
	
	public function users() {
		return $this->belongsToMany('App\Models\User','role_user');
	}
	
	public function perms() {
		return $this->belongsToMany('App\Models\Permission','permission_role');
	}
	
	public function hasPermission($name, $require = false)
    {
        if (is_array($name)) {
            foreach ($name as $permissionName) {
                $hasPermission = $this->hasPermission($permissionName);

                if ($hasPermission && !$require) {
                    return true;
                } elseif (!$hasPermission && $require) {
                    return false;
                }
            }
            return $require;
        } else {
            foreach ($this->perms as $permission) {
                if ($permission->name == $name) {
                    return true;
                }
            }
        }

        return false;
    }
	
	public function savePermissions($inputPermissions) {
		
		if(!empty($inputPermissions)) {
			$this->perms()->sync($inputPermissions);
		}
		else {
			$this->perms()->detach();
		}
		
		return TRUE;
	}
}
