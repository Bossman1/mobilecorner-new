@props([
    'id' => 'id_'.uniqid(),
    'name' => 'name_'.uniqid(),
    'value' => '',
    'dataAttributes' => [],
    'label' => '',
    'labelDescription' => '',
    'labelDescriptionClass' => '',
    'labelClass' => '',
    'icon' => null,
    'image' => null,
    'imageClass' => '',
    'iconPosition' => 'right', // right | left
    'iconClass' => 'h-[48px] w-[48px]',
    'options' => [],
    'textPosition' => 'bottom', // bottom | right
    'textClass' => '', // bottom | right
])

@if(is_array($options) && !empty($options))
    @foreach($options as $k => $option)

        @php
            $iconPosition  = $option['iconPosition'] ?? 'right';
            $id  = $option['id']  ?? uniqid();
            $isChecked = isset($option['checked']);
        @endphp

        <label
            for="{{ $id }}"
            class="flex-1 items-start gap-3 p-3 border rounded-[12px] cursor-pointer   w-full border-white group hover:bg-[var(--color-main-hover-bank-cards)] hover:text-white transition-all duration-300 ease-in-out
                   {{ $isChecked ? 'bg-[var(--color-main)] text-white' : 'bg-white' }}"
            data-radio-label>
            <!-- Radio + Label stacked vertically -->
            <div class="flex @if($textPosition == 'right') flex-row gap-1 @else flex-col @endif justify-start items-center">
                <div class="flex justify-start items-center gap-[8px]">
                    @if($iconPosition ==='left')
                        <div>
                            @if(isset($option['icon']) && trim($option['icon']) !='')
                                <x-dynamic-component :component="$option['icon']" class="{{ $iconClass }}" />
                            @endif
                            @if(isset($option['image']) && trim($option['image']) !='')
                                <img src="{{ $option['image'] }}" class="{{ $imageClass }}">
                            @endif
                        </div>
                    @endif
                    <input
                        id="{{ $id }}"
                        type="radio"
                        name="{{ $name }}"
                        value="{{ $option['value'] ??  '' }}"
                        class="w-[13px] h-[13px] text-[var(--color-main-light)] bg-gray-100 border-white hidden"
                        {{ $isChecked ? 'checked': '' }}
                        data-radio-input

                        @if($dataAttributes && count($dataAttributes))
                            @foreach($dataAttributes as $key => $dataAttribute)
                                @if(is_int($key) || (is_numeric($key) && $key === $dataAttribute))
                                    {{ $dataAttribute }}
                                @else
                                    {{ $key }}="{{ $dataAttribute }}"
                               @endif
                             @endforeach
                        @endif
                    />
                    @if($iconPosition ==='right')
                        <div>
                            @if(isset($option['icon']) && trim($option['icon']) !='')
                                <x-dynamic-component :component="$option['icon']" class="{{ $iconClass }}" />
                            @endif
                            @if(isset($option['image']) && trim($option['image']) !='')
                                <img src="{{ $option['image'] }}" class="{{ $imageClass }}">
                            @endif
                        </div>
                    @endif
                </div>

                <div class="@if($textPosition == 'bottom') mt-2 @endif select-none @if(isset($option['image']) && trim($option['image']) !='') ml-auto @endif">
                    <div data-label-text  class="text-[16px] group-hover:text-white {{ $isChecked ? 'text-white' : 'text-slate-800' }}  font-custom-bold-upper {{ $labelClass }}">
                        {{ $option['label'] }}
                    </div>
                    @if(isset($option['labelDescription']) && trim($option['labelDescription']) !='')
                        <div class="text-[15px] text-slate-600 {{ $labelDescriptionClass }}">
                            {{ $option['labelDescription'] }}
                        </div>
                    @endif
                </div>
            </div>
        </label>

    @endforeach

@endif

<script>
    $(document).ready(function() {
        $('[data-radio-input]').on('change', function() {
            // Get the radio group name
            const name = $(this).attr('name');

            // Reset all labels in this group
            $(`input[name="${name}"][data-radio-input]`).each(function() {
                const $label = $(this).closest('[data-radio-label]');
                if ($label.length) {
                    $label.removeClass('bg-[var(--color-main)] bg-white text-white')
                        .addClass('text-slate-800 bg-white hover:bg-[var(--color-main-hover-bank-cards)]');
                }

            });

            // Apply checked state to selected label
            const $selectedLabel = $(this).closest('[data-radio-label]');
            // const $selectedLabelText = $(this).parent('label').closest('[data-label-text]');
            const $selectedLabelText = $(this).closest('[data-radio-label]').find('[data-label-text]');

            if ($selectedLabel.length) {
                $selectedLabel.removeClass('bg-white hover:bg-[var(--color-main-hover-bank-cards)]').addClass('bg-[var(--color-main)] text-white');
                console.log(2)

            }
            $('[data-label-text]').removeClass('text-white');
            $selectedLabelText.removeClass('text-slate-800')
                .addClass('text-white');

        });
    });
</script>

