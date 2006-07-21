<?php

  /*********************************************************\
  | View a user's profile                                   |
  | ~~~~~~~~~~~~~~~~~~~~                                    |
  \*********************************************************/

if(!defined('IN_FS')) {
    die('Do not access this file directly.');
}

$page->assign('groups', $fs->ListGroups());

if ($proj->id) {
    $page->assign('project_groups', $fs->ListGroups($proj->id));
}

$id = Flyspray::username_to_id(Get::val('id', Get::val('uid')));

$theuser = new User($id, $proj);
if ($theuser->isAnon()) {
    Flyspray::Redirect(CreateURL('error'));
}

// Some possibly interesting information about the user
$sql = $db->Query('SELECT count(*) FROM {comments} WHERE user_id = ?', array($theuser->id));
$page->assign('comments', $db->fetchOne($sql));

$sql = $db->Query('SELECT count(*) FROM {tasks} WHERE opened_by = ?', array($theuser->id));
$page->assign('tasks', $db->fetchOne($sql));

$page->assign('theuser', $theuser);

$page->setTitle($fs->prefs['page_title'] . L('viewprofile'));
$page->pushTpl('profile.tpl');

?>
