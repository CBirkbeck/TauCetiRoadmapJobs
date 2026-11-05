# Review of IntegrableSystems (pull request #1651 at 7178817)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

Incremental re-review of the 98 lines changed since bd2dba9 (the review r9 head): the diff, the passages that cite or depend on it, the gate and the elaboration. Every finding of r9 is repaired (list under `## Previous findings`); one new problem came in with the merge of main, which moved the Mathlib pin to `f6090c7` (the pull request's `lake-manifest.json` and the content checkout's now agree: Mathlib `f6090c7`, Tau Ceti `358314d`, toolchain `v4.35.0-rc3`).

Gate at this head (the worker's run and my own, with the build): every text scanner passes, `depcheck=0`, `build=1 FAIL`. Dependency check run on this head:

```
depcheck: 233 roadmaps, 2138 edges, 0 problem(s)
```

The `outside-folder` lines of my gate run name only the ConvexityToric and CotangentLagrangian folders, which the brief lists as the pull request's own; the pull request changes nothing else outside the family (`git diff --stat origin/main...HEAD` with the three folders and the family index excluded is empty).

## R01 (P1) — the gate's build fails: `Suggested.lean` needs the module-system header at the pinned Mathlib

Location: `Suggested.lean` lines 1–4, `import Mathlib` followed by three `import TauCeti.…` lines.

Claim: the file builds under the gate.

Witness: the gate at this head reports `build=1` with the single problem "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file" (the worker's run and my own run with `--build` agree). The pinned Mathlib's `lakefile.lean` line 67 sets `requiresModuleSystem := true`, so Lake emits this advisory for every plain-import module, and the gate counts every non-`sorry` warning in the folder as a build problem. The sibling `ConvexityToric/Suggested.lean` of the same commit already carries the header; CoboundaryExpansion on main (`TauCetiRoadmap/CoboundaryExpansion/Suggested.lean` lines 1–3) is the precedent, with plain `def` and `theorem` declarations and no `public` modifier on them.

Repair: replace lines 1–4 by

```lean
module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Symplectic.Lagrangian.Basic
public import TauCeti.Geometry.Symplectic.StandardCompatible
```

and change nothing else. Tested: a scratch copy with exactly this header and `#check @` lines for all ten declarations elaborates with `lake env lean` in 3 s with only the three `declaration uses sorry` warnings, and every elaborated type is unchanged (table row "Lean binders").

## Previous findings

- R01 — repaired: lines 19–20 "SmoothBundlesConnections B1.0 supplies regular fibres with tangent space ker df (`exists_regularFiber_smoothEmbedding`)"; line 37–38 cites B1.0 at "tangent ker df"; the Lee paragraph and reference are deleted (no "Lee" remains); the ownership sentences in I5.1 and I5.3 are gone and the scope paragraph (lines 23–26) states I5's ownership once.
- R02 — repaired: `Suggested.lean` line 35 `namespace TauCetiRoadmap.SymplecticGeometry.IntegrableSystems`; no other `Suggested.lean` on main, in this pull request or at the open heads uses that namespace (grep), and the family index keeps `TauCetiRoadmap.SymplecticGeometry`.
- R03 — repaired: line 16 "ConvexityToric Layer 1 (1.1)" with anchor `#layer-1-compact-symplectic-actions-and-local-models`; ConvexityToric at this head has "## Layer 1: Compact symplectic actions and local models" (line 121) and "### 1.1 Periods, characters and rank-one normalization" (line 123), which builds the period lattice and character dictionary.
- R04 — repaired: lines 345–350 "fixing the lower boundary line pointwise; G is then a lift of the identity on the upper boundary circle, so it translates the upper line by an integer m … τ^(−m)∘G, which fixes both boundary lines pointwise"; lines 357–360 "upper triangular with tangential entry 1 and positive normal entry, so its convex combination with the identity has positive determinant". Both recomputed (table).
- R05 — repaired: lines 414–417, the wrong model is now ι_Xω=+β_t, with the computed first-order defect (1+2ε sin 2πx); recomputed (table).
- R06 — repaired: line 293 "Thm. 1, p. 704".
- R07 — repaired: `Suggested.lean` line 70 "§18.4, Theorem 18.12, p. 110".
- R08 — repaired: lines 539–543 own the natural isomorphism between the open-cover Čech cohomology of C1.2b and Alexander–Spanier cohomology for compact Hausdorff pairs, compatible with maps of pairs and cup products; the scope paragraph (line 24) lists it.
- R09 — repaired: `Suggested.lean` lines 29–33 say the Legendre transform is definable and name the missing carrier (`cotangentLiouvilleForm` on a vector space times its dual only).

## Verified sound

**Adversarial pass.** Rows for the changed statements carry computed values; rows for the statements the diff leaves untouched cite the r9 report, whose values I re-read and which the text at this head still states.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| I1 consumes SBC B1.0 for regular common levels | f=(f₁,…,f_k): M→ℝ^k, k≤n, df surjective on the level | B1.0 (main `SmoothBundlesConnections/Suggested.lean` line 69): finite-dimensional boundaryless X, Y, `ContMDiff` f, `mfderiv` surjective at every point of the fibre ⇒ smooth embedding with tangent image ker(mfderiv f); the family convention is finite-dimensional boundaryless, so the hypotheses match | supplier states exactly what I1 uses | none |
| Lift G and the integer m (I5.1) | g=id on both boundary circles; τ(x,y)=(x+y,y) | lift fixing y=0 pointwise: on y=1 it lifts the identity of the circle, so G(x,1)=(x+m,1), m∈ℤ constant by continuity; τ^(−m)∘G at y=0: (x,0); at y=1: (x+m−m,1)=(x,1); for g=τ, m=1 | ✓ | none |
| Square-edge derivative (I5.1) | h(x,y)=(x,y+y(1−y)) at (x,0); general edge | D=[[1,0],[0,2]]; general D=[[1,a],[0,b]], b>0; (1−s)I+sD=[[1,sa],[0,1−s+sb]], det=1−s+sb>0 for s∈[0,1] | ✓ | none |
| Moser negative control (I5.1 Check) | ρ_t=1+ε sin 2πx, ι_Xω_s=+β_t | d/ds(ψ_s^*ω_s)=ψ_s^*(∂_sω_s+dι_Xω_s)=ψ_s^*((ρ_t−1)dx∧dy+dβ_t)=ψ_s^*(2dβ_t), dβ_t=ε sin(2πx)dx∧dy≠0; integrating with ψ_s=id+O(ε): ψ_1^*ω_1=(1+2ε sin 2πx)dx∧dy+O(ε²); with −β_t the bracket is 0 | ✓ | none |
| Le Calvez–Wang Thm 1 page | `lecalvez-wang` lines 52, 82 | running head "704" at line 52 opens page 2; Theorem 1 at line 82 on that page | p. 704 ✓ | none |
| Cannas da Silva locator in the docstring | `cds` lines 4420, 4470–4473, 4479–4480 | §18.4 opens at line 4420; Theorem 18.12 (regular level is Lagrangian) at lines 4470–4473; the next page marker (line 4479) is printed p. 111, so the theorem is on p. 110 | ✓ | none |
| Legendre transform definability (docstring) | `L : TangentBundle I Q → ℝ`, q : Q | `TangentSpace I q` is `E` by definition (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean` line 1033), so `fderiv ℝ (fun v ↦ L ⟨q, v⟩) v : E →L[ℝ] ℝ` is a cotangent vector; `cotangentLiouvilleForm` lives on `V × StrongDual ℝ V` only (`TauCeti/Geometry/Symplectic/Cotangent/Liouville.lean` line 71) | ✓ | none |
| Namespace collision | grep for `namespace TauCetiRoadmap.SymplecticGeometry.IntegrableSystems` | this file only; family index, CotangentLagrangian and HamiltonianReduction use `TauCetiRoadmap.SymplecticGeometry`, ContactGeometry its own | no two modules declare one fully qualified name | none |
| Lean binders | `#check @` of all 10 declarations, under the plain header and under the `module` header | identical types; `IntegrableSystem`, `regularLevel_lagrangian` keep `[FiniteDimensional ℝ E]`, `[IsManifold I ∞ M]`; `centralForce_commutes` keeps `0<mass`, `ContDiffOn ℝ ∞ V (Ioi 0)`, `z.1≠0`; the I5 theorem keeps all 13 hypotheses | match the README | R01 (header only) |
| One-tactic probe | `first \| rfl \| simp_all \| infer_instance` on the three theorems | `regularLevel_lagrangian`: instance expected; `centralForce_commutes`, `strict_annulus_two_fixed_points`: unsolved goals | no padding | none |
| I5 theorem vs Le Calvez–Wang; `strict_annulus_two_fixed_points`; rotation-number equivalence; I5.0 normalization; shear generator; sign vs C3.1; ∂_kW, ẋ_k, ẏ_k; isotopy B_t; Gramain Thm 1; Smale Thm B; Moser data and field; twist factorization; K=1 factorization Check; generators S₁, S₂; S₁₂=−1/X_y; W(d) and band; descended gradient; face derivative signs; second-order exit; full run; exit set L; first exit from the interior; injectivity lemma route; S⁺ to S; G and root; clamped root; pair model K=1; negative control ẏ=1; cup-length sharpness; Lean `hV`, `hq`; `centralForce_commutes` sign; `regularLevel_lagrangian` n=0,1; `IntegrableSystem` n=0; I4 Kepler, free particle, oscillators | as in r9 | untouched by the diff; values as in the r9 table (the statements at this head are the same text) | ✓ | none |
| Seeded sample: I2.0 "Quotient and atlas", "Group, translations and time form", "Scaling", "Finite products and open restrictions", "The positive-period total family", "Smooth parameter families and estimates" | as in r9 | untouched by the diff; the six r9 rows (finite overlap bound 2R/p, ∫_γ dt_p=p, D^*dt_q=(q/p)dt_p, dt₂∧dt₁=−dt₁∧dt₂, Q^*η=dt−(t/p)dp, ∂_p^k(t/p)=(−1)^k k! t p^{−k−1}) | ✓ | none |

**Library declarations opened at the pin** (Mathlib `f6090c7`, Tau Ceti `358314d`, both manifests): `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61`); `IsNondegenerate.symplecticFormAt` and `constSmooth` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:99, 192`); `IsLagrangian` (`TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99`); `stdSymplecticForm` (`TauCeti/Geometry/Symplectic/StandardCompatible.lean:72`); `cotangentLiouvilleForm` (`TauCeti/Geometry/Symplectic/Cotangent/Liouville.lean:71`, on `V × StrongDual ℝ V`); `TangentSpace` (`Mathlib/Geometry/Manifold/IsManifold/Basic.lean:1033`). Tau Ceti at this pin still has no Poisson bracket, Hamiltonian vector field or regular-fibre declaration (grep for `poissonBracket`, `hamiltonianVectorField`, `regularFiber`: none), and no `ChartedSpace` or `IsManifold` instance on `AddCircle` in either package, so the docstring's not-statable reasons stand and `bracketValue` duplicates no library object. The three `TauCeti.*` modules imported exist at the pin and their oleans are built in this worktree (elaboration in 3 s).

**Cross-roadmap citations resolved** (main at c9a16a0, siblings at this head): SmoothBundlesConnections B1.0 (README line 221, headline at line 228; `exists_regularFiber_smoothEmbedding` at `Suggested.lean` line 69); ConvexityToric Layer 1 / 1.1 at this head (lines 121, 123); CharacteristicClasses C1.2b, AlgebraicTopology Stages 5–6, DifferentialGeometry Layer 3 and 8.4, HamiltonianReduction R1, CotangentLagrangian C3 and C3.1, Completed/HopfRinow, LieGroups Layer 0 and LieGroupoidsPoisson §G0.1: as resolved in r9, none of these citations changed in the diff. The worker's `roadmaps resolve` found no unresolved citation or Lean name. Ownership: unchanged since r9 (the Poincaré–Birkhoff theorem, index pairs, compact-pair Čech/Alexander–Spanier theory and the annulus isotopy theorem occur in no roadmap on main or at the open heads; the transport isomorphism now owned in I5.4 is a new target of this roadmap and not stated elsewhere). Ownership against open pull requests whose files the brief does not give was checked only through the r9 `roadmaps grep`.

**Lean form.** Single `import Mathlib` plus three `TauCeti.*` modules, no `set_option`, no `lemma`, no sorry'd data, `theorem` throughout, docstrings on every declaration; the only defect is the header (R01). Every Lean name appears in the README (lines 13, 36–38, and the I4/I5 passages unchanged since r9) and the gate's `readme-ids-missing=0` confirms every backticked name of the roadmap's own is declared. The elaborated signatures agree with the worker's `signatures.md`.

**Declared gaps.** None declared; no `gap:` prerequisite in the README.

## Not verifiable

- Spanier, Ch. 6 (settled uncertified): the Alexander–Spanier/Čech comparison and the section range §§6.6–6.9 could not be read; as r9 noted, the relative groups with exactness and excision may be introduced in §§6.4–6.5, before the tautness section. Not a finding, since the text cannot be checked legally here.
- Conley–Zehnder 1983, Epstein 1966, Arnold, Marsden–Ratiu, Duistermaat, Hofer–Zehnder: settled uncertified, as in r9; their passages are unchanged in this diff.

## Source issues

- none
