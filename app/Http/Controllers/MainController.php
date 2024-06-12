<?php

namespace App\Http\Controllers;

use App\Models\Petition;
use Illuminate\Http\Request;

class MainController extends Controller
{


    public function home(Request $request)
    {

        return view('welcome');
    }

    public function status(Request $request)
    {
        $petition = null;
        if ($request->id) {
            $petition = Petition::find($request->id);
        }
        return ['number' => Petition::count(), 'petition' => $petition];
    }


    public function add_petition(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'comment' => 'string',
        ]);

        $data =  $request->only(['name', 'comment']);
        $data['ip'] = $request->ip();
        $data['device_info'] = $request->userAgent();

        $petition =  Petition::create($data);

        return ['number' => Petition::count(), 'partition' => $petition, 'id' =>  $petition->getKey()];
    }
}
