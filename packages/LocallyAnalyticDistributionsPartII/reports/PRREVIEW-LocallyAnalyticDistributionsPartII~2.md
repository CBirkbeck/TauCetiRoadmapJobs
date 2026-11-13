# Review of LocallyAnalyticDistributionsPartII (pull request #2283 at 0411614)

**Verdict:** needs changes

## R01 (P2) — the general Fréchet–Stein interface still has two owners

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:198`: “Let K be a field complete for a nontrivial nonarchimedean absolute value, not necessarily discretely valued”.
**Claim:** Previous R02's generality restriction is repaired, but its duplicate ownership remains: both this §1.4 and RelativeFarguesFontainePartII §8.4 construct the general interface and prove its equivalence, exactness and base-change theorems.
**Witness:** #1825, `TauCetiRoadmap/RelativeFarguesFontainePartII/README.md:1763`: “Construct the general Fréchet–Stein and coadmissible-system interface over any complete nontrivially valued nonarchimedean field K”. Merge-order positions are 200 here and 349 there.
**Repair:** Keep the general theory here. In #1825, replace §8.4's general construction and repeated general API by “Import the Fréchet–Stein and coadmissible-module theory of LocallyAnalyticDistributionsPartII §1.4; apply it to B_I for every nonempty I ⊆ [0,1).” Retain its annular results and add the supplier citation there. For the constant system A_n = K, M_n = K², both roadmaps then use the same Γ(M_n) = K² and stage comparison.

## Previous findings

- R01 — repaired: §1.5 imports the distribution-algebra Fréchet–Stein theorem; it retains coordinate comparison and explicitly opposite-sided statements, with inversion supplying the latter.
- R02 — partly repaired: §1.4 and Conventions now allow every complete nontrivially valued nonarchimedean field; RelativeFarguesFontainePartII §8.4 still constructs the same general theory (this report's R01).
- R03 — repaired: §3.2 explicitly targets the finite-coset crossed product over every unramified R; §3.8 cites it, including infinite residue fields.
- R04 — repaired: §3.8 has four discriminating Checks; §4.13 has three, including the ramified deformation-index example.
- R05 — repaired: Source corrections, item 1, locates Fu's equation (16) on p. 13.
- R06 — repaired: References now includes DDMS99 and MR01, with edition, year and locator conventions.
- R07 — repaired: The description identifies all nine direct roadmap suppliers, distinguishes open suppliers from those on main, and describes the repaired §§1.4–1.5 ownership.

## Verified sound

| Statement | Instances tried | Left value | Right value | Result / change |
|---|---|---|---|---|
| §1.4 general field and coherent-system definitions; R01 overlap | K = ℂ_p and 𝔽₃((t)); A_n = K, M_n = K² | Γ(M_n) = K² | K ⊗_K K² = K² | Field extension holds; ownership R01 |
| §1.4 independence of presentation | Constant K² system; even-index subsequence | lim M_n = K² | lim M_(2n) = K² | Holds |
| §1.4 Theorems A/B and exactness | Constant 0 → K → K² → K → 0 | Projection image K²; higher limits 0 | Limit sequence has dimensions 1, 2, 1 | Holds |
| §1.4 stage base change, flatness and equivalence | A = M₂(ℂ_p), constant M = ℂ_p² | A ⊗_A M = ℂ_p² | M_n = ℂ_p²; identity preserves injections | Holds without commutativity or discrete valuation |
| §1.4 abelian category and finite submodules | K² → K², (x,y) ↦ (x,0) | Kernel, image, cokernel dimensions 1, 1, 1 | All three constant coherent systems have dimension 1 | Holds |
| §1.4 closed submodules and strictness | M = K², N = K × 0 | closure N = N; M/N = K | N and M/N coadmissible, dimensions 1 and 1 | Holds |
| §1.4 closed-ideal quotient | A = K[ε]/ε², I = (ε), then I = A | A/I = K, then 0 | lim A_n/A_nI = K, then 0 | Holds, including zero quotient |
| §1.4 change of algebra | K → K[ε]/ε², M = K with εM = 0 | Finite K-dimension 1 | One generator over K[ε]/ε² | Both coadmissibility directions hold |
| §1.4 flatness negative control | K = ℂ_p; K[ε]/ε² → K | 1 ⊗ ε ≠ 0 in K ⊗_A Aε ≅ K | Image in K ⊗_A A is 0 | Nonflat sequence excluded |
| §1.5 graded ring and domain | H = ℤ₃, r = 3^(−1/2) | ‖T²‖ = 1/3 | ‖T‖² = 1/3; symbol X² ≠ 0 | Holds |
| §1.5 comparison and opposite-side transport | H = ℤ₃; noncommutative ordered generators | ι(T) = −T + T² − ⋯; norm r | ‖T‖ = r; ι(b₁b₂) = b₂′b₁′, norm r² | Isometry and reversal agree |
| §3.2 crossed product | R = W(𝔽̄₃); G = ℤ₃, N = 3ℤ₃; G = G₁, N = G₁³ | Coset-basis ranks 3 and 27 | [G:N] = 3 and 27; (I + 3E₁₂)³ = I + 9E₁₂ ≠ I | Both sides free; cocycle need not be trivial |
| §3.8 trivial Lie/Artin intersection | K and K² with zero Lie action | exp(0) = 1 | Every g acts as identity; differentiated action 0 | Both definitions agree |
| §3.8 symmetric-square Check | p = 3; n = 0,1,2 | Coefficients of xy: 6,18,54; x²: 9,81,729 | 2·3^(n+1), 3^(2n+2) | Nontrivial on every open subgroup |
| §3.8 Artin non-Lie Check | p = 3, K = ℚ₃, multiplication by ζ₃ | Dimension 2; generator satisfies X² + X + 1 | γ³ = 1, γ ≠ 1; open kernel G₁³ | Simple Artin, not Lie |
| §3.8 semisimplicity negative control | K[[ℤ₃]]/(γ−1)² | γ = ((1,0),(1,1)); eigenspace K·(γ−1) | Dimension 1; no second invariant line | Nonsplit, outside semisimple-Lie hypotheses |
| §4.13 Casimir Check | a = 0,1,2,−1 | ½(a−2)² + (a−2) + 2a = 0,3/2,4,−1/2 | ½a(a+2) = 0,3/2,4,−1/2 | Normalisation agrees |
| §4.13 completed versus algebraic Verma | k = 0,1,2; coefficients c_j = 3^j | e·f^(k+1)v = 0; quotient dimensions 1,2,3 | dim Sym^k(K²) = 1,2,3; c_j → 0 with infinite support | Proper quotient; completion distinguished |
| §4.13 ramified index Check | π² = 3, e = 2, n = 1 | Index 1: ‖3h‖ = 3^(−1/2); λ(πh) = π⁻¹ ∉ R | Index en = 2: ‖3h‖ = 1; λ(3h) = 1 ∈ R | Character exists at stated index |
| Source corrections, item 1 | r = p^(−1/p), coefficient p^(−j) at pj | p^j r^(pj) = 1 for every j | Required null limit is 0 | Bounded series is outside completion |

Untouched statement rows stand as in the previous review of d3a9192.

- Source texts checked: 4 (ST03 lines 138, 275–477, 872–1005; AW13 lines 3102–3116, 3298–3354, 3653–3717; AW14 lines 447–474; FU24 lines 656–676); seeded §1.4 checked at its broadened generality.
- Pinned declarations opened: 6, including `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`), `TauCeti.symPowerRep` (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`), `TauCeti.exists_isCompl_of_isKilling` (`TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259`), PBW and balanced scalar extension.
- Supplier citations revisited: 9 roadmaps; the changed contracts resolve to PadicLocalLanglandsForGL2Qp §0.1, LocallyAnalyticDistributions §§0.0, 0.2 and NoncommutativeAndEquivariantIwasawa §§0.3, 0.5–0.8.
- Gate: all checks pass; targeted Lake build succeeds. Dependency output: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`. Outside-folder diff: 0 paths.
- Direct elaboration: only the 2 expected `sorry` warnings. All 4 scratch `#check @name` signatures match the README; no lost binder. Neither theorem closes with `simp`, `rfl`, `infer_instance` or `exact?`.
- PR title, description and `roadmap-summary`: checked against the new-folder diff and repaired ownership; no removed sections, declarations or suppliers are concealed.

