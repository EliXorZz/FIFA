<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use App\Models\Album;
use App\Models\Article;
use App\Models\Document;
use App\Models\Joueur;
use Illuminate\Http\Request;

class PublicationController extends Controller
{
    public function index()
    {
        return view('publication.index', [
            'album' => Album::with('photo')->get(),
            'article' => Article::with('photo')->get(),
            'blog' => Blog::with('photo')->get(),
            'document' => Document::with('photo')->get()
        ]);
    }

    public function show(Joueur $joueur)
    {
        $joueur->load('articles.photo');

        $articles = $joueur->articles;

        return view('publication.index', ['article' => $articles, 'album' => [], 'blog' => [], 'document' => []]);
    }

    public function showDocument(Document $document)
    {

        return redirect($document->urlpdf);
    }

    public function showBlog(Blog $blog)
    {
        return view('publication.show', [
            'publication' => $blog,
            'photo' =>  $blog->photo()->get()
        ]);
    }

    public function showArticle(Article $article)
    {
        return view('publication.show', [
            'publication' => $article,
            'photo' =>  $article->photo()->get()
        ]);
    }

    public function showAlbum(Album $album)
    {
        return view('publication.show', [
            'publication' => $album,
            'photo' =>  $album->photo()->get(),
            'photos' => $album->allphoto()->get()
        ]);
    }
}
