<#import "parts/common.ftl" as c>

<@c.page>
    <div class="row wow fadeIn">
        <div class="col-3">
            <form method="post" enctype="multipart/form-data">
                <div class="md-form">
                    <i class="fas fa-pencil-alt prefix"></i>
                    <textarea type="text" id="categoryName" name="categoryName" class="md-textarea form-control" rows="1"></textarea>
                    <label for="form10">Добавить категорию</label>
                    <button class="btn btn-info text-white btn-sm"
                    " type="submit">Добавить</button>
                </div>
            </form>
        </div>
    </div>
</@c.page>