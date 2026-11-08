# Review of RiemannianGeometry (pull request #1683 at 470e031)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/RiemannianGeometry/README.md` (2695 lines) and `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` (485 lines, 29 declarations, 23 of them admitted). The head is the one the previous review read, and nothing in the folder or outside it has changed since. The gate passes at this branch's pins. The finding that blocks is one no earlier round checked: the head no longer merges into main. Main bumped its pins on 2026-11-05 (#1800) and edited this roadmap's `Suggested.lean`. Once rebased, the file cannot build: three of its nine Tau Ceti imports do not exist at main's pin. At that pin Tau Ceti also proves six of its admitted theorems and states three of its definitions (R01). There are two P3 findings: about 57 README lines break the house style for mathematics (R02), and nine headline theorems and two of the sampled sections have no locator at the claim (R03). The previous review's only finding is settled by the repair report's reason and is not raised again.

## R01 (P1) — The head conflicts with main, and at main's pins `Suggested.lean` does not build and restates Tau Ceti

**Location.** `TauCetiRoadmap/RiemannianGeometry/Suggested.lean:3–12` (the nine `public import TauCeti.*` lines) and its docstring `:37–46`; `README.md:37–39`, "chartwise null sets and Sard's theorem in equal dimensions are already in Tau Ceti", and the Tau Ceti contract `:111–131`.

**Claim.** This branch forked from main at `a0ad405` and pins Tau Ceti `358314d4` and Mathlib `f6090c70` in `lake-manifest.json`. Main's #1800 (commit `a891cd19`, "bump the Tau Ceti pin to 2fd255d99 … and adapt the roadmap files") moved main to Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b` (Lean v4.36.0-rc2). It also changed this roadmap's `Suggested.lean`, replacing the import of `SmoothEmbedding.NormalSpace` with `SmoothEmbedding.NormalSpace.Basic`. This head rewrote the same import block, so the two conflict. The pull request does not touch the manifest, so the merged file is built at main's pins. Three of its imports do not exist there, so the file fails before any statement is read.

The folder is consistent with neither pin:
- The README's Tau Ceti contract cites `TauCeti.IsNullSet` (`TauCeti/Geometry/Manifold/Measure.lean`) and `TauCeti.isNullSet_image_criticalPoints` (`Sard/EqualDimension.lean`). R4.6 and R6 rest on both. Neither file exists at the branch pin; both exist at main's.
- The same contract cites `TauCeti/Geometry/Manifold/SmoothEmbedding/NormalSpace.lean` (`:113`), and R4.7 cites `Hyperbolic/UpperHalfSpace.lean` (`:1293`). Both exist at the branch pin and are gone at main's.

At main's pin, Tau Ceti also proves much of what `Suggested.lean` admits, so after the rebase these declarations are duplicates or one-`exact` padding:
- **Jacobi fields.** `TauCeti.Manifold.IsJacobiFieldOn` (`Riemannian/Jacobi/Basic.lean:59`) is a structure with exactly the three conjuncts of this file's `IsJacobiFieldOn` (`:104–113`). `IsJacobiFieldOn.eq_of_eq_of_alongCurveWithin_eq` (`Jacobi/Uniqueness.lean:161`) proves `jacobi_eq_of_initial_data`. `IsJacobiFieldOn.eq_zero_of_endpoints_eq_zero_of_sectionalCurvature_nonpos` (`Jacobi/Convexity.lean:176`) proves `jacobi_eq_zero_of_nonpositive_curvature`.
- **R1.** `CovariantDerivative.hasConstantSectionalCurvature_iff_isConstantCurvatureTensor` (`Curvature/Polarization.lean:147`) proves `constant_sectional_tensor_iff`, and `CovariantDerivative.eq_of_forall_hasSectionalCurvatureAt` (`Curvature/Schur.lean:197`, conclusion `κ x = κ y`) proves `schur`.
- **Fischer decomposition.** `MvPolynomial.laplacian` and `MvPolynomial.normSq` (`RingTheory/MvPolynomial/Harmonic.lean:85`, `:131`) are this file's `polynomialLaplacian` and `squaredRadius`. `harmonicSubmodule_sup_map_mulLeft_normSq` (`:310`), `disjoint_ker_laplacian_map_mulLeft_normSq` (`:300`) and `homogeneousSubmodule_eq_iSup_map_mulLeft_normSq_pow` (`:327`) give `fischer_split` and `fischer_decomposition`. They hold over any characteristic-zero field with a nonempty set of variables, so they include n = 1, which this file's `2 ≤ n` excludes. For n = 1 the split holds: `p = cX^(d+2)` has the unique quotient `q = cX^d`.
- **Docstring.** The docstring (`:37–46`) says conjugate-point multiplicity and a Laplacian on functions have no carrier. Main's pin has both: `conjugateMultiplicity` (`Jacobi/Conjugate.lean:171`) and `TauCeti.Manifold.laplaceBeltrami` (`Riemannian/Laplacian.lean:238`).
- **R7.0.** Its scalar Bochner identity, in exactly the README's Δ⁺ convention, is `laplaceBeltrami_norm_sq_mgradient` (`Riemannian/Bochner.lean:171`). Its Lichnerowicz bound is `finrank_mul_le_of_laplaceBeltrami_eq_neg_mul` (`Riemannian/Lichnerowicz.lean:82`). At the branch pin R7.0 is not statable, yet the docstring does not name it.

