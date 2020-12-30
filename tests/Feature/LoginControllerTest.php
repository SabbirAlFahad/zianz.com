<?php

namespace Tests\Feature;

use app\models\UserTable;
use App\Product;
use AuthenticatesUsers;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class LoginControllerTest extends TestCase
{

      public function test_login()
      {
        $credentials=[
       'email'=>'sabbiralkabbo@gmail.com',
       'password'=>'123456'
    ];
    $this->call('POST','login',$credentials);
    //or $this->assertRedirectedToRoute('login.fail');
         $response = $this->get('/dashboard')->assertOk();
         $this->assertTrue(true);

      }
}
