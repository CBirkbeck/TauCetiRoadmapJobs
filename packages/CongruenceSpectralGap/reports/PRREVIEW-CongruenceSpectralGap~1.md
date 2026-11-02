# Review of CongruenceSpectralGap (pull request #1504 at 4143db4)

**Verdict:** needs changes

## R01 (P1) — Reverse the obsolete VariationalMethods prerequisite

**Location:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:74`: “The order at the level of targets is V2.3 and UO-A01–UO-A03 before UO-D06”.

**Claim:** VariationalMethods supplies the scalar-generic coercive prefix needed to construct UO-D06. This reverses the current ownership and creates a target-level cycle if followed. Merely changing `V2.3` to `2.3` does not repair it.

**Witness:** `TauCetiRoadmap/VariationalMethods/README.md:499` consumes UO-D06's coercive solution; its ownership paragraph at line 45 expressly excludes supplying UO-D06. `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:523` constructs that solution within UO-D06 itself.

**Repair:** Delete VariationalMethods from this prerequisite paragraph. Cite UO-D06's own scalar-generic coercive construction, its Mathlib real Lax–Milgram input, and its named complexification supplier where needed. Retain UO-A01–A03 and SelfAdjointSpectralTheory SA-E01. On the cited pair of targets this removes the asserted edge VariationalMethods §2.3 → UO-D06, leaving the actual edge UO-D06 → VariationalMethods §2.3. No mathematical input to the quotient construction is lost. The roadmap-level mechanical check below does not detect this reversal inside a supplier's target order.

## R02 (P2) — Give the outstanding supplier contracts a single owner

**Location:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:108` and line 122; `packages/CongruenceSpectralGap/design/plan.json:1963`–1984. The README says the finite-function adapter “does not require an extra supplier target”.

**Claim:** Four still-declared supplier gaps now ask the suppliers to build the same general objects that this README assigns to itself. This is duplicate ownership, rather than a complaint that an acknowledged gap has not yet been fulfilled. None of the seven plan slugs appears in the README's supplier contracts.

**Witness:** Plan gaps `all-prime-self-pair-positivity`, `self-pair-local-character-transport`, `finite-rs-polynomial-strips`, and `additive-character-sheaf-weight` match the locally owned constructions at README lines 407–420, 440, and 648 respectively.

**Repair:** Reconcile the ownership and intake records together. A repair preserving the declared design is to retain these four named supplier gaps, put their exact `What <Supplier> must provide (gap:<slug>): ...` contracts in the corresponding supplier subsections, and replace the duplicate general constructions with imports of those contracts. Keep the local prime-twist assembly, Mellin argument, convolution and spectral applications. Alternatively, if the intended ownership move is to keep these constructions here, have the package's gap records retire those four requests explicitly; do not leave suppliers assigned the same work. Reconcile the other three slugs with §§0.4–0.6 at the same time, distinguishing the generic form theorem from its quotient specialization and the adelic decomposition from the locally constructed closure/compactness comparisons.

The concrete test is the ramified rank-one self-pair: its coefficients are `1,1,1`. Both §2.0 and the outstanding AL.3 positivity contract currently promise those same coefficients. After repair there must be one provider and one consumer, with the coefficients unchanged. The same test for the additive sheaf is trace `ψ(Tr(x))`, not a second construction of that sheaf under a different name. All seven gaps have named suppliers and precise mathematical hypotheses; their acknowledged absence from those suppliers is not itself a finding.

## R03 (P3) — Register the additional positivity source

**Location:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:901`, and the citations at lines 407 and 409.

**Claim:** `rs96` is cited for an essential all-prime positivity argument but is absent from the package's source manifest.

**Witness:** `packages/CongruenceSpectralGap/sources.toml` contains six entries: `gj78`, `teschl`, `lrs95`, `katz-gkm`, `bms02`, `laumon-swan`; there is no Rudnick–Sarnak 1996 entry. The README lists seven works.

**Repair:** Add one `rs96` entry, using the existing README key, the institutional manuscript URL, Appendix §5.2, equations (5.4)–(5.14), Lemma 5.1, manuscript pages 52–55, and the source service's provenance. The service successfully retrieved that manuscript during this review; `rs96 line 3181`, line 3254, line 3302 and line 3339 locate the material. The repaired inventory should have seven distinct works and seven keys. No request for the settled `lrs95` source is needed.

## Verified sound

The review covered all **31 numbered subsections**, their APIs and Checks, all six layers, the supplier contracts and conventions, and all **four Lean declarations**. The adversarial table has **82 computed rows**, covering every numbered target, the three Lean headlines and all findings. These are concrete tests, not proofs of the deep theorems. Finite-dimensional operator models test the definitions and normalizations; they are not claimed to be actual automorphic spectra. Finite-sum calculations were recomputed independently for primes 2, 3, 5 and 7, and by explicit field arithmetic over the four-element field. The report distinguishes readable source verification from the settled, uncertified LRS citations.

The requested head was confirmed. The worktree remained clean; the comparison with `origin/main` outside this folder was empty. There are no changes to another roadmap to report. The folder contains no source extracts or stray files. No computational algorithm replaces a mathematical target, no good-prime restriction deletes ramified factors, and no copied source passage or suspicious instruction was encountered. The prime-twist restriction at its conductor is an explicit analytic hypothesis, not a restriction of the underlying local library to good primes.

The recorded gate at this head passed every check:

```text
gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I reran the specified dependency check against the supplied merge order and main content:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Every `Needs` clause was read. R01 concerns the explicitly asserted order between two supplier targets, not a fabricated failure of this mechanical check. No dependency on a later consumer was found. No settled finding about AutomorphicSpectralTheory §7.1a's separate finite-place endpoint is re-raised.

