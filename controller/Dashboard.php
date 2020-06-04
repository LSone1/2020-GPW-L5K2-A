<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Config;

/**
 * 控制台
 *
 * @icon fa fa-dashboard
 * @remark 用于展示当前系统中的统计数据、统计报表及重要实时数据
 */
class Dashboard extends Backend
{


    /**
     * 统计每个员工每个月
     * @return mixed
     */
    private function calByMonth()
    {
//        $fields = "count(b.id) as total_case_no,
//        count(if(b.handle_status=1,true,null)) as total_success_case_no,
//        COALESCE(sum(`money`),0) as total_case_money,a.username as staff_name";
//        $where['staff_id'] = ['neq', 0];
//
//        $data = db('staff')
//            ->alias('a')
//            ->field($fields)
//            ->join("user_case b", 'a.id=b.staff_id', 'left')
//            ->group("a.id")
//            ->order(['b.id' => 'desc'])
//            ->select();
//
        $staffs  = db('staff')->field('id,username as staff_name')->order(['id' => 'desc'])
            ->select();


        if(is_array($staffs))
        {
            foreach($staffs as $k=>$v)
            {
                $fields = "count(b.id) as total_case_no,
        count(if(b.handle_status=1,true,null)) as total_success_case_no,
        COALESCE(sum(`money`),0) as total_case_money";
                $where['staff_id'] = ['eq', $v['id']];
                $row =  db('user_case')->alias('b')->field($fields)->where($where)->find();
                $staffs[$k]['total_case_no']  =  $row['total_case_no'];
                $staffs[$k]['total_success_case_no']  =  $row['total_success_case_no'];
                $staffs[$k]['total_case_money']  =  $row['total_case_money'];
                unset($staffs[$k]['id']);
            }

        }

        return $staffs;

    }


    /**
     * 平台这一年的赚钱总计
     *
     */
    private function calYearmoneys()
    {
        $year = date('Y');

        $sql = "select month(FROM_UNIXTIME(create_time)) as monthes,COALESCE (sum(`money`),0) as monthes_money from fa_user_case where year(FROM_UNIXTIME(create_time)) = {$year} group by month(FROM_UNIXTIME(create_time))";
        $data = db()->query($sql);
        $data = array_column($data, null, 'monthes');

        $monthArr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
        $moneys = [];
        foreach ($monthArr as $k => $v) {
            $is_set = isset($data[$v]) ? true : false;
            $moneys[] = $is_set ? $data[$v]['monthes_money'] : 0;
            $monthArr[$k] =$v.'月';

        }
        //dd($moneys);
       return [$monthArr,$moneys];
    }


    /**
     * 查看
     */
    public function index()
    {
        $seventtime = \fast\Date::unixtime('day', -7);
        $paylist = $createlist = [];
        for ($i = 0; $i < 7; $i++) {
            $day = date("Y-m-d", $seventtime + ($i * 86400));
            $createlist[$day] = mt_rand(20, 200);
            $paylist[$day] = mt_rand(1, mt_rand(1, $createlist[$day]));
        }
        $hooks = config('addons.hooks');
        $uploadmode = isset($hooks['upload_config_init']) && $hooks['upload_config_init'] ? implode(',', $hooks['upload_config_init']) : 'local';
        $addonComposerCfg = ROOT_PATH . '/vendor/karsonzhang/fastadmin-addons/composer.json';
        Config::parse($addonComposerCfg, "json", "composer");
        $config = Config::get("composer");
        $addonVersion = isset($config['version']) ? $config['version'] : __('Unknown');

        //总会员数也就是雇主数量
        $totaluser = db('user')->count();
        //案件总数
        $totalviews = db('user_case')->count();
        //进行中案件数量
        $totalorder = db('user_case')->where(['handle_status' => 0])->count();
        //胜诉
        $successorder = db('user_case')->where(['handle_status' => 1])->count();
        //败诉
        $failorder = db('user_case')->where(['handle_status' => 2])->count();
        //案件总金额
        $totalorderamount = db('user_case')->where(['push_status' => 1])->sum('money');

        //所有员工统计数据
        $cals = $this->calByMonth();
        $staff = $total_case_no = $total_success_case_no = $total_case_money = $success_percent = [];
        foreach ($cals as $k => $v) {
            $staff[] = $v['staff_name'];
            $total_case_no[] = $v['total_case_no'];
            $total_success_case_no[] = $v['total_success_case_no'];
            $total_case_money[] = $v['total_case_money'];
            //百分比
            $percent = ($v['total_success_case_no'] == 0) ? 0 :
                round(100 * $v['total_success_case_no'] / $v['total_case_no'], 2);
            $success_percent[] = $percent;

        }

        ///平台每月赚钱统计
       list($months,$moneys) =  $this->calYearmoneys();


        //赋值统计数据
        $this->view->assign([
            'calStaff' => $staff,
            'total_case_no' => $total_case_no,
            'total_success_case_no' => $total_success_case_no,
            'success_percent' => $success_percent,
            'total_case_money' => $total_case_money,
            'months' => $months,
            'moneys' => $moneys,
        ]);


        //统计
        $this->view->assign([
            'totaluser' => $totaluser,
            'totalviews' => $totalviews,
            'todayorder' => $totalorder,
            'successorder' => $successorder,
            'failorder' => $failorder,
            'totalorderamount' => $totalorderamount,
            'todayuserlogin' => 321,
            'todayusersignup' => 430,

            'unsettleorder' => 132,
            'sevendnu' => '80%',
            'sevendau' => '32%',
            'paylist' => $paylist,
            'createlist' => $createlist,
            'addonversion' => $addonVersion,
            'uploadmode' => $uploadmode
        ]);


        return $this->view->fetch();
    }

}
