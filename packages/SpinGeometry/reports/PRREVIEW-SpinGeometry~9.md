# Review of SpinGeometry (pull request #1780 at 75f5a03)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/SpinGeometry/` at `75f5a03aebd5577ae82848a17cd95ea2f1b5acef`: 86 changed lines since `862d263` (the head the previous review read), all inside the folder. `README.md` gains three `**Checks.**` blocks (G3.4, G4.1b, G6.6) and a corrected G4.2 Check; `SourcePauliTargets.lean` gets a new header paragraph and docstrings on its five bare declarations. `Suggested.lean` is byte-identical to `862d263` (`git diff 862d263..HEAD -- TauCetiRoadmap/SpinGeometry/Suggested.lean` is empty) and `lake-manifest.json` is unchanged (Tau Ceti `358314d4`, Mathlib `f6090c70`); `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. Every new Check was recomputed (table below); all are correct at the pins. Four findings, one blocking: the inherited roadmap-level supply cycle on main, re-raised for the reason under R01. Since it is the only blocking finding and cannot be repaired inside this folder, the board's parking rule applies and a human ruling is the next step, not another repair round.

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the review at 862d263 (and of every earlier review of #1780 and #1674). The repair rounds answered it as not repairable inside the two editable files. That reason is true as a fact and is not disputed; it does not remove the defect, because the principle is that every roadmap has a single direction of supply, and this folder, as revised here, still names as suppliers four roadmaps whose README on main names SpinGeometry as a supplier. Nothing in this diff touches it, and main has not moved on it.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7 supplies curvature identities"), `:56` ("CharacteristicClasses C1,C3.5 owns mod2 cohomology, universal w₂"), `:67` ("GeneralizedCohomology G5.5 specifies the real Hilbert and finite-Clifford functional-calculus"), `:1450`.

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main at `dd4b28f1` (re-checked this round), `TauCetiRoadmap/GeneralizedCohomology/README.md:41–42` lists SpinGeometry G4.1 and G1.3 (`cliffordScalarTrace`, τ_ℂ) in its supplier table and `:1908` consumes it; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930, 1630` consume SpinGeometry G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388` consume G1.2/G2.2/G3.4; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:41, 937, 1136` consume G1.1 and G4.1. No foundations folder exists on main (`ls TauCetiRoadmap | grep -i 'spin\|clifford'` lists only `SpinGeometry`). The dependency check reports no cycle only because none of the five roadmaps is in `ORDER.txt`.

**Repair:** unchanged from the earlier rounds and not possible inside this diff alone: split the shared early objects (G1.3's scalar trace and complexification, G1.1's negative-form comparison, G4.1a's frame and rank-zero adapters, G1.2/G2.2's finite exterior-module comparisons) into a foundations roadmap that both sides import, with G5–G6 as its consumer; or repoint the four reverse citations on main to that owner. If the project rules that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, the remaining findings are all P3 and the folder is ready for final approval on that ruling.

## R02 (P3) — The companion file's docstrings still cite an unnamed "source"

**Location:** `TauCetiRoadmap/SpinGeometry/SourcePauliTargets.lean:6` ("Source-ordered Pauli matrices"), `:22` ("Source order is (Z,Y,X)"), `:46` ("because the source permutes X and Z"), `:61` ("The source imaginary triple"), `:69` ("with source e1=X and e2=Z"), `:100` ("before the source's complex notation").

**Claim:** the header now names the matrices and the order, and every declaration has a docstring (the repair of R02 at 862d263); the five older docstrings still say "the source" for a text the file and the README never name (the README's G1.1 negative control, `README.md:188–193`, speaks only of "the ordered triple (Z,Y,X)").

**Witness:** `grep -n 'source' SourcePauliTargets.lean` at the six lines above; `grep -n 'Rieffel\|quantum Riemannian' README.md` is empty, so a reader cannot identify what "the source" is. The file remains a set of 2×2 matrix identities closed by `fin_cases`/`simp` (padding class "examples that compute values", as noted at 862d263); the deletion repair stands as the first option.

**Repair:** either delete the file (the G1.1 Checks carry every identity with its value) or replace "source" in the title and the five docstrings by "the (Z,Y,X) order", for instance `:46` "Cyclic products carry −i because (Z,Y,X) is an odd permutation of (X,Y,Z)" and `:100` "Literal real generator equations in the positive-plane model".

## R03 (P3) — G4.1a's odd-unit Check uses the untwisted conjugation, the pin and the new G4.1b Check the twisted one

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:743–744` ("the unit vector e₁∈Cl(0,2) conjugates V by e₁e₁e₁^(−1)=e₁ and e₁e₂e₁^(−1)=−e₂, a reflection of determinant −1") against `:805–806` (new: "the odd unit e₁, excluded from Spin, would act on ℝ¹ by −1, which is not in SO(1)").

**Claim:** the two Checks describe the same "action of an odd unit on V" but compute it with different conventions. The new rank-one Check is right only for the twisted conjugation v ↦ involute(u) v u⁻¹: untwisted, e₁e₁e₁⁻¹ = e₁ is the identity of ℝ¹, which lies in SO(1), and the negative control fails. The G4.1a Check uses the untwisted values.

**Witness:** Tau Ceti at the pin defines the vector action through the twisted conjugation: `LinearAlgebra/CliffordAlgebra/Lipschitz/Action.lean:95–97` (`twistedConj x = mulRight x⁻¹ ∘ mulLeft (involute x)`), `:131–132` (`vectorMap`), consumed by `lipschitzVectorAction` (`:240`) and `spinVectorAction` (`Spin/Action.lean:59`), which is what `spinToSpecialOrthogonal` (`Spin/SpecialOrthogonal.lean:272`) and `realCliffordSpinToSpecialOrthogonalRange` (`Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:108`) use. Under it, in Cl(0,2): involute(e₁)e₁e₁⁻¹ = −e₁ and involute(e₁)e₂e₁⁻¹ = −e₁e₂(−e₁) = e₁e₂e₁ = e₂, so e₁ ↦ −e₁, e₂ ↦ e₂ (still determinant −1); in Cl(1,0): involute(e₁)e₁e₁⁻¹ = −e₁, the value −1 the new Check states. On Spin the two conventions agree, so no target is affected; only the two odd-unit negative controls disagree with each other.

**Repair:** in `:743–744` write "the unit vector e₁∈Cl(0,2) acts on V by the twisted conjugation v ↦ involute(e₁) v e₁^(−1): e₁ ↦ −e₁ and e₂ ↦ e₂, a reflection of determinant −1 (the untwisted conjugation gives e₁ ↦ e₁, e₂ ↦ −e₂, also of determinant −1)". The rank-one Check at `:805–806` is then consistent and needs no change.

## R04 (P3) — A second open pull request on this folder declares the same fully qualified names

Re-raised: R05 of the review at 862d263 (R06 at 350d700).

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 119, 136, 155` (`multiplicitySpace`, `IsGeometricAction`, `chirality`, `positiveSpinors`) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean:52, 101, 107, 123` at `60cedda` (same author, same folder).

**Witness:** `roadmaps list` (index of 2026-11-04) shows #1674 at `60cedda` and #1780 at `75f5a03` both on `SpinGeometry`; `roadmaps grep --lean-only multiplicitySpace` returns both heads and main. Two open pull requests each build the same objects in the same folder.

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Previous findings

- R01 — not repaired: `README.md:14, 42, 56, 67` still name SpinRepresentations, RiemannianGeometry, CharacteristicClasses and GeneralizedCohomology as suppliers; the reverse citations on main at `dd4b28f1` are unchanged. Re-raised as R01.
- R02 — partly repaired: `SourcePauliTargets.lean:8–12` now names the three Pauli matrices, their order and the G1.1 model, and `:26, :36, :41, :52, :93` add docstrings; the title and five docstrings still say "source" for an unnamed text, and the file still computes values. Residue as R02.
- R03 — repaired: `README.md:848–850` "B=Id has as g-self-adjoint square roots exactly the reflections 2P−Id for P an orthogonal projection, among them ±Id and diag(1,−1), of which only +Id is positive" (verified: H self-adjoint with H² = Id is diagonalisable with eigenvalues ±1, so H = P₊ − P₋ = 2P₊ − Id).
- R04 — repaired: G3.4 (`:681–700`), G4.1b (`:785–806`) and G6.6 (`:1343–1363`) now carry three Checks each, 22 `**Checks.**` blocks in all; every value recomputed in the table. The heading shape is still the legacy `## G1.`–`## G6.`; the gate accepts it, so no finding.
- R05 — not repaired (outside this diff): #1674 is still open at `60cedda` with the same four `def`s. Re-raised as R04.

## Verified sound

**Scope of the check.** The 86-line diff read line by line in context (G3.4 `:671–700`, G4.1a–G4.1b `:703–809`, G4.2 `:841–853`, G6.6 `:1328–1363`, the companion's header and docstrings), with the passages that cite the changed ones: G1.1's bivector sign (`:148–160`), G5.3's use of it (`:1002–1006`), G6.4's D = d + d* (`:1252`), G2.1's S^± (`:453–458`). Commands run from the worktree: the gate (`gate SpinGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run adds `build=0`); the dependency check (`depcheck: 204 roadmaps, 1671 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; SpinGeometry and its four reciprocal partners are not in `ORDER.txt`, which is why R01 is invisible to it); `lake env lean` on a scratch copy of `Suggested.lean` with each of the nine `sorry` lines replaced by `first | rfl | (simp [the eight definitions]; done) | infer_instance | sorry` and `#check @name` for all 18 declarations appended (exit 0; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197, so no admitted theorem closes with one tactic and none is padding); `lake env lean` on `SourcePauliTargets.lean` itself (exit 0, no diagnostics). The 18 elaborated types agree with the worker's `signatures.md` and with the README; the "looks dropped" lead on `diracInFrame` is a false positive (`inst_7 : ∀ x, NormedAddCommGroup (W x)` and `inst_8 : ∀ x, InnerProductSpace ℂ (W x)` are in the elaborated type). No `set_option`, no admitted `example`, no sorry'd data, no computational algorithm, no copied passage, no local path, no pull-request number and no process word in the new text (the diff's only process-flavoured words are the deleted "obscured quotient … unclear matrix subscript").

**Library declarations opened this round.** Tau Ceti `CliffordAlgebra.bivectorEquivSo` (`LinearAlgebra/CliffordAlgebra/StandardBivector.lean:408`) with `bivectorEquivSo_apply_ιMulti` (`:465–471`): the matrix of u∧v is `fun i j => 2 * (u i * v j - v i * u j)`, so e₁∧e₂ ↦ 2(e₁e₂ᵀ − e₂e₁ᵀ) with columns Ae₁ = −2e₂, Ae₂ = 2e₁, exactly the new G4.1b Check; `twistedConj`, `vectorMap`, `lipschitzVectorAction` (`Lipschitz/Action.lean:95–97, 131–132, 240`), `spinVectorAction` (`Spin/Action.lean:59`), `spinToSpecialOrthogonal` (`Spin/SpecialOrthogonal.lean:272`, "the conjugation action of the Spin group"), `realCliffordSpinToSpecialOrthogonalRange` (`Topology/Algebra/CliffordAlgebra/Spin/Real/Projection.lean:108`) for R03; Mathlib `lipschitzGroup.involute_act_ι_mem_range_ι` (`LinearAlgebra/CliffordAlgebra/SpinGroup.lean:95–97`) and `conjAct_smul_ι_mem_range_ι` (`:67`), the two conventions. Everything else the new text names (`Geometry/Lie/CliffordAlgebra/Spin/Projection.lean`, `Differential.lean`, `realCliffordSpinToSpecialOrthogonalSmoothRange`, `…RangeLieMap_eq_lieMap`, `…CoordinateLieHom_eq_bivectorEquivSo`, `leftInvariantDerivationLieEquivGroupLieAlgebra_lieMap`, `isLocalDiffeomorph_of_mfderiv_eq`, `evenUnitaryGroup`, `range_spinGroup_toUnits`, `fourierBasis`) was resolved at the same pins by the reviews at 350d700 and 862d263 and the pins have not moved. `multiplicitySpace`, `IsGeometricAction`, `chirality`, `diracInFrame` occur nowhere in Tau Ceti at the pin.

**Cross-roadmap citations.** The worker's `citations.md` lists none unresolved; the new text cites only this roadmap's own sections (G1.1, G2.1, G4.1a, G5.3, G6.4, G6.1, T3 of TopologicalKTheory already resolved) and no new locator. Re-checked this round on main at `dd4b28f1`: the reverse citations under R01. Ownership: `roadmaps grep` over the 441 open pull requests (index of 2026-11-04) and main finds the four Lean objects only in this folder's two open pull requests and on main (R04); the board's package index lists no competing package.

**Source sample.** The brief names no target ids and the diff adds no locator; the two locators the changed subsections carry were re-opened in `nicolaescu` (printed page = PDF page − 12): G3.4's "§12.2.1, p. 657" is `line 30485` (the Hodge–de Rham subsection heading, followed by Proposition 12.2.1 at `line 30497`: (g, ∇^g) is a Dirac structure on Λ_ℂT*M with d + d* its Dirac operator, which is what the new G3.4 Check 1 verifies on the flat plane); G6.6's "§12.2.3, p. 672" is `line 31068` (D⁺ : C^∞(S⁺) → C^∞(S⁻) with symbol the Clifford multiplication, which is what the new G6.6 Check 1 computes). The seventeen locators of the previous review are unchanged in the README and were not re-opened.

**Adversarial table.** Pauli X = [[0,1],[1,0]], Y = [[0,−i],[i,0]], Z = diag(1,−1); the negative plane has c(e₁) = iZ, c(e₂) = iY, Γ = i c(e₁)c(e₂) = −X, S⁺ = ℂ(1,−1), S⁻ = ℂ(1,1); the positive plane has e_j² = +1. Rows marked "new" are this head's text, recomputed here; the other rows are carried from the review at 862d263, whose values stand because the statements are untouched.

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| G3.4 Check 1 (682–688), new | flat ℝ², c = ε − ι, f and f e₁ | Df = Σ(ε(e_j) − ι(e_j))(∂_jf·1) = ∂₁f e₁ + ∂₂f e₂ = df; c(e₁)(∂₁f e₁) = ∂₁f(e₁∧e₁ − ι(e₁)e₁) = −∂₁f; c(e₂)(∂₂f e₁) = ∂₂f(e₂∧e₁ − 0) = −∂₂f e₁∧e₂; d(fe₁) = −∂₂f e₁∧e₂, d*(fe₁) = −∂₁f; sum agrees; (ε+ι)(v)² = ε(v)ι(v) + ι(v)ε(v) = |v|²; Σ(ε+ι)(e_j)∂_j = d + Σι(e_j)∂_j = d − d*, and (d − d*)* = d* − d | Pass |
| G3.4 Check 2 (689–696), new | unit S², e₁ = ∂_θ, e₂ = ∂_φ/sin θ | Γ^θ_φφ = −sin θ cos θ, Γ^φ_θφ = cot θ; ∇_(e₂)e₂ = sin⁻²θ(−sin θ cos θ)∂_θ = −cot θ e₁; ∇_(e₁)e₂ = (−cos θ/sin²θ + cot θ/sin θ)∂_φ = 0; ∇_(e₂)e₁ = cot θ e₂; coframe: ∇_(e₂)e² = −ω²₁(e₂)e¹ = −cot θ e¹, ∇_(e₁)e² = 0; de² = e²∧(−cot θ e¹) = cot θ e¹∧e² = cos θ dθ∧dφ = d(sin θ dφ); d*e² = −ι(e₂)(−cot θ e¹) = 0; div((sin θ dφ)^♯) = sin⁻¹θ ∂_φ(1) = 0 | Pass |
| G3.4 Check 3 (697–700), new | S¹ ⊂ ℝ² | rank Λ*T*ℝ²|_(S¹) = 2² = 4 with c(e_r), c(e_θ); rank Λ*T*S¹ = 2¹ = 2 | Pass |
| G4.1b Check 1 (786–795), new | positive plane, z(θ) = cos θ + sin θ e₁e₂ | (e₁e₂)² = −e₁²e₂² = −1; z e₁ z⁻¹ = (cos θ e₁ − sin θ e₂)(cos θ − sin θ e₁e₂) = cos 2θ e₁ − sin 2θ e₂; z e₂ z⁻¹ = sin 2θ e₁ + cos 2θ e₂; z(π) = −1; d/dθ at 0: Ae₁ = −2e₂, Ae₂ = 2e₁; [e₁e₂,e₁] = −e₂ − e₂ = −2e₂, [e₁e₂,e₂] = e₁ + e₁ = 2e₁; `bivectorEquivSo_apply_ιMulti`: entry (i,j) = 2(u_iv_j − v_iu_j), columns (0,−2) and (2,0); negative form e₁e₂ ↦ −e₁e₂ (`:148–151`) negates A, consistent with G5.3 `:1004–1006` (negative z rotates by +2θ, positive cos θ − sin θ e₁e₂) | Pass |
| G4.1b Check 2 (796–801), new | arc φ ∈ (−π,π) | z(θ) rotates by −2θ, so R_φ lifts to z(−φ/2) = cos(φ/2) − sin(φ/2)e₁e₂ and its negative; a global section would be a continuous branch of √ on S¹, impossible | Pass |
| G4.1b Check 3 (802–806), new | Cl(1,0), Spin(1), SO(1) | Cl(1,0)^even = ℝ, unitary scalars u² = 1 give {±1}; ⋀²ℝ¹ = 0 = so(1); twisted action of e₁: involute(e₁)e₁e₁⁻¹ = −e₁, so −1 ∉ SO(1) = {1}; untwisted: e₁e₁e₁⁻¹ = e₁, the identity ∈ SO(1) | Pass at the pin (twisted); G4.1a's Check uses the untwisted values: R03 |
| G4.1a Check 3 (743–746), untouched, depends on R03 | e₁ ∈ Cl(0,2) | untwisted: e₁ ↦ e₁, e₂ ↦ −e₂; twisted (pin): e₁ ↦ −e₁, e₂ ↦ e₂; determinant −1 either way | Conclusion holds; values are the untwisted ones: R03 |
| G4.2 Check 3 (846–852), changed | B = diag(4,1); B = Id | as at 862d263 for B = diag(4,1); self-adjoint H with H² = Id: eigenvalues ±1, orthogonally diagonalisable, H = P₊ − P₋ = 2P₊ − Id; P = Id, 0, diag(1,0) give Id, −Id, diag(1,−1); positive definite iff P₋ = 0 | Pass (R03 of 862d263 repaired) |
| G6.6 Check 1 (1344–1350), new | flat plane, v = (v₁,v₂) | iZ(1,−1) = i(1,1); iY(1,−1) = i(i,i) = −(1,1); c(v)(1,−1) = (iv₁ − v₂)(1,1) = i(v₁ + iv₂)(1,1); Γ(1,−1) = −X(1,−1) = (1,−1), Γ(1,1) = −(1,1); |iz| = |v| ≠ 0 for v ≠ 0; winding of iz on |v| = 1 is +1; reversed frame: c(v)(1,1) = (iv₁ + v₂)(1,−1) = i(v₁ − iv₂)(1,−1), winding −1 | Pass |
| G6.6 Check 2 (1351–1356), new | point, n = 0 | Γ = i⁰·(empty product) = Id, S⁺ = S = ℂ, S⁻ = 0; [S⁺] − [S⁻] = 1 ∈ K(pt) = ℤ; σ = −1: Γ = −Id, class −1; the zero symbol map alone carries no class | Pass |
| G6.6 Check 3 (1357–1363), new | W = ℂʳ; phases | symbol iz·Id_r, det = (iz)^r of winding r; r = 1 ≠ r = 2; e^(iπt/2)c(v) is invertible off zero for all t and equals i c(v) at t = 1; t·c(v) = 0 at t = 0 | Pass |
| Companion `source_cyclic_products` (`SourcePauliTargets.lean:47`), docstring new | i = 2 | i+1 = 0, i+2 = 1 in Fin 3: XZ = −iY, as the docstring's "cyclic order carries minus i" | Pass (elaborates, exit 0) |
| Companion `positiveModel_generator` (`:95`), docstring new | v = (1,0), (0,1) | [[0,1],[1,0]] = X, [[1,0],[0,−1]] = Z | Pass |
| G1.4 Checks 1–4 (406–426) | as at 862d263 | ω_ℂ² = 1 for n = 1; n = 3: ω = −Id, ω_ℂ = +Id, Γ = −X, λ = −i; multiplicities 2 and 1 exclude γ; ψ(e₁e₂) = e₁e₂, ψ(e₁e₂e₃) = −e₁e₂e₃e₀ | Pass (review at 862d263) |
| G2.1 ψ(ω_ℂ) = −Γ (453–458); G1.4 label rule (385–386) | n = 3; general ℓ | ψ(e₁⋯e_n) = −e₁⋯e_ne₀; i^(ℓ+1)(−i)^ℓ·λ = iλ | Pass (862d263) |
| G2.2 Checks 1–4 (515–533) | plane, c = ε − ι | Γ1 = i e₁∧e₂, Γe₁ = ie₂, Γ(e₁∧e₂) = −i; Γ² = 1; c(e₁)²1 = −1; reverse(e₁e₂) = −e₁e₂ | Pass (862d263) |
| G2.3 Checks 1, 3, 4 (551–568) | two negative planes; Koszul; A = ℂ⊕ℂ | Γ_(V⊕W) = Γ_V⊗Γ_W; swap sign (−1)^(|s||t|); even part dim 2 | Pass (862d263) |
| G3.1 Checks 1–3 (598–614) | ranks 0, 1; Cl(0,3) a = 1+ω; μ(R_θ) | w₁(ℝ⊕L) = w₁(L); |a²| = 2√2 > |a|² = 2; μ(R_(2π)) = 1 | Pass (862d263) |
| G3.2 Checks 1–3 (627–639) | Y; ranks; S¹ ⊂ ℝ² | Y² = Id ≠ −Id; c(∂_θ)² = −Id, trace 0 | Pass (862d263) |
| G3.3 Checks 2–4 (658–670) | A scalar; A = e₁e₂dx¹; S² | [iY,iZ] = −2iX; [e₁e₂,e₁] = 2e₂; R^S = −½c₁c₂, [R^S,c₁] = −c₂ | Pass (862d263) |
| G4.1a Checks 1–2 (715–742) | Spin(2); ranks 0, 1 | z ↦ z², kernel ±1; Spin(1) = {±1}, Spin(0) = {1}, μ₂ = {±1} | Pass (862d263) |
| G4.2 Checks 1–2 (841–845) | S¹, S², rank 0 | two double covers of S¹, one of S²; H²(S¹;ℤ/2) = 0 | Pass (862d263) |
| G4.4 Checks (890–899) | S¹, T², Sⁿ | |H¹| = 2, 4, 1; (−1)(−1) = +1 | Pass (862d263) |
| G5.0 Checks 1, 3 (939–954) | Cl(0,1); Cl(0,2) | c₋C₊ + C₊c₋ = 0 on 1; C₊(e₁)C₊(e₂)s = s e₁e₂ | Pass (862d263) |
| G5.1, G5.3 Checks (982–994, 1019–1030) | ranks; S², T² | 2^⌊n/2⌋ = 1,2,2,4; (S⁻)² = E, (S⁺)² = E*; c₁(TS²) = 2 | Pass (862d263) |
| G6.0 Checks 1–4 (1174–1194) | Cl(0,1); T³ s = 1+ω; circles; S³ | ‖2+2ω‖ = 4 ≠ τ = 2; kernels 1, 0; Scal(S³)/4 = 3/2 | Pass (862d263) |
| G6.7 Checks 1–4 (1398–1412) | ℂ², ℂ; ω₋; zJ; S⁴, K3 | J² = −1 on ℂ², |a|² on ℂ; ω₋² = 1, Γ = −ω₋; (zJ)² = −|z|²; index 2 = Â(K3) | Pass (862d263) |
| G1.2 h (202–204) | h = g + i g(·,J·) | h(Ju,v) = i h(u,v); conj h_J = h | Pass (862d263) |
| `cliffordScalarTrace_mul_two_pow` (Lean 56) | Cl(0,1); V = 0; Q = 0 | trace 2x = 2¹τ; 2⁰a = a; Q = 0: trace 2x | Pass (862d263) |
| `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 63, 70) | Q > 0; Q = 0; Q(e) = −1 | Σa_I²ΠQ(e_i) ≥ 0, = 0 iff a = 0; τ(e²) = 0 with e ≠ 0; τ(e²) = −1 | Pass, PosDef present (862d263) |
| `exists_multiplicityEvaluation` (Lean 100) | S = ℂ², E = S⊗ℂ³; E = S; diagonal S | dim Hom = 3, 2·3 = 6; Schur; 8 ≠ 2 so ρ onto End(S) needed and present; `[FiniteDimensional ℂ S]` present | Pass (862d263) |
| `cliffordMultiplication_anticommutator` (Lean 126) | (e₁,e₁); (e₁,e₂) | 2(iZ)² = −2; −(ZY + YZ) = 0 | Pass (862d263) |
| `chirality_sq`, `chirality_anticommutes`, `isCompl_spinors` (Lean 142, 148, 163) | ℓ = 1; ℓ = 0; Q = 0 | Γ² = X² = Id; Γc(e₁) = −c(e₁)Γ; Q = 0 excluded by the geometric-action hypothesis | Pass (862d263) |
| `diracInFrame_eq` (Lean 197) | rotated frame; (2e₁,e₂); n = 0 | cross terms cancel; 4c₁∇₁ + c₂∇₂ ≠ D; empty sum 0 | Pass (862d263) |
| `even_finrank_of_conjLinear_square_neg` (Lean 213, proved) | ℂ²; ℂ | as G6.7 Check 1 | Pass (elaborates) |

**Headline theorems.** Unchanged since 862d263 (`Suggested.lean` is byte-identical): stated are the normalized scalar trace with positivity and faithfulness (G1.3), the Morita evaluation (G1.3), the negative-metric Clifford relation (G1.2), chirality square, anticommutation and splitting (G2.1), frame independence of the Dirac contraction (G6.1), the quaternionic parity (G6.7, proved); not statable and named in the module docstring (`Suggested.lean:15–28`) with the missing carrier: Lichnerowicz and Bochner, the closed H¹ realization, spin existence and the H¹ torsor, the KO index class, ind D⁺ = 2α. The new Checks add no headline and change no Lean statement. No statable headline is absent, nothing is forced through a stand-in, no admitted theorem is one-tactic padding.

**Dependency check output.** `depcheck: 204 roadmaps, 1671 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line for SpinGeometry).

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (G4.3, G4.4, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, recorded `uncertified` in the manifest; cited by locator only. The diff adds no citation of either.
- The worker's 15-target sample: no target list or seed was supplied; the two Nicolaescu locators of the changed subsections were re-opened and the seventeen of the previous review stand unchanged in the text.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

## Source issues

- none (nothing new opened beyond `nicolaescu line 30485–30498` and `line 31068–31069`, both as cited).
