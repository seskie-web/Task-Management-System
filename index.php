
<?php 

/**
 * Load smarty
 */
require './smarty/libs/Smarty.class.php';
$smarty = new Smarty;
$smarty->force_compile = true;
$smarty->debugging = false;
$smarty->caching = false;
$smarty->cache_lifetime = 2;
$smarty->assign("title", "Task Manager");
$smarty->display('index.tpl');


