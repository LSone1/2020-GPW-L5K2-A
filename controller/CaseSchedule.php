<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use think\Db;

/**
 * 员工工作时间安排表针对于每个事件
 *
 * @icon fa fa-circle-o
 */
class CaseSchedule extends Backend
{
    
    /**
     * CaseSchedule模型对象
     * @var \app\admin\model\CaseSchedule
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\CaseSchedule;

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
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->where(['case_id'=>input('case_id')])
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->where($where)
                ->where(['case_id'=>input('case_id')])
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $list = collection($list)->toArray();
            foreach($list as $k=>$v)
            {
               //案件
                $list[$k]['case_id'] =  db('user_case')->where(['id'=>$v['case_id']])->value('case_name');
                $list[$k]['staff_id'] =  db('staff')->where(['id'=>$v['staff_id']])->value('username');



                //分配员工
                $list[$k]['woker_hours'] = $list[$k]['woker_hours'].'h';
            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 修改本案工作时长
     */
    protected function  changeCaseHour($case_id)
    {

        $hours =  $this->model->where(['case_id'=>$case_id])->sum('woker_hours');
        db('user_case')->where(['id'=>$case_id])->setField('woker_hourse',$hours);
    }



    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $params = $this->request->post("row/a");
            $caseId   = input('case_id');
            $case  = db('user_case')->where(['id'=>$caseId])->find();
            if(empty($case))
            {
                $this->error(__('Case is not exists!!!'));
            }

            if ($params) {
                $params = $this->preExcludeFields($params);

                if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                    $params[$this->dataLimitField] = $this->auth->id;
                }
                $result = false;
                Db::startTrans();
                try {
                    //是否采用模型验证
                    if ($this->modelValidate) {
                        $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                        $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                        $this->model->validateFailException(true)->validate($validate);
                    }

                    $params['staff_id']=  $case['staff_id'];
                    $params['case_id']= $caseId;
                    $params['woker_start_time']  =strtotime($params['woker_start_time']);
                    $params['woker_end_time']  =strtotime($params['woker_end_time']);
                    if($params['woker_start_time']>=$params['woker_end_time'])
                    {
                        $this->error(__('Woker_start_time must less than woker_end_time'));

                    }
                    $params['create_time']  =time();
                    $params['woker_hours']  =round(($params['woker_end_time']-$params['woker_start_time'])/3600,2);


                    $result = $this->model->allowField(true)->save($params);

                    $this->changeCaseHour($caseId);

                    Db::commit();
                } catch (ValidateException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (PDOException $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                } catch (Exception $e) {
                    Db::rollback();
                    $this->error($e->getMessage());
                }
                if ($result !== false) {
                    $this->success();
                } else {
                    $this->error(__('No rows were inserted'));
                }
            }
            $this->error(__('Parameter %s can not be empty', ''));
        }
        return $this->view->fetch();
    }
    

}
