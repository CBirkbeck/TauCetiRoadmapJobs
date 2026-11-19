# Review of NewtonAndQuasiNewtonMethods (pull request #2573 at 3a82274)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the minimization example of Layer 1, is repaired, and the new text (a coercive Hessian, with the `ℓ²` counterexample to mere positivity) is correct. No stated theorem, definition or Lean statement changed, and no finding remains. There are three small corrections and one format note, none blocking; two of the corrections and the note are carried from the previous review. The two points for the human reviewers (preprint numbering in Layers 1 and 2) stand.

## C01 — The minimization example of Layer 1 leaves out the continuity of the Hessian that 1.3 assumes

The Examples paragraph of Layer 1 (lines 191–194) takes "a twice differentiable `φ`" and says "1.3 applies with `A = H` when the Hessian satisfies the radial condition of 1.3". Section 1.3 (line 122) and `newtonSeq_local_quadratic` (`hf'`) also ask that `f'` be continuous on the ball, which twice differentiability of `φ` does not give and the radial condition gives only along rays through `x⋆`. The conclusion is not in doubt (the route of 1.3 never uses the continuity), so this is a matter of the example matching the theorem it invokes: "a twice continuously differentiable `φ`" would do.

## C02 — The Lipschitz hypothesis of 2.1 and 2.2 constrains `f'` at boundary points of `C`, where nothing ties `f'` to `f`

Unchanged from the previous review. In 2.1 (line 217) and in `hLip` of `newtonKantorovich` and `newtonKantorovich_quadratic` the bound `‖A⁻¹(f' y − f' x)‖ ≤ L‖x − y‖` is asked for all `x, y ∈ C`, while `f' x` is the derivative of `f` only at interior points. The statements are true, but a user whose `f` is differentiable only inside a closed ball must invent boundary values of `f'` that keep the bound. Ferreira–Svaiter's proof evaluates the derivative only at interior points (FerreiraSvaiter lines 206–239). Would quantifying `hLip` over `interior C`, in the README and in both Lean statements, be acceptable?

## C03 — The symmetry of `B` in 3.3 is not used by either inverse formula

Unchanged from the previous review. `inv_bfgsUpdate` and `inv_dfpUpdate` assume `B.IsSymm` (README line 365), but `sᵀ·bfgsUpdate B s y = yᵀ` holds for every square `B` with `sᵀy ≠ 0` and `sᵀBs ≠ 0`, and both formulas held on 241 of 241 random non-symmetric invertible `B` in exact arithmetic. The hypothesis is Dennis–Moré's, so keeping it is defensible; if it stays, a clause saying that symmetry is not needed would tell an implementer so.

## N01 — Name the open roadmap that plans Newton's method on manifolds

"Not treated here: … Newton's method on Riemannian manifolds" (line 597) could name ManifoldOptimization O5.2, as the Scope section does for the two scalar remainder estimates.

## Previous findings

