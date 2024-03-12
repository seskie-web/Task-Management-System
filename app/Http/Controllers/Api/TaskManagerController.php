<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\Task;
use Illuminate\Http\Request;
use App\Http\Requests\TaskRequest;
use App\Http\Controllers\Controller;
use App\Http\Resources\TaskResource;


class TaskManagerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tasks = Task::all();
        // return all data or []
        return TaskResource::collection($tasks);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(TaskRequest $request)
    {   
        $task = Task::create($request->all());
        if($task){   
            return response()->json(['msg' => 'Task created successfully', 'status' => 1], 201);
        }

        return response()->json(['msg' => 'Task not found', 'status' => 0], 404);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {   
        if (!ctype_digit($id)) {
            return response()->json(['error' => 'Id must be an integer, string given'], 400);
        }
        $task = Task::find($id);
        if($task) {
            return new TaskResource($task);
        }
        return response()->json(['error' => 'Task not found'], 404);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(TaskRequest $request, $id)
    {   
        if (!ctype_digit($id)) {
            return response()->json(['msg' => 'Id must be an integer, string given', 'status' => 0], 400);
        }
        $task = Task::find($id);
        if($task) {
            $task->update($request->all());
            return response()->json(['msg' => 'Task updated successfully', 'status' => 1], 201);
        }
        return response()->json(['msg' => 'Task not found'], 404);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!ctype_digit($id)) {
            return response()->json(['msg' => "Id must be an integer, string given #({$id})", 'status' => 0], 400);
        }
    
        $task = Task::find($id);
        if($task){
            $task->delete();
            return response()->json(['msg' => 'Task deleted successfully', 'status' => 1], 201);
        }
        return response()->json(['msg' => "Task #({$id}) not found", 'status' => 0], 404);
    }
}
