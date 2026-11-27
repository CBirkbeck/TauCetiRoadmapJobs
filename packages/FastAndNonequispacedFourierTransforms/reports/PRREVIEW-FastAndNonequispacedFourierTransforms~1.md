# Review of FastAndNonequispacedFourierTransforms (pull request #3232 at 77d0bcc)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding: a Check in §5.3 gives a range of values that the function it names does not have (the ratio is 1.10 at N = 1, the text says at least 1.2). Every stated theorem survived the adversarial pass, and the factorizations, the cost formula and the index-map reductions were recomputed from the Lean definitions. There are six small corrections and two format notes, none blocking. No cited source could be read legally, so no locator was checked against its text, and the humans who approve have four points to decide (scope, a disclosed prior formalization, the untested source).

## R01 (P2) — The third Check of §5.3 gives a range that the stated coefficients do not produce: the ratio is 1.10 at N = 1, not between 1.2 and 1.5

A reader who recomputes the Check to test an implementation of the two norms will get a value outside the stated range and cannot tell whether the definition or the Check is wrong.

The Check (README line 405) says that for `c_k = (1 + |k|)^{−(m+0.6)}` the ratio of the left side to `N^{l−m} |u|_m` "stays between 1.2 and 1.5 for m = 1, l = 0", N = 1, …, 32. For these coefficients, summed over all k ∈ ℤ with the weights `1 + |k|^{2l}` and `0⁰ = 1` of the Conventions, I get at N = 1, m = 1, l = 0: `‖u − P₁u‖₀ = 0.671`, `‖u − I₁u‖₀ = 2.343` (alias sums 1.064 at k = 0 and 1.178 at k = −1), `|u|₁ = 2.748` (`|u|₁² = 2(ζ(1.2) − 1 − 2(ζ(2.2) − 1) + ζ(3.2) − 1) = 7.55`), so the ratio is 1.097. Over N = 1, …, 32 the ratio lies in [1.10, 1.34]. The stated range is reproduced only if the spectrum is cut off at some |k| ≤ K of a few thousand (K = 4000 gives [1.26, 1.53]); the result depends on K because `Σ k² |c_k|²` converges like `K^{−0.2}`, and the Check does not mention a cut-off (the Check of §5.1 does). The range for l = 1 is correct as stated (I get [1.70, 2.25]).

Smallest change: either state the cut-off used, as the Check of §5.1 does, or give the values for the untruncated sequence (between 1.09 and 1.35 for l = 0).

## C01 — The periodic Sobolev norm of §5.3 is defined without reference to the Sobolev space on the circle that Tau Ceti already has

`TauCeti.CircleSobolev s E` (`TauCeti/Analysis/Sobolev/Circle/Basic.lean`, line 197, with `weight` at line 88 and `norm_sq_eq_tsum` at line 375) is the Fourier-coefficient Sobolev space on the circle with norm squared `Σ (1 + |n|)^{2s} ‖a_n‖²`. The README introduces `fourierSobolevNorm` with the weights `1 + |k|^{2l}` and neither names the library's space nor lists Tau Ceti among its suppliers, so the library would carry two norms for one space with no stated relation, and a consumer of §5.3 cannot pass to the library's space. The two are equivalent (`1 + |k|^{2l} ≤ 2 (1 + |k|)^{2l}` and `(1 + |k|)^{2l} ≤ 2^{2l} (1 + |k|^{2l})`), and the bound of §5.3 has an unspecified constant, so nothing stated changes.

Would one of these do: state the comparison with `TauCeti.CircleSobolev` as a target or in the Conventions and add a "From Tau Ceti" contract; or state the error bound with the library's weight.

## C02 — The shift relation of §1.2 is the supplier's diagonalization at one vector, so as a target it asks for almost nothing

`dftMatrix_mul_shift` is SamplingAndDiscreteFourierAnalysis 2.1 (`dftMatrix N * circulant v = diagonal (ZMod.dft v) * dftMatrix N`) at `v = Pi.single 1 1`, together with the value `ZMod.dft (Pi.single 1 1) k = stdAddChar (−k)`, which is one unfolding of `ZMod.dft_apply`. The README's route says so. If it is kept as a convention witness for the direction of the shift, saying so in §1.2 would tell an implementer that the content is in the supplier.

## C03 — The second conclusion of the companion relation in §7.2 holds for every complex number when L + M < N, so there it does not single out the nodes

`hankel_mul_companionMatrix` asserts, for each node `z_j`, a nonzero `v` with `z_j • (H 0 *ᵥ v) = H 1 *ᵥ v`. Both `H(0)` and `H(1)` factor through the M × (N − L) matrix `(z_j^m)`, whose kernel has dimension at least N − L − M; a nonzero `v` in it satisfies the equation for every `z`. The README says this itself in the paragraph after the targets (line 563). The first conclusion `H(0) C(q) = H(1)` and the square pencil carry the content. Would it help to say in the target, or in its docstring, that the eigenvalue statement has content only for L + M = N, or to restrict that conjunct to this case.

## C04 — The rank statement of §7.2 opens with "distinct nonzero nodes" and then allows a zero node

The sentence at line 547 reads "For distinct nonzero nodes, nonzero weights and M ≤ L …" and ends "for s = 1 provided the nodes are nonzero", and the next sentence says a zero node is allowed in the other two cases. The Lean statement `rank_trajectoryHankel` assumes only distinct nodes and puts the non-vanishing on s = 1, which is the correct form (with the nodes 0 and 1 and M = 2, `H(0)` has rank 2 and `H(1)` rank 1). Dropping "nonzero" before "nodes" in the opening makes the prose agree with it.

## C05 — The last "Not owned" item points to a roadmap that is not named and that I could not find

"a roadmap on parabolic and spectral Galerkin methods" (line 625) is described by its content (an interpolant on the band |k| ≤ N with halved end coefficients, bounds of real order) but not by name. No roadmap on main or in an open pull request matches: the only Galerkin roadmap found, GalerkinMethodsAndLagrangeFiniteElements, treats Lagrange finite elements. Name the roadmap and its section, or drop the item.

## C06 — The supplier contract says the convolution theorem is used in the route of §2.3, and §2.3 has no route and does not list it

In "From SamplingAndDiscreteFourierAnalysis", item 1.2 is "consumed in §1.2 and in the route of §2.3" (line 642). §2.3 states Rader's identity with a *Needs:* line naming only the cyclicity of the unit group, and the identity is a reindexing of the defining sum that does not use the convolution theorem. Remove "and in the route of §2.3", or add the route.

## N01 — TeX-style subscripts and superscripts in running text

About a hundred places write `w_N^{jk}`, `M_{n+1}`, `Σ_{y + z = x}` and the like outside code spans (the first at line 50). The house style is Unicode, with ASCII inside code spans.

## N02 — Several Checks report that something "was checked numerically" without a value

In §§2.1, 2.3, 2.4, 3.2, 5.1, 5.2, 6.1, 6.3 and 7.1 a Check says an identity was checked for some parameters, and in §§6.3 and 6.4 an "observed error over random data" is given. A reader cannot recompute these. One computed value at one explicit input would serve better in each place.

## Questions for the author

