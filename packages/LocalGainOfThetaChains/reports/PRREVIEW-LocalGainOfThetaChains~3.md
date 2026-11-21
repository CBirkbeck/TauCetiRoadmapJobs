# Review of LocalGainOfThetaChains (pull request #2915 at 9e01e64)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** needs changes

**Summary.** Changes are still needed for one finding, carried from the previous review. 35 of the 38 targets marked *NEW* cite the formal proof only as a whole repository, among them every headline except 4.15c (R01). The three locators added at 4.15b–4.15d are accurate. The other repairs hold:
- the new bound on the excess `𝔵_v` in 4.14 is correct;
- 4.17b now states the `ℒ_f` sum in the form its consumer uses;
- `H^{½}` replaces `Re` consistently;
- `o` is defined.

Defining `o` shows that the threshold `x₀` of 4.17 must depend on it (C01). There is one small correction and one format note, neither blocking, and the human reviewers have the scope and licence questions of the previous round to decide.

## R01 (P2) — 35 of the 38 targets marked *NEW* still have no locator into the formal proof, and that includes the headlines 4.10, 4.11, 4.14, 4.16 and 4.17a

A reader still cannot check most of the roadmap's own statements against their only source. This matters most where the README gives no proof either: 4.14c′, 4.14d–4.14g, 4.15e, 4.16a, and the 16 passages that say a step is "not given here" or "not proved here".

The only paths into [FormalProof] in the README are at 4.15b (line 1072), 4.15c (line 1107) and 4.15d (line 1137). In all, 38 target sections carry *NEW*. I checked the three new locators at the pinned commit `ab0b752`, and each says what the README says it does:
- `Formalism.G0.WalkSharp` has exactly the hypotheses of 4.15b, over any commutative ring.
- `Formalism.G0.ManyOrbitsRefined` gives the exponent `Σ_v m(c_v + c₀)` and the count `d·m^{β+1}𝖾_{β+1}(κ)` of 4.15c.
- `Formalism.G0.TileConditionFailureProbBound` is the case of 4.15d with `ω₀ = 1` and the weaker tile condition, as stated.

So the remaining locators can be written in the same form. Give the declaration and its file after the *NEW* status, as at 4.15b–4.15d. Do this at least for 4.10, 4.11, 4.14, 4.16 and 4.17a, and for the targets whose route is not given.

## C01 — The threshold `x₀` of 4.17 depends on the index `o`, which its list of parameters leaves out

In 4.17 (lines 1358–1360), the hypothesis `δ_top|A| ≥ 16o²/ω₀²` is said to hold for `x ≥ x₀`, where "the thresholds `x₀` below depend only on `ε`, `c_s`, `ω₀`, `L_b` and the constants fixed before `ε`". With `o = [A : A₀] = ord ψ` (FrobeniusRestrictedRieszSums §0.4 (iii)), `δ_top|A| ≥ x^{2 + 8ε − ε/8} ≥ x²`. So the hypothesis needs about `x ≥ 4o/ω₀`, for instance `x ≥ 5.3·10⁶` when `o = 10⁶` and `ω₀ = 3/4`. Nothing in the list bounds `o`: `o` may be as large as `|A|`.

Nothing downstream breaks. ThetaChainsAndFrobeniusPrimeSums §10.6 fixes `ψ` before the constants, and ThetaChainsOnDefiniteUnitaryGroups §2.1 writes `x₀(ψ, ε)`. Still, the sentence should read "depend only on `ψ`, `ε`, …", or say that `ψ` is fixed before `ε`.

## N01 — Clause letters still run across sections out of order

Clause (f) stands in 4.9e (line 300), ahead of (d) and (e) of 4.9f (lines 322, 348). The letters would be easier to follow if they restarted in each section.

## Previous findings

