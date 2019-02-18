<#import "parts/common.ftl" as c>

<@c.page>
    <div class="row d-flex justify-content-center wow fadeIn">
        <div class="col-lg-4 col-md-12 align-self-center">
            <div class="card">
                <form class="border border-light p-5">

                    <p class="h4 mb-4 text-center">Sign in</p>

                    <input type="text" id="defaultLoginForm" class="form-control mb-4" placeholder="Login">

                    <input type="password" id="defaultLoginFormPassword" class="form-control mb-4"
                           placeholder="Password">

                    <div class="d-flex justify-content-center">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                        </div>
                    </div>

                    <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

                </form>
            </div>
        </div>
    </div>
</@c.page>