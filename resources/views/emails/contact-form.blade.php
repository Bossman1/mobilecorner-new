<!DOCTYPE html>
<html>

<head>
    <title>{{ __('Contact Form') }}</title>

</head>

<body>
    @if (isset($content))

        @foreach ($content as $key => $cont)
            <p>{{ __($key) }}  - {!! $cont !!}</p>
        @endforeach

    @endif

</body>

</html>
