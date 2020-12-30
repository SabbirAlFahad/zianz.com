<?php

namespace Tests\Feature;


use app\models\UserTable;
use App\Product;
use AuthenticatesUsers;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class AdminControllerTest extends TestCase
{
  public function test_admin_login()
{
  $credentials=[
 'email'=>'ziauddin@zianz.com',
 'password'=>'123456'
];
$this->call('POST','login',$credentials);
//or $this->assertRedirectedToRoute('login.fail');
   $response = $this->get('/admin')->assertOk();
   $this->assertTrue(true);

}
}
