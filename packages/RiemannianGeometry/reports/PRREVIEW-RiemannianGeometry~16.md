# Review of RiemannianGeometry (pull request #1683 at 470e031)

**Verdict:** needs changes

Incremental re-review of the 11 lines of `TauCetiRoadmap/RiemannianGeometry/README.md` changed since the head the previous review read (`0304eae`): the two sentences that named HomotopySpheres (lines 269–273 and 1050–1051) and the link fragment into GeometricTopology (line 923). `Suggested.lean` is byte-identical to the previous head and no file outside the folder changes. The two folder repairs of the previous round are correct and complete; the gate passes. The one finding carried from the previous round, the unstated order between this head and the open pull requests that conflict with it, is not repaired, and a third conflicting pull request has appeared since. One P3 finding; nothing blocks.

## R01 (P3) — Three open pull requests change this folder and conflict with this head, and no order is stated

Re-raised: H02 of the repair report (the answer that the pull-request description is not editable from a repair job). The reason does not settle the finding: the overlap rule asks for a stated order between conflicting heads, the README may not carry pull-request numbers, so the description is the only place for it, and the description is the author's to edit whoever runs the repair.

**Location.** The pull-request description (`scratch/pull-request.md`, data), unchanged since the previous review: it names neither #1327, #1187 nor #1974 and states no order; `TauCetiRoadmap/RiemannianGeometry/README.md` and `Suggested.lean` (the conflicting files).

**Claim.** The overlap index of 2026-11-08 (`scratch/overlaps.md`, computed from the heads) reports three open pull requests whose heads conflict with this one in this folder: #1327 (`RiemannianGeometry: curvature polarization and harmonic conventions`, `README.md` and `Suggested.lean`), #1187 (`chore: bump TauCeti to ab00ba392`, `Suggested.lean`, `lake-manifest.json` and ten other files) and, new since the previous review, #1974 (`RiemannianGeometry: local surface geometry sub-roadmap and explicit local targets`, by a different author, `README.md` and `Suggested.lean`). The order between them is determined by their contents but stated nowhere.

**Witness.** `scratch/overlaps.md`, "Other open pull requests that change this roadmap", three bullets. Read through the roadmaps tool at today's heads: #1974 changes main's README by 47 lines (it adds a nested sub-roadmap `RiemannianGeometry/Surfaces` with milestones S1–S5, replaces the Gauss–Bonnet-and-turning construction of R4.9 by a citation of Surfaces S3, adds a blow-up scaling item 5 and a radial Hessian comparison) and changes `Suggested.lean` not at all; this head keeps main's R4.9 passage verbatim (`README.md:1532`, `:1540` here = main's `:860`, `:868`), so #1974's edits apply to text this pull request preserves, and the four anchors Surfaces uses into the parent (`#r1-…`, `#r4-…`, `#r6-…`, `#r496a-…`) resolve at this head (same heading text at `README.md:298`, `:1069`, `:2147`, `:1528`). #1327's 20 declarations are all declared here under the same names (previous review). So each rebase is mechanical, only unstated.

**Repair.** Add one sentence to the pull-request description: "#1327 is rebased on this pull request before either merges (every declaration of its `Suggested.lean` is here under the same name); #1974 is rebased on this pull request (its R4.9 edit and its Surfaces links apply to text this pull request preserves); #1187's pin bump re-targets `Suggested.lean` after whichever merges first." No change to the folder.

## Previous findings

