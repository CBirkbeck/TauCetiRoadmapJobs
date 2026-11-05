# Review of CotangentLagrangian (pull request #1651 at 24f7c9f)
Folder: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/`
**Verdict:** needs changes

Incremental re-review of the 79 lines changed since 086aecd: the C2.1 block added to `Suggested.lean` (`realify` and four group theorems), the README sentences that name them, and the split module docstring. The gate's text scanners and dependency check pass, the targeted build passes, every declaration elaborates with `sorry` the only warning, and the four new statements are true at the stated generality and pinned to the right conventions. One blocking finding is new: the deletion of `canonicalForm` in the previous repair (which the previous review required) left a sibling of the same family, `HamiltonianReduction/Suggested.lean`, citing a declaration that no longer exists, so that module and `ConvexityToric/Suggested.lean` (which imports it) no longer elaborate at this head. Two P3 findings of the previous review on `RelativeDarbouxTargets.lean` are carried unchanged.

## R01 (P2) — `HamiltonianReduction/Suggested.lean` cites the deleted `canonicalForm`; the family's modules no longer elaborate

Location: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/Suggested.lean` line 76, `HasHamiltonianField (canonicalForm (M := M) I)`, in `cotangentMomentum_hamiltonian`; the declaration it names was removed from `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/Suggested.lean` at 086aecd (on main it is line 31, `def canonicalForm … := by sorry`).

Claim: `HamiltonianReduction/Suggested.lean` imports `TauCetiRoadmap.SymplecticGeometry.Suggested`, which imports this folder's `Suggested.lean` (family index line 1); `ConvexityToric/Suggested.lean` imports HamiltonianReduction's. Nothing in the import closure declares `canonicalForm` any more (grep of `TauCetiRoadmap/SymplecticGeometry/` and of the pinned Tau Ceti: no hit), so HamiltonianReduction's module, and through it ConvexityToric's (a folder of this pull request), fail to elaborate at this head. The gate's targeted build does not see it because it builds only this folder's module and the family index. This is a consumer this roadmap broke by moving a name without restating the consumer: supplier drift, introduced by the previous repair, so it is a new finding of this round rather than a settled one.

Witness: `lake env lean` on an unmodified scratch copy of `HamiltonianReduction/Suggested.lean` fails (exit 1) at 76:39 with `Invalid argument name M for function`, the error Lean gives when `canonicalForm` is no longer a declaration with a named argument `M`. The same file with the one edit below elaborates with exit 0 and five `sorry` warnings.

Repair (tested): restate the consumer against the existence headline, since `canonicalForm_exists` is now the only carrier of the form and its chart identity fixes the form at every centre (`SmoothTwoForm.inChartAt_extChartAt_self`). In `HamiltonianReduction/Suggested.lean` replace the header of `cotangentMomentum_hamiltonian` by

```lean
theorem cotangentMomentum_hamiltonian [FiniteDimensional ℝ E]
    (σ : TauCeti.SmoothTwoForm (cotangentModel I) (Cotangent I M)) (hσ : σ.IsSymplectic)
    (hchart : ∀ (z₀ : Cotangent I M) (w : E × (E →L[ℝ] ℝ)),
      w ∈ (extChartAt (cotangentModel I) z₀).target →
      ∀ v : Fin 2 → (E × (E →L[ℝ] ℝ)),
        σ.inChartAt z₀ w v = TauCeti.strongDualCotangentSymplecticForm (v 0) (v 1))
    (ha : ContMDiff (IG.prod I) I ∞ (fun gx : G × M ↦ gx.1 • gx.2))
    (ξ : GroupLieAlgebra IG G) :
    HasHamiltonianField σ
```

with the rest of the statement unchanged, and say in this folder's `## Downstream consumers` that HamiltonianReduction's cotangent momentum theorem is stated for any form satisfying the chart identity of `canonicalForm_exists`. The edit lies in a sibling folder of the same family; it is the only repair that keeps this folder free of sorry'd data (reinstating `canonicalForm` would reopen the previous review's R02), so the pull request should carry it and its description should say why.

## R02 (P3) — `RelativeDarbouxTargets.lean` keeps the refused import form and an informal docstring

