<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:105:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\public/../application/admin\view\user_case\edit.html";i:1583434574;s:95:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\admin\view\layout\default.html";i:1582854760;s:92:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\admin\view\common\meta.html";i:1582854760;s:94:"D:\systemsoft\phpstudy\phpstudy_pro\WWW\www.fast.com\application\admin\view\common\script.html";i:1582854760;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG && !\think\Config::get('fastadmin.multiplenav')): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Case name'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-uid" data-rule="required" class="form-control" name="row[case_name]" type="text" value="<?php echo $row['case_name']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Tag'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-tag"  data-rule="required" class="form-control" name="row[tag]" type="text" value="<?php echo htmlentities($row['tag']); ?>">
        </div>
    </div>

     <?php if(checkIsstaff() == false): ?>
        <div class="form-group">
            <label class="control-label col-xs-12 col-sm-2"><?php echo __('Staff_id'); ?>:</label>
            <div class="col-xs-12 col-sm-8">

                <select  id="c-week" data-rule="required" class="form-control selectpicker" name="row[staff_id]">
                    <option value="0">--请选择---</option>
                    <?php if(is_array($staffs) || $staffs instanceof \think\Collection || $staffs instanceof \think\Paginator): if( count($staffs)==0 ) : echo "" ;else: foreach($staffs as $key=>$vo): ?>
                    <option value="<?php echo $vo['id']; ?>" <?php if($row['staff_id'] == $vo['id']): ?>selected<?php endif; ?>><?php echo $vo['username']; ?></option>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>

            </div>
        </div>
    <?php endif; if(checkIsstaff() == false): ?>

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Push_status'); ?>:</label>
        <div class="col-xs-12 col-sm-8">

            <div class="radio">
                <label for="row[state]-0"><input <?php if($row['push_status'] == 0): ?>checked<?php endif; ?> id="row[state]-0" name="row[push_status]" type="radio" value="0" /><?php echo __('Wait push'); ?></label>
                <label for="row[state]-1"><input <?php if($row['push_status'] == 1): ?>checked<?php endif; ?> id="row[state]-1" name="row[push_status]" type="radio" value="1" /><?php echo __('Had push'); ?></label>
                <label for="row[state]-2"><input <?php if($row['push_status'] == 2): ?>checked<?php endif; ?> id="row[state]-2" name="row[push_status]" type="radio" value="2" /><?php echo __('Refuse push'); ?></label>
            </div>

        </div>
    </div>
    <?php endif; ?>


    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Handle_status'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <div class="radio">
                <label for="row[state]-00"><input <?php if($row['handle_status'] == 0): ?>checked<?php endif; ?>  id="row[state]-00"   name="row[handle_status]" type="radio" value="0" /><?php echo __('Handling'); ?></label>
                <label for="row[state]-11"><input  <?php if($row['handle_status'] == 1): ?>checked<?php endif; ?> id="row[state]-11"   name="row[handle_status]" type="radio" value="1" /><?php echo __('Success'); ?></label>
                <label for="row[state]-22"><input <?php if($row['handle_status'] == 2): ?>checked<?php endif; ?> id="row[state]-22"  name="row[handle_status]" type="radio" value="2" /><?php echo __('Faied'); ?></label>
            </div>
        </div>
    </div>



    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Woker_hourse'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-woker_hourse" <?php if(checkIsstaff()): ?>disabled<?php endif; ?> data-rule="required" class="form-control" name="row[woker_hourse]" type="number" value="<?php echo htmlentities($row['woker_hourse']); ?>">
        </div>
    </div>


    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Money'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-money" data-rule="required" <?php if(checkIsstaff()): ?>disabled<?php endif; ?>  class="form-control" step="0.01" name="row[money]" type="number" value="<?php echo htmlentities($row['money']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Start_time'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-start_time" <?php if(checkIsstaff()): ?>disabled<?php endif; ?>  data-rule="required" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[start_time]" type="text" value="<?php echo $row['start_time']?datetime($row['start_time']):''; ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('End_time'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input  class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[end_time]" type="text" value="<?php echo $row['end_time']?datetime($row['end_time']):''; ?>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Contents'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <textarea  class="form-control " rows="5" name="row[contents]" cols="50"><?php echo htmlentities($row['contents']); ?></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Reason'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <textarea class="form-control " rows="5" name="row[reason]" cols="50"><?php echo htmlentities($row['reason']); ?></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Evidence'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <textarea class="form-control " rows="5" name="row[evidence]" cols="50"><?php echo htmlentities($row['evidence']); ?></textarea>
        </div>
    </div>
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
            <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
        </div>
    </div>
</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>