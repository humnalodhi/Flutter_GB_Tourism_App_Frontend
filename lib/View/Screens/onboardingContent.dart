class OnboardingContent {
  String title;
  String description;
  String image;

  OnboardingContent({required this.title, required this.description, required this.image});
}
List contents = [
     OnboardingContent(
      title: 'Unforgetable Experience',
      description:  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      image: "lib/assets/Welcome-1.JPG",
    ),
    OnboardingContent(
        title: 'Unforgetable Experience',
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        image: "lib/assets/Welcome-2.JPG",
    ),
    OnboardingContent(
        title: 'Unforgetable Experience',
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      image: "lib/assets/Welcome-3.JPG",
    ),
  ];