Location: `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/RelativeDarbouxTargets.lean` lines 1–2 (`import TauCeti.Geometry.Symplectic.SymplecticTransport`, `import Mathlib.LinearAlgebra.Dimension.Finrank`) and lines 4–12 ("These are suggested forms").

Claim: the Lean form rules apply to every `.lean` file of the folder (`import Mathlib` first, then only `TauCeti.*` modules; one module docstring "<title>: target signatures"). The previous review's R02 named these lines; the file is byte-identical at this head (the change set touches only `README.md` and `Suggested.lean`).

Witness: the diff since 086aecd lists two files; `RelativeDarbouxTargets.lean` is not among them.

Repair: as before: `import Mathlib` then `import TauCeti.Geometry.Symplectic.SymplecticTransport`, and the docstring "Relative Darboux, linear step: target signatures", saying the roadmap is `README.md` and the file states the symplectic Witt-extension lemma of C4 against the pinned `TauCeti.SymplecticForm`.

## R03 (P3) — padding: `symplectic_extension_fixing_subspace` is one term of the theorem above it

Location: `RelativeDarbouxTargets.lean` lines 34–38.

Claim: its proof is the single term `symplectic_subspace_extension ω₀ ω₁ rfl S S (LinearEquiv.refl ℝ S) hS`: the first theorem with `W = V`, `T = S`, `f = id`. The previous review's R03 was not acted on; the file is unchanged.

Witness: line 38 of the file at this head.

Repair: delete lines 32–38; README C4 already states this specialization in prose.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 105–149 add `realify`, `unitaryGroup_maximal_compact`, `realifiedUnitary_maximal_compact_symplectic`, `generalLinearGroup_connectedSpace`, `symplecticGroup_isConnected`; README lines 127, 170, 172, 174 name them with matching descriptions.
- R02 — not repaired: `RelativeDarbouxTargets.lean` lines 1–12 unchanged (R02 above).
- R03 — not repaired: `RelativeDarbouxTargets.lean` lines 32–38 unchanged (R03 above).
- R04 — repaired: docstring lines 12–17 list what is stated, lines 19–22 keep only "Tau Ceti has no exterior derivative taking a one-form on a manifold to a `SmoothTwoForm`"; the uniqueness sentence now cites `SmoothTwoForm.inChartAt_extChartAt_self` (TwoForm/Closed.lean line 99), which does give it.

## Verified sound

**Gate, build, dependency check.** My run of the gate at 24f7c9f: every content check 0 (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, source-material); `outside-folder=5` names the ConvexityToric and IntegrableSystems files, which this brief lists as the pull request's own (the worker's run, which excludes them, shows 0). `git diff --stat origin/main...HEAD` outside the three folders and the family index: empty. Targeted build `lake build TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian.Suggested TauCetiRoadmap.SymplecticGeometry.Suggested`: "Build completed successfully (9000 jobs)", seven `declaration uses sorry` warnings (lines 59, 68, 87, 117, 127, 140, 146), nothing else. Dependency check:

```
depcheck: 205 roadmaps, 1548 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The sub-roadmaps of SymplecticGeometry are not lines of the merge order, so the check cannot see citations inside the family; the changed passages cite no sibling (the only roadmap they name is LieGroups, on main at `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, whose Layers 2, 7 and 9 are its headings at lines 276, 408 and 449; LieGroups cites nothing of this roadmap, so no cycle).

**Signatures.** A scratch copy of `Suggested.lean` with `#check @` for all thirteen declarations elaborated (exit 0, the seven `sorry` warnings only). The four new theorems carry exactly their explicit binders: `unitaryGroup_maximal_compact : ∀ n, Maximal (fun K => IsCompact ↑K) Unitary.toUnits.range` with `K : Subgroup (Matrix (Fin n) (Fin n) ℂ)ˣ`; `realifiedUnitary_maximal_compact_symplectic` with `hKsp`, `hK`, `hU` as in the README's description at line 174; `generalLinearGroup_connectedSpace : ∀ n, ConnectedSpace (Matrix (Fin n) (Fin n) ℂ)ˣ`; `symplecticGroup_isConnected : ∀ n, IsConnected ↑(Matrix.symplecticGroup (Fin n) ℝ)`. `realify : {n : ℕ} → Matrix (Fin n) (Fin n) ℂ → Matrix (Fin n ⊕ Fin n) (Fin n ⊕ Fin n) ℝ` with the body `fromBlocks X (−Y) Y X`, as README line 127 says. The nine earlier declarations are unchanged from the previous review's check.

