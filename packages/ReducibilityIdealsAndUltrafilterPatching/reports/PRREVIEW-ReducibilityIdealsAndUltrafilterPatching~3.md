# Review of ReducibilityIdealsAndUltrafilterPatching (pull request #2900 at d0524ae)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ReducibilityIdealsAndUltrafilterPatching/`
**Verdict:** accepted

**Summary.** Accepted. The one finding of the previous review is repaired. Patching up to an element (6.13 (2)) is now stated in `Suggested.lean` with Mathlib's weakly regular sequences, and the README explains with Stacks locators why that is the same condition as quasi-regularity in this setting. The argument holds up against the Stacks text, the statement matches the README hypothesis by hypothesis, and the file elaborates with `sorry` as its only warning. One small correction remains, carried over: 6.14 and the targets resting on the formalization still lack exact locators. It does not block. The humans still have to decide the scope and licence questions about the unrefereed formalization that most targets rest on.

## C01 — 6.14 and the targets resting on [FormalProof] still have no exact locator

A reader cannot check 4.9's steps (g1)–(g3), or 6.15 and 6.16 (whose routes are not given), against anything. [FormalProof] is still cited only as a whole repository, with no file or declaration named (lines 250, 304, 578, 587 and 660). Section 6.14 cites no source at all: its route, lines 560–566, rests only on DeformationAndDerivedPatchingAlgebra §1.9. The repair added locators and a route for 6.13 (4) only. The fix would be to name, for each such target, the declaration of the formalization that proves it, and to give a source (or that formalization) for 6.14.

## Previous findings

- R01 — repaired: "Clause (2) is stated in `Suggested.lean` as `exists_patched_module_up_to_element`, with the weakly regular form of quasi-regularity." The README's equivalence clause and the module docstring were updated to match.
- C01 — repaired: "the free profinite group of ProfiniteProPGroups Layer 4, with its universal property" (line 499; also lines 530, 595, 607 and 640, the last naming `TauCeti.freeProfiniteGroup` and `TauCeti.freeProfiniteGroup.lift`).
- C02 — repaired: "the bound fails when `k` has infinite dimension over its prime field (every infinite `k` of characteristic `p`)".
- C03 — partly repaired: 6.13 (4) now has "(Stacks, Tags 09B8, 05GG and 031D)" and a route, but 6.14 and the [FormalProof] targets have no exact locator yet; carried as C01.
- C04 — repaired: the description reads "the order `length(M/aM) − length(M[a])` … `M[a]` being the kernel of `a`".
- N01 — repaired: "(Mathlib's `Ring.ord O d`, the normalized valuation of `d` by `Ring.ord_eq_addVal`)"; the Lean conclusion now ends `+ Ring.ord O d`.
- N02 — repaired: "where `L∖i` is `L` without its `i`-th entry (`Δ_{L∖i}` depends only on its degrees)".

## Verified sound

| Statement | Instances tried | Values computed (README / mine) | Result |
|---|---|---|---|
| 3.16 (11), reworded | `c = 1`, `R = M = O[x,y]`, `β = π`, `L = ((1,πx),(1,πy))` | `χ(L;M)(d) = (d+1) − (d−1) = 2`; bound `(1+1)·Δ_{(1)}H_{k[x,y]} = 2`; (10): `1·1 + χ((1,x),(1,πy)) = 1+1` | agrees |
| 3.17 Lean with `Ring.ord` | `M = O, a = π`; `M = O/πⁿ, a = 0`; `M = 0` | `1 = 0 + ord π = 1`; `n = n + ord 1 = n`; `0 = 0 + 0`; `ord` unfolds to `length(O/(d))` | agrees |
| 3.17 `Ring.ord_eq_addVal` | `d = π`, `d = 0` | `ord π = 1 = addVal π`; `ord 0 = length O = ⊤ = addVal 0`; lemma has no hypothesis on `d` | agrees |
| 4.8 (3) remark, reworded | `k = 𝔽_p(t)`; `k = ℚ(t)`; `k = ℚ` | `𝔽_p`-, `ℚ`-linear `k² ↪ k` exist: bound fails; for `ℚ`, additive = `ℚ`-linear, `2 ≤ 1` impossible: bound holds | agrees |
| 6.13 (2) quasi-regular ⇔ weakly regular | `𝕄 = 0`; `𝕄 = 𝔹 = E[[σ]]`; proof of 061S with 00IQ (2) | both hold on `0`; `σ` regular, `gr = (𝕄/σ𝕄)[X]`; `x ∈ J^r∖J^{r+1}` by 00IQ (2), so `σ₁x ≠ 0` | agrees |
| 6.13 (2) Lean, `s = 0` | `S_∞ = Λ`, `σB = ⊥`, `𝔹 ≅ R_f` | `𝕄 = 𝒳_f`; empty list regular; `f^{n+1}t^n𝒳 = 0` from `hmaps`, `hkill`, `𝔪_R^c(𝒳/𝔪_Λ^j𝒳) = 0` | holds |
| 6.13 (2) Lean, `f = 0`; `𝒳 = 0`, `M_N = 0` | `R_f = 0`; zero modules | hypotheses satisfiable; `𝔹 = 0` or `𝕄 = 0` meets every conjunct | true, not vacuous |
| 6.13 (2) Lean, `s ≥ 1` | candidate `𝕄 := 𝒳_f` | `σ₁` kills `𝒳_f`, so weakly regular only when `𝒳_f = 0`: conclusion not met trivially | has content |
| 6.13 (2) Lean, README Check | `R = O[[σ,y]]/(y(y−ϖ))`, `f = y` | `R_y = O[[σ]][1/ϖ]`, `𝔹 = lim E[σ]/σ^k = E[[σ]]`, `𝕄 = 𝔹`, `𝕄/σ𝕄 = E = 𝔹 ⊗ 𝒳` | agrees |
| 6.13 (2) Lean against README | elaborated type, clause by clause | every README hypothesis present; `𝕄` keeps only its `𝔹`-structure; all inputs in one universe | matches |
| 6.13 (2) one-tactic probe | `simp`; `refine ⟨inferInstance, ?_⟩; simp` | `simp` leaves the goal; no instance `IsNoetherianRing (AdicCompletion …)` at the pin | not padding |
| 6.13 (4) route | `S = ℤ`, `𝔶 = (p)`, `N_k = ℤ/p^k`; hypotheses of 09B8, 05GG, 031D | `lim = ℤ_p`, `N/p^kN = ℤ/p^k`, finite over `ℤ_p`; 031D's `⋂(𝔶Ŝ)^nN = ⋂𝔶^nN = 0` | agrees |
| 6.13 (1) supplier | ProfiniteProPGroups on main | Layer 4 heading line 706, construction 743, lift 792–795 | agrees |

