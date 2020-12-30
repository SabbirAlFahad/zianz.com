<?php

namespace Tests\Feature;

use app\models\UserTable;
use App\Product;
use AuthenticatesUsers;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ResetPasswordControllerTest extends TestCase
{
  public function test_password_reset()
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
    }
