@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            @include('includes.message')

            @foreach ($images as $image)
                @if ($image->user->image)
                
                    <div class="card pub-image">
                        <div class="card-header">
                            123
                            <div class="container-avatar">
                                <img src="{{ url('/user/avatar',['filename'=>$image->user->image]) }}" alt="avatar" class="avatar">
                            </div>
                            
                            <div class="data-user">
                                {{ $image->user->name.' '.$image->user->surname.' | ' }}
                                <span class="nickname">{{ $image->user->nick }}</span>
                            </div>

                        </div>
                        <div class="card-body">

                            <div class="image-container">
                                    <img src="{{ route('image.file', ['filename' => $image->image_path]) }}" alt="imagen del usuario">
                            </div>
                            <div class="likes">

                            </div>
                            <div class="description">
                                <span class="nickname">{{ $image->user->nick }}</span>
                                <p>{{ $image->DESCRIPTION }}</p>
                            </div>
                            
                        </div>
                    </div>

                    @endif
            @endforeach
            <div class="clearfix"></div>
            {{ $images->links() }}
        </div>
    </div>
</div>
@endsection
