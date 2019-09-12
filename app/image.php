<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class image extends Model
{
    protected $table = 'images';

    //Relacion 'one to many'
    public function comments(){
        return $this->hasMany('App\comment');
    }

    //Relacion 'one to many'
    public function likes(){
        return $this->hasMany('App\like');
    }

    //Relacion 'many to one'
    public function user(){
        return $this->belongsTo('App\User', 'user_id');
    }

}
