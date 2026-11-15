# Review of CompactQuantumMetricSpaces (pull request #1155 at 7db4c19)

**Verdict:** needs changes

## R01 (P3) — The Validation paragraph describes an earlier head

**Location:** The description's Validation paragraph: "The changed prototype compiled successfully against the pinned Lean/Mathlib/Tau Ceti environment with 14 intended admissions and no other diagnostic. The new admission is the bridge-class comparison theorem."

**Claim:** The paragraph reports the `Suggested.lean` of 76394fd7, which had 14 sorried theorems. Eight review-repair commits have changed the file since, so the count, the "new admission" and "this revised head" are all out of date.

**Witness:** `lake env lean` at 7db4c19 gives 17 "declaration uses `sorry`" warnings. Since 76394fd7, `classicalLip_le_iff`, `dist_eq_iSup_bounded_lipschitz`, `actionLip_mul_le` and `actionLip_inv_le` were removed, and seven headlines were added (`stateEDist_integrationState`, `quantumGHEDist_triangle`, `totallyBounded_quantumGHEDist_iff`, …).

**Repair:** Replace the paragraph with: "Validation: `Suggested.lean` states 17 headline theorems with `sorry` and elaborates against the pinned Mathlib and Tau Ceti with no other diagnostic. Its module docstring names the isometry-class space of §5.5, `Φ_θ` (§6.1) and the continuity of quantum tori (§6.5) as not statable at the pins." Also:
- delete "The 14-admission signature count above is from the saved local compile.";
- delete the CI sentence, unless its link is changed to a run of this head;
- delete "Full course-note coverage and source activation remain separate work.", since the README cites no course notes.

## R02 (P3) — The description's supplier list does not match the README's supplier contracts

**Location:** "Related written supplier proposals include Banach-space duality (#1121), C*-state/operator foundations (#860, #889, #1041), compact/Lie representations (#1047, #1051, #1145), Riemannian/Clifford commutators (#935, #902), and twisted completions/spectral triples (#1137, #1143)."

**Claim:** The list cites #1047, which the head never cites. It names #1137 as the twisted-completion supplier, but the head takes that algebra from HeisenbergImprimitivity. It also leaves out four suppliers the head consumes directly.

**Witness:** #1047 is CompactGroupsPartII, which the README cites 0 times. #1137 revised OperatorAlgebraDynamics, which README lines 96–98 reach only through HeisenbergImprimitivity §3.1. The list never names HeisenbergImprimitivity §3.1, OperatorKTheory K7.5, CharacteristicClasses C1 or OptimalTransport Layers 0–3.

**Repair:** Replace the sentence with: "Suppliers, as in the README's Exact supplier contracts:
- BanachSpaceTheory B1 and B5;
- VonNeumannAlgebras Layer 0 and V8.CompactErgodicActions;
- CStarAlgebras C1–C2;
- CompactGroups Layers 0–5;
- LieGroups Layer 2;
- CharacteristicClasses C1, item 3;
- SmoothBanachRepresentations §§2.1, 3.1 and 8.1;
- OptimalTransport Layers 0–3;
- NoncommutativeGeometry N5–N7;
- RiemannianGeometry R7.8, with SpinGeometry G6;
- HeisenbergImprimitivity §3.1;
- OperatorKTheory K7.5."

## R03 (P3) — The description does not say that the pull request adds a new roadmap

**Location:** "The entire Q3 classical/Dirac supplier is unchanged." Similar wording elsewhere in the description: "The broader quotient-only class is retained", "all local convolution, length and quantum-metric results remain", "Exact forward/inverse text checks retain the full programme and all other text".

**Claim:** The pull request adds a roadmap that is not on main, but the description never says so. Words like "retained", "remain" and "unchanged" compare against an earlier version that nobody reading it can see.

**Witness:** `git diff --stat origin/main...HEAD` shows 3 files, 2156 insertions and 0 deletions. `TauCetiRoadmap/CompactQuantumMetricSpaces/` does not exist on main.

