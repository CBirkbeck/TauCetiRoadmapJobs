# Review of SpinGeometry (pull request #1780 at 5baff38)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/SpinGeometry/` at `5baff38b4b96dab5a89546fdc06f2f579155801b`: 17 changed lines since `dbb8f8d` (the head the previous review read), all in `SourcePauliTargets.lean` and all docstrings (the module title and six declaration docstrings); no Lean statement, proof or import changed. `Suggested.lean` and `README.md` are byte-identical to `dbb8f8d` (`git diff --stat dbb8f8d..HEAD -- TauCetiRoadmap/SpinGeometry/Suggested.lean TauCetiRoadmap/SpinGeometry/README.md` is empty), `lake-manifest.json` is unchanged (Tau Ceti `358314d4`, Mathlib `f6090c70`), and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. Every new docstring was recomputed against the Lean statement under it (table below) and is correct; the previous review's R02 is repaired and the repair introduces nothing new. Two findings remain, one blocking: the inherited roadmap-level supply cycle on main, re-raised for the reason under R01. It is the only blocking finding, it cannot be repaired inside this folder, and neither this diff nor main (still at `dd4b28f1`) has moved on it, so the board's parking rule applies and a human ruling is the next step, not another repair round.

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the review at dbb8f8d (and of every earlier review of #1780 and #1674). The repair rounds answered it as not repairable inside the editable files. That reason is true as a fact and is not disputed; it does not remove the defect, because the principle is that every roadmap has a single direction of supply, and this folder still names as suppliers four roadmaps whose README on main names SpinGeometry as a supplier. This diff does not touch it and main has not moved.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7 supplies curvature identities"), `:56` ("CharacteristicClasses C1,C3.5 owns mod2 cohomology, universal w₂"), `:67` ("GeneralizedCohomology G5.5 specifies the real Hilbert and finite-Clifford functional-calculus").

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main at `dd4b28f1` (re-checked this round): `TauCetiRoadmap/GeneralizedCohomology/README.md:41–42` lists SpinGeometry G4.1 and G1.3 (`cliffordScalarTrace`, τ_ℂ) in its supplier table and `:1067, 1071, 1385` consume G4.1; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930, 1630` consume G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` consume G1.2/G2.2/G3.4; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:41, 937–938, 1136` consume G1.1 and G4.1. The same four supplier citations stand on main's own `TauCetiRoadmap/SpinGeometry/README.md:13, 36, 50, 61`, so the cycle is inherited, not introduced by this pull request. None of the five roadmaps is in `ORDER.txt`, which is why the dependency check reports no cycle.

**Repair:** unchanged from the earlier rounds and not possible inside this folder alone: split the shared early objects (G1.3's scalar trace and complexification, G1.1's negative-form comparison and vector action, G4.1a's frame and rank-zero adapters, G1.2/G2.2's finite exterior-module comparisons) into a foundations roadmap that both sides import, with G5–G6 as its consumer; or repoint the four reverse citations on main to that owner. If the project rules that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, the remaining finding is P3 and the folder is ready for final approval on that ruling.

## R02 (P3) — A second open pull request on this folder declares the same fully qualified names

Re-raised: R03 of the review at dbb8f8d.

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 115, 119, 136, 155` (`multiplicitySpace`, `cliffordMultiplication`, `IsGeometricAction`, `chirality`, `positiveSpinors`) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean` at `60cedda:52, 98, 101, 107, 123` (same author, same folder, same namespace).

**Witness:** `roadmaps list` (index of 2026-11-04) shows `#1674 SpinGeometry @kim-em 60cedda` and `#1780 SpinGeometry @kim-em 5baff38`; `roadmaps show SpinGeometry --pr 1674 --file Suggested.lean` declares the five names above. Two open pull requests each build the same objects in the same folder.

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Previous findings

- R01 — not repaired: `README.md:14, 42, 56, 67` still name SpinRepresentations, RiemannianGeometry, CharacteristicClasses and GeneralizedCohomology as suppliers; the reverse citations on main at `dd4b28f1` are unchanged. Re-raised as R01.
- R02 — repaired: `SourcePauliTargets.lean:6` now reads "Pauli matrices in the (Z,Y,X) order", `:22` "The Pauli matrices in the order (Z,Y,X); the standard order is (X,Y,Z)", `:46` "(Z,Y,X) is an odd permutation of (X,Y,Z)", `:61–62`, `:70–71`, `:90–91`, `:103` name the order or the positive-plane model; `grep -n -i source` matches only the identifiers `source` and `SourcePauli`. Each new sentence recomputed below; no new problem introduced.
- R03 — not repaired (outside this diff): #1674 is still open at `60cedda` with the same declarations. Re-raised as R02.

## Verified sound

**Scope of the check.** The 17-line diff read line by line in context: the module docstring `SourcePauliTargets.lean:5–13`, the docstrings at `:22, :46, :61–62, :70–71, :90–91, :103`, and the Lean statements under each (`source :23–24`, `source_cyclic_products :47–48`, `quaternion_equations :63–66`, `positiveVector :72–75`, `positiveModel :92–94`, `positive_generators :104–107`), together with the README passage the module docstring cites, G1.1 `README.md:167–197` (the Pauli pinning, the positive-plane generator map e₁↦X, e₂↦Z, the quaternion dictionary i, j, k ↦ iZ, iY, iX, and the three Checks on them). Commands run from the worktree: the gate (`gate SpinGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run at this head adds `build=0`); the dependency check (`depcheck: 204 roadmaps, 1671 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; SpinGeometry and its four reciprocal partners are not in `ORDER.txt`, which is why R01 is invisible to it); `lake env lean` on `SourcePauliTargets.lean` (exit 0, no diagnostics at all: every theorem in the companion is proved, none admitted); `lake env lean` on `Suggested.lean` (exit 0; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197, nothing else). The companion declares no section `variable`, so no binder can have been dropped from its thirteen declarations; the eighteen elaborated types of `Suggested.lean` in the worker's `signatures.md` are those of `dbb8f8d` (file byte-identical), compared with the README by the previous review, the "looks dropped" lead on `diracInFrame` remaining a false positive (both fibrewise instances are in the elaborated type). The one-tactic probe is carried from the previous review for the same reason (no admitted statement changed). Lean form of the companion: `import Mathlib` plus two `TauCeti.*` modules that exist at the pin, `theorem` throughout, a docstring on every declaration, no `set_option`, no `lemma`, no admitted `example`, no sorry'd data. No local path, pull-request number or process word in the new text (`git diff dbb8f8d..HEAD | grep '^+'` matched none of "so far", "checkpoint", "handoff", "packet", "round", "review", "pull request"); the pull-request description names "Rieffel's quantum Riemannian notes" as the text behind the (Z,Y,X) order, and neither the folder nor the manifest cites that text, which is now consistent since no file refers to a source.

**Library declarations opened this round, at the pins.** Tau Ceti `Quaternion.toComplexMatrix` (`Algebra/Quaternion/ComplexMatrix.lean`, the embedding under which `native_quaternion_dictionary :31–34` proves i, j, k ↦ iZ, iY, iX, elaborated, not assumed) and `TauCeti.realCliffordForm` with `realCliffordWeight` (`LinearAlgebra/CliffordAlgebra/RealForm/Basic.lean`, used by `positiveVector_square :78–88`, whose `hform` step computes `realCliffordForm 2 0 v = v 0 * v 0 + v 1 * v 1`, the positive-definite plane); Mathlib `CliffordAlgebra.lift` and `CliffordAlgebra.lift_ι_apply` (`positiveModel :92–94`, `positiveModel_generator :98–101`). Everything else the folder names was resolved at the same pins by the reviews at 350d700, 862d263, 75f5a03 and dbb8f8d, and the pins have not moved.

**Cross-roadmap citations.** The worker's `citations.md` lists none unresolved; the diff adds no citation and no locator. Re-checked this round on main at `dd4b28f1`: the four reverse citations under R01. Ownership: the diff adds no object; `roadmaps list` (441 open pull requests, index of 2026-11-04) shows the folder's two open pull requests (R02) and the board's package index lists no competing package.

**Source sample.** The brief names no target ids and the diff adds no locator, so no new locator was opened; the nineteen locators opened by the reviews at 862d263 and 75f5a03 stand unchanged in the text.

**Adversarial table.** Pauli matrices X = [[0,1],[1,0]], Y = [[0,−i],[i,0]], Z = diag(1,−1); `source 0 = Z`, `source 1 = Y`, `source 2 = X`. Rows marked "new" are this head's docstrings, recomputed here against the statement under each; the other rows are carried from the review at dbb8f8d (itself carrying 75f5a03 and 862d263), whose values stand because the statements are untouched.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Module title and `source` docstring (`SourcePauliTargets.lean:6, 22`), new | the three entries of `source :24` | entry 0 = diag(1,−1) = Z, entry 1 = [[0,−i],[i,0]] = Y, entry 2 = [[0,1],[1,0]] = X: the order (Z,Y,X), the reverse of the standard (X,Y,Z) | Pass |
| `source_cyclic_products` docstring "(Z,Y,X) is an odd permutation of (X,Y,Z)" (`:46`), new | i = 0, 1, 2 | ZY = [[0,−i],[−i,0]] = −iX; YX = [[−i,0],[0,i]] = −iZ; XZ = [[0,−1],[1,0]] = −iY; the standard XY = iZ, YZ = iX, ZX = iY; the reorder is the transposition X↔Z, sign −1, which flips ε and hence the sign of i | Pass |
| `quaternion_equations` docstring "i² = −1 and ij = k of the standard triple" (`:61–62`), new | (iZ,iY,iX) | (iZ)² = −Z² = −Id; (iZ)(iY) = −ZY = −(−iX) = iX; (iY)(iX) = −YX = iZ; (iX)(iZ) = −XZ = iY: the Hamilton relations i² = −1, ij = k, jk = i, ki = j; agrees with `native_quaternion_dictionary :31` (i, j, k ↦ iZ, iY, iX) and README G1.1 Check 2 `:191–192` | Pass |
| `positiveVector` and `positiveModel` docstrings "e₁ ↦ X and e₂ ↦ Z" (`:70–71, 90–91`), new | v = (1,0), (0,1); general v | [[v 1, v 0],[v 0, −v 1]] at (1,0) is [[0,1],[1,0]] = X, at (0,1) is [[1,0],[0,−1]] = Z; square = (v0² + v1²)·Id = `realCliffordForm 2 0 v` (both weights +1), so the lift exists; README G1.1 `:172` and Check 1 `:188` say the same | Pass |
| `positive_generators` docstring (`:103`) | e₁e₂ | X·Z = [[0,−1],[1,0]] = −iY, real with square −Id, as README G1.1 Check 1 `:188–189` | Pass |
| README G1.1 Check 3 negative control (`:193–197`), consumer of the (Z,Y,X) order, untouched | XYZ, ZYX; H = (X+Z)/√2 | XYZ = (iZ)Z = i·Id, ZYX = Z(−iZ) = −i·Id, distinct scalars so no conjugation realises the reorder; H² = (X² + Z² + XZ + ZX)/2 = Id, HXH = Z, HZH = X, HYH = −Y | Pass (75f5a03) |
| G1.1 convention paragraph (152–157) | unit vector u, even z | involute(u)·v·u⁻¹ = reflection in u^⊥; z even acts by plain conjugation; Spin ⊆ even at the pin | Pass (dbb8f8d) |
| G4.1a Check 3 (748–756); G4.1b Check 3 (811–817) | e₁ ∈ Cl(0,2); Cl(1,0) | twisted: diag(−1,1); plain: diag(1,−1); e₁ acts by −1 ∉ SO(1) | Pass (dbb8f8d) |
| G4.1b Check 1 (796–805); G5.3 "rotates V by 2θ" (960, 1014) | z(θ) even | z e₁ z⁻¹ = cos 2θ e₁ − sin 2θ e₂; negative form flips to +2θ | Pass (75f5a03) |
| G3.4 Checks 1–3 (682–700) | flat ℝ², S², S¹ | Df = df, (d − d*)* = d* − d; d*e² = 0; ranks 4 and 2 | Pass (75f5a03) |
| G4.1b Check 2 (806–810); G4.1a Checks 1–2 (741–747) | arc; Spin(2), ranks 0, 1 | lifts ±(cos(φ/2) − sin(φ/2)e₁e₂); z ↦ z², kernel ±1; Spin(1) = {±1}, Spin(0) = {1} | Pass (75f5a03, 862d263) |
| G4.2 Check 3 (846–852); G6.6 Checks 1–3 (1344–1363) | B = diag(4,1), Id; flat plane, point, ℂʳ | H = 2P − Id; winding +1; class 1; det (iz)^r | Pass (75f5a03) |
| G1.4 Checks 1–4 (406–426); G2.1 ψ(ω_ℂ) = −Γ (453–458) | n = 1, 3; general ℓ | ω_ℂ² = 1; n = 3: Γ = −X, λ = −i; i^(ℓ+1)(−i)^ℓ·λ = iλ | Pass (862d263) |
| G2.2 Checks 1–4 (515–533); G2.3 Checks (551–568) | plane, c = ε − ι; two planes; ℂ⊕ℂ | Γ = i e₁∧e₂, Γ² = 1, c(e₁)² = −1; Γ_(V⊕W) = Γ_V⊗Γ_W; even part dim 2 | Pass (862d263) |
| G3.1–G3.3 Checks (598–670) | ranks 0, 1; Cl(0,3); S¹; S² | w₁(ℝ⊕L) = w₁(L); |a²| = 2√2 > 2; c(∂_θ)² = −Id; [iY,iZ] = −2iX; [R^S,c₁] = −c₂ | Pass (862d263) |
| G4.2 Checks 1–2 (841–845); G4.4 Checks (890–899) | S¹, S², rank 0; S¹, T², Sⁿ | two double covers of S¹, one of S²; |H¹| = 2, 4, 1 | Pass (862d263) |
| G5.0, G5.1, G5.3 Checks (939–1030) | Cl(0,1), Cl(0,2); ranks; S², T² | c₋C₊ + C₊c₋ = 0; 2^⌊n/2⌋ = 1,2,2,4; c₁(TS²) = 2 | Pass (862d263) |
| G6.0, G6.7 Checks (1174–1194, 1398–1412) | Cl(0,1); T³; S³; ℂ², ℂ; S⁴, K3 | ‖2+2ω‖ = 4 ≠ 2; Scal(S³)/4 = 3/2; J² = −1 on ℂ²; index 2 = Â(K3) | Pass (862d263) |
| G1.2 h (202–204) | h = g + i g(·,J·) | h(Ju,v) = i h(u,v) | Pass (862d263) |
| `cliffordScalarTrace_mul_two_pow`, `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 56, 63, 70) | Cl(0,1); V = 0; Q > 0; Q = 0 | trace 2x = 2¹τ; 2⁰a = a; Σa_I²ΠQ(e_i) ≥ 0, = 0 iff a = 0; Q = 0 excluded by PosDef | Pass (862d263) |
| `exists_multiplicityEvaluation` (Lean 100) | S = ℂ², E = S⊗ℂ³; E = S | dim Hom = 3, 2·3 = 6; Schur; ρ onto End(S) needed and present | Pass (862d263) |
| `cliffordMultiplication_anticommutator`, `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors` (Lean 126, 142, 148, 163) | (e₁,e₁), (e₁,e₂); ℓ = 1, 0; Q = 0 | 2(iZ)² = −2; −(ZY + YZ) = 0; Γ² = X² = Id; Γc(e₁) = −c(e₁)Γ; Q = 0 excluded by the geometric-action hypothesis | Pass (862d263) |
| `diracInFrame_eq` (Lean 197); `even_finrank_of_conjLinear_square_neg` (Lean 213, proved) | rotated frame; (2e₁,e₂); n = 0; ℂ², ℂ | cross terms cancel; 4c₁∇₁ + c₂∇₂ ≠ D; empty sum 0; as G6.7 Check 1 | Pass (862d263; elaborates) |

**Headline theorems.** Unchanged since 862d263 (`Suggested.lean` is byte-identical): stated are the normalized scalar trace with positivity and faithfulness (G1.3), the Morita evaluation (G1.3), the negative-metric Clifford relation (G1.2), chirality square, anticommutation and splitting (G2.1), frame independence of the Dirac contraction (G6.1), the quaternionic parity (G6.7, proved); not statable and named in the module docstring (`Suggested.lean:15–28`) with the missing carrier: Lichnerowicz and Bochner, the closed H¹ realization, spin existence and the H¹ torsor, the KO index class, ind D⁺ = 2α. The diff adds no headline and changes no Lean statement. No statable headline is absent, nothing is forced through a stand-in, no admitted theorem is one-tactic padding (probe of dbb8f8d, file unchanged).

**Dependency check output.** `depcheck: 204 roadmaps, 1671 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line for SpinGeometry).

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (G4.3, G4.4, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, recorded `uncertified` in the manifest; cited by locator only. The diff adds no citation of either.
- The worker's 15-target sample: no target list or seed was supplied, and the diff adds no locator; nothing new was opened in `nicolaescu`.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps list` and `roadmaps grep`.

## Source issues

- none (no source passage was opened this round; the diff cites no source).
