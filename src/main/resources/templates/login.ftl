<#import "parts/common.ftl" as c>

<@c.page>

    <div class="row d-flex justify-content-center wow fadeIn">
        <div class="col-lg-4 col-md-12 align-self-center">
            <div class="card">
                <form class="border border-light p-5" action="/login" method="POST">

                    <p class="h4 mb-4 text-center">Sign in</p>

                    <input type="text" name="username" id="username" class="form-control mb-4" placeholder="Username">

                    <input type="password" name="password" id="password" class="form-control mb-4"
                           placeholder="Password">

                    <button class="btn info-color-dark btn-block my-4" type="submit">Sign in</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>