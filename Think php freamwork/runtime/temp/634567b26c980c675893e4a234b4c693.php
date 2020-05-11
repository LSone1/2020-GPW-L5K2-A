<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:101:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\public/../application/index\view\user\cases.html";i:1583263012;s:95:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\layout\default.html";i:1583127433;s:92:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\common\meta.html";i:1582854760;s:95:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\common\sidenav.html";i:1583170706;s:94:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\index\view\common\script.html";i:1582854760;}*/ ?>
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
            <style>
    .profile-avatar-container {
        position: relative;
        width: 100px;
    }

    .profile-avatar-container .profile-user-img {
        width: 100px;
        height: 100px;
    }

    .profile-avatar-container .profile-avatar-text {
        display: none;
    }

    .profile-avatar-container:hover .profile-avatar-text {
        display: block;
        position: absolute;
        height: 100px;
        width: 100px;
        background: #444;
        opacity: .6;
        color: #fff;
        top: 0;
        left: 0;
        line-height: 100px;
        text-align: center;
    }

    .profile-avatar-container button {
        position: absolute;
        top: 0;
        left: 0;
        width: 100px;
        height: 100px;
        opacity: 0;
    }
</style>
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
            <form method="get" action="">
                <div class="fixed-table-toolbar">
                    <div class="bs-bars pull-left">
                        <div id="toolbar" class="toolbar">
                            <a href="<?php echo url('addCase'); ?>" class="btn btn-success btn-add" title="add case"><i class="fa fa-plus"></i> <?php echo __('Add'); ?></a>

                        </div>
                    </div>
                   <div class="form-group col-xs-12 col-sm-9 col-md-4 col-lg-3">
                       <div>
                           <input type="text" class="form-control" name="evidence" value="<?php echo input('evidence','','trim'); ?>" placeholder="<?php echo __('Evidence'); ?>" >
                       </div>
                   </div>
                    <div class="bs-bars pull-left">
                        <div id="" class="toolbar">
                            <button class="btn btn-default" type="submit" name="commonSearch" title="<?php echo __('Search'); ?>"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </div>
            </form>

            <table id="table" class="table table-striped table-bordered table-hover"
                   width="100%">
                <thead>
                <tr>
                    <th style="text-align: center; vertical-align: middle; " data-field="id">
                        <div class="th-inner "><?php echo __('Case name'); ?></div>
                        <div class="fht-cell"></div>
                    </th>

                    <th style="text-align: center; vertical-align: middle; " data-field="id">
                        <div class="th-inner "><?php echo __('Cases tag'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: center; vertical-align: middle; " data-field="type">
                        <div class="th-inner "><?php echo __('Cases Publish time'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: left; vertical-align: middle; ">
                        <div class="th-inner "><?php echo __('Push_status'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: center; vertical-align: middle; ">
                        <div class="th-inner "><?php echo __('Push_staff'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: center; vertical-align: middle;">
                        <div class="th-inner "><?php echo __('Handle status'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: center; vertical-align: middle;">
                        <div class="th-inner "><?php echo __('Case money'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: center; vertical-align: middle;">
                        <div class="th-inner "><?php echo __('Handle start time'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                    <th style="text-align: center; vertical-align: middle; ">
                        <div class="th-inner "><?php echo __('Handle end time'); ?></div>
                        <div class="fht-cell"></div>
                    </th>

                    <th style="text-align: center; vertical-align: middle;">
                        <div class="th-inner "><?php echo __('Operate'); ?></div>
                        <div class="fht-cell"></div>
                    </th>
                </tr>
                </thead>
                <tbody data-listidx="0">

                <?php if(is_array($data) || $data instanceof \think\Collection || $data instanceof \think\Paginator): if( count($data)==0 ) : echo "" ;else: foreach($data as $key=>$v): ?>
                <tr data-index="1">
                    <td style="text-align: center; vertical-align: middle; "><?php echo $v['case_name']; ?></td>
                    <td style="text-align: center; vertical-align: middle; "><?php echo $v['tag']; ?></td>
                    <td style="text-align: center; vertical-align: middle; "><?php echo date('Y-m-d H:i',$v['create_time']); ?></td>
                    <td style="text-align: center; vertical-align: middle; ">
                        <?php if($v['push_status'] == 0): ?>
                            <?php echo __('Wait push'); elseif($v['push_status'] == 1): ?>
                             <?php echo __('Had push'); else: ?>
                           <?php echo __('Refush push'); endif; ?>
                    </td>
                    <td style="text-align: center; vertical-align: middle; "><?php echo $v['staff_name']; ?></td>

                    <td style="text-align: center; vertical-align: middle; ">
                        <?php if($v['handle_status'] == 0): ?>
                        <?php echo __('In process'); elseif($v['handle_status'] == 1): ?>
                        <?php echo __('Had success'); else: ?>
                        <?php echo __('Had fail'); endif; ?>
                    </td>
                    <td style="text-align: center; vertical-align: middle; "><?php echo $v['money']; ?></td>
                    <td style="text-align: center; vertical-align: middle; ">
                        <?php if($v['push_status'] == 1): ?>
                            <?php echo date('Y-m-d H:i',$v['start_time']); endif; ?>
                    </td>
                    <td style="text-align: center; vertical-align: middle; ">
                        <?php if($v['end_time']): ?>
                            <?php echo date('Y-m-d H:i',$v['end_time']); endif; ?>
                    </td>
                    <td style="text-align: center; vertical-align: middle; ">
                        <a href="/index/user/editCase/id/<?php echo $v['id']; ?>" class="btn btn-xs btn-success btn-editone" data-toggle="tooltip" title="" data-table-id="table" data-field-index="18" data-row-index="0" data-button-index="1" data-original-title="<?php echo __('Edit'); ?>"><i class="fa fa-pencil"></i></a>
                        <a href="/index/user/dealCase/id/<?php echo $v['id']; ?>" class="btn btn-xs btn-danger btn-delone" data-toggle="tooltip" title="" data-table-id="table" data-field-index="18" data-row-index="0" data-button-index="2" data-original-title="<?php echo __('Del'); ?>" aria-describedby="tooltip575010"><i class="fa fa-trash"></i></a>
                    </td>
                </tr>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>

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