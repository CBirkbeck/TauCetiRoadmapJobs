# Review of LocalFieldsRamificationPartII (pull request #2258 at 9712531)

**Verdict:** needs changes

Incremental re-review of the 94 lines changed since `68e1c85`.

## R01 (P2) — The module headline keeps a Prüfer hypothesis that the newly cited proposition and the newly owned flat-locus theorem remove

**Location:** TauCetiRoadmap/LocalFieldsRamificationPartII/README.md:813–817 and Suggested.lean:83–94: “Prove `module_finitePresentation_of_flat_of_valuationRing_localization`: for a Prüfer domain `A` … `M` is finitely presented over `B`.”
**Claim:** README:795 now cites Stacks Proposition 38.13.10(1); part (2) of the same proposition is this module statement for every domain, and it follows in two lines from the flat-locus theorem that README:798–802 now owns. The hypothesis `hA` narrows the headline below the cited source. The previous review's repair text asked to keep the module theorem as scoped; with the general-domain inputs now owned here, that scoping no longer has a reason.
**Witness:** stacks-more-flatness lines 2020–2026 (Proposition 13.10(2), proved from Lemma 13.7). Instance: `A = k[x,y]`, `B = M = A`: flat, finite, finitely presented, yet excluded by `hA` (`A` is not Prüfer, README:834–835).
**Repair:** In `Suggested.lean` replace the theorem by `module_finitePresentation_of_flat_of_isDomain` with the same binders and no `hA` (this signature elaborates at the pins, `sorry` the only warning), docstring “Stacks, Proposition 38.13.10(2), tag 053G”. In README §1.5 replace the paragraph “*Modules over Prüfer domains.*” by: “*Modules over domains.* Prove `module_finitePresentation_of_flat_of_isDomain`: for every domain `A`, finite-type `A`-algebra `B` and finite `B`-module `M` flat as an `A`-module, with compatible actions, `M` is finitely presented over `B` (Stacks, Proposition 38.13.10(2), tag 053G). Route: for a surjection `C = A[X_1, …, X_n] → B` the flat-locus theorem with `N = M`, `g = 1` makes `M` finitely presented over `C`, hence over its quotient `B`. The valuation-ring and Prüfer cases also follow from homogenization and graded finite presentation: …” (keep the existing torsion-free route as the second route). Add the Check “`A = k[x,y]`, `B = M = A`: one generator, zero relations, `A` not Prüfer”. Update the three places that say “modules flat over Prüfer domains / a Prüfer base” (README:37–38, Suggested.lean:30–31 and the layer comment at :73), the section title, and the pull-request description's sentence “while the module headline retains the Prüfer hypothesis”.

## Previous findings

- R01 — repaired: “Prove `finitePresentation_of_flat_of_isDomain`: for every domain `A` and every finite-type `A`-algebra `B` flat over `A`, `B` is finitely presented over `A`”; `hA` is gone from the Lean statement; the flat-locus theorem and its local input are owned in §1.5. The module half is R01 above.
- R02 — repaired: “Write `H_p = (ℚ, v_p)ʰ ⊂ ℚ_p` for the henselization of the rational field at a prime `p` (§1.3)” (README:140); no `ℚ_pʰ` or `ℚ_7ʰ` remains (11 occurrences replaced in §§1.4, 2.8, 4.1–4.3 and the Layer 4 Examples).

## Verified sound

