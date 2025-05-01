class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

List<ProjectUtils> workProjects = [
  ProjectUtils(
      image: "assets/projects/MimRoll.png",
      title: "Mim Roll Kabob",
      subtitle: "Mediterranean International Meal",
      webLink: "https://developer.nevadawebsolutions.com/mimrollkabob.com/",
      androidLink: "https://www.mimrollkabob.com/",
      iosLink: "https://www.mimrollkabob.com/"),
  ProjectUtils(
      image: "assets/projects/BisimKart.png",
      title: "BisimKart",
      subtitle: "Downloadable sim cards (esim) for all travelers.",
      webLink: "https://www.bisimkart.com/",
      androidLink: "https://www.bisimkart.com/",
      iosLink: "https://www.bisimkart.com/"),
];

List<ProjectUtils> hobbyProjects = [
  ProjectUtils(
      image: "assets/projects/HackAirbnb.png",
      title: "Hack Airbnb",
      subtitle: "A Chrome Extension for Advanced Airbnb Search",
      webLink: "https://www.youtube.com/watch?v=HGyfS9g3qUM",
      androidLink: ""),
  ProjectUtils(
      image: "assets/projects/MimRoll.png",
      title: "Mim Roll Kabob",
      subtitle: "Mediterranean International Meal",
      webLink: "https://developer.nevadawebsolutions.com/mimrollkabob.com/"),      
  ProjectUtils(
      image: "assets/projects/BisimKart.png",
      title: "BisimKart",
      subtitle: "Downloadable sim cards (esim) for all travelers.",
      webLink: "https://www.bisimkart.com/"),
];
