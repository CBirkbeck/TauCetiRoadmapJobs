# Review of NewtonAndQuasiNewtonMethods (pull request #2573 at f09f9ba)

**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the Examples paragraph of Layer 1 says a positive definite Hessian on a real Hilbert space is invertible, which fails in infinite dimensions. Every stated theorem, definition and Check was recomputed and agrees with its source and with the Lean file; no statement needs to change. There are five small corrections and one format note, none blocking. Two points are left for the human reviewers (the preprint numbering used for Layers 1 and 2).

## R01 (P2) — A positive definite Hessian on a real Hilbert space need not be invertible, so the minimization example of Layer 1 is false as written

The Examples paragraph of Layer 1 (line 192) says: "at a critical point `x⋆` with positive definite, hence invertible, Hessian, 1.3 applies with `A` the Hessian at `x⋆`". A reader who takes this as the bridge from 1.3 to minimization is told that strict positivity of the Hessian form is enough, and it is not.

On `ℓ²` take `φ(x) = ½ Σ xₙ²/n`. Then `∇φ(x) = (xₙ/n)`, the Hessian is `H = diag(1/n)` at every point, and `⟨Hv, v⟩ = Σ vₙ²/n > 0` for `v ≠ 0`; but `H` is not surjective (`(1/n)` is not in its range), so it is not a continuous linear equivalence, 1.3 has no `A`, and by 1.1 the Newton map of `∇φ` is the identity everywhere. The same sentence also says "1.3 applies" without the radial Lipschitz condition of 1.3 on the Hessian, which a twice differentiable `φ` need not satisfy.

The smallest repair is in that sentence: either "on a finite-dimensional real Hilbert space", or "with coercive Hessian (`⟨Hv, v⟩ ≥ c‖v‖²` for some `c > 0`), hence invertible", and "1.3 applies … when the Hessian satisfies the radial condition of 1.3".

## C01 — The Lipschitz hypothesis of 2.1 and 2.2 constrains `f'` at boundary points of `C`, where nothing ties `f'` to `f`

In 2.1 (line 217) and in `hLip` of `newtonKantorovich` and `newtonKantorovich_quadratic` (Suggested.lean lines 103 and 121) the condition `‖A⁻¹(f' y − f' x)‖ ≤ L‖x − y‖` is asked for all `x, y ∈ C`, while `f' x` is the derivative of `f` only for `x` interior to `C` (line 214, `hf`). The statements are true, but a user whose `f` is differentiable only inside a closed ball must first invent values of `f'` on the sphere that keep the bound. Ferreira–Svaiter's hypothesis 2 has the same wording (FerreiraSvaiter line 55) with `F'` defined only on `int(C)`, and their proof evaluates `F'` only at interior points (Propositions 5 and 6, FerreiraSvaiter lines 206–239). Would quantifying `hLip` over `interior C`, in the README and in both Lean statements, be acceptable? Otherwise a clause that `f'` on `C` minus its interior is any extension satisfying the bound would do.

## C02 — The symmetry of `B` in 3.3 is not used by either inverse formula

`inv_bfgsUpdate` and `inv_dfpUpdate` assume `B.IsSymm`. Multiplying out, `sᵀ·bfgsUpdate B s y = yᵀ` holds for every square `B` with `sᵀy ≠ 0` and `sᵀBs ≠ 0` (the row `sᵀB` in the rank-one term makes it so), and that is the only place the product `bfgsInvUpdate B⁻¹ s y · bfgsUpdate B s y = I` could need symmetry; the DFP formula is the same identity with `(B, s, y)` replaced by `(B⁻¹, y, s)`. In exact rational arithmetic both formulas held on 241 of 241 random non-symmetric invertible `B` of sizes 1 to 4 satisfying the stated non-vanishing conditions. The hypothesis is Dennis–Moré's, so keeping it is defensible; if it stays, the sentence "at the generality of Dennis–Moré" could say that symmetry is not needed, and if it goes, the route's "`U C Uᵀ`" becomes "`U C Vᵀ`".

## C03 — The summary's "after exactly `n` steps the matrix is the inverse Hessian" reads as unconditional

In the third headline of the summary (lines 29–30) the clause can be read as `H_n = A⁻¹` always. The first Check of 5.2 (`A = diag(1, 3)`, `b = (1, 0)`, `H₀ = I`) has `x₁ = A⁻¹b` and `H_k = I ≠ A⁻¹` for every `k`, which I recomputed. Section 5.2 and `quadraticSeq_terminates` state the condition correctly. Suggested wording: "and if the minimizer is not reached before step `n`, the matrix after `n` steps is the inverse Hessian".

## C04 — `fderiv`, `HasFDerivAt` and `HasFDerivWithinAt` are not in the file the supplier contract names

"From Mathlib" (line 607) places the three definitions in `Mathlib/Analysis/Calculus/FDeriv/Basic.lean`. At the pin `HasFDerivWithinAt` and `HasFDerivAt` are defined in `Mathlib/Analysis/Calculus/FDeriv/Defs.lean` (lines 117 and 123), with `fderiv`; only `HasFDerivAt.fderiv` is in `Basic.lean` (line 415). Name `Defs.lean` for the definitions.

## C05 — The description does not mention the two open roadmaps the README now names

The description says "No roadmap on main states any of these targets and none is a supplier", which is true, but the head's Scope section also has a paragraph on FirstOrderOptimization 1.1 and SpectralSteepestDescent 5.1, which state scalar forms of the estimate of 1.2. A sentence such as "Two open roadmaps, FirstOrderOptimization 1.1 and SpectralSteepestDescent 5.1, state scalar forms of the remainder estimate of 1.2; this roadmap states the form for maps into a normed space and depends on neither" would bring the description up to the head.

## N01 — Name the open roadmap that plans Newton's method on manifolds

"Not treated here: … Newton's method on Riemannian manifolds" (line 595) could name ManifoldOptimization O5.2, an open roadmap that states it (its own `newtonSeq`, in its own namespace), as the Scope section already does for the two scalar remainder estimates.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Newton map and sequence | `x² − 2` from 2; `x²`; identity map at 3 (elaborated); polynomial with `P'(x) = 0` | `2, 3/2, 17/12, 577/408`; `x/2` and fixed 0; `newtonMap id 3 = 0` by `simp`; Mathlib's `Ring.inverse 0 = 0` fixes `x` too | holds | none |
| 1.2 Quadratic remainder | `g = Lx²/2`; affine; `L < 0`; trivial `E` | remainder `L(y−x)²/2` exactly; `0`; `L < 0` forces `S` subsingleton, `0 ≤ 0` | holds; no completeness needed | none |
| 1.3 Local quadratic convergence | `x − (K/2)x|x|`; `x² − 2` at `√2`; `x₀ = x⋆` | step `= K e²/(2(1−Ke))` exactly; 2-cycle at `±2/(3K)`; errors `.5858, .08579, .002453, 2.124e-6` under bounds `.2071, .00277, 2.131e-6` | holds, radius sharp | none |
| 1.4 Uniqueness | `x − (K/2)x|x|` | `f(±2/K) = 0`; integral bound gives `‖e‖ ≤ K‖e‖²/2`, so `e = 0` or `‖e‖ ≥ 2/K` | holds, radius sharp | none |
| 2.1 Kantorovich radius and theorem | majorant `L=1, b=½`; `b=.6`; `b=0`; map on `ℝ²` with sup norm | radii both 1 (Lean `simp`), halving exact; iterates `.6, 1.05, −.975, .0631`; empty ball at `b=0`; `b=.1, L=2, t⋆=.1127`, zero residual `2e-5` | holds | C01 |
| 2.2 Quadratic rate | `L=1, b=.4` | `t⋆=.552786`, `t⋆⋆=1.447214`, constant `1.118034`; errors `.1528, .01945, .000406` under `.3417, .0261, .000423` | holds | C01 |
| 3.1 Updates, secant equations | `B=I, s=(1,0), y=(2,1)`; `s=0`; `B=[[0,1],[1,0]]` | BFGS `[[2,1],[1,3/2]]` (also elaborated), DFP `[[2,1],[1,7/4]]`; duality literal; `[[1,2],[2,1]]s = (1,2) ≠ y` | holds | none |
| 3.2 Positive definiteness | `diag(2,1)` with `sᵀy = 0` and `−1` | BFGS `diag(0,1)`, DFP `diag(2,1)`; both `diag(−1,1)`; `xᵀDx = zᵀBz + ρ(yᵀx)²` zero only at `x=0` | holds both directions | none |
| 3.3 Inverses | `B=I`; `sᵀBs=0` example; 241 random non-symmetric `B` | `[[3/4,−1/2],[−1/2,1]]`, `[[.7,−.4],[−.4,.8]]`; `diag(1,0)` singular; 241/241 hold | holds; symmetry unused | C02 |
| 3.4 Least change | `W=I`; `s=0`; 200 random `(W,B,s)`; indefinite `M=diag(2,−1,1)` | `1` vs `1+c²`; `D=B`; strict increase on every nonzero feasible `Z`; objective `1, 0, −3` at `t=0,1,2` | holds | none |
| 4.1 Dennis–Moré | `x+x²` with `B_k=2`; Newton; `s_k=0` junk case | ratios `.25, .4375, .4727`, quotient `1`; quotient `≤ ‖f'(x_k)−f'(x⋆)‖`; `s_k=0` forces constant sequence | holds both directions | none |
| 5.1 Broyden class, step | `A=diag(1,2), b=(1,1)`; start at minimizer | `x₁=(2/3,2/3)`; `H₁` BFGS `[[11/9,−1/9],[−1/9,5/9]]`, DFP `[[17/15,−1/15],[−1/15,8/15]]`; `H₂=diag(1,½)`; constant | holds | none |
| 5.2 Quadratic termination | `A=diag(1,3)`; `φ=−9, −5, 3`; 300 random `(A,H₀,b,x₀,φ≥0)`, `n ≤ 4`; `n=0` | `H_k=I`; `det H₁=(φ+9)/15`, singular at `−9`, stuck at `(2/3,2/3)`; 300/300 hold | holds | C03 |
| Layer 1 Examples sentence | `φ = ½Σxₙ²/n` on `ℓ²` | Hessian `diag(1/n)`: form positive, not surjective, Newton map the identity | false as written | R01 |

