<div class="row">
    @foreach($cards as $card)
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading" style="background: {{ $card['color'] }}; color: #fff; padding:10px; position:relative;  @if(!isset($card['link']))  height:146px; @endif">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="{{ $card['icon'] }}" style="font-size:40px;"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div style="font-size:22px;">{{ $card['count'] }}</div>
                            <div>{{ $card['title'] }}</div>
                        </div>
                    </div>
                    <div class="row">
                        @if(isset($card['description']))
                            <div  style="font-size: 12px; position: absolute; bottom:2px; right: 5px;">{!! $card['description'] !!}</div>
                        @endif
                    </div>
                </div>
                @if(isset($card['link']))
                    <a href="{{ $card['link'] }}">
                        <div class="panel-footer">
                            <span class="pull-left">{{ $card['footer_text'] }}</span>
                            <span class="pull-right"><i class="glyphicon glyphicon-circle-arrow-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                @endif
            </div>
        </div>
    @endforeach
</div>