- §6.3 states the bound with the constant 4 and cites Lemma 7.6 of Plonka et al. Does the lemma state a smaller constant depending on m (I recall `4m/(2m − 1)` from the literature on this window)? If so, would the README say that 4 is a weakening. I could not read the book.
- §4.2 says that Theorem 5.12 of Plonka et al. is stated for every t and fails at t = 1, and §7.2 reports a misprint in the proof of their Lemma 10.9. Both claims are consistent with my computations (the count at t = 1 is (0, 4), the formulas give (1, 5); the kernel has dimension N − L − M), but I could not read the pages to confirm what the source says.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.2 product formula | general; N = 2, a = b = (1, 0) | `(â ⋆ b̂)(k) = N Σ a_j b_j w^{jk}`; (2, 2) = 2·(1, 1) | true |
| 1.2 shift relation | general; N = 3, a = δ₁; N = 1 | `(Va)^_k = w^k â_k`; (1, w², w⁴) both sides; V = 1 at N = 1 | true; C02 |
| 1.3 circulant polynomial, eigenvectors | N = 2, a = (1, 2); N = 3, a = δ₁ | eigenvalues 3, −1 = â₀, â₁; column of F gives â_{−k}: w² ≠ w | true |
| 1.1 unitarity | N = 1; N = 4, a = (1, 2, 0, 0) | â = (3, 1−2i, −1, 1+2i); 20 = 4·5 | true |
| 2.1 Cooley–Tukey | (N₁, N₂) = (2,2), (3,2), (2,3), (4,3), (4,2), (1,5), (5,1) | entry `w_{N₁}^{j₁k₁} w_N^{j₁k₂} w_{N₂}^{j₂k₂}` both sides; without D the difference is 1.41 at N = 4 | true |
| 2.2 Good–Thomas | (2,3), (3,4), (5,3), (1,4); (2,4) | identity holds; images 0,2,4,3,5,1; non-coprime image has 4 elements | true |
| 2.3 Rader | p = 2, 3, 5, 7, 11, 13; p = 7, g = 2 | identity holds; â₁ = a₀ − a₁ at p = 2; fails for g of order 3 | true |
| 2.4 Bluestein | N = 1, …, 7, M = 2N−4, …, 2N+2 | holds for all M ≥ 2N − 2; fails at M = 2N − 3 for N = 2, …, 7 | true |
| 3.1 bit reversal | t = 0, 3; `bitReverse 1 2` | 0; 0,4,2,6,1,5,3,7; 0 | true |
| 3.2 radix-2 factorizations | t = 0, …, 6 from the Lean entry formulas | both products equal F_N to 1e−9; without R at t = 2 the difference is 2.0 | true |
| 4.1 cost model | dense F_N, N = 4, 8, 16 | (0, 24), (32, 144), (320, 800) | true |
| 4.2 radix-2 cost | t = 1, …, 8 | (0,4) vs formula (1,5) at t = 1; (0,16), (4,52), (24,152), (88,408), (264,1032), (712,2504), (1800,5896) | true |
| 5.1 aliasing | N = 1; non-periodic continuous f; degree 3, N = 6, k = 3 | f(0) = Σ c_n; summable coefficients force f(0) = f(2π); c₃ + c₋₃ | true |
| 5.2 interpolation | N = 1; band −N ≤ k ≤ N | (u(0) ± u(π))/2 on {0, −1}; 2i sin(Nx) vanishes at the nodes | true |
| 5.3 seminorm identity | m = 0; u = 1 + e^{ix} | Σ|c_k|² with 0⁰ = 1; ‖u‖₀ = 2, ‖u‖_l = √3, |u|_m = 1 | true |
| 5.3 error bound | |u|_m = ∞; u = e^{iNx}; c_k = (1+|k|)^{−1.6} | right side ∞; ratio ≥ 1; ratio 1.10–1.34 (l = 0), 1.70–2.25 (l = 1) | true; R01 |
| 6.1 B-spline | orders 1, 2, 4; ω = π | M₁(0.3) = 1, M₂(0) = 1, M₄(0) = 2/3; 2/π against sinc(π) = 0 | true |
| 6.2 window error | n = 0; n′ = 0; Dirichlet kernel, n′ = 2n | 0 = 0; junk sum 0 would give f = 0; aliases vanish | true |
| 6.3 B-spline window | n′ = 1; k = 0; u = ±1/2, m = 1; m = 1, …, 6 | c_k = δ_{k0}; ratio 0; Σ = 1.467 ≤ 4; sup of ratio 0.822, 0.541, 0.508, 0.502, 0.500, 0.500 | true |
| 6.3 locality | m = 0 (junk order 1); 2m > n′; n′ = 0 | 1 ≤ 1; count ≤ n′; 0 | true |
| 6.4 adjoint | J = 0; n = 0 | 0 = 0; band empty | true |
| 7.1 Prony | M = 0, 1; a zero node | 1 = empty product; p₀ = −z; V still invertible | true |
| 7.1 uniqueness | φ = 0 and 2πi; M = 0 | same samples, excluded by the strip; trivial | true |
| 7.2 ranks | nodes 0, 1; M = 0, L = N + 1 | H(0) rank 2, H(1) rank 1; zero matrix, rank 0 | true; C04 |
| 7.2 companion, pencil | K = 0; L + M < N; c = 0 | empty; every z has a kernel vector; 0 = 0 | true; C03 |

