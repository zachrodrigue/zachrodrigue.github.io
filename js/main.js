document.addEventListener('DOMContentLoaded', function() {
    // Theme toggle functionality
    const themeToggle = document.getElementById('themeToggle');
    const htmlElement = document.documentElement;

    // Force dark theme and disable toggle
    htmlElement.setAttribute('data-bs-theme', 'dark');
    if (themeToggle) {
        themeToggle.style.display = 'none';
    }

    // Navbar scroll effect (optimized with requestAnimationFrame)
    const navbar = document.querySelector('.navbar');
    let lastScrollY = window.scrollY;
    let ticking = false;
    function onScroll() {
        lastScrollY = window.scrollY;
        if (!ticking) {
            window.requestAnimationFrame(() => {
                if (lastScrollY > 50) {
                    navbar.classList.add('scrolled');
                } else {
                    navbar.classList.remove('scrolled');
                }
                ticking = false;
            });
            ticking = true;
        }
    }
    window.addEventListener('scroll', onScroll, { passive: true });

    // Smooth scrolling for anchor links (event delegation)
    document.body.addEventListener('click', function(e) {
        const anchor = e.target.closest('a[href^="#"]');
        if (!anchor) return;
        const targetId = anchor.getAttribute('href');
        if (targetId === '#' || !document.querySelector(targetId)) return;
        e.preventDefault();
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
            window.scrollTo({
                top: targetElement.offsetTop - 70,
                behavior: 'smooth'
            });
            // Close mobile menu if open
            const navbarToggler = document.querySelector('.navbar-toggler');
            const navbarCollapse = document.querySelector('.navbar-collapse');
            if (navbarCollapse && navbarCollapse.classList.contains('show')) {
                navbarToggler.click();
            }
        }
    });

    // Animate skill bars on scroll (IntersectionObserver, only once)
    const skillBars = document.querySelectorAll('.progress-bar');
    let skillBarsAnimated = false;
    function animateSkillBars() {
        if (skillBarsAnimated) return;
        skillBars.forEach(bar => {
            const width = bar.style.width;
            bar.style.width = '0';
            setTimeout(() => {
                bar.style.width = width;
            }, 100);
        });
        skillBarsAnimated = true;
    }
    const observer = new IntersectionObserver((entries, obs) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                if (entry.target.classList.contains('progress-bar')) {
                    animateSkillBars();
                }
                entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                obs.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });
    document.querySelectorAll('.skill-card, .project-card, .stat-card').forEach(el => {
        observer.observe(el);
    });

    // Add pulse animation to primary CTA button
    const hireMeBtn = document.querySelector('.btn-primary[href="#contact"]');
    if (hireMeBtn) {
        hireMeBtn.classList.add('pulse');
    }

    // --- Begin: Projects page specific JS (reworked filtering & pagination) ---
    if (window.location.pathname.endsWith('projects.html')) {
        if (window.lightGallery) {
            [
                'furniture-main',
                'bellabeat-main',
                'cyclistic-main',
                'mintclassics-main',
                'wittig-main',
                'sales-performance-main',
                'hotel-revenue-main', // Uncomment when project is live
            ].forEach(id => {
                const el = document.getElementById(id);
                if (el) lightGallery(el, { plugins: [lgZoom], speed: 400, selector: 'a' });
            });
            [
                'furniture-thumbs',
                'bellabeat-thumbs',
                'cyclistic-thumbs',
                'mintclassics-thumbs',
                'wittig-thumbs',
                'sales-performance-thumbs',
                'hotel-revenue-thumbs', // Uncomment when project is live
            ].forEach(id => {
                const el = document.getElementById(id);
                if (el) lightGallery(el, { plugins: [lgZoom], speed: 400 });
            });
        }
    }
    // --- End: Projects page specific JS ---

    // Contact form submission (minimal DOM access)
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            const formData = new FormData(contactForm);
            const response = await fetch(contactForm.action, {
                method: 'POST',
                body: formData,
                headers: { 'Accept': 'application/json' }
            });
            if (response.ok) {
                showCustomThankYou();
                contactForm.reset();
            } else {
                alert('Sorry, there was an error sending your message. Please try again later.');
            }
        });

        function showCustomThankYou() {
            const msg = document.createElement('div');
            msg.className = 'alert alert-success mt-3';
            msg.innerText = 'Thank you for your message! I will get back to you soon.';
            contactForm.parentNode.insertBefore(msg, contactForm);
            setTimeout(() => msg.remove(), 6000);
        }
    }

});

// Add event listener for window resize to handle responsive adjustments
window.addEventListener('resize', function() {
    document.querySelectorAll('.project-images').forEach(container => {
        const mainImage = container.querySelector('.main-image img');
        const thumbnails = container.querySelectorAll('.thumbnail-images img');
        if (mainImage) {
            const aspectRatio = mainImage.naturalWidth / mainImage.naturalHeight;
            if (window.innerWidth / window.innerHeight > aspectRatio) {
                // Window is wider than image
                mainImage.style.width = '100%';
                mainImage.style.height = 'auto';
            } else {
                // Window is taller than image
                mainImage.style.width = 'auto';
                mainImage.style.height = '100%';
            }
        }
    });
});
