<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 客户提交法律事件表  
 *
 * @icon fa fa-circle-o
 */
class UserCase extends Backend
{
    
    /**
     * UserCase模型对象
     * @var \app\admin\model\UserCase
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\UserCase;
        $this->assign('staffs',$this->staffs());

    }


    public function staffs()
    {
        return db('staff')->order(['id'=>'desc'])->select();
    }

    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 查看
     */
    public function index()
    {

        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {

            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            //如果是员工员工只看自己的案子
            $map =[];
            if(checkIsstaff())
            {
                $map['staff_id'] =session('staff_id');
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->where($map)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($where)
                ->where($map)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = collection($list)->toArray();

            foreach($list as $k=>$v)
            {

                //案件客户
                $list[$k]['uid'] =  db('user')->where(['id'=>$v['uid']])->value('username');
                //分配员工
                $list[$k]['staff_id'] =  db('staff')->where(['id'=>$v['staff_id']])->value('username');
                //状态
                $push_status_msg= ['To be allocated','Assigned ','No tickets '];
                $list[$k]['push_status'] =  $push_status_msg[$v['push_status']];
                $list[$k]['woker_hourse'] = $v['woker_hourse'].'h';
                //处理状态
                $handle_status_msg= ['have in hand','Arrive','canceled'];
                $list[$k]['handle_status'] =  $handle_status_msg[$v['handle_status']];



            }

            //dd($list);
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }





}