**Repair:** Open the prose with: "Adds the new roadmap CompactQuantumMetricSpaces (`README.md`, `Suggested.lean`, `metadata.toml`; 2156 lines); no other roadmap is changed." Rewrite each comparison as a statement about the head, for example: "§5.1 also defines the broader quotient-admissible class, with its coupled-domain counterexample." Delete "The entire Q3 classical/Dirac supplier is unchanged." and the sentence on forward/inverse text checks.

## R04 (P3) — "Bridge" is used where the head says "admissible Lip-norm"

**Location:** "Admissible bridges have the full product finite domain needed for gluing." and "Infimal-convolution regularization supplies full-domain bridges with exact endpoint quotients and uniform state-metric error at most 2ε".

**Claim:** The head keeps the two words apart. The full product domain and the exact endpoint quotients belong to the admissible Lip-norm `M_ε = max(L_E, L_F, N_ε)`, not to a bridge.

**Witness:** README lines 186–190 define a bridge as Rieffel's auxiliary seminorm `N` and say "The two words are never interchanged". The source agrees: rieffel00 line 825 (a bridge is a seminorm) and line 620 (the set of Lip-norms `M(L_A, L_B)`).

**Repair:** Replace the first sentence with "Admissible Lip-norms have the full product finite domain needed for gluing." Replace the second with "Infimal-convolution regularization turns a quotient-admissible Lip-norm into an admissible one with the same endpoint quotients and with state metric within 2ε."

## Previous findings

- None: the report of 7db4c19 raised no finding.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Description: "state-metric error at most 2ε"; §5.1 `quantumGHEDist_eq_quotientQuantumGHEDist` | `E = F = ℝ`, `L = 0`, `M = δ⁻¹\|a − b\|`, max norm; `δ = 1/10`, `ε = 1/4` | `N_ε(v) = \|v₁ − v₂\|·min(1/δ, 1/(2ε))`; `ρ_M = 0.1`, `ρ_(M_ε) = max(δ, 2ε) = 0.5 ≤ 0.6`; both infima `0` | holds; as `δ → 0` the `2ε` is attained | none |
| Description: "zero-sum span from the bounded difference hexagon"; §2.3 Check | simplex in `ℝ³`; `z = (1, −1, 0)`, `(2, −2, 0)` | `K − K` has 6 vertices `±(e_i − e_j)`; `(1, −1, 0) = e₁ − e₂ ∈ K − K`; `(2, −2, 0)`: `Σ = 0`, `Σ\|z\| = 4 > 2` | in the span, not in `K − K` | none |
| Description: "14 intended admissions" | 7db4c19; 76394fd7 | 17 `sorry` warnings at the head; 14 sorried theorems at 76394fd7; 4 removed, 7 added since | false at the head | R01 |
| Description: supplier list against the README's contracts | #1047, #1137; four omitted suppliers | #1047 = CompactGroupsPartII, cited 0×; #1137 = OperatorAlgebraDynamics (b54415bf), reached only through HeisenbergImprimitivity; HeisenbergImprimitivity 3×, OperatorKTheory 2×, CharacteristicClasses 2×, OptimalTransport 2× | out of date | R02 |
| Description: adds or revises a roadmap | `origin/main` | folder absent on main; 2156 insertions, 0 deletions | adds a new roadmap; the description does not say so | R03 |
| Description: "admissible bridges" | README lines 186–190; rieffel00 lines 620, 825 | bridge: `N` with `N(e, f) = 0`, `N(e, 0) ≠ 0`; `M(L_A, L_B)`: Lip-norms inducing `L_A, L_B`; `M_ε = max(L_E, L_F, N_ε)` | the two words are conflated | R04 |
| Description: "Rigidity preserves order-unit/Jordan structure"; §5.4 `quantumGHEDist_eq_zero_iff` | `M₂(ℂ)` and its opposite; `σ_x`, `σ_z` | `σ_xσ_z = −iσ_y`, opposite product `iσ_y`; `σ_x∘σ_z = 0` in both; the identity is an order isometry, distance `0` | true | none |
| Description: torus continuity "in every dimension over all real skew-symmetric parameters"; §6.5 | `d = 0`, `1`, `2` | `d = 0`: `ℂ`; `d = 1`: the only skew `1 × 1` matrix is `0`, `A = C(T)`, a constant family; `d = 2`: `b_N(p) = exp(πi p₁p₂)` gives `dist_q(A_θ, A_(θ+1)) = 0` | true; not statable at the pins (docstring says so) | none |
| Description: "V8 … contract of #889, with arbitrary compact-Hausdorff scope"; §4.2, `exists_closedLipNorm_actionLip` | VonNeumannAlgebras on main, line 2722; f8dfe0ad | "arbitrary compact Hausdorff" `G`, no separability; V8.CompactErgodicActions present at #889; Lean binders `[CompactSpace G] [T2Space G]` | true | none |

