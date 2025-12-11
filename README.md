# 🎨 Portfolio Frontend - Astro + React

<div align="center">

![Astro](https://img.shields.io/badge/Astro-FF5D01?style=for-the-badge&logo=astro&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)

**Frontend moderno para el portfolio de Enrique Lazo Bello**

[🌐 Demo en Vivo](https://enlabedev.com) • [📦 Backend APIs](#apis) • [🏗️ Arquitectura](#arquitectura)

</div>

---

## 📖 **Descripción**

Frontend del portfolio profesional construido con **Astro** para máxima performance y **React** para componentes interactivos. Consume 3 APIs backend diferentes para mostrar proyectos, blog y funcionalidades de contacto.

### ✨ **Características Principales**

- ⚡ **Astro Static Site Generation** - Páginas ultra-rápidas con HTML estático
- ⚛️ **React Islands** - Interactividad solo donde se necesita
- 🎨 **TailwindCSS** - Diseño responsive y moderno
- 🌙 **Dark/Light Mode** - Toggle de tema con persistencia
- 📱 **Mobile-First** - Optimizado para todos los dispositivos
- 🔍 **SEO Optimizado** - Meta tags, Open Graph, Sitemap
- ♿ **Accesibilidad** - WCAG 2.1 compliant
- 🚀 **Lighthouse 90+** - Performance, SEO y Best Practices

---

## 🏗️ **Arquitectura del Frontend**

```
portfolio-frontend-astro/
├── src/
│   ├── components/          # Componentes reutilizables
│   │   ├── react/           # Componentes React (interactivos)
│   │   │   ├── ContactForm.jsx
│   │   │   ├── ProjectCard.jsx
│   │   │   ├── ThemeToggle.jsx
│   │   │   └── FilterProjects.jsx
│   │   └── astro/           # Componentes Astro (estáticos)
│   │       ├── Header.astro
│   │       ├── Footer.astro
│   │       ├── Hero.astro
│   │       └── StatsSection.astro
│   ├── layouts/             # Layouts de página
│   │   └── Layout.astro
│   ├── pages/               # Rutas del sitio
│   │   ├── index.astro      # Home
│   │   ├── proyectos.astro  # Proyectos
│   │   ├── sobre-mi.astro   # About me
│   │   ├── experiencia.astro
│   │   ├── stack.astro
│   │   ├── blog.astro
│   │   ├── blog/[slug].astro
│   │   ├── contacto.astro
│   │   └── 404.astro
│   ├── styles/              # Estilos globales
│   │   └── global.css
│   ├── utils/               # Helpers
│   │   ├── api.js           # Cliente para APIs backend
│   │   └── constants.js
│   └── env.d.ts             # TypeScript env types
├── public/                  # Assets estáticos
│   ├── images/
│   ├── favicon.svg
│   └── robots.txt
├── astro.config.mjs         # Configuración de Astro
├── tailwind.config.cjs      # Configuración de Tailwind
├── tsconfig.json
├── package.json
└── README.md
```

---

## 🚀 **Quick Start**

### **Pre-requisitos**
```bash
Node.js 18+ 
npm o pnpm
```

### **Instalación**

```bash
# Clonar el repositorio
git clone https://github.com/enlabedev/portfolio-frontend-astro.git
cd portfolio-frontend-astro

# Instalar dependencias
npm install

# Copiar variables de entorno
cp .env.example .env

# Editar .env con las URLs de tus APIs
nano .env
```

### **Variables de Entorno**

Crea un archivo `.env`:

```env
# Backend API URLs
PUBLIC_FASTAPI_URL=http://localhost:8080
PUBLIC_LARAVEL_URL=http://localhost:8081
PUBLIC_DJANGO_URL=http://localhost:8082

# Analytics (opcional)
PUBLIC_GA_TRACKING_ID=G-XXXXXXXXXX

# Site Info
PUBLIC_SITE_URL=https://enlabedev.com
PUBLIC_SITE_TITLE=Enrique Lazo Bello - Senior Software Engineer
```

### **Comandos de Desarrollo**

```bash
# Modo desarrollo (con hot reload)
npm run dev
# Abre http://localhost:4321

# Build para producción
npm run build

# Preview del build
npm run preview

# Lint
npm run lint

# Format con Prettier
npm run format

# Tests E2E con Playwright
npm run test:e2e
```

---

## 🔌 **Integración con APIs Backend**

Este frontend consume 3 APIs backend:

### **1. FastAPI (Conectador)**
```javascript
// src/utils/api.js
export async function sendContactForm(data) {
  const response = await fetch(`${import.meta.env.PUBLIC_FASTAPI_URL}/api/contact`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  });
  return response.json();
}

export async function getStats() {
  const response = await fetch(`${import.meta.env.PUBLIC_FASTAPI_URL}/api/stats`);
  return response.json();
}
```

### **2. Laravel (Gestor de Contenido)**
```javascript
export async function getProjects(filters = {}) {
  const params = new URLSearchParams(filters);
  const response = await fetch(`${import.meta.env.PUBLIC_LARAVEL_URL}/api/projects?${params}`);
  return response.json();
}

export async function getExperience() {
  const response = await fetch(`${import.meta.env.PUBLIC_LARAVEL_URL}/api/experience`);
  return response.json();
}
```

### **3. Django (Blog)**
```javascript
export async function getBlogPosts(page = 1) {
  const response = await fetch(`${import.meta.env.PUBLIC_DJANGO_URL}/api/blog/?page=${page}`);
  return response.json();
}

export async function getBlogPost(slug) {
  const response = await fetch(`${import.meta.env.PUBLIC_DJANGO_URL}/api/blog/${slug}/`);
  return response.json();
}
```

---

## 📄 **Páginas Principales**

| Ruta | Descripción | Tipo |
|------|-------------|------|
| `/` | Home con hero, stats, proyectos destacados | Static |
| `/proyectos` | Grid de todos los proyectos con filtros | Hybrid |
| `/sobre-mi` | Biografía y forma de trabajo | Static |
| `/experiencia` | Timeline de experiencia laboral | Static |
| `/stack` | Tecnologías y nivel de expertise | Static |
| `/blog` | Lista de posts técnicos | Hybrid |
| `/blog/[slug]` | Artículo completo | Dynamic SSG |
| `/contacto` | Formulario de contacto | Hybrid |
| `/404` | Página de error personalizada | Static |

---

## 🎨 **Sistema de Diseño**

### **Colores**
```css
/* tailwind.config.cjs */
colors: {
  primary: {
    50: '#eff6ff',
    500: '#3b82f6',
    900: '#1e3a8a',
  },
  dark: {
    bg: '#0f172a',
    card: '#1e293b',
    text: '#e2e8f0',
  }
}
```


---

## 🧪 **Testing**

### **Tests E2E con Playwright**

```bash
# Instalar Playwright
npx playwright install

# Ejecutar tests
npm run test:e2e

# Ejecutar en modo UI
npm run test:e2e:ui

# Ejecutar solo Chrome
npm run test:e2e -- --project=chromium
```


---

## 🚀 **Deploy a Firebase Hosting**

### **Setup Inicial**

```bash
# Instalar Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Inicializar proyecto
firebase init hosting
```

### **Configuración Firebase**

```json
// firebase.json
{
  "hosting": {
    "public": "dist",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(jpg|jpeg|gif|png|svg|webp)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=31536000"
          }
        ]
      }
    ]
  }
}
```

### **Deploy Manual**

```bash
# Build
npm run build

# Deploy
firebase deploy --only hosting

# Deploy con preview
firebase hosting:channel:deploy preview
```

### **Deploy Automático (GitHub Actions)**

El workflow `.github/workflows/deploy-frontend.yml` se ejecuta automáticamente en cada push a `main`.

---

## 📊 **Performance Optimization**

### **Lighthouse Score Objetivo**

- ⚡ **Performance**: 95+
- ♿ **Accessibility**: 100
- 🔍 **SEO**: 100
- 💚 **Best Practices**: 95+

### **Optimizaciones Implementadas**

✅ **Lazy Loading de imágenes**
```html
<img src="..." alt="..." loading="lazy" />
```

✅ **Preload de fuentes críticas**
```html
<link rel="preload" href="/fonts/inter.woff2" as="font" type="font/woff2" crossorigin />
```

✅ **Code Splitting automático** (Astro lo hace por defecto)

✅ **Critical CSS inline** en Layout.astro

✅ **Astro Islands** - Solo hidrata componentes interactivos

---


## 📚 **Recursos Útiles**

- [📖 Documentación de Astro](https://docs.astro.build)
- [⚛️ Astro + React Integration](https://docs.astro.build/en/guides/integrations-guide/react/)
- [🎨 TailwindCSS Docs](https://tailwindcss.com/docs)
- [🧪 Playwright Docs](https://playwright.dev)

---

## 🤝 **Contribuciones**

Ver guía de contribución en el [repo principal](https://github.com/enlabedev/portfolio-infra).

---

## 👨‍💻 **Autor**

**Enrique Lazo Bello** - Senior Software Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/enlabe)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/enlabedev)

---

## 📄 **Licencia**

MIT License - ver [LICENSE](LICENSE)

---

<div align="center">

Made with ❤️ and ⚡ Astro

</div>
