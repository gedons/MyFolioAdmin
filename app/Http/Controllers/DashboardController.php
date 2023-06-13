<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\DashboardResource;
use App\Http\Resources\BlogDashboardResource;
use App\Http\Resources\BlogResource;
use App\Models\Project;
use App\Models\Blog;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();


        // Total Number of Projects
        $total = Project::query()->where('user_id', $user->id)->count();
        // Total Number of Projects
        $totalProjects = Project::count();

        // Total Number of Projects for the User
        $userProjects = Project::where('user_id', $user->id)->count();

        // Calculate Percentage
        $percentage = ($userProjects / $totalProjects) * 100;

        // Latest Project
        $latest = Project::query()->where('user_id', $user->id)->latest('created_at')->first();

        // Latest 5 post
            $latestPosts = Blog::query()
            ->where('user_id', $user->id)
            ->latest('created_at')
            ->take(5)
            ->select('id', 'user_id', 'slug', 'title', 'url', 'created_at')
            ->get();       

            $latestPostsResource = $latestPosts->isEmpty()
            ? null
            : BlogDashboardResource::collection($latestPosts);
          
        // post count
        $totalP = Blog::count();
          

        return [
            'totalProjects' => $total,
            'totalPercentage' => $percentage,
            'latestProject' => $latest ? new DashboardResource($latest) : null,
            'latestPosts' => $latestPostsResource,
            'totalPosts' => $totalP
        ];
    }
}
