# Review of CongruenceSpectralGap (pull request #1504 at fd43f15)

**Verdict:** accepted

## R01 (P3) — Register the positivity source

**Location:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:907`, with uses at lines 110, 413 and 415; `packages/CongruenceSpectralGap/sources.toml`.

**Claim:** The reference `rs96` still has no source-manifest entry. This is previous R03, unchanged by the repair.

**Witness:** The README cites seven distinct works; the manifest contains six keys, none `rs96`. The source service again retrieved the institutional manuscript; `rs96 line 3181`, line 3254, line 3302 and line 3339 locate the argument.

**Exact repair:** Add the single key `rs96` for Rudnick–Sarnak, *Zeros of principal L-functions and random matrix theory* (1996), with the README's institutional URL, Appendix §5.2, equations (5.4)–(5.14), Lemma 5.1, manuscript pp.52–55, and the service's provenance. The repaired inventory is seven works and seven keys. Do not request `lrs95` again. No source text needs to enter the repository.

## R02 (P3) — Update the Kloosterman dependency's ownership wording

**Location:** `TauCetiRoadmap/CongruenceSpectralGap/README.md:718`: “the additive-character sheaf constructed in this subsection”.

**Claim:** This dependency still describes a local construction after the repair made that sheaf an imported input. The explicit contract and scope resolve the mathematical ownership, so this is a stale dependency description, not a remaining duplicate construction.

**Witness:** README line 128 assigns `gap:additive-character-sheaf-weight` to DeligneWeightsAndPurity; line 654 explicitly consumes it. At x=1 over 𝔽₃ the imported trace is ζ, exactly the trace needed by rank-one Kloosterman convolution.

**Exact repair:** Replace the quoted clause with “DeligneWeightsAndPurity's additive-character-sheaf-weight contract, consumed above”. Retain the separate §7.12 weight input. For k=1 the resulting dependency still gives trace ψ(r), rank one and weight zero; it simply points to the named provider.

## Previous findings

- R01 — repaired: README line 74 uses UO-D06's own coercive solution, Mathlib's real Lax–Milgram and GeneralizedCohomology G5.5-RealHilbert. The reversed VariationalMethods prerequisite is gone.
- R02 — partly repaired: All seven gap slugs now have supplier contracts and the general constructions are imported. Only line 718's stale description of a locally constructed additive sheaf remains; current R02 is nonblocking.
- R03 — not repaired: README line 907 retains `rs96`, but `packages/CongruenceSpectralGap/sources.toml` still has six entries and omits it. Current R01 records this P3 inventory issue.

## Verified sound

:robot: Independent AI incremental re-review of **80 changed lines since 4143db4**. I checked the three previous findings, every changed passage and its affected uses, all seven declared gaps, the changed part of the seeded source sample, supplier direction and ownership, and all four Lean declarations. The tables below contain **79 carried mathematical rows** from the previous review and **20 fresh rows** for the changes, their conventions and the remaining findings. Carried rows are explicitly attributed; this is not a new full review of unchanged material.

There are **zero P1/P2 findings**. Acceptance is conditional on the seven declared supplier contracts, as allowed by the brief; it does not assert those future constructions already exist. The two P3 notes do not block human final approval. The head is `fd43f1539f1d6200ca8cfcdfa6cbb1c29933decf`. The worktree is clean and the diff against `origin/main` outside this folder is empty. No pull-request file, package manifest, source manifest, merge-order file or supplier was changed.

**Gate and Lean.** The supplied gate passes, including its targeted build. I reran the gate; its text/dependency/file checks all pass:

```text
gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separately rerun targeted command `lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested` completed successfully. Direct `lake env lean` elaboration of the original file also succeeded, with only the three expected `sorry` warnings. The specified dependency command returned:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. All 34 `Needs` clauses were read. The added GeneralizedCohomology citation is an existing supplier of UO-D06, not a reverse dependency on VariationalMethods. The seven plan slugs match the seven README contracts at lines 76, 82, 88, 110, 112, 114 and 128. Each has a named supplier, explicit hypotheses and one mathematical interface. The local analytic-factor details and additive-sheaf comparisons specify these interfaces; the quotient realization, closure comparison, prime-twist assembly and convolution remain here. Existing local factors, abstract spectral decomposition and weight estimates alone do not supply the requested adapters. The contracts do not ask for another quotient Friedrichs construction or a second general spectral theorem.

**Elaborated signatures and headline coverage.** A scratch copy with `#check @name` for every declaration elaborated. `hyperKloosterman` retains arbitrary finite fields and commutative coefficient rings; its bound retains positive rank, a nontrivial complex additive character and a unit argument. The Gauss bound retains primality, nonzero odd modulus, positive rank and unit argument. The eigenvalue bound retains the actual congruence subgroup, C² regularity, invariance, boundedness, nonconstancy and the specified differential equation. No binder was lost; the signatures are unchanged and agree with the README.

The three statable headlines remain `hyperKloosterman_bound` (§4.2b), `gauss_power_even_average_bound` (§4.3), and `congruence_eigenvalue_bound` (§5.3). The docstring names the unavailable quotient-energy/Friedrichs, Rayleigh/clipping/scaling, exceptional cuspidal and adjoint, spherical parameter, twisted moment/nonvanishing/zero/kernel, principal-level comparison/compactness, and rational-adic sheaf/conductor endpoints, with their missing native carriers. The edit correctly calls local positivity/epsilon transport and the additive sheaf supplied inputs. It adds no stand-in or missing headline.

Replacing all three admissions by `simp` in a separate scratch copy left all three goals unsolved. Their definitions and signatures also exclude `rfl` or `infer_instance`; the object/name searches found no single pinned theorem with these conclusions. No padding was introduced. The file has one `import Mathlib`, one real-bodied necessary definition and three headline theorems; no sorry'd data or option overrides.

