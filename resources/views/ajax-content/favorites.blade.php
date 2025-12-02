

 @foreach($products as $product)

    @php
        $productImage = json_decode($product->images)[0] ??  '';
        $options = [
           'image' => Voyager::image($productImage),
            'price' => $product->a_old_price,
            'old_price' => $product->a_new_price,
            'title' => $product->title,
            'id' => $product->id,
            'slug' => $product->slug,
          ];
        $condition = $product->condition;
    @endphp
    <x-card-product wrapper-class="!shadow-[0_0_15px_rgba(0,0,0,0.15)]" :condition="$condition"  :options="$options"/>

 @endforeach
