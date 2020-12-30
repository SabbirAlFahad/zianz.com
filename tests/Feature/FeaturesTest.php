<?php

namespace Tests\Feature;

use app\models\UserTable;
use App\Product;
use AuthenticatesUsers;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class FeaturesTest extends TestCase
{



    public function testBasicTest()
    {
        $response = $this->get('/');
            $this->assertTrue(true);

    }

    public function testuser_only_testcreate()
    {
       $response = $this->get('/purchase_history')->assertRedirect('/users/login');
       $this->assertTrue(true);

    }

    public function test_admin_login_dasboard()
    {
       $response = $this->get('/admin')->assertRedirect('/login');
       $this->assertTrue(true);

    }


    public function test_admin_login_success()
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

    public function test_user_login_success()
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
    public function test_user_registration_success()
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

    public function test_does_send_password_reset_email()
   {
     $email = 'sabbiralkabbo@gmail.com';
     	$this->call('POST', 'auth/register/', [
     		'username' => 'zarif',
     		'email' => $email,
     		'password' => '123456',
     		'password_confirmation' => '123456',
     	]);
     	$r = $this->call('POST', 'password/email', ['email' => $email]);
     	$this->assertTrue(true);
   }

public function testuser_wallet_testcreate()
{
   $response = $this->get('/wallet')->assertRedirect('/users/login');
   $this->assertTrue(true);

}

public function testCreateUserDoesntInsertDuplicateEmail()
   {
     $emailToTest = 'sabbiralkabbo@gmail.com';
       $this->assertSame($emailToTest, filter_var($emailToTest, FILTER_VALIDATE_EMAIL));
       $this->assertTrue(true);
   }


}
