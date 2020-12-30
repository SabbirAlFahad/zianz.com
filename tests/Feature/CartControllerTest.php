<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use app\models\UserTable;
use App\Product;
use AuthenticatesUsers;

class CartControllerTest extends TestCase
{
  public function test_cart_created()
{
   $book = Product::first();

   $this->get('/add-to-cart/' . $book)
       ->assertSessionHas('cart');
   dd(session()->all());

}
}
