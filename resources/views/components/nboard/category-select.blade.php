@props([
    'categories' => [],
    'selected' => null,
    'level' => 0,
])


    @foreach ($categories as $category)
        <option value="{{ $category->id }}" @if($selected == $category->id) selected @endif>
            {{ str_repeat('— ', $level) . $category->name }}
        </option>

        @if ($category->childrenRecursive->count())

            <x-nboard.category-select
                :categories="$category->childrenRecursive"
                :selected="$selected"
                :level="$level + 1"
            />
        @endif
    @endforeach

