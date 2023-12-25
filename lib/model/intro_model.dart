class Intro {

  final String image, title , description;

      Intro({
  required this.image,
  required this.title,
  required this.description,
});
}
final List<Intro> demoData = [
  Intro(
    image: "assets/icon/intro1.png",
    title: "Clinic Consultation",
    description: "Skip waiting time and schedule your clinic appointment in seconds.",
  ),
  Intro(
    image: "assets/icon/intro2.png",
    title: "Video Consultation",
    description: "Video call with our best doctors with video consultation.",
  ),
  Intro(
    image: "assets/icon/intro3.png",
    title: "Nearest Clinics",
    description: "Book Appointment with doctors available near you.",
  ),
];