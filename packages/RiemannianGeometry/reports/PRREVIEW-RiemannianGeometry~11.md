# Review of RiemannianGeometry (pull request #1683 at 2f670bb)

**Verdict:** accepted

No finding. This is an incremental re-review of the 81 lines changed in `TauCetiRoadmap/RiemannianGeometry/` since `164b354` (the head the previous review read): the deletion of `ParaboloidTargets.lean` (73 lines) and the two README passages (8 lines) that split the Myers locator. `Suggested.lean` is byte-identical to the file the previous review read (`git diff 164b354 HEAD` on it is empty). Both previous findings are repaired and the repairs introduced nothing new. The gate passes.

## Previous findings

- R01 — repaired: `ParaboloidTargets.lean` is gone; the folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml` and nothing else (`stray-files=0` in the gate). The README keeps the paraboloid integrals, their lower bounds and the crossing construction as targets and Checks of R5a.3 (`README.md:1970–1979`: “The integral estimates above are part of their proof and Checks”), and the two geometric headlines remain `paraboloid_geodesic_crossings` (`Suggested.lean:395`) and `paraboloid_vertex_pole` (`:416`). No README sentence names the deleted file or any of its eight declarations (grep for `ParaboloidTargets`, `timeIntegrand`, `angleIntegral`, `geodesic_crossings` without the `paraboloid_` prefix: none).
- R02 — repaired: `README.md:1162–1165` now reads “Theorem 5.2.26, p. 220, with λ=(n−1)/r², for the diameter bound and compactness; Example 6.2.29, p. 243, for compactness of the Riemannian universal cover, from which R4.3's fibre finiteness gives finite `π₁`”, and the Nicolaescu entry in the References (`README.md:2796–2798`) lists Example 6.2.29, p. 243, with the same description. Both locators read against the cached text (table below), and R4.3 is the item that owns the fibre-finiteness step (`README.md:1129–1148`, item 3 of R4: “compactness of that closed fibre then implies finiteness. The fibre/loop-class bijection proves pi1 finite”).

## Verified sound

### The changed passages

| Passage | What was checked | Outcome |
|---|---|---|
| `README.md:1159–1166` (R4 item 5, Bonnet–Myers) | Nicolaescu Theorem 5.2.26 at `nicolaescu-lectures line 9923–9931` (page marker 232/233, printed p. 220–221): hypotheses complete, `Ric(X,X) ≥ ((n−1)/r²)|X|²` for all vector fields; conclusions: every geodesic of length `≥ πr` has conjugate points, `diam ≤ πr`, compactness via Hopf–Rinow. With `λ = (n−1)/r²` this is `πr = π√((n−1)/λ)`, the README's bound. The theorem says nothing about `π₁`, so the split is correct. | locator exact; attribution now matches the source |
| same | Nicolaescu Example 6.2.29 at `line 10851–10857` (page marker 255, printed p. 243): complete `(M,g)` with `Ric ≥ c·g`, `c > 0`; the universal cover with the pullback metric is complete and locally isometric (Exercise 6.2.28, `line 10845–10850`), inherits the bound, and is compact by Myers. The step the README's R4.3 owns (complete pullback metric on the cover, `README.md:1140`) is exactly Exercise 6.2.28(b), so the example's input is supplied inside the roadmap; finiteness of the fibre, hence of `π₁`, is R4.3's conclusion (`README.md:1148`), not the example's. | locator exact; the proof route is owned step by step |
| `README.md:2793–2798` (References) | the Nicolaescu entry names the four locators the README uses (Def. 4.1.23 and Prop. 4.1.25 p. 151, Thm 5.2.26 p. 220, Thm 6.2.6 p. 238, Ex. 6.2.29 p. 243), each with a description that matches what the text proves at that place; the printed pages are the page markers minus 12 throughout. | consistent |
| `ParaboloidTargets.lean` (deleted) | nothing in the README, `Suggested.lean` or `STATUS.md`/`PROGRESS.md` refers to it; the gate's `stray-files` and `readme-ids-missing` counters are zero. | clean deletion |

The board's `sources.toml` records Nicolaescu under the single certified key `nicolaescu-lectures` (sha `d9ab8c5d…`, author page); its `locator` field lists the four earlier locators and not yet Example 6.2.29. That field is the worker's record, not a file of the pull request, so it is not a finding; the worker may add the locator when it records this review.

### Gate, direction and elaboration

My own run of the push gate on this head (`gate … RiemannianGeometry --base origin/main`) reports every counter zero and OK: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`. The diff outside the folder against `origin/main...HEAD` is empty (the long list of files in the change set is the merge of main at `99947c3e`, none of which the pull request alters). The dependency check:

