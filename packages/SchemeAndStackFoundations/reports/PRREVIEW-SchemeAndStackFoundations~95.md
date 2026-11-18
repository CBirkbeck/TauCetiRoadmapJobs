# Review of SchemeAndStackFoundations (pull request #2489 at 6c65b01)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The previous finding and its four small corrections and format note are all repaired. The quasi-separated base and target are now hypotheses of base change and of Serre's criterion. The new proof routes are correct, and their new locators (Stacks 03GN and 0ABS, EGA IV₃ 8.11.1, Alper §2, Rydh p. 30) say what is cited. One small correction remains, not blocking: the new route for `integral_point_descent` (§0.9) cites EGA and Stacks for two steps that the pinned Mathlib already proves. Nothing is left for a human to decide.

## C01 — The new route for `integral_point_descent` (§0.9) cites EGA and Stacks for two steps the pinned Mathlib proves, and its *Needs:* line names neither

Someone implementing the route in §0.9 (README lines 1299–1302) is sent to EGA IV₃, Theorem 8.11.1 and to Stacks, Lemma 29.42.9 (03GN). Mathlib at the pin already has both steps:

- `AlgebraicGeometry.UniversallyClosed.of_comp_surjective` (`Mathlib/AlgebraicGeometry/Morphisms/UniversallyClosed.lean:75`): if `f ≫ g` is universally closed and `f` is surjective, then `g` is universally closed. With `IsIntegralHom` for `S' → S`, this gives the properness of `Z → S`.
- `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` (`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:373`): a proper, locally quasi-finite morphism of schemes is finite.

The *Needs:* line (line 1307) lists only `Limits`, `LocallyOfFinitePresentation` and `Scheme.Hom.normalization`. Adding these two names to the route, next to the citations, and to the *Needs:* line would point the implementer to the library.

## Previous findings

- R01 — repaired: "*.baseChange_scheme*: for `Y` over a quasi-separated scheme `S` …"; *iff_isAffine* "with `Y` quasi-separated"; *Groups.IsLinearlyReductive.baseChange* "with `S` quasi-separated"; the converse of the fifth Check "for `S` quasi-separated" (lines 3891, 3904, 3936, 3982).
- C01 — repaired: "after base change to a scheme the diagonal of `BG → S` is the algebraic space of isomorphisms between two `G`-torsors" (line 3920).
- C02 — repaired: §1.22a's *Needs:* reads "§1.18–§1.22" (line 3948). *IsTame.iff_isCohomologicallyAffine* now sits in §1.23, whose *Needs:* adds §1.22a (lines 4028–4031). No edge runs from §1.22a to §1.23.
- C03 — repaired: §1.20 now says "call `f` *quasi-separated* when its diagonal, representable by algebraic spaces (§1.19), is quasi-compact and quasi-separated … (Stacks, Definition 101.4.1 (04YW))" (lines 3665–3668). §1.22a refers to it.
- C04 — repaired: `S` is now "Noetherian, normal and integral", the statement comes with a route, and Klevdal–Patrikis is cited as the case `S = Spec O_E[1/N]` with a Galois extension (lines 1296–1304).
- N01 — repaired: "From Tau Ceti" lists the two comodule lemmas with `Exact.lean:54` and `Fixed.lean:184`, and the four lemmas the Checks use. "From Mathlib" lists `Scheme.IsQuasiAffine` (lines 467–540).

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.9 `integral_point_descent` (now `S` integral) | `S = Spec ℤ`, `X = 𝔸¹`, `L = ℚ(i)`, `x = 3`; `S = Spec k[t²,t³]`, `X = Spec k[t]`; `X = Spec ℤ[1/2]` | `Z = V(x−3) ≅ Spec ℤ`, an isomorphism; `id` is an `S'`-point with no section, so normality is needed; `2` is not a unit in `ℤ[i]`, so neither side has a point | Pass; C01 |
| §0.9 route steps | 03GN (p. 96); EGA 8.11.1 (p. 41); finite birational over normal | `S' → Z` onto with `S'` integral, so `Z` proper; fp over a Noetherian base; `A ⊆ B ⊆ K` with `B` finite gives `B = A` | Pass |
| §1.20 quasi-separated morphism of stacks | `id_X`; `BG → S`, `G` fp; `f` a morphism of spaces; `𝔸¹_ℂ/ℤ` | `Δ` an iso; `Isom(P,Q)` fppf-locally `G`, qcqs; `Δ_f` a monomorphism, so this is §1.9's quasi-compact diagonal; diagonal not quasi-compact | Pass |
| *.baseChange_scheme* (`S` qs) | `B𝔾_m`, `ℤ → 𝔽_p`; `S = Spec k`, `S'` = `𝔸^∞` with doubled origin | graded invariants stay exact; two affine pieces, *.descend* along an open cover, `S'` need not be qs | Pass |
| *iff_isAffine* (`Y` qs) | `𝔸²∖0 → 𝔸²`; chart `𝔸¹ ⊂ ℙ¹`; `Y = 𝔸¹_ℂ/ℤ` | `H¹ ≠ 0`, both sides false; qc open immersion, quasi-affine (0ABS); excluded, as its affine chart is not qc | Pass |
| `BG → S` diagonal | `G = 𝔾_m`; `G = E` abelian | `Isom` an affine `𝔾_m`-torsor; `Isom` an `E`-torsor, an algebraic space | Pass |
| *Groups.IsLinearlyReductive.baseChange* (`S` qs) | `ℤ/p` over `ℤ[1/p] → ℚ`; `𝔾_m`, `ℤ → 𝔽_p`; `GL_2/ℤ` | true and true; true and true; false over `ℤ`, so nothing is claimed | Pass |
| Fifth Check, converse (`S` qs) | `𝔾_m` on `𝔸²∖0`; `𝔾_m` on `𝔸²` | `[X/G] = ℙ¹` not cohomologically affine, `X` not affine; cohomologically affine, `X` affine | Pass |
| *IsTame.iff_isCohomologicallyAffine* (moved to §1.23) | `B(ℤ/p)`, `Bμ_p` over `𝔽_p` | augmentation `N ↦ p = 0`, both false; degree-zero part exact, both true | Pass |
| Supplier contracts (N01) | 6 Tau Ceti names, `Scheme.IsQuasiAffine` | all declared at the pins, in the stated namespaces and at the stated lines | Pass |