- Source locators checked against the text: 0 of 67 (no source readable; see below).
- Library declarations opened at the pin: `AddChar.sum_mulShift` (`Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean` line 257), `fourierCoeffOn` and `fourierCoeffOn_of_hasDerivAt` (`Mathlib/Analysis/Fourier/AddCircle.lean` lines 352, 605), the lemmas of `Mathlib/Analysis/Fourier/ZMod.lean`, `TauCeti.CircleSobolev` (`TauCeti/Analysis/Sobolev/Circle/Basic.lean` line 197), `TauCeti.companionPencil` (`TauCeti/LinearAlgebra/Matrix/CompanionPencil.lean` line 68, a different object from the companion matrix here).
- Cross-roadmap citations resolved: SamplingAndDiscreteFourierAnalysis 1.1, 1.2, 2.1, 2.2, 2.4 on main; QuadratureRulesAndPeanoKernels §5.2 at its open head; PolynomialInterpolationAndBestApproximation Layer 4 on main; the unnamed roadmap of C05 not found.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, `sorry` the only warning; 29 `sorry`, no `set_option`, no sorry'd definition, single `import Mathlib`.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: none of the 29 theorems closes.
- Elaborated signatures compared with the README statements for all 29 theorems: generality agrees; no lost binder.
- No change outside the roadmap folder.

Overlap check: read SamplingAndDiscreteFourierAnalysis, ScatteredDataKernelInterpolation, LaxEquivalenceAndFiniteDifferenceSchemes, PowerSpectraAndWienerKhinchin; shared with SamplingAndDiscreteFourierAnalysis: the Fourier matrix and the diagonalization of circulants (owner SamplingAndDiscreteFourierAnalysis 2.1, cited here; the eigenvector and Gram statements are remarks there and targets here); nothing shared with the other three.

Source independence: 0 passages compared with 0 of 6 sources (none readable); largest share PPST, 53 of 67 locators; contents compared with PPST only through the section numbers of the README's own locators (Layers 1 to 7 draw on §§3.2–3.3, 5.3, 5.2.3, 5.2.5, 3.1, 7.1–7.2, 10.1–10.2, not in the source's order): no one-to-one run; its table of contents was not read.

Research link: Layers 6 and 7 state the window-method error bounds of the nonequispaced FFT and the Prony and matrix-pencil recovery of exponential sums as in Plonka, Potts, Steidl and Tasche (2018), Chapters 7 and 10; Layer 5 the Fourier interpolation estimates of Canuto, Hussaini, Quarteroni and Zang (2006) used in spectral methods. Rests on the README's sources and its Downstream consumers.

## Not verifiable

- All locators into PPST (53, including every target of the sample: 1.2, 1.3, 2.1, 2.4, 3.2, 4.1, 4.2, 5.1, 6.1, 6.3, 6.4, 7.1, 7.2): the book resolves only to the publisher's paywalled page.
- The locators into CHQZ (5.1, 5.2, 5.3), STW (5.3) and K (5.2, 5.3): the same.
- The locators into SB (2.1, 3.1, 3.2, 5.2) and I (1.1): the sources service found no legal copy.
- The README's two statements about the source (Theorem 5.12 at t = 1 in §4.2, the misprint in the proof of Lemma 10.9 in §7.2): the pages could not be read.

Automatic checks set aside as false positives: the check for a section header in `Suggested.lean` with no declaration under it flagged the header above the block of `#check` lines that pin the library declarations named in the README; the header introduces that block.

## Source issues

- none

## For the human reviewers

- Scope: SamplingAndDiscreteFourierAnalysis on main (Scope and ownership, "Not treated here") excludes fast algorithms for the DFT as "procedures and not theorems"; this roadmap states them as matrix factorizations with an operation-count model (`constMulCost`, `mulVecCost`).
- Scope: all six sources are textbooks or monographs (PPST, SB, I, CHQZ, STW, K); the headline results are textbook numerical analysis.
- Licence: the README's "Prior formalization" section names the author's public repository lean-NASC (Apache-2.0 by its account) as proving parts of §§1.1, 1.2, 1.3, 5.2, 7.1; I did not open it.
- Not tested: PPST carries 53 of 67 locators and neither its text nor its table of contents could be read; wording and arrangement were not compared with it.
