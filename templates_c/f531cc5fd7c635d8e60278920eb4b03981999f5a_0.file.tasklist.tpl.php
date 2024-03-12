<?php
/* Smarty version 4.3.2, created on 2024-03-11 09:27:05
  from '/var/www/html/taskmanager/templates/tasklist.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.2',
  'unifunc' => 'content_65eeb249212716_85303380',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'f531cc5fd7c635d8e60278920eb4b03981999f5a' => 
    array (
      0 => '/var/www/html/taskmanager/templates/tasklist.tpl',
      1 => 1710141966,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65eeb249212716_85303380 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="data-list"></div>
<?php echo '<script'; ?>
 type="text/x-jsmart-tmpl" id="output">
    <table class="table" id="task-list">
        <thead>
            <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Status</th>
            <th scope="col">Due date</th>
            </tr>
        </thead>
        <tbody>

        hello , <?php echo $_smarty_tpl->tpl_vars['name']->value;?>

                </tbody>
    </table>
<?php echo '</script'; ?>
>

<?php }
}
