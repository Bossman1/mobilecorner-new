<?php

namespace Tests\Feature;

use Tests\TestCase;

class PublicPagesTest extends TestCase
{
    public function test_home_page_is_ok(): void
    {
        $response = $this->get(route('home'));
        $response->assertOk();

        // Basic smoke assertion: page contains container wrapper from the layout
        $response->assertSee('container', false);
    }

    public function test_full_page_is_ok_and_contains_gallery_component(): void
    {
        $response = $this->get(route('pages.full-page'));
        $response->assertOk();

        // The gallery component renders an element whose id starts with "gallery_"
        $response->assertSee('gallery_', false);
        $response->assertSee('x-gallery', false); // blade tag may be present before compiled; safe smoke check
    }
}
