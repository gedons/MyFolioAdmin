<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Http\Requests\StoreBlogRequest;
use App\Http\Requests\UpdateBlogRequest;
use App\Http\Resources\BlogResource;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class BlogController extends Controller
{
    
    public function index(Request $request)
    {
        $user = $request->user();
        return BlogResource::collection(Blog::where('user_id', $user->id)->orderBy('created_at', 'DESC')->paginate(3));
    }

   
    public function store(StoreBlogRequest $request)
    {
        $data = $request->validated();

        //Check if image was given and save on local file system
        if (isset($data['image'])) {
            $relativePath  = $this->saveImage($data['image']);
            $data['image'] = $relativePath;
        }

        $blog = Blog::create($data);

        return new BlogResource($blog);
    }


    public function show(Blog $blog, Request $request)
    {
        $user = $request->user();
        if ($user->id !== $blog->user_id) {
            return abort(403, 'Unauthorized action.');
        }

        return new BlogResource($blog);
    }


    public function update(UpdateBlogRequest $request, Blog $blog)
    {
        $data = $request->validated();

        // Check if image was given and save on local file system
        if (isset($data['image'])) {
            $relativePath = $this->saveImage($data['image']);
            $data['image'] = $relativePath;

            //If there is an old image, delete it
            if ($blog->image) {
                $absolutePath = public_path($blog->image);
                File::delete($absolutePath);
            }
        }

        // Update blog post in the database
        $blog->update($data);

        return new BlogResource($blog);
    }

  
    public function destroy(Blog $blog, Request $request)
    {
        $user = $request->user();
        if ($user->id !== $blog->user_id) {
            return abort(403, 'Unauthorized action.');
        }

        $blog->delete();

        // If there is an old image, delete it
        if ($blog->image) {
            $absolutePath = public_path($blog->image);
            File::delete($absolutePath);
        }

        return response('', 204);
    }

    private function saveImage($image)
    {
        // Check if image is valid base64 string
        if (preg_match('/^data:image\/(\w+);base64,/', $image, $type)) {
            // Take out the base64 encoded text without mime type
            $image = substr($image, strpos($image, ',') + 1);
            // Get file extension
            $type = strtolower($type[1]); // jpg, png, gif

            // Check if file is an image
            if (!in_array($type, ['jpg', 'jpeg', 'gif', 'png'])) {
                throw new \Exception('invalid image type');
            }
            $image = str_replace(' ', '+', $image);
            $image = base64_decode($image);

            if ($image === false) {
                throw new \Exception('base64_decode failed');
            }
        } else {
            throw new \Exception('did not match data URI with image data');
        }

        $dir = 'images/blogpost/';
        $file = Str::random() . '.' . $type;
        $absolutePath = public_path($dir);
        $relativePath = $dir . $file;
        if (!File::exists($absolutePath)) {
            File::makeDirectory($absolutePath, 0755, true);
        }
        file_put_contents($relativePath, $image);

        return $relativePath;
    }

    //Front View Functions
    // public function FrontShowBlog()
    // {
    //     $posts = BlogResource::collection(Blog::orderBy('created_at', 'DESC')->get());
    //     return $posts;
    // }

}
