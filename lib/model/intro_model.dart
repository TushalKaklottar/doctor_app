class Intro {

  final String images, tittle , description;

      Intro({
  required this.images,
  required this.tittle,
  required this.description,
});

  final List<Intro> demoData = [

  Intro(
     images: "assets/images/",
    tittle: 'Clinic Consultation',
    description: 'Skip waiting time and schedule your clinic appointment in seconds.',
),
    Intro(
     images: "assets/images/",
    tittle: 'Video Consultation',
    description: 'Video call with our best doctors with video consultation.',
),
    Intro(
     images: "assets/images/",
    tittle: 'Nearest Clinics',
    description: 'Book Appointment with doctors available near you.',
),
];
}