<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class comment extends Model
{
    protected $table = 'comments';

    //Relacion 'many to one'
    public function user(){
        return $this->belongsTo('App\User', 'user_id');
    }

    //Relacion 'many to one'
    public function image(){
        return $this->belongsTo('App\image', 'image_id');
    }
}
