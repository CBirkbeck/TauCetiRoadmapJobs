# TARGET-QWittVectors triage report

Verdict: **design**, folder **QWittVectors**, no base and no duplicate owner. The mathematical target is coherent, but exact contracts with the absent Habiro packages remain unverified. The brief preserves QW.0–QW.6, including the completed relative Frobenius specification, rather than treating downstream citations as existing ownership.

## Searches and ownership findings

Searched every available file under the supplied `content/TauCetiRoadmap/`, `content/Completed/`, and `board/packages/` using case-insensitive object searches: q-Witt/qWitt, Witt vectors/WittVector, big Witt, λ/Λ/lambda rings, perfect cover/coverage, framed difference calculus, q-de Rham, Teichmüller, Verschiebung and Frobenius. The supplied main snapshot is `c4d22422c3f1aaa3d806c42f432953c26cb91969`. Inspected the mathematical matches and their scope, rather than inferring ownership from the word “Witt.” Searched folder names as well. The only pre-existing board package was QSeriesPartitionsAndMockModularForms, containing a source manifest; it does not own this target. No open roadmap PR heads were supplied.

The ordinary Witt/perfectoid material in PerfectoidSpaces is p-typical and Fontaine-theoretic. ModularCurves uses p-typical Witt bases; EllipticCurves has geometric Frobenius/Verschiebung; QuadraticFormInvariants owns quadratic-form Witt rings and local Teichmüller representatives. These do not own arithmetic Λ-rings or q-Witt vectors. EnhancedDerivedSheaves E1.6 and E5:animation and SchemeAndStackFoundations §§0.24/0.29 concern characteristic-p perfection/Frobenius; they are foundations to import, not this target. DGAInfinity Layers 0–1 and DerivedModuleAlgebra §§0.K.1, 0.2, 1.1–1.8 own generic graded, tensor, Koszul and completion infrastructure. Their sections were read to keep that work outside QWittVectors.

GitHub code search was used for `WittVector`, `LambdaRing`, `BigWitt`, `qWitt`, and Habiro-related names in the libraries and roadmap repository. Search results were treated as discovery on default branches. Then the complete, untruncated recursive file trees at both pinned commits were inspected, and relevant files were read at those pins:

- Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `Mathlib/RingTheory/WittVector/Basic.lean`, `Frobenius.lean`, `Verschiebung.lean`, `Teichmuller.lean`, and `Truncated.lean`. Found `WittVector.map`, ghost components/maps, `frobenius`, `verschiebung`, `teichmuller`, and `TruncatedWittVector`. The parameter is a prime and finite truncation means p-typical length, not divisors of a general positive integer.
- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti/RingTheory/WittVector/Frobenius.lean` and `Complete.lean`. Found `TauCeti.WittVector.continuous_frobenius`, its inverse continuity for perfect characteristic-p bases, and `WittVector.isAdicComplete_span_p_teichmuller`. These concern the p-typical `(p,[ϖ])` topology, not relative q-Witt coefficients or arithmetic Λ-perfect coverage.

No discovered library declaration or roadmap owns the combined new object. In particular, an existing p-typical Frobenius theorem is not the QW.4 linearization theorem. Thus neither `duplicate` nor `part-ii` is justified. `QWittVectors` is unused in all supplied owners and is a suitable new name.

## Missing package evidence and merge direction

Read ORDER.txt. It lists DerivedModuleAlgebra, EnhancedDerivedSheaves, DerivedDeRhamCohomology, PrismaticCohomology and HabiroCyclotomicCompletions in an order compatible with the filed upstream placement. It does not list QWittVectors, HabiroCohomologyFoundations, HabiroRings, RefinedTraceMethods or HabiroCohomologyFoundationsPartII. It does list further prismatic extensions; no import from a later extension is needed here.

The actual texts of HabiroCyclotomicCompletions, both named Habiro foundations roadmaps, HabiroRings, RefinedTraceMethods, PrismaticCohomology and DerivedDeRhamCohomology are absent from the supplied main checkout and available packages. Public-main reads of the expected README paths for HabiroCyclotomicCompletions, HabiroCohomologyFoundations, HabiroRings, PrismaticCohomology and DerivedDeRhamCohomology returned 404. The issue's twenty-one-citation and five-accepted-package assertions therefore cannot be independently verified here. The §0.3 consumer locator is explicitly identified as filed information.

The target imports existing foundations by their verified sections. For the absent suppliers it records the intended import and the missing exact section binding, instead of inventing sections or replanning them. Its intended edges are foundations → HabiroCyclotomicCompletions → QWittVectors → the four named consumers. No consumer is an upstream dependency. The design must reconcile actual accepted package sections and final order before claiming those interfaces are certified. ORDER.txt and all other packages were left untouched.

## Sources and mathematical decisions

Every paper was fetched through the required sources service, with its legal URL, version, hash, access class and status recorded in sources.toml. The fetched numbered extractions were read directly. Locators in target.md refer to those extractions and to printed paper pages; no source passage was copied into a deliverable.

The filed Wagner identifier, arXiv:2205.05073, resolves to unrelated astronomy. Bibliographic search located the correct work, arXiv:2410.23078v5. The service first recorded the wrongly identified work under the proposed key; refetching the correct citation updated the text/hash but left stale astronomy venue/DOI metadata. Those two stale fields were removed. The final manifest contains only the correct mathematical work.

Read Pridham v4 for Λ_P definitions and complete framed operators; Wagner q-Witt v5 for relative degree zero, étale base change, positive-degree systems and completion hypotheses; Scholze v1 for framed q-differences; and Bhatt–Scholze v4 for the torsion lemma and intrinsic q-crystalline supplier boundary. Added Hesselholt v3 and Borger v6 for the general big Witt/comonad/prime-set input. Added Wagner's Habiro paper, arXiv:2510.04782v2, because §1.22(e), §2.7 and the proof of Theorem 2.9 state precisely the perfect-cover and completed relative Frobenius interface demanded by the issue. These are references for upstream algebra, not a transfer of Habiro gluing or cohomology ownership.

The decisive generality and exclusion checks were:

- Definitions and étale base change work over arbitrary arithmetic Λ-bases. Perfect coverage is retained exactly for the stronger descent, relative V-injectivity, torsion and completion claims supported by the sources.
- QW.4 explicitly assumes étale R/A and perfectly covered A. It states the unique p-completed lift, its linearization, and the ψ_d-twisted `(p,Φ_d)` overlap equivalence for every prime, including 2. It neither assumes global Frobenius on R nor substitutes prismatic cohomology for that coefficient-ring interface.
- The relative ghost target includes ψ_d on the base. Suppressing that twist would break the consumers' completed interface.
- Fixed m permits a Λ_m-base; full systems retain the full prime set. Nonunital absolute degree-zero rings are included where Wagner permits them; the relative and positive-degree theory uses unital rings as in his standing conventions.
- q-Witt restrictions are unavailable in general (Wagner §2.14). Positive-degree Frobenii are graded maps with scaled differential identities, not ordinary chain maps. The strict alternating convention retains prime 2.
- Framed complexes retain their twisted product. Unrestricted functorial q-Hodge complexes with the prescribed Witt/Frobenius reductions are excluded by Wagner Theorem 5.1. Additional filtration/descent structures remain downstream.
- In Wagner Lemma 3.7 the displayed differential identity contains a typo; its proof yields `d F_n = n F_n d`. Wagner-Habiro Theorem 2.9 is read with the standing étale hypothesis of §2.2, not with an unrestricted A-algebra hypothesis suggested by its abbreviated heading.

All seven mathematical works needed for this triage are legally available and certified. No missing-reference table is needed. The remaining missing evidence is roadmap/package ownership text, not an unreadable mathematical source. No suspicious external instruction was acted upon.

## Deliverables and validation

Wrote target.md, this report, and sources.toml; maintained the scratch worklist. No Lean was written or run, no library or merge-order file was changed, and no GitHub write was performed. Validation passed for the required four-line header, all six requested headings, seven unique certified source entries with complete provenance, and absence of stale astronomy metadata and local paths in the manifest. The sources-service manifest check returned `0 problem(s)`. Board git status showed only the new QWittVectors directory.
