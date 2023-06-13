<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BlogDashboardResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,            
            'title' => $this->title,
            'slug' => $this->slug,
            'url' => $this->url,
            // 'status' => !!$this->status,
            'created_at' => (new \DateTime($this->created_at))->format('Y-m-d H:i:s'),
            
        ];

    }
}
