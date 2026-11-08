# Review of SpinGeometry (pull request #1780 at ab00492)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/SpinGeometry/` at `ab0049239e8119d6339fcef47f176c41b4fc1178`: 5 changed lines since `5077274` (the head the previous review read), all inside the one paragraph of `## Dependency order and references` at `README.md:1454–1462`. `Suggested.lean` is unchanged (`git diff 5077274..HEAD` on it is empty; the file is byte-identical to the `5baff38` file), `lake-manifest.json` is unchanged, and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. The gate passes. The change repairs the previous R03 exactly as requested: the Weitzenböck consumer is now G6.4 and the GeneralizedCohomology clause lists the G4.0a, G5.0 and G5.4 edges. Every edge the corrected paragraph asserts was resolved on main at `3b51055b` (main moved since the previous review's `d0bb87a6`; the four reverse-citing files are unchanged, same line numbers). The previous R01 (the inherited roadmap-level supply cycle) and R02 (the second open pull request on this folder) are unchanged, so the only blocking finding again re-raises a finding the repair rounds marked not actionable in this folder, and the parking rule applies: a human decides whether an inherited two-way edge between roadmaps on main is a defect of a revision pull request.

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the reviews at 5077274, 6317a77, 5c4c231 and 5baff38 (and of every earlier review of #1780 and #1674). The repair rounds marked it not actionable in this package because the reverse citations live on main in four other folders. That is true as a statement of fact and is not disputed; it fails as a reason to settle the finding because the contract makes a cycle a design defect wherever it was introduced ("every roadmap has a single direction of supply … cycles are design defects and are broken by moving ownership"), the merge order cannot express an interleaving of sections, and nothing on main has moved: the four reverse citations are at the same lines at `3b51055b` as at `d0bb87a6`.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7"), `:56` ("CharacteristicClasses C1,C3.5 owns"), `:67` ("GeneralizedCohomology G5.5").

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main at `3b51055b` (re-checked this round): `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:937–938` and `:1136–1137` consume G1.1 and G4.1; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` (R7 is `:1293–1403`) consume G1.2, G2.2 and G3.4; `TauCetiRoadmap/GeneralizedCohomology/README.md:41–42, 1067, 1071, 1385, 1596, 1908` consume G4.1 and G1.3; `TauCetiRoadmap/CharacteristicClasses/README.md:1195, 1214, 1994` consume G4.1a. Main's own `TauCetiRoadmap/SpinGeometry/README.md:13, 36, 50, 61` carries the same four supplier citations, so the cycle is inherited, not introduced here. None of the five roadmaps is in `ORDER.txt`, which is why the dependency check reports no cycle. The paragraph corrected at this head (`README.md:1454–1462`) states the section-level order, which is acyclic (verified below).

**Repair:** unchanged from the earlier rounds and not possible inside this folder alone. The sections the four roadmaps consume (G1.1, G1.2, G1.3, G2.2, G3.4, G4.1a, G4.1b) cite none of them back, so they can move as they stand into a foundations roadmap that SpinRepresentations L7, RiemannianGeometry R7, GeneralizedCohomology G4–G5 and CharacteristicClasses C3.5 import, with G5–G6 here as their consumer; or the four reverse citations on main are repointed to that owner. If the project rules that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, the only remaining finding is R02 (P3).

## R02 (P3) — A second open pull request on this folder declares the same fully qualified names

Re-raised: R02 of the reviews at 5077274 and 6317a77 (R03 at 5c4c231, R02 at 5baff38).

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 115, 119, 136, 142, 148, 155, 159, 163` (`multiplicitySpace`, `cliffordMultiplication`, `IsGeometricAction`, `chirality`, `chirality_sq`, `chirality_anticommutes`, `positiveSpinors`, `negativeSpinors`, `isCompl_spinors`) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean` at `e586e98:56, 102, 105, 111, 115, 120, 127, 131, 135` (same author, same namespace `TauCetiRoadmap.SpinGeometry`).

**Witness:** `roadmaps list` (index of 2026-11-05T20:33Z) shows `#1674 SpinGeometry @kim-em e586e98` and `#1780 SpinGeometry @kim-em ab00492`; #1674 is unchanged since the last round, so the nine shared declarations recorded in the review at 6317a77 stand.

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Previous findings

- R01 — not repaired: `README.md:14, 42, 56, 67` unchanged; the reverse citations on main at `3b51055b` are at the same lines as at `d0bb87a6`. The diff changes no supplier citation. Re-raised as R01.
- R02 — not repaired (outside this diff): #1674 is still open at `e586e98` with the nine shared declarations. Re-raised as R02.
- R03 — repaired: `README.md:1457–1460` now reads "RiemannianGeometry R7 consumes G1.2, G2.2 and G3.4 and supplies G6.4 its real Weitzenböck term; GeneralizedCohomology G4.0a, G5.0 and G5.4 consume G4.1, G5.5 consumes G1.3, and G5.5 supplies G5.0 and G6.0". Both corrections match the repair asked for; each clause resolves (table below). No new problem introduced.

## Verified sound

**Scope of the check.** The whole diff (`changes.md`: 3 insertions, 2 deletions, one file) was read in context (`README.md:1446–1470`); every edge the corrected paragraph asserts was resolved on main at `3b51055b` and against this README's section numbering and `*Needs:*` lines; `Suggested.lean` was re-elaborated although unchanged. Commands run from the worktree:

- the gate, my own run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`;
- the dependency check: `depcheck: 238 roadmaps, 2277 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for SpinGeometry (the five roadmaps of R01 are not in `ORDER.txt`);
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean`: exit 0 in 9.7 s; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197 and nothing else, as at 5077274 and 6317a77;
- `git diff --stat 5077274..HEAD`: `README.md | 5 +++--` only; `git diff 5077274..HEAD -- Suggested.lean`: empty; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'`: empty; the folder holds `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml` (gate `stray-files=0`);
- `lake-manifest.json` pins unchanged: Mathlib `f6090c70`, Tau Ceti `358314d4`;
- the elaborated signatures (`signatures.md`, 18 declarations): the single "looks dropped" lead on `diracInFrame` is the same false positive as the last four rounds; its elaborated type carries `[inst_7 : (x : M) → NormedAddCommGroup (W x)]` and `[inst_8 : (x : M) → InnerProductSpace ℂ (W x)]` (signatures.md lines 192–193). The file is unchanged, so the eighteen types are those the reviews at 862d263 through 6317a77 compared with the README;
- the one-tactic probe, README/Lean name agreement, Lean form and headline inventory are unchanged from the review at 6317a77 (file byte-identical; nine admitted statements, one proved parity theorem, five not-statable headlines named in the module docstring at lines 15–28);
- the corrected paragraph's style: no LaTeX, no process word, no pull-request number, no path; roadmaps cited by name and section.

**The corrected paragraph's edges, resolved.** Each clause of `README.md:1454–1462` against main at `3b51055b` and this README. G6's items are numbered from 0 (item 0 at `:1044`), so item 4 at `:1308` is G6.4; GeneralizedCohomology's G4 item 0 starts at `:938` with the G4.0a block at `:940–1081` and G4.0b from `:1082`, G5 item 0 at `:1375`, item 4 at `:1559`, item 5 (G5.5) at `:1687`.

| Clause | Reverse edge on main (file:line, section) | Forward edge here (line, section) | Back-citation from the consumed section? |
| --- | --- | --- | --- |
| SpinRepresentations L7 consumes G1.1's negative-form comparison and G4.1's frame refinement | `SpinRepresentations/README.md:937–938` (Layer 7), `:1136–1137` (Ordering) | — | G1.1 `*Needs:*` `:181–184`, G4.1a `:736–738`, G4.1b `:789–792`: no SpinRepresentations input (`:786` names L7 as a consumer). None |
| L7 supplies G6 its real Clifford classification | — | `:1152` (G6.0), `:1378` and `:1422` (G6.7, item 7 at `:1375`) | — |
| RiemannianGeometry R7 consumes G1.2, G2.2 and G3.4 | `RiemannianGeometry/README.md:1337` (R7.4), `:1388` (R7.8), inside R7 `:1293–1403`; `:117` supplier line | — | G1.2 `:221–225`, G2.2 `:514–517`, G3.4 `:681–684`: no RiemannianGeometry input. None |
| R7 supplies G6.4 its real Weitzenböck term (corrected) | — | `:1310` and `:1318` are both inside item 4 at `:1308` (= G6.4); `:691` says "as G6.4 states"; G6.3 (`:1294–1307`) cites R1 only | — |
| GeneralizedCohomology G4.0a, G5.0 and G5.4 consume G4.1 (corrected) | `GeneralizedCohomology/README.md:1067, 1071` (inside G4.0a `:940–1081`, before G4.0b at `:1082`); `:1385` (G5.0, item 0 at `:1375`); `:1596` (G5.4, item 4 at `:1559–1686`); `:41` supplier table | — | G4.1a/G4.1b as above: no GeneralizedCohomology input. None |
| G5.5 consumes G1.3 (corrected) | `:1908` (G5.5, item 5 at `:1687`); `:42` supplier table; `:2595` "precedes G5.5 … no returned input" | — | G1.3 `*Needs:*` `:353–360`: Mathlib, Tau Ceti, G1.2. None |
| G5.5 supplies G5.0 and G6.0 | `:1772` names SpinGeometry G5.0/G6.0 as the consumer of the orientation | `:940, 945` (G5.0, item 0 at `:913`); `:1098, 1127, 1178` (G6.0) | — |
| G4.1a → CharacteristicClasses C3.5 → G4.3 (pre-existing sentence `:1451–1453`) | `CharacteristicClasses/README.md:1195, 1214` (C3 `:1000–1320`), `:1994` | `:876` (G4.3) consumes C3.5; `:735` "precedes C3.5" | G4.1a `:736–738`: none |

So "no section here uses a result of a section that consumes it" holds for all four roadmaps, and both labels the previous R03 flagged are now right.

**Headline theorems.** Unchanged from the review at 6317a77: stated are the normalized scalar trace with positivity and faithfulness (G1.3, lines 56–73), the Morita evaluation (G1.3, line 100), the negative-metric Clifford relation (G1.2, line 126), chirality square, anticommutation and splitting (G2.1, lines 142–166), frame independence of the Dirac contraction (G6.1, line 197), the quaternionic parity (G6.7, line 213, proved); not statable and named in the module docstring: Lichnerowicz and Bochner, the closed-base H¹ realization, spin existence and the H¹ torsor, the KO index class, ind D⁺ = 2α. No statable headline is absent, nothing is forced through a stand-in, nothing is padding.

**Source sample.** The diff touches no mathematical statement and no locator; the previous report's sample of 15 locators plus 3 extra, every one opened in `nicolaescu` (printed page = page marker − 12) and found to support the statement, is carried forward unchanged (its table is in the review at 5c4c231). The corrected paragraph cites no source.

**Adversarial table.** Every admitted or proved statement of this head is unchanged from `5baff38`, so its row is carried from the reviews at 5077274 and 6317a77 (and the reviews they cite); one row is recomputed for the changed passage. Pauli matrices X = [[0,1],[1,0]], Y = [[0,−i],[i,0]], Z = diag(1,−1).

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Dependency paragraph `README.md:1454–1462` (changed) | each of the eight clauses above | reverse edges on main 3b51055b: SpinReps :937–938; RG :1337, :1388; GC :1067/1071 (G4.0a, < :1082), :1385 (G5.0), :1596 (G5.4), :1908 (G5.5); CC :1195/1214. Forward edges: L7 ← G6.0 :1152, G6.7 :1378/1422; R7 ← item 4 at :1308 = G6.4 (:1310/1318), G6.3 cites R1 only; G5.5 ← G5.0 :940/945, G6.0 :1098/1127/1178; C3.5 ← G4.3 :876. Back-citations from G1.1/G1.2/G1.3/G2.2/G3.4/G4.1a/G4.1b `*Needs:*`: 0 of 7 | Pass: direction claim and both corrected labels hold |
| G1.3 `cliffordScalarTrace_mul_two_pow`, `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 56, 63, 70) | Cl(0,1), a = 2.5 − e; V = 0; Q = 0 | L_a = [[x,−y],[y,x]] of trace 5 = 2¹·τ(a); 2⁰τ(a) = a; Q = 0: τ(reverse(e)e) = 0 with e ≠ 0, excluded by `Q.PosDef` | Pass (5c4c231, carried at 6317a77, 5077274) |
| `exists_multiplicityEvaluation` (Lean 100) | S = ℂ², E = S⊗ℂ³; E = S; ρ not onto | dim Hom = 3, 2·3 = 6; Schur gives ℂ·Id; S = ℂ²⊕ℂ² diagonal, E = ℂ²: 8 ≠ 2 | Pass (862d263) |
| G1.2 `IsGeometricAction`, `cliffordMultiplication_anticommutator` (Lean 119, 126) | c(e₁) = iZ, c(e₂) = iY; V = ℝ, c = 1 | 2(iZ)² = −2Id = −2⟨e₁,e₁⟩Id; ZY + YZ = 0; c = 1 is Hermitian and squares to +1, both clauses fail | Pass (5c4c231) |
| G2.1 `chirality`, `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors` (Lean 136–166) | ℓ = 1 negative plane; ℓ = 0; Q = 0 | Γ = i(iZ)(iY) = −X, Γ² = Id; Γ(1,−1) = (1,−1), c(e₁)(1,−1) = i(1,1) ∈ S⁻; Γc(e₁) + c(e₁)Γ = 0; ℓ = 0: empty product Id, S⁺ = S, S⁻ = 0; Q = 0 with c = 0 gives Γ = 0, excluded by Q(v) ≠ −⟨v,v⟩ | Pass (5c4c231) |
| `diracInFrame_eq` (Lean 197) | rotated frame; (2e₁,e₂); n = 0 | cross terms cancel; 4c₁∇₁ + c₂∇₂ ≠ D; empty sum 0 | Pass (862d263) |
| G6.7 `even_finrank_of_conjLinear_square_neg` (Lean 213, proved) and README Check 1 | J(z₁,z₂) = (−z̄₂, z̄₁) at z = (0.3+0.4i, −1+2i); ℂ | J²z = −z; on ℂ, J(z) = a z̄ has J²z = |a|²z ≠ −z | Pass (5c4c231; elaborates this round) |
| README G1.1 Hadamard witness (`:195–197`); G1.1 convention paragraph (`:152–157`); G4.1a Check 3 (`:748–756`); G4.1b Check 3 (`:811–817`) | H = (X+Z)/√2; unit u, even z; e₁ ∈ Cl(0,2); Cl(1,0) | H² = Id, HXH = Z, HZH = X, HYH = −Y; involute(u)·v·u⁻¹ = reflection in u^⊥; twisted diag(−1,1), plain diag(1,−1); e₁ acts by −1 ∉ SO(1) | Pass (5c4c231, dbb8f8d) |
| G1.4 n = 3 labels (`:410–417`) and Checks 1, 4 (`:406–409, 418–426`) | c(e_j) = iZ, iY, iX; n = 1; ψ | ω acts by i³ZYX = −Id, ω_ℂ = +Id; c(e₃) = iX = λΓ, λ = −i; ω_ℂ² = 1; ψ(e₁)² = −1, ψ(e₁e₂e₃) = −e₁e₂e₃e₀ | Pass (5c4c231, 862d263) |
| G2.2 Checks 1–4 (`:515–533`); G2.3 Checks (`:551–568`) | plane, c = ε − ι; two planes | Γ = i e₁∧e₂ on 1, Γ² = 1, c(e₁)² = −1; Γ_(V⊕W) = Γ_V⊗Γ_W | Pass (862d263) |
| G3.3 curvature compatibility on S² (`:672–676`); G3.4 Checks 1–3 (`:687–711`) | R^S = −½c(e₁)c(e₂); flat ℝ², S², S¹ | [R^S, c(e₁)] = −c(e₂) = c(R(e₁,e₂)e₁), ½ in place of ¼ gives −2c(e₂); Df = df, (d − d*)* = d* − d; d*e² = 0 | Pass (5c4c231, 75f5a03) |
| G4.1b rotation (`:795–805`) and G5.3 (`:1026–1030`) | z = cos θ + sin θ e₁e₂, θ = 0.7 | z e₁ z⁻¹ = cos 2θ e₁ − Q(e₁) sin 2θ e₂: −sin 2θ e₂ (Q = +1), +sin 2θ e₂ (Q = −1); ρ(z) on (1,−1) is e^{−iθ} = 0.7648 − 0.6442i | Pass (5c4c231) |
| G4.2 Check 3 (`:846–852`); G4.4 Checks (`:890–899`) | B = diag(4,1), Id; S¹, T², Sⁿ | H = 2P − Id, Sylvester 2H at Id; |H¹| = 2, 4, 1 | Pass (862d263) |
| G3.1–G3.2 Checks (`:598–640`); G5.0–G5.1 Checks (`:939–1010`) | ranks 0, 1; Cl(0,3); S¹; Cl(0,1), Cl(0,2) | w₁(ℝ⊕L) = w₁(L); |a²| = 2√2; c(∂_θ)² = −Id; c₋C₊ + C₊c₋ = 0; 2^⌊n/2⌋ = 1,2,2,4 | Pass (862d263) |
| G6.0 T³ norm witness (`:1188–1192`); G6.0 Checks 1, 3, 4 (`:1174–1194`); G6.6 symbol winding (`:1354–1362`); G6.7 Checks 2–4 (`:1398–1412`) | s = 1 + ω; S², T²; v = (1,0), (0,1), (−1,0); K3, S⁴ | (1+ω)² = 2 + 2ω, eigenvalues 0 and 4, norm 4, scalar part 2; c₁(TS²) = 2, Scal(S³)/4 = 3/2; c(v)(1,−1) = i(v₁+iv₂)(1,1), winding +1; ω₋² = 1, Γ = −ω₋; index 2 = Â(K3) | Pass (5c4c231, 862d263) |

**Pinned declarations.** The file is unchanged; its Mathlib uses (`CliffordAlgebra.equivExterior`, `ExteriorAlgebra.algebraMapInv`, `CliffordAlgebra.reverse`, `CliffordAlgebra.ι`, `LinearMap.trace`, `LinearMap.mulLeft`, `QuadraticMap.PosDef`, `OrthonormalBasis`, `CovariantDerivative`, `Bundle.RiemannianBundle`, `TangentSpace`, `Module.finBasis`, `Matrix.det_mul`, `Matrix.det_neg`, `RingHom.map_det`, `Complex.normSq_nonneg`) all resolve in this round's elaboration at the pin (Mathlib `f6090c70`, Tau Ceti `358314d4` per `lake-manifest.json`, unchanged).

**Cross-roadmap citations.** The worker's `citations.md` lists none found nowhere. Resolved this round on main at `3b51055b`: the four supplier citations (`:14, 42, 56, 67`), every section the corrected paragraph names (SpinRepresentations Layer 7 inside `## The build, in layers` `:314–1094`; RiemannianGeometry R7 `:1293–1403`; GeneralizedCohomology G4.0a `:940–1081`, G5.0 `:1375`, G5.4 `:1559`, G5.5 `:1687–1920`; CharacteristicClasses C3.5 within C3 `:1000–1320`), and the reverse edges listed under R01.

**Ownership.** `roadmaps list` (index of 2026-11-05T20:33Z) shows the folder's two open pull requests (R02) and the pin-bump pull request #1800 by the reviewing worker, which adapts existing folders including this one and builds no competing object; the board's package index lists no competing package. Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps list`.

**Declared gaps.** None declared (no readable `design/plan.json`); the README states none.

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (G4.3, G4.4, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, recorded `uncertified` in the manifest; cited by locator only. The diff touches neither.
- The manifest's `kirby` entry (cited for "G4.4a") is not cited by the README, which has no G4.4a; nothing in the folder depends on it, so it was not opened.

## Source issues

- none
