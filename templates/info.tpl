
<table class="table table-striped table-hover table-info table-borderless" id="task-list">
  <thead>
    <tr>
      <th scope="col">Title</th>
      <th scope="col">Description</th>
      <th scope="col">Status</th>
      <th scope="col">Due date</th>
      <th scope="col">Edit task</th>
      <th scope="col">Delete task</th>
    </tr>
  </thead>
  <tbody>
    {foreach $apiData as $item}
        <tr>
            <td>{$item.title}</td>
            <td>{$item.description}</td>
            <td>{$item.status}</td>
            <td>{$item.due_date}</td>
            <td><button type="button" id="btn-edit-task" class="btn btn-warning btn-sm" 
                data-task-id="{$item.id}"
                data-task-title="{$item.title}"
                data-task-desc="{$item.description}"
                data-task-status="{$item.status}"
                data-task-due-date="{$item.due_date}"
                data-bs-toggle="modal"
                data-bs-target="#edit-task-modal">Edit</button></td>
            <td><button type="button" id="btn-delete-task" class="btn btn-danger btn-sm"
                data-task-title="{$item.title}" 
                data-task-id="{$item.id}" 
                data-bs-toggle="modal"
                data-bs-target="#delete-task-modal">Delete</button>
            </td>
        </tr>
    {/foreach}
  </tbody>
</table>

<!-- Modal -->
<div class="modal fade" id="delete-task-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Delete task</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p class="text-center">Are you sure you want to delete the selected task (<span class="text-danger" id="task-identifier"></span>) ?</p>
      </div>
      <div class="modal-footer">
        <form id="delete-task-form" method="delete">
            <input type="hidden" name="id" id="task-id">
            <button type="button" class="btn btn-primary btn-sm"  data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-danger btn-sm" id="confirm-delete-task">Delete</button>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="edit-task-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit task</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="put" id="task-update-form">
                <input type="hidden" name="id" id="task-edit-id">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="title-edit" placeholder="Task Title" name="title">
                        <span class="text-danger error-text" id="title-edit-error"></span>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description <span class="text-danger">*</span></label>
                        <textarea class="form-control" id="description-edit" rows="3" name="description"></textarea>
                        <span class="text-danger error-text" id="description-edit-error"></span>
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select class="form-select" id="status-edit" aria-label="Default select example" name="status">
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date <span class="text-danger">*</span></label>
                        <input type="text" id="task-date-edit" class="form-control task-date-picker" placeholder="Task Date" name="due_date">
                        <span class="text-danger error-text" id="due_date-edit-error"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success btn-sm" id="btn-task-form-update">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // transform tasks list table to datatable
    $('#task-list').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
    });

    $(document).on('click', '#btn-delete-task',  function() {
        let selected = $(this).attr('data-task-id');
        let taskTitle = $(this).attr('data-task-title');
        $('#task-id').val(selected);
        $('#task-identifier').text('Task no: #' + selected + ' - ' + taskTitle);
    });

    $(document).on('click', '#btn-edit-task',  function() {
        // init datepicker
        initDatePicker();

        // get values from props     
        let selected    = $(this).attr('data-task-id');
        let taskTitle   = $(this).attr('data-task-title');
        let taskDesc    = $(this).attr('data-task-desc');
        let taskStatus  = $(this).attr('data-task-status');
        let taskDueDate = $(this).attr('data-task-due-date');
        // assign values to pop up inputs
        $('#task-update-form #title-edit').val(taskTitle);
        $('#task-update-form #description-edit').val(taskDesc);
        $('#task-update-form #status-edit').val(taskStatus);
        $('#task-update-form #task-date-edit').val(taskDueDate);
        $('#task-edit-id').val(selected);
    });
    
    $('#delete-task-form').on('submit', function(e){   
        e.preventDefault();
        let item = $('#task-id').val();
        deleteTask(item);
    });

    $('#task-update-form').on('submit', function(e){   
        e.preventDefault();
        let formData = $('#task-update-form').serialize();
        let item = $('#task-edit-id').val();
        updateTask(item, formData);
    });

    clearMomdalErrors();

</script>