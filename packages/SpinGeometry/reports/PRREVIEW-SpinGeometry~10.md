# Review of SpinGeometry (pull request #1780 at dbb8f8d)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/SpinGeometry/` at `dbb8f8df184ab93f89b4f73414eb87a411eecd07`: 22 changed lines since `75f5a03` (the head the previous review read), all in `README.md` and all on one point, the convention for the vector action of an odd Clifford unit (the previous review's R03). `Suggested.lean` and `SourcePauliTargets.lean` are byte-identical to `75f5a03` (`git diff 75f5a03..HEAD -- TauCetiRoadmap/SpinGeometry/Suggested.lean TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean` is empty), `lake-manifest.json` is unchanged (Tau Ceti `358314d4`, Mathlib `f6090c70`), and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. The three changed passages were recomputed against the Tau Ceti definition they now cite (table below) and are correct at the pin; R03 is repaired and the repair introduces nothing new. Three findings remain, one blocking: the inherited roadmap-level supply cycle on main, re-raised for the reason under R01. It is the only blocking finding, it cannot be repaired inside this folder, and nothing in this diff or on main has moved on it, so the board's parking rule applies and a human ruling is the next step, not another repair round.

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the review at 75f5a03 (and of every earlier review of #1780 and #1674). The repair rounds answered it as not repairable inside the editable files. That reason is true as a fact and is not disputed; it does not remove the defect, because the principle is that every roadmap has a single direction of supply, and this folder still names as suppliers four roadmaps whose README on main names SpinGeometry as a supplier. This diff does not touch it and main has not moved.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7 supplies curvature identities"), `:56` ("CharacteristicClasses C1,C3.5 owns mod2 cohomology, universal w₂"), `:67` ("GeneralizedCohomology G5.5 specifies the real Hilbert and finite-Clifford functional-calculus").

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main at `dd4b28f1` (re-checked this round): `TauCetiRoadmap/GeneralizedCohomology/README.md:41–42` lists SpinGeometry G4.1 and G1.3 (`cliffordScalarTrace`, τ_ℂ) in its supplier table and `:1067, 1071, 1385` consume G4.1; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930, 1630` consume G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` consume G1.2/G2.2/G3.4; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:41, 937–938, 1136` consume G1.1 and G4.1. No foundations folder exists on main (`ls TauCetiRoadmap | grep -i 'spin\|clifford'` lists only `SpinGeometry`). The dependency check reports no cycle only because none of the five roadmaps is in `ORDER.txt`.

**Repair:** unchanged from the earlier rounds and not possible inside this folder alone: split the shared early objects (G1.3's scalar trace and complexification, G1.1's negative-form comparison and vector action, G4.1a's frame and rank-zero adapters, G1.2/G2.2's finite exterior-module comparisons) into a foundations roadmap that both sides import, with G5–G6 as its consumer; or repoint the four reverse citations on main to that owner. If the project rules that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, the remaining findings are both P3 and the folder is ready for final approval on that ruling.

## R02 (P3) — The companion file's docstrings still cite an unnamed "source"

Re-raised: R02 of the review at 75f5a03; the file is unchanged in this diff.

**Location:** `TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean:6` ("Source-ordered Pauli matrices"), `:22` ("Source order is (Z,Y,X)"), `:46`, `:61`, `:69`, `:100`.

**Claim:** the docstrings say "the source" for a text the file and the README never name.

**Witness:** `grep -n -i source SourcePauliTargets.lean` at the lines above; `grep -n 'Rieffel\|quantum Riemannian' README.md` is empty. The file remains a set of 2×2 matrix identities closed by `fin_cases`/`simp` (padding class "examples that compute values").

**Repair:** either delete the file (the G1.1 Checks carry every identity with its value) or replace "source" in the title and the five docstrings by "the (Z,Y,X) order", for instance `:46` "Cyclic products carry −i because (Z,Y,X) is an odd permutation of (X,Y,Z)".

## R03 (P3) — A second open pull request on this folder declares the same fully qualified names

Re-raised: R04 of the review at 75f5a03.

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 119, 136, 155` (`multiplicitySpace`, `IsGeometricAction`, `chirality`, `positiveSpinors`) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean` at `60cedda` (same author, same folder).

**Witness:** `roadmaps list` (index of 2026-11-04) shows `#1674 SpinGeometry @kim-em 60cedda` and `#1780 SpinGeometry @kim-em dbb8f8d`. Two open pull requests each build the same objects in the same folder.

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Previous findings

- R01 — not repaired: `README.md:14, 42, 56, 67` still name SpinRepresentations, RiemannianGeometry, CharacteristicClasses and GeneralizedCohomology as suppliers; the reverse citations on main at `dd4b28f1` are unchanged. Re-raised as R01.
- R02 — not repaired (file untouched in this diff): `SourcePauliTargets.lean:6, 22, 46, 61, 69, 100` still say "source" for an unnamed text. Re-raised as R02.
- R03 — repaired: `README.md:748–756` now computes the odd unit's action "by G1.1's twisted conjugation v↦involute(e₁)·v·e₁^(−1): e₁↦(−e₁)e₁(−e₁)=−e₁ and e₂↦(−e₁)e₂(−e₁)=e₁e₂e₁=e₂, the reflection in e₁^⊥", keeps the plain-conjugation values as the contrast, and `:152–157` pins the convention to `CliffordAlgebra.vectorMap`; `:814–817` makes the rank-one Check cite the same convention. All values recomputed below; no new problem introduced.
- R04 — not repaired (outside this diff): #1674 is still open at `60cedda` with the same four `def`s. Re-raised as R03.

## Verified sound

**Scope of the check.** The 22-line diff read line by line in context: G1.1 `:148–165` (the new convention paragraph), G4.1a Check 3 `:748–756`, G4.1b Check 3 `:811–817`, with the passages that cite or depend on them: G1.1's bivector sign `:148–151`, G4.1a's Checks 1–2 `:741–747` (Spin(2) squaring, rank 0 and 1), G4.1b Check 1 `:796` (conjugation by z(θ)), G5.3 `:960, 1014` (conjugation rotates V by 2θ), G4.2 `:927, 942` (consumers of "G1.1's pinned vector-conjugation action"). Commands run from the worktree: the gate (`gate SpinGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run at this head adds `build=0`); the dependency check (`depcheck: 204 roadmaps, 1671 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; SpinGeometry and its four reciprocal partners are not in `ORDER.txt`, which is why R01 is invisible to it); `lake env lean` on `Suggested.lean` itself (exit 0; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197, nothing else); `lake env lean` on a scratch copy with each of the nine `sorry` lines replaced by `first | rfl | (simp [the eight definitions]; done) | infer_instance | sorry` and `#check @name` for all 18 declarations appended (exit 0; the same nine `sorry` warnings, so no admitted theorem closes with one tactic and none is padding). The 18 elaborated types agree with the worker's `signatures.md` and with the README; the "looks dropped" lead on `diracInFrame` is a false positive (`inst_7 : (x : M) → NormedAddCommGroup (W x)` and `inst_8 : (x : M) → InnerProductSpace ℂ (W x)` are in the elaborated type). No `set_option`, no admitted `example`, no sorry'd data, no computational algorithm, no copied passage, no local path, no pull-request number and no process word in the new text (`git diff 75f5a03..HEAD | grep '^+'` matched none of "so far", "checkpoint", "handoff", "packet", "round", "review", "pull request").

**Library declarations opened this round, at the pins.** Tau Ceti `CliffordAlgebra.vectorMap` (`LinearAlgebra/CliffordAlgebra/Lipschitz/Action.lean:131–132`, `(ιInv Q).comp ((twistedConj Q x).comp (ι Q))`, under `[Invertible (2 : R)]`) with `twistedConj` (`:95–97`, `mulRight x⁻¹ ∘ mulLeft (involute x)`, so the action is v ↦ involute(x)·v·x⁻¹ exactly as `README.md:153` writes), its docstring (`:89–94`: the twist is what makes a vector act by the reflection in its orthogonal hyperplane, and on the even part involute is the identity so twisted and plain conjugation agree, the two claims of `README.md:154–157`), `twistedConj_ι_eq_reflection` (`:206–213`, under `[Invertible (Q v)]`, so "unit vector" at `:155` is within its hypothesis) and `lipschitzVectorAction` (`:240–275`). Mathlib `CliffordAlgebra.spinGroup` (`LinearAlgebra/CliffordAlgebra/SpinGroup.lean:292–293`, `pinGroup Q ⊓ (even Q).toSubring.toSubmonoid`) and `pinGroup` (`:153–154`, `lipschitzGroup ⊓ unitary`): the odd unit e₁ of Cl(0,2) is unitary (star e₁ = −e₁, e₁·star e₁ = −e₁² = 1) and Lipschitz, hence in Pin, but not even, hence not in Spin, which is what "the Spin carrier is the even part" (`:753–754`) and "on the even part, where Spin lives" (`:156`) assert. Tau Ceti `evenUnitaryGroup` (`Spin/EvenUnitary.lean:55`) and `range_spinGroup_toUnits` (`:585`), the two other names in the changed G1.1 paragraph. Everything else the roadmap names was resolved at the same pins by the reviews at 350d700, 862d263 and 75f5a03 and the pins have not moved.

**Cross-roadmap citations.** The worker's `citations.md` lists none unresolved; the new text cites only this roadmap's own G1.1 and one Tau Ceti file (resolved above), and adds no source locator. Re-checked this round on main at `dd4b28f1`: the four reverse citations under R01. Ownership: the diff adds no object; `roadmaps list` (441 open pull requests, index of 2026-11-04) shows the folder's two open pull requests (R03) and the board's package index lists no competing package.

**Source sample.** The brief names no target ids and the diff adds no locator, so no new locator was opened; the nineteen locators opened by the reviews at 862d263 and 75f5a03 stand unchanged in the text.

**Adversarial table.** Negative form Cl(0,n): e_j² = −1, e_j⁻¹ = −e_j, involute(e_j) = −e_j; positive form Cl(n,0): e_j² = +1, e_j⁻¹ = e_j. Rows marked "new" are this head's text, recomputed here; the other rows are carried from the review at 75f5a03 (itself carrying 862d263), whose values stand because the statements are untouched.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| G1.1 convention paragraph (152–157), new | general unit vector u with Q(u) invertible; even z | involute(u)·v·u⁻¹ = −u v u/Q(u); uv = 2B(u,v) − vu gives uvu = 2B(u,v)u − Q(u)v, so −uvu/Q(u) = v − 2B(u,v)u/Q(u), the reflection in u^⊥ (`twistedConj_ι_eq_reflection`); z even: involute(z) = z, so involute(z)vz⁻¹ = zvz⁻¹; Spin ⊆ even at the pin (`spinGroup = pinGroup ⊓ even`) | Pass |
| G4.1a Check 3 (748–756), new | e₁ ∈ Cl(0,2) | twisted: e₁ ↦ (−e₁)e₁(−e₁) = e₁³ = −e₁; e₂ ↦ (−e₁)e₂(−e₁) = e₁e₂e₁ = −e₁e₁e₂ = e₂; matrix diag(−1,1), determinant −1, the reflection in e₁^⊥; plain: e₁e₁e₁⁻¹ = e₁, e₁e₂(−e₁) = −e₁e₂e₁ = −e₂, diag(1,−1), determinant −1; both as written | Pass (R03 of 75f5a03 repaired) |
| G4.1b Check 3 (811–817), new | Cl(1,0), e₁² = 1 | involute(e₁)e₁e₁⁻¹ = (−e₁)e₁e₁ = −e₁, so e₁ acts by −1 ∉ SO(1) = {1}; plain: e₁e₁e₁ = e₁, the identity (which is why the Check now names the twisted convention); Spin(1) = {±1} ⊂ Cl(1,0)^even = ℝ | Pass |
| G4.1b Check 1 (796–805), untouched, consumer of the convention | z(θ) = cos θ + sin θ e₁e₂ ∈ even part | involute(z) = z, so the plain conjugation used there is the twisted one; z e₁ z⁻¹ = cos 2θ e₁ − sin 2θ e₂ as at 75f5a03 | Pass (75f5a03) |
| G5.3 "conjugation rotates V by 2θ" (960, 1014), untouched | z even in Cl(V,−g) | same agreement of the two conjugations on even elements; sign as at 75f5a03 (negative form e₁e₂ ↦ −e₁e₂ flips −2θ to +2θ) | Pass (75f5a03) |
| G3.4 Checks 1–3 (682–700) | flat ℝ², unit S², S¹ ⊂ ℝ² | as at 75f5a03: Df = df, (d − d*)* = d* − d; d(sin θ dφ) = cos θ dθ∧dφ, d*e² = 0; ranks 4 and 2 | Pass (75f5a03) |
| G4.1b Check 2 (806–810) | arc φ ∈ (−π,π) | lifts ±(cos(φ/2) − sin(φ/2)e₁e₂); no continuous square root on S¹ | Pass (75f5a03) |
| G4.1a Checks 1–2 (741–747) | Spin(2); ranks 0, 1 | z ↦ z², kernel ±1; Spin(1) = {±1}, Spin(0) = {1}, μ₂ = {±1} | Pass (862d263) |
| G4.2 Check 3 (846–852) | B = diag(4,1); B = Id | self-adjoint H with H² = Id: H = 2P − Id; only P = Id positive | Pass (75f5a03) |
| G6.6 Checks 1–3 (1344–1363) | flat plane; point; W = ℂʳ | c(v)(1,−1) = i(v₁ + iv₂)(1,1), winding +1; n = 0: Γ = Id, class 1; det (iz)^r | Pass (75f5a03) |
| Companion `source_cyclic_products`, `positiveModel_generator` (`SourcePauliTargets.lean:47, 95`) | i = 2; v = (1,0), (0,1) | XZ = −iY; X, Z | Pass (75f5a03; file unchanged) |
| G1.4 Checks 1–4 (406–426); G2.1 ψ(ω_ℂ) = −Γ (453–458) | n = 1, 3; general ℓ | ω_ℂ² = 1; n = 3: Γ = −X, λ = −i; i^(ℓ+1)(−i)^ℓ·λ = iλ | Pass (862d263) |
| G2.2 Checks 1–4 (515–533); G2.3 Checks 1, 3, 4 (551–568) | plane, c = ε − ι; two planes; A = ℂ⊕ℂ | Γ1 = i e₁∧e₂, Γ² = 1, c(e₁)²1 = −1; Γ_(V⊕W) = Γ_V⊗Γ_W; even part dim 2 | Pass (862d263) |
| G3.1–G3.3 Checks (598–670) | ranks 0, 1; Cl(0,3); Y; S¹; S² | w₁(ℝ⊕L) = w₁(L); |a²| = 2√2 > 2; Y² = Id; c(∂_θ)² = −Id; [iY,iZ] = −2iX; [R^S,c₁] = −c₂ | Pass (862d263) |
| G4.2 Checks 1–2 (841–845); G4.4 Checks (890–899) | S¹, S², rank 0; S¹, T², Sⁿ | two double covers of S¹, one of S²; |H¹| = 2, 4, 1 | Pass (862d263) |
| G5.0, G5.1, G5.3 Checks (939–1030) | Cl(0,1), Cl(0,2); ranks; S², T² | c₋C₊ + C₊c₋ = 0; 2^⌊n/2⌋ = 1,2,2,4; c₁(TS²) = 2 | Pass (862d263) |
| G6.0, G6.7 Checks (1174–1194, 1398–1412) | Cl(0,1); T³; S³; ℂ², ℂ; S⁴, K3 | ‖2+2ω‖ = 4 ≠ 2; Scal(S³)/4 = 3/2; J² = −1 on ℂ²; index 2 = Â(K3) | Pass (862d263) |
| G1.2 h (202–204) | h = g + i g(·,J·) | h(Ju,v) = i h(u,v) | Pass (862d263) |
| `cliffordScalarTrace_mul_two_pow`, `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 56, 63, 70) | Cl(0,1); V = 0; Q > 0; Q = 0; Q(e) = −1 | trace 2x = 2¹τ; 2⁰a = a; Σa_I²ΠQ(e_i) ≥ 0, = 0 iff a = 0; Q = 0 excluded by PosDef | Pass (862d263) |
| `exists_multiplicityEvaluation` (Lean 100) | S = ℂ², E = S⊗ℂ³; E = S; diagonal S | dim Hom = 3, 2·3 = 6; Schur; 8 ≠ 2 so ρ onto End(S) needed and present | Pass (862d263) |
| `cliffordMultiplication_anticommutator`, `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors` (Lean 126, 142, 148, 163) | (e₁,e₁), (e₁,e₂); ℓ = 1, 0; Q = 0 | 2(iZ)² = −2; −(ZY + YZ) = 0; Γ² = X² = Id; Γc(e₁) = −c(e₁)Γ; Q = 0 excluded by the geometric-action hypothesis | Pass (862d263) |
| `diracInFrame_eq` (Lean 197); `even_finrank_of_conjLinear_square_neg` (Lean 213, proved) | rotated frame; (2e₁,e₂); n = 0; ℂ², ℂ | cross terms cancel; 4c₁∇₁ + c₂∇₂ ≠ D; empty sum 0; as G6.7 Check 1 | Pass (862d263; elaborates) |

**Headline theorems.** Unchanged since 862d263 (`Suggested.lean` is byte-identical): stated are the normalized scalar trace with positivity and faithfulness (G1.3), the Morita evaluation (G1.3), the negative-metric Clifford relation (G1.2), chirality square, anticommutation and splitting (G2.1), frame independence of the Dirac contraction (G6.1), the quaternionic parity (G6.7, proved); not statable and named in the module docstring (`Suggested.lean:15–28`) with the missing carrier: Lichnerowicz and Bochner, the closed H¹ realization, spin existence and the H¹ torsor, the KO index class, ind D⁺ = 2α. The diff adds no headline and changes no Lean statement. No statable headline is absent, nothing is forced through a stand-in, no admitted theorem is one-tactic padding.

**Dependency check output.** `depcheck: 204 roadmaps, 1671 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line for SpinGeometry).

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (G4.3, G4.4, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, recorded `uncertified` in the manifest; cited by locator only. The diff adds no citation of either.
- The worker's 15-target sample: no target list or seed was supplied, and the diff adds no locator; nothing new was opened in `nicolaescu`.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps list` and `roadmaps grep`.

## Source issues

- none (no source passage was opened this round; the diff cites only a pinned Tau Ceti file).
