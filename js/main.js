document.addEventListener('DOMContentLoaded', function() {
    // Theme toggle functionality
    const themeToggle = document.getElementById('themeToggle');
    const htmlElement = document.documentElement;

    // Theme preference
    const savedTheme = localStorage.getItem('theme') ||
        (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    htmlElement.setAttribute('data-bs-theme', savedTheme);
    updateThemeIcon(savedTheme);

    themeToggle.addEventListener('click', function() {
        const currentTheme = htmlElement.getAttribute('data-bs-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        htmlElement.setAttribute('data-bs-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        updateThemeIcon(newTheme);
    });

    function updateThemeIcon(theme) {
        const icon = themeToggle.querySelector('i');
        if (theme === 'dark') {
            icon.classList.remove('fa-moon');
            icon.classList.add('fa-sun');
        } else {
            icon.classList.remove('fa-sun');
            icon.classList.add('fa-moon');
        }
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

    // Project filtering (optimized)
    const filterButtons = document.querySelectorAll('.project-filters button');
    const projects = document.querySelectorAll('.project-detail');
    let filterTimeout;
    filterButtons.forEach(button => {
        button.addEventListener('click', () => {
            filterButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            const filter = button.dataset.filter;
            clearTimeout(filterTimeout);
            filterTimeout = setTimeout(() => {
                projects.forEach(project => {
                    if (filter === 'all' || project.dataset.categories.includes(filter)) {
                        project.style.opacity = '0';
                        setTimeout(() => {
                            project.style.display = 'block';
                            setTimeout(() => {
                                project.style.opacity = '1';
                            }, 50);
                        }, 100);
                    } else {
                        project.style.opacity = '0';
                        setTimeout(() => {
                            project.style.display = 'none';
                        }, 100);
                    }
                });
            }, 0);
        });
    });

    // Tech tag filtering (optimized)
    const techTags = document.querySelectorAll('.clickable-tech-tag');
    techTags.forEach(tag => {
        tag.addEventListener('click', () => {
            const tech = tag.dataset.tech;
            filterButtons.forEach(btn => btn.classList.remove('active'));
            const btn = document.querySelector(`.project-filters button[data-filter="${tech}"]`);
            if (btn) btn.classList.add('active');
            clearTimeout(filterTimeout);
            filterTimeout = setTimeout(() => {
                projects.forEach(project => {
                    if (project.dataset.categories.includes(tech)) {
                        project.style.opacity = '0';
                        setTimeout(() => {
                            project.style.display = 'block';
                            setTimeout(() => {
                                project.style.opacity = '1';
                            }, 50);
                        }, 100);
                    } else {
                        project.style.opacity = '0';
                        setTimeout(() => {
                            project.style.display = 'none';
                        }, 100);
                    }
                });
            }, 0);
        });
    });

    // Back to top button (reuse existing element if present)
    let backToTop = document.querySelector('.back-to-top');
    if (!backToTop) {
        backToTop = document.createElement('a');
        backToTop.href = '#';
        backToTop.className = 'back-to-top';
        backToTop.innerHTML = '<i class="fas fa-arrow-up"></i>';
        backToTop.title = 'Back to Top';
        document.body.appendChild(backToTop);
    }
    function toggleBackToTop() {
        if (window.scrollY > 300) {
            backToTop.style.display = 'flex';
        } else {
            backToTop.style.display = 'none';
        }
    }
    window.addEventListener('scroll', toggleBackToTop, { passive: true });
    backToTop.addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });

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

    // REMOVE this block: Project image gallery functionality (event delegation)
    // document.querySelectorAll('.thumbnail-images').forEach(container => {
    //     container.addEventListener('click', function(e) {
    //         const img = e.target.closest('img');
    //         if (!img) return;
    //         const mainImage = container.closest('.project-images').querySelector('.main-image img');
    //         if (mainImage && img.src !== mainImage.src) {
    //             const tempSrc = mainImage.src;
    //             mainImage.src = img.src;
    //             img.src = tempSrc;
    //         }
    //     });
    // });
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
