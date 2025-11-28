@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
{{--    <link rel="stylesheet" href="/css/jquery-ui.css">--}}
{{--    <link rel="stylesheet" href="/css/dashboard.css">--}}

    <style>

        /* Each thumbnail wrapper */
        .form-group .thumbnail {
            position: relative;
            overflow: hidden;
            border: none;
            padding: 0;
            background-color: #f9f9f9;
            border-radius: 8px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        /* Hover effect for thumbnail */
        .form-group .thumbnail:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }

        /* Image styling */
        .form-group .thumbnail img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px 8px 0 0;
            transition: transform 0.3s;
        }

        /* Hover zoom effect */
        .form-group .thumbnail:hover img {
            transform: scale(1.05);
        }

        /* Close button */
        .form-group .thumbnail .close {
            position: absolute;
            top: 5px;
            right: 5px;
            background: rgba(255, 0, 0, 0.8);
            color: #fff;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            font-size: 18px;
            line-height: 23px;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s;
            cursor: pointer;
            z-index: 2;
        }

        /* Show close button on hover */
        .form-group .thumbnail:hover .close {
            opacity: 1;
        }

        /* Optional: spacing between columns */
        .form-group .col-xs-6,
        .form-group .col-sm-4,
        .form-group .col-md-3 {
            margin-bottom: 15px;
        }
    </style>


