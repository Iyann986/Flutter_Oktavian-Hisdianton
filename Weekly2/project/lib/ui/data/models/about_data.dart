class AboutData {
  const AboutData({
    required this.title,
    required this.image,
    required this.projects,
  });

  final String? title;
  final String? image;
  final int? projects;
}

List<AboutData> items = [
  const AboutData(
    title: 'Video Editing',
    image: 'assets/adobe_premiere.png',
    projects: 10,
  ),
  const AboutData(
    title: 'Image Editing',
    image: 'assets/adobe_lightroom.png',
    projects: 20,
  ),
  const AboutData(
    title: 'Graphic Design',
    image: 'assets/adobe_xd.png',
    projects: 5,
  ),
  const AboutData(
    title: 'UI Design',
    image: 'assets/figma.png',
    projects: 5,
  ),
];
