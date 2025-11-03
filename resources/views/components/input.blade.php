@props([
   'placeholder' => 'placeholder',
   'name' => 'name',
   'id' => 'id',
   'type' => 'text',
   'value' => '',
   'attributes' => [],
   'options' => []
])

<input
    type="{{ $type }}"
    @if(is_array($attributes) && count($attributes) > 0)
        @foreach($attributes as $k => $attribute)
            "{{$k}}"="{{$attribute}}"
        @endforeach
    @endif
    {{ $attributes->merge(['class' => '  h-[56px] rounded-[12px] border-[1px] border-slate-300 col-span-2 px-3 py-2 font-custom-regular text-[16px] text-slate-400']) }}
    placeholder="{!! $placeholder !!}"
    name="{{ $name }}"
    id="{{ $id }}"
    value="{{ $value }}"

@if($options && count($options))
    @foreach($options as $key => $value)
        @if(is_int($key) || (is_numeric($key) && $key === $value))
            {{ $value }}
        @else
            {{ $key }}="{{ $value }}"
        @endif
    @endforeach
@endif
>
