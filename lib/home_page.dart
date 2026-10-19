import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  bool isGridView = true;
  int sharedViews = 20;

  void updateSearch(String value) {
    setState(() {
      query = value;
    });
  }

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  void decreaseViews() {
    setState(() {
      sharedViews--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchText = query.trim().toLowerCase();

    final filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(searchText) ||
          movie.genre.toLowerCase().contains(searchText);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Library',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            tooltip: isGridView ? 'Switch to list view' : 'Switch to grid view',
            onPressed: toggleView,
            icon: Icon(
              isGridView ? Icons.view_list_rounded : Icons.grid_view_rounded,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: TextField(
              onChanged: updateSearch,
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(child: Text('No movies found'))
                : isGridView
                ? GridView.builder(
                    itemCount: filteredMovies.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // Keep grid cards compact on desktop while preserving portrait cards on phones.
                      childAspectRatio: MediaQuery.of(context).size.width > 700
                          ? 1.3
                          : 0.60,
                    ),
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movie: filteredMovies[index],
                        sharedViews: sharedViews,
                        onViewsTap: decreaseViews,
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: filteredMovies.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 190,
                        child: MovieCard(
                          movie: filteredMovies[index],
                          sharedViews: sharedViews,
                          onViewsTap: decreaseViews,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
