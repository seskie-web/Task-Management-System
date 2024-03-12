<?php
/* Smarty version 4.3.2, created on 2024-03-12 08:41:16
  from '/var/www/html/taskmanager/templates/task_form.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.2',
  'unifunc' => 'content_65eff90cc1ee80_98772484',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '99e80665b393414b50bd087708edc3f0d37788a1' => 
    array (
      0 => '/var/www/html/taskmanager/templates/task_form.tpl',
      1 => 1710225640,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65eff90cc1ee80_98772484 (Smarty_Internal_Template $_smarty_tpl) {
?>
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
    <button type="submit" class="btn btn-primary btn-sm" id="btn-task-form">Submit</button>
</form><?php }
}
