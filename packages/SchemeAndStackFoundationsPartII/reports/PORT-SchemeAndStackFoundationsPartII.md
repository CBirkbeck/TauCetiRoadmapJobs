# PORT-SchemeAndStackFoundationsPartII

Port of the accepted package `packages/SchemeAndStackFoundationsPartII/` into
`TauCetiRoadmap/SchemeAndStackFoundationsPartII/{README.md,Suggested.lean,metadata.toml}`.

- Branch: `roadmap/scheme-and-stack-foundations-part-ii`, from `45f58db`.
- Head commit: `8f486a05` (`SchemeAndStackFoundationsPartII: roadmap (README, Suggested.lean, metadata)`).
- Only the three files of the folder are added; nothing outside the folder changes.

## Build

`lake build TauCetiRoadmap.SchemeAndStackFoundationsPartII.Suggested` on the committed file:

```text
⚠ [18287/18288] Built TauCetiRoadmap.SchemeAndStackFoundationsPartII.Suggested (10s)
warning: TauCetiRoadmap/SchemeAndStackFoundationsPartII/Suggested.lean:102:8: declaration uses `sorry`
warning: TauCetiRoadmap/SchemeAndStackFoundationsPartII/Suggested.lean:130:8: declaration uses `sorry`
Build completed successfully (18288 jobs).
```

Two warnings, both `declaration uses sorry` (the two headline theorems); no other warning.

## Gate

```text
gate SchemeAndStackFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 219 roadmaps, 1945 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

`roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere. It
did not check names outside the roadmaps ("no pinned Lake packages on this host"), so every
backticked Mathlib and Tau Ceti name of the README was checked by hand against the pinned sources
in the worktree's `.lake/packages` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): all resolve, with the
file and line given in the supplier tables. The names that resolve to no pinned declaration are all
roadmap names: this roadmap's six, SchemeAndStackFoundations' `henselian_pair_characterisations`,
`henselian_pair_permanence`, `henselian_smooth_lifting`, `popescu_colimit_of_geometricallyRegular`,
`smoothGroup_fppf_etale_comparison`, `fppf_kummer_sequence`, `finite_pushforward_exact`,
`gabber_affine_proper_base_change`, `SchemeBrauerGroup`, `CohomologicalBrauer` (main);
EnhancedDerivedSheaves' `animatedAlgebras`, `animatedModules`, `tot_filteredColimit_of_bounded`
(main); PrismaticCohomologyPartIII's three `Prismatic.FlatCohomology.*` names, HeightsRationalPoints
AndObstructions' `Brauer.affine_comparison`, DerivedDeRhamCohomology's
`DerivedDeRham.completionExchanges` and PerfectoidQuotients' `perfectoid_sharp_ideal_completion`
(open heads; each found at its section, see below).

## Draft pull request body

This roadmap builds the complete and henselian theory of fppf cohomology with commutative finite
locally free coefficients over an arbitrary ordinary base, as a Part II of SchemeAndStackFoundations:
henselianity of derived complete animated rings, H² invariance over henselian pairs, the continuity
formula RΓ(A,G)≃Rlim RΓ(A/ᴸ(a₁ⁿ,…,a_rⁿ),G) over derived complete animated rings and its comparison
with ordinary quotients, invariance of Hⁱ under henselian pairs (surjective from degree one, bijective
from degree two, for arbitrary non-Noetherian pairs), algebraization of Hⁱ, i≥2, over topological
rings with an open henselian nonunital subring and on Laurent punctures, the punctured and
Noetherian-neighbourhood comparisons, discreteness of completely flat perfectoid modules and
adically faithfully flat descent with supports (Česnavičius–Scholze, *Purity for flat cohomology*,
§§5.6–5.7; Bouthier–Česnavičius, *Torsors on loop groups*, §2.1). It imports the animated flat
cohomology, p-adic continuity, principal excision and perfect-base Dieudonné theory of
PrismaticCohomologyPartIII §6.0 and the supports, nilpotent invariance, finite-ideal excision and
fpqc hyperdescent of PurityForFlatCohomology Layer 3 instead of planning them again, so that the
general results of CS24 §§5.6–5.7 have a single owner. `Suggested.lean` states the two headline
theorems statable at the pins, henselian invariance and topological algebraization, on Tau Ceti's
finite locally free commutative group schemes and affine fppf site, with fppf cohomology defined as
`Ext` out of the free sheaf on a representable; the continuity formula and supported descent need
animated rings and are recorded in its docstring as not statable.

## Dependencies that are still pull requests

PrismaticCohomologyPartIII, PurityForFlatCohomology, ArcTopologyAndDescent, PerfectoidQuotientsPartII,
PerfectoidQuotients, HeightsRationalPointsAndObstructions, DerivedDeRhamCohomology. All are earlier
than this roadmap in the merge order (ORDER lines 84, 222, 108, 221, 25, 142, 23 against 259).
The roadmaps on main it uses are SchemeAndStackFoundations, EnhancedDerivedSheaves and
DerivedModuleAlgebra. No cited id is one that only an open revision defines; the overlap report
lists no open pull request that changes or renumbers a cited section. Each cited section was opened
at its head: PrismaticCohomologyPartIII §6.0 (README line 106, all three `Prismatic.FlatCohomology.*`
targets), PurityForFlatCohomology §§0.2, 0.3, 2.1 (with its Corollary 4.1.9 vanishing), 3.2–3.6,
7.10, HeightsRationalPointsAndObstructions §2.6c (`Brauer.affine_comparison`), DerivedDeRhamCohomology
§1.22 (`DerivedDeRham.completionExchanges`), PerfectoidQuotients §§0.1, 0.4, 0.6
(`perfectoid_sharp_ideal_completion`), ArcTopologyAndDescent §§11.2, 11.5, 12.7,
PerfectoidQuotientsPartII §Q7.1; on main SchemeAndStackFoundations §§0.12, 0.14, 0.15, 0.21,
1.13–1.15, 1.18–1.22, 2.1–2.6, 2.10, 2.11, 2.15, 2.22 and Layer 4, EnhancedDerivedSheaves
E2:towers.1 and E5:animation.1–.4, DerivedModuleAlgebra §0.K.1 and §§1.1–1.9.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the form: two headline theorems (README
§2.2 `flatCohomology_henselian_invariance`, §2.3 `flatCohomology_algebraization`) and the four
definitions they need (`pointsAddFunctor`, `coefficientSheaf`, `flatCohomology`,
`IsHenselianNonunitalSubring`), all with real bodies, no sorry'd data, no `set_option`, a single
`import Mathlib` (module form `public import Mathlib`) plus the two Tau Ceti modules used. Only the
module docstring changed: it now says that the four definitions are README §2.0, and lists the two
non-statable headlines separately with what each lacks (§1.5: animated rings, derived Koszul
quotients and completion, flat cohomology of animated rings; §3.2: additionally flat cohomology with
supports). No other headline is statable and absent: §1.2 and the cohomological part of §1.6 are
special cases of §2.2; §2.4 is an application of §2.3 (CS24 Example 5.6.11), not a headline; §§2.5,
2.6, 3.1 need animated rings or cohomology of non-affine opens.

**Signature check.** I appended `#check @name` for all six declarations to the module, built it
once with the brief's `lake build` command, read the elaborated types, and restored the file. Every
type matches its README statement: `flatCohomology` and both theorems carry `HasExt.{w}`;
`flatCohomology_henselian_invariance` carries `[HenselianRing R I]` with `I : Ideal R` arbitrary;
`flatCohomology_algebraization` carries `UniformSpace`, `IsUniformAddGroup`, `IsTopologicalRing`,
openness, the henselian predicate, the ideal basis and `2 ≤ n`; the completion map is
`Algebra.ofId B (UniformSpace.Completion B)`. The file has no `variable` block, so no binder can be
dropped. Nothing changed as a result.

## Supplier replacements and duplication removals