**Fresh source checks and seeded sample.** I reopened the cached Teschl and Katz passages, and fetched `rs96` through the prescribed service from its institutional URL. `teschl line 5044` and line 5053 support the operator/form Rayleigh comparison at Theorem 4.10, printed p.119; applying it on the reducing complement retains self-adjointness and nonnegativity. `rs96 line 3181`–3199 gives the supercuspidal and block factors on manuscript pp.52–53; line 3254–3269 uses unitarity to obtain the conjugate-paired product; line 3308–3347 gives the logarithmic sum of squares and coefficient nonnegativity on pp.54–55. The README preserves genericity, unitarity and ramified factors. `katz-gkm line 2266`–2306 fixes the Lang 1−Frobenius descent, geometric trace, base extension and phase addition at §4.3, pp.59–60; lines 2310–2325 give the nontrivial character's rank, Swan and weight-zero input. Moving ownership changes none of these formulas.

| Seeded target | Incremental treatment and source status |
| --- | --- |
| 0.1 Hyperbolic quotient measure | Unchanged; previous area/effective-action rows carried. Its use in §0.5a retains the scalar measure comparison. |
| 0.5b Principal-level cusp compactness | Changed route checked: finite-multiplicity escaping eigenvalues give compact shifted resolvent; quotient transport uses §0.5a. The width-dependent tail estimate is retained. `lrs95` §1 pp.389–390 remains uncertified. |
| 1.1 Exceptional cuspidal dictionary | Statement unchanged; the revised all-level comparison still supplies its constituent/eigenspace input. Previous parameter/parity computations carried; `lrs95` remains uncertified. |
| 2.0 Local self-pair positivity and analytic character transport | Changed ownership checked against `rs96` Appendix §5.2 pp.52–55 and explicit contracts. Primitive-twist formulas retain the uncertified `lrs95` Lemma 2.1 locator. |
| 2.2 Archimedean trivial zero | Unchanged; the analytic adapter is now imported. Pole/zero computation carried; `lrs95` Lemma 2.1 pp.392–394 uncertified. |
| 3.1 Mellin cutoff kernel | Unchanged; prior Mellin-mass, support and contour-normalization computations carried. `lrs95` (3.6), pp.395–396 uncertified. |
| 3.3 Mellin cutoff estimates | Unchanged; revised analytic record supplies the same finite-function hypotheses. Prior pole-collision and integrability rows carried. `lrs95` Lemma 3.1 pp.395–397 uncertified. |
| 4.1 Even prime-twist average | Unchanged; previous small-prime/indexing row carried. `lrs95` (3.4), Proposition 3.1 p.395 uncertified. |
| 4.2 Even nonprincipal orthogonality | Unchanged; previous explicit residue values carried. `lrs95` (3.11)–(3.12) p.397 uncertified. |
| 4.2b Kloosterman sheaves and the general Deligne estimate | Changed additive-sheaf input checked against Katz §4.3 pp.59–60. The convolution and all-rank bound are unchanged; their previous rank/Swan/sign/finite-field rows are carried. |
| 4.3 Gauss-power average | Unchanged; previous exact q=3,5 identities and bound rows carried. `lrs95` (3.18)–(3.20) p.398 uncertified. |
| 4.4 Prime-twist average asymptotic | Unchanged; previous balanced exponents and 3/4 main-term calculation carried. `lrs95` Proposition 3.1 pp.395–399 uncertified. |
| 4.5 Twisted Rankin–Selberg nonvanishing | Unchanged; previous strict-threshold and nonzero-complex-sum witnesses carried. `lrs95` Proposition 3.1/proof of Theorem 1.2 p.395 uncertified. |
| 5.1 Luo–Rudnick–Sarnak parameter bound | Unchanged; previous weak-endpoint arithmetic carried. `lrs95` Theorem 1.2 pp.389–390 uncertified. |
| 5.2 Exceptional eigenvalue arithmetic | Unchanged; previous GL₃ parameter calculation gives r≤1/5 and 1/4−r²≥21/100. `lrs95` §1 pp.389–390 uncertified. |

**Fresh adversarial computations.** Finite-dimensional spectral models test the statements' domains and normalization; they are not asserted to be actual automorphic spectra. Here ζ=exp(2πi/3).

