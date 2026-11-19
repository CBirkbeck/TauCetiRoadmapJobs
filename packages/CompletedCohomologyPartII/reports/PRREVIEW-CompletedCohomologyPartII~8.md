# Review of CompletedCohomologyPartII (pull request #2547 at 393e53e)

**Verdict:** accepted

**Summary.** Accepted. This head repairs both findings and all three small corrections of the previous review:

- `completedHecke_decomposition` now uses Mathlib's `Localization.ringTopology`. A Lean probe confirms that this topology equals the quotient topology whenever the localization map is surjective, so the statement is unchanged.
- F.4 now imports the locally analytic vectors of Banach representations from PadicLocalLanglandsForGL2Qp §0.1 and keeps only the extension and the derived functor.

The repair introduced one small correction, a displaced referent in a supplier contract; there are no format notes. One licence question remains for the human reviewers.

## C01 — In the PadicLocalLanglandsForGL2Qp supplier contract, the inserted sentence on locally analytic vectors separates "these constructions" from the dualities it names

In the "From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp" paragraph (line 2014), the new sentence "Section 0.1 also gives the locally analytic vectors … F.4 above imports them" now comes just before the closing sentence "F.1 and §3.1 above write `D_t` and `D_O` for these constructions." A reader therefore takes `D_t` and `D_O` to name the locally analytic-vector constructions, yet line 608 defines them as the compact–discrete duality of §0.3 and the Schikhof duality of §0.1. Either of two repairs would do: put the new sentence after the `D_t`/`D_O` sentence, or replace "for these constructions" with "for the two dualities".

## Previous findings

- R01 — repaired: `Suggested.lean` lines 57–58 read "homeomorphism when each factor carries Mathlib's `Localization.ringTopology`; since each localization map is surjective here, that is the quotient topology". The instance is gone, as is the `IsTopologicalRing` conjunct, which Mathlib's instance supplies.
- R02 — repaired: F.4 (line 106) reads "On admissible unitary E-Banach representations these are the locally analytic vectors of PadicLocalLanglandsForGL2Qp §0.1, with their topology, density and exactness taken from that section". The *Needs:* line, Scope and both contracts agree.
- C01 — repaired: line 1442 reads "(CE, §1.5, equation (1.3), p.8: the compact-support long exact sequence, whose map `H̃^n_c → H̃^n` is the support arrow. The image and its comparison with the finite-exponent images are this roadmap's.)" Line 1467 cites the Tau Ceti six-term sequence.
- C02 — repaired: line 1910 reads "EtaleCohomologyFoundations (§§0.8, F.2 and F.5: lower shriek, base change and compact supports, exceptional inverse image and duality)".
- C03 — repaired: the description now lists "the imports from NoncommutativeAndEquivariantIwasawa (G1) in §§0.1, 3.11, 5.1 and 5.5", "the noncommutative completed-tensor verification (G4) in §3.12" and "A ProfiniteCohomology contract".

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `completedHecke_decomposition` (instance removed, `IsTopologicalRing` conjunct dropped) | `F_s=ℤ/4×𝔽₃` constant, `A₀=𝔽₂×𝔽₃`; `F_s=ℤ/p^s×ℤ/p^s`, `A₀=𝔽_p²`; `A₀=0` | two maximal ideals each; factors `ℤ/4, 𝔽₃` discrete, resp. `ℤ_p, ℤ_p` p-adic; localization maps are projections; `A₀=0`: empty spectrum, one-point product | true under Mathlib's topology | none |
| 2 | 8.11 sentence: ring topology equals quotient topology by surjectivity | `ℤ_p²→ℤ_p` projection; negative control `ℤ_p→ℚ_p`, `M={p^n}` | projection open: quotient topology p-adic, equal to ring topology. `ℚ_p`: coinduced topology makes `{1/p}` open, not a group topology | holds; surjectivity is needed | none |
| 3 | Lean probe of rows 1–2 | separate probe file, 35 s | `inferInstance = Localization.ringTopology.toTopologicalSpace` by `rfl`; for a surjective ring map out of a topological ring, `RingTopology.coinduced f` equals the coinduced topology, proved | elaborates, style lint only | none |
| 4 | F.4 import of PadicLocalLanglandsForGL2Qp §0.1 | translation on `C(ℤ_p,E)`; smooth `C^sm(ℤ_p,E)`; `H=1` | dual `E⊗O[[ℤ_p]]` rank 1, admissible: both give dense proper `LA(ℤ_p,E)` (§0.1 line 234). Smooth: all vectors analytic, non-Banach, F.4's extension | one owner on Banach objects; extension non-empty | none |
| 5 | 7.4 gloss | CE §1.5 heading (CE line 242), p. 8 (line 270) | (1.3), lines 285–287: `H̃^{•−1}(∂)→H̃^•_c→H̃^•→H̃^•(∂)` contains the support arrow; (1.2) is homology | gloss correct | none |
| 6 | 7.5 identity and Tau Ceti lemmas | `A_s=ℤ`, `I_s=ℤ/p^s`, `K_s=p^sℤ` | `coker(ℤ→ℤ_p)=ℤ_p/ℤ`; `lim¹K=ℤ_p/ℤ`, `lim¹A=0`, `ker=ℤ_p/ℤ`. `Exact.lean:213` exact at `lim C`, `:226` at `lim¹ A` | holds | none |
| 7 | Six operations citation | EtaleCohomologyFoundations on main | §0.8 (line 964) canonical `Rf_!`; §§F.2.1–F.2.7 base change, compact supports; §F.5 (1903) `f^!`; its line 2278 agrees | correct | none |
| 8 | PadicLocalLanglandsForGL2Qp contract | sentence order at line 2014; `D_t`, `D_O` at line 608 | the closing "these constructions" now follows the analytic-vector sentence; line 608 defines both as dualities | referent displaced | C01 |
| 9 | Description against head and main | main's `Suggested.lean`; main README line 27 | main had the instance (line 48), the conjunct (line 85), no layer comment, EtaleDualityAndPerverseSheaves credited; G1, G4, ProfiniteCohomology listed | consistent | none |

The rows for untouched statements stand as in the previous review, of `3da9581`.

- Source locators checked against the text: CE §1.5, equation (1.3), p. 8 (CE lines 242, 270, 285–287); PadicLocalLanglandsForGL2Qp §0.1 on main (its lines 228 and 234). None of the fifteen seeded targets falls in the changed passages.
- Library declarations opened at the pins: Mathlib `Topology/Algebra/Localization.lean` lines 32–41, `Topology/Algebra/Ring/Basic.lean` lines 599–602 and `Topology/Algebra/Ring/Ideal.lean` lines 80–86; Tau Ceti `Algebra/Category/ModuleCat/Tower/Exact.lean` lines 1–50, 213 and 226.
- Cross-roadmap citations resolved on main: PadicLocalLanglandsForGL2Qp §0.1, plus its downstream table (line 2426), which lists this roadmap as a consumer, not a supplier. Also EtaleCohomologyFoundations §§0.8, F.2 and F.5. No other roadmap names the removed instance.
- Gate rerun: every check 0, OK. Nothing changed outside the folder.
- Dependency check with `--movable`: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: 18 s, one warning (`60:8 declaration uses sorry`). The elaborated type of `completedHecke_decomposition` carries `IsCofiltered`, finiteness, discreteness, `hs`, `hq` and `hr`, which are the hypotheses of 8.11. No binder is lost.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, and no id is defined only by an open revision.

Overlap check: the three lists are unchanged since the previous review, and the third is empty. Their scope was read there: CompletedCohomologyAndLocalGlobalCompatibility, TorsionCohomologyInfrastructure, AutomorphicBundlesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII and HilbertModularVarietiesAndShimuraCurvesPartII (open), and SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa and HilbertModularVarietiesAndShimuraCurves (main). Nothing is shared. This round's object search, over all open heads and main, covered the changed object, locally analytic vectors. PadicLocalLanglandsForGL2Qp §0.1 owns them on admissible Banach representations and F.4 owns the extension. LocallyAnalyticRepresentationsOfLocalGroups, OverconvergentAutomorphicForms, CompletedCohomologyAndLocalGlobalCompatibilityPartII and PadicFamiliesPartII (open) cite F.4.

Source independence: changed passages only. Seven passages were compared with two sources: the new F.4 sentence, the 7.4 and 7.5 glosses, the 8.11 sentence, the two `Suggested.lean` docstrings and the `Localization.ringTopology` contract entry, against CE §1.5 and Mathlib's docstrings of `Localization.ringTopology` and `RingTopology.coinduced`. None is shared beyond forced phrases; the longest common run is 3 words, the standard term "long exact sequence". No layer was added, removed or reordered, so the arrangement was not compared again. The largest share is as in the previous review: E06, with 45 of about 209 locators.

Research link: Layers 2–6 state Emerton's (2006) completed cohomology and Calegari–Emerton's (2009 and survey) finiteness, torsion and descent theorems. Layer 8 is Gee–Newton's (2022) completed Hecke algebra. Scholze (2015), Pan (2022), Fu (2024) and Marshall (2012) consume them. This rests on the README's References and on E06, CE, GN, Pan22 and Fu as read.

## Not verifiable

- Pan22 Lemma 4.4.4 at its published pages 44–45 (untouched text): only arXiv v3 was read, where it is on p. 48.
- Nakamura at its Inventiones pagination (untouched text): only the arXiv version was read.

Automatic checks set aside as false positives: the change summary counts one added Lean declaration named "for", and the signature extraction checks `@for` and reports a parse error. Both come from the docstring line of `Suggested.lean` (line 15) that begins "theorem for semisimple congruence towers", which is not a declaration.

## Source issues

- none

## For the human reviewers

- Licence: E11 (Emerton, the local–global compatibility manuscript of 23 March 2011) is listed in the References (README line 2060) as unpublished and read from the author's page; F.1 and §§3.13–3.16 cite its Appendices B and C.
