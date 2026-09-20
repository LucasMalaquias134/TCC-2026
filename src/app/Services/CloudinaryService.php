<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class CloudinaryService
{
    public function uploadImage($file, $folder = 'perfis')
    {
        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $timestamp = time();
        
        $stringToSign = "folder={$folder}&timestamp={$timestamp}" . env('CLOUDINARY_API_SECRET');
        $signature = sha1($stringToSign);

        $response = Http::attach(
            'file', file_get_contents($file->getRealPath()), $file->getClientOriginalName()
        )->post("https://api.cloudinary.com/v1_1/{$cloudName}/image/upload", [
            'api_key'   => env('CLOUDINARY_API_KEY'),
            'timestamp' => $timestamp,
            'signature' => $signature,
            'folder'    => $folder,
        ]);

        //dd($response->json());

        if ($response->successful()) {
            return $response->json('secure_url'); 
        }

        return null; 
    }

    public function deleteImage($imageUrl)
    {
        if (!$imageUrl) return;

        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $timestamp = time();

        $parts = explode('/upload/', $imageUrl);
        if (count($parts) < 2) return;
        
        $pathWithoutVersion = preg_replace('/^v\d+\//', '', $parts[1]); 
        $publicId = pathinfo($pathWithoutVersion, PATHINFO_DIRNAME) . '/' . pathinfo($pathWithoutVersion, PATHINFO_FILENAME);

        $stringToSign = "public_id={$publicId}&timestamp={$timestamp}" . env('CLOUDINARY_API_SECRET');
        $signature = sha1($stringToSign);

        Http::asForm()->post("https://api.cloudinary.com/v1_1/{$cloudName}/image/destroy", [
            'public_id' => $publicId,
            'api_key'   => env('CLOUDINARY_API_KEY'),
            'timestamp' => $timestamp,
            'signature' => $signature,
        ]);
    }
}