`lake env lean` on the original `Suggested.lean` succeeded with only the three expected `sorry` warnings. A scratch copy containing `#check @...` for all four declarations also elaborated. In particular, the finite field and coefficient-ring instances remain on `hyperKloosterman`; positivity of the rank and nontriviality of the character remain on its bound; primality, oddness and the unit argument remain on the Gauss bound; congruence, C² regularity, invariance, boundedness, nonconstancy and the actual differential equation remain on the eigenfunction theorem. No binder disappeared and no change was made. Separate scratch substitutions of `simp` for each of the three admissions failed to close any theorem. Reading their definitions rules out `rfl` and `infer_instance`; the object search found no single pinned theorem giving these conclusions. No padding finding is warranted.

The README follows the required scope/conventions/contracts/layers/examples/dependencies/references organization. The definitions have prose APIs and at least three discriminating Checks. The single real-bodied Lean definition is needed for a numerical headline. There are no sorry'd data, option overrides, imported roadmap modules, free placeholder predicates or admitted examples.

**Headline inventory.** The numerical all-rank Deligne bound (§4.2b), Gauss-power average bound (§4.3), and classical congruence eigenvalue bound (§5.3) are the three statable deep endpoints in Lean. The docstring individually explains the missing carriers for the quotient Friedrichs/closed-energy and Rayleigh/clipping/scaling endpoints (§§0.2–0.7, 5.3–5.5); exceptional dictionary and adjoint comparison (§§1.1–1.3); canonical local positivity/epsilon transport (§2.0); forced zero and exact two-kernel equation/estimates (§§2.2, 3.3–3.4); first moment and dyadic nonvanishing (§§4.4–4.5); spherical parameter bound (§5.1); principal-level completion and cusp compactness (§§0.5a–0.5b); additive-character and Kloosterman sheaves, rational-adic Euler–Poincaré and Swan-constancy (§4.2b). The scalar implication in §5.2 is arithmetic within that argument, not a missing deep acceptance theorem. A generic `LinearPMap` or an arbitrary function cannot supply the missing canonical carriers. The bounded classical eigenfunction statement does name the actual group and Laplacian and loses no small cuspidal eigenvalue along the README's stated route.

**Seeded source sample: all 15 targets.** There are no additional locators marked unverified in the README. References below use the versions actually read, including the 2009 Teschl text and the arXiv BMS numbering. “Uncertified” means that the LRS text was not available for this review; the independent calculation is still recorded.

| Target | Locator opened or status | Scope/hypothesis result |
| --- | --- | --- |
| 0.1 Hyperbolic quotient measure | FuchsianOrbifolds Layers 0–3, 4.5, 6.1; pinned fundamental-domain and volume definitions | Effective action, actual fundamental domain and finite area are required; the area computations below agree. |
| 0.5 Clipped convention | `lrs95`, Thm 1.1 p.387, discussion pp.389–390: uncertified | Set-theoretic infimum controls independently verified, including empty small spectrum. |
| 0.5a Principal comparison | `lrs95`, §1 pp.389–390: uncertified; AdelicAlgebraicGroups §5.2 and AutomorphicFormsOnReductiveGroups §§3.1, 4.5 resolved | Component normalization and inverse determinant action checked; the all-level completion is an explicit local target, not silently attributed to the level-one theorem. |
| 0.5b Cusp compactness | `lrs95`, §1 pp.389–390: uncertified; AutomorphicSpectralTheory §1.16a resolved | The Fourier estimate includes the actual width and excludes the zero mode. Local Rellich plus the uniform tail is the stated route. |
| 0.6 Spectral description | `lrs95`, Thm 1.1/§1: uncertified; AutomorphicSpectralTheory §§4.3–4.4, 4.8, 4.14a resolved | Constants-only residual space on a connected classical component and one continuous channel per cusp are distinguished from the full adelic component sum. |
| 0.7 Rayleigh/clipped comparison | `teschl line 5044`, Thm 4.10 p.119; form-domain observation line 5053 | Nonzero reducing complement, semibounded self-adjoint operator, spectral/form-domain comparison retained. The geometric spectral description is a separate input. |
| 1.2 Monomial temperance | `gj78 line 721`, §3.7 p.491; line 2151, Thm 9.3 p.534; line 2384, Remark 9.9 p.541 | Quadratic self-twist/induction branch and unitary assumption checked. Temperance uses the unitary inducing character and the supplied archimedean correspondence, not the cuspidal branch of the adjoint theorem. |
| 1.3 Adjoint parameters | `lrs95`, §1/Thm 1.2: uncertified; `gj78 line 528`, Def 3.1.3 p.485; line 538, Prop 3.2 pp.485–486 | Trace-zero adjoint parameters, central-character inverse and self-duality agree with the computed three characters. Cuspidality retains the no-self-twist hypothesis. |
| 4.1 Prime average | `lrs95`, (3.4), Prop 3.1 p.395: uncertified | Odd prime, nonprincipal even character, standard-conductor exclusion and finite dyadic indexing independently tested. |
| 4.2 Even orthogonality | `lrs95`, (3.11)–(3.12) p.397: uncertified | Derived independently from full-character orthogonality. Principal subtraction includes both ±1 classes. No claim to have inspected the reported LRS misprint. |
| 4.4 Moment asymptotic | `lrs95`, Prop 3.1 p.395, proof pp.397–399: uncertified | Balanced primal/dual exponents, strict error range, `n=1` separation and the 3/4 constant recomputed. |
| 4.5 Nonvanishing | `lrs95`, Prop 3.1/proof of Thm 1.2 p.395: uncertified | Nonzero complex sum gives at least one nonzero term; positivity of individual twists is unnecessary and not assumed. |
| 5.2 Eigenvalue arithmetic | `lrs95`, §1 pp.389–390: uncertified | The adjoint GL₃ bound gives `r≤1/5` and `λ≥21/100`, including equality; direct GL₂ gives only 4/25. |
| 5.3 Congruence gap | `lrs95`, Thm 1.1 p.387: uncertified; `bms02 line 151`, maximal domain, and line 245, Cor 2.10 p.7 | BMS requires completeness and its operator hypotheses; the README supplies a torsion-free cover, invariant descent and distributional-domain comparison. Boundedness plus finite area gives L². |
| 5.5 Rescaling | `lrs95`, §1 pp.387–390: uncertified; `teschl line 5044`; DifferentialGeometry Layer 12 | The scaling is a coordinate deduction, not a theorem attributed to Teschl: measure divides by κ, Laplacian multiplies by κ, energy stays fixed in dimension two. |