| Changed statement or affected interface | Instances tried and values on both sides | Result / change |
| --- | --- | --- |
| UO-D06 prerequisite, README 74 | q(u,v)=2conj(u)v: ℓ(v)=v gives u=1/2 and q(u,v)=v; ℓ(v)=iv gives u=−i/2 and q(u,v)=iv. Real restriction plus the i-test recovers both components. | Scalar convention correct; provider is UO-D06. |
| GeneralizedCohomology complexification, README 74 | z=1+2i has norm²=1+4=5; Jz=1−2i also has norm²=5; Jz=z forces imaginary part 0. Zero space has both sides 0. | Correct Hilbert norm and fixed-real-subspace input. |
| form-rayleigh-core, README 76/0.4 | A=diag(0,21/100,1/4), removing the first coordinate: operator, form and spectral infima all 21/100. At 2ie₂ the quotient is (21/25)/4=21/100. | Imported theorem specializes correctly; full-space infimum would be 0. |
| Spectral-truncation route, 0.4 | On ℓ², Aeₙ=neₙ, n≥1, take uₙ=n^(−3/2). Form sum Σ1/n² converges; operator sum Σ1/n diverges. Truncation tail in squared form norm is Σₙ>R(1/n³+1/n²)≤1/(2R²)+1/R, giving bounds 3/2,5/8,21/200 at R=1,2,10. | Form core does not incorrectly identify the two domains. |
| all-level-spectral-realization, README 82 | N=1 gives one component/cusp; N=2 gives one component and three cusps. Continuous fibre values at t=0,1 are 1/4,5/4; residual determinant characters have Casimir 0. | Threshold and channel convention retained. |
| Principal-level residual restriction, 0.6 | N=5 has φ(5)=4 component constants in the adelic sum; a single classical component has one. Removing the entire residual summand before restriction removes eigenvalue 0 in either description. | No constants-only claim on the unreduced four-component space. |
| principal-level-classical-constituents, README 88/0.5a | With c_N=4 and classical area V, input constant 1 has norm²=4V; multiplied restriction 2 has classical norm²=4V. Unscaled restriction has V. | Scalar normalization remains explicit. |
| Principal-level equivariance, 0.5a | N=5, determinant 2 sends point label 1 to 2, but function support from 1 to 2⁻¹=3. Thus R(k)P₁=P₃R(k), not P₂R(k). | Right-action convention survives the ownership move. |
| Casimir/closure comparison, 0.5a | Local 1 and y² have both Casimir and positive Laplacian values 0 and −2y². Opposite sign gives +2y². | Local expression agrees; actual closure still uses §0.2. |
| Cuspidal compact resolvent, 0.5b | Model λₙ=n has (A+1)⁻¹ eigenvalues 1/2,1/3,…,1/11,…→0. Infinite multiplicity at λ=1 instead gives 1/2 indefinitely. | Finite multiplicity and escape hypotheses are sufficient and discriminating. |
| Geometric cusp tail, 0.5b | Frequency one at width w has horizontal energy factor (2π/w)². Multiplying by (w/(2πR))² gives 1/R²; y⁻²≤R⁻² bounds the mass. Widths 1,3 give constants 1/(4π²R²),9/(4π²R²). Zero mode gives energy 0 but positive mass. | Geometric estimate retained with its cuspidality hypothesis. |
| all-prime positivity, README 110/2.0 | Ramified rank-one self-pair: coefficients at 1,p,p² are 1,1,1; logarithm coefficients at T,T² are 1,1/2. Deleting the factor gives 1,0,0. | One supplier now provides the full coefficients. |
| Block/logarithm formula, 2.0 | e=2 gives coefficients 1,0,1. Steinberg length two, p=2,e=1 gives log coefficients 3/2,5/8; exponentiation gives linear 3/2 and quadratic 5/8+(3/2)²/2=7/4. | Matches the supplied product (1−T)⁻¹(1−T/2)⁻¹. |
| Character transport, README 112/2.0 | η(p)=−1 changes (1−T)⁻¹ to (1+T)⁻¹, coefficient 1→−1; conductor exponent 2 gives multiplier 1. At m=2, α=(2,3) gives ratios 1,2/3,3/2,1 with product 1. | General ramified transport and m² exponent unchanged. |
| finite-rs-polynomial-strips, README 114/2.1 | f=4,q=5,m=2: conductor 2500, epsilon numerator norm 50, normalized root norm 50/√2500=1. For μ=±1/5 the smallest gamma argument on Re s=1 has real part 3/5>0. | Adapter normalization and boundary regularity agree. |
| Additive-character contract, README 128/4.2b | Over 𝔽₃, trace at 0 is 1 and at 1 is ζ; inverse convention gives ζ²≠ζ. Over 𝔽₉, Tr(1)=2 and trace ζ². Both have norm 1. | Geometric Frobenius, base extension and weight zero retained. |
| Additive phases/unit/duality, 4.2b | Over 𝔽₃, phases 1+1 give ζ·ζ=ζ², and inverse characters give ζ·ζ⁻¹=1. Over 𝔽₂ the nontrivial character has trace −1 and Swan 1; its square has trace 1 and Swan 0. | Trivial character and phase comparisons are explicit supplier API. |
| Kloosterman realization with supplied sheaf, 4.2b | k=1,r=1 over 𝔽₃ gives trace ζ and norm 1, weight 0. k=2,r=1 has raw sum ζ+ζ²=−1 and sheaf trace (−1)(−1)=1, rank 2 and weight 1. | Mathematical input unchanged; R02 fixes the stale dependency wording. |
| Previous ownership finding | Seven plan slugs and seven named README gap contracts; the four disputed general constructions now have four supplier owners, instead of four supplier plus four local assignments. | Blocking duplication repaired; local specialization remains. |
| Source inventory, current R01 | README=7 works, manifest=6 keys; adding rs96 makes 7=7. | Previous P3 remains; registration is the repair. |

**Carried adversarial rows.** These are the previous report's numerical tests, carried without claiming to have recomputed every unchanged target. Formulas whose ownership changed retain these values and also have fresh rows above. Old references to ownership R02 in this carried table refer to the previous review; their blocking concern is resolved as explained above.

[previous]: packages/CongruenceSpectralGap/reports/PRREVIEW-CongruenceSpectralGap~1.md

