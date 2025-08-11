import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_strings.dart';
import '../../main.dart'; // For AppRoutes

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  void _nextPage() {
    if (_currentIndex < AppStrings.onboardingSlides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final slides = AppStrings.onboardingSlides;
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.height < 700;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // PageView with full-screen images
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                final slide = slides[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    Image.asset(
                      slide['image']!,
                      fit: BoxFit.cover,
                    ),

                    // Dark overlay for better text visibility
                    Container(
                      color: Colors.black,
                    ),

                    // Title in the middle
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Text(
                          slide['title']!,
                          style: TextStyle(
                            fontSize: isSmallScreen ? 20 : 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    // Description at the bottom
                    Positioned(
                      bottom: 120,
                      left: 16,
                      right: 16,
                      child: Text(
                        slide['desc']!,
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),

            // Dots Indicator
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  slides.length,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 12 : 8,
                    height: _currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            // Arrow / Welcome button
            Positioned(
              bottom: 16,
              right: 16,
              child: _currentIndex == slides.length - 1
                  ? ElevatedButton(
                onPressed: _finishOnboarding,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 16 : 24,
                    vertical: isSmallScreen ? 10 : 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Welcome to Rewriter',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    color: Colors.white,
                  ),
                ),
              )
                  : ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(isSmallScreen ? 14 : 18),
                  backgroundColor: Colors.blue,
                ),
                child: const Icon(Icons.arrow_forward,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