| Statement | Instances tried | Computed input / left side | Computed output / right side | Result; change |
|---|---|---|---|---|
| §1.5 algebra headline `finitePresentation_of_flat_of_isDomain` | `A = k[x,y]`, `B = A[T]`; `B = 0`; `A = k[t]`, `B = A/(t)` | Flat T, T, F; finite type T in all | Finitely presented T (1 generator, 0 relations); T (`A/(1)`); hypothesis fails, no claim | Agrees; retain |
| §1.5 algebra headline, domain hypothesis | `A = ∏_ℕ 𝔽₂`, `B = A/⊕_ℕ 𝔽₂` | Flat T, finite type T, domain F | Finitely presented F (kernel not finitely generated) | Hypothesis needed and present |
| §1.5 flat-locus theorem (Stacks 38.13.7) | `R = C = k[t]`, `N = R/(t)`; `N = C` | WeakAss(R) = {(0)}; flat locus `D(t)`; `Spec C` | `N_t = 0` finitely presented and flat; `C` has 1 generator, 0 relations | Agrees with README:836–838 and source line 2001–2005 |
| §1.5 flat-locus theorem, finiteness hypothesis | `R = C = ∏_ℕ 𝔽₂`, `N = R/⊕_ℕ 𝔽₂`, `g = 1` | `U = Spec C`; weakly associated primes: the infinitely many principal maximal ideals `(1 − e_i)` | `N` not finitely presented | Hypothesis needed and present |
| §1.5 local input (Stacks 38.10.9), no hypothesis on `R` | Same Boolean example, `q ⊇ I` and `q ⊉ I` | `N_q = 𝔽₂ = C_q`; `N_q = 0` | Finitely presented over `C_q` in both cases | Agrees; source line 1416–1418 |
| §1.5 weakly associated primes of a domain | Domain `A`, element `a ≠ 0` and `a = 0` | Ann = `0`; Ann = `(1)` | Primes minimal over them: `(0)`; none | WeakAss(A) = {(0)}, as README:808 says |
| §1.5 route to the algebra headline | `C = A[X]`, `N = B = C/I`, `g = 1` | `B` flat over `A` gives `U = Spec C` | `C/I` finitely presented `C`-module ⇒ `I` finitely generated | Agrees |
| §1.5 module headline | `A = k[x,y]`, `B = M = A` | Flat T, finite T, `hA` F | Finitely presented T (1 generator, 0 relations) | Excluded without need; R01 |
| Conventions: `H_p` | `H_p` and `ℚ_p` | `H_p` algebraic over `ℚ`, countable; `ℚ_p` uncountable, `(ℚ_p)ʰ = ℚ_p` | Complete F; T | Agrees; §4.1 Check now reads true |
| §1.4 Check, §2.8 Check (notation only) | `ℚ(√2)/ℚ` at 7 | `dim_{H_7}(L ⊗ H_7) = 2` | `H_7 × H_7` has dimension 1 + 1 | Agrees |
| §4.2, §4.3 Checks (notation only) | `L = H_p(√p)`; `E = ℚ(p^{1/ℓ})` | `[L : H_p] = 2`; `[Eʰ : H_p] = ℓ`, `e = ℓ` | `E = ℚ(√p)`, degree 2; tame, not purely wild | Agrees |

The rows for untouched statements stand as in the previous review, of `68e1c85`.

- Source locators checked against the text: 4 (stacks-more-flatness lines 1416–1418, 1975–1981, 2001–2005, 2020–2026); hypotheses and conclusions agree with README:793–806. Of the seeded sample only §1.4 and §2.8 fall in changed passages, and there only the notation `H_7` changed.
- Library at the pin: no declaration proves the domain theorem (`Algebra.FinitePresentation.of_finiteType`, Mathlib/RingTheory/FinitePresentation.lean, needs `IsNoetherianRing`); `infer_instance`, `simp` and `exact` with that lemma all fail on `finitePresentation_of_flat_of_isDomain`. No Stacks tag 053G, 053E, 05IL, 05I7 or 05IK occurs in the pinned Mathlib or Tau Ceti.
- Ownership: `roadmaps grep` for the tags and for flat finite-type finite presentation finds no other roadmap, open or on main, stating the domain theorem or the flat-locus theorem (AdicSpacesPartIII's `isTopologicallyFinitePresentation_of_flat` is the topological statement over a rank-one base).
- Signatures: the elaborated type of the changed declaration equals README:793–794 (domain, finite type, flat; no lost binder); 16 declarations, 0 names missing either way.
- Gate at this head: every check passed (the worker's record, and a rerun). Dependency check: `depcheck: 221 roadmaps, 1962 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: 9 `sorry` warnings, nothing else.
- Outside-folder changes: 0. Title and description agree with this head, including the general-domain algebra headline, the retained Prüfer module headline and `H_p`; no supplier added or dropped.
- Remark (no change asked): the paragraph label “*Valuation rings and Prüfer domains.*” (README:787) now heads the valuation-ring statement only.

Overlap check: read AdicCoefficientsAndComparisonsPartII, EtaleDualityAndPerverseSheavesPartII, LocalFieldsRamification, QuadraticFormInvariantsPartII, DiamondEtaleCohomology, RamificationOfCompleteDiscretelyValuedFields, PadicExtensionFamilies as in the previous review; the change adds one owned object, the flat-locus finite-presentation theorem with its local input, which none of them states; nothing shared.

Source independence: changed passages only; 5 passages compared with 1 source (stacks-more-flatness), none shared beyond what the mathematics forces; largest share temkin17, unchanged; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- rg71, Corollaire 3.4.7: settled uncertified; the statement was checked against stacks-more-flatness lines 2020–2023 instead.
- serre-cg: settled uncertified; not touched by the change.

## Source issues

- none

## For the human reviewers

- aid25 is cited as arXiv:2511.07177v1, without a published venue (TauCetiRoadmap/LocalFieldsRamificationPartII/README.md, References); §1.1 also cites the published temkin17 statement. Publication and licence status of this preprint remain for human review.
