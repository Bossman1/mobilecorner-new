@props([
    'categories' => [],
    'selected' => null,
    'level' => 0,
])


    @foreach ($categories as $category)
        <span>
           {{ $category->name }}{{ !$loop->last ? ' > ' : '' }}
        </span>
    @endforeach

