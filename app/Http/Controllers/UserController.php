<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Response;
use File;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    public function config(){
        return view('user.config');
    }

    public function update(Request $request){
        //conseguir usuario identificado
        $user = \Auth::user();
        $id = \Auth::user()->id;

        //validar datos recibidos
        $validate = $this->validate($request, [
            'name' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'nick' => 'required|string|max:255|unique:users,email,'.$id,
            'email' => 'required|string|email|max:255|unique:users,email,'.$id
        ]);

        //Recoger datos del formulario
        $name = $request->input('name');
        $surname = $request->input('surname');
        $nick = $request->input('nick');
        $email = $request->input('email');

        //Asignar nuevos datos al usuario
        $user->name = $name;
        $user->surname = $surname;
        $user->nick = $nick;
        $user->email = $email;

        //Subir imagen
        $image_path = $request->file('image_path');
        if($image_path){
            //poner nombre unico
            $image_path_name = time().$image_path->getClientOriginalName();

            //guardarla en la carpeta storage
            Storage::disk('users')->put($image_path_name, File::get($image_path));

            //pasar el nombre de la imagen
            $user->image = $image_path_name;
        }

        //Ejecutar consulta y cambios en la base de datos
        $user->update();

        return redirect()->route('config')->with(['message'=>'Usuario actualizado correctamente']);
    }

    public function getImage($filename){
        $file = Storage::disk('users')->get($filename);
        return Response($file, 200);
    }
}
