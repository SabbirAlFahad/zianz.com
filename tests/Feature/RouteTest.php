<?php

namespace Tests\Feature;

use App\Product;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class RouteTest extends TestCase
{
  public function testUser_purchase()
  {
     $response = $this->get('/purchase_history')->assertRedirect('/users/login');
     $this->assertTrue(true);

  }
  public function test_landing_page_route_correctly()
    {

        $response = $this->get('/users/registration');

        $response->assertStatus(200);
        $response->assertSee('registration');

    }
    
  public function test_admin_route()
  {
     $response = $this->get('/admin')->assertRedirect('/login');
     $this->assertTrue(true);

  }


  public function testuser_wallet_route()
  {
     $response = $this->get('/wallet')->assertRedirect('/users/login');
     $this->assertTrue(true);

  }


}