The rows for statements the diff does not touch stand as in the previous review, of 5103bba.

- Source locators checked against the text (9): Stacks Tags 00LN (line 7642), 061R (7704), 061S (7720), 00IQ (5708), 00IP (5703), 00LF (7502), 09B8 (10837), 05GG (10560), 031D (10662); 05GI (10601) for the Jacobson radical step.
- Library declarations opened at the pins: Mathlib `Ring.ord` (`RingTheory/OrderOfVanishing/Basic.lean:37`), `Ring.ord_eq_addVal` (`OrderOfVanishing/Noetherian.lean:89`), `RingTheory.Sequence.IsWeaklyRegular` (`RingTheory/Regular/RegularSequence.lean:136`), the algebra structure on `AdicCompletion` (`RingTheory/AdicCompletion/Algebra.lean:103`); Tau Ceti `TauCeti.freeProfiniteGroup` and `TauCeti.freeProfiniteGroup.lift` (`Topology/Algebra/Group/Profinite/Free/Basic.lean:60, 124`).
- Cross-roadmap citations resolved: ProfiniteProPGroups Layer 4 (`Completed/`, main); DeformationAndDerivedPatchingAlgebra, DerivedModuleAlgebra, GrothendieckEulerForms and PadicLocalLanglandsForGL2Qp exist on main, as the description says. The consumer UniformWildKernelBounds cites §§4.8, 4.9, 6.10, 6.11 and 6.13 (1)–(3), and the change leaves all of these ids in place.
- Automatic checks: all passed. The dependency check printed `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (`lake env lean`): three `sorry` warnings only (lines 51, 77, 122). I compared the elaborated signatures with the README: no binder is lost.
- Changes outside the folder since 5103bba: none.

Overlap check: the scope of UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, LengthBoundsInPadicFamilies (open) and of DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings and PadicFamilies (main) was read in the previous review, and the change adds no object. No roadmap on main or open owns the equivalence of quasi-regular and weakly regular sequences: a search finds it only inside EnhancedDerivedSheaves's proof routes, which cite Stacks. Nothing is shared.

Source independence: changed passages only. I compared 5 passages with 1 source (Stacks, the seven tags above): the equivalence clause of 6.13 (2), the statement and route of 6.13 (4), the docstring of `exists_patched_module_up_to_element`, the `Ring.ord` sentence of 3.17 and the remark in 4.8 (3). None shares wording beyond formulas. No layer was added, removed or reordered, so the arrangement was not compared again. By locators, Stacks now has the largest share (7 tags, all in 6.13); [FormalProof] remains the attributed source of 8 of 11 targets, and its text could not be read.

Research link: 6.10–6.13 abstract the connectedness-dimension propagation and the patching of localized rings of Skinner–Wiles (1999, §5, App. A) and Allen–Newton–Thorne (2020, proof of Thm 5.1), used in residually reducible automorphy lifting; 4.9 is compared with the Wiles (1995)–Lenstra (1995) numerical criterion. This rests on the README References, ANT2020 and SkinnerWiles1999.

## Not verifiable

- [FormalProof]: the repository's host is in no licence class the sources service accepts, so 4.8–4.9, 6.10–6.13 and 6.15–6.16 were not compared with it.
- Fulton 1984, Appendix A (the docstring of `length_quot_eq_length_ker_add_valuation_det`): settled as uncertified and cited by locator only.

Automatic checks set aside as false positives: the rule that a pull request edits nothing outside its roadmap folder, which keeps stray changes out of a review, flagged the three files of the family index, but those files belong to this pull request; and the rule that suppliers come earlier in the merge order, which keeps the direction of supply single, reported that this roadmap is not yet listed there, which only means it is placed right after its last supplier. Neither is a defect.

## Source issues

- none

## For the human reviewers

- Scope: 4.8–4.9, 6.10–6.13 and 6.15–6.16 rest on [FormalProof], an unrefereed Lean formalization announced on 20 November 2026 (README lines 660–661); the Announcement presents only the Lean. The background sources (Skinner–Wiles, Allen–Newton–Thorne, Wiles, Lenstra, Stacks) are published.
- Not tested: [FormalProof], the attributed source of most targets, could not be read (its repository host is in no licence class). Wording and arrangement were not checked against it.
- Licence: could not be checked: the formalization's licence, and whether the three `Suggested.lean` declarations match declarations there in name, binders and statement.