The other readable sources used in the proof-route audit were also opened. `rs96 line 3181` through line 3347 gives the analytic local factor decomposition and the logarithmic sum-of-squares positivity argument, including ramified blocks. `katz-gkm line 1845`, line 1871 and lines 1892–1912 give the raw sum and Theorem 4.1.1's hypotheses, rank, trace sign, purity and ramification; setting all exponents to one imposes no exclusion on the characteristic dividing the rank. Lines 2266–2306 give the Lang `1−Frobenius` character convention. Lines 2392–2430 and 2460–2665 give the convolution rank/Swan/purity statements and the Kummer-descent/vanishing-cycle tameness proof. `laumon-swan line 391` through line 432 gives the excellent-base smooth-curve family hypotheses, the Swan-plus-boundary-rank conductor, local acyclicity and the proper direct-image consequence. Its finite-coefficient theorem is not silently treated as the rational-adic theorem: the latter coefficient passage is an explicit target. `teschl line 2914` and line 2960 give Friedrichs and closed-form representation; the typographical problems in the following proof are recorded below and are not copied into the roadmap's graph specification.

**Computed adversarial pass.** Each row names the statement being tested, actual values on the relevant sides, and the consequence. “Keep” means no mathematical change proposed from that test; it does not certify an unread source. For smooth cutoff tests, choose a smooth compactly supported bump in the indicated interval with logarithmic integral one.