```text
depcheck: 233 roadmaps, 2148 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The supplier citations did not change in this round; the one cross-reference the repair added is internal (R4.3, this roadmap's Layer 4 item 3).

`lake env lean` on a scratch copy of `Suggested.lean` in which every `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | sorry` exited 0 with exactly 23 `sorry` warnings (lines 72, 81, 92, 119, 131, 144, 167, 190, 201, 236, 253, 263, 274, 284, 315, 325, 337, 365, 395, 416, 446, 471, 480) and no error: no admitted theorem closes by one tactic. The file is unchanged since the previous review, so its 30 elaborated signatures in the worker's transcript are the ones that review compared with the README; I re-read the two Myers statements (`Suggested.lean:263–279`): `[ConnectedSpace M] [CompleteSpace M]`, `2 ≤ finrank ℝ E`, `0 < ricciBound`, the Ricci bound through `leviCivitaConnection I M).ricciTensor x v v` for every `x` and `v`, the distance bound `π√((n−1)/λ)` and `Finite (FundamentalGroup M x)` at an arbitrary basepoint, matching `README.md:1159–1161`. The one flagged binder (`IsJacobiFieldOn` without `[I.Boundaryless]`) is as before: the predicate's body does not need it and every theorem about it carries it.

### Seeded sample (unchanged passages, re-read at the cached lines)

| Target | Text | Outcome |
|---|---|---|
| 1.1 Curvature identities | Andrews, Proposition 16.2.1, `andrews-dg-ch16 line 105–106`, printed page header “154 Lecture 16. Curvature” at `line 104` | locator exact; unchanged since the previous review |
| 1.2 Local symmetry and the Einstein factor | no external locator; derivation from SmoothBundlesConnections B5.0 and §1.1 item 2 (checked in the previous review: `R = K·(g∧g)`, `∇R = dK⊗(g∧g)`) | unchanged |
| 1.3 Metric changes, Lie groups and submersions | O'Neill 1966 is a settled uncertified key; the Hopf-fibration and warped-product values were recomputed in the previous review | unchanged; cited by locator |
| 2.1 Jacobi fields and their initial data | Milnor §14, Lemma 14.4 under the settled uncertified key | unchanged; cited by locator |
| 2.2 Normal-coordinate jets (R1.4) | Nicolaescu Prop. 4.1.25 at `nicolaescu-lectures line 6793–6795` (printed p. 151): `g_ij(q) = δ_ij`, `∂_k g_ij(q) = 0`; Brewin `brewin-rnc line 363` (printed p. 9) and equation (11.1) at `line 614–615` (printed p. 15) | locators exact; unchanged |

### Adversarial table

Rows for untouched statements carry forward the previous report's computed values (PRREVIEW-RiemannianGeometry~10, “Computed adversarial pass”); the Myers row is recomputed because its passage changed.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` (R4 item 5, changed locator) | unit `S³`: `Ric = 2g`, `λ = 2`, `n = 3`; `S³` of radius 2: `Ric = g/2`, `λ = 1/2`; `RP³`; flat `T³`; `S²` with `λ = 1` | bounds `π√(2/2) = 3.1416 = diam S³` (sharp) and `π√(2/(1/2)) = 6.2832 = diam S³(2)` (sharp); `RP³`: universal cover `S³` compact, fibre of size 2, `π₁ = ℤ/2`; `T³`: `λ = 0` excluded by `0 < λ`, `π₁ = ℤ³` infinite; `S²`: Example 6.2.29 applies in dimension 2 (`Ric = Kg`, `K ≥ 1`), cover `S²` itself, `π₁` trivial | positivity of `λ` necessary; Theorem 5.2.26 gives the first two conclusions, Example 6.2.29 plus R4.3 the third, as the README now says |
| `modelSine` | previous report | `κ=1,0,−1` at `π/2`: `1`, `1.5708`, `2.3013`; `s_4′(0)=1`, first zero `π/2` | unchanged |
| `rauch_norm_ge_of_sectional_le` | previous report | sphere radius `5/2`: `1 ≤ 1.4695`; at `5π/2` the guard `b < π` excludes `1 ≤ 0` | unchanged |
| `synge`, `synge_orientable_of_odd` | previous report | `S², RP², T², RP³`, point, `S¹` | unchanged |
| `modelBallVolume`, `bishopGromov` | previous report | `r²/2`, `1−cos π = 2`, `r³/3`; unit `S²` ratio `6.2832` constant; `2.8884, 2.2245, 1.2732` nonincreasing; hyperbolic `3.4123, 4.3388` increasing outside the hypothesis | unchanged |
| `killingHopf_euclidean/sphere/hyperbolic` | previous report | `n = 0, 1, 2` on each; guards `2 ≤ n`, `1 ≤ n` necessary | unchanged |
| `constant_sectional_tensor_iff`, `schur`, `einstein_factor_constant` | previous report | dim `≤ 1` both sides true; `S³ ⊔ S³(2)`; `K = −2−4x²` | unchanged |
| Jacobi definition, normal-coordinate jets, radial-parallel frame | previous report | residuals `0, 2E, 0`; `sin²(0.1) = 0.0099667111` both sides; holonomy `π/2` | unchanged |
| `cartanHadamard_isCoveringMap` | previous report | `ℝⁿ`, flat cylinder deck group `2πℤ` | unchanged |
| Paraboloid headlines (R5a.3) | previous report (`a=1, R=2`) | `T_1(2) = 5.0979 ≥ 3`, `A_1(2) = 2.8412 ≥ 1.3863`, `r″(0) = 0.2` | the values now live only in the README's Checks, as requested |
| `riemannianDist_eq_sSup_smooth`, `fischer_split`, `fischer_decomposition`, `two_distinct_geodesics`, `three_simple_closed_geodesics` | previous report | interval `x=¼, y=¾`: `½`; `n=3`: `(1,0)`, `(0,p)`, `Δr⁴ = 20r²` | unchanged |

### Ownership and duplication

The repair adds no object: the deleted file's five definitions and three theorems had no counterpart anywhere, and the headlines they illustrated are the unchanged `paraboloid_geodesic_crossings` and `paraboloid_vertex_pole`. The headline coverage table of the previous report stands (17 headlines stated, 8 named in the docstring as not statable). Ownership against open pull requests not listed with files in the brief was not checked.

## Not verifiable

- **O'Neill 1966**, **Milnor, Morse Theory**, **Fulton–Harris**, **Lee, Introduction to Riemannian Manifolds**: settled uncertified keys, cited by locator only; none of them is touched by this round's change.

## Source issues

- none
