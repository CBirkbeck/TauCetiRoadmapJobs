# Review of GaugeQuiltFieldTheory (pull request #1076 at fbd71b7)

**Verdict:** needs changes

Incremental re-review of the 9 lines changed since 25e0ea3 (the new Check at `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` line 28, the two new GQ1 paragraphs at lines 38 and 40, the GQ5 paragraph at line 86 and the ownership paragraph at line 92), plus everything that cites them: InstantonFloerTheory at its open head 1fb9d4da (ORDER line 281, now after this roadmap at line 280), the gate and the elaboration. `Suggested.lean` is unchanged. One P2 (the repair of the previous R03 created a second owner of the rank-two `SO(3)` adapter and Hodge-star complex structure), one P3 from the gate, and the three P3 notes of the previous report that this head leaves as they were.

Source ids: `ww-coprime` = Wehrheim–Woodward, *Floer field theory for coprime rank and degree*, arXiv:1601.04924v2; `dfl-atiyah-floer` = Daemi–Fukaya–Lipyanskiy, *Lagrangians, SO(3)-instantons and the Atiyah–Floer conjecture*, arXiv:2109.07032v1; `ss-newstead` = Scaduto–Stoffregen, arXiv:1707.06268v1; `ss-rank-two` = Scaduto–Stoffregen, arXiv:1707.06207v1. Line numbers are those of the worker's cached texts (no `sources.toml` exists for this roadmap).

## R01 (P2) — The rank-two `SO(3)` adapter and the Hodge-star complex structure now have two owners, and the README misstates what InstantonFloerTheory IF9 does

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` line 38: "InstantonFloerTheory IF9 takes it through the following adapter … Construct the adapter and prove its statements. Passing to the induced connection on `ad P=su(P)` is a bijection … Identify the deformation complexes and tangent spaces of the two descriptions."; line 40: "IF9 uses the form `−∫_X tr(a∧b)`. … construct the Hodge-star almost complex structure `J=*` … Prove that `J` is `Ω`-compatible"; line 92: "its `SO(3)` adapter and its comparison with the `−∫_X tr(a∧b)` normalization, which InstantonFloerTheory IF9 takes from GQ1".

**Claim.** InstantonFloerTheory at its open head (1fb9d4da, 2026-11-06) consumes GQ1 for the moduli `M(P,δ)` exactly as this roadmap now says, but it constructs the two objects this head also constructs. `TauCetiRoadmap/InstantonFloerTheory/README.md` line 18 (supplier row for GaugeQuiltFieldTheory GQ1): "IF9 constructs the SO(3)/determinant adapter, the Hodge-star complex structure and all three-dimensional restriction data"; line 153: "Construct here the adapter to IF0's SO(3) connections on ad E"; line 155: "GQ1 states no complex structure. For a chosen surface metric construct here the Hodge-star complex structure on harmonic representatives, prove `Ω(a,*a)=(1/(4π²))‖a‖²_B` and its compatibility with Ω". So the `U(2)`-with-fixed-determinant to `SO(3)` adapter, the identification of the deformation complexes and `J=*` with its `Ω`-compatibility are stated as targets by both roadmaps, each saying the other does not state them. Two owners of one object is a design defect. Also, line 40's "IF9 uses the form `−∫_X tr(a∧b)`" is false at that head: IF9 line 155 says "every area, energy and monotonicity constant here uses Ω" and states the identity `−∫_Σ tr₂(a∧b) = 4π²Ω` as GQ1's. The mathematics on both sides agrees (the adversarial table below recomputes every sign and constant); only the ownership and the description of IF9 are wrong.

**Witness.** `TauCetiRoadmap/InstantonFloerTheory/README.md` at 1fb9d4da, lines 18, 153 and 155 as quoted; `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` lines 38, 40, 92. Neither roadmap needs the adapter or `J=*` except for IF9's comparison: GQ2–GQ5 use the `U(r)` fixed-determinant description and chosen compatible almost complex structures throughout, never `SO(3)` connections or the Hodge star.

**Repair.** Make IF9 the owner of the adapter and of `J=*` (it is the only consumer, and InstantonFloerTheory cannot be edited from this pull request), and keep in GQ1 only the facts about `M(P,δ)` that IF9 consumes. Concretely, at line 38 replace the sentences "InstantonFloerTheory IF9 takes it through the following adapter … Construct the adapter and prove its statements. Passing to the induced connection on `ad P=su(P)` is a bijection from connections with determinant connection exactly `δ` onto `SO(3)` connections on `ad P`." by "InstantonFloerTheory IF9 consumes it, one factor for each component of its seam surface, and constructs there its `SO(3)`/determinant adapter and Hodge-star complex structure from the following facts, proved here.", and delete the last sentence "Identify the deformation complexes and tangent spaces of the two descriptions." Keep the `w₂(ad P)=d mod 2`, central-curvature, gauge-quotient and `H¹(X;ℤ/2)` sentences, with the locator (`dfl-atiyah-floer` Remark 2.2 and Lemma 2.43, lines 241–246 and 669–689: the sequence `±1 → G_det → G_{SO(3)} → H¹(Σ;ℤ/2)` and the holonomy action `(−1)^{l(γ)}·hol_γ`). At line 40 replace "IF9 uses the form `−∫_X tr(a∧b)`. Prove `−∫_X tr(a∧b)=4π²·Ω(a,b)`, so for `r=2` its class is `4π²τ_WW·c₁=π²·c₁`." by "The unnormalized pairing `−∫_X tr₂(a∧b)` of IF0 equals `4π²·Ω(a,b)`; prove this, so for `r=2` its class is `4π²τ_WW·c₁=π²·c₁`.", keep the rescaling and `L²`-pairing sentences, and delete "For a metric on `X`, construct the Hodge-star almost complex structure `J=*` … the square of the normalized `L²` norm of `a`." At line 86 replace "through the `SO(3)` adapter and the normalization `−∫_X tr(a∧b)=4π²·Ω` of GQ1" by "with the normalization `−∫_X tr₂(a∧b)=4π²·Ω` of GQ1; IF9 constructs its `SO(3)` adapter and Hodge-star complex structure on it". At line 92 replace "its `SO(3)` adapter and its comparison with the `−∫_X tr(a∧b)` normalization, which InstantonFloerTheory IF9 takes from GQ1" by "its `H¹(X;ℤ/2)` action and its `4π²` comparison with the unnormalized pairing, which InstantonFloerTheory IF9 consumes; IF9 owns the `SO(3)` adapter and the Hodge-star complex structure". (The other resolution, keeping both constructions here with IF9 citing GQ1 for them, needs a change to InstantonFloerTheory's head first; until then the two heads contradict each other.)

## R02 (P3) — The gate's build check fails: `Suggested.lean` lacks the module-system header

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean` line 1, `import Mathlib`.