| Statement | Instances and computed sides | Result / change |
| --- | --- | --- |
| Conventions; 0.1 effective area | Signature `(0;2,3;1 cusp)` gives `2π(−2+1+1/2+2/3)=π/3`; projective index 6 at Γ(2) gives `6π/3=2π`. | Counts the ineffective ±I once; keep.  [Previous review][previous]. |
| 0.1 finite measure/nonzero level | Γ(1) mass `π/3>0`; Γ(2) mass `2π>0`. Γ(0) is the identity subgroup and has infinite-area quotient. | N≠0 is necessary; keep.  [Previous review][previous]. |
| 0.2 positive expression | `Δ1=0`; `Δy²=−2y²`; `s=1/2+it` gives `s(1−s)=1/4+t²`. Opposite div-grad sign gives `+2y²`. | Sign is fixed; y² is only a local test.  [Previous review][previous]. |
| 0.2 closed realization/cover | N=1,2 give torsion-free cover levels 3,6. For a cusp cutoff beyond R, lost constant L² mass is proportional to `w/R` and cutoff energy to `w/R`, both →0. | Constants survive the form closure; no artificial Dirichlet condition at infinity.  [Previous review][previous]. |
| 0.2 nonzero operator | A smooth compactly supported nonconstant bump in a free chart has `∫\|∇u\|²>0`; the zero operator would give 0. | Excludes the trivial realization; keep.  [Previous review][previous]. |
| 0.3 complex mean zero | With total mass V, integrals of 1 and i are `V` and `iV`, both nonzero. For `v−(∫v)/V`, integral is `∫v−∫v=0`. | Real-part-only integral kernel would wrongly retain i; keep.  [Previous review][previous]. |
| 0.3 integral bound | Constant c gives `\|∫c\|=\|c\|V=√V·(\|c\|√V)`; a zero-integral bump gives left side 0 and positive norm. | Bound and nonzero complement tested; keep.  [Previous review][previous]. |
| 0.4 Rayleigh definition | `A=diag(0,.21,.25)`: at e₂, numerator/denominator `.21/1`; at 2ie₂, `.84/4`; both `.21`. Norm-only denominator gives `.84/2=.42`. | Correct square and complex scaling.  [Previous review][previous]. |
| 0.4 infima/core | Same model: full infimum 0, constant-complement infimum `.21`; form and operator domains coincide. Spectral truncation of e₂ is 0 for R<.21 and e₂ for R≥.21. | Projection and discarded-energy formulas agree; keep.  [Previous review][previous]. |
| 0.5 clipped infimum | Small sets `∅`, `{.21}`, `{1/3}` give infima `.25`, `.21`, `.25` after adjoining .25. | Empty case and clipping work; keep.  [Previous review][previous]. |
| 0.5 lower-bound guard | For `S={−n:n∈ℕ}`, no real lower bound exists. The real complete-lattice infimum API cannot imply a member bound from this set. | Existing bounded-below premise retained.  [Previous review][previous]. |
| 0.5a measure isometry | If a component carries `c_N dA`, constant 1 has squared norm `c_N V`; its image √c_N has squared norm `c_N V`. Unscaled identity gives V. | Normalizing factor necessary.  [Previous review][previous]. |
| 0.5a components/right action | N=3: SO(2) gives 2 components, O(2) gives 1. N=5, determinant 2: a vector supported at component 1 moves to `2⁻¹=3`, not 2. | Matches right-translation convention and supplier.  [Previous review][previous]. |
| 0.5a level-changing maps | Conjugating `[[1,1],[0,1]]` by `diag(p,1)⁻¹` and `diag(p,1)` gives upper-right `1/p`; it is not integral. | Arbitrary adelic right translation is not a fixed-level action.  [Previous review][previous]. |
| 0.5b cusp tail | Widths 1 and 3 give constants `1/(4π²R²)` and `9/(4π²R²)`. A frequency-one mode has `\|∂x u\|²=(2π/w)²\|u\|²`, and `y⁻²≤R⁻²`. | Both sides yield the stated bound; width cannot be suppressed.  [Previous review][previous]. |
| 0.5b zero-mode exclusion | A nonzero x-constant cusp tail has positive `∫\|u\|²/y²` but `∫\|∂x u\|²=0`. | Cuspidality is essential; keep.  [Previous review][previous]. |
| 0.6 spectral channels | Γ(1) has 1 cusp/channel, Γ(2) has 3. At t=0 and 1, continuous eigenvalues are `.25` and `1.25`. | Not a universal one-channel expansion.  [Previous review][previous]. |
| 0.6 residual removal | Classical constant has eigenvalue 0; removing its line removes that value. On the full principal adelic sum, componentwise constants have dimension `φ(N)`; for N=5 this is 4, not 1. | Component restriction is necessary and present.  [Previous review][previous]. |
| 0.7 spectral/clipped equality | No exceptional eigenvalues: both bottoms `.25`. Adding a discrete eigenvalue `.21`: both `.21`. Keeping the constant eigenvalue would give 0 instead. | Comparison has the right complement.  [Previous review][previous]. |
| 1.1 exceptional parameter | r=0,.2,.5 give λ=.25,.21,0. The open exceptional range excludes both endpoints; either common sign parity leaves `1/4−r²` unchanged. | Correct range and parity.  [Previous review][previous]. |
| 1.2 unitary monomial branch | An inducing norm shift σ contributes central modulus exponent 2σ. At norm 2 and σ=1 it has modulus 4, versus unitary modulus 1; σ=0 gives 1. | Real shift must vanish; keep the unitary hypothesis.  [Previous review][previous]. |
| 1.2 archimedean temperance | A unitary character takes values of norm 1. A two-dimensional induced parameter then has bounded diagonal values; `diag(2,1/2)` would be unbounded under powers. | Unitary induction excludes the wrong complementary model.  [Previous review][previous]. |
| 1.3 adjoint normalization | Diagonal characters a=2,b=3 yield adjoint weights `2/3,1,3/2`, product 1. Raw symmetric square gives `4,6,9`, product 216. | The central-character inverse is indispensable.  [Previous review][previous]. |
| 1.3 exceptional lift | r=.2 gives `{.4,0,−.4}`. Common sign squared is 1; determinant twist cancels the remaining common central factor. | Spherical GL₃ specialization agrees.  [Previous review][previous]. |
| 2.0 ramified positivity | Ramified unitary rank one paired with its inverse: `(1−T)⁻¹` has coefficients `1,1,1`; deleting its ramified factor gives `1,0,0`. | General all-prime target necessary; ownership R02.  [Previous review][previous]. |
| 2.0 supercuspidal/logarithm | e=2 gives coefficients `1,0,1`; log coefficients at T,T² are `0,1`. e=1 gives log coefficients `1,1/2`, exponentiating to coefficients `1,1`. | Nonnegative, not strictly positive in every degree.  [Previous review][previous]. |
| 2.0 Steinberg blocks | n=2,e=1,p=2 gives factor `(1−T)⁻¹(1−T/2)⁻¹`: linear coefficient 3/2, quadratic 7/4; log coefficients 3/2,5/8. `5/8+(3/2)²/2=7/4`. | Shift/product and logarithmic normalization agree.  [Previous review][previous]. |
| 2.0 character transport | η(p)=−1 sends `(1−T)⁻¹` to `(1+T)⁻¹`; linear coefficient `1→−1`. Conductor exponent 2 gives epsilon multiplier `(-1)²=1`. | Includes ramified pairs; ownership R02.  [Previous review][previous]. |
| 2.0 primitive-twist epsilon | m=2 ratios are `1,a/b,b/a,1`, product 1. At s=1/2, `\|τ\|⁴q⁻²=q²/q²=1`; m=1 gives `√q/√q=1`. | Degree is m², not m.  [Previous review][previous]. |
| 2.1 functional equation normalization | f=4,q=5,m=2: total conductor `4·5⁴=2500`, epsilon numerator norm `2·25=50`, normalized norm `50/√2500=1`. Dropping √f gives 1/2. | Correct unit root number.  [Previous review][previous]. |
| 2.1 gamma/analytic adapter | μ=±.2 gives self-pair shifts `.4,0,0,−.4`; at Re s=1, smallest argument real part `.6>0`. Thus no gamma pole appears on the boundary. | Finite-function continuation is justified separately; ownership R02.  [Previous review][previous]. |
| 2.1 excluded twist cases | A nonprincipal primitive twist at unramified q changes inertia from trivial to χ≠1; a norm twist is inertia-trivial. Odd χ has sign −1 at infinity versus +1 for even χ. | Entireness argument and unchanged gamma factor use real hypotheses.  [Previous review][previous]. |
| 2.2 forced zero | At β₀=.4, the maximal diagonal gamma argument is `.4−.4=0`; its meromorphic pole must be cancelled by a zero of Lχ. Lean Γℝ(0)=0 but punctured `sΓℝ(s)→2`. | No division by a totalized pole value.  [Previous review][previous]. |
| 3.1 cutoff tail | Normalized bump supported in [1,2]: F₁(.5)=1, F₁(3)=0. Multiplying the bump by 2 gives values 2,0 and Mellin mass 2. | Normalization fixes the kernel.  [Previous review][previous]. |
| 3.1 Mellin normalization | For the indicator of [1,2], the logarithmic integral is log 2, not its dx-integral 1. Inversion's contour factor `(2πi)⁻¹·i=(2π)⁻¹`. | Rejects wrong measure and missing i. Indicator is only a measure-normalization control.  [Previous review][previous]. |
| 3.2 dual kernel | G=1, normalized bump in [3,4]: at x=.2 and 2, reflected tails give 1 and 0. G=0 gives 0. | Inversion is at 1/x.  [Previous review][previous]. |
| 3.2 differential sign | G(w)=w gives `βF₁(reflected φ,x)−φ(1/x)`; writing the reflected tail as T and φ(1/x)=a≠0 gives βT−a versus the wrong βT+a, a difference of 2a. | Minus sign from integration by parts retained.  [Previous review][previous]. |
| 3.3 pole collision | d=4 and collision with 1/s permit pole order 5, hence log power 4. For ε>0, `x^ε(log(1/x))⁴→0`. | An ε-loss absorbs collisions; no unsupported simple-pole claim.  [Previous review][previous]. |
| 3.3 small-x integrability | σ=.5,β₀=.4,ε′=.1: the singular exponent in F₂ is 0, so weighted integrand exponent is −.5 and integral on (0,1) is 2. At β₀+ε′=1 it becomes exponent −1 and diverges. | Strict choice ε′<1−β₀ matters.  [Previous review][previous]. |
| 3.4 two-kernel equation | β=.5 gives both coefficient powers `n⁻.5`. Replacing Y by 2Y doubles the dual argument `nY/(fq^d)` and halves the primal argument `n/Y`. | Correct reciprocal scale; no arbitrary-function stand-in.  [Previous review][previous]. |
| 4.1 finite average | L≡1,fπ=1: Q=0,1,2 give 0 terms; Q=3 gives q=5 and one even nonprincipal character, total 1. Taking fπ=5 removes it, giving 0. | Indexing and bad-prime filter verified.  [Previous review][previous]. |
| 4.2 even orthogonality | q=5, residues 0,1,2,3,4 give `0,1,−1,−1,1`. q=3 has no even nonprincipal character, giving 0 on every residue. | Principal subtraction at ±1 is required.  [Previous review][previous]. |
| 4.2 main n=1 coefficient | q=5 gives `(q−1)/2−1=1`; omitting the principal subtraction gives 2. | README formula passes; unread LRS source not certified.  [Previous review][previous]. |
| 4.2a rank zero/one | F₃,k=0: r=1 gives 1, r=2 gives 0. k=1 gives ψ(r), norm 1 for the standard complex character. | Empty product is handled; bound only claims positive rank.  [Previous review][previous]. |
| 4.2a coefficient ring/transport | In F₃,k=2,r=2 the raw sum is 2; reduction of the analogous integer-valued trivial-character sum 2 modulo 2 is 0. In the zero coefficient ring every sum is 0=1. | Raw construction permits general commutative coefficients; complex bound does not.  [Previous review][previous]. |
| 4.2a additive scaling | Substitute each variable by axᵢ: product changes by a^k. F₃,a=−1,k=2 gives a²r=r and the same values −1,2. k=1 sends ψ(r) to ψ(−r). | Correct direction of the parameter change.  [Previous review][previous]. |
| 4.2a eliminated-variable comparison | F₃,k=2,r=1: two tuples `(1,1),(2,2)` give `ζ²+ζ=−1`; eliminating the last variable gives the same two terms. r=2 gives `1+1=2`. | General comparison agrees in a nontrivial case.  [Previous review][previous]. |
| 4.2b additive sheaf | F₃ standard ψ: trace at 1 is ζ, inverse convention gives ζ²≠ζ. Over F₉, trace of 1 is 2, hence ψ(Tr 1)=ζ². | Geometric Frobenius/extension convention fixed; ownership R02.  [Previous review][previous]. |
| 4.2b tensor phases | In characteristic 2 the character sheaf for x tensored with itself has phase 2x=0, trace 1 and Swan 0; each original has Swan 1 at infinity. | Tensor-phase addition, not Swan addition for tensor products.  [Previous review][previous]. |
| 4.2b Euler–Poincaré, tame/proper | Constant rank r on Gₘ: χc=0=r·(2−2). On P¹: χc=2r=r·2. Nontrivial tame rank-one Kummer sheaf on Gₘ has Hc dimensions 0,0,0; constant sheaf has 0,1,1. | Covers empty boundary and characteristic zero; equal Euler characteristic does not identify sheaves.  [Previous review][previous]. |
| 4.2b Euler–Poincaré, wild | On A¹, phase x has Swan 1: χc=1−1=0. Phase x² in odd characteristic has Swan 2: χc=1−2=−1. | Rank alone cannot determine compact cohomology.  [Previous review][previous]. |
| 4.2b perfect-base degrees | Over F₃, remove the degree-two point x²+1=0 and use phase 1/(x²+1): total Swan `2·1=2`, χc=`0−2=−2`. After geometric splitting the two contributions are `1+1=2`. | Residue degrees are necessary.  [Previous review][previous]. |
| 4.2b geometric components | P¹ over Fq² regarded over Fq has two geometric components; χc=4, not 2. | Geometrically connected hypothesis or component sum retained.  [Previous review][previous]. |
| 4.2b Swan-constancy criterion | Family Lψ(tx) on A¹: generic boundary conductor `Swan+rank=2`, special conductor 1; Hc² ranks `0→1`. Constant P¹ family with empty boundary has conductor 0 and ranks `1,0,1`. | Tests jumping and empty boundary cases.  [Previous review][previous]. |
| 4.2b boundary rank term | Boundary x²=t in odd characteristic has 2 geometric points generically and 1 at t=0. For the constant sheaf χc changes `2−2=0` to `2−1=1`, although Swan sums are both 0. | Must retain boundary rank term unless point count is fixed.  [Previous review][previous]. |
| 4.2b properness | A constant sheaf on a smooth nonproper family missing an entire special fibre can have compact-support top rank `1→0`; a proper constant P¹ family has rank 1 on every fibre. | ULA and the proper direct-image conclusion are not conflated.  [Previous review][previous]. |
| 4.2b rational coefficients | For a finite wild p-group, p is a unit in ℓ-adic coefficients (ℓ≠p), so invariant-projector denominators remain invertible after reduction. A nodal-loop monodromy multiplication by ℓ sends lattice ℓ^a to ℓ^(a+1)≠ℓ^a. | No unjustified global stable lattice on an arbitrary base.  [Previous review][previous]. |
| 4.2b convolution rank/Swan | Ranks/Swan `(2,1)` and `(3,1)` give rank `2·1+3·1=5`, Swan `1·1=1`; fibre boundary Swans 2 and 3 give χc=−5. Product-rank guess would give 6. | General convolution formula discriminated.  [Previous review][previous]. |
| 4.2b convolution iteration/purity | Kl₁*Kl₁ gives rank 2, Swan 1, weight `0+0+1=1`; Kl₂*Kl₁ gives rank 3, Swan 1, weight 2. | Induction agrees with rank k and weight k−1.  [Previous review][previous]. |
| 4.2b Kummer descent | p=2,N=3, coefficient field F₃: 1/N is undefined. Cartan–Leray remains available; an averaging proof would divide by 0. | Route retains the non-semisimple coefficient case.  [Previous review][previous]. |
| 4.2b wild/unipotent control | For N²=0 in characteristic 3, `(1+N)²=1+2N`; an element of order dividing 2 forces N=0. In characteristic 2, `(1+N)³=1+N`; order dividing 3 again forces N=0. | Finite wild p-image plus unipotence gives triviality for p≠ℓ.  [Previous review][previous]. |
| 4.2b trace sign | F₃,k=2,r=1 raw sum −1, sheaf trace +1. F₂,k=2 raw sum +1, trace −1. | Factor `(−1)^(k−1)` is required.  [Previous review][previous]. |
| `hyperKloosterman_bound` | F₂,k=1,2: norms 1≤1 and 1≤2√2. F₄,k=1,2,3: value lists `(1,−1,−1)`, `(3,−1,−1)`, `(5,−3,−3)`; maxima `1≤1,3≤4,5≤12`. | Includes p dividing k; keep.  [Previous review][previous]. |
| Same, nontriviality guard | Trivial ψ on F₅,k=3 gives `(5−1)²=16`, exceeding proposed bound `3·5=15`. | hψ is essential.  [Previous review][previous]. |
| 4.3 Gauss identity | q=3,r=1: k=1 gives `0=−1−(−1)`; k=2 gives `0=(−1+2)−1`. q=5,k=2,r=1 and 2 give `5=5` and `−5=−5`. | Both exact identity and conjugate-character direction agree.  [Previous review][previous]. |
| `gauss_power_even_average_bound` | q=5,k=2 gives norm 5≤`8√5+1`; q=3 gives 0≤`4√3+1`. At k=0,q=7,r=1, left side 2 would exceed right side 1. | Positive-rank hypothesis prevents a false extension.  [Previous review][previous]. |
| 4.4 balanced errors | d=4,Y=Q^(5/2): primal exponent `1+(5/2)(1−σ)` equals dual exponent `1+5/2−(5/2)σ`. At σ=.9 both are 1.25. | Scale and both sides match.  [Previous review][previous]. |
| 4.4 prime main term | Sum of primes in (Q,2Q] has leading coefficient `(4−1)/2=3/2`; multiplying by 1/2 gives 3/4. | No missing dyadic factor.  [Previous review][previous]. |
| 4.4 divisor boundary | n=1 gives n−1=0, divisible by every prime, unlike τ(n) for n≥1. n=2 gives n−1=1 and τ(1)=1. | Main n=1 term must be split off, as it is.  [Previous review][previous]. |
| 4.5 strict nonvanishing region | d=9: σ=.8 gives error exponent 2, σ=.9 gives 1.5. Q² cannot be dismissed against Q²/log Q; Q^1.5 can. | Strict σ>1−2/(d+1) is correct.  [Previous review][previous]. |
| 4.5 complex finite sum | Terms `1+i` and `−1` sum to i≠0, so some term is nonzero although no positivity argument applies. | Correct quantifier: at least one twist per sufficiently large dyadic interval.  [Previous review][previous]. |
| 5.1 parameter endpoint | m=2 gives `1/2−1/5=.3`; m=3 gives `1/2−1/10=.4`. β₀=2·.4=.8 is the boundary, outside the strict contradictory nonvanishing range. | Weak ≤ endpoint is correct.  [Previous review][previous]. |
| 5.2 exceptional arithmetic | r=0,.2 give λ=.25,.21; r=.3 gives .16 and violates `2r≤.4`. Without r≥0, r=−1 satisfies `2r≤.4` but λ=−.75. | Both hypotheses needed; exact 21/100.  [Previous review][previous]. |
| 5.3 clipped gap | Empty small spectrum gives `.25≥.21`; extremal r=.2 gives `.21=.21`; gain over 3/16 is `21/100−3/16=9/400`. | No assumed exceptional eigenvalue.  [Previous review][previous]. |
| `congruence_eigenvalue_bound`, nonconstancy | u≡1 has λ=0, C², invariance and bound 1, but no pair of points with different values. Removing hnc would assert `.21≤0`. | Nonconstancy carried explicitly.  [Previous review][previous]. |
| Same, congruence | Identity subgroup, u(z)=exp(iz): norm `exp(−y)≤1`, Euclidean Laplacian 0, λ=0, nonconstant. Identity subgroup contains no Γ(N), N≠0. | Native group hypothesis excludes this counterexample.  [Previous review][previous]. |
| Same, domain/mean zero route | For nonzero λ, pairing with 1 gives `λ∫u=0`, hence ∫u=0; Rayleigh numerator is `λ‖u‖²`, quotient λ. For λ=0, energy 0 forces the constant case. | The headline is connected to the roadmap's quotient objects.  [Previous review][previous]. |
| 5.4 form inequality | u=0 gives `0≤0`. Unit e₂ in the model gives `.21=.21`; 2ie₂ gives `.84=.21·4`. Constant 1 gives energy 0 but right side `.21V>0`. | Mean-zero and zero-vector cases consistent.  [Previous review][previous]. |
| 5.5 curvature scaling | κ=4: measure/norm-square divide by 4, energy stays fixed, Rayleigh `.21/(1/4)=.84=21/25`, continuous threshold 1. | Matches κλ and κ/4; κ>0 prevents degenerate metric.  [Previous review][previous]. |

