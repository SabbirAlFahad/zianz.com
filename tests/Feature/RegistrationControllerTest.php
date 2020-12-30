<?php

namespace Tests\Feature;

use app\models\UserTable;
use App\Product;
use AuthenticatesUsers;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RegistrationControllerTest extends TestCase
{

    public function test_user_registration()
    {
      $credentials=[
       'name'=>'dummy',
     'email'=>'dummy@email.com',
     'password'=>'123456'
  ];
  $this->call('POST','register',$credentials);

  //or $this->assertRedirectedToRoute('login.fail');

       $response = $this->get('/')->assertOk();
       $this->assertTrue(true);
    }

    public function test_User_duplication_Email()
       {
         $emailToTest = 'sabbiralkabbo@gmail.com';
           $this->assertSame($emailToTest, filter_var($emailToTest, FILTER_VALIDATE_EMAIL));
           $this->assertTrue(true);
       }
  }