- R01 — partly repaired: "[FormalProof] states it for modules over any commutative ring and any `π`: `Formalism.G0.WalkSharp`". Only 4.15b, 4.15c and 4.15d gained locators, so the point is written again as R01.
- R02 — repaired: "each term `(r^H_j − P_j − r⁰_j)₊` is at most `(γ_LTΣα_s − P_j)₊`, which is `0` when `γ_LTΣα_s ≤ P_j` and at most `γ_LTΣα_s − 1` otherwise (`P_j ≥ 1`)".
- C01 — repaired: "The floors satisfy `Σ_{p≤X″}(log p)·ℒ_f(p) ≤ C·f·X″·(N_m²·log 2a + log²2a)` (`C` absolute, for every `a ≥ 1`)". This is the form ThetaChainsAndFrobeniusPrimeSums §10.2 uses.
- C02 — repaired: "`C(e) := w^{−dep}H(L″) ∩ H^{½}(e) ∩ ⋂_{e′≠e, src e′ = L″}w^cH^{½}(e′)`". No `Re(` is left, and the gloss at lines 720–722 is consistent with 4.12 (b).
- C03 — repaired: the bullet on TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f is gone from the downstream consumers, and §4.19f remains a supplier (line 1571).
- C04 — repaired: "`o = [A : A₀]` is the index of the subgroup `A₀ ⊂ A` on whose cosets the coset profile is defined". The definition makes C01 of this report visible.
- N01 — not repaired: (f) still precedes (d) and (e). Written again as N01.
- Question on the tiles of 4.15d — answered: "among the next `M₀` tiles, counted cyclically among the complete tiles (the incomplete tile is skipped)". With this, the count `M₀ − 1` in (B) holds.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.14 (a), `𝔵_v ≤ mγ_LTΣα_s` (new route) | `m = 2`, `r⁰ = 0`, `γΣα = 15`, `P = (5, 20)`, `r^H₁ − P₁ = 9`; also `γΣα = 0.8`; `γΣα = 1.5`, `P_j = 1` | terms `≤ (10, 0)`, sum 9 `≤ 28`, `𝔵 = 9 ≤ 30`; all terms 0; sum `≤ 1 = 3 − 2`, `𝔵 ≤ 1 ≤ 3` | holds | none |
| 4.14b, `H^{½}(e_g)` = polynomials with integral lift | `k = 2`, degree-1 vector letter, source `𝒪²`, edge to `p^{−1}e₀𝒪 ⊕ 𝒪e₁` | `w^{−1}H(w^{−1}e₀𝒪 ⊕ 𝒪e₁)` = `{f₀ ∈ 𝒪, f₁ ∈ w^{−1}𝒪}` = lift-integral set; `h = [[1,1],[0,1]]` preserves it | holds | none |
| 4.14d, 4.14h, modulo `w^cH^{½}(e_g)` | `c = c_v ≥ c*`, `w² = p` | `w^cH^{½} ⊂ p^{c*/2}H^{½}`, as `DepthBound` asks | consistent | none |
| 4.15b against `WalkSharp` | hypotheses one by one; `m = 0` | 9 of 9 hypotheses match, formal adds `1 ≤ m`; `E = Σ(a+b+(m−1)c+mc₀)+βS` on both sides; `m = 0`: `P = M`, trivial | matches | none |
| 4.15c against `ManyOrbitsRefined` | `π = √p`, `c_v = 2⌈dep_v⌉`, `c₀ = 2(D_p+1)` | `Σm(c_v+c₀)` π-units = `Σm(⌈dep_v⌉+D_p+1)` p-units = `τ − e`; count `d·m^{β+1}𝖾_{β+1}(κ)` both sides | matches | none |
| 4.15d against `TileConditionFailureProbBound` | marked tile `s₀`, no marked tile among next `M₀` | formal `j ≤ M₀` holds, README fails: formal weaker; `markedBound` = README term at `ω₀ = 1` | as stated | none |
| 4.15d cyclic counting, 4.15f distance | `(M₀+1)` complete tiles; incomplete tile skipped | gap `≤ (M₀+2)(6r+1)u < G′ = (M₀+5)(6r+1)u` | holds | none |
| 4.17, `o` and `x₀` | `ω₀ = 3/4`, `o = 1`, `o = 10⁶` | `δ_top|A| ≥ x²` vs `16o²/ω₀²`: `x ≥ 5.3` vs `x ≥ 5.3·10⁶` | `x₀` depends on `o` | C01 |
| 4.17b, `ℒ_f` sum | `a = 1, p = 2`; `2a ∈ [2, 202]`; `a = 2²⁰` | `lg_2(2) = 2 ≤ 3log2 = 2.08`; `max lg_2(y)/log y = 2.885 ≤ 3`; `22 ≤ 43.7`; `Σlog p ≤ log4·X″` | holds | none |
| Summary (4), `ℒ` over `p ≤ X″` | `X′ ≤ p ≤ X″` | `ℒ(p) = C(Sc+k+ϑ)lg_p(2a)` there; total `≤ C₁b + Cb` | holds | none |
| Formal-proof locators | the 38 *NEW* sections | 3 carry a path and declaration; 35 none | partly repaired | R01 |

