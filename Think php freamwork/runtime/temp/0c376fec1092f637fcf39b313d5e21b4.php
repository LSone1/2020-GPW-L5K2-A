<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:105:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\public/../application/index\view\user\edit_case.html";i:1583253422;s:95:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\layout\default.html";i:1583127433;s:92:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\common\meta.html";i:1582854760;s:95:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\common\sidenav.html";i:1583170706;s:94:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\common\script.html";i:1582854760;}*/ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?> – <?php echo $site['name']; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<?php if(isset($keywords)): ?>
<meta name="keywords" content="<?php echo $keywords; ?>">
<?php endif; if(isset($description)): ?>
<meta name="description" content="<?php echo $description; ?>">
<?php endif; ?>

<link rel="shortcut icon" href="/assets/img/favicon.ico" />

<link href="/assets/css/frontend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config: <?php echo json_encode($config); ?>
    };
</script>
        <link href="/assets/css/user.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">
    </head>

    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?php echo url('/'); ?>"><?php echo $site['name']; ?></a>
                </div>
                <div class="collapse navbar-collapse" id="header-navbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<?php echo url('/'); ?>" target="_blank"><?php echo __('Home'); ?></a></li>
                        <li class="dropdown">
                            <?php if($user): ?>
                            <a href="<?php echo url('user/index'); ?>" class="dropdown-toggle" data-toggle="dropdown" style="padding-top: 10px;height: 50px;">
                                <span class="avatar-img"><img src="<?php echo cdnurl($user['avatar']); ?>" alt=""></span>
                            </a>
                            <?php else: ?>
                            <a href="<?php echo url('user/index'); ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo __('User center'); ?> <b class="caret"></b></a>
                            <?php endif; ?>
                            <ul class="dropdown-menu">
                                <?php if($user): ?>
                                <li><a href="<?php echo url('user/index'); ?>"><i class="fa fa-user-circle fa-fw"></i><?php echo __('User center'); ?></a></li>
                                <li><a href="<?php echo url('user/profile'); ?>"><i class="fa fa-user-o fa-fw"></i><?php echo __('Profile'); ?></a></li>
                                <li><a href="<?php echo url('user/changepwd'); ?>"><i class="fa fa-key fa-fw"></i><?php echo __('Change password'); ?></a></li>
                                <li><a href="<?php echo url('user/logout'); ?>"><i class="fa fa-sign-out fa-fw"></i><?php echo __('Sign out'); ?></a></li>
                                <?php else: ?>
                                <li><a href="<?php echo url('user/login'); ?>"><i class="fa fa-sign-in fa-fw"></i> <?php echo __('Sign in'); ?></a></li>
                                <li><a href="<?php echo url('user/register'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Sign up'); ?></a></li>
                                <?php endif; if(cache('lang_env') == '' || cache('lang_env') == 'en'): ?>
                                   <li><a href="<?php echo url('api/common/transSite',['lang'=>'cn']); ?>"><i class="fa fa-sign-out fa-fw"></i> Chiness Website</a></li>
                                <?php else: ?>
                                   <li><a href="<?php echo url('api/common/transSite',['lang'=>'en']); ?>"><i class="fa fa-sign-out  fa-fw"></i> English Website</a></li>
                                <?php endif; ?>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <main class="content">
            <div id="content-container" class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="sidenav">
    <?php echo hook('user_sidenav_before'); ?>
    <ul class="list-group">
        <li class="list-group-heading"><?php echo __('Member center'); ?></li>
        <li class="list-group-item <?php echo $config['actionname']=='index'?'active':''; ?>"> <a href="<?php echo url('user/index'); ?>"><i class="fa fa-user-circle fa-fw"></i> <?php echo __('User center'); ?></a> </li>
        <li class="list-group-item <?php echo $config['actionname']=='profile'?'active':''; ?>"> <a href="<?php echo url('user/profile'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Profile'); ?></a> </li>
        <li class="list-group-item <?php echo $config['actionname']=='extend'?'active':''; ?>"> <a href="<?php echo url('user/extend'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Company info'); ?></a> </li>
        <li class="list-group-item <?php echo $config['actionname']=='cases' || $config['actionname']=='addcase'?'active':''; ?>"> <a href="<?php echo url('user/cases'); ?>"><i class="fa fa-user-o fa-fw"></i> <?php echo __('Cases center'); ?></a> </li>
        <li class="list-group-item <?php echo $config['actionname']=='changepwd'?'active':''; ?>"> <a href="<?php echo url('user/changepwd'); ?>"><i class="fa fa-key fa-fw"></i> <?php echo __('Change password'); ?></a> </li>
        <li class="list-group-item <?php echo $config['actionname']=='logout'?'active':''; ?>"> <a href="<?php echo url('user/logout'); ?>"><i class="fa fa-sign-out fa-fw"></i> <?php echo __('Sign out'); ?></a> </li>
    </ul>
    <?php echo hook('user_sidenav_after'); ?>