- R01 — repaired: `README.md:270–273` now reads "It needs no Bott-chain construction beyond the abstract finite-dimensional Morse–Bott theorem. MorseTheory M2 owns ordinary attachments and M5 owns the abstract finite-dimensional Morse–Bott theorem." and `:1050–1051` "stable homotopy calculations are outside this roadmap." The name HomotopySpheres occurs nowhere in the folder (grep: 0 hits); the gate reports `dropped=0`. MorseTheory M2 (`TauCetiRoadmap/MorseTheory/README.md:144`, compact-band deformation, handles and cells) and M5 (`:857`, Morse–Bott normal bundles and attachments) exist on main with that content, and the sentence agrees with R3.4 (`README.md:1003–1030`), which consumes exactly M5's finite-dimensional Morse–Bott attachments on the antipodal critical manifold; no other passage of the README claims a stable-homotopy result (the only mentions of Freudenthal are `:283` and `:1050`, both the unstable Morse proof).
- R02 — repaired: `README.md:923` links `../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison-far-horizon`; main's only heading of that section is `TauCetiRoadmap/GeometricTopology/README.md:930`, "## The smoothing-and-triangulation comparison (far horizon)", whose generated anchor is that fragment, and the file declares no explicit anchor. The overlap index now flags that #903 and #1797, both revisions of GeometricTopology, no longer define the fragment at their heads: #903 (`README.md:556–561` at its head) routes item 1 to its Layer 11.3 and #1797 (`:3115–3135` at its head) to its Layer 12.1, and each records the old → new mapping for this fragment by name. A revision of an existing roadmap is never a dependency, so the citation reads main, as the previous repair asked; the two revisions disagree on the new number, so no single "at its head" citation exists. Not a finding; the citation moves with whichever revision merges.
- R03 — not repaired: the description is unchanged and names no order; a third conflicting head (#1974) has appeared. Written again as R01 above.

## Verified sound

### Gate, direction, folder, elaboration

The worker's gate at this head: every counter zero, `build=0`, `OK`. My own run from the pull-request worktree reproduces every counter at zero (it prints no `build=` token; the worker's does). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml` and no stray file. The worktree's packages are at the branch's own pins (Mathlib `f6090c70`, Tau Ceti `358314d4`, checked with `rev-parse` against `lake-manifest.json`). The dependency check:

```text
depcheck: 229 roadmaps, 2317 edges, 0 problem(s)
```

No UPWARD or CYCLE line, no `moved:` line. `lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` from the worktree: exit 0, exactly 23 `declaration uses sorry` warnings at lines 70, 79, 90, 117, 129, 142, 165, 188, 199, 234, 251, 261, 272, 282, 313, 323, 335, 363, 393, 414, 444, 469, 478 (the same 23 lines as the previous review) and nothing else. The file is unchanged since the previous head, so its form (module header, `public import Mathlib` plus nine `TauCeti.*` modules present at the pin, no `set_option`, no `lemma`, no sorry'd data, one module docstring naming the five headlines not statable and what each lacks) is as the previous review recorded.

A scratch copy of the file followed by `#check @` for all 29 declarations elaborates and prints every type (the worker's own attempt failed only because it ran against a different packages directory whose Tau Ceti object files were missing; its 30th `#check`, of a name `is` produced by its name scraper, is the one error). I compared the printed types with the README: `synge` keeps `[T2Space M] [ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I ∞ M]`, `Even (finrank ℝ E)` and strict positivity of `⟨R(u,v)v,u⟩` on independent pairs; `synge_orientable_of_odd` the same without orientability and with `Odd`; `bishopGromov` keeps `[MetricSpace M] [IsRiemannianManifold I M] [ConnectedSpace M] [CompleteSpace M] [MeasurableSpace M] [BorelSpace M] [SecondCountableTopology M] [IsContinuousRiemannianBundle …]`, the Ricci bound `(finrank − 1)·κ·‖v‖²`, `0 < r ≤ s` and the guard `0 < κ → s < π/√κ`; the other 26 agree with the previous review's record. Nothing changed.

### The changed passages

| Passage | What I checked | Values / witnesses |
|---|---|---|
| `README.md:269–273` (R3 and Morse–Bott) | the two MorseTheory sections named exist on main and own what the sentence says; R3's own use of Morse–Bott is consistent with "nothing beyond the abstract theorem" | `MorseTheory/README.md:144` (M2), `:857` (M5); R3.4 `README.md:1008–1009` applies "MorseTheory M5's finite-dimensional Morse–Bott attachments" on `(TS^(n−1))^(⊕2k)`, `:1027` "next M5 negative-bundle attachment"; HomotopySpheres grep = 0 |
| `README.md:923` (GeometricTopology fragment) | heading text on main → generated anchor; explicit anchors; other citers; state at the two open revisions | main `GeometricTopology/README.md:930` "(far horizon)" → `-far-horizon`; `<a id=` count 0; GeneralizedCohomology `README.md:1392` on main still uses the short dead fragment (its own matter); #903 `:558–561` → Layer 11.3, #1797 `:3115–3121` → Layer 12.1, both record the mapping |
| `README.md:1050–1051` (stable homotopy) | no remaining stable-homotopy claim; the Freudenthal statement stays unstable | mentions at `:283` and `:1050` only; both describe the suspension-map comparison `π_q(S^(n−1)) → π_(q+1)(Sⁿ)` for the Morse range |

