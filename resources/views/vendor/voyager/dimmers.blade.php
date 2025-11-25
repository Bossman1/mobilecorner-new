@section('css')
    {{--    <link href="/css/fontawesome-free-5/css/all.css" rel="stylesheet">--}}
    {{--    <link href="/css/widgets.css" rel="stylesheet">--}}
@endsection
@php
    $dimmerGroups = Voyager::dimmers();
@endphp

@forelse($dimmerGroups as $dimmerGroup)
    @php

        $prefix = "";
        $surfix = '';
    @endphp
    @if ($dimmerGroup->any())

        {!! $prefix.$dimmerGroup->setSeparator('')->display() !!}

    @endif

@empty

@endforelse
