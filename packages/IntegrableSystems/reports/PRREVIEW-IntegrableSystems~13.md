# Review of IntegrableSystems (pull request #1651 at 824d1d3)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

Incremental re-review of 0 changed lines since 5eaa255: the folder's two files are byte-identical to what r12 read (`git diff --stat 5eaa2558..HEAD` lists only `CotangentLagrangian/Suggested.lean`, 9 insertions and 6 deletions). That one commit gives the CotangentLagrangian sibling the module-system header (`module`, `public import` lines, `@[expose] public section`) and changes nothing else; this roadmap cites CotangentLagrangian only by README section (C3 at line 321, C3.1 at line 430, the roadmap at line 14), and those sections are untouched (`## C3.` at its line 225, `### C3.1.` at line 256). So this round checks the previous finding, the gate, the elaboration and the sibling change. The sole finding of r12 is not repaired, and it is still the only one: the same commit that repaired the sibling's header left this file's header alone.

Gate at this head (the worker's run and my own, with `--build`): every text scanner passes, `depcheck=0`, `build=1 FAIL` on the one Lake warning quoted in R01. My run also reports `outside-folder=4`, naming only the ConvexityToric and CotangentLagrangian README and `Suggested.lean`, which the brief lists as the pull request's own folders; the pull request changes nothing else outside the family (`git diff --stat origin/main...HEAD` with the three folders and the family index excluded is empty). Dependency check on this head, with no UPWARD, CYCLE or `moved:` line for IntegrableSystems:

```
depcheck: 228 roadmaps, 2146 edges, 0 problem(s)
```

## R01 (P1) — the gate's build fails: `Suggested.lean` still has the plain header at the pinned Mathlib

Location: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/Suggested.lean` lines 1–4, `import Mathlib` followed by three `import TauCeti.…` lines.

Claim: the file builds under the gate.

Witness: the gate at this head reports `build=1` with the single problem "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file" (the worker's run and my own `--build` run agree). The pull request's `lake-manifest.json` pins Mathlib `f6090c7` and Tau Ceti `358314d`, and the pinned Mathlib's `lakefile.lean` line 67 sets `requiresModuleSystem := true`, so Lake emits this advisory for every plain-import module and the gate counts every non-`sorry` warning as a build problem. Both siblings of the same pull request now carry the module-system header (`ConvexityToric/Suggested.lean` since 7178817, `CotangentLagrangian/Suggested.lean` since 824d1d3, the head under review); this file is the only one of the three still without it.

Repair: replace lines 1–4 by

```lean
module

public import Mathlib
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Symplectic.Lagrangian.Basic
public import TauCeti.Geometry.Symplectic.StandardCompatible
```

and put `@[expose] public section` on its own line immediately after `noncomputable section` (line 33, after the module docstring), exactly as the CotangentLagrangian sibling does at this head, changing nothing else. Tested at this head: a scratch copy with exactly this header and `@[expose] public section`, followed by the file's body and a `#check @` line for each of the ten declarations, elaborates with `lake env lean` from the worktree in 14 s with only the three `declaration uses sorry` warnings (lines 74, 99, 123 of the copy, the three theorems), and all ten elaborated types are identical, after dropping the namespace prefix, to the worker's `signatures.md` for the file as it stands (table row "Lean binders"); the plain `public section` variant elaborates the same way in 6 s. Without a `public section` the `module` header silences the warning but hides every declaration from importers, so both parts of the repair are needed.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 1–4 are still `import Mathlib` and three plain `import TauCeti.…` lines; the gate's build fails on the same Lake warning. Written again above as R01.

## Verified sound

**Adversarial pass.** The diff touches no statement of this folder, so every row for the folder's own statements carries forward from r12 (and, through it, r11 and r9) with the values recorded there; the six seeded-sample targets fall in untouched text and I recomputed them at this head rather than citing. One row is added for the sibling file changed outside the folder.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| CotangentLagrangian C3 / C3.1 as consumed by README lines 321 and 430 (sibling changed since r12) | the two section citations and the roadmap-level citation at line 14 | the diff since 5eaa255 is `CotangentLagrangian/Suggested.lean` lines 1–9 and 34 only (header and `@[expose] public section`); its README is byte-identical, `## C3. Correspondences and generating functions` at line 225 and `### C3.1. Discrete action, iterates and convex billiards` at line 256 as before; the generating convention y=−∂_1S, Y=∂_2S of I5.0 (line 321) and the chain dictionary F_k(x_k,y_k)=(x_(k+1),Y_k) of I5.2 (line 430) consume prose targets, no Lean name of the sibling | citations resolve; no supplier drift | none |
| ConvexityToric Layer 1 / 1.1 as consumed by line 16 | the one citation | unchanged since r12 (ConvexityToric untouched by the diff since 5eaa255): `## Layer 1` at its line 136, `### 1.1` at line 138 | citation resolves | none |
| Seeded "Quotient and atlas": finitely many integers meet two compact sets | K₁,K₂ ⊆ [−R,R], n·t=t+np | (K₁+np)∩K₂≠∅ forces |np|≤2R, so |n|≤2R/p: at most 2⌊2R/p⌋+1 integers; for p→0⁺ the bound is unbounded, which is why p>0 is the hypothesis | proper discontinuity holds for every p>0 | none |
| Seeded "Group, translations and time form": q_p^*dt_p=dt and the curve integral | γ(t)=q_p(t), 0≤t≤p; translation by s | ∫_γ dt_p=∫₀^p (q_p^*dt_p)(γ'(t))dt=∫₀^p 1 dt=p; dt is invariant under t↦t+s, so dt_p is translation invariant; dt_p(∂_t)=1 on the generator; two lifts differ by np, so d(lift) agree | all stated laws hold | none |
| Seeded "Scaling": D_(p,q)^*dt_q=(q/p)dt_p | lift t↦(q/p)t; θ=2πt/p | d((q/p)t)=(q/p)dt, so D^*dt_q=(q/p)dt_p; derivative q/p>0 preserves orientation; dθ=(2π/p)dt_p, so dt_p=(p/(2π))dθ as the README states; D_(p,p)=id, D_(q,r)∘D_(p,q)=D_(p,r) since (r/q)(q/p)=r/p | ✓ | none |
| Seeded "Finite products and open restrictions": permutation sign and empty product | two factors; zero factors | dt₂∧dt₁=−dt₁∧dt₂ (sign of the transposition); coordinate-fiber pullback of dt_i along the i-th fiber inclusion is dt_{p_i}, along another coordinate it is 0 (the coordinate is constant); the empty product is a point with the degree-0 orientation +1 | ✓ | none |
| Seeded "The positive-period total family": Q^*η=dt−(t/p)dp and deck invariance | N(p,[t]_p)=(p,[t/p]_1); deck map t↦t+np | Q^*β=d(t/p)=dt/p−(t/p²)dp; η=pβ gives Q^*η=dt−(t/p)dp; under t↦t+np: d(t+np)−((t+np)/p)dp=dt+n dp−(t/p)dp−n dp=dt−(t/p)dp (the "n dp" of the translated coordinate cancels exactly); dη=dp∧β+p dβ=dp∧β; Q^*(dη)=dp∧(dt/p)=(1/p)dp∧dt; on a fibre dp=0 so i_p^*η=dt_p | all five identities hold; η not closed since dp∧β≠0 | none |
| Seeded "Smooth parameter families and estimates": ∂_p^k(t/p) and the bounds | k=0,1,2; |t|≤R, ε≤p | ∂_p(t/p)=−t/p², ∂_p²(t/p)=2t/p³, general (−1)^k k! t/p^(k+1); ∂_t of it is (−1)^k k!/p^(k+1); two t-derivatives give 0 since t/p is linear in t; |·|≤k!R/ε^(k+1) and k!/ε^(k+1) | ✓ | none |
| Lean binders | `#check @` of all 10 declarations on the scratch copy with the repaired header, once with `public section` and once with `@[expose] public section` | types identical (modulo the namespace prefix, printed short inside the namespace) to the worker's `signatures.md` for the plain-header file: `IntegrableSystem` and `regularLevel_lagrangian` keep `[FiniteDimensional ℝ E]` and `[IsManifold I ∞ M]`; `centralForce_commutes` keeps `0<mass`, `ContDiffOn ℝ ∞ V (Ioi 0)`, `z.1≠0`; `strict_annulus_two_fixed_points` keeps all 13 hypotheses | match the README | R01 (header only) |
| I5 theorem vs Le Calvez–Wang; `strict_annulus_two_fixed_points`; lift G and the integer m; square-edge derivative; Moser negative control; rotation-number equivalence; I5.0 normalization; shear generator; sign vs C3.1; ∂_kW, ẋ_k, ẏ_k; isotopy B_t; Gramain Thm 1; Smale Thm B; Moser data and field; twist factorization; K=1 factorization Check; generators S₁, S₂; S₁₂=−1/X_y; W(d) and band; descended gradient; face derivative signs; second-order exit; full run; exit set L; first exit from the interior; injectivity lemma route; S⁺ to S; G and root; clamped root; pair model K=1; negative control ẏ=1; cup-length sharpness; Lean `hV`, `hq`; `centralForce_commutes` sign; `regularLevel_lagrangian` n=0,1; `IntegrableSystem` n=0; I4 Kepler, free particle, oscillators; I1 consumes SBC B1.0; Le Calvez–Wang Thm 1 page; Cannas da Silva §18.4 Thm 18.12 p. 110; Legendre transform definability; namespace collision; one-tactic probe | as in r12 (and r11, r9) | untouched by any diff since r9; the r11 table's values (recorded there with the computed sides) describe the same text at this head | ✓ | none |

**Library declarations at the pins** (Mathlib `f6090c7`, Tau Ceti `358314d`, the pull request's `lake-manifest.json` and the worktree's `.lake/packages` agree): unchanged since r11, which opened `TauCeti.SmoothTwoForm`, `IsNondegenerate.symplecticFormAt`, `constSmooth`, `IsLagrangian`, `stdSymplecticForm`, `cotangentLiouvilleForm` and `TangentSpace` at these pins; the three `TauCeti.*` modules imported exist and their oleans are built in this worktree (`lake env lean` of the file as it stands: 10 s, the three `sorry` warnings only; the module-system advisory is Lake's build-time message and appears only in the gate's `lake build`).

**Cross-roadmap citations resolved at this head**: CotangentLagrangian C3 and C3.1 and ConvexityToric Layer 1 / 1.1 (table rows 1 and 2). The other citations (SmoothBundlesConnections B1.0 with `exists_regularFiber_smoothEmbedding`, CharacteristicClasses C1.2b, AlgebraicTopology Stages 5–6, DifferentialGeometry Layers 0–1 and 8.4, HamiltonianReduction R1, Completed/HopfRinow, LieGroups Layer 0, LieGroupoidsPoisson §G0.1) are in text unchanged since r11 and their targets are not in the diff since then; the worker's `roadmaps resolve` finds no unresolved citation or Lean name at this head. Ownership: unchanged since r9/r11; ownership against open pull requests whose files the brief does not give was not re-checked this round.

**Lean form.** Unchanged since r12: single `import Mathlib` plus three `TauCeti.*` modules, no `set_option`, no `lemma`, no sorry'd data, `theorem` throughout, docstrings on every declaration, headlines of I1, I4 and I5 stated and the not-statable ones named in the docstring with their missing carriers; the only defect is the header (R01). The gate's `readme-ids-missing=0` confirms every backticked name of the roadmap's own is declared.

**Declared gaps.** None declared; no `gap:` prerequisite in the README.

## Not verifiable

- Spanier, Ch. 6; Conley–Zehnder 1983; Epstein 1966; Arnold; Marsden–Ratiu; Duistermaat 1980; Hofer–Zehnder; Lee: settled uncertified, as in r9, r11 and r12; their passages are unchanged.

## Source issues

- none
