
<?php 

/**
 * Load smarty
 */
require './smarty/libs/Smarty.class.php';
$smarty = new Smarty;
$smarty->assign("apiData", $_POST['apiData']);
$smarty->display('info.tpl');


