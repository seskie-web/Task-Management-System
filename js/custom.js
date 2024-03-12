// declare api entry endpoint
var apiUrl =  "http://127.0.0.1:8000/api/tasks";

$(function(){
  // init datepicker
  initDatePicker();

  // add new task
  $('#task-create-form').on('submit', function(e){
      e.preventDefault();
      $.ajax({
        url: apiUrl,
        type: 'POST',
        dataType: "json",
        headers: {'Accept': 'application/json'},
        data: $('#task-create-form').serialize(),
        success: function(res) {
          switch(res.status){
              case 1:
                  toastr.options.timeOut = 2000;
                  toastr.success(`${res.msg}`);
                  break;
              case 0:
                  toastr.options.timeOut = 2000;
                  toastr.error(`${res.msg}`);
                  break;
          }
          $('#btn-task-form').removeAttr('disabled');
          // re-load results
          loadResults();
        },
        error: function(err,status,res) {
          // show errors on form
          let errorObject = err.responseJSON.errors;
          for(let i in errorObject) {
            if(errorObject.hasOwnProperty(i)) {
              $('#'+i+'-error').text(errorObject[i][0]);
            }
          }
          $('#btn-task-form').removeAttr('disabled');
        },
        beforeSend: function() {
          $(document).find('#task-create-form .error-text').text('');
          $('#btn-task-form').attr('disabled', 'disabled');
        }
      });
  });
  // load task list on dom ready
  loadResults();
});

// load all tasks
function loadResults() {
  $.ajax({
    url: apiUrl,
    type: 'GET',
    dataType: "json",
    success: function(res) {
        $.ajax({
          type: 'POST',
          url: 'assign_data.php',
          data: { apiData: res.data },
          success: function(response) {
            $('#data-container').html(response);
          },
          error: function(error) {

          }
      });
    },
    error: function(err,status,res) {
      toastr.error('No results found');
    }
  });
}

// delete task
function deleteTask(item) {
  $.ajax({
    url: apiUrl +'/'+ item,
    type: 'DELETE',
    data:  $('#delete-task').serialize(),
    dataType: "json",
    success: function(res) {
      $('#delete-task-modal').modal('hide');
      switch(res.status){
        case 1:
            toastr.options.timeOut = 2000;
            toastr.success(`${res.msg}`);
            break;
        case 0:
            toastr.options.timeOut = 2000;
            toastr.error(`${res.msg}`);
            break;
      }
      // re-load results
      loadResults();
    },
    error: function(err,status,res) {
      // show toast notification on error
      switch(err.responseJSON.status){
        case 0:
            toastr.options.timeOut = 2500;
            toastr.error(`${err.responseJSON.msg}`);
            break;
      }
    }
  });
}

// update a task
function updateTask(item, formData){
  $.ajax({
    url: apiUrl +'/'+ item,
    type: 'PUT',
    dataType: "json",
    headers: {'Accept': 'application/json'},
    data: formData,
    success: function(res) {
      $('#edit-task-modal').modal('hide');
      // show toast notification
      switch(res.status){
          case 1:
              toastr.options.timeOut = 2000;
              toastr.success(`${res.msg}`);
              break;
          case 0:
              toastr.options.timeOut = 2000;
              toastr.error(`${res.msg}`);
              break;
      }
      $('#btn-task-form-update').removeAttr('disabled');
      // re-load results
      loadResults();
    },
    error: function(err,status,res) {
      // show errors on form
      let errorObject = err.responseJSON.errors;
      for(let i in errorObject) {
        if(errorObject.hasOwnProperty(i)) {
          $('#'+i+'-edit-error').text(errorObject[i][0]);
        }
      }
      $('#btn-task-form-update').removeAttr('disabled');
    },
    beforeSend: function() {
      $(document).find('#task-update-form .error-text').text('');
      $('#btn-task-form-update').attr('disabled', 'disabled');
    }
  });
}


// init date picker
function initDatePicker() {
  $('.task-date-picker').datepicker();
}

// clear errors on edit modal when edit task modal is hidden
function clearMomdalErrors() { 
  $('#edit-task-modal').on('hidden.bs.modal', function (e) {
    $(document).find('#task-update-form .error-text').text('');
  });
}