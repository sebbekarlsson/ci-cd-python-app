from flask import Blueprint, render_template, request, redirect
from pyapp.db import create_wallpost, get_all_wallposts


bp = Blueprint(__name__, __name__, template_folder='templates')


@bp.route('/wall', methods=['POST', 'GET'])
def show():
    if request.method == 'POST':
        post = create_wallpost(text=request.form.get('post_text'))

        return redirect('/wall')

    return render_template('wall.html', posts=get_all_wallposts())
