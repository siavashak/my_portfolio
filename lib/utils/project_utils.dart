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
];

List<ProjectUtils> hobbyProjects = [
  ProjectUtils(
      image: "assets/projects/HackAirbnb.png",
      title: "Hack Airbnb",
      subtitle: "A Chrome Extension for Advanced Airbnb Search",
      webLink: "https://www.youtube.com/watch?v=HGyfS9g3qUM",
      androidLink:
          "https://chromewebstore.google.com/detail/hack-airbnb/pgfapcopccjcmbbdmhoneiggnggfcelg"),
  ProjectUtils(
      image: "assets/projects/cockroach.png",
      title: "Restaurants Naughty List",
      subtitle: "Recent Health Inspection Reports by SNHD",
      webLink: "https://restaurants.nevadawebsolutions.com/"),
];