The rows for statements the change does not touch stand as in the previous review, of e101833.

- Source locators checked this round (10): Stacks 03GN (Lemma 29.42.9, p. 96), 0ABS (Lemma 67.52.2), 04YW (Definition 101.4.1(4)); EGA IV₃ Theorem 8.11.1, p. 41; Klevdal–Patrikis footnote 8, p. 21; Alper §2 p. 2353, Proposition 3.3 and Remark 3.4 p. 2357, and the proof of 3.10(iv) p. 2360; Rydh 2015, (8.7) p. 29 and the remark after it, p. 30 (rydh-2015 line 1334).
- Library declarations opened (11). Mathlib: `UniversallyClosed.lean:75`, `ZariskisMainTheorem.lean:358` (the instance making `toNormalization` an open immersion, the scheme case of 0ABS) and `:373`, `QuasiAffine.lean:34`. Tau Ceti: `Exact.lean:54`, `Fixed.lean:184`, `DiagonalizableGroup/Scheme/LinearlyReductive.lean:43`, `AdditiveGroup/LinearlyReductive.lean:51`, `LinearlyReductive/FiniteSubgroup.lean:81`, `GeneralLinear/LinearlyReductive/Basic.lean:232`.
- Cross-roadmap citations: StackPointsAndResidualGerbes gap:stack-separation-axioms (main, README lines 389–395). No roadmap on main or at an open head cites §1.22a, the cohomologically affine names or `integral_point_descent`.
- Automatic checks: the gate rerun reports every counter zero (OK). The dependency check reports `depcheck: 214 roadmaps, 2371 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` exits 0 in 96 s, with 48 warnings, all `sorry`. `Suggested.lean` is byte-identical to e101833, so the earlier one-tactic probe and the binder comparison stand.
- Seeded sample: none of the fifteen sampled sections lies in the changed passages, so they were not re-checked this round. The README flags no locator as unverified.

Overlap check: searched all open heads and main by object (04YW / 101.4.1, "cohomologically affine", §1.22a, `integral_point_descent`). The scopes of QuasicoherentSheavesOnPrestacks, FunctorOfPoints, PurityForFlatCohomology, VirtualFundamentalClassPartII, LocalPurity (open), StackPointsAndResidualGerbes, AlgebraicModuliForArithmeticGeometry and JacobianChallenge (main) are as read in the previous review. Shared: quasi-separated morphisms of algebraic stacks, owned here in §1.20, which StackPointsAndResidualGerbes' gap asks for. Nothing else is shared.

Source independence: changed passages only. 9 passages were compared with 5 sources (Stacks, EGA IV₃, Klevdal–Patrikis, Alper 2013, Rydh 2015), and none shares wording beyond forced definitions. The base-change route follows the step order of Alper's proof of 3.10(iv) (p. 2360), as the argument requires, with no run longer than three words. The largest share is the Stacks Project, about 850 of about 1050 locators. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: §1.22a is the notion underlying Alper's good moduli spaces (Alper 2013) and the Luna étale slice theorem (Alper–Hall–Rydh 2020). §1.23's tame stacks (Abramovich–Olsson–Vistoli 2008) and Keel–Mori (Rydh 2013) are its finite case. This rests on the README's sources and on alper-2013 §§3, 12.

## Not verifiable

- none. Every locator in the changed passages was read in the cached legal texts (numdam, arXiv, Stacks Project).

## Source issues

- none

## For the human reviewers

- none
