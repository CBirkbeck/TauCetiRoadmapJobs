# Review of SpinGeometry (pull request #1780 at 6317a77)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/SpinGeometry/` at `6317a77190b0ab882011f8f980970b88688687ba`: 117 changed lines since `5c4c231` (the head the previous review read), all in `Suggested.lean`, all deletions but one: the `SourcePauliComparisons` section (thirteen declarations), its two `TauCeti.*` imports and the module-docstring sentence about the Pauli certificates are gone. `README.md` is unchanged (1476 lines, byte-identical to `5baff38` and `5c4c231`), `lake-manifest.json` is unchanged (Tau Ceti `358314d4`, Mathlib `f6090c70`), and `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. `git diff --stat 5baff38..HEAD -- TauCetiRoadmap/SpinGeometry/` shows only the deletion of `SourcePauliTargets.lean`: the `Suggested.lean` at this head is the `5baff38` file byte for byte, so its eighteen declarations are the ones the reviews at 862d263 through 5c4c231 checked. The gate passes. The previous R02 (the padding) is repaired; the previous R01 (the inherited supply cycle on main) and R03 (the second open pull request on this folder) are unchanged and are the two findings below. The only blocking finding re-raises a finding the repair rounds marked not actionable in this folder, so the parking rule applies: a human decides whether an inherited two-way edge between roadmaps on main is a defect of a revision pull request.

## R01 (P1) — Reciprocal supplier edges with four roadmaps on main