The rows for the untouched statements stand as in the previous review, of 7db4c19.

- **Gate:** my rerun (`--base origin/main`) reports every check at 0, then `OK`, exit 0. The worker's gate at 7db4c19 passes too, `build=0` included. Nothing changed outside the folder.
- **Dependency check:** `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- **Elaboration:** scratch copy of `Suggested.lean` with 37 `#check @name` lines: 17 `sorry` warnings and 37 types printed. The only other message comes from my own `#check` of `in`, a docstring word that the declaration scan picks up (line 23). The Lean is unchanged since 92ab84b, so the padding probe of the previous review stands.
- **Source locators:** 4 checked against rieffel00: Notation 4.1 (line 620), Definition 4.2 (line 627), Definition 5.1 (line 825) and Theorem 5.2 (line 833). They support §5.1 and §5.2 as written. Of the seeded sample, only 4.2 and 5.1 fall under the description's claims.
- **Cross-roadmap citations:** 4 resolved at their current heads: HeisenbergImprimitivity §3.1 (its line 504), OperatorKTheory K7.5, VonNeumannAlgebras V8.CompactErgodicActions (main line 2722 and its open revision), OperatorAlgebraDynamics main lines 4108–4116; `scratch/citations.md` lists nothing unresolved.
- **Title and summary block:** the title, and the summary block against README lines 1–21, 1703–1713 and §§3.6, 4.2, 5.1, 5.2, 5.4, 6.5: no contradiction.
- **Remark (no change asked):** Physlib's order-unit files cited in the References (Apache 2.0) declare `IsOrderUnitElement` and `IsArchimedeanOrderUnit`. Neither name nor statement matches `IsOrderUnitNorm`.

Overlap check: read HeisenbergImprimitivity, AmenableTracesOnCStarAlgebras, SpectralManifolds, VonNeumannAlgebras (open revision), QuantumFoundations, OptimalTransport, OperatorAlgebraDynamics, BanachAlgebras; `C*(L, c)` with trace, gauge action and full = reduced: OperatorAlgebraDynamics D1/D2.CentralTwists, via HeisenbergImprimitivity §3.1 and OperatorKTheory K7.5; `W₁`: OptimalTransport; states and V8: VonNeumannAlgebras; QuantumFoundations and SpectralManifolds consume §§1.4, 3.1, 3.3, 3.6; the rest share nothing.

Source independence: changed passages only. The folder has no changed passage. I compared 2 README passages (§5.1's admissible Lip-norm and §5.2's bridge) with 1 source (rieffel00 lines 620–630 and 825–838); they share only the forced conditions `N(e, f) = 0` and `N(e, 0) ≠ 0`. The largest share is rieffel00, 39 of 72 source mentions. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): the DOI resolves to JSTOR, which is paywalled. It is consumed only through VonNeumannAlgebras V8.CompactErgodicActions.
- The description's CI link (run 39439604642): not opened; this review does not read GitHub runs.

## Source issues

- none

## For the human reviewers

- none