**One-tactic probes.** Each of the four new `sorry`s replaced by `first | rfl | simp | infer_instance | decide | exact Iff.rfl` on a scratch copy: none closes (errors at lines 121, 136, 142, 149). Mathlib at the pin has `PathConnectedSpace ℂˣ` (`Analysis/Complex/Convex.lean` line 98), the `n = 1` case of `generalLinearGroup_connectedSpace` only; no connectedness, compactness or maximality statement for `unitaryGroup`, `symplecticGroup` or matrix units in general (grep of the pinned tree). No padding in `Suggested.lean`; the one padded declaration in the companion file is R03.

**Adversarial table.** Rows for the four new statements, `realify` and the docstring's uniqueness claim are computed here (pure-arithmetic checks on `n = 2` with a random unitary and random complex matrices, and `n = 1` for trace growth); the rows for the untouched statements are those of the previous review (`PRREVIEW-CotangentLagrangian~2`, "Adversarial table"), which this head leaves unchanged.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `realify` convention | `A = i·I`, `n = 2` | `realify(i·I) = fromBlocks 0 (−1) 1 0 = Matrix.J (Fin 2) ℝ` (`SymplecticGroup.lean` line 58) | multiplication by i is J, as README line 124 says | none |
| `realify` is a homomorphism commuting with J | random complex `A, B` | `realify(AB) = realify(A)·realify(B)` to `10⁻⁹`; `realify(A)·J = J·realify(A)` | holds; the wrong model `[[X, Y],[−Y, X]]` would send i to −J | none |
| `realify U` is symplectic and orthogonal for unitary `U` | random `U ∈ U(2)` | `realify(U)ᵀ = realify(U*)`; `realify(U)·J·realify(U)ᵀ = J` (Mathlib's membership, `symplecticGroup` carrier line 101); `realify(U)·realify(U)ᵀ = 1` | the hypotheses `hKsp` and `hU` of `realifiedUnitary_maximal_compact_symplectic` are jointly satisfiable by `K =` the realified `U(n)`: not vacuous | none |
| `realifiedUnitary_maximal_compact_symplectic`, negative controls | `K = O(2)` for `n = 1`: `diag(1, −1)` | `diag(1,−1)·J·diag(1,−1) = −J ≠ J`, so `K ⊄ Sp`; `diag(1,−1)` is not `[[a, −b],[b, a]]` for any `a² + b² = 1` | without `hKsp` the conclusion fails: the hypothesis is needed | none |
| same, `hK` needed | `K = Sp(2,ℝ)` itself | `diag(t, 1/t) ∈ Sp(2,ℝ)` unbounded; not orthogonal for `t ≠ 1` | without compactness the conclusion fails | none |
| same, degenerate `n` | `n = 0` | all three groups are the one-point group; conclusion trivial | consistent with README line 174 "n = 0 the trivial case" | none |
| trace growth used by both maximality proofs | `P = diag(2, 1/2) ∈ Sp(2,ℝ)`; `P = (2) ∈ GL(1,ℂ)` | `tr Pᵏ = 2ᵏ + 2⁻ᵏ` = 2.5, 4.25, 32.03, 1024.0 for `k` = 1, 2, 5, 10; `2ᵏ` likewise | unbounded on `⟨P⟩`, so no compact subgroup contains a positive `P ≠ 1`: the README's argument at lines 172, 174 | none |
| `unitaryGroup_maximal_compact` | `Maximal` unfolded (`Order/Defs/Unbundled.lean` line 233, dual): `IsCompact U(n) ∧ ∀ K, IsCompact K → U(n) ≤ K → K ≤ U(n)` | `U(n)` compact in the units topology (`Constructions.lean` line 100: induced by `u ↦ (u, u⁻¹)`; on `U(n)`, `u⁻¹ = u*` is continuous); `n = 0`: the range is the whole one-point group | both conjuncts true; matches README line 172 "includes its compactness" | none |
| `generalLinearGroup_connectedSpace` | `n = 1`: path `e^{iπt}` from −1 to 1 avoids 0 (values 1, i, −1 at t = 0, ½, 1); `n = 0`: singleton | units topology agrees with the subspace topology since inversion is continuous on `GL(n,ℂ)`; polar path `U e^{itH}·Pᵗ` | true; `Nonempty` holds (1) | none |
| `symplecticGroup_isConnected` | `n = 0`: the carrier is the singleton; `n = 1`: `Sp(2,ℝ) = SL(2,ℝ)`, polar factors `diag(λ, 1/λ)ᵗ` and rotations | `IsConnected` = nonempty ∧ preconnected; `1 ∈ Sp`; the wrong carrier `orthogonalGroup` has two components (det ±1), excluded by the statement | true | none |
| docstring: "the chart identity fixes the form" | `w = extChartAt z₀ z₀`, which lies in the target | `inChartAt_extChartAt_self` (Closed.lean line 99): `σ.inChartAt z₀ (extChartAt z₀ z₀) = σ.altAt z₀`; so any two forms satisfying the identity agree at every `z₀` | uniqueness follows from the stated existence theorem; the sentence is justified | none |
| `canonicalForm_exists`, `liouville_inChart`, `liouville_section`, `IsLagrangianEmbedding`, `symplectic_subspace_extension`, Prop. 5.1 dictionary, chains, billiards, recurrence, prescribed-derivative germ, C2.2 | as in the previous review | as in the previous review's table (values recorded there) | unchanged at this head | none |

**Seeded sample.** None of the five sampled targets falls in the changed passages; their locators were re-read at the cached Cannas da Silva text (printed page = page marker − 8): Prop. 5.1 line 1300, Prop. 5.2 lines 1331–1333, §5.2 lines 1361–1366, Thm. 5.3 lines 1420–1423, Thm. 8.4 lines 1974–1985 and Thm. 9.3 lines 2107–2116, and the convention `ω = −dα`, locally `Σ dxᵢ ∧ dξᵢ`, lines 614 and 657–659, which the changed docstring cites. All agree with the previous review's verification.

**Library declarations opened at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aa): `Maximal` (`Order/Defs/Unbundled.lean` line 233, the `to_dual` of `Minimal`), `Unitary.toUnits : unitary R →* Rˣ` (`Algebra/Star/Unitary.lean` line 122), `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean` line 58, `unitary (Matrix n n α)`), `Matrix.J` and `Matrix.symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean` lines 58, 101, carrier `A * J * Aᵀ = J`), `Matrix.fromBlocks` (`Data/Matrix/Block.lean` line 45), `Units.instTopologicalSpaceUnits` (`Topology/Algebra/Constructions.lean` line 100), `PathConnectedSpace ℂˣ` (`Analysis/Complex/Convex.lean` line 98), `SmoothTwoForm.inChartAt` and `inChartAt_extChartAt_self` (`TauCeti/Geometry/Manifold/TwoForm/Closed.lean` lines 86, 99). All four `TauCeti.*` modules imported by `Suggested.lean` exist with built object files.

**Ownership.** `roadmaps grep` over main and the 439 open pull requests: the five new Lean names occur only in this folder; no other roadmap's Lean file states compactness or maximality of `unitaryGroup`, connectedness of `symplecticGroup` or of matrix units; the README phrases "U(n) is maximal compact" and "Sp(2n,ℝ) connected" occur only in this README (on main, in #1651 and in the omnibus #1187, which carries the same file). LieGroups Layer 7 on main states the general compact-complexification theorem, which README line 172 leaves to it. This roadmap is the owner.

**Cross-roadmap citations in the changed passages.** LieGroups Layers 2, 7, 9: resolved on main as above. No other roadmap is named in the diff.

## Not verifiable

- Weinstein, *Symplectic manifolds and their Lagrangian submanifolds*, Adv. Math. 6 (1971): paywalled publisher, refused by the sources service (as in the previous review); not touched by this change set.

## Source issues

- none (the previous review's misprint at Cannas da Silva §5.2, printed page 32, stands; nothing new was found in the passages re-read).
