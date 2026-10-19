class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

const List<Movie> movies = [
  Movie(
    title: 'Inception',
    genre: 'Sci-Fi · Action',
    year: 2010,
    rating: 8.8,
    image: 'assets/posters/inception.jpg',
  ),
  Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi · Drama',
    year: 2014,
    rating: 8.7,
    image: 'assets/posters/interstellar.jpg',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action · Crime',
    year: 2008,
    rating: 9.0,
    image: 'assets/posters/dark_knight.jpg',
  ),
  Movie(
    title: 'Parasite',
    genre: 'Thriller · Drama',
    year: 2019,
    rating: 8.5,
    image: 'assets/posters/parasite.jpg',
  ),
  Movie(
    title: 'Spirited Away',
    genre: 'Animation · Fantasy',
    year: 2001,
    rating: 8.6,
    image: 'assets/posters/spirited_away.jpg',
  ),
  Movie(
    title: 'The Grand Budapest Hotel',
    genre: 'Comedy · Adventure',
    year: 2014,
    rating: 8.1,
    image: 'assets/posters/grand_budapest.jpg',
  ),
  Movie(
    title: 'Mad Max: Fury Road',
    genre: 'Action · Adventure',
    year: 2015,
    rating: 8.1,
    image: 'assets/posters/mad_max.jpg',
  ),
  Movie(
    title: 'La La Land',
    genre: 'Romance · Musical',
    year: 2016,
    rating: 8.0,
    image: 'assets/posters/la_la_land.jpg',
  ),
];