**Witness.** `git merge-tree --write-tree origin/main HEAD` prints "CONFLICT (content): Merge conflict in TauCetiRoadmap/RiemannianGeometry/Suggested.lean". Tau Ceti `2fd255d9` has no `Riemannian/Sphere.lean`, `Riemannian/Hyperbolic/UpperHalfSpace.lean` or `Manifold/Orientation.lean` (now `Sphere/Basic.lean`, `UpperHalfSpace/Basic.lean`, `Orientation/Basic.lean`).

**Repair.** In order:
1. Merge main into the branch, keeping this head's import block. #1800's change to this file is only the import line, and this head no longer imports that module.
2. At the new pins, replace three imports: `TauCeti.Geometry.Manifold.Riemannian.Sphere` → `…Riemannian.Sphere.Basic` (declares `instRiemannianBundleSphere`), `…Riemannian.Hyperbolic.UpperHalfSpace` → `…Hyperbolic.UpperHalfSpace.Basic` (declares `UpperHalfSpace`), `TauCeti.Geometry.Manifold.Orientation` → `…Orientation.Basic` (declares `Orientable`). I checked that each replacement module exists at `2fd255d9` with the declaration named. I also checked that every other Tau Ceti name the file uses (`IsGeodesicCurveOn`, `curveVelocityWithin`, `riemannianExp`, `riemannianVolume`, `RiemannianIsometry`, `alongCurveWithin`, `curvatureTensor`, `ricciTensor`, `HasConstantSectionalCurvature`, `IsConstantCurvatureTensor`) is declared there.
3. Delete what the library now has and cite it:
   - Delete `IsJacobiFieldOn`, `jacobi_eq_of_initial_data`, `jacobi_eq_zero_of_nonpositive_curvature`, `constant_sectional_tensor_iff`, `schur`, `polynomialLaplacian`, `squaredRadius`, `fischer_split` and `fischer_decomposition`.
   - State `exists_jacobi_initial_data` and `rauch_norm_ge_of_sectional_le` on `TauCeti.Manifold.IsJacobiFieldOn`. Main's pin has no existence theorem for prescribed initial data, so `exists_jacobi_initial_data` stays.
   - Cite the declarations above in the README's Tau Ceti contract and in R1 item 2–3, R2.1 and R8.1. Keep in R8.1 only what goes beyond them: the spherical restriction, its eigenvalue and the dimension formula.
   - In R7.0, cite the Bochner and Lichnerowicz theorems instead of owning them.
4. Correct the docstring's not-statable list for the new pin: drop the conjugate-multiplicity and sphere-Laplacian clauses, and recheck Takahashi (R8.4) and R7.6–R7.7 against `laplaceBeltrami`, `HodgeStar` and the de Rham files now present.
5. Update the two contract paths (`SmoothEmbedding/NormalSpace/Basic.lean`; `Hyperbolic/UpperHalfSpace/Basic.lean`).
6. Re-run the gate and the targeted build at the new pins.

I could not elaborate the file at `2fd255d9` from this job, whose Lean commands are limited to the branch's own environment. Step 6 is therefore the test.

## R02 (P3) — ASCII mathematics, run-together tokens and all-caps emphasis outside code spans

**Location.** `README.md:979`, "every cellular boundary is0. Hence integral H_i is Z in multiples of n-1 and0 otherwise. … There is no1-cell … The n2 Hopf bridge and n1 winding are distinct consumers/branches". The same style recurs in:
- R3.3 (`:975–1001`), R4.1 (`:1121–1122`, `:1147`) and R4.3 (`:1176–1186`);
- the R4.7 real-projective block (`:1348–1354`);
- R4.9 (`:1390–1700`), R7.0 (`:2292–2296`), R8.1–R8.2 (`:2496–2512`, `:2544`) and the consumers paragraph (`:2631`).

**Claim.** The house style puts mathematics in Unicode, with ASCII only inside code spans. These passages instead write `theta∈(0,pi)`, `2*pi*k`, `S^n`, `n>=3`, `Omega S3`, `pi1(S3)`, `Z`, `sqrt(1+sum ratios²)` and `lambda1>=nk` in prose. Tokens are run together so they misread: "is0", "and0", "no1-cell", "one0-cell", "winding is±1", "period2*pi", "degree0 or±1", "value1", "to3π/4", "above2π".

Cross-references to R4.9's subsections have lost their prefix and space: "in6b" (`:1532`, `:1548`), "of6b" (`:1578`, `:1588`), "by6b" (`:1684`), "apply6a" (`:1690`), "in6c" (`:1678`). "The n2 Hopf bridge" means the n = 2 branch, and nothing in the text says so.

All-caps emphasis is not house style: "ACTUAL" (`:993`, `:1354`), "SAME" (`:1147`, `:1688`), "CALLER … AFTER" (`:1186`), "EXACTLY" (`:1484`), "ENTIRE" (`:2544`).

Lean names stand outside backticks, so the citations tool never checks them: "RealProjectiveSpace.fundamentalGroupMulEquivAt n hn x" and "TauCeti.RealProjectiveSpace n" (`:1348`, `:1354`), "chartedSpaceComap/IsLocalDiffeomorph" (`:1180`), "Nat.card=0" (`:1354`).

Display formulas sit in prose instead of code spans, for example `Delta_R=partial_r^2+(m/r)partial_r-r^(-2)Delta_S^+` (`:2496`). The reference list has run-together volume and page fields: "Izv. Math.40:3 (1993),565–590" and "Sup.23 (1990),229–256" (`:2673–2674`), and "Lemma2.2" (`:2681`).

**Witness.** A scan with code spans and links removed finds 57 such lines: 24 run-together number tokens, 16 ASCII comparisons, 25 ASCII Greek or operator names, 13 all-caps words (line numbers above).

**Repair.**
- Rewrite these paragraphs in Unicode: "n ≥ 3", "θ ∈ (0, π)", "θ + 2πk", "ΩS³", "π₁(S³) = 0", "ℤ", "H₀", "±1", "λ₁ ≥ nk".
- Separate the run-together tokens ("is 0", "no 1-cell", "the n = 2 Hopf bridge and the n = 1 winding branch", "in R4.9.6b", "by R4.9.6b", "apply R4.9.6a", "in R4.9.6c").
- Drop the capitals.
- Put the Lean names in backticks: `TauCeti.RealProjectiveSpace`, `RealProjectiveSpace.fundamentalGroupMulEquivAt`, `Projectivization`, `UniversalCover`, `chartedSpaceComap`, `IsLocalDiffeomorph`, `Nat.card`.
- Put the displayed formulas of R4.1's proof programme, R7.0 and R8.1 in code spans, and restore the spaces in the three references.

The same scan then reports 0 lines.

## R03 (P3) — Nine headline theorems, and sampled targets 1.1 item 3, 1.2 and 1.3, have no locator at the claim

