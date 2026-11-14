@extends('layouts.app')

@section('title', __('lang_v1.messaging'))

@section('content')

    <section class="content-header">
        <h1 class="tw-text-xl md:tw-text-3xl tw-font-bold tw-text-black">
            @lang('lang_v1.messaging')
            <small>@lang('lang_v1.send_sms')</small>
        </h1>
    </section>

    <section class="content">

        <div class="row">

            <!-- LEFT SIDE -->
            <div class="col-md-8">

                <div class="box box-solid">
                    <div class="box-body">

                        <form method="POST" id="smsForm"
                            action="{{ action([\App\Http\Controllers\MessagingController::class, 'sendSms']) }}">
                            @csrf

                            <!-- Sender ID -->
                            <div class="form-group">
                                <label>@lang('lang_v1.sender_id')</label>
                                <input type="text" name="sender_id" class="form-control" value="8809617624366">
                            </div>

                            <!-- Duplicate Check -->
                            <div class="form-group">
                                <label>@lang('lang_v1.duplicate_check')</label><br>
                                <input type="checkbox" checked>
                            </div>

                            <!-- Recipients -->
                            <div class="form-group">
                                <label>@lang('lang_v1.recipients')</label>
                                @php
                                    if ($is_superadmin) {
                                        $recipient_options = [
                                            'all_businesses' => 'All Businesses',
                                        ];

                                        if (isset($businesses)) {
                                            $recipient_options += $businesses->toArray();
                                            /* foreach ($businesses as $id => $name) {
                                                $recipient_options['business_' . $id] = $name;
                                            } */
                                        }
                                    } else {
                                        $recipient_options = [
                                            'all_customers' => 'All Customers',
                                            'all_suppliers' => 'All Suppliers',
                                        ];
                                        $recipient_options += $customers->toArray() + $suppliers->toArray();
                                    }
                                @endphp
                                {!! Form::select('recipients[]', $recipient_options, null, [
        'class' => 'form-control mousetrap select2',
        'id' => 'recipients',
        'required',
        'multiple',
        'data-tags' => 'true',
        'data-tokenSeparators' => '[",", " "]',
    ]) !!}
                            </div>

                            <!-- Message + Stats -->
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label>@lang('lang_v1.message')</label>
                                        <textarea id="message" name="message" rows="6" class="form-control"></textarea>
                                    </div>
                                </div>

                                {{-- <div class="col-md-4">
                                    <div class="well">
                                        <p><strong>@lang('lang_v1.encoding'):</strong> GSM_7BIT_EX</p>
                                        <p>@lang('lang_v1.character_count'): <span id="char_count">0</span></p>
                                        <p>@lang('lang_v1.sms_parts'): <span id="sms_parts">0</span></p>
                                        <p>@lang('lang_v1.remaining'): <span id="remaining">160</span></p>
                                    </div>
                                </div> --}}
                            </div>

                            <!-- Buttons -->
                            {{-- <div class="form-group">
                                <button type="button" class="btn btn-info">
                                    <i class="fa fa-save"></i> @lang('lang_v1.save_draft')
                                </button>

                                <button type="button" class="btn btn-warning">
                                    <i class="fa fa-trash"></i> @lang('lang_v1.delete')
                                </button>
                            </div> --}}

                            <!-- Schedule -->
                            <div class="form-group">
                                <label>@lang('lang_v1.schedule_sms')</label><br>

                                <label>
                                    <input type="radio" name="schedule_type" value="now" checked>
                                    @lang('lang_v1.send_now')
                                </label>

                                <label style="margin-left:20px;">
                                    <input type="radio" name="schedule_type" value="later">
                                    @lang('lang_v1.send_later')
                                </label>
                            </div>

                            <div class="form-group" id="schedule_time_row" style="display: none;">
                                <label>@lang('lang_v1.schedule_time')</label>
                                <input type="datetime-local" name="schedule_time" id="schedule_time" class="form-control">
                            </div>
                            <!-- Footer Buttons -->
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary" @disabled(!isset($sms_balance['balance']) || $sms_balance['balance'] == 0)>@lang('lang_v1.send_sms')</button>
                                <button type="reset" class="btn btn-danger">@lang('lang_v1.cancel')</button>
                            </div>

                        </form>

                    </div>
                </div>

            </div>

            <!-- RIGHT SIDE -->
            <div class="col-md-4">
                @if (isset($sms_balance['balance']))
                    <div class="box box-solid">
                        <div class="box-header">
                            <h4>@lang('lang_v1.my_account')</h4>
                        </div>
                        <div class="box-body">
                            <p>
                                <strong>@lang('lang_v1.acc_balance'):</strong> {{ $sms_balance['balance'] }}
                            </p>
                            {{-- <p>
                                <strong>@lang('lang_v1.balance_validity'):</strong> 18-Oct-2026
                            </p> --}}
                        </div>
                    </div>
                @endif
            </div>

        </div>

    </section>

@endsection


@section('javascript')

    <script>
        $(document).ready(function () {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            function toggleScheduleTime() {
                const later = $('input[name="schedule_type"]:checked').val() === 'later';
                $('#schedule_time_row').toggle(later);
                $('#schedule_time').prop('required', later);
            }

            $('input[name="schedule_type"]').change(toggleScheduleTime);
            toggleScheduleTime();

            $('#smsForm').on('submit', function (e) {
                e.preventDefault();

                let form = $(this);
                let url = form.attr('action');
                let btn = form.find('button[type="submit"]');
                btn.prop('disabled', true).text('Sending...');

                let formData = form.serializeArray();

                if ($('input[name="schedule_type"]:checked').val() === 'now') {
                    formData = formData.filter(field => field.name !== 'schedule_time');
                }

                $.ajax({
                    url: url,
                    type: "POST",
                    data: $.param(formData),

                    success: function (response) {
                        if (response.success) {
                            form[0].reset();
                            $('#recipients').val(null).trigger('change');
                            toastr.success(response?.msg);
                            setTimeout(function () {
                                location.reload();
                            }, 1000);
                        } else {
                            toastr.error(response?.msg);
                        }
                    },

                    error: function (xhr) {
                        if (xhr.status === 422) {
                            let error = xhr.responseJSON;
                            toastr.error(error?.msg);
                        } else {
                            toastr.error('Server error ❌');
                        }
                    },

                    complete: function () {
                        btn.prop('disabled', false).text('Send SMS');
                    }
                });
            });

        });
        document.getElementById('message').addEventListener('input', function () {
            let text = this.value.length;

            document.getElementById('char_count').innerText = text;
            document.getElementById('remaining').innerText = 160 - text;

            let parts = Math.ceil(text / 160);
            document.getElementById('sms_parts').innerText = parts;
        });
    </script>

@endsection