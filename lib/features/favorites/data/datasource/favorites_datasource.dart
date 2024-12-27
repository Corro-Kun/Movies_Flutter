import 'package:movies_movil/features/favorites/data/models/favorites_data.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDatasource {
  Future<Database> OpenDB() async {
    final Future<Database> database = openDatabase(
      "C0rr0K4n.db",
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE movie(id INTEGER PRIMARY KEY, title TEXT, original_title TEXT, overview TEXT, poster_path TEXT, backdrop_path TEXT, release_date TEXT, vote_average REAL)",
        );
      },
      version: 1,
    );

    return database;
  }

  Future<void> insertMovie(FavoritesData movie) async {
    final Database db = await OpenDB();
    await db.insert(
      'movie',
      {
        'id': movie.id,
        'title': movie.title,
        'original_title': movie.original_title,
        'overview': movie.overview,
        'poster_path': movie.poster_path,
        'backdrop_path': movie.backdrop_path,
        'release_date': movie.release_date,
        'vote_average': movie.vote_average,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getMovies() async {
    final Database db = await OpenDB();
    final List<Map<String, dynamic>> maps = await db.query('movie');
    return maps;
  }

  Future<FavoritesData> getMovie(int id) async {
    final Database db = await OpenDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'movie',
      where: "id = ?",
      whereArgs: [id],
    );
    return FavoritesData.fromMap(maps.first);
  }

  Future<bool> isFavorite(int id) async {
    final Database db = await OpenDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'movie',
      where: "id = ?",
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }

  Future<void> deleteMovie(int id) async {
    final Database db = await OpenDB();
    await db.delete(
      'movie',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