**Location.** The claims without a locator:
- `README.md:321–331`, 1.1 item 3 (Schur's theorem, `schur`; the Einstein factor, `einstein_factor_constant`; local symmetry; flatness against local Euclidean isometry);
- `:332–342`, 1.2 (the parallel-transport and dimension-two characterizations);
- `:370–389`, 1.3 (the conformal-change laws and the bi-invariant formulas ∇_XY = ½[X,Y], R(X,Y)Z = −¼[[X,Y],Z]);
- `:602–603` (`jacobi_eq_zero_of_nonpositive_curvature`);
- `:1074–1079` (`rauch_norm_ge_of_sectional_le`) and `:1121` (`bishopGromov`);
- `:1242–1250` (`synge`, `synge_orientable_of_odd`);
- `:1324–1333` (`killingHopf_euclidean`, `killingHopf_sphere`, `killingHopf_hyperbolic`);
- `:1358–1360` (`two_distinct_geodesics`) and `:1390` (`three_simple_closed_geodesics`).

**Claim.** Every theorem needs its locator in parentheses at the claim. For these the only source pointers are chapter-level ("Lee … Chapter 11 for comparison and Chapter 12 for the local-to-global/space-form theorems", `:2640–2643`) or a reference-list entry (Taimanov, `:2673`). Two of the seeded targets, 1.1 item 3 and 1.2, can therefore not be checked at a locator at all.

**Witness.** `nicolaescu-lectures` line 8888–8890 (Exercise 4.2.38, printed p. 196) states that an Einstein manifold of dimension at least three has constant scalar curvature. `andrews-dg-ch16` line 429–436 (Corollary 16.8.5, p. 162) derives the bi-invariant connection and curvature.

**Repair.**
- At `:321–324`, cite Nicolaescu, Exercise 4.2.38, p. 196 for `einstein_factor_constant`. The factor is a = Scal/n by Nicolaescu's Example 4.2.36 (line 8870–8875), and the exercise gives constancy of Scal.
- At `:383–384`, cite Andrews, Corollary 16.8.5, p. 162 for ∇_XY = ½[X,Y]. Add that his curvature has the opposite sign (`andrews-dg-ch16` line 12, R(X,Y)Z = ∇_Y∇_X Z − …), so his R_ijkl = ¼c_ijp c_klp is −¼[[X,Y],Z] in this roadmap's convention.
- For `schur`, 1.2, the conformal laws, Rauch, Bishop–Gromov, Synge, Killing–Hopf and the two-geodesic theorem, add a theorem number and page at each claim from the text the author holds. Lee's settled uncertified key `lee-irm` may be cited by locator alone.
- For R4.9, cite Taimanov 1993 by theorem and page at `:1390`.

I checked both proposed locators against the cached texts.

## Previous findings

- R01 of the previous review (the description states no order between this head and #1327, #1187 and #1974) is not repaired: the description (`scratch/pull-request.md`) still names none of them. It is **settled**, so I do not raise it again. The repair report marked it not actionable in this package because a repair job cannot edit the pull-request description, and that reason holds. The order belongs in the description (the overlap rule says so), the description is not a file of this package, and the README may not carry pull-request numbers. Facts for the human who merges:
  - Every declaration of #1327's `Suggested.lean` at its head `5297709` is declared here under the same name (19 names, set difference empty).
  - #1974 at `c30b6b2` adds `RiemannianGeometry/Surfaces`. That sub-roadmap consumes R4.9.6a's smooth turning theorem and round-sphere disk and annulus identities, and owns only the corner extension, so the two heads do not both own an object.
  - #1187's pin `ab00ba392` is an ancestor of main's `2fd255d9`, so R01's merge of main supersedes it for this file.

## Verified sound

### Gate, direction, folder, elaboration

- **Gate.** The worker's gate at this head reports every counter zero, `build=0`, `OK`. My own run from the worktree reproduces every counter at zero; it prints no `build=` token. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RiemannianGeometry'` is empty. The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`, and the gate reports `stray-files=0`.
- **Dependency check.** It prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` at the branch pins exits 0. It gives exactly 23 `declaration uses 'sorry'` warnings, at lines 70, 79, 90, 117, 129, 142, 165, 188, 199, 234, 251, 261, 272, 282, 313, 323, 335, 363, 393, 414, 444, 469 and 478, and nothing else.
- **Signatures.** A scratch copy with `#check @` for all 29 declarations prints every type. Each matches its README statement:
  - `synge` keeps `[ConnectedSpace M] [CompactSpace M] [TauCeti.Orientable I ∞ M]`, `Even (finrank ℝ E)` and strict positivity on independent pairs.
  - `bishopGromov` keeps completeness, the Borel and second-countable instances, `IsContinuousRiemannianBundle`, the Ricci bound `(finrank − 1)κ‖v‖²`, `0 < r ≤ s` and the guard `0 < κ → s < π/√κ`.
  - The Killing–Hopf triple carries `[SimplyConnectedSpace M] [CompleteSpace M]` with `2 ≤ n` (sphere) and `1 ≤ n` (hyperbolic). The hyperbolic target is `𝓘(ℝ, WithLp 2 (ℝ^(n−1) × ℝ))`.
  - `IsJacobiFieldOn` keeps no `I.Boundaryless`, as the README says.
  - No `def` lost a binder its README statement needs.
- **Norm probe.** `rfl` cannot identify the tangent-space norm with the model norm, but proves it equal to `√(g(v,v))`. So `hspeed`, the Rauch norms and the Ricci bounds are Riemannian norms.
- **Form.** The file has one module docstring, `public import Mathlib` plus nine `TauCeti.*` modules present at the branch pin, no `set_option`, no `lemma` and no sorry'd data. Its six definitions have real bodies, and every declaration has a docstring.
- **Padding.** The one-tactic probe (`first | rfl | infer_instance | (simp; done) | (intros; simp_all; done)` in place of each `sorry`) closes none of the 23 at the branch pin. They are not padding there; at main's pin see R01.

### Seeded sample (texts read at their locators)

| Target | Locator | What the text says (`<source> line N`) | Outcome |
|---|---|---|---|
| 1.1 item 2 | Andrews, Prop. 16.2.1, p. 154 | the curvature tensor is determined by sectional curvatures, by polarization over `½(e_i±e_k)∧(e_j±e_l)` (`andrews-dg-ch16` line 104–130) | supports the statement; constant-curvature form follows (row below) |
| 1.1 item 3 | none | Einstein constancy is Nicolaescu Ex. 4.2.38, p. 196 (`nicolaescu-lectures` line 8888–8890) | R03 |
| 1.2 | none | — | R03 |
| 1.3 | O'Neill 1966, Thm 2 and Cor. 1 (uncertified, settled); conformal and bi-invariant: none | bi-invariant: Andrews Cor. 16.8.5, p. 162 (line 429–436), opposite R sign (line 12) | O'Neill not verifiable; R03 |
| 2.1 | Milnor §14, p. 77; Lemma 14.4, pp. 80–81 (uncertified, settled) | — | not verifiable; sign note "his R(γ′,X)γ′ is our R(X,γ′)γ′" agrees with Andrews' opposite convention |
| 2.2 | Nicolaescu Prop. 4.1.25, p. 151; Brewin §5, p. 9 and eq. (11.1), p. 15 | `g_ij(q)=δ_ij`, first derivatives 0 (`nicolaescu-lectures` line 6793–6795, page header line 6769); `g_ab=g_ab−⅓x^c x^d R_acbd−⅙x^c x^d x^e ∂_c R_adbe+O(ε⁴)` (`brewin-rnc` line 363, page 9) and the covariant form (line 614–615, page 15) | supports the first-order, quadratic and cubic jets as written |
| R4.6 (definition) | Nicolaescu Def. 4.1.23, p. 151 | the supremum radius with exp a diffeomorphism, and its infimum (line 6770–6775) | supports the definition |

### Adversarial table

Every row was computed this round.

| Statement | Instances | Values on the two sides | Result |
|---|---|---|---|
| `constant_sectional_tensor_iff` (1.1) | unit S², κ = 1; ℝⁿ, κ = 0; dimension 1 | `κ(⟨Z,Y⟩X−⟨Z,X⟩Y)` at X=e₁, Y=Z=e₂ is e₁, so ⟨R(e₁,e₂)e₂,e₁⟩ = 1 = K; flat: both 0; dim 1: LHS true for every κ (no planes), RHS `cb·aU − ca·bU = 0 = R` true for every κ | iff holds in all three |
| `schur`, `einstein_factor_constant` (1.1, 1.2) | unit S³ ⊔ radius-2 S³; g = dx²+e^(2x²)dy² | factors a = 2 and ½ (unequal, so connectedness needed); f = e^(x²), f″ = (2+4x²)e^(x²), K = −2−4x², ∂ₓK(1) = −8 (Ric = Kg nonconstant, so n ≥ 3 needed) | guards needed; a = Scal/n gives regularity |
| 1.3 conformal laws | constant u = log c; flat ℝ², n = 2 | Ric̃ = Ric, Scal̃ = c⁻²Scal; `2K̃ = e^(−2u)(0+2Δ⁺u)`, i.e. `K̃ dÃ = −Δu dx dy`, same as R4.9.6a's identity | consistent |
| 1.3 curvature from ∇̃ = ∇+A | expand ∇̃_X∇̃_Y Z | cross terms `A(Y,∇_XZ)+A(X,∇_YZ)` cancel, `A(∇_XY−∇_YX,Z)` cancels `A([X,Y],Z)` | displayed formula correct (torsion-free ∇) |
| 1.3 bi-invariant | Jacobi identity | `¼[X,[Y,Z]]−¼[Y,[X,Z]]−½[[X,Y],Z] = −¼[[X,Y],Z]`; ⟨R(X,Y)Y,X⟩ = ¼‖[X,Y]‖² ≥ 0 | correct |
| 1.3 O'Neill Checks | S³→CP¹; dx²+e^(2x)dy²; e^(4x); x = log 2 | ‖A_XY‖ = 1, K_B = 1+3 = 4; Γˣ_yy = −e^(2x), T_UU = −∂x (norm 1); −2∂x (norm 2); ‖∂y‖ = 2 | correct |
| 1.3 projective normalization | X = [[0,−1],[1,0]]; diag(0,i); great circle | −tr(X²)/2 = 1 = ‖Xe₂‖; ½ against 1; γ(t+π) = −γ(t); K = 1+3⟨X,JY⟩² ∈ [1,4]; CP¹ radius ½, area π | correct |
| `IsJacobiFieldOn` (2.1) | unit great circle, sin t·E; flat t²E; sign-flipped model with sinh t·E | residual −sin t+sin t = 0 (accepted); 2E ≠ 0 (rejected); a flipped curvature sign would accept sinh t·E and give −2 sin t·E for sin t·E, which the Check rejects | the definition determines its object |
| `jacobi_eq_of_initial_data`, `exists_jacobi_initial_data` | flat u+tv on [0,1]; a = b | data (u,v), residual 0; a < b excludes the one-point interval, where `UniqueDiffOn` fails | correct |
| `jacobi_eq_zero_of_nonpositive_curvature` | flat; unit sphere | u+tv vanishing at 0 and b forces u = v = 0; sin t·E on [0,π] vanishes at both ends with K = 1, excluded by hK | correct |
| 2.2 jets | unit S², t = π/2; sin²t; octant triangle | transported norm 1 against coordinate norm sin(π/2)/(π/2) = 2/π; t²−t⁴/3 against t²−⅓Kt⁴ at K = 1; holonomy π/2 = area | correct |
| `modelSine` (R4.1) | κ = 1, 0, −1 at π/2; κ = 4 | 1, 1.5708, 2.3013; sin(2t)/2 has first zero π/2 and s′(0) = 1 (sin(κt)/κ would give π/4) | correct |
| `rauch_norm_ge_of_sectional_le` | radius-5/2 sphere, κ = 1; hyperbolic plane, κ = −1, tangential J = t·γ′ | J = (5/2)sin(2t/5): at 5π/2, s₁ = 1 > 0 = ‖J‖ (guard b < π needed); at π/2, 1 ≤ 1.4695; tangential ‖J‖ = t < sinh t (normality hypothesis needed) | both guards needed; statement correct |
| `modelBallVolume` | n = 2, κ = 0, 1; n = 3; n = 1, 0 | r²/2; 1−cos r (2 at π); r³/3; r and r (ℕ subtraction 0−1 = 0) | correct; denominators > 0 for 0 < r < π/√κ |
| `bishopGromov` | unit S²; flat normalization; H²; circle of length L | ratio 2π constant; 2π(1−cos r)/r² = 2.888, 2.224, 1.273 at r = 1, 2, π; H² 3.412 at 1 and 4.339 at 2 (increasing, Ricci needed); ratio min(2, L/r) nonincreasing | correct |
| `cartanHadamard_isCoveringMap` (R4.4) | ℝⁿ; flat T²; S² | identity; quotient ℝ²→T²; K = 1 excluded | correct |
| `bonnetMyers_distance`, `myers_finite_fundamentalGroup` (R4.5) | unit Sⁿ, λ = n−1; RPⁿ; ℝⁿ | bound π√1 = π (sharp); π₁ = ℤ/2; Ric = 0 excluded by λ > 0; Nicolaescu's λ = (n−1)/r² matches | correct |
| `synge`, `synge_orientable_of_odd` (R4.6) | RP²; flat T²; RP³; S¹; point | excluded by orientability; by strict positivity; conclusion is orientable (true), not simply connected; hK vacuous, S¹ orientable; point simply connected | correct |
| R4.6 Checks | ℝⁿ; S¹; Sⁿ; 4·Sⁿ; T²; S² | inj ∞, π, π, 2π; cut locus two segments, length 2, area 0; critical values −p at |v| = π and p at 2π, kernel dimension 1 | correct |
| Killing–Hopf (R4.7) | n = 1; n = 0 | ℝ ≅ ((0,∞), dt²/t²) by t = eˢ (curvature hypothesis vacuous in dim 1); sphere case at n = 1 would make ℝ ≅ S¹ (false), hence 2 ≤ n; hyperbolic n = 0 gives a 1-dimensional target, hence 1 ≤ n | guards exact |
| `two_distinct_geodesics` (R4.8) | S¹, p = 0, q = π/2; ℝ | angles πt/2 and −3πt/2 differ at t = ½ (π/4 against −3π/4); the line has one geodesic, so compactness is needed | correct |
| `three_simple_closed_geodesics` (R4.9) | round S²; constant and doubled curves | three great circles with distinct images; T > 0 with `InjOn (Ico 0 T)` excludes constants and double traversals | correct |
| R4.9 Checks | colatitude-r circle; latitude π/6, s = 0.5; widths | d_V = r+2π sin r; cos d = ¾+¼cos 1 = 0.8851, d = 0.4848, defect 0.0152 > 0; round widths 2π, under 4g 4π; A′ = A−2π, A_ann(t) = eᵗA_ann(0); A(t) = 2π(1−e^(t−T)); chord ψ = (L/π)sin(πl/L) ≥ 2l/π | correct |
| `paraboloidGraph`, `paraboloid_geodesic_crossings`, `paraboloid_vertex_pole` (R5a.3) | a = 1; circle r ≡ 1; crossing determinant; vertex | from `(1+4r²)r′²+r²θ′² = 1`: r′² = (r²−a²)/(r²(1+4r²)); r″(0) = 1/5; radial equation `0 = rθ′² = 1` for r ≡ 1 (not a geodesic); T_a ≥ R²−a² and A_a ≥ 2a log(R/a), both 0 at R = a; A_a(R_n) = (n+1)π; det = 2ar′/R² > 0; F(1,0) = (1,0,1), radial ‖·‖² = 5, angular 1; K(0) = 4, r(ℓ) > 0 against sin(2ℓ)/2 vanishing at π/2 | correct |
| R5a Checks | sphere, cylinder, paraboloid vertex; n₁ = cos x e₃+sin x e₄; homothety | S_ν = −Id, H = −ν, radius-2 H = −ν/2; cylinder H = −ν/2; vertex H = 2ν, K = 4; ∂ₓn₁ = n₂, ∂ₓn₂ = −n₁; J_t = (1+t)^m, J′ = m, J″ = m(m−1) (2m without the root) | correct; Gauss, Codazzi and Ricci signs rederived under R(X,Y) = ∇_X∇_Y−∇_Y∇_X−∇_[X,Y] |
| R6 | unit circle, inward normal | I_M = 1/b−1 (b = 1 kernel field (1−t)(0,1)); Hess = 2(1−t): 1, 0, −2 at t = ½, 1, 2 | correct |
| R7.0, R7.3, R7.4 | Bochner with Δ = −Δ⁺; circle of length L; D = ∂+i; degree p | `Δ⁺|df|²+2|Hess|²+2Ric = 2⟨df,dΔ⁺f⟩`; λ₁ = (2π/L)²; D*D = −∂²−2i∂+1, remainder on x is x−2i; Σa_i*a_i = p, Σ_(i<j) = C(p,2) | correct |
| `riemannianDist_eq_sSup_smooth` (R7.8) | ℝ, x = 0, y = 1; x = y | smoothed clamp to [0,1] gives 1 = dist; set {0}, sSup 0; the set is bounded by dist, since each f is 1-Lipschitz | correct |
| `polynomialLaplacian`, `squaredRadius`, Fischer (R8.1) | n = 3; (1,2), (1,i); r⁴; n = 0, d = 0; n = 1 | Δr² = 6, ΔX₁⁴ = 12X₁², values 5 and 0; Δr⁴ = 20r², q = r², h = (0,0,1); n = 0: Δ ≡ 0, uniqueness fails; n = 1: q = cX^d unique (see R01) | correct; `2 ≤ n` stronger than needed |
| R8 dimensions and eigenmaps | S², d = 0, 1, 2; degree-one eigenmap; five-coordinate map | dims 1, 3, 5; eigenvalues 0, 2, 6; F = x, radius √(m/λ) = 1; at (1,0,0) the squared norm is ¾+¼ = 1, metric 3g, radius 1/√3 | correct |
| R3 index Checks | sin(πt)E; sphere L = π, 3π/2; antipodal (2k+1)π | π²/2; I = (π²/L−L)/2 is 0 and −5π/12; index 2k(n−1), nullity n−1; π_q iso for q ≤ 2n−4 | correct |
| R3.1, R3.2 | t; t²; triangular waves; vertices 0, ½, 1 | energy ½, length 1 (equality), H¹ norm √(4/3); 1 < 4/3; d_s-Cauchy with no limit; E_Δ = ½ (¼ without denominators) | correct |
| R01 imports | Tau Ceti `2fd255d9` | `Riemannian/Sphere.lean`, `Hyperbolic/UpperHalfSpace.lean` and `Manifold/Orientation.lean` are absent; `Sphere/Basic.lean`, `UpperHalfSpace/Basic.lean` and `Orientation/Basic.lean` are present | finding |

### Library declarations opened

- **Branch pin (Tau Ceti `358314d4`, Mathlib `f6090c70`).** Every Tau Ceti name in `Suggested.lean` resolves there (the build). The README's other names also resolve there:
  - `ricciTensor_eq_of_curvatureTensor_eq_smul_sub` (`Curvature/Ricci.lean`) and `scalarCurvature_eq_of_curvatureTensor_eq_smul_inner_sub` (`Curvature/Scalar.lean`);
  - `normalClassL` (`SmoothEmbedding/NormalSpace.lean`), `inducedRiemannianMetric_inner` (`Riemannian/Induced.lean`) and `completeSpace_ofRiemannianMetric_of_isPretransitive_isom` (`Riemannian/Homogeneous.lean`);
  - `riemannianVolume_apply_of_subset` (`VolumeDensity/Volume.lean`) and `chartRiemannianVolume_apply` (`VolumeDensity/Measure.lean:117`);
  - `manifoldMorseIndex` (`Morse/Index.lean`) and `exists_isTubularNeighborhood_normalBundle` (`TubularNeighborhood/Euclidean.lean`).

  The exceptions are `IsNullSet` and `isNullSet_image_criticalPoints` (R01). Neither pin's Tau Ceti nor this Mathlib has `IsJacobiField`, `modelSine`, `bishopGromov`, `killingHopf`, `cartanHadamard` or `harmonicSubmodule`, so there is no duplication at the branch pin.
- **Main's pin (Tau Ceti `2fd255d9`).** The declarations named in R01 are at the lines given. `Measure.lean:36` (`IsNullSet`) and `Sard/EqualDimension.lean` (`isNullSet_image_criticalPoints`) are present. `manifoldMorseIndex` stays at `Morse/Index.lean:79`.

### Cross-roadmap citations, ownership and overlaps

- **Citations.** The citations tool finds no unresolved citation or Lean name (run again this round). The `*Needs:*` lines and supplier entries name only roadmaps on main or earlier in the order, together with Mathlib and Tau Ceti (the dependency check).
- **Dropped id.** `scratch/overlaps.md` reports one: the GeometricTopology fragment `#the-smoothing-and-triangulation-comparison-far-horizon` (`README.md:923`), which #903 and #1797 no longer define. Both are revisions of an existing roadmap, so neither is a dependency, and the citation reads main, where the heading exists. #903's head records the old → new map for this exact fragment: item 1 → Layer 11.3 (`TauCetiRoadmap/GeometricTopology/README.md:540–543` at its head). #1797's head was not given. This is not a finding.
- **Other overlap leads.** No id this pull request drops is cited elsewhere, and no citation depends on an open revision.
- **Ownership against #1974.** I read #1974's Surfaces scope at `c30b6b2`. It defers the cut-truncated polar domain to R4.1/R4.6 and the curvature laws to R1, and takes the smooth turning theorem from R4.9.6a. Its four anchors into this README resolve at this head: `#r1-…`, `#r4-…`, `#r6-…` and `#r496a-length-controlled-parametric-regularization`.
- **Other close roadmaps.** RicciFlow, PositiveMass and DGFloer are named consumers or owners in the scope section, and the boundaries there agree with this README (PositiveMass §2.3 consumes R4.1's equality API; DGFloer consumes R2–R3).

## Not verifiable

- **Settled uncertified keys.** O'Neill 1966, Milnor's *Morse Theory*, Lee's *Introduction to Riemannian Manifolds* and Fulton–Harris are cited by locator only. The sampled 1.3 (O'Neill) and 2.1 (Milnor) rest on them.
- **Texts outside the sample.** Homma, Axler–Bourdon–Ramey, Azagra–Ferrera–López-Mesas–Rangel, Toth–Ziller, Taimanov, Gage, Ma, Lauer, Grayson, Angenent, White, Allen–Layne–Tsukahara and Dobbins are not in the sources cache, and this review fetches nothing. Their locators were not re-read.
- **Main's pin.** I could not elaborate `Suggested.lean` there (the Lean commands of this job are limited to the worktree's pins). R01 rests on the file listing at that pin, not on a build.
- **Newer main.** The citations index reports main at `94294cd`, newer than the checkout's `12ed9bd`. I could not read it; R01's conflict is stated against `12ed9bd`.
- **Unread heads.** The heads of #1797 and #1187 were not given.

## Source issues

- **Misprint** in andrews-dg-ch16 at §16.1, definition of the curvature tensor, p. 151: the source says the middle term of R(X,Y)Z is ∇_Y applied to ∇_Y Z; it should be ∇_X applied to ∇_Y Z, as the tensoriality proof uses; affects nothing.
- **Misprint** in andrews-dg-ch16 at Proposition 16.1.1, proof, p. 151: the source says the bracket term is −∇ along [X,Y], leaving coefficient YX(f) − XY(f) − [X,Y](f), which is −2[X,Y](f); it should be −∇ along [Y,X], as defined, giving coefficient 0; affects nothing.