- Source locators checked against the text: 29 of 29 in four sources (FerreiraSvaiter lines 51–88, 219–239; Ferreira lines 66–99, 230–248, 283–313; DennisMore1974 lines 104–149; DennisMore1977 lines 247–253, 1059–1072, 1167–1195, 1274–1330, 1349–1398).
- Library declarations opened at the pins: 34 (30 Mathlib, 4 Tau Ceti, all present; statements of the 4 Tau Ceti ones and of `Polynomial.newtonMap`, `Matrix.add_mul_mul_inv_eq_sub`, `norm_image_sub_le_of_norm_deriv_le_segment'`, `Matrix.PosDef` read against their descriptions).
- Cross-roadmap citations resolved: 2 (FirstOrderOptimization 1.1, SpectralSteepestDescent 5.1, both at their open heads, both as described).
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 13 `sorry` warnings and nothing else; `#check @name` on all 24 declarations compared with the README, generality equal; the two definitions without `DecidableEq` (`bfgsUpdate`, `dfpInvUpdate`) do not need it.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `simp` with the matrix-vector lemmas) on the 13 theorems: none closes. No padding found.
- No change outside the roadmap folder; no `set_option`, no sorry'd data, single `import Mathlib`.
- The automatic checks all passed on this head.

Overlap check: read ManifoldOptimization, FirstOrderOptimization, SpectralSteepestDescent; the quadratic remainder estimate is shared in subject only: the scalar one-sided form is SpectralSteepestDescent 5.1's, the scalar two-sided form FirstOrderOptimization 1.1's, the normed-space form on a convex set this roadmap's 1.2; Newton's method on manifolds is ManifoldOptimization O5.2's and is excluded here.

Source independence: 19 passages compared with 4 sources, none shared; largest share DennisMore1977, 16 of 29 locators; contents compared with DennisMore1977 (its sections 3, 7, 8 against Layers 4, 3, 5, in a different order, with Layers 1 and 2 from other sources): independent.

Research link: the headline targets are published theorems: Kantorovich's theorem in the form of Ferreira–Svaiter (2012 preprint), Ferreira's local theorem (2010 preprint), the Dennis–Moré characterization (1974) and Broyden's quadratic termination as stated in Dennis–Moré (1977), which the convergence theory of quasi-Newton methods builds on; rests on the README's references and the four texts read.

## Not verifiable

- DennisMore1977, Theorem 8.1: whether the parameter condition is printed as `φ_k ≥ 0` or `φ_k > 0` cannot be told from the text extraction of the typescript (line 1397); the statement with `≥` was checked numerically instead.
- DennisMore1977, equations (7.30), (8.4) and (8.5): the displayed formulas are missing from the extraction (lines 1324, 1349, 1364); the surrounding text is consistent with the README's use.
- Reuse against public formalisations outside the pinned libraries was not searched.

## Source issues

- **Gap** in FerreiraSvaiter at Theorem 1, hypothesis 2, p. 2: the source says the Lipschitz bound on the derivative holds for all points of `C`, though the derivative is assumed only on the interior; it should be for points of the interior of `C`; affects a stated result.
- **Error** in Ferreira at Theorem 13, pp. 8–9: the source says the zero is unique in the ball of radius `((p+1)/K)^(1/p)`; it should be the smaller of that radius and `κ`, as Theorem 2 gives; affects a stated result.
- **Misprint** in Ferreira at Theorem 13, p. 8: the source says `κ` is a supremum over `[0, R)` with no `R` introduced in that theorem; it should be the supremum of all radii whose ball lies in the domain; affects nothing.
- **Misprint** in Ferreira at Theorem 2, p. 3: the source says the optimality condition with an unbalanced parenthesis; it should be `f(ρ)/(ρ f'(ρ)) − 1 = 1`, as in Lemma 11; affects nothing.

## For the human reviewers

- Scope: the subject is classical numerical analysis (topic `math.OC`); Layers 3–5 rest on refereed papers (DennisMore1974, DennisMore1977), Layers 1–2 on two arXiv preprints (Ferreira, FerreiraSvaiter) cited by preprint numbering; journal versions were not compared.
- Licence: DennisMore1977 was read in the HAL typescript the README names, DennisMore1974 in the AMS open archive; no reuse of source material was found.
