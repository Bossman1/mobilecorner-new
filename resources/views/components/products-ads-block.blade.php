@props([
  'options' => [],
  'bgColor' => 'bg-red-300'
])

@if(is_array($options) && !empty($options))
    @php
        $count = count($options);
        $gridCols = $count >= 2 ? 2 : $count;
    @endphp

    <div class="grid gap-[20px] p-[20px] rounded-2xl grid-cols-1 md:grid-cols-{{ $gridCols }} " style="background: {{ $bgColor }}">
        @foreach($options as $option)
            <div
                class="@if( $loop->iteration % 2 != 0  && $loop->remaining == 0 )  col-span-{{ $gridCols }}  @else w-full @endif">
                <x-banners
                    wrapperClass="w-full"
                    :options="[$option]"
                    :hrefOptions="['target' => '_blank']"
                    :imageOptions="['rel' => 'image title']"
                    imageClass="rounded-2xl w-full"
                />
            </div>
        @endforeach
    </div>
@endif