**Pinned-library and ownership checks.** The manifest still pins Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newly cited Mathlib inputs and the native carriers used by the unchanged headlines were opened at those pins:

| Pinned file and line | Declaration and actual boundary |
| --- | --- |
| `Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean:105` | `IsCoercive.continuousLinearEquivOfBilin`: bounded coercive real bilinear form on a complete real Hilbert space. This supplies the real input, not a pre-existing complex form representation theorem. |
| `Mathlib/Analysis/InnerProductSpace/Basic.lean:956` | `InnerProductSpace.rclikeToReal`, with `Inner.rclikeToReal` at line 944: real inner product is the real part of the original one. It is an explicit structure, not a globally registered instance. |
| `TauCeti/Analysis/InnerProductSpace/Variational/Rayleigh.lean:130` | `isLeast_rayleighQuotient`: real coercive form, compact nonzero inclusion, attained minimum. It does not supply the complex noncompact spectral-infimum/form-core contract. |
| `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:163` | `CongruenceSubgroup.IsCongruenceSubgroup` means existence of a nonzero N with Γ(N)≤Γ. It excludes the infinite-area identity subgroup used in the negative control. |
| `Mathlib/NumberTheory/GaussSum.lean:72` | `gaussSum`: the raw finite sum of multiplicative character times additive character; no division by √q. |
| `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83` | `ZMod.stdAddChar`: positive exponential; `ZMod.isPrimitive_stdAddChar` at line 96 retains `NeZero N`. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138` | `InnerProductSpace.instLaplacian`: real second-derivative contraction, so the hyperbolic operator requires the displayed factor −y². |

Searches at the pins found no native `hyperKloosterman`, `MaassCuspForm`, additive-character sheaf or `AnalyticLFunctionData` replacing these interfaces. The previous review's broader object audit is carried for unchanged objects. The current `roadmaps grep` search for the three headline names found their declarations only in this roadmap; CharacterSumsOverFiniteFields and MaassForms mention them as imports in docstrings. The changed ownership objects were also searched across main/open heads and the relevant board supplier packages. The real compact variational result, weight estimates and finite-coefficient Artin–Schreier torsor are distinguished from the general contracts, rather than planned a second time.

**Cross-roadmap resolution.** The supplied citation report checks main `fa41b37` and the open-head index; its five unresolved Lean-name leads are roadmap declarations, not claims about compiled library declarations. I reopened `TauCetiRoadmap/LFunctions/Suggested.lean:117`, 178, 184 and 190 for the analytic record and its three predicates, and `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:477` for IG.0.T1's curve trace target. The average coefficient condition is prose in LFunctions Layer 0, `TauCetiRoadmap/LFunctions/README.md:374`. These resolve all five leads. A fresh resolver run again reports no missing cross-roadmap citation; its explicit limitation that it did not inspect pinned packages is covered by the manual pin reads above and the supplied pin-aware report, not treated as a library search result.

The following supplier passages were independently reopened for the repairs. Roadmap text remains planned input, not compiled library code.

| Supplier | Passage resolved and effect on the changes |
| --- | --- |
| UnboundedOperators | `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:512`, UO-D06: owns the coercive solution at line 523 and complexification comparison at line 542; UO-A01–A03 supply its spectral calculus. This is the correct direction for README line 74. |
| VariationalMethods | `TauCetiRoadmap/VariationalMethods/README.md:45` and 499: explicitly consumes UO-D06, including its scalar-generic coercive solution. The removed prerequisite is not reinstated. |
| GeneralizedCohomology, main | `TauCetiRoadmap/GeneralizedCohomology/README.md:1939`, G5.5-RealHilbert: Hilbert complexification, isometric inclusion and conjugation, with norm √(‖x‖²+‖y‖²), distinct from the native Taylor norm. |
| AutomorphicSpectralTheory | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2337`, §§4.3–4.4; §4.8 at 2402 and §4.14a at 2507: orthosum, residual construction, level-one expansion and number-field residual blocks. These are the base for the explicit all-level spectral gap contract, not evidence that its full principal-level assertion is already supplied. |
| AutomorphicFormsOnReductiveGroups | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:506`, §3.1; §4.5 at 689: smooth component restriction and all-congruence Maass carrier, but only level-one adelic eigenspace comparison. The declared principal-level L² contract supplies the additional completion and equivariance. |
| AdelicAlgebraicGroups | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:5194`, §5.2, including SO(2)/O(2) distinction at 5354: principal stabilizers, component indexing and level changes. README §0.5a preserves the inverse determinant action on function support. |
| AutomorphicLFunctionsAndLocalFactors | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1988`, AL.3.3.1; local functional equation at 2000; global Whittaker factorization at 2051; niceness/data at 2260–2270. Analytic factors, genericity and completed strip bounds are base inputs; the declared gaps add all-prime positivity, character transport and the finite-function analytic-record adapter. |
| LFunctions, main | `TauCetiRoadmap/LFunctions/README.md:346`–376 and `TauCetiRoadmap/LFunctions/Suggested.lean:117`, 178, 184, 190: record, dual and analytic predicates. No nonexistent average-bound declaration name is asserted. |
| ZerosOfLFunctions | `TauCetiRoadmap/ZerosOfLFunctions/README.md:681`, Layer 3, especially item 3: polynomial bounds concern the pole-cleared finite function, not the completed function divided by gamma. The imported adapter states the required hypotheses. |
| DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2254`, §7.12: cohomological weight bounds; the explicitly declared additive-character contract supplies the global sheaf. Katz's rank-one construction is not confused with the general weight theorem. |
| InverseGaloisAndArithmeticFundamentalGroups | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:477`, IG.0.T1: the roadmap-owned curve trace target resolves the citation lead. Its existing finite-coefficient Euler formula remains distinct from the unchanged rational-adic extension here. |

The main GeneralizedCohomology and LFunctions texts were also consulted for roadmap shape. The revised README keeps its scope, conventions, exact contracts, ordered layers, prose APIs, Checks, examples and references. It adds no definition without an API or Checks. The remaining substantive constructions retain general ramified/all-level/all-finite-field scope. No computation replaces a mathematical development, and no source passage or suspicious instruction was copied into the review or roadmap.

Ownership against the supplied open work was checked by the prescribed object searches and direct reads of the affected consumers. `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:63` assigns the untwisted all-rank sum, sheaf and bound to this roadmap; `TauCetiRoadmap/MaassForms/README.md:124`, 569 and 606 consumes its quotient operator and compactness. The searches included AutomorphicLFunctionsAndLocalFactorsPartII, DeligneWeightsAndPurityPartII and AutomorphicSpectralTheoryPartII. No new competing construction of the moved inputs was identified. Later consumers do not become suppliers, and the previously settled request to edit their packages is not re-raised.

## Not verifiable

- `lrs95` is still **uncertified**, as explicitly settled in the brief and source manifest. I did not request it again. The changed uses retain Lemma 2.1, pp.392–394, and §1, pp.389–390; the remaining seeded targets retain their locators as listed above. Their source contents are not independently certified by numerical checks or the previous report.
- All other source passages needed for the incremental changes were legally readable. `rs96` was retrieved through the source service, but its successful retrieval does not repair the missing manifest entry. No new missing-reference request is needed.
- The build tests elaboration, not the truth of the three admitted headlines. The 79 carried numerical rows and unchanged source/ownership material remain evidence from the previous review, explicitly attributed rather than presented as a second full audit. The seven declared supplier gaps remain future mathematical contracts.

## Source issues

- none

No new source mistake was identified in the changed-passage checks. The previous report's Teschl and Katz errata concern unchanged passages and are not claimed to have been reverified in this incremental review.