### Seeded sample (the texts at their locators)

The sampled targets (1.1, 1.2, 1.3, 2.1, 2.2) are untouched by the change; the rows are carried from the previous review, and I re-read the three cached locators this round: `andrews-dg-ch16 line 104–121` (page 154, Proposition 16.2.1, the curvature tensor determined by sectional curvatures, polarization over `(e_i+e_k)∧(e_j+e_l)`), `nicolaescu-lectures line 6769–6775` (page 151, Definition 4.1.23, injectivity radius as the supremum radius of diffeomorphic normal balls and its infimum), `line 6793–6797` (Proposition 4.1.25, `g_ij(q)=δ_ij` and vanishing first derivatives in normal coordinates), `brewin-rnc line 360–363` (page 9, metric expansion with `−⅓x^c x^d R_acbd − ⅙x^c x^d x^e ∂_c R_adbe`) and `line 612–615` (page 15, equation (11.1), the same two leading terms with the covariant derivative). Each says what the previous review recorded.

| Target | Locator | Outcome |
|---|---|---|
| 1.1 item 2 (polarization) | Andrews, Lecture 16, Prop. 16.2.1, p. 154 | supports the statement as written (re-read) |
| 1.2 (local symmetry, Einstein factor) | derived from 1.1 item 2 and SBC B5.0 | internally consistent; values in the table below (r15) |
| 1.3 (O'Neill formulas, projective examples) | O'Neill 1966, Thm 2 and Cor. 1 | settled uncertified key; see Not verifiable |
| 2.1 (Jacobi fields, initial data) | Milnor, §14, p. 77; Lemma 14.4, pp. 80–81 | settled uncertified key; see Not verifiable |
| 2.2 (normal-coordinate jets) | Nicolaescu, Prop. 4.1.25, p. 151; Brewin §5 p. 9, (11.1) p. 15 | supports the first-order statement and the quadratic and cubic jets (re-read) |
| R4.6 (injectivity radius) | Nicolaescu, Def. 4.1.23, p. 151 | supports the definition (re-read) |
| R4.4, R4.5 | Nicolaescu, Thm 6.2.6 p. 238; Thm 5.2.26 p. 220; Ex. 6.2.29 p. 243 | as in r15 |

### Adversarial table

Rows for the untouched statements are carried from the previous review (r15), which computed them at the same Lean text; the three changed passages are prose scope statements with no new formula, and their checks are in the table above.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| 1.1/`constant_sectional_tensor_iff` (r15) | unit Sⁿ, κ=1; ℝⁿ, κ=0; n=1 | `κ(⟨Z,Y⟩X−⟨Z,X⟩Y)` on `X=e₁,Y=Z=e₂` gives `e₁`, `⟨R(e₁,e₂)e₂,e₁⟩=1=K`; flat: both 0; n=1 vacuous on both sides, README excludes n<2 | correct |
| 1.2 Check `K=−2−4x²` (r15) | `g=dx²+e^(2x²)dy²` | `f=e^(x²)`, `f″=(2+4x²)e^(x²)`, `K=−f″/f`; `∂_xK=−8x`, at x=1: −8 | correct |
| 1.2/`einstein_factor_constant` (r15) | unit S³, radius-2 S³, their union; dimension 2 | factors 2 and 1/2; the union needs `[ConnectedSpace M]`; dimension 2 has `Ric=Kg` with K nonconstant, so `3 ≤ finrank` is needed | correct |
| 1.3 conformal change (r15) | `Ric̃`, `Scal̃` with `Δ⁺=−tr Hess` | standard formulas under `Δ=−Δ⁺` | correct |
| 1.3 bi-invariant metric (r15) | `∇_XY=½[X,Y]` | `R(X,Y)Z=−¼[[X,Y],Z]` by Jacobi | correct |
| 1.3 T-tensor and h/v Checks (r15) | `dx²+e^(2x)dy²`, `e^(4x)`; `x=log 2` | `T_UU=−∂x`, norm 1; `−2∂x`, norm 2; `|∂y|=2` | correct |
| 1.3 Hopf Check, curvature range, normalizations, CP¹ (r15) | S³→CP¹; S^(2d+1)→CP^d; `X=[[0,−1],[1,0]]`, `diag(0,i)`; radius ½ | `K_B=1+3·1=4`; `K∈[1,4]`; `−tr/2=1`, `½`; curvature 4, area π | correct |
| 2.1 Checks (r15) | flat `u+tv`; sphere `sin t·E`; flat `t²E` | residuals 0, 0, `2E≠0` | correct |
| 2.2 sphere Check and jet (r15) | unit S², `t=π/2`; `sin²t` | `sin t/t=2/π`; `t²−t⁴/3` against `t²−⅓Kt⁴`, K=1 | correct |
| R3, R3.1, R3.2 Checks (r15) | `sin(πt)E`; `γ=t`, `t²`; vertices 0,½,1 | `π²/2`; `(π²/L−L)/2`: 0, `−5π/12`; energies ½, ⅔; broken energy ½ vs ¼ | correct |
| R3.3a/R3.4 indices (r15) | great-circle arcs on Sⁿ | indices `2k(n−1)`, `(2k+1)(n−1)`; antipodal nullity `n−1` | correct |
| `modelSine`, R4.1, `rauch_norm_ge_of_sectional_le` (r15) | κ=1,0,−1 at π/2; κ=4; radius 5/2; X≡0 | 1, π/2, 2.3013; first zero π/2; `J(5π/2)=0<1` so the guard `b<π/√κ` is needed; both sides 0 | correct |
| `modelBallVolume`, `bishopGromov` (r15) | n=2 κ=0,1; n=3; n=0,1; S²; H² | `r²/2`, `1−cos r`, `r³/3`, `r`; S² ratio `2π`; flat normalization 2.888, 2.224, 1.273; H² 3.412, 4.339 increasing, so Ricci needed | correct |
| `cartanHadamard_isCoveringMap` (r15) | ℝⁿ; flat torus; S² | identity; quotient covering; S² excluded by hK | correct |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` (r15) | unit Sⁿ; RPⁿ; ℝⁿ | bound π, sharp; π₁=ℤ/2; Ric=0 excluded | correct |
| `synge`, `synge_orientable_of_odd` (r15) | RP², T², RP³, point | excluded by orientability; by strict positivity; consistent; simply connected | correct |
| `killingHopf_*` (r15) | n=0,1 | the line needs `2 ≤ n` for the sphere case; `UpperHalfSpace(ℝ⁰)` is `(0,∞)` with `dt²/t²` | correct |
| `two_distinct_geodesics`, `three_simple_closed_geodesics` (r15) | line; S¹; round S²; constant curves | compactness needed; two arcs differ at t=½; three great circles, `T>0` with `InjOn (Ico 0 T)` excludes constants | correct |
| R4.6 Checks (r15) | ℝⁿ, S¹, Sⁿ, 4·Sⁿ, T², S² | inj ∞, π, π, 2π; cut locus length 2 area 0; critical values of `exp_p` at |v|=π, 2π are `−p`, `p`, kernel dimension `n−1` | correct |
| R5a.2, R5a.3, `paraboloid_*` (r15) | `z=r²`; helicoid; sphere; cylinder; `r²θ′=a` | `K=4/(1+4r²)²`, `H=(2+4r²)/(1+4r²)^(3/2)`; `r″(0)=1/(a(1+4a²))`, a=1: 1/5; `T_a ≥ R²−a²`, `A_a ≥ 2a log(R/a)`; circle r≡1 residual −1/5≠0; vertex: no conjugate point, curvature-4 sphere vanishes at π/2 | correct |
| R6 Checks (r15) | unit circle, inward normal | `Hess h=2(1−t)`: 1, 0, −2 with (index, nullity) (0,0), (0,1), (1,0); `I_M(X,X)=1/b−1` | correct |
| R7.0, R7.3, R7.4 (r15) | circle of length L; n=1; `D=∂`, `d`, `∂+i`; degree p | `λ₁=(2π/L)²`; `n≥2` needed; symbol 4 at 2; `D*D=−∂²−2i∂+1`; `Σa_i*a_i=p`, `C(p,2)`, `ℛ₁=Ric` | correct |
| `polynomialLaplacian`, `squaredRadius`, `fischer_*` (r15) | 3 and 2 variables; `r⁴`; `X₁²−X₂²`; n=1; n=0,d=0 | `Δr²=6`, `Δ(X₁²−X₂²)=0`, `ΔX₁⁴=12X₁²`; `Δr⁴=20r²`, iterated `h₂=1`; n=0,d=0 uniqueness fails so `2 ≤ n` needed | correct |
| R8 dimensions, R8.4, R4.9 Checks (r15) | S², d=0,1,2; `F=√(mVol/(λN))(f_i)`; colatitude π/6, cap, barrier | `2d+1`: 1, 3, 5; eigenvalues 0, 2, 6; `|F|²=m/λ`; `L=π`, cap `2π(1−cos r)`, extinction `−log cos a` | correct |
| `README.md:269–273` (new) | the scope sentence against R3.4's actual consumption | R3.4 consumes M5 at `:1008`, `:1027`; nothing else from any Bott-chain source; HomotopySpheres occurrences 0 | consistent |
| `README.md:923` (new) | heading text → anchor slug | "The smoothing-and-triangulation comparison (far horizon)" → `the-smoothing-and-triangulation-comparison-far-horizon`; explicit anchors 0 | resolves on main |
| `README.md:1050–1051` (new) | remaining stable claims | 0 beyond the unstable Freudenthal range at `:283`, `:1050` | consistent |

### Pinned declarations, ownership and overlaps

- The Lean file is unchanged since the previous review; its library names were checked at the branch pin there (every name present except `TauCeti.IsNullSet` and `TauCeti.isNullSet_image_criticalPoints`, which exist only at main's pin `2fd255d9` and are used only in README prose; the pin lag the previous rounds recorded, not a finding). The previous review's record of what main's Tau Ceti pin already states (`TauCeti.IsJacobiFieldOn`, `jacobiFieldSpace`, `conjugateMultiplicity`, `MvPolynomial.laplacian`, `normSq` and the Fischer decomposition theorems) stands: not a finding under the branch pin, a P2 duplication repair the moment the manifest advances.
- Cross-roadmap citations in the changed passages: MorseTheory M2 and M5 on main (`TauCetiRoadmap/MorseTheory/README.md:144`, `:857`); GeometricTopology's section on main (`:930`). The citations tool found no unresolved citation or Lean name (`scratch/citations.md`). `*Needs:*` lines are untouched; the dependency check confirms no later roadmap is cited.
- Overlaps (`scratch/overlaps.md`): the one dropped id is the GeometricTopology fragment, dropped by two revisions that each record its new home (R02 above, not a finding); no id this pull request drops is cited elsewhere (the Surfaces sub-roadmap of #1974 cites four anchors into this README, all of which resolve at this head); no id depends on an open revision; three conflicting heads are R01. Ownership against the open roadmap closest in vocabulary and new since the previous review, #1974's Surfaces (read through the roadmaps tool): its S3 takes Gauss–Bonnet for disks and annuli and the signed turning theorem, which main's R4.9 (kept verbatim here at `README.md:1532–1545`) builds on the round sphere; #1974 itself edits R4.9 to consume S3, so the hand-over is that pull request's change to this roadmap, resolved by the order R01 asks for and not restated here. The other close roadmaps (RicciFlow #1023, PositiveMass #956, DGFloer #963) are consumers named in the scope. Ownership against ManifoldOptimization #1506 and against #1187 was not checked (no checkout given).

## Not verifiable

- **O'Neill 1966**, **Milnor, Morse Theory**, **Fulton–Harris**, **Lee, Introduction to Riemannian Manifolds**: settled uncertified keys, cited by locator only (1.3 and 2.1 of the sample rest on O'Neill and Milnor).
- **Homma**, **Axler–Bourdon–Ramey**, **Azagra–Ferrera–López-Mesas–Rangel**, **Lauer**, **Toth–Ziller**, **Allen–Layne–Tsukahara**, **Dobbins**: outside the sample and the changed passages, not in the sources cache; not fetched (a review edits no manifest).
- The head of **#1187** is not among the checkouts given; #1327 and #1974 were read through the roadmaps tool.

## Source issues

- none
