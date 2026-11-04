# Triage report: TARGET-HochschildHomologyAndHKR

Verdict: `design`, name `HochschildHomologyAndHKR`, no base, no owner. The brief is at
`packages/HochschildHomologyAndHKR/target.md`; the manifest at
`packages/HochschildHomologyAndHKR/sources.toml` records ten works. No text is missing: every
paywalled work is recorded as uncertified and cited by locator, so no `needs-references.toml`
was left for the worker.

## What was searched

- The board: `packages/` (the folder `packages/HochschildHomologyAndHKR` existed empty with a
  `reports/` directory), the package index, and `merge-order/ORDER.txt`. The 38 open targets and
  designs listed in the brief were compared by object: none concerns Hochschild (co)homology,
  Kähler differentials, polyvector fields or deformations of algebras, so there is nothing to
  merge into.
- Main roadmaps, by `grep` over `TauCetiRoadmap/*/README.md` and `Suggested.lean` for Hochschild,
  Kostant, HKR, polyvector, Gerstenhaber and cup product, excluding Hochschild–Serre.
- Open pull requests, through `roadmaps grep` for the same terms and for the algebraic de Rham
  complex, exterior powers of Kähler differentials and `Ω^n`.
- The pinned Mathlib and Tau Ceti for Hochschild, Kähler differentials, smoothness, exterior
  powers, derivations, Ext, Tor and Koszul complexes.
- Sources through the sources service; the Annals of Mathematics paper named in the filing was
  searched for on the web by its description and could not be identified.

## What was found

Nothing owns the target. The nearest planned work, by object:

- DGAInfinity Layer 8 (main): Hochschild chains and cochains of DG and `A∞` algebras, normalised
  versions, cup product, braces, Gerstenhaber bracket, `HH²`/`HH³` deformation reading. Its Tau
  Ceti implementation (`TauCeti/Algebra/Homology/AInfinity/`) has coderivation-style cochains with
  the Getzler–Jones/Keller signs; STATUS marks Layer 8 partial (cochains, gauge, Massey, formality
  criterion in; normalisation and invariance out). No ungraded complex with bimodule coefficients,
  no Tor/Ext description, no HKR.
- KTheoryFiniteLocalFields §4.0 `cyclicHomologyModel` (pull request #1281, merge order 69):
  derived Hochschild chains of ordinary algebras built on DGAInfinity Layer 8, cyclic theories, the
  HKR isomorphism `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth commutative `A`, checks `HH_0 = A/[A,A]` and
  `HH_1 = Ω¹`.
- RefinedTraceMethods §1.9 (pull request #1493, merge order 309): the antisymmetrisation `ε_n`,
  projection `π_n`, `π_n ε_n = n!`, `ε` an algebra map, `ε_1` an isomorphism, Connes' `B` versus
  `d`; §1.10 the derived HKR filtration.
- DerivedDeRhamCohomology Layer 2 (pull request #868, merge order 19): `Ω^n` as
  `exteriorPower` of `KaehlerDifferential`, wedge, `d`, the algebraic de Rham complex.
- DerivedModuleAlgebra (main): §0.K.1 Koszul complex of a finite sequence, §0.2 derived tensor
  products, §0.12 smooth cotangent computation. It cites Bhatt–Morrow–Scholze on THH only.
- NoncommutativeGeometry N1 (cyclic cochains with dual coefficients over `ℂ`), BanachAlgebras A6
  (bounded Hochschild cohomology): different carriers, neighbours only.
- GorensteinHomologicalAlgebra (pull request #323): Gorenstein projective/injective/flat
  dimensions; no Hochschild content, so the filing's "continues GorensteinHomologicalAlgebra" is
  not an import.
- Mathlib at the pin: `Algebra.Smooth` (formally smooth and finitely presented, projective Kähler
  module, `Smooth.flat`), `KaehlerDifferential`, `Derivation` with Lie bracket,
  `ExteriorAlgebra.exteriorPower`, `MvPolynomial.pderiv`, `CategoryTheory.Ext`, `Tor`,
  `projective_of_finitePresentation`. No Hochschild complex, no Koszul complex. Tau Ceti: no
  Hochschild complex of an ordinary algebra.

## Why `design`

The homological half of the filing (`ε_n`, `π_n`, `π ε = n!`, `HH_1 ≅ Ω¹`, the smooth HKR
isomorphism in homology) is planned at RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0
and is imported, not re-planned. The rest, which is the bulk of the filing, is planned nowhere:
the classical ungraded complexes with bimodule coefficients and the normalisation theorem, the
Tor/Ext description over `A^e`, the ungraded cup product and its graded commutativity, the
comparison of sign conventions with DGAInfinity Layer 8, polyvector fields, the determinant
cocycle, the cohomological HKR theorem and the Koszul computation for polynomial rings. It is not
a Part II: DGAInfinity goes in the DG/`A∞` direction, and the K-theory roadmaps use Hochschild
homology as an input. The suggested name is free and kept.

## Generality decision

The filing's cohomological theorem is stated for `k` a field and `R` smooth of finite type, and
claims that the unnormalised map `T^n → HH^n(R,R)` is an isomorphism for every `n`. Pairing the
determinant cocycle with the antisymmetrised chain of `dr_1 ∧ … ∧ dr_n` gives `n!·det(D_j r_i)`,
so on cohomology the unnormalised map is `n!` times the canonical isomorphism obtained from the
duality pairing (HKR62 Theorems 5.1–5.2, HKR62 lines 522 and 548, state exactly this canonical
map `⋀ T_R → Hom_R(⋀ D_R, R)`; AV20 line 241 records the `t!` factor). In characteristic `p ≤ n`
the class vanishes although the cochain does not. The brief therefore states the theorem for `R`
smooth over an arbitrary commutative ring `k` (Mathlib's `Algebra.Smooth`) with the canonical
isomorphism, and keeps `Φ_HKR = (1/n!)⟨…⟩` as its realisation when `n!` is invertible; the field,
finite-type case and the characteristic-2 counterexample are Checks. AV20 Proposition 1.2 (AV20
line 70) confirms formality of `HH(R/k)` for smooth `R` over any commutative `k`.

## Sources

Certified: HKR62 (AMS open archive, fetched with the `publisher-open` licence class after the
service left the DOI landing page unclassified), AV20 (arXiv), Ginz05 (arXiv), StacksSmooth
(Stacks Project). Uncertified, cited by locator: Loday98 (Springer), Weibel94 and Mat86
(Cambridge), Ger63 and Ger64 (JSTOR), CE56 (Princeton). The service wrote the paywalled works to
the missing-references file; since a paywalled citation is settled as uncertified by the brief's
rules, they were recorded in the manifest with their DOIs and locators and the file was removed.
The Annals of Mathematics 2020, 191(2) paper named by the filing could not be identified (two web
searches, standard and extended, returned nothing by that description); it is noted as a consumer
lead and not cited.

## Points for the human and the design

- Ownership of the classical `ε`, `π` and homological HKR sits in two K-theory pull requests;
  importing them places this roadmap after merge position 309. Moving that ownership here would
  be the cleaner shape but re-plans existing pull requests; the brief flags it as a decision.
- The filing's unnormalised-map claim is corrected in the brief as described above.
- No suspicious instructions were found in any fetched text or roadmap.