- R01 — repaired: "at a critical point `x⋆` whose Hessian `H` is coercive (`⟪H v, v⟫ ≥ c‖v‖²` for some `c > 0`), hence invertible, 1.3 applies with `A = H` when the Hessian satisfies the radial condition of 1.3" (see C01 for the remaining clause).
- Earlier small corrections: the summary's clause on `H_n` and the file named for `fderiv`, `HasFDerivAt`, `HasFDerivWithinAt` are repaired; the description now names FirstOrderOptimization 1.1 and SpectralSteepestDescent 5.1; the two on `hLip` and on symmetry, and the format note, are written again above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 1 Examples: coercive Hessian is invertible | bounded `H` with `⟪Hv, v⟫ ≥ c‖v‖²` on a real Hilbert space | `‖Hv‖ ≥ c‖v‖`: injective, closed range; `w ⊥ range H` gives `0 = ⟪Hw, w⟫ ≥ c‖w‖²`, so `w = 0`; bijective | holds | none |
| Layer 1 Examples: positivity not enough | `φ = ½Σxₙ²/n` on `ℓ²`; truncations `N = 10, 10³, 10⁵` | Hessian `diag(1/n)`; `⟪Hv, v⟫ = Σvₙ²/n > 0`; least eigenvalue `1/N → 0`; preimage of `(1/n)` is `(1,1,…)`, norm² `N → ∞`, not in `ℓ²` | holds | none |
| Layer 1 Examples: "1.3 applies" | hypotheses of 1.3 against the example's | 1.3 asks `f'` continuous on the ball (`hf'`); the example gives twice differentiable `φ` and the radial condition only | conclusion true, one hypothesis unstated | C01 |
| Summary, third headline, against 5.2 and `quadraticSeq_terminates` | `A = diag(1,3)`, `b = (1,0)`, `φ = 0, 1, 5/2`; `A = diag(1,2)`, `b = (1,1)`, same `φ` | first: `x₁ = (1,0) = A⁻¹b`, `H₁ = H₂ = I ≠ A⁻¹`; second: `x₁ = (2/3,2/3)`, `x₂ = (1,½)`, `H₂ = diag(1,½) = A⁻¹`; `H₁` BFGS `[[11/9,−1/9],[−1/9,5/9]]`, DFP `[[17/15,−1/15],[−1/15,8/15]]` | summary now agrees with 5.2 and the Lean statement | none |
| Supplier contract, derivative definitions | files at the Mathlib pin | `HasFDerivWithinAt` at `FDeriv/Defs.lean` line 117, `HasFDerivAt` line 123, `fderiv` line 162; `HasFDerivAt.fderiv` at `FDeriv/Basic.lean` line 415 | as the README now says | none |

The rows for the untouched statements stand as in the previous review, of `f09f9ba`.

- Source locators checked against the text: 1 (DennisMore1977 lines 1394–1398, Theorem 8.1: `H_n = A⁻¹` is asserted only when the terminating index is `n`, as the summary now says).
- Library declarations opened at the pin: 4 (the three definitions and `HasFDerivAt.fderiv`, above).
- Cross-roadmap citations: none in the changed passages; the two of the Scope section are unchanged.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` (unchanged since `f09f9ba`) elaborates with 13 `sorry` warnings and nothing else.
- The automatic checks all passed on this head; no change outside the roadmap folder.
- Pull request text read against the head: no sentence contradicted; the description already carries the sentence on the two open roadmaps.

Overlap check: read ManifoldOptimization, FirstOrderOptimization, SpectralSteepestDescent; the quadratic remainder estimate is shared in subject only: the scalar one-sided form is SpectralSteepestDescent 5.1's, the scalar two-sided form FirstOrderOptimization 1.1's, the normed-space form on a convex set this roadmap's 1.2; Newton's method on manifolds is ManifoldOptimization O5.2's and is excluded here.

Source independence: changed passages only: 3 passages compared with 2 sources (DennisMore1977, Ferreira), none shared; largest share DennisMore1977, 16 of 29 locators; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: the headline targets are published theorems: Kantorovich's theorem in the form of Ferreira–Svaiter (2012 preprint), Ferreira's local theorem (2010 preprint), the Dennis–Moré characterization (1974) and Broyden's quadratic termination as stated in Dennis–Moré (1977), which the convergence theory of quasi-Newton methods builds on; rests on the README's references and the four texts read.

## Not verifiable

- DennisMore1977, Theorem 8.1: whether the parameter condition is printed as `φ_k ≥ 0` or `φ_k > 0` cannot be told from the text extraction of the typescript (line 1397); the statement with `≥` was checked numerically (above, and in the previous review).
- Whether a twice differentiable `φ` can satisfy the radial condition with a discontinuous Hessian was not settled by an example; C01 rests only on the hypothesis list of 1.3.

## Source issues

- none

## For the human reviewers

- Scope: the subject is classical numerical analysis (topic `math.OC`); Layers 3–5 rest on refereed papers (DennisMore1974, DennisMore1977), Layers 1–2 on two arXiv preprints (Ferreira, FerreiraSvaiter) cited by preprint numbering; journal versions were not compared.
- Licence: DennisMore1977 was read in the HAL typescript the README names, DennisMore1974 in the AMS open archive; no reuse of source material was found.
