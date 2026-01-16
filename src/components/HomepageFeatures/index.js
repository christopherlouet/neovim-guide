import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

const FeatureList = [
  {
    title: 'Migration IntelliJ → Neovim',
    emoji: '🚀',
    description: (
      <>
        Guide complet pour les développeurs venant d'IntelliJ.
        Retrouve tous tes raccourcis et workflows favoris dans Neovim.
      </>
    ),
  },
  {
    title: 'Configuration prête à l\'emploi',
    emoji: '⚡',
    description: (
      <>
        Basé sur <a href="https://github.com/christopherlouet/neovim-intellij-ide">neovim-intellij-ide</a>.
        Installe et code en 5 minutes, sans configuration manuelle.
      </>
    ),
  },
  {
    title: 'Apprentissage progressif',
    emoji: '📚',
    description: (
      <>
        Des fondations au workflow avancé. Chaque chapitre construit
        sur le précédent pour un apprentissage sans frustration.
      </>
    ),
  },
];

function Feature({emoji, title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <span className={styles.featureEmoji} role="img" aria-label={title}>
          {emoji}
        </span>
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