| Statement | Instances and computed sides | Result / change |
| --- | --- | --- |
| Conventions; 0.1 effective area | Signature `(0;2,3;1 cusp)` gives `2π(−2+1+1/2+2/3)=π/3`; projective index 6 at Γ(2) gives `6π/3=2π`. | Counts the ineffective ±I once; keep. |
| 0.1 finite measure/nonzero level | Γ(1) mass `π/3>0`; Γ(2) mass `2π>0`. Γ(0) is the identity subgroup and has infinite-area quotient. | N≠0 is necessary; keep. |
| 0.2 positive expression | `Δ1=0`; `Δy²=−2y²`; `s=1/2+it` gives `s(1−s)=1/4+t²`. Opposite div-grad sign gives `+2y²`. | Sign is fixed; y² is only a local test. |
| 0.2 closed realization/cover | N=1,2 give torsion-free cover levels 3,6. For a cusp cutoff beyond R, lost constant L² mass is proportional to `w/R` and cutoff energy to `w/R`, both →0. | Constants survive the form closure; no artificial Dirichlet condition at infinity. |
| 0.2 nonzero operator | A smooth compactly supported nonconstant bump in a free chart has `∫|∇u|²>0`; the zero operator would give 0. | Excludes the trivial realization; keep. |
| 0.3 complex mean zero | With total mass V, integrals of 1 and i are `V` and `iV`, both nonzero. For `v−(∫v)/V`, integral is `∫v−∫v=0`. | Real-part-only integral kernel would wrongly retain i; keep. |
| 0.3 integral bound | Constant c gives `|∫c|=|c|V=√V·(|c|√V)`; a zero-integral bump gives left side 0 and positive norm. | Bound and nonzero complement tested; keep. |
| 0.4 Rayleigh definition | `A=diag(0,.21,.25)`: at e₂, numerator/denominator `.21/1`; at 2ie₂, `.84/4`; both `.21`. Norm-only denominator gives `.84/2=.42`. | Correct square and complex scaling. |
| 0.4 infima/core | Same model: full infimum 0, constant-complement infimum `.21`; form and operator domains coincide. Spectral truncation of e₂ is 0 for R<.21 and e₂ for R≥.21. | Projection and discarded-energy formulas agree; keep. |
| 0.5 clipped infimum | Small sets `∅`, `{.21}`, `{1/3}` give infima `.25`, `.21`, `.25` after adjoining .25. | Empty case and clipping work; keep. |
| 0.5 lower-bound guard | For `S={−n:n∈ℕ}`, no real lower bound exists. The real complete-lattice infimum API cannot imply a member bound from this set. | Existing bounded-below premise retained. |
| 0.5a measure isometry | If a component carries `c_N dA`, constant 1 has squared norm `c_N V`; its image √c_N has squared norm `c_N V`. Unscaled identity gives V. | Normalizing factor necessary. |
| 0.5a components/right action | N=3: SO(2) gives 2 components, O(2) gives 1. N=5, determinant 2: a vector supported at component 1 moves to `2⁻¹=3`, not 2. | Matches right-translation convention and supplier. |
| 0.5a level-changing maps | Conjugating `[[1,1],[0,1]]` by `diag(p,1)⁻¹` and `diag(p,1)` gives upper-right `1/p`; it is not integral. | Arbitrary adelic right translation is not a fixed-level action. |
| 0.5b cusp tail | Widths 1 and 3 give constants `1/(4π²R²)` and `9/(4π²R²)`. A frequency-one mode has `|∂x u|²=(2π/w)²|u|²`, and `y⁻²≤R⁻²`. | Both sides yield the stated bound; width cannot be suppressed. |
| 0.5b zero-mode exclusion | A nonzero x-constant cusp tail has positive `∫|u|²/y²` but `∫|∂x u|²=0`. | Cuspidality is essential; keep. |
| 0.6 spectral channels | Γ(1) has 1 cusp/channel, Γ(2) has 3. At t=0 and 1, continuous eigenvalues are `.25` and `1.25`. | Not a universal one-channel expansion. |
| 0.6 residual removal | Classical constant has eigenvalue 0; removing its line removes that value. On the full principal adelic sum, componentwise constants have dimension `φ(N)`; for N=5 this is 4, not 1. | Component restriction is necessary and present. |
| 0.7 spectral/clipped equality | No exceptional eigenvalues: both bottoms `.25`. Adding a discrete eigenvalue `.21`: both `.21`. Keeping the constant eigenvalue would give 0 instead. | Comparison has the right complement. |
| 1.1 exceptional parameter | r=0,.2,.5 give λ=.25,.21,0. The open exceptional range excludes both endpoints; either common sign parity leaves `1/4−r²` unchanged. | Correct range and parity. |
| 1.2 unitary monomial branch | An inducing norm shift σ contributes central modulus exponent 2σ. At norm 2 and σ=1 it has modulus 4, versus unitary modulus 1; σ=0 gives 1. | Real shift must vanish; keep the unitary hypothesis. |
| 1.2 archimedean temperance | A unitary character takes values of norm 1. A two-dimensional induced parameter then has bounded diagonal values; `diag(2,1/2)` would be unbounded under powers. | Unitary induction excludes the wrong complementary model. |
| 1.3 adjoint normalization | Diagonal characters a=2,b=3 yield adjoint weights `2/3,1,3/2`, product 1. Raw symmetric square gives `4,6,9`, product 216. | The central-character inverse is indispensable. |
| 1.3 exceptional lift | r=.2 gives `{.4,0,−.4}`. Common sign squared is 1; determinant twist cancels the remaining common central factor. | Spherical GL₃ specialization agrees. |
| 2.0 ramified positivity | Ramified unitary rank one paired with its inverse: `(1−T)⁻¹` has coefficients `1,1,1`; deleting its ramified factor gives `1,0,0`. | General all-prime target necessary; ownership R02. |
| 2.0 supercuspidal/logarithm | e=2 gives coefficients `1,0,1`; log coefficients at T,T² are `0,1`. e=1 gives log coefficients `1,1/2`, exponentiating to coefficients `1,1`. | Nonnegative, not strictly positive in every degree. |
| 2.0 Steinberg blocks | n=2,e=1,p=2 gives factor `(1−T)⁻¹(1−T/2)⁻¹`: linear coefficient 3/2, quadratic 7/4; log coefficients 3/2,5/8. `5/8+(3/2)²/2=7/4`. | Shift/product and logarithmic normalization agree. |
| 2.0 character transport | η(p)=−1 sends `(1−T)⁻¹` to `(1+T)⁻¹`; linear coefficient `1→−1`. Conductor exponent 2 gives epsilon multiplier `(-1)²=1`. | Includes ramified pairs; ownership R02. |
| 2.0 primitive-twist epsilon | m=2 ratios are `1,a/b,b/a,1`, product 1. At s=1/2, `|τ|⁴q⁻²=q²/q²=1`; m=1 gives `√q/√q=1`. | Degree is m², not m. |
| 2.1 functional equation normalization | f=4,q=5,m=2: total conductor `4·5⁴=2500`, epsilon numerator norm `2·25=50`, normalized norm `50/√2500=1`. Dropping √f gives 1/2. | Correct unit root number. |
| 2.1 gamma/analytic adapter | μ=±.2 gives self-pair shifts `.4,0,0,−.4`; at Re s=1, smallest argument real part `.6>0`. Thus no gamma pole appears on the boundary. | Finite-function continuation is justified separately; ownership R02. |
| 2.1 excluded twist cases | A nonprincipal primitive twist at unramified q changes inertia from trivial to χ≠1; a norm twist is inertia-trivial. Odd χ has sign −1 at infinity versus +1 for even χ. | Entireness argument and unchanged gamma factor use real hypotheses. |
| 2.2 forced zero | At β₀=.4, the maximal diagonal gamma argument is `.4−.4=0`; its meromorphic pole must be cancelled by a zero of Lχ. Lean Γℝ(0)=0 but punctured `sΓℝ(s)→2`. | No division by a totalized pole value. |
| 3.1 cutoff tail | Normalized bump supported in [1,2]: F₁(.5)=1, F₁(3)=0. Multiplying the bump by 2 gives values 2,0 and Mellin mass 2. | Normalization fixes the kernel. |
| 3.1 Mellin normalization | For the indicator of [1,2], the logarithmic integral is log 2, not its dx-integral 1. Inversion's contour factor `(2πi)⁻¹·i=(2π)⁻¹`. | Rejects wrong measure and missing i. Indicator is only a measure-normalization control. |
| 3.2 dual kernel | G=1, normalized bump in [3,4]: at x=.2 and 2, reflected tails give 1 and 0. G=0 gives 0. | Inversion is at 1/x. |
| 3.2 differential sign | G(w)=w gives `βF₁(reflected φ,x)−φ(1/x)`; writing the reflected tail as T and φ(1/x)=a≠0 gives βT−a versus the wrong βT+a, a difference of 2a. | Minus sign from integration by parts retained. |
| 3.3 pole collision | d=4 and collision with 1/s permit pole order 5, hence log power 4. For ε>0, `x^ε(log(1/x))⁴→0`. | An ε-loss absorbs collisions; no unsupported simple-pole claim. |
| 3.3 small-x integrability | σ=.5,β₀=.4,ε′=.1: the singular exponent in F₂ is 0, so weighted integrand exponent is −.5 and integral on (0,1) is 2. At β₀+ε′=1 it becomes exponent −1 and diverges. | Strict choice ε′<1−β₀ matters. |
| 3.4 two-kernel equation | β=.5 gives both coefficient powers `n⁻.5`. Replacing Y by 2Y doubles the dual argument `nY/(fq^d)` and halves the primal argument `n/Y`. | Correct reciprocal scale; no arbitrary-function stand-in. |
| 4.1 finite average | L≡1,fπ=1: Q=0,1,2 give 0 terms; Q=3 gives q=5 and one even nonprincipal character, total 1. Taking fπ=5 removes it, giving 0. | Indexing and bad-prime filter verified. |
| 4.2 even orthogonality | q=5, residues 0,1,2,3,4 give `0,1,−1,−1,1`. q=3 has no even nonprincipal character, giving 0 on every residue. | Principal subtraction at ±1 is required. |
| 4.2 main n=1 coefficient | q=5 gives `(q−1)/2−1=1`; omitting the principal subtraction gives 2. | README formula passes; unread LRS source not certified. |
| 4.2a rank zero/one | F₃,k=0: r=1 gives 1, r=2 gives 0. k=1 gives ψ(r), norm 1 for the standard complex character. | Empty product is handled; bound only claims positive rank. |
| 4.2a coefficient ring/transport | In F₃,k=2,r=2 the raw sum is 2; reduction of the analogous integer-valued trivial-character sum 2 modulo 2 is 0. In the zero coefficient ring every sum is 0=1. | Raw construction permits general commutative coefficients; complex bound does not. |
| 4.2a additive scaling | Substitute each variable by axᵢ: product changes by a^k. F₃,a=−1,k=2 gives a²r=r and the same values −1,2. k=1 sends ψ(r) to ψ(−r). | Correct direction of the parameter change. |
| 4.2a eliminated-variable comparison | F₃,k=2,r=1: two tuples `(1,1),(2,2)` give `ζ²+ζ=−1`; eliminating the last variable gives the same two terms. r=2 gives `1+1=2`. | General comparison agrees in a nontrivial case. |
| 4.2b additive sheaf | F₃ standard ψ: trace at 1 is ζ, inverse convention gives ζ²≠ζ. Over F₉, trace of 1 is 2, hence ψ(Tr 1)=ζ². | Geometric Frobenius/extension convention fixed; ownership R02. |
| 4.2b tensor phases | In characteristic 2 the character sheaf for x tensored with itself has phase 2x=0, trace 1 and Swan 0; each original has Swan 1 at infinity. | Tensor-phase addition, not Swan addition for tensor products. |
| 4.2b Euler–Poincaré, tame/proper | Constant rank r on Gₘ: χc=0=r·(2−2). On P¹: χc=2r=r·2. Nontrivial tame rank-one Kummer sheaf on Gₘ has Hc dimensions 0,0,0; constant sheaf has 0,1,1. | Covers empty boundary and characteristic zero; equal Euler characteristic does not identify sheaves. |
| 4.2b Euler–Poincaré, wild | On A¹, phase x has Swan 1: χc=1−1=0. Phase x² in odd characteristic has Swan 2: χc=1−2=−1. | Rank alone cannot determine compact cohomology. |
| 4.2b perfect-base degrees | Over F₃, remove the degree-two point x²+1=0 and use phase 1/(x²+1): total Swan `2·1=2`, χc=`0−2=−2`. After geometric splitting the two contributions are `1+1=2`. | Residue degrees are necessary. |
| 4.2b geometric components | P¹ over Fq² regarded over Fq has two geometric components; χc=4, not 2. | Geometrically connected hypothesis or component sum retained. |
| 4.2b Swan-constancy criterion | Family Lψ(tx) on A¹: generic boundary conductor `Swan+rank=2`, special conductor 1; Hc² ranks `0→1`. Constant P¹ family with empty boundary has conductor 0 and ranks `1,0,1`. | Tests jumping and empty boundary cases. |
| 4.2b boundary rank term | Boundary x²=t in odd characteristic has 2 geometric points generically and 1 at t=0. For the constant sheaf χc changes `2−2=0` to `2−1=1`, although Swan sums are both 0. | Must retain boundary rank term unless point count is fixed. |
| 4.2b properness | A constant sheaf on a smooth nonproper family missing an entire special fibre can have compact-support top rank `1→0`; a proper constant P¹ family has rank 1 on every fibre. | ULA and the proper direct-image conclusion are not conflated. |
| 4.2b rational coefficients | For a finite wild p-group, p is a unit in ℓ-adic coefficients (ℓ≠p), so invariant-projector denominators remain invertible after reduction. A nodal-loop monodromy multiplication by ℓ sends lattice ℓ^a to ℓ^(a+1)≠ℓ^a. | No unjustified global stable lattice on an arbitrary base. |
| 4.2b convolution rank/Swan | Ranks/Swan `(2,1)` and `(3,1)` give rank `2·1+3·1=5`, Swan `1·1=1`; fibre boundary Swans 2 and 3 give χc=−5. Product-rank guess would give 6. | General convolution formula discriminated. |
| 4.2b convolution iteration/purity | Kl₁*Kl₁ gives rank 2, Swan 1, weight `0+0+1=1`; Kl₂*Kl₁ gives rank 3, Swan 1, weight 2. | Induction agrees with rank k and weight k−1. |
| 4.2b Kummer descent | p=2,N=3, coefficient field F₃: 1/N is undefined. Cartan–Leray remains available; an averaging proof would divide by 0. | Route retains the non-semisimple coefficient case. |
| 4.2b wild/unipotent control | For N²=0 in characteristic 3, `(1+N)²=1+2N`; an element of order dividing 2 forces N=0. In characteristic 2, `(1+N)³=1+N`; order dividing 3 again forces N=0. | Finite wild p-image plus unipotence gives triviality for p≠ℓ. |
| 4.2b trace sign | F₃,k=2,r=1 raw sum −1, sheaf trace +1. F₂,k=2 raw sum +1, trace −1. | Factor `(−1)^(k−1)` is required. |
| `hyperKloosterman_bound` | F₂,k=1,2: norms 1≤1 and 1≤2√2. F₄,k=1,2,3: value lists `(1,−1,−1)`, `(3,−1,−1)`, `(5,−3,−3)`; maxima `1≤1,3≤4,5≤12`. | Includes p dividing k; keep. |
| Same, nontriviality guard | Trivial ψ on F₅,k=3 gives `(5−1)²=16`, exceeding proposed bound `3·5=15`. | hψ is essential. |
| 4.3 Gauss identity | q=3,r=1: k=1 gives `0=−1−(−1)`; k=2 gives `0=(−1+2)−1`. q=5,k=2,r=1 and 2 give `5=5` and `−5=−5`. | Both exact identity and conjugate-character direction agree. |
| `gauss_power_even_average_bound` | q=5,k=2 gives norm 5≤`8√5+1`; q=3 gives 0≤`4√3+1`. At k=0,q=7,r=1, left side 2 would exceed right side 1. | Positive-rank hypothesis prevents a false extension. |
| 4.4 balanced errors | d=4,Y=Q^(5/2): primal exponent `1+(5/2)(1−σ)` equals dual exponent `1+5/2−(5/2)σ`. At σ=.9 both are 1.25. | Scale and both sides match. |
| 4.4 prime main term | Sum of primes in (Q,2Q] has leading coefficient `(4−1)/2=3/2`; multiplying by 1/2 gives 3/4. | No missing dyadic factor. |
| 4.4 divisor boundary | n=1 gives n−1=0, divisible by every prime, unlike τ(n) for n≥1. n=2 gives n−1=1 and τ(1)=1. | Main n=1 term must be split off, as it is. |
| 4.5 strict nonvanishing region | d=9: σ=.8 gives error exponent 2, σ=.9 gives 1.5. Q² cannot be dismissed against Q²/log Q; Q^1.5 can. | Strict σ>1−2/(d+1) is correct. |
| 4.5 complex finite sum | Terms `1+i` and `−1` sum to i≠0, so some term is nonzero although no positivity argument applies. | Correct quantifier: at least one twist per sufficiently large dyadic interval. |
| 5.1 parameter endpoint | m=2 gives `1/2−1/5=.3`; m=3 gives `1/2−1/10=.4`. β₀=2·.4=.8 is the boundary, outside the strict contradictory nonvanishing range. | Weak ≤ endpoint is correct. |
| 5.2 exceptional arithmetic | r=0,.2 give λ=.25,.21; r=.3 gives .16 and violates `2r≤.4`. Without r≥0, r=−1 satisfies `2r≤.4` but λ=−.75. | Both hypotheses needed; exact 21/100. |
| 5.3 clipped gap | Empty small spectrum gives `.25≥.21`; extremal r=.2 gives `.21=.21`; gain over 3/16 is `21/100−3/16=9/400`. | No assumed exceptional eigenvalue. |
| `congruence_eigenvalue_bound`, nonconstancy | u≡1 has λ=0, C², invariance and bound 1, but no pair of points with different values. Removing hnc would assert `.21≤0`. | Nonconstancy carried explicitly. |
| Same, congruence | Identity subgroup, u(z)=exp(iz): norm `exp(−y)≤1`, Euclidean Laplacian 0, λ=0, nonconstant. Identity subgroup contains no Γ(N), N≠0. | Native group hypothesis excludes this counterexample. |
| Same, domain/mean zero route | For nonzero λ, pairing with 1 gives `λ∫u=0`, hence ∫u=0; Rayleigh numerator is `λ‖u‖²`, quotient λ. For λ=0, energy 0 forces the constant case. | The headline is connected to the roadmap's quotient objects. |
| 5.4 form inequality | u=0 gives `0≤0`. Unit e₂ in the model gives `.21=.21`; 2ie₂ gives `.84=.21·4`. Constant 1 gives energy 0 but right side `.21V>0`. | Mean-zero and zero-vector cases consistent. |
| 5.5 curvature scaling | κ=4: measure/norm-square divide by 4, energy stays fixed, Rayleigh `.21/(1/4)=.84=21/25`, continuous threshold 1. | Matches κλ and κ/4; κ>0 prevents degenerate metric. |
| R01 dependency direction | Claimed target graph plus actual consumer gives two opposite edges (cycle length 2); retaining only UO-D06→§2.3 gives one edge and no cycle. For q(u,v)=2conj(u)v, either correct adapter yields A=2I. | Repair dependency, not mathematics. |
| R02 outstanding ownership | Four named general contracts have 4 supplier assignments plus 4 local constructions: 8 assignments for 4 objects. Single-owner repair leaves 4 providers. | Reconcile contracts; preserve generality. |
| R03 source inventory | README distinct works=7; manifest distinct entries=6; registering rs96 gives 7=7. | Register provenance. |

