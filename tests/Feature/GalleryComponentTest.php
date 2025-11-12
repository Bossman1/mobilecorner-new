<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Support\Facades\Blade;

class GalleryComponentTest extends TestCase
{
    public function test_gallery_component_renders_with_images_and_options(): void
    {
        $images = [
            ['src' => '/path/to/image1.jpg', 'thumb' => '/path/to/thumb1.jpg', 'caption' => 'Image 1'],
            ['src' => '/path/to/image2.jpg', 'thumb' => '/path/to/thumb2.jpg', 'caption' => 'Image 2'],
        ];

        $options = [
            'condition' => 'new',
            'width' => '800px',
            'height' => '500px',
        ];

        // Render the component using the testing helper to obtain a TestView instance
        $view = $this->blade(
            '<x-gallery :images="$images" :options="$options" />',
            compact('images', 'options')
        );

        // Assert content directly on the TestView object
        $view->assertSee('ახალი'); // Should see "new" condition text
        $view->assertSee('Image 1');
        $view->assertSee('Image 2');
        $view->assertSee('/path/to/image1.jpg');

        // Or convert to string if you need the HTML
        $html = (string) $view;
        $this->assertStringContainsString('bg-green-500', $html);
        $this->assertStringContainsString('gallery_', $html);
    }

    public function test_gallery_component_renders_with_owned_condition(): void
    {
        $images = [
            ['src' => '/test.jpg', 'thumb' => '/test_thumb.jpg'],
        ];

        $options = ['condition' => 'owned'];

        $view = $this->blade(
            '<x-gallery :images="$images" :options="$options" />',
            compact('images', 'options')
        );

        $view->assertSee('მეორადი'); // Should see "owned" condition text
        $view->assertSee('bg-blue-500');
    }

    public function test_gallery_component_renders_without_condition(): void
    {
        $images = [
            ['src' => '/test.jpg'],
        ];

        $view = $this->blade(
            '<x-gallery :images="$images" />',
            compact('images')
        );

        $view->assertDontSee('ახალი');
        $view->assertDontSee('მეორადი');
        $view->assertSee('/test.jpg');
    }
}