</div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2 class="page-header"><?php echo __('Case view'); ?></h2>
                    <form id="changepwd-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">
                        <div class="form-group">
                            <label  class="control-label col-xs-12 col-sm-2"><?php echo __('Case tag'); ?>:</label>
                            <div class="radio">
                                <label>
                                    <input <?php if($info['tag'] == __('Criminal case')): ?>checked<?php endif; ?> name="tag" value="<?php echo __('Criminal case'); ?>" type="radio"><?php echo __('Criminal case'); ?>
                                </label>
                                <label>
                                    <input <?php if($info['tag'] == __('Civil case')): ?>checked<?php endif; ?>  name="tag" value="<?php echo __('Civil case'); ?>" type="radio"><?php echo __('Civil case'); ?>
                                </label>
                                <label>
                                    <input <?php if($info['tag'] == __('Jurisdiction case')): ?>checked<?php endif; ?>  name="tag" value="<?php echo __('Jurisdiction case'); ?>" type="radio"><?php echo __('Jurisdiction case'); ?>
                                </label>
                                <label>
                                    <input <?php if($info['tag'] == __('administrative case')): ?>checked<?php endif; ?>  name="tag" value="<?php echo __('administrative case'); ?>" type="radio"><?php echo __('administrative case'); ?>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="oldpassword" class="control-label col-xs-12 col-sm-2"><?php echo __('Case money'); ?>:</label>
                            <div class="col-xs-12 col-sm-4">
                                <input type="text" class="form-control" id="oldpassword" name="money" disabled  value="<?php echo $info['money']; ?>" data-rule="required" placeholder="<?php echo __('Case money'); ?>">
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="content" class="control-label col-xs-12 col-sm-2"><?php echo __('Case evidence'); ?>:</label>
                            <div class="col-xs-12 col-sm-4">
                                <textarea  style="height: 200px;width: 600px;" class="form-control" disabled  name="evidence"><?php echo $info['evidence']; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="content" class="control-label col-xs-12 col-sm-2"><?php echo __('Case reason'); ?>:</label>
                            <div class="col-xs-12 col-sm-4">
                                <textarea  style="height: 200px;width: 600px;" class="form-control" disabled  name="reason"><?php echo $info['reason']; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="content" class="control-label col-xs-12 col-sm-2"><?php echo __('Case content'); ?>:</label>
                            <div class="col-xs-12 col-sm-4">
                                <textarea  style="height: 200px;width: 600px;" class="form-control" id="content" name="contents"><?php echo $info['contents']; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group normal-footer">
                            <label class="control-label col-xs-12 col-sm-2"></label>
                            <div class="col-xs-12 col-sm-8">
                                <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('Submit'); ?></button>
                                <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
        </main>

        <footer class="footer" style="clear:both">
            <p class="copyright">Copyright&nbsp;©&nbsp;2017-2020 <?php echo $site['name']; ?> All Rights Reserved <a href="http://www.beian.miit.gov.cn" target="_blank"><?php echo htmlentities($site['beian']); ?></a></p>
        </footer>

        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-frontend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>

    </body>

</html>