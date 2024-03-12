<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory;
    
    // Mass assignment protection
    protected $fillable =['title','description','status','due_date'];
    
    /**
     * Get the task title
     *
     * @param  string  $value
     * @return string
     */
    public function getTitleAttribute($value)
    {
        return ucfirst($value);
    }

    /**
     * Set the task title
     *
     * @param  string  $value
     * @return void
     */
    public function setTitleAttribute($value)
    {
        $this->attributes['title'] = strtolower($value);
    }

    /**
     * Get the task description
     *
     * @param  string  $value
     * @return string
     */
    public function getDescriptionAttribute($value)
    {
        return ucfirst($value);
    }

    /**
     * Set the task description
     *
     * @param  string  $value
     * @return void
     */
    public function setDescriptionAttribute($value)
    {
        $this->attributes['description'] = strtolower($value);
    }
    
    /**
     * Get the task due date
     *
     * @param  string  $value
     * @return string
     */
    public function getDueDateAttribute($value)
    {
        return ucfirst($value);
    }

    /**
     * Set the task due date
     *
     * @param  string  $value
     * @return void
     */
    public function setDueDateAttribute($value)
    {   
        $carbonDate = Carbon::parse($value)->format('Y-m-d');
        $this->attributes['due_date'] = $carbonDate;
    } 
}