Re-raised: R01 of the reviews at 5c4c231 and 5baff38 (and of every earlier review of #1780 and #1674). The repair rounds marked it not actionable in this package because the reverse citations live on main in four other folders. That reason is true as a statement of fact, and it is not disputed; it fails as a reason to settle the finding because the contract makes a cycle a design defect wherever it was introduced ("every roadmap has a single direction of supply … cycles are design defects and are broken by moving ownership"), and nothing on main has moved since the last round.

**Location:** `TauCetiRoadmap/SpinGeometry/README.md:14` ("supplied by SpinRepresentations L0–L4,L7,L9"), `:42` ("RiemannianGeometry R1,R5,R7 supplies curvature identities"), `:56` ("CharacteristicClasses C1,C3.5 owns mod2 cohomology, universal w₂"), `:67` ("GeneralizedCohomology G5.5 specifies the real Hilbert and finite-Clifford functional-calculus").

**Claim:** these four roadmaps are suppliers of SpinGeometry.

**Witness:** on main at `c9a16a04` (re-checked this round): `TauCetiRoadmap/GeneralizedCohomology/README.md:41–42` lists SpinGeometry G4.1 and G1.3 in its supplier table and `:1067, 1071, 1385` consume G4.1; `TauCetiRoadmap/CharacteristicClasses/README.md:911, 930, 1630` consume G4.1a; `TauCetiRoadmap/RiemannianGeometry/README.md:117, 1337, 1388, 1397` consume G1.2, G2.2, G3.4 and G6; `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:41, 937–938, 1136–1137` consume G1.1 and G4.1. Main's own `TauCetiRoadmap/SpinGeometry/README.md:13, 36, 50, 61` carries the same four supplier citations, and its `:860` describes the two-way flow with GeneralizedCohomology G5.5 in so many words, so the cycle is inherited and intentional, not introduced here. None of the five roadmaps is in `ORDER.txt`, which is why the dependency check reports no cycle.

**Repair:** unchanged from the earlier rounds and not possible inside this folder alone: split the shared early objects (G1.3's scalar trace and complexification, G1.1's negative-form comparison and vector action, G4.1a's frame and rank-zero adapters, G1.2/G2.2's finite exterior-module comparisons) into a foundations roadmap that both sides import, with G5–G6 as its consumer; or repoint the four reverse citations on main to that owner. If the project rules that an inherited two-way edge between roadmaps on main is not a defect of a revision pull request, the only remaining finding is R02 (P3).

## R02 (P3) — A second open pull request on this folder declares the same fully qualified names

Re-raised: R03 of the review at 5c4c231 (R02 of the review at 5baff38).

**Location:** `TauCetiRoadmap/SpinGeometry/Suggested.lean:87, 115, 119, 136, 142, 148, 155, 159, 163` (`multiplicitySpace`, `cliffordMultiplication`, `IsGeometricAction`, `chirality`, `chirality_sq`, `chirality_anticommutes`, `positiveSpinors`, `negativeSpinors`, `isCompl_spinors`) and pull request #1674's `TauCetiRoadmap/SpinGeometry/Suggested.lean` at `e586e98:55, 101, 104, 110, 114, 119, 126, 130, 134` (same author, same folder, same namespace `TauCetiRoadmap.SpinGeometry` at its line 41).

**Witness:** `roadmaps list` (index of 2026-11-05) shows `#1674 SpinGeometry @kim-em e586e98` and `#1780 SpinGeometry @kim-em 6317a77`; `roadmaps show SpinGeometry --pr 1674 --file Suggested.lean` declares the nine names above (its other two, `multiplicityEvaluation_exists` at line 69 and `cliffordScalarTrace_exists` at line 79, differ from this file's `exists_multiplicityEvaluation` and `cliffordScalarTrace_mul_two_pow`). Two open pull requests each build the same objects in the same folder; #1674 moved from `b8de037` to `e586e98` since the last round without removing them.

**Repair:** none inside this file; whichever pull request merges second must be rebased so that the folder has one `Suggested.lean`. Say in the pull request which one is primary.

## Previous findings

- R01 — not repaired: `README.md:14, 42, 56, 67` unchanged; the reverse citations on main at `c9a16a04` are unchanged. Re-raised as R01.
- R02 — repaired: `Suggested.lean` no longer contains `SourcePauliComparisons`, `SourcePauli`, `source`, `quaternionUnit`, `positiveVector` or `positiveModel` (grep count 0 for each); lines 3–4 are gone and the file imports `Mathlib` alone; the docstring sentence at the old lines 15–17 is gone (new lines 9–13 end at "the parity theorem for conjugate-linear square roots of `−1` (G6.7)"). The repair introduced no new problem: the file equals the `5baff38` file byte for byte, elaborates with exactly nine `sorry` warnings, and the README names none of the removed declarations.
- R03 — not repaired (outside this diff): #1674 is still open, now at `e586e98`, with the nine shared declarations. Re-raised as R02.

## Verified sound

**Scope of the check.** The whole diff (`changes.md`: 1 insertion, 116 deletions, one file) was read against the file at `5c4c231`; the resulting `Suggested.lean` (252 lines) was read in full and confirmed byte-identical to the `5baff38` file; `README.md` was not re-read beyond the lines the findings and the name-agreement check touch, because it is unchanged. Commands run from the worktree:

- the gate: the worker's run at this head (`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`) and my own run of the text scanners this round (the same line without `build`, `OK`);
- the dependency check: `depcheck: 234 roadmaps, 2161 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line for SpinGeometry (the five roadmaps of R01 are not in `ORDER.txt`);
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean`: exit 0 in 4.3 s; exactly nine `declaration uses sorry` warnings at lines 56, 63, 70, 100, 126, 142, 148, 163, 197 and nothing else;
- the one-tactic probe on a scratch copy with each of the nine `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (exact?; done) | sorry`: exit 0 with the same nine `sorry` warnings, so no admitted statement closes in one tactic; the one proved theorem, `even_finrank_of_conjLinear_square_neg` (line 213), is the parity theorem G6.7 needs, not padding;
- the elaborated signatures (`signatures.md`, 18 declarations): the single "looks dropped" lead on `diracInFrame` is the same false positive as last round (both `[∀ x, NormedAddCommGroup (W x)]` and `[∀ x, InnerProductSpace ℂ (W x)]` are `inst_7` and `inst_8` of its elaborated type, and of `diracInFrame_eq`'s); the other seventeen types are unchanged from `5baff38` and were compared with the README by the earlier reviews;
- README/Lean agreement: each of the eighteen Lean names occurs backticked in `README.md` (counts 1–5), and none of the thirteen deleted names occurs there (count 0 each), so the deletion left no dangling backticked name;
- Lean form: `module` / `public import Mathlib` only, `theorem` throughout, a docstring on every declaration, no `set_option`, no `lemma`, no admitted `example`, no sorry'd data, no local path, pull-request number or process word; the module docstring still names the five not-statable headlines with their missing carriers (lines 15–28);
- ownership: `roadmaps list` (454 open pull requests, index of 2026-11-05) shows the folder's two open pull requests (R02) and one draft pin-bump pull request by the reviewing worker (#1800) that adapts fifty-six existing folders including this one, a revision of existing roadmaps and not a competing construction; #1674 at `e586e98` contains none of the deleted Pauli names (count 0); the board's package index lists no competing package; the worker's `citations.md` lists no unresolved citation or Lean name.

**Headline theorems.** Stated: the normalized scalar trace with positivity and faithfulness (G1.3, lines 56–73), the Morita evaluation (G1.3, line 100), the negative-metric Clifford relation (G1.2, line 126), chirality square, anticommutation and splitting (G2.1, lines 142–166), frame independence of the Dirac contraction (G6.1, line 197), the quaternionic parity (G6.7, line 213, proved). Not statable and named in the module docstring with the missing carrier: Lichnerowicz and Bochner, the closed-base H¹ realization, spin existence and the H¹ torsor, the KO index class, ind D⁺ = 2α. No statable headline is absent, nothing is forced through a stand-in, and after the deletion nothing in the file is padding.

**Source sample.** The diff touches no README passage, so no README locator falls in the changed passages; the previous report's sample of 15 locators plus 3 extra, every one opened in `nicolaescu` (printed page = page marker − 12) and found to support the statement, is carried forward unchanged (its table is in the review at 5c4c231). The deleted Lean section cited no source.

**Adversarial table.** Every admitted or proved statement of this head is unchanged from `5baff38`, so its row is carried from the review at 5c4c231 (which recomputed the values marked "recomputed" there) and from the reviews it cites; the thirteen deleted declarations get one row recording the deletion. Pauli matrices X = [[0,1],[1,0]], Y = [[0,−i],[i,0]], Z = diag(1,−1).

| Statement / location | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Deleted `SourcePauli` section (old lines 45–154: `source`, `source_squares`, `source_cyclic_products`, `source_anticommuting`, `native_quaternion_dictionary`, `quaternion_equations`, `positiveVector`, `positiveVector_square`, `positiveModel`, `positiveModel_generator`, `positive_generators`) | — | values at 5c4c231: Z² = Y² = X² = Id; ZY = −iX, YX = −iZ, XZ = −iY; (iZ)(iY) = iX; (1,0) ↦ X, (0,1) ↦ Z, pv(v)² = (v₀²+v₁²)Id; all correct, all mirrored README G1.1 Checks 1–3 | Deleted; README G1.1 Checks unchanged (`README.md:187–197`) |
| G1.3 `cliffordScalarTrace_mul_two_pow`, `_reverse_mul_self_nonneg`, `_eq_zero_iff` (Lean 56, 63, 70) | Cl(0,1), a = 2.5 − e; V = 0; Q = 0 | L_a = [[x,−y],[y,x]] of trace 5 = 2¹·τ(a); 2⁰τ(a) = a; Q = 0: τ(reverse(e)e) = 0 with e ≠ 0, excluded by `Q.PosDef` | Pass (5c4c231) |
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

**Pinned declarations.** The deletion removed the only uses of `TauCeti.Algebra.Quaternion.ComplexMatrix` and `TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic`; the remaining file uses Mathlib's `CliffordAlgebra.equivExterior`, `ExteriorAlgebra.algebraMapInv`, `CliffordAlgebra.reverse`, `CliffordAlgebra.ι`, `LinearMap.trace`, `LinearMap.mulLeft`, `QuadraticMap.PosDef`, `OrthonormalBasis`, `CovariantDerivative`, `Bundle.RiemannianBundle`, `TangentSpace`, `Module.finBasis`, `Matrix.det_mul`, `Matrix.det_neg`, `RingHom.map_det`, `Complex.normSq_nonneg`, all resolved by the elaboration at the pin. The README's library citations (Tau Ceti `358314d4`, Mathlib `f6090c70`) were opened by the review at 5c4c231 and are unchanged.

**Cross-roadmap citations.** The README is unchanged; the review at 5c4c231 resolved every citation on main or at the named open heads, and `citations.md` at this head again lists none found nowhere. Re-resolved this round for R01: the four supplier citations and their reverse edges on main at `c9a16a04`.

**Declared gaps.** None declared (no readable `design/plan.json`); the README states none.

## Not verifiable

- Lawson–Michelsohn, *Spin Geometry* (G4.3, G4.4, G6.2, G6.3) and Atiyah–Bott–Shapiro, *Clifford modules* (G2.3, G6.0): paywalled, recorded `uncertified` in the manifest; cited by locator only.
- The manifest's `kirby` entry (cited for "G4.4a") is not cited by the README, which has no G4.4a; nothing in the folder depends on it, so it was not opened.
- Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps list` and `roadmaps grep`.

## Source issues

- none
