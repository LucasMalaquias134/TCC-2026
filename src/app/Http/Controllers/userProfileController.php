<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class userProfileController extends Controller
{
    /*$usuarioNome = $usuario->name;
    $usuarioUserName = $usuario->user_name;
    $usuarioEmail = $usuario->email;
    $usuarioUrl = $usuario->urlImage;
    $usuarioIdade = $usuario->idade;
    $usuarioMora = $usuario->cidadeMora;
    $usuarioSenha = $usuario->password;*/
    public function index($id){
        $usuario = User::find(decrypt($id));
        return view('user_profile',['usuario'=>$usuario]);
    }

    public function update(Request $request, $id){
        
        $usuario = User::find($id);


        $regras = [
            'name' => 'sometimes|nullable|string|max:255|min:3',
            'email' => 'sometimes|nullable|email|max:255|unique:users,email,'.$id,
            'password' => 'sometimes|nullable|string|min:8|max:255',
            'fotoPerfil' => 'sometimes|nullable|image|mimes:jpeg,png,jpg|max:2048',
            'idade' => 'sometimes|nullable|integer|max:120|min:5',
            'cidadeMora' => 'sometimes|nullable|string|max:100|min:5',
            'user_name' => 'sometimes|nullable|string|min:3|max:100|unique:users,user_name,'.$id
        ];

        $mensagens = [
            'name.min'        => 'O nome precisa ter pelo menos 3 letras',
            'name.max'        => 'O nome precisa ter menos que 255 caracteres',
            
            'email.email'     => 'Por favor insira um endereço de e-mail que exista',
            'email.unique'    => 'Este e-mail ja existe',
            
            'password.min'    => 'A senha precisa ter pelo menos 8 caracteres',
            'password.max'    => 'A senha precisa ter menos que 255 caracteres',

            'urlImage.image'  => 'O arquivo selecionado deve ser uma imagem valida',
            'urlImage.mimes'  => 'As extensoes permitidas para a imagem sao: jpeg, png, jpg',
            'urlImage.max'    => 'A imagem e muito pesada O limite e de 2MB',
            
            'fotoPerfil.image'=> 'O arquivo selecionado deve ser uma imagem valida',
            'fotoPerfil.mimes'=> 'As extensoes permitidas para a foto sao: jpeg, png, jpg',
            'fotoPerfil.max'  => 'A foto e muito pesada o limite e de 2MB',
            
            'idade.min'       => 'A idade minima permitida e de 5 anos',
            'idade.max'       => 'A idade maxima permitida e de 120 anos',

            'cidadeMora.min'  => 'O nome da cidade deve ter mais que 5 caracteres',
            'cidadeMora.max'  => 'O nome da cidade deve ter menos que 100 caracteres',
            
            'user_name.min'   => 'O nome de usuario precisa ter pelo menos 3 caracteres',
            'user_name.max'   => 'O nome de usuario deve ter menos que 100 caracteres',
            'user_name.unique'=> 'Este nome de usuario já está em uso',
        ];

        $validado = $request->validate($regras,$mensagens);

        $validado = array_filter($validado);

        if($request->hasFile('fotoPerfil') && $request->file('fotoPerfil')->isValid()){
            if ($usuario->urlImage && file_exists(public_path('assets/photos/' . $usuario->urlImage))) {
                unlink(public_path('assets/photos/' . $usuario->urlImage));
            }
            $requestImagem = $request->file('fotoPerfil');
            $extensao = $requestImagem->extension();
            $nomeImg = md5($requestImagem->getClientOriginalName() . strtotime('now')) . "." . $extensao;
            $requestImagem->move(public_path('assets/photos'),$nomeImg);
            $validado['urlImage'] = $nomeImg;
        }

        $usuario->update($validado);

        return redirect()->route('user_profile',['id'=>encrypt($id)])->with('msg','Sucesso dados atualizados');

    }
}