**Pinned-library and duplication audit.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These were read from the actual manifest, not inferred from an earlier design baseline. Object searches covered the action, quotient measure, L², unbounded versus bounded Rayleigh quotient, gamma/Mellin normalization, additive and multiplicative character sums, PDE energy and the three proposed headlines. The following opened declarations establish what is being reused and what they do not provide:

| Pinned file and line | Declarations / boundary checked |
| --- | --- |
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` and 181 | `CongruenceSubgroup.IsCongruenceSubgroup`, `.finiteIndex`; existential nonzero principal level, not arbitrary finite index. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:287`; `Mathlib/Algebra/Group/Action/End.lean:184` | `MulAction.orbitRel.Quotient`, `MulAction.toPermHom`; orbit carrier and effective permutation action, not a quotient measure. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:44` | `UpperHalfPlane.volume_def`; density y⁻² on the actual upper-half-plane carrier. |
| `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630` | `MeasureTheory.IsFundamentalDomain.quotientMeasure_eq`; countable group, measurable measure-preserving action and genuine fundamental domains. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89`; `Mathlib/LinearAlgebra/LinearPMap.lean:41` | `MeasureTheory.Lp` is an a.e.-class subspace with finite Lp seminorm; `LinearPMap` contains a submodule and a linear map on it, without density or self-adjointness. |
| `Mathlib/Analysis/MellinTransform.lean:90`, 95, 153; `Mathlib/Analysis/MellinInversion.lean:92` | `mellin`, `mellinInv`, `mellin_comp_inv`, `mellinInv_mellin_eq`; positive evaluation point, convergence, vertical integrability, continuity and complete coefficient space. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, 75, 104; `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:426`, 521 | `Complex.Gammaℝ`, zero iff nonpositive even integer, residue 2; `Gamma_ne_zero` off poles and differentiable reciprocal. |
| `Mathlib/NumberTheory/DirichletCharacter/Orthogonality.lean:68` | `DirichletCharacter.sum_characters_eq`; full character sum with nonzero modulus and roots-of-unity hypotheses, not an even nonprincipal sum. |
| `Mathlib/NumberTheory/GaussSum.lean:72`; `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`, 96 | `gaussSum`, `ZMod.stdAddChar`, `ZMod.isPrimitive_stdAddChar`; positive exponential and raw sum. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138`; `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:282` | `InnerProductSpace.instLaplacian`, `UpperHalfPlane.SLAction`; real second-derivative trace on ℂ and native Möbius invariance. |
| `TauCeti/Analysis/Complex/UpperHalfPlane/PoincareMetric.lean:181` | `UpperHalfPlane.riemannianVolume_eq_volume`; actual upstairs metric/measure equality. |
| `TauCeti/Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:76`, 82 | `IsSelfAdjoint.isFormalAdjoint`, `LinearPMap.IsFormalAdjoint.im_inner_self_apply`; formal pairing, with completeness where stated. |
| `TauCeti/Analysis/PDE/EnergyForm/Sobolev.lean:372`, 600 | `TauCeti.PDE.energyFormH1`, `energyFormH1L0`; real local Sobolev energies, bounded-coefficient requirements on the H¹₀ form, not an orbifold Friedrichs realization. |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301` | `TauCeti.LSeries.wienerIkehara`; positive coefficients, actual series agreement, boundary continuity after subtracting the pole, inclusive cutoff. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:46` | `TauCeti.primeCount_univ_isEquivalent_div_log`; number-field prime ideals, specialized through ℚ. |
| `TauCeti/Analysis/InnerProductSpace/Variational/Rayleigh.lean:130` | `isLeast_rayleighQuotient` requires a real coercive form and nonzero compact inclusion; it cannot replace this complex noncompact spectral-infimum comparison. |

Searches for the three headline conclusions and the all-rank Kloosterman object found no pinned duplicate. The all-heads Lean namespace/declaration search returned only this roadmap's namespace and its three theorems. The main FuchsianOrbifolds, DifferentialGeometry and LFunctions READMEs were also read as shape/ownership examples.

**Cross-roadmap resolution.** The audit used main `fa41b37` and the supplied open-head index, with `roadmaps show`/`roadmaps grep` and direct reads of the supplied sibling checkouts. A revising pull request was not used to replace a roadmap already on main. The eight citation-tool leads were examined: the two VariationalMethods labels lead to R01; LFunctions' record and three analytic predicate declarations are in its own roadmap namespace, not the pinned libraries; its average-growth requirement is explicitly in Layer 0, although `HasAverageCoefficientBound` is not an existing Lean declaration there; and the curve trace target is in InverseGaloisAndArithmeticFundamentalGroups IG.0.T1. This resolves the mathematical average-growth input as a Layer 0 prose contract; it does not establish a compiled declaration with that name.

| Supplier | Resolved section/object and evidence |
| --- | --- |
| FuchsianOrbifolds (main) | Layers 0–3, 4 item 5, 6 item 1: effective charts, fundamental domains, cusp widths, area and modular signature. |
| DifferentialGeometry / PDE (main) | DifferentialGeometry Layer 12, README line 910; PDE Lane A at 223 and 243, Lane E at 327: volume/Green sign, Sobolev completion, local Rellich and regularity. |
| SelfAdjointSpectralTheory (main) / UnboundedOperators | SA-C and SA-E01–E13, including README lines 1190–1234; UO-A01–A03 and UO-D06 §4.7, line 512: exact domains, spectral calculus, form representation. R01 removes the false additional owner. |
| AutomorphicSpectralTheory | §§0.6–0.7 at lines 191/208; §1.16a at 1310; §§4.3–4.4 at 2337/2348, §4.6 at 2380, §4.8 at 2402, §4.14a at 2507; §7.0b at 3714 and §7.1a at 3764. The Γ₀(N) realization is extended here; finite-place LRS remains there. |
| AutomorphicFormsOnReductiveGroups / ArithmeticLocallySymmetricSpaces | AFRG §§2.5–2.7, 3.1, 3.4–3.5, 4.5 at lines 426,442,506,561,578,689; ALS.F.6 at 986 onward: local parameters/unitary dual, classical comparison, tensor factorization, Maass carrier and discrete/rapidly decreasing cusp occurrences. |
| AdelicAlgebraicGroups | §2.2 quotient integration at 1755 onward; §5.2 at 5194 onward, component distinction at 5354: actual principal stabilizers, level maps and SO(2) versus O(2). |
| SmoothRepresentationsOfLocalGroups | SR.2–SR.3 normalized induction/tempered support and SR.5.2 at 4349: segments and generalized Steinberg blocks. |
| GlobalNumberFields | Layers 6, 9, 10; Layer 9 at 508, real-shift statement at 528: norm-one compactness and unitary character/infinity-type decomposition. |
| GL2AutomorphicRepresentationsAndTransfer | R17.4.13, adjoint-lift at 2082: local adjoint, self-duality, center, cuspidal/self-twist alternatives. The numbered 13a/13b prerequisites do not make 13 absent. |
| AutomorphicLFunctionsAndLocalFactors | AL.1–AL.3; normalized products at 1988, Whittaker factorization at 2051, boundary nonvanishing at 2170, canonical RS data at 2270. Analytic local factors are not replaced by unproved ramified Weil–Deligne compatibility. |
| LFunctions / ZerosOfLFunctions | Main LFunctions Layer 0, README 346–376 and Suggested.lean 178/184/190; Zeros Layers 1 and 3 at 484 and 681: analytic data, Stirling, pole-cleared finite-function polynomial bounds. |
| DeligneWeightsAndPurity | §7.12 at 2254 and DWP.10 at 3173: compact-support weights, pure image and finite-field applications. These are not an additive-character sheaf construction. |
| EtaleCohomologyFoundations (main) | F.0–F.6 and F.10.1–F.10.2b; F.2.3 at 540 and F.4.5 at 1041: constructible/adic carriers, base change, duality, rational coefficient descent and trace. |
| ArithmeticGaloisRepresentations | §§3.1, 3.7 at 2497/2795: finite wild image, breaks/Swan, coefficient changes and the prime-to-p Artin–Schreier pole calculation. |
| InverseGaloisAndArithmeticFundamentalGroups / SchemeAndStackFoundations | IG.0.T1 at 478, finite-coefficient affine Euler formula at 6705; main SchemeAndStackFoundations §§2.11/3.2 at 3656/4673: character-cover and Riemann–Hurwitz ingredients. Rational, proper, characteristic-zero and perfect-base extensions are targets here. |
| LefschetzPencilsAndVanishingCycles | §§0.5–0.8 at 518,563,599,645: specialization triangle/sequence, inertia, trait base change and derived integral/rational passage. |
| ArithmeticDirichletSeries / AnalyticNumberTheoryPartI | Layer 6 at 256, §3.26 at 2609: inclusive-endpoint partial summation and uniform τ(n) subpower bound for n≥1. |

Ownership was also searched by object across board packages and the supplied open roadmap files. MaassForms imports this roadmap's quotient operator/cusp compactness and gap (README lines 46, 124, 569, 606 and 750). CharacterSumsOverFiniteFields expressly assigns the untwisted all-rank sum/sheaf/bound here (lines 63–66), compares its two-variable object with this one, and imports the k=2 bound (759). AutomorphicSpectralTheoryPartII line 17 imports this congruence-gap direction while developing Schwartz multipliers. The rigid-cohomology roadmap's current contracts at lines 543–544 likewise import this scalar sum and bound and retain its rigid comparison. These are consumer relationships, not additional suppliers or reasons to narrow the finite-field theorem. The separate DeligneWeightsAndPurityPartII and EtaleDualityAndPerverseSheavesPartII objects were included in the overlap search; no same-name Lean declaration or replacement of this numerical endpoint was found. Later Kloosterman moment/rigid package designs still need to route their shared scalar/sheaf prerequisites to this owner; the earlier repair's explanation that consumer edits are outside this package remains applicable and is not re-raised as a finding here.

## Not verifiable

- **`lrs95` remains uncertified, as settled by the brief and source manifest.** I did not request it again or treat older review claims as source evidence. The unavailable text prevents direct certification of Theorem 1.1 p.387; Theorem 1.2 pp.389–390; Lemma 2.1 pp.392–394; equations (3.4), (3.6)–(3.7), Lemmas 3.1–3.2 pp.395–397; equations (3.11)–(3.12) p.397; equations (3.18)–(3.20) p.398; and Proposition 3.1 pp.395–399. These cover the LRS entries in the 15-target sample and the unsampled analytic targets. The manifest's settled published DOI and the supplied readable-source cache were checked; neither supplied readable LRS text. In particular, the previously reported error in (3.12) is **not independently source-certified here**, even though the correct orthogonality coefficient is computed above.
- No other source remained inaccessible. `rs96` was obtained through the source service from the institutional manuscript URL. No source manifest or missing-reference record was changed, and no new request for a human-held text is needed.
- The build and numerical controls do not prove the admitted headlines. Availability of future supplier constructions is not claimed; the named supplier contracts are reviewed as plans, with R01–R02 recording the actual ownership defects.

## Source issues

These were checked in the readable extracted text and, for the Teschl and Katz typographical slips, against the cached page images. They do not add roadmap findings: the roadmap does not reproduce the erroneous formulas.

- **Misprint** in teschl at Theorem 2.13, equation (2.60), printed p.72 (`teschl line 2964`): the source says s corresponds to the unshifted form q while subtracting the coercive shift from its represented vector; it should be s corresponding to q+(1−γ)‖·‖²; affects the proof.
- **Misprint** in teschl at Theorem 2.13, first proof reduction, printed p.72 (`teschl line 2968`): the source says subtract γ times the norm from q; it should be subtract γ times the squared norm; affects the proof.
- **Misprint** in teschl at Theorem 2.13, coercive estimate in the proof, printed p.72 (`teschl line 2970`): the source says ‖Aψ‖²≥‖ψ‖² for the nonnegative represented operator; it should be ‖(A+1)ψ‖²≥‖ψ‖²; affects the proof.
- **Misprint** in katz-gkm at Proposition 5.2.1 proof, specialized Cartan–Leray spectral sequence, printed p.68 (`katz-gkm line 2554`): the source says the second pulled-back external factor is F again; it should be the pulled-back G; affects the proof.
- **Misprint** in katz-gkm at Proposition 5.2.1.3 proof, final specialization sequence, printed p.70 (`katz-gkm line 2631`): the source says the final generic cohomology term has coefficient F at ηx after replacing F by the constant sheaf; it should be G at ηx; affects the proof.

For the first and third Teschl slips, q=0, γ=0, ‖ψ‖=1 detects the problem immediately: the unshifted formula would select −I instead of 0, and the printed estimate would read 0≥1. With the corrected shift the represented operator is 0 and the estimate is 1≥1. The Katz corrections follow by substituting β*K=[N]*F ⊠ [N]*G and then F=1 into the preceding displayed identities; the two factors remain distinct.