**Claim.** The worker's gate at this head reports `build=2 FAIL`: the pinned Mathlib (1b1ccf4b, the pin merged from main at 4d2e6223) is built with the module system, and `lake build` of the module emits the advisory "imports `Mathlib` … consider adding `module`" twice. The file elaborates (three `sorry` warnings, nothing else), so this is a header-form defect, but the gate fails on it and the brief admits no acceptance while it does.

**Witness.** The gate record at this head; main already carries the header on 13 of its 141 `Suggested.lean` files, e.g. `TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean` lines 1–5.

**Repair.** Replace line 1 by `module`, a blank line and `public import Mathlib`, and insert `@[expose] public section` after the module docstring (before `namespace TauCetiRoadmap.GaugeQuiltFieldTheory`). Tested: a scratch copy of the file with exactly this header elaborates under `lake env lean` with the three `sorry` warnings only.

## R03 (P3) — No `*Needs:*` lines, no supplier-contract section, no locators in GQ2–GQ4 and in the new rank-two paragraph, Checks only in GQ1

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md`, whole file: `grep -c 'Needs:'` = 0, `grep -c 'Exact supplier'` = 0, `grep -c 'Checks'` = 1 (line 23); the new paragraph at line 38 states four theorems (the `SO(3)` bijection, `w₂(ad P)=d mod 2`, the gauge-group extension by `H¹(X;ℤ/2)`, the holonomy action) with no locator.

**Claim.** Carried from the previous report's R01, unchanged by this head. The dependency check parses only `*Needs:*` lines, "X supplies" sentences and `### From` headings, so its `0 problem(s)` is vacuous for this roadmap (every edge was checked by hand, see Verified sound). The house shape requires a locator at each claim, `*Needs:*` per target and three Checks per definition.

**Witness.** Dependency-check output below contributes no edge from GaugeQuiltFieldTheory; the counts above.

**Repair.** As in the previous report: add `## Exact supplier contracts` (R5; B1–B5; G4; FK0, FK1.1, FK3, FK4.2; F0–F3; DGAInfinity; and now a `### From TauCetiRoadmap.InstantonFloerTheory` subsection saying only that IF9 is the consumer of GQ1's rank-two odd-degree value), end each target paragraph with a `*Needs:*` line, put `ww-coprime` Lemma 3.4.4/3.4.5/Theorem 3.4.3/Theorem 2.2.13/Theorem 3.5.1 and `ww-orientations` Theorem 1.0.1 at their claims, give the line-38 facts the `dfl-atiyah-floer` locator of R01, and add three Checks to each definition outside GQ1 (the lists in the previous report's R01).

## R04 (P3) — The symplectic normalization differs from `ww-coprime` eq. (26) by `4π²`, with no note at the claim and no witness Check

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` lines 9 and 32 (`B(ξ,η)=−tr(ξη)/(4π²)`, `c₁(M(P,δ)) = 2r[ω]`, `τ_WW = 1/(2r)`).

**Claim.** Carried from the previous report's R02, partly addressed: line 40 now states the `4π²` relation to InstantonFloerTheory's unnormalized pairing, but the source this roadmap cites for `c₁ = 2r[ω]` still displays the form without the `1/(4π²)` (`ww-coprime` lines 1144–1147, eq. (26), with Definition 3.2.1(b) at lines 698–701), and the README neither says so at line 32 nor pins its constant by a computed witness.

**Witness.** Rank one on genus `g`: `A = i·a`, gauge `a ↦ a + dθ` with `θ: X → ℝ/2πℤ`, moduli `H¹(X;ℝ)/2πH¹(X;ℤ)`; on an integral symplectic basis the form `∫(−tr)(a∧b)` takes the value `4π²` per integral generator, `(1/4π²)∫(−tr)(a∧b)` the value 1. Rank two: `ss-rank-two` lines 18 and 862, `c₁(TN_g) = 2α = 4[Ω] = 2r[Ω]`.

**Repair.** At line 32 add one sentence: "Wehrheim–Woodward's form (26) uses the basic inner product `−tr` without the `1/(4π²)`; `Ω = ω_WW/(4π²)`, and `c₁ = 2r[Ω]` is the statement that holds (Atiyah–Bott normalization)." Add the rank-one Jacobian computation above as a Check under GQ1 (a wrong normalization `B = −tr` would give `c₁ = 8π²r[Ω]`, not an integral relation).

## R05 (P3) — Process vocabulary

**Location.** `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` line 63 (heading "Handle relative-spin lifts and regressions"), line 79 ("Retain the nonspin calibration", "this corrected target", "the genus-one-to-two and rank-one calibrations"), line 159 ("the rank-two nonspin regression").

**Claim.** Carried from the previous report's R04, unchanged by this head: "regression", "calibration" and "corrected target" are test-process and revision words that tell a later reader which points were contested.

**Repair.** Line 63: "Handle relative-spin lifts and the rank-two nonspin example"; line 79: "The rank-two example `r = 2, d = 1, g = 2 → 3` is not spin: …", "this corrected target" → "the relative-spin statement above", "calibrations" → "examples"; line 159: "These supply the rank-two nonspin example in GQ2b".

## Previous findings

- R01 — not repaired: `Needs:` 0, `Exact supplier` 0, `Checks` 1 at this head; the new line-38 paragraph adds four unlocated theorems. Restated as R03.
- R02 — partly repaired: line 40 now states `−∫_X tr(a∧b)=4π²·Ω(a,b)` against InstantonFloerTheory's pairing; line 32 still cites `ww-coprime` Theorem 3.3.3 without noting that its displayed form (26) lacks the `1/(4π²)`, and no witness Check was added. Restated as R04.
- R03 — repaired, with a new problem: InstantonFloerTheory's head 1fb9d4da now consumes GQ1 for `M(P,δ)` (its lines 18, 153), ORDER places this roadmap (280) before it (281), and lines 86 and 92 name the consumer correctly; but the new paragraphs make GQ1 a second builder of IF9's `SO(3)` adapter and Hodge-star complex structure and misdescribe IF9's normalization, which is R01 of this report.
- R04 — not repaired: "regressions" (line 63), "calibration", "corrected target", "calibrations" (line 79), "regression" (line 159) all remain. Restated as R05.

## Verified sound

**Gate, build and elaboration.** Worker's gate at fbd71b7: every text scanner 0, `depcheck=0`, `outside-folder=0`, `stray-files=0`; only `build=2` fails (R02). `git diff --stat origin/main...HEAD` outside the roadmap folder: empty (the 655 files listed in the change set are the merge of origin/main at 4d2e6223, not changes of the pull request). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`. `lake env lean TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean` from the worktree (pins Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, identical to main's): three `declaration uses sorry` warnings (lines 47, 55, 66), nothing else. The file is byte-identical to the one the previous review read, so its elaborated signatures (scratch `signatures.md`, 5 declarations, no lost binder) and the previous one-tactic probe (none of the three theorems closes by `simp`, `rfl`, `infer_instance`, `simp_all` or `Subgroup.mem_center_iff`) stand.

**Dependency check.** `gate --depcheck … --movable`:

```
depcheck: 239 roadmaps, 2350 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The README contributes no edge (R03), so every citation was resolved by hand this round:

| cited supplier | where it is at this round | position |
|---|---|---|
| HamiltonianReduction R5 | main eaf17b1, `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:305` "R5. Gauge actions over a surface" | main |
| SmoothBundlesConnections B1–B5 | main, README lines 221–605 (B1.0–B2.2 and on) | ORDER line 8 |
| SpinGeometry G4 | main, README line 395 | main |
| HeegaardFloer F0–F3 | main, README lines 20 (F0.S), 46 (F2.1), 73 (lanes F3, F4), 1654 (F1.1, F1.3) | main |
| DGAInfinity, AlgebraicTopology, DifferentialGeometry | main | main |
| FukayaTheory FK0, FK1.1, FK3, FK4.2 | open head d4d0fe7d (rev/1045): lines 13, 16, 57, 442 | ORDER line 218 |
| InstantonFloerTheory IF0, IF9, IF10 | open head 1fb9d4da (rev/1083): README lines 24, 149, 173; it cites GaugeQuiltFieldTheory GQ1 at its lines 17, 18, 153, 155, 213 | ORDER line 281, after this roadmap (280): a consumer, correctly not cited as a supplier |

The worker's citation resolver and overlap scan found nothing (no dropped id, no other open pull request changing this folder); confirmed.

**Seeded sample: InstantonFloerTheory.** Checked at 1fb9d4da. IF0 (line 30): skew-Hermitian traceless `2×2` matrices, `B(X,Y) = −tr₂(XY)`, left action `g·A = gAg⁻¹ − (dg)g⁻¹`, so README line 40's "`−tr₂(ξη) = 4π²·B(ξ,η)`" holds with this roadmap's `B = −tr/(4π²)`, and the matrices, trace and gauge action coincide. IF0 line 34: the normalized `L²` pairing is `(1/(4π²))∫B(a∧*b)` with IF's `B`, which is README line 40's `−(1/(4π²))∫tr₂(a∧*b) = Ω(a,*b)`. IF9 (lines 149–155): seam surface with exactly two components, moduli the product; consumes from GQ1 the determinant-one quotient, `H¹` tangent space, symplectic form, dimension `6g−6`, simple connectivity, the genus-one point, the empty sphere and `c₁ = 4[Ω]` (`= 2r[Ω]` at `r = 2`, README line 32); IF9's Check "sphere class of Chern number 2 has `Ω`-area 1/2, unnormalized area `2π²`" equals README line 40's `[−∫tr(a∧b)] = π²c₁` evaluated at `c₁ = 2`. GQ5 line 86's list of what IF9–IF10 own (perturbed flat moduli of three-manifolds with boundary and restriction maps, IF9 line 155; coherently oriented pair-strip complex, IF9a; mixed ASD/Cauchy–Riemann bridge, IF10) matches. The mismatch is R01.

**Seeded sample: "Rank two, odd degree" (README line 38), against `dfl-atiyah-floer`.** Lines 228–233: the determinant-one gauge group is the sections of `F ×_Ad SU(2)`, the moduli is flat connections modulo it (also line 79, citing Atiyah–Bott). Remark 2.2, lines 241–246: the exact sequence `(±1 per component) → G(F) → G_ex(F) → H¹(Σ;ℤ/2)`, last map the obstruction to lifting over the 1-skeleton: README's "quotient by `±1` embeds as a normal subgroup of the full `SO(3)` gauge group, with quotient group `H¹(X;ℤ/2)`" (for connected `X` the kernel is one `±1`). Lemma 2.43 and proof, lines 669–689: a `U(2)`-bundle with `c₁` lifting `w₂`, its adjoint bundle, the configuration space with fixed determinant connection identified with the `SO(3)` configuration space, the `H¹(−;ℤ/2)` action as tensoring with a real line bundle, holonomy `(−1)^{l(γ)}·hol_γ`: README's bijection, `w₂(ad P) = d mod 2` and `(A_j,B_j) ↦ (±A_j,±B_j)`. Eq. (2.5), lines 256–263: `Ω(c,c′) = −∫tr(c∧c′)`, `J_* = *₂`, `⟨c,c′⟩ = Ω(c,J_*c′)`: the unnormalized form of README line 40 and the Hodge-star structure with the same compatibility sign. `ss-newstead` lines 15–28: `N_g = f_g⁻¹(−1)/SU(2)`, the `SU(2)` conjugation action descending to a free `SO(3)` action (README lines 17, 20).

**Adversarial table** (rows marked "r1" carry the previous report's computed row for a statement this head leaves untouched; the others are computed here).

| statement | instances tried | values on each side | result |
|---|---|---|---|
| Check line 28: `BAB⁻¹ = −A`, `ABA⁻¹ = −B` | `A = diag(i,−i)`, `B = [[0,1],[−1,0]]`, `B⁻¹ = [[0,−1],[1,0]]`, `A⁻¹ = diag(−i,i)` | `A·B⁻¹ = [[0,−i],[−i,0]]`, `B·(A·B⁻¹) = [[−i,0],[0,i]] = −A`; `B·A⁻¹ = [[0,i],[i,0]]`, `A·(B·A⁻¹) = [[0,−1],[1,0]] = −B` | true; conjugation by `B`, `A`, `AB` gives `(−A,B)`, `(A,−B)`, `(−A,−B)` |
| "the residual `H¹(X;ℤ/2)` action … is not free" | `g = 1`: moduli a point (Lean `relationModuli_genus_one`), `H¹(T²;ℤ/2) = (ℤ/2)²` | every sign change fixes the single point; the action is trivial, hence not free | true; agrees with IF9 line 153 "which has fixed points" |
| bijection: fixed-determinant `U(2)` connections ↔ `SO(3)` connections on `ad P` | `u(2) = iℝ·I ⊕ su(2)`, `Ad: su(2) ≅ so(3)`; `A = a₀I + a′` | `tr A = 2a₀ = δ` fixes `a₀ = δ/2`; `a′ ↦ ad(a′)` bijective; inverse `A = (δ/2)I + ad⁻¹(a_{ad})` | true (`dfl-atiyah-floer` 677–679) |
| central curvature ↔ flat `ad` connection | `F_{ad A} = ad(F_A)`, `ad` kills `iℝ·I` | `ad(F_A) = 0 ⟺ F_A = (tr F_A/2)I = (F_δ/2)I` | true |
| `w₂(ad P) = d mod 2 ≠ 0` | `d = 1`: `w₂ = 1`; `d = 2`: `w₂ = 0` (excluded by coprimality) | `w₂(ad P) = c₁(P) mod 2` (`dfl-atiyah-floer` 673–674) | true |
| gauge quotient `H¹(X;ℤ/2)` | `X` connected; `g = 1`: `(ℤ/2)²` | kernel `±1`, cokernel `H¹(X;ℤ/2)` (`dfl-atiyah-floer` 244); holonomy action `(−1)^{l(γ)}hol_γ` (line 682) = `(±A_j,±B_j)` | true |
| `−∫tr(a∧b) = 4π²Ω(a,b)`, class `π²c₁` at `r = 2` | `B = −tr/(4π²)`, `τ_WW = 1/(2r) = 1/4`; IF9's sphere of `c₁ = 2` | `4π²·∫B(a∧b) = −∫tr(a∧b)`; `[−∫tr] = 4π²·(1/4)c₁ = π²c₁`; `π²·2 = 2π²` = IF9 line 155's unnormalized area, `Ω`-area `2/4 = 1/2` | consistent |
| `−tr₂(ξη) = 4π²B(ξ,η)`; `L²` pairing `−(1/4π²)∫tr₂(a∧*b) = Ω(a,*b)` | IF0 lines 30, 34 | `4π²·(−tr/(4π²)) = −tr`; `(1/(4π²))∫B_IF(a∧*b) = ∫B(a∧*b) = Ω(a,*b)` | consistent |
| rescaling by `4π²` | `ω′ = cω`, `c = 4π² > 0` | `ω′(v,Jv) = c·ω(v,Jv) > 0`; `[ω′] = cτ·c₁`; `ω′|_L = c·ω|_L = 0` | true |
| `J = *` is `Ω`-compatible, `Ω(a,*a) = ‖a‖²` | 1-forms on a surface: `** = (−1)^{1·1} = −1`; `α∧*β = ⟨α,β⟩vol` | `*a∧*b = ⟨*a,b⟩vol = −⟨a,*b⟩vol = a∧b`, so `Ω(Ja,Jb) = Ω(a,b)`; `Ω(a,*a) = ∫B(a∧*a) = ‖a‖²_{B,L²} > 0` for `a ≠ 0`; `dfl-atiyah-floer` 263: `⟨c,c′⟩ = Ω(c,J_*c′)` same sign | true (but owned twice, R01) |
| `relationSet r ζ g` | r1 | r1: `g=0, r=2, ζ=−1` empty; `r=1` a point; Mathlib `⁅a,b⁆ = a*b*a⁻¹*b⁻¹` | matches |
| `relationModuli_genus_one` (Lean 47) | r1 | r1: `r=1` point; `r=2, ζ=−1` one orbit (Heisenberg uniqueness); `ζ=1` two non-conjugate solutions | true; `IsPrimitiveRoot` excludes the wrong model |
| `relationSet_stabilizer_central` (Lean 55) | r1 | r1: `u = diag(e^{iθ},e^{−iθ})` commutes with `B` iff `u = ±1`; `ζ=1, x=(1,1), u=diag(i,−i)` is the negative control; eigenspace route `det = 1 = ζ^m ⇒ r ∣ m` | true |
| `relationModuli_simplyConnected` (Lean 66) | r1 | r1: `g=1` point; `g=2, r=2` is `N(2,1)`, `π₁ = 0`; `g=0, r≥2` empty, not `SimplyConnectedSpace` (needs `Nonempty`) | true; `hg` excludes the wrong model |
| `c₁ = 2r[ω]`, `τ_WW = 1/(2r)` (line 32) | r1 | r1: `r=2`: `c₁ = 2α = 4[ω]`; `r=1` Jacobian: `∫(−tr)(a∧b)` is `4π²` per integral generator | true for `B = −tr/(4π²)`; source form differs (R04) |
| `τ_FK = 1/(4r)`, `μ ∈ 4ℤ`, `w₂(TN_g) = 0`, `δ(E)`, `(−1)^m`, handle model, nonspin example, composition isomorphism, determinant-line signs, grading, weighted adjoints, shift congruence, tensoring, pillowcase, rank one | r1 | r1's computed values, unchanged statements | consistent |

**Headlines and padding.** Unchanged from r1: the connected field-theory functor, the smooth symplectic structure with `c₁ = 2r[ω]`, the elementary correspondences and relative-spin identity and the Cerf invariance are not statable at the pins and the module docstring (lines 12–22) says which carrier each lacks; the representation-model theorems are stated. The new rank-two paragraph adds no statable headline (no `SO(3)`-bundles, connections or Hodge star at the pins). No padding.

**Duplication by object this round.** `roadmaps grep --fixed` over main and the open heads for "odd-bundle surface moduli", "Hodge-star complex structure", "SO(3) adapter", "odd SO(3) surface moduli", "relationModuli": the only other hits are InstantonFloerTheory lines 15, 18, 52, 153, 155 (R01); no third roadmap states these objects. The previous round's source issues (ww-coprime Theorem 3.4.3's spin clause; eq. (26)'s normalization) stand; none new was found.

## Not verifiable

- Atiyah–Bott, *The Yang–Mills equations over Riemann surfaces* (1983), cited through `dfl-atiyah-floer` line 79 for the determinant-one quotient and through `ww-coprime` for Theorem 9.12: paywalled; read only the citing lines.
- Fixed points of the `H¹(X;ℤ/2)` action for `g ≥ 2` (pushforwards from the unramified double cover, Narasimhan–Ramanan): not fetched; the README's "not free" claim is witnessed at `g = 1` without it.

## Source issues

- none
