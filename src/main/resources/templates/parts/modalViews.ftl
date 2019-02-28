<#macro editView category_counter>
    <div class="m-auto">
        <button type="button" class="btn btn-info text-white btn-sm" data-toggle="modal"
        data-target="#edit_modal_form${category_counter}">
            <i class="fas fa-pencil-alt mr-2"></i>Редактировать</button>
    </div>

    <div class="modal fade" id="edit_modal_form${category_counter}" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fas fa-envelope prefix grey-text"></i>
                        <input type="email" id="defaultForm-email${category_counter}"
                               class="form-control validate">
                        <label data-error="wrong" data-success="right"
                               for="defaultForm-email${category_counter}">Your email</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fas fa-lock prefix grey-text"></i>
                        <input type="password" id="defaultForm-pass${category_counter}"
                               class="form-control validate">
                        <label data-error="wrong" data-success="right"
                               for="defaultForm-pass${category_counter}">Your password</label>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button class="btn btn-default">Login</button>
                </div>
            </div>
        </div>
    </div>
</#macro>