# Triage report: TARGET-QuasicoherentSheavesOnPrestacks

**Verdict:** `design`, name `QuasicoherentSheavesOnPrestacks` (unused on main, in every open roadmap pull request, on the board and in the merge order). Base: none.

## What I searched

**Board consolidation (step 0).** I compared the statement, by mathematical object, with every open target and design in the job brief.
- I read the `target.md` of the stack-related ones: VirtualFundamentalClasses, StackPointsAndResidualGerbes, RationalAnalyticPrismatization and NashBlowups.
- I also grepped every board `target.md`, `design/README.md` and `README.md` for `QCoh`, prestack Kan extensions and `lim … D(R)`.

None plans quasi-coherent sheaves on prestacks:
- VirtualFundamentalClasses and StackPointsAndResidualGerbes use only SchemeAndStackFoundations §1.22's abelian `Stacks.QCoh`;
- RationalAnalyticPrismatization consumes AnalyticStacks;
- NashBlowups is unrelated.

So no `merge-into`.

**Main.**
- EnhancedDerivedSheaves: Scope, Conventions, E1.8, E5:presentability.2, E5:descent, E5:spectra-comparison, E5:animation.4, E5 and Downstream consumers.
- SchemeAndStackFoundations: §§1.1, 1.21, 1.22, 2.18 and the section list.
- DerivedModuleAlgebra: §1.E.0.

The word "prestack" occurs in EnhancedDerivedSheaves only in the affine tensor comparison. Neither roadmap defines `QCoh` of a functor on rings.

**Open pull requests.** I ran `roadmaps grep` for:
- `prestack`;
- `QCoh` near prestack or right Kan extension;
- SAG 6.2.4.1 and 2.1.2.2;
- Gaitsgory–Rozenblyum;
- `QCoh(X) = lim`;
- `Aff/X`.

I then read the hits:
- PrismaticCohomologyPartII #1065, §4.0 and its supplier table;
- HabiroCohomologyFoundations #1428, the supplier paragraph and the Layer 1 quotient target;
- LanglandsParameterStacks #1202, the supplier paragraph and §§1.7–1.8;
- AnalyticStacks #1687, Scope and Layer 1;
- SchemeKTheoryOperations #1229, AlgebraicModuliForArithmeticGeometry #853 and ComplexComparisonPartII #848, only their `QCoh`/`D_qc` lines;
- the EnhancedDerivedSheaves amendment #1630, diffed against main.

DiamondsAndVStacks' many "prestack" hits are Cat-valued pseudofunctors on perfectoid sites, not module categories over affine points.

**Libraries.** Mathlib has `SSet.Quasicategory`, `Scheme.fpqcTopology`, `Pseudofunctor.IsStack` and `DescentData`. It has no presentable or stable ∞-categories, so nothing there owns the target.

**Merge order.** The relevant roadmaps sit at these lines:
- AlgebraicModuliForArithmeticGeometry 32;
- SchemeKTheoryOperations 34;
- ComplexComparisonPartII 39;
- PrismaticCohomologyPartII 56;
- LanglandsParameterStacks 61;
- HabiroCohomologyFoundations 195;
- AnalyticStacks 315.

## What I found

- **No owner.** The EnhancedDerivedSheaves amendment (#1630, README line 41) disclaims the definition outright: quasi-coherent sheaves on a prestack, as a limit of module categories over its affine points, are not owned there. Main stops at `D_qc` of schemes (SchemeAndStackFoundations §2.18; EnhancedDerivedSheaves E1.8, qcqs only) and abelian `QCoh` on stacks (§1.22).
- **Four local constructions of parts of the target**, which confirm the issue's claim:
  - **PrismaticCohomologyPartII §4.0** defines `QCohPrestack(X) = lim D(R)` on classical rings, with `flatDescent`, `cechDescent`, `sheafificationEquiv`, `Perf`, `affinePushforward` and affine base change. Its own text says that dropping flatness needs derived prestacks.
  - **HabiroCohomologyFoundations Layer 1** constructs "the QCoh right Kan extension here" (README line 218) for a lattice quotient.
  - **LanglandsParameterStacks §1.7** owns faithfully flat descent of module categories over animated rings (SAG Theorem D.6.3.1).
  - **AnalyticStacks 1.2** asserts, as an API fact, that its `D` of a scheme is §2.18's `D_qc`.

  Each is narrower than the target: classical only, one quotient, descent only, or the !-topology. Each is an open pull request later in the merge order than a roadmap whose suppliers are all on main. So they are consumers to be amended, not owners. A `duplicate` verdict would name an owner that owns only a fragment.
- **Not a Part II.** The target continues neither supplier "in the same direction". It is the functor-of-points layer that sits on both EnhancedDerivedSheaves (higher algebra) and SchemeAndStackFoundations (schemes and stacks). EnhancedDerivedSheaves has explicitly excluded it. A new roadmap at the top of the merge order is the only placement that lets PrismaticCohomologyPartII (56), LanglandsParameterStacks (61) and the earlier scheme roadmaps import it.

## Generality and corrections to the filed statement

- **The test category.** The issue's "commutative rings (and animated or connective E∞ rings where the library has them)" becomes one definition for an affine context, with three instances:
  - classical: `D∞(R)`;
  - animated: EnhancedDerivedSheaves `animatedModules`;
  - spectral: `Mod_A(Sp)`, conditional on a connectivity predicate on `Sp`.

  A left-Kan-extension invariance theorem (T2, SAG Remark 6.2.2.2 line 17845) makes the classical case a special case, not a separate theory.
- **Base change.** Base change in the classical context is false without Tor-independence: the square `Spec 𝔽_p → Spec ℤ ← Spec 𝔽_p` fails it. The general statement holds in the animated context for affine maps. T5 separates the two. Full derived schematic base change (SAG 6.3.4.1, GR-I 2.2.2) needs derived schemes, which no roadmap owns; it is recorded as out of scope.
- **SAG locators.** The issue cites "SAG Theorem 2.1.2.2 for affine comparison". That theorem (p. 193, SAG line 6942) is not the affine comparison. It says: for a hypercomplete ∞-topos generated by discrete objects, with discrete structure sheaf, the derived ∞-category of the abelian category of `π₀O`-modules is the ∞-category of `O`-module sheaves of spectra. The affine comparison is SAG Proposition 2.2.3.3 (p. 202) with Remark 6.2.2.5 (p. 491), and on main EnhancedDerivedSheaves E1.8 `quasicoherentDerived_affine`. The scheme comparison T4 uses 2.1.2.2 together with Corollaries 2.1.2.3 and 2.2.6.2 and Proposition 6.2.4.1. Proposition 6.2.4.1 (p. 493, SAG line 17929) is stated for spectral Deligne–Mumford stacks. "Classically representable prestacks" is the issue's paraphrase: for ordinary schemes the route is Zariski gluing (GR-I Proposition 1.4.4) together with Stacks Lemma 75.4.2.
- **Gaitsgory's page.** The issue's URL (`people.mpim-bonn.mpg.de/gaitsgde/GL/`) hosts only unrelated preprints. The authors post the published Volume I at `people.mpim-bonn.mpg.de/gaitsgde/Book/Vol1.pdf`, which I read; its printed pages are PDF pages minus 37. GR-I works over a field of characteristic 0, so it gives routes; SAG gives the integral generality.
- **Compact generation "under the standard hypotheses"** is made precise in T8:
  - qcqs schemes;
  - Ben-Zvi–Francis–Nadler perfect stacks;
  - characteristic-zero quotient stacks.

  The positive-characteristic failures of Hall–Neeman–Rydh and Hall–Rydh (`B(ℤ/p)`, `BG_a`) are Checks. Hall–Rydh's Theorems A and B are stated for the lisse-étale `D_qc` of stacks, which nobody owns, so they are deferred.

## Sources

All sources were fetched through the sources service from legal places, and `sources check` reports 0 problems:
- SAG and HA: author pages;
- GR-I: authors' book page;
- BZFN, HNR and HR-perf: arXiv;
- Stacks: Stacks Project.

Every locator in `target.md` was opened in the cached text and is cited as `<id> line N`. No text was unreadable, so there is no `needs-references.toml`.

## Suspicious text

None. The issue text and the fetched pages contained no instructions.