- **ReductiveGroupsPartII Layer RG2.0a → Tau Ceti.** The package imported "affine Weil restriction
  along finite locally free maps and arbitrary base change" from ReductiveGroupsPartII
  §§RG2.0a.1–RG2.0a.3 (and RG2.0a.3 is the Deligne torus, not Weil restriction). The pinned Tau Ceti
  already has it: `TauCeti.Algebra.WeilRestriction` (TauCeti/RingTheory/WeilRestriction/Basic.lean:228,
  representing T↦Hom_B(C,B⊗_A T) for B finite projective over A and C finitely presented over B)
  with `TauCeti.Algebra.WeilRestriction.baseChangeAlgEquiv` (line 431) and
  `homEquiv_comp_baseChangeAlgEquiv` (line 467). The ReductiveGroupsPartII contract section is
  deleted; §1.2's *Needs*, the Layer 1 Dependencies and gap:begueri-resolution's *Needs* now cite
  these Tau Ceti declarations (with `instSmooth`).
- **Mathlib and Tau Ceti rows added** for what the README now names: `Unitization`,
  `Unitization.fstHom` (the Dorroh unitalization of the Conventions is Mathlib's `Unitization ℤ B′`),
  `HasDerivedCategory.standard` with `CategoryTheory.hasExt_of_hasDerivedCategory` (a `HasExt`
  instance exists, so the headlines are not vacuous), `TauCeti.CategoryTheory.cohomologyZeroSectionsEquiv`
  (degree zero) and `TauCeti.CommAlgCat.isCoverDense_algSpec` (comparison with the site of schemes).
- **Duplication sweep** (after the edits, by object, over main, the open heads through
  `roadmaps grep` — which searched 444 open heads, a superset of the 211 listed — and the board
  packages): CS24 Lemmas 5.6.2–5.6.5, Theorem 5.6.6, Example 5.6.7, Remark 5.6.8, Corollaries
  5.6.9–5.6.13, Lemma 5.7.1, Theorem 5.7.2; BC22 Lemma 2.1.3, Theorems 2.1.6 and 2.1.15; "continuity
  formula", "henselian invariance", derived completeness with henselianity, henselian nonunital
  rings, Laurent punctures, `Ext` on fppf sites, flat cohomology of finite locally free groups. No
  second owner. PurityForFlatCohomology's only use of "henselian invariance" (README line 3160) is
  for a torus, i.e. smooth coefficients, which is the BC22 input of gap:henselian-torsor-cohomology,
  not a target here. EtaleDualityAndPerverseSheavesPartII says "flat cohomology … belong[s] to
  PurityForFlatCohomology"; PurityForFlatCohomology §0.2 takes fppf cohomology of schemes from
  Mathlib's big fppf site and owns the supported version, and its `Suggested.lean` declares no fppf
  cohomology. The §2.0 definitions here are its affine model on the pinned carriers, needed to state
  §§2.2–2.3; this is now said once in Scope and ownership and §2.0 gains an API law comparing the
  two (with PurityForFlatCohomology §0.2 added to §2.0's *Needs*). No declaration of `Suggested.lean`
  shares a fully qualified name with a declaration of another roadmap.
- No target was deleted; nothing is recorded as a removal in Scope and ownership.

## Fixes made on the upstream read

1. **Wrong supplier section.** ReductiveGroupsPartII §RG2.0a.3 is the Deligne torus; the citation was
   for Weil restriction. Replaced by the pinned Tau Ceti declarations (above).
2. **§1.3 statement under-quantified.** It said "a derived a-complete animated R-algebra" without
   saying what a is or where R and G live. Now: R ordinary, G commutative finite locally free over R,
   A an animated R-algebra and a∈π₀A with A derived a-complete; the equivalent π₀ form of the
   vanishing hypothesis (CS24 Lemma 5.6.4) is stated with its supplier, PurityForFlatCohomology §3.3.
3. **§2.0 definitions without their own Checks.** The four definitions shared one API list and four
   Checks, two of which tested only `flatCohomology` and none `pointsAddFunctor` or
   `coefficientSheaf`. §2.0 now gives each definition its own prose definition, API bullets and at
   least three Checks: μ_p over ℤ/p² (ℤ/p) against 𝔽_p (0); α_p over 𝔽_p[ε] (ε+ε=2ε, which the
   multiplicative rule would send to 0); the constant group ℤ/2 (idempotents with e+f−2ef, (ℤ/2)²
   over ℚ×ℚ); α_p sections over 𝔽_p[t]/(t^p) (dimension p−1) against reduced algebras (0); the
   faithfully flat p-th power map μ_(p²)→μ_p, exact as sheaves but zero on sections over
   𝔽_p[t]/(t^p) with nonzero target; the zero algebra (empty cover, all Hⁿ zero).
4. **Degree zero.** "`flatCohomology G 0` at A is G(A)" is an isomorphism through the universe
   lift, not an equality; reworded, with the Tau Ceti degree-zero comparison it runs one universe up.
5. **Cohomology of a group-valued sheaf.** "The cohomology of `TauCeti.HopfAlgebra.pointsFppfSheaf`"
   referred to a `GrpCat`-valued sheaf, which has no cohomology; now "the abelian sheaf underlying".
6. **Non-vacuity of `HasExt`.** The README now says why the `HasExt` instance argument is satisfiable.
7. **Negative control for §2.3.** New Check: a nonzero ring with the indiscrete topology has the zero
   ring as completion and no henselian open subring; for B=ℚ, H²(ℚ,μ₂)=Br(ℚ)[2]≠0 while H²(0,μ₂)=0,
   so the henselian hypothesis cannot be dropped.
8. **Boundary with PurityForFlatCohomology §0.2** stated (above).
9. **Timelessness.** "They serve later work on …" in Downstream consumers reworded.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: indexing π_i↔H^(−i) | A=k⊕k[1], G=𝔾_a | RΓ(A,𝔾_a)=A as a complex: H⁰=π₀=k, H^(−1)=π₁=k | holds | none |
| Convention: covariant Dieudonné, fib(V−1) | 𝔽_p with ℤ/p and μ_p; recomputed in PurityForFlatCohomology §2.1 and PrismaticCohomologyPartIII §6.0 | ℤ/p: V=σ⁻¹=id on 𝔽_p, V−1=0, H⁰=H¹=𝔽_p; μ_p: V=pσ⁻¹=0, V−1=−1, H⁰=H¹=0; Purity §2.1 gives 𝔽_p,𝔽_p,0 and RΓ(μ_(p^n))=0; PCIII §6.0 gives the same pair | holds, consistent across suppliers | none |
| Convention: derived quotient | A=ℤ/p², a=p; A=ℤ, a=p | cone of p on ℤ/p²: π₀=coker=𝔽_p, π₁=ker=pℤ/p²≅𝔽_p; ordinary quotient π₁=0; on ℤ: π₁=0 | holds | none |
| Convention: supports | I=(1); I=(0) | V(1)=∅, U=Spec: fib(id)=0; V(0)=Spec, U=∅: fib(RΓ→0)=RΓ | holds | none |
| Convention: henselian pair, Dorroh product | (ℤ,2ℤ); (ℤ₂,2ℤ₂); products | Jac(ℤ)=0∌2; ℤ₂ local complete; (1,0)(n,y)=(n,y); (0,x)(0,y)=(0,xy) | holds | `Unitization ℤ B′` named |
| Convention: fppf Kummer for n divisible by residue char | 𝔽_p(t), μ_p | fppf H¹=𝔽_p(t)^×/p ∋ [t]≠0; étale μ_p is 0 on reduced algebras, étale H¹=0 | fppf needed, as stated | none |
| Def `pointsAddFunctor` | μ_p over ℤ/p² and 𝔽_p; α_p over 𝔽_p[ε]; ℤ/2 over ℚ×ℚ and a connected ring; trivial group | x^p=1 forces x≡1 (mod p) and (1+pa)^p=1: μ_p(ℤ/p²)≅ℤ/p, μ_p(𝔽_p)=0; α_p: 𝔽_pε, ε+ε=2ε (product rule: ε²=0); ℤ/2: 4 idempotents, (1,0)+(1,0)=(0,0), group (ℤ/2)²; connected: ℤ/2; trivial: one point | convolution law pinned; wrong product rule excluded by the α_p Check | Checks added |
| Def `coefficientSheaf` | α_p over 𝔽_p[t]/(t^p) and reduced A; μ_(p²)→μ_p over 𝔽_p; trivial group | (c₀+m)^p=c₀^p: α_p(A)=(t), dim p−1; reduced: 0; 𝔽_p[v]/(v^p)→𝔽_p[u]/(u^(p²)), v↦u^p free of rank p, kernel μ_p; on 1+(t): (1+m)^p=1+m^p=1, map zero, target 1+(t)≠0; trivial: 0 | sheaf exactness ≠ section exactness, as the API says | Checks added |
| Def `flatCohomology` | α_p over 𝔽_p[t]; μ_p over ℤ_p, p odd and p=2; trivial group; A=0; existence of `HasExt` | H¹=𝔽_p[t]/𝔽_p[t^p]∋[t]≠0, H⁰=0; ℤ_p^×=μ_(p−1)×(1+pℤ_p): ℤ/p, p=2: {±1}×(1+4ℤ₂): (ℤ/2)² by −1,5; trivial: 0 all n; A=0: empty family is jointly surjective onto ∅, free sheaf is 0, Ext=0; `HasDerivedCategory.standard` + `hasExt_of_hasDerivedCategory` give `HasExt` | holds; statements not vacuous | Checks and non-vacuity added |
| Def `IsHenselianNonunitalSubring` | 0; pℤ_p; ℤ⊂ℤ; 3ℤ_(3); equivalence with `Unitization ℤ B′` | 0: y=0, T=1; pℤ_p: (ℤ_p,p) henselian; ℤ: 2(1+y)=1 unsolvable; 3ℤ_(3): local so quasi-inverses, T²−T−3 disc 13 not a square in ℚ (it is in ℤ₃, 13≡1 mod 3); in ℤ⊕B′: (1,x)(1,y)=(1,x+y+xy), f(1,r) has ℤ-component 1^N·0+0=0 and B′-component f(1+r), so roots agree | holds; independent of ambient B | API names `Unitization`, `Unitization.fstHom` |
| §1.1 derived complete ⇒ henselian | ℤ_p,(p); 𝔽_p⊕𝔽_p[1], I=0; ℤ,(p); I=(1) | ℤ_p complete; A/ᴸ0=A⊕A[1] with transitions id⊕0, Rlim=A, pair (𝔽_p,0) henselian; ℤ: Rlim=ℤ_p≠ℤ, p∉Jac(ℤ)=0; I=(1): A=Rlim 0=0, (0,(1)) henselian | holds | none |
| §1.2 H² invariance | ℤ_p,μ_p (p odd, p=2); ℂ[[t]],μ_n; I=0; I=⊤ | Pic=0, Br(ℤ_p)=Br(𝔽_p)=0: H²=0=H²(𝔽_p,μ_p); H¹(ℤ_p,μ_p)=ℤ/p→0 (degree one is not claimed); ℂ[[t]]: 0=0; I=0 identity; I=⊤ forces R=0 | holds | supplier citation fixed |
| §1.3 continuity with a bound | ℤ_p, a=p, μ_p; a=1; G=0 | H^i_ét(𝔽_p,𝔾_m)=0 (i≥2) so H^(≥3)(μ_p)=0 on ℤ_p and 𝔽_p; μ_p(ℤ/pⁿ)=1+p^(n−1)ℤ/pⁿ, transitions zero, lim¹=0, lim H¹=lim (ℤ/pⁿ)^×/p=ℤ/p=H¹(ℤ_p); a=1: A=0; G=0: 0=0 | holds | statement quantifiers fixed |
| §1.4 descent after principal completion | ℤ[[t]], a=t, identity; ℤ_p, A→A×A; a=1 | constant cosimplicial object: Rlim=RΓ(A); Čech nerve of a split map contracts; a=1 all zero | holds | none |
| §1.5 complete continuity | empty tuple; ℤ_p,(p),μ_p; ℤ/p² | I=0: constant tower; lim H¹=ℤ/p, lim¹=0; ℤ/p²/ᴸp has π₁=𝔽_p, ordinary quotient loses it | holds | none |
| §1.6 ordinary quotients | ℤ_p,μ_p; 𝔽_p[[t]],(t),α_p; I=0 | ℤ/p→0 onto, not injective, lim¹ μ_p(ℤ/pⁿ)=0; α_p(C/tⁿ)=(t^⌈n/p⌉)/(tⁿ), images vanish, lim¹=0, H¹=C/C^p=lim, H²=0 both; I=0 constant | holds | none |
| §1.7 failure over henselian rings | 𝔽_p{t}→𝔽_p[[t]], μ_p | source countable (henselization of a countable ring); 1+t·h(t^p): ratio in 𝔽_p[[t^p]] has t¹-component h−h′·u with u=1 forced by the t⁰-component, so h=h′: uncountably many classes; H²=Br[p]=0 both | holds, consistent with §2.2 | none |
| §2.1 finitary functors | (ℤ_(p)^h,(p)), F(C)=C; I=0; constant 2-point functor | ℤ_(p)^h→ℤ_p injective, 1 lifts; identity; constant on filtered colimits (filtered ⇒ connected), identity | holds (BC22 Lemma 2.1.3 hypotheses: A Noetherian, geometric fibres of A→Â regular) | none |
| §2.2 henselian invariance (Lean `flatCohomology_henselian_invariance`) | (ℤ_(p)^h,p),μ_p; (𝔽_p[[t]],t),α_p; I=0; I=⊤; non-Noetherian (O_(ℂ_p),𝔪),μ_p | (1+pA)/(1+p²A)≅𝔽_p: H¹=ℤ/p→0, H²=0=0; C/C^p∋[t]≠0→0, H²=0 both; identity; R=0; Pic=0, Br(O_(ℂ_p))=Br(𝔽̄_p)=0: H²=0=H²(𝔽̄_p,μ_p) | holds; degree one is surjectivity only, as stated; Lean generality = README (arbitrary R, I) | none |
| §2.3 algebraization (Lean `flatCohomology_algebraization`) | 𝔽_p{t} t-adic; discrete B with B′=0; henselian pair with coarse topology; (ℤ_(3),3ℤ_(3)) coarse; indiscrete ℚ | H²(μ_p)=0 both; B̂=B; B̂=A/I, gives §2.2 in degrees ≥2; H²(ℤ_(3),μ₃)=Br(ℤ_(3))[3]∋ class with invariants 1/3 at 2, −1/3 at 5, 0 at 3 and ∞, against H²(𝔽₃,μ₃)=0, excluded by the T²−T−3 clause; indiscrete: B̂=0, B′=B fails at x=−1, H²(ℚ,μ₂)=Br(ℚ)[2]≠0 vs 0 | holds; both clauses of the henselian predicate are needed | negative Check added |
| §2.4 Laurent puncture | R=𝔽_p, μ_p; trivial group | H²=Br[p]=ℤ/p both (Pic=0, local fields); H¹ countable vs uncountable (degree ≥2 only); 0=0 | holds | none |
| §2.5 punctured animated comparison | ℤ_(p)^h→ℤ_p, I=(p); I=0; I=(1) | H²(Frac ℤ_(p)^h,μ_p)=Br[p]=ℤ/p=H²(ℚ_p,μ_p); I=0: cofibre C connective with π₀A⊗C=0 has lowest π_k unchanged, so C=0 and A≃A′; I=(1): (1)⊆Jac forces π₀A=0, A=0 | holds | none |
| §2.6 Noetherian neighbourhoods | ℤ_(p)^h→ℤ_p, U=D(p); R→R; I=0 | ℤ/p→ℤ/p; identity; R/0=R′/0 forces R≅R′ | holds (CS24 Cor. 5.6.13 has no flatness hypothesis; none added) | none |
| §3.1 discreteness | M=A; A=𝔽_p, I=0, M=A[1]; M=0 | free rank one, discrete; π₁A⊗π₀M=0≠𝔽_p=π₁M, not flat, excluded; 0 | holds | none |
| §3.2 supported descent | I=(1); I=0; A→A×A; A=𝔽_p[t^(1/p^∞)], A′=A×𝔽_p (t↦1) | 0=0; fpqc hyperdescent (PurityForFlatCohomology §3.6); split Čech nerve; (t−1)(0,1)=0 so A→A′ not flat, A/ᴸt→A/ᴸt×0 faithfully flat, A′ perfect | holds; perfection step needs only flat reductions | none |
| Context (Lean) | the six declarations | no `variable` block; every hypothesis in the declaration's signature; `#check` output matches README (see above) | holds | none |
| Generality (Lean ↔ README) | §2.2, §2.3 | R:Type u, I arbitrary ideal, G arbitrary object of the finite locally free carrier; B with additive uniformity and separated `UniformSpace.Completion`; carrier admits exactly commutative finite locally free groups | equal | none |
| Duplication by object (pins) | Weil restriction; unitization; fppf cohomology; henselian nonunital | Weil restriction with base change at the Tau Ceti pin (replaced RG2.0a); `Unitization` at Mathlib pin (named); no fppf cohomology and no animated rings at either pin (grep for `SimplicialObject CommRingCat`, `animated`, `Ext` with `fppfTopology`) | one replacement | supplier table |

## Ownership against open work

Checked by object with `roadmaps grep` over main and all open heads (444 at the index used, which
contains the 211 listed in the brief) and over the board packages (searches above). Every object this
roadmap states is either cited to its owner (the supplier sections listed) or owned here; the
reason this roadmap owns its targets is that they are CS24 §§5.6–5.7 and BC22 §2.1 results that no
roadmap on main, at an open head or on the board states, and that its two direct suppliers
(PurityForFlatCohomology, PrismaticCohomologyPartIII) list as outside their own scope. No notion was
moved down from a later roadmap.

## Unresolved

- **Conditional gap contracts.** The README keeps twenty `gap:` contracts addressed to earlier owners:
  SchemeAndStackFoundations (finite-group-ext, henselian-stack-lifting, henselian-torsor-cohomology,
  cauchy-algebraization, punctured-h2-injectivity, complete-torsor-effectivity,
  classical-affine-group-adapter, flat-group-cotangent-amplitude, henselized-formal-fibres),
  PrismaticCohomologyPartIII (begueri-resolution, animated-flat-cohomology, cohomology-deformation,
  flat-animated-modules, animated-henselization, tower-accuracy, split-etale-refinements,
  completed-pi0-defect) and DerivedModuleAlgebra (adic-flat-module-limits,
  complete-module-hyperdescent, koszul-geometric-support). None of these suppliers plans them at
  present; they need to be filed with those roadmaps. The `conditional_gaps` list of
  `review.json` is out of date: it still names animation-composition, general-square-zero,
  perfection-covers and torsor-limit-descent, which the package no longer uses, and omits
  flat-animated-modules, animated-henselization, tower-accuracy, split-etale-refinements and
  completed-pi0-defect, which it does.
- **Supplier-side downstream notes that do not match.** PurityForFlatCohomology's Downstream consumers
  says this roadmap imports its §7.9 (torsion of 𝔾_m-cohomology); it does not. PerfectoidQuotientsPartII's
  Downstream consumers says this roadmap uses Q7.1–Q7.3 for the pro-fppf site; it uses only §Q7.1, for
  the semiperfect cover of §3.2. Neither is a defect here; both are notes for those roadmaps.
- Suspicious passages in untrusted text: none found.


Pull request: #2272 (roadmap/scheme-and-stack-foundations-part-ii at 8f486a0)
