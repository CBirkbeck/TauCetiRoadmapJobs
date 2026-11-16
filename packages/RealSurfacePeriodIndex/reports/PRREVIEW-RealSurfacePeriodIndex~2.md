# Review of RealSurfacePeriodIndex (pull request #2462 at 3acc88c)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: line 105 now reads "a closed subset A ⊂ M with a Whitney stratification each of whose strata is σ_M-invariant, such that f is proper on A and restricts to a submersion on every stratum", as AlgebraicTopologyPartII §16.2 (line 1675) assumes.
- R03 — repaired: the description now says "The README also consumes EnriquesSurfaces §§1.1, 1.3 and 1.4 (…), an open pull request by another author (#1286), which must merge first as well"; both generated blocks list #1286.
- R04 — repaired: line 2780 now ends the sentence at "for any roadmap on quadratic forms over function fields." and no longer names Benoist–Wittenberg importers.

## Deferred findings

- D01 — stands

## Verified sound

| Target | Instance | Computed: hypotheses or left side | Computed: conclusion or right side | Result |
|---|---|---|---|---|
| gap:at2-stratified-pair-transport (line 105), R02's instance | M = ℝ, σ = −id, B = point, A = {±1} | strata {−1}, {1}: σ{1} = {−1}, not invariant, so the hypothesis now excludes it | single stratum {±1}: T = A, π = id, ρ = 0; σT = T, πσ = σπ, ρσ = ρ | holds |
| same gap, a positive instance | A = S¹ × ℝ ⊂ ℂ × ℝ, σ(z,t) = (z̄,t), f = pr₂, σ_B = id | strata {±1} × ℝ and (S¹ ∖ {±1}) × ℝ, each σ-invariant; f proper on A | π₀ = (sign Re z, t), ρ₀ = (Im z)² on Re z ≠ 0: invariant, f∘π₀ = f, dρ₀/dθ = sin 2θ ≠ 0 there | holds |
| same gap against AlgebraicTopologyPartII §16.2 | hypotheses at its line 1675 against line 105 | involutions, f∘σ_M = σ_B∘f, closed A, Whitney, invariant strata, f proper on A, stratumwise submersion: 7 of 7 | the only missing input is invariant compatible control data; §16.1c (its line 1598) gives non-invariant ones | precise, not yet provided |
| §6.11 strata each σ-invariant (Sing R) | R = {x²+y² = z²} ∪ {x²−y² = 4z²} in ℙ²_ℝ | Sing R = (±√(5/2), ±i√(3/2)), no real point; Jacobian determinant −8xy ≠ 0, so nodes | σ swaps E_q and E_q̄; their union, one stratum, is σ-invariant; strata need not be connected (AlgebraicTopologyPartII line 1541) | holds |
| §6.11 strata each σ-invariant (R ∩ D_x) | R = {x²+y² = 1}, D_x = {x²+2y² = 4}, L = O | R ∩ D_x = (±i√2, ±√3); determinant 4xy ≠ 0, so transverse | conjugation swaps (i√2, √3) and (−i√2, √3); the union of the four ℙ¹ fibres is σ-invariant | holds |
| §6.11 Check R = ∅ | P = ∅ | only stratum M, σ(M) = M | f = π restricted to M, proper and a submersion: the §16.1 input | holds |
| §6.12 (cites §6.11 and the gap) | x ∈ Λ ⊂ B(ℝ), σ_B = id on Λ | every b ∈ Λ is σ_B-fixed, as §16.2's conclusion needs; f∘σ = f since π is real | §6.11 supplies invariant Whitney strata, properness and submersions; the gap supplies control data | holds |

The rows of the review of 36cfe04 for the untouched statements, including the 8 theorems of `Suggested.lean`, stand as they were.

- Source locators checked against the text: 2, both of §6.11. B19 lines 548–558 (§3.1, pp. 76–77) give fixed singular centres and the family in a fixed threefold. B19 lines 1253–1264 (proof of Proposition 6.6, pp. 94–95) give a G-stable Λ with Λ(ℝ) contractible. E17 was reconfirmed at B19 lines 553–556.
- Cross-roadmap citations resolved: AlgebraicTopologyPartII §§16.1a, 16.1b, 16.1c and 16.2 at its head (lines 1541, 1573, 1598, 1675). QuadraticFormInvariantsPartII lines 118 and 2029 and `IsCi` (Suggested.lean:288) at b38ee3c are unchanged (D01). The EnriquesSurfaces §§1.1, 1.3 and 1.4 named in the description match README lines 147, 2502 and 2519.
- Ownership: `roadmaps grep` for invariant or equivariant control data finds only AlgebraicTopologyPartII line 1675 and this README.
- Gate, run on this head: every check 0, OK (the worker's run adds build=0). Dependency check: `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean Suggested.lean`: the only output is 8 `sorry` warnings (lines 85, 94, 106, 117, 128, 138, 148, 161). `Suggested.lean` and `metadata.toml` are unchanged since 36cfe04, so the earlier `#check @` comparison and one-tactic probe stand. Nothing changed outside the folder.
- Remark: `packages/RealSurfacePeriodIndex/design/plan.json` still has the earlier `needs` for gap:at2-stratified-pair-transport, which asks only for a G-invariant subset. That file is outside this pull request, and line 105 states the corrected contract.
- Remark: §6.11's locators support the construction and Λ, but not the stratification itself. That is the roadmap's completion under source correction E19, as §6.12 says.

Overlap check: for the changed passages I read AlgebraicTopologyPartII (scope lines 7 and 21, §§16.1a–16.2) and QuadraticFormInvariantsPartII (lines 118, 2029). Invariant control data are asked of AlgebraicTopologyPartII by the declared gap, and no other roadmap owns them. The C_i fields, Tsen–Lang theorem and real closures at an ordering are D01. LogicAndDefinabilityInNumberTheoryPartII, QuadraticFormInvariants (main and its open revision), MotivesAndAlgebraicCycles, SchemeAndStackFoundations and RealAlgebraicGeometry are as in the review of 36cfe04, and the change does not touch them.

Source independence: changed passages only. I compared 3 passages with 1 source (B19 lines 548–558 and 1253–1264) and with AlgebraicTopologyPartII §16.2's hypothesis list (project text, a forced list); nothing is shared. No layer was added, removed or reordered, so the contents comparison stands: largest share B19, 130 of 257 locators; contents compared with B19: independent.

## Not verifiable

- None in the changed passages. BCR and DK96 remain uncertified for untouched text, as in the review of 36cfe04.

## Source issues

- none

## For the human reviewers

- none