The rows for statements the change does not touch stand as in the previous review, of `e3878a8`.

- [FormalProof] at commit `ab0b752`: opened `src/Formalism/SubspaceCounting/Statement.lean` (`WalkSharp`) and `GoodOrbitIntervalTileCondition.lean` (`ManyOrbitsRefined`, `TileConditionFailureProbBound`, `CondTiles`). Also opened the proofs in `SubspaceCountingProofs/`: `WalkSharp.lean:722`, `ManyOrbitsRefined.lean:434` and `ChoiceOfTopsRefined.lean:590`, none containing `sorry`.
- Library: Mathlib `Chebyshev.theta_le_log4_mul_x` (`Mathlib/NumberTheory/Chebyshev.lean:191`).
- Citations resolved at the open heads:
  - FrobeniusRestrictedRieszSums §0.4: `A₀ = ker(ψ|_A)`, `[A : A₀] = o`.
  - FrobeniusRestrictedRieszSums §0.7: the hypothesis `δ_top|A| ≥ 16o²/ω₀²`.
  - ThetaChainsAndFrobeniusPrimeSums §10.2, which uses the `ℒ_f` bound as now stated.
  - ThetaChainsAndFrobeniusPrimeSums §10.6: `ψ` is fixed before the constants.
  - ThetaChainsOnDefiniteUnitaryGroups §2.1: `x₀(ψ, ε)`.
  - TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f, cited only as a supplier.
- Automatic checks: the worker's gate passed every check. My gate run flagged only the three family-index files and the absence from the merge order (set aside below). Dependency check: `depcheck: 171 roadmaps, 1995 edges, 0 problem(s)`. Nothing is changed outside the folder and the family index.
- Lean: `Suggested.lean` (unchanged) elaborates with exit code 0 and no messages. It declares nothing, so there were no signatures to compare and no one-tactic probe to run.
- Title and description read against this head: no sentence is contradicted by the change.

Overlap check: the five closest open roadmaps were read in the previous review: ThetaChainsAndFrobeniusPrimeSums, GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, TaylorBoundsAndDepthsOnHeightTwoFormalGroups and CongruenceModulesOfThetaLifts. This round I reread the sections of ThetaChainsAndFrobeniusPrimeSums and ThetaChainsOnDefiniteUnitaryGroups that the change touches. The lists for main and for results are empty. The change adds no object and moves no ownership, so nothing is shared.

Source independence: changed passages only. 3 passages (the notes of 4.15b, 4.15c and 4.15d) were compared with 1 source ([FormalProof] at `ab0b752`, three Lean statements). Nothing is shared beyond declaration names. Largest share: [FormalProof], 40 of 41 locators. The arrangement was not compared again, because no layer was added, removed or reordered.

Research link: Layer 4 is the inert-prime local gain of Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026). Announcement lines 115–117 state the divisibility of CM theta derivatives by `p^{a/p + a/p³ + ⋯ − O(log a)}` at inert primes, which 4.9a–4.11 carry to chains. Basis: the README's References and the Announcement.

## Not verifiable

Each of these sampled targets was checked only against the rest of the README, because no file or declaration of [FormalProof] is cited for it:
- 4.9d
- 4.10a
- 4.14 (the new route was recomputed)
- 4.14a
- 4.14b (the new gloss was checked against 4.12 (b))
- 4.14c
- 4.14c′ (the README gives no route either)
- 4.14e
- 4.14g
- 4.14h
- 4.15a
- 4.16b
- 4.17b (the new `ℒ_f` bound was recomputed)

Automatic checks set aside as false positives:
- The rule that a pull request changes nothing outside the roadmap's folder flagged only the three files of the family index directly above this folder. They are this pull request's own.
- The dependency check's line that this roadmap is not in the merge order holds for every new roadmap until it is inserted after its last supplier.
- The listing of elaborated signatures failed with "Unknown identifier `sets`". It read a word of the module docstring as a declaration name, although the file elaborates cleanly and declares nothing.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof], an unrefereed Lean development announced on 20 November 2026 with no accompanying paper (References; Announcement lines 9–13 and 45–49).
- Licence: `alpo.ge` was classified as the author's own page in order to read the Announcement. GitHub's licence endpoint for `leanprover-community/riemann-hypothesis` returned "not found", so no licence file was detected.
- Not tested: [FormalProof] is the source of 40 of the 41 locators. It is now pinned at commit `ab0b752`, but only 4.15b–4.15d name a file and declaration, so the wording and arrangement of the other targets were not compared with it.
