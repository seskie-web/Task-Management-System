{include file="header.tpl"}
<div class="container py-3">
    <header>
        <div class="pb-3 mb-4 border-bottom">
            <h2>{$title}</h2>
        </div>
    </header>
    <main>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-xl-4">
                    <div class="card">
                        <div class="card-header">
                          <h3>Create new task</h3>
                        </div>
                        <div class="card-body">
                            <form action="" method="POST" id="task-create-form">
                                <div class="mb-3">
                                    <label for="title" class="form-label">Title <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="title" placeholder="Task Title" name="title">
                                    <span class="text-danger error-text" id="title-error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description <span class="text-danger">*</span></label>
                                    <textarea class="form-control" id="description" rows="3" name="description"></textarea>
                                    <span class="text-danger error-text" id="description-error"></span>
                                </div>
                                <div class="mb-3">
                                    <label for="status" class="form-label">Status</label>
                                    <select class="form-select" id="status" aria-label="Default select example" name="status">
                                        <option value="pending">Pending</option>
                                        <option value="completed">Completed</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="date" class="form-label">Date <span class="text-danger">*</span></label>
                                    <input type="text" id="task-date" class="form-control task-date-picker" placeholder="Task Date" name="due_date">
                                    <span class="text-danger error-text" id="due_date-error"></span>
                                </div>
                                <button type="submit" class="btn btn-success btn-sm" id="btn-task-form">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-xl-8">
                    <div class="card mt-5 mt-xl-0">
                        <div class="card-header">
                            <h3>All tasks</h3>
                        </div>
                        <div class="card-body">
                            <div id="data-container"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
{include file="footer.tpl"}