@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')

    <div class="page-content edit-add container-fluid">


        <!-- form start -->
        <form role="form"
              class="form-edit-add"
              action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
              method="POST" enctype="multipart/form-data">
            <!-- PUT Method if we are editing -->
            @if($edit)
                {{ method_field("PUT") }}
            @endif

            <!-- CSRF TOKEN -->
            {{ csrf_field() }}
            <div class="row">
                <div class="col-md-12">
                    <div class="panel">
                        <div class="panel-body">
                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                                $exclude = [ 'images'];
                            @endphp


                            @foreach($dataTypeRows as $row)

                                @if(!in_array($row->field, $exclude))
                                    <!-- GET THE DISPLAY OPTIONS -->
                                    @php
                                        $display_options = $row->details->display ?? NULL;
                                        if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                            $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                        }
                                    @endphp
                                    @if (isset($row->details->legend) && isset($row->details->legend->text))
                                        <legend class="text-{{ $row->details->legend->align ?? 'center' }}"
                                                style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                    @endif

                                    <div
                                        class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id))
                                        {{ "id=$display_options->id" }}
                                        @endif>
                                        {{ $row->slugify }}
                                        <label class="control-label"
                                               for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                        @include('voyager::multilingual.input-hidden-bread-edit-add')
                                        @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                            {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                        @endforeach
                                        @if ($add && isset($row->details->view_add))
                                            @include($row->details->view_add, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'view' => 'add', 'options' => $row->details])
                                        @elseif ($edit && isset($row->details->view_edit))
{{--                                            @include($row->details->view_edit, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'view' => 'edit', 'options' => $row->details])--}}
                                        @elseif (isset($row->details->view))
                                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                        @elseif ($row->type == 'relationship')

                                            @if($row->field == 'product_belongsto_category_relationship')

                                                <select  name="category_id" id="id"  class="form-control" >
                                                    <option value="">---</option>
                                                    <x-nboard.category-select
                                                        :categories="$categories"
                                                        :selected="$dataTypeContent->category_id ?? null"
                                                        :level="0"
                                                    />
                                                </select>

                                            @else
                                                @include('voyager::formfields.relationship', ['options' => $row->details])
                                            @endif



                                        @else
                                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                        @endif




                                        @if ($errors->has($row->field))
                                            @foreach ($errors->get($row->field) as $error)
                                                <span class="help-block">{{ $error }}</span>
                                            @endforeach
                                        @endif

                                    </div>
                                @endif

                                    @if($row->field == 'images')
                                        @php
                                            $images = json_decode(old($row->field, $dataTypeContent->{$row->field} ?? '[]'), true);
                                        @endphp
                                        <div class="form-group  col-md-12 ">
                                            <label class="control-label" for="{{ $row->field }}">{{ $row->display_name }}</label>
                                            <br>
                                            <div class="clearfix"></div>
                                            <input type="file" name="images[]" multiple="multiple" accept="image/*">
                                            @if(!empty($images))
                                                <div class="row" style="margin:10px;">
                                                    @foreach($images as $image)
                                                        <div class="col-md-1">
                                                            <div class="thumbnail" style="position:relative;">
                                                                <a href="{{ Voyager::image($image) }}" class="img-responsive"
                                                                   data-fancybox="gallery">
                                                                    <img src="{{ Voyager::image($dataTypeContent->getThumbnail($image, 'medium')) }}"
                                                                         data-file-name="{{ $image }}"
                                                                         data-field-name="{{ $row->field }}"
                                                                         data-id="{{ $dataTypeContent->id }}"
                                                                    />
                                                                </a>
                                                                <button type="button" class="close remove-multi-image" style="position:absolute; top:5px; right:5px;">&times;</button>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            @endif
                                        </div>
                                    @endif

                            @endforeach















                                {{--custom fields start--}}

                                <div class="form-group col-md-12">
                                 @if(isset($dataTypeContent) && $dataTypeContent->attributeValues->isNotEmpty() && $dataTypeContent->id)
                                    <h3>Product Attributes</h3>

                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Attribute</th>
                                            <th>Value</th>
                                            <th>Unit</th>
                                            <th width="100">Delete</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        @foreach($productAttributes as $attr)

                                            <tr>
                                                <td>{{ $attr->attribute->name }}</td>

                                                <td>
                                                    @if($attr->value_id)
                                                        {{ $attr?->attribute_value?->value }}
                                                    @elseif($attr->value_text)
                                                        {{ $attr->value_text }}
                                                    @elseif($attr->value_number)
                                                        {{ $attr->value_number }}
                                                    @else
                                                        —
                                                    @endif
                                                </td>

                                                <td>{{ $attr->attribute->unit ?? '-' }}</td>

                                                <td>
                                                    <button data-id="{{ $attr->id }}" class="btn btn-danger btn-sm delete-product-attribute" >
                                                        Delete
                                                    </button>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                @endif
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Attributes</label>
                                    <div id="attribute-container"></div>

                                    <button type="button" id="add-attribute" class="btn btn-primary btn-sm">
                                        <i class="glyphicon glyphicon-plus"></i> Add Attribute
                                    </button>
                                </div>

                                <!-- Hidden Base Template (cloned on click) -->
                                <div id="attribute-template" class="attribute-row" style="display:none;">
                                    <div class="row" style="margin-bottom:10px;">

                                        <!-- Attribute Select -->
                                        <div class="col-md-4">
                                            <select class="form-control attr-select">
                                                <option value="">Select attribute…</option>
                                                @foreach($attributes as $attribute)
                                                    <option value="{{ $attribute->id }}" data-type="{{ $attribute->type }}">
                                                        {{ $attribute->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Dynamic Field -->
                                        <div class="col-md-5 dynamic-field"></div>

                                        <!-- Remove Button -->
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-danger btn-sm remove-attribute">
                                                <i class="glyphicon glyphicon-remove"></i>
                                                Remove
                                            </button>
                                        </div>

                                    </div>
                                </div>
                                {{--custom fields start--}}



























                                @foreach($dataTypeRows as $row)



                                @endforeach

                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary pull-right save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')


                        </div><!-- panel-body -->
                    </div>
                </div>

            </div>


        </form>



        <div style="display:none">
            <input type="hidden" id="upload_url" value="{{ route('voyager.upload') }}">
            <input type="hidden" id="upload_type_slug" value="{{ $dataType->slug }}">
        </div>

    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}
                    </h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'
                    </h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger"
                            id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')

    <script>


        $(document).ready(function () {

            // Add attribute row
            $("#add-attribute").on("click", function () {
                let row = $("#attribute-template").clone().removeAttr("id").show();
                row.find(".attr-select").attr("name", "attributes[]");
                $("#attribute-container").append(row);
            });

            // Remove attribute row
            $(document).on("click", ".remove-attribute", function () {
                $(this).closest(".attribute-row").remove();
            });

            // Change event for attribute select
            $(document).on("change", ".attr-select", function () {
                let parentRow = $(this).closest(".attribute-row");
                let type = $(this).find(":selected").data("type");
                let attribute_id = $(this).val();



                // Clear previous field
                parentRow.find(".dynamic-field").html("");

                // Example dynamic fields
                if (type === "select") {


                    $.ajax({
                        url: '{{ route('ajax.call') }}',
                        type: 'POST',
                        data: {
                            action: 'getAttributesValue',
                            value: attribute_id,
                            _token: $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function (response) {
                            if (response) {
                                if(response.success === true){
                                    let options = '<option value="">Choose value…</option>';

                                    $.each(response.data, function (key, value) {
                                        options += `<option value="${key}">${value}</option>`;
                                    });

                                    parentRow.find(".dynamic-field").html(`
                                        <select name="attribute_value[]" class="form-control">
                                            ${options}
                                        </select>
                                    `);
                                }

                            }
                        }
                    });



                } else {
                    // Default text input
                    parentRow.find(".dynamic-field").html(`
                <input type="text" name="attribute_value[]" class="form-control" placeholder="Enter value">
            `);
                }
            });

        });

















        $(function(){
            Fancybox.bind("[data-fancybox]", {
                // Your custom options
            });
        });

        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
            return function () {
                $file = $(this).closest('.thumbnail').find('a img');

                params = {
                    slug: '{{ $dataType->slug }}',
                    filename: $file.data('file-name'),
                    id: $file.data('id'),
                    field: $file.data('field-name'),
                    multi: isMulti,
                    _token: '{{ csrf_token() }}'
                }

                $('.confirm_delete_name').text(params.filename);
                $('#confirm_delete_modal').modal('show');
            };
        }

        $('document').ready(function () {
            $('#slug').slugify();
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: ['YYYY-MM-DD']
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
            $('.side-body').multilingual({"editing": true});
            $('.side-body input[data-slug-origin]').each(function (i, el) {
                $(el).slugify();
            });
            @endif

            $('.side-body input[data-slug-origin]').each(function (i, el) {
                $(el).slugify({
                    forceUpdate: true
                });
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.panel-body').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function () {
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if (response
                        && response.data
                        && response.data.status
                        && response.data.status == 200) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function () {
                            $(this).remove();
                        })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@stop