Overlap check: read LocallyAnalyticRepresentationsOfLocalGroups, LieHighestWeight, LocallyAnalyticDistributions, CompletedCohomologyPartII and PadicFamiliesPartII; locally convex foundations belong to LocallyAnalyticDistributions, classical Lie inputs to LieHighestWeight/native libraries, compact distribution Fréchet–Stein theory to PadicLocalLanglandsForGL2Qp §0.1, and the general interface and Arens–Michael envelope to this roadmap §§1.4, 2.5. RelativeFarguesFontainePartII §8.4 repeats the general interface (R01).

Source independence: changed passages only; 8 passages compared with 4 sources, no copied expression or reused material found. FU24 remains the largest source (the previous full audit counted 44 of 135 locators). No layer was added, removed or reordered; the previous independent-arrangement comparison stands.

## Not verifiable

- DDMS99 and MR01 reference entries are present; their underlying theorem texts remain waived, not newly certified.
- SCH11 remains uncertified; FROM03 and DG70 remain waived. No settled text was requested again.

## Source issues

- **Error** in FU24 at §4, equation (16), p. 13: the source says the completion consists of series with bounded weighted coefficients; it should require the weighted coefficients to tend to zero; affects nothing.

## For the human reviewers

- **Licence.** BCGP25 (arXiv:2502.20645v1, 2025) is an unpublished preprint; README §2.5 takes five locators from it, each paired with a locator in SCHM13 or ST02.
- **Licence.** Frommer's theorem (README §2.3) rests on an unpublished Münster preprint (FROM03, waived); the README states it from the published summary in KOH07, §1.4.
