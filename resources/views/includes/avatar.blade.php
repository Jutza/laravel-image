@if(Auth::user()->image)
<div class="container-avatar">
    <img src="{{ url('/user/avatar',['filename'=>Auth::user()->image]) }}" alt="avatar" class="avatar">
</div>
@endif