# Review of LinearFormsInLogarithms (pull request #451 at 768487d)

**Verdict:** needs changes

## R01 (P2) — State characteristic zero in the Hermite interpolation target

**Location:** TauCetiRoadmap/LinearFormsInLogarithms/README.md:1143–1146, §8.5: “For points `σ i` of norm at most `1` … there is a polynomial `W` whose derivatives … vanish except the `s`-th”.

**Claim:** The ordinary-derivative interpolation statement needs a characteristic-zero ultrametric normed field. This is explicit in Suggested.lean:612 but absent from this README target. The local assumption in §8.3 does not cover §8.5: §8.4 intervenes with several different coefficient rings. The global conventions only specify the field over ℚ_p for §8.1.

**Witness:** Over 𝔽₂((t)), take one node 0, ϱ = 1, S = 3, s = 2. Every polynomial has W″ = 0, whereas the requested jet has W″(0) = 1.

The failure is algebraic, independent of completeness or separation. At the pin, Mathlib/Algebra/Polynomial/HasseDeriv.lean:133, `Polynomial.factorial_smul_hasseDeriv`, gives D² = 2! times the second Hasse derivative. A scratch Lean proof over ZMod 2 verifies D²W = 0 for every W. Moreover, the proposed coefficient bound is zero in this example because (2!)⁻¹ = 0.

**Exact repair:** Begin §8.5 “Over an ultrametric normed field K of characteristic zero, for a finite family of points …”, retaining the other hypotheses and the existing Lean signature. Add the characteristic-two example as a negative-control Check. With the repaired hypothesis, the same single-node interpolation problem over ℚ₃ has W = X²/2: its three jets are 0, 0, 1, and its coefficient norm and bound are both 1. Over ℚ₂ both norms are 2. The identity D²(X²/2) = 1 was checked in Lean over ℚ. No change to the Lean theorem is needed.

## Previous findings

All four findings of the previous review were rechecked against this head before the full pass.

| Previous finding | Passage at this head | Disposition and witness |
|---|---|---|
| R01: nonzero assumptions narrowed Baker's corollaries | README:1021, “some `ℓᵢ ≠ 0`”; Suggested.lean:477 has an existential nonzero logarithm, and :487 an existential base different from 1 | Repaired. ℓ = (0, log 2), β = (√2, √3) is admitted: the value is 2^√3 ≈ 3.3219970855. The all-zero family remains excluded. |
| R02: stray sources manifest | README:1371 keeps the distinction between accessible and uncertified references; the folder contains only its roadmap files | Repaired. The supplied gate reports stray-files=0. No source manifest was recreated during this read-only review. |
| R03: missing APIs for proof quantities | README:776, “Their API”; :802 and :825 give the size-bound APIs; :1165 lists the diagonal-family API; :1246 gives the arithmetic bounds | Repaired. The definitions now have operations and discriminating examples. Recomputed H = 8,24,64; Λ = 8,24,256; and E = 4,64,12,64 on the stated small inputs. |
| R04: locator for exponential-polynomial independence | README:618 identifies Exercise 2.5 as related; :628 supplies the differential-operator argument | Repaired. The source exercise concerns algebraic independence under rational independence of frequencies. The roadmap now explains the distinct-frequency argument it actually needs: (D−i)(1−exp(iz)) = −i. |

No supplied repair report marks a finding “not actionable in this package”; none is re-raised on that basis.

## Verified sound

This was a full review of all 1,458 README lines and all 76 Lean declarations, not a review of the changed passages alone. The mathematical checks below are concrete tests and proof-route checks, not a claim that admitted theorems have been proved. There are 73 admitted theorems and three definitions. The tables cover every Lean declaration, the sampled targets, and additional prose definitions, estimates, conventions and proof steps.

### Gate, elaboration and signatures

The head was verified as 768487dbcb0b391b0bd811058d3418b68fd06598. The diff outside this roadmap folder is empty and the worktree was clean. The supplied push gate is passing:

    gate LinearFormsInLogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

I independently ran the prescribed dependency check:

    depcheck: 205 roadmaps, 1594 edges, 0 problem(s)

There was no UPWARD or CYCLE line. I read every Needs line and supplier contract; boundary and downstream citations do not become reverse supply edges. No supplier gaps are declared.

Direct `lake env lean` elaboration of Suggested.lean succeeded, with exactly 73 sorry warnings and no other warning. A scratch copy with `#check @name` for all 76 declarations also succeeded. The two suspicious completeness binders are intentionally omitted from the radius and formal coefficient-bound statements at lines 514 and 546: neither requires convergence in the ambient field. The actual sums retain completeness. No silent binder loss requiring a repair was found.

A scratch one-tactic screen tried `simp`, `rfl` and `infer_instance` on every admitted theorem; all 73 reached the fallback. Exact-library-lemma candidates were checked by reading the pinned statements listed below. None supplies the complete target directly. In particular, the univariate source estimates do not by themselves supply the finite-coordinate statements, and existing analytic uniqueness kills diagonal evaluations, not arbitrary multilinear maps. No padding finding is raised solely because a theorem is a corollary: the named transcendence results are end theorems, not boundary-case controls.

### Headline coverage and generality

The README's end results are the inhomogeneous Schneider–Lang criterion (§5.7), its homogeneous and one-dimensional consequences (§§6.1–6.2), Hermite–Lindemann (§6.3), Gelfond–Schneider and the ratio corollary (§6.4), Baker's theorem and affine independence (§§7.1–7.2), its transcendence corollaries (§7.3), and the p-adic Baker theorem (§8.10). All are stated on native carriers in Suggested.lean. The deep supporting results—Cartesian Schwarz, the auxiliary-function proposition, Siegel's lemma, exponential-polynomial independence, p-adic radius and estimates, many-zero estimates and Hermite interpolation—are also present. The proof-specific parameter choices and auxiliary families remain in prose rather than becoming sorry'd data.

The module docstring, three definitions with real bodies, single `import Mathlib`, namespace and layer comments were checked. No stand-in predicate, arbitrary structure field concealing a theorem, sorry'd data, forbidden import or option override was found. The README/Lean generality discrepancy found is R01.

### Source sample

W00 was obtained through the sources service from the author's legal copy, [Waldschmidt's book PDF](https://webusers.imj-prg.fr/~michel.waldschmidt/articles/pdf/dalag.pdf). References below use the service's line-numbered extraction and the book's printed pages. The five sampled W00 locators were read, including surrounding proofs. Seven sampled targets are explicitly original/native-API developments, one is an original parameter choice, and two depend on settled uncertified primary texts; these categories are distinguished below.

| Seeded target | Locator actually inspected | Result |
|---|---|---|
| 0.1 Products of absolutely convergent series | Mathlib/Analysis/Normed/Ring/InfiniteSum.lean:45,70 | Native binary absolute convergence and product-of-sums statements support the finite-product extension. Completeness is retained where a sum is asserted. No external theorem number is claimed. |
| 0.3 Multi-index coefficients | Definition at Suggested.lean:76; Mathlib/Analysis/Analytic/Uniqueness.lean:92 | This is a new finite-coordinate extraction from native multilinear series, not a quotation of a source coefficient theory. Permutation multiplicity and the empty index type were checked below. |
| 0.5 Division by a coordinate | Mathlib/Analysis/Complex/RemovableSingularity.lean:59 and TauCeti/Analysis/Analytic/ConstantOrder.lean:47,108 | These support the one-coordinate removal/factorization inputs. The roadmap owns the joint finite-coordinate/general-field extension and states it as such. |
| 1.1 Maximum modulus along a coordinate | Mathlib/Analysis/Complex/AbsMax.lean:403 | Boundedness, differentiability in the interior and continuity on the closure are supplied by the analytic-neighbourhood setup. The extension is coordinatewise. |
| 1.4 Cauchy's inequalities | Mathlib/Analysis/Complex/Liouville.lean:42, plus the README's root-of-unity extraction | Positive radius and the complete target space are present. The finite root average isolates the requested multi-index; the computation is below. |
| 3.4 Thue–Siegel's lemma | W00 lines 6887–6939, Lemma 4.11, pp.132–133; lines 6941–6975, Lemma 4.12, pp.133–134 | The real source uses positive integral U; the complex version has positive U,V. The roadmap's explicitly broader real-parameter/scaled formulation follows by the subdivision/rescaling argument, including zero equations. It is not attributed verbatim to the book. |
| 4.1 Proposition 4.10 | W00 lines 6867–6880, pp.131–132; proof lines 7043–7107, pp.135–136 | Checked the logarithmic radius bounds, W ≥ 12n² and the counting inequality. The local-series formulation and changed 1+T estimate are declared variants; the numerical slack check appears below. |
| 5.3 Liouville's inequality for these coefficients | W00 lines 7135–7150, §4.6 step 2, p.137, especially (4.14) | The roadmap's explicit Λ is a derived bound: the factorial contribution is bounded by M^M. It preserves the nonzero coefficient hypothesis and the archimedean D−1 exponent. |
| 5.6 The choice of parameters | W00 lines 7270–7316, §4.6 step 6, pp.140–141 | The source's parameters differ, as the README says. Checked the roadmap's own asymptotic powers and sample values rather than assigning its constants to Waldschmidt. |
| 7.3 Corollaries | W00 lines 828–835, p.4 | The statement requires not all logarithms zero, consistent with the repaired existential hypotheses. Rational independence of the algebraic coefficients is joint, not individual irrationality. |
| 8.2 Liouville's inequality at an ultrametric place | Mathlib/RingTheory/Valuation/Integral.lean:58; RingTheory/Norm/Transitivity.lean:261 | This is a derived integral/norm-product estimate. The exponent is D, not D−1. The rational p example below distinguishes them. |
| 8.4 Exponential polynomials as power series | Mathlib's formal exponential and the explicit (D+c) construction, Suggested.lean:622–651 | Original derivation from native formal series. Commutative-ring identities and the stronger hypotheses needed for exponential series and norm estimates are separated. |
| 8.6 Baker's auxiliary function on the diagonal | Baker75, Chapter 2, proof of Theorem 2.1 | Primary text remains uncertified. Independently recomputed the frequency, polynomial factor, natural-number evaluation and derivative-under-the-relation formulas below. |
| 8.9 The choice of parameters | README's own parameter definitions and inequalities | No external theorem number is claimed. Checked the counting and growth powers, including k=0 and the final margin 3k+8. |
| 8.10 Baker's theorem over ℂ_[p] | Brumer67, pp.121–124; Baker75, Chapter 2 | Primary texts remain uncertified. Checked the signature, radius restrictions, hypotheses and listed proof dependencies; see Not verifiable. |

There are no additional flags presenting an unread locator as verified. Other explicit W00 references inspected include Corollaries 4.2–4.4 (lines 6151, 6187, 6196; pp.117–118), Theorem 4.5 and Lemma 4.6 (lines 6242,6251; p.119), their proof (lines 6293–6409), and Exercise 2.5 (line 3498; p.60). The four source defects found during this work are recorded under Source issues.

### Pinned library audit

Pins: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Searches used objects and hypotheses (coefficient extraction, analytic order, restricted series, ordinary/Hasse derivatives, houses, integral norms and exponential/logarithmic independence), not just the roadmap's proposed names.

The following are the principal declarations opened to resolve supplier claims and possible duplication. Line numbers refer to those pins.

| Native file and line | Declaration/object and boundary checked |
|---|---|
| Mathlib/Analysis/Normed/Ring/InfiniteSum.lean:39,45,70,152 | `Summable.mul_norm`, summability on a product, product of sums and the Cauchy product; finite-coordinate assembly remains necessary. |
| Mathlib/Topology/Algebra/InfiniteSum/Constructions.lean:136 | Fiberwise summation, used to regroup monomials. |
| Mathlib/Analysis/Analytic/Basic.lean:74 | `HasFPowerSeriesOnBall` contains positive radius and the actual HasSum condition; it is not a bare coefficient bound. |
| Mathlib/Analysis/Analytic/Uniqueness.lean:92 | `HasFPowerSeriesAt.apply_eq_zero` controls evaluation on repeated vectors; it does not say every multilinear representative is zero. |
| Mathlib/Analysis/Analytic/Constructions.lean:760; ChangeOrigin.lean:338 | Composition with a continuous linear map and change of origin; neither identifies the finite-coordinate coefficients automatically. |
| Mathlib/Analysis/Analytic/IteratedFDeriv.lean:227; Mathlib/Analysis/Calculus/FDeriv/Analytic.lean:854 | Permutation sum and factorial normalization for derivatives. |
| Mathlib/Analysis/Complex/RemovableSingularity.lean:59; AbsMax.lean:403; Liouville.lean:42; Schwarz.lean:145 | Removable singularity, maximum modulus, Cauchy estimate, Schwarz estimate. Positive radius, completeness and the subtraction of the central value were checked. |
| Mathlib/Analysis/Analytic/Order.lean:48,166,347 | Nonanalytic junk value, factorization and characteristic-zero derivative criterion. These do not identify order with derivatives in positive characteristic. |
| Mathlib/Analysis/Analytic/OfScalars.lean:132,134 | `ofScalarsSum` is a total sum; it is not by itself evidence of convergence. |
| Mathlib/Analysis/Normed/Algebra/Exponential.lean:107,127,173,437 | `expSeries`, total exponential, scalar-series comparison and local addition law. Completeness and convergence-ball hypotheses are material. |
| Mathlib/NumberTheory/NumberField/House.lean:38,45,51,54,57,60,69,74,88,93,100 | House definition; sum/product/addition/power/integer bounds; embedding bound; lower bound for nonzero integral elements; norm product. The indexed product generalization is distinguished from the set-product API. |
| Mathlib/NumberTheory/NumberField/House.lean:311,348 | Private constant and public Siegel theorem. The theorem requires a nonzero matrix and positive row count; the roadmap separately handles zero matrices without naming the private constant. |
| Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:612; Mathlib/NumberTheory/NumberField/Basic.lean:64 | `finiteDimensional_adjoin` and `NumberField.of_module_finite` for finite algebraic generators. |
| Mathlib/RingTheory/Algebraic/Integral.lean:160,369,495 | Clearing denominators, algebraic/integral conversion over a field, and algebraicity through the scalar tower. |
| Mathlib/RingTheory/Discriminant.lean:127,143 | Determinant-square and nonvanishing under the separable finite-dimensional hypotheses used in §7.1. |
| Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:882; Mathlib/Analysis/Normed/Module/Basic.lean:300 | Spectral norm makes the extension a normed algebra; norm compatibility is not true for an arbitrarily normalized local-field absolute value. |
| Mathlib/NumberTheory/Padics/PadicNumbers.lean:1076; PadicVal/Basic.lean:620 | Integer valuations and Legendre's factorial formula, including the p−1 factor. |
| Mathlib/Analysis/Normed/Algebra/Ultra.lean:38 | Ultrametricity inherited through a normed algebra. |
| Mathlib/RingTheory/Valuation/Integral.lean:58; Mathlib/RingTheory/Norm/Transitivity.lean:261 | Integral elements have valuation at most one; the norm as a product over embeddings needs the stated finite/separable setting. |
| Mathlib/Algebra/Polynomial/HasseDeriv.lean:133 | `factorial_smul_hasseDeriv` supplies the characteristic-two witness for R01. |
| TauCeti/Analysis/Analytic/ConstantOrder.lean:47,108 | Local factorization and order comparison, with an RCLike field, not the full arbitrary-field finite-coordinate target. |
| TauCeti/Analysis/Analytic/OfScalars.lean:115,131 | Scalar-series composition and complex derivative input. |
| TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean:186 | Packing estimate requires 0 < ε ≤ c and strict separation; these were not discarded. |
| TauCeti/RingTheory/PowerSeries/GaussNorm.lean:449; Weierstrass/Division.lean:369 | Multiplicativity for restricted series and bounded division. Completeness, positive radius, restrictedness and unit leading coefficient were checked. |

The searches did not find a native finite-coordinate coefficient API, the stated multivariate exponential-polynomial independence theorem, or Baker/Schneider–Lang end theorems at these pins. Existing native operations remain supplier inputs rather than newly owned carriers. The arbitrary-ring (D+c) operation is a concrete polynomial linear map; similarly named Hermite polynomials are not interpolation with the stated ultrametric bound.

### Cross-roadmap ownership and order

I read main-branch examples before assessing shape: DiophantineApproximationAndTranscendence, Completed/LocalFieldsRamification and Completed/AdicSpaces. Searches used both the roadmap index tools and the available board packages/open-head files. All actual cross-roadmap references in the target were resolved; the following are the relevant ownership boundaries.

| Roadmap and inspected location | Resolution |
|---|---|
| TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:112,140; §§3.2,3.3,3.5–3.8,5.6 | The supplier table explicitly consumes this roadmap. The larger exp(πα) result, rank-form criterion, separate degree budgets, effective bounds, Lindemann–Weierstrass and Ax–Schanuel remain there. Its height-based Siegel target at :1874 is not the integral-house auxiliary-vector formulation here. No reverse dependency is introduced. |
| Completed/LocalFieldsRamification/README.md:393, “Deep units in mixed characteristic” | Resolved through the main copy returned by the index; the supplied older checkout path was unavailable. It owns local exp/log on deep units with normalized local absolute value. This roadmap's normed ℚ_p-algebra estimates use the base-compatible spectral norm. For an unramified quadratic extension at p=3 these normalizations give 1/9 versus 1/3 on 3; the distinction in the README is necessary. |
| Completed/AdicSpaces/README.md:237, §0.5 | Owns restricted power series, division/preparation and Tate-algebra foundations. This roadmap consumes the existing Tau Ceti division and norm theorems. |
| TauCetiRoadmap/EllipticCurves/README.md:164 | Exclusion of Siegel finiteness is present, as the boundary citation says. |
| TauCetiRoadmap/GenericDoublePointInterpolation/README.md:1416, supplied open head | First jets in arbitrary characteristic concern a different object from high ordinary derivatives with ultrametric coefficient bounds. No duplicate ownership was found. |
| TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:929, supplied open head | Finite complex jets for Runge approximation do not own the ultrametric Hermite estimate. |

Board-package and indexed open-roadmap searches also found consumers in IntegralIwasawaTheoryPartII and GL2ModularityLifting, rather than competing constructions. The latter indexed consumer references §8.10; a complete checkout was not supplied for an independent full-file audit. Available matching open-head files were inspected; unrelated indexed matches such as spectral exponential families are different objects. No duplicate fully qualified declaration name was found in the readable candidate owners. Ownership against unavailable full open-PR files was not checked beyond the index results.

The roadmap is not a replacement of DiophantineApproximationAndTranscendence: that roadmap already names this one as its supplier. Local norm estimates are likewise explicitly distinguished from the finite-local-field construction. No route-specific prime exclusion, computational algorithm or circular imported proof route was found.

### Adversarial table: every Lean declaration

Each row identifies a declaration by its line in TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean; grouped words describe the statement, not additional unverified declaration names. “Pass” means the displayed test agrees with the target, with hypotheses enforced. Except for R01's prose repair, no change is requested by these rows.

| Line / statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 76, multi-index coefficient definition | p₂(u,v)=u₀v₁: coefficient (1,1)=1+0=1. For p₂=u₀v₀, coefficient (2,0)=1, not 2. Constant degree zero over an empty coordinate type gives 7. | Pass; permutation multiplicity is correct. |
| 83, diagonal evaluation as monomials | z=(2,3), p₂(u,v)=u₀v₁: p₂(z,z)=6 and coefficient sum 1·2·3=6. Empty coordinates: degree zero c=c, positive degrees 0=0. | Pass. |
| 91, regrouped HasSum | Geometric series at z=1/2: sum=2=f(z). Empty coordinates leave the constant c=c. | Pass. |
| 100, constructing a series from coefficients | c_k=1, controlling radius 1/2: weighted absolute sum=2; at z=1/4, sum=4/3 and extracted c₂=1. | Pass. |
| 108, coefficient uniqueness | Alternating p₂(u,v)=u₀v₁−u₁v₀ has diagonal 0 and mixed coefficient 1−1=0, although p₂ is nonzero. | Pass; excludes the false stronger uniqueness claim. |
| 116, Taylor-coefficient definition | z² at 3 has coefficients 9,6,1. For 1+conj(z) at 0, nonanalytic default coefficients are all 0 although f(0)=1. | Pass; junk convention explicit. |
| 120, representative independence | Adding the alternating form above changes the representative but leaves the mixed coefficient 1+0=1. | Pass. |
| 126, addition | z²+3z at 1: coefficient of degree one is 5=2+3. | Pass. |
| 132, scalar multiplication | Nonanalytic conjugation, scalar 2: default coefficient 0=2·0; scalar 0: coefficient 0=0·0. | Pass, including zero scalar. |
| 137, locality | z² near 3: coefficient of degree one is 6 on both sides; altering a value at 100 leaves 6. | Pass. |
| 142, translation | z² translated by 2 and expanded at 3: derivative coefficient 10=2(3+2). | Pass. |
| 148, factorial and iterated derivative | z₀²z₁, index (2,1): coefficient 1 multiplied by 2!1! gives 2, the derivative. In characteristic 2 both derivative and factorial multiple are 0, while coefficient is 1. | Pass; no division by factorial. |
| 157, univariate factorial identity | z³, order 3: 3!·1=6. In characteristic 3 both sides are 0. | Pass. |
| 164, product coefficients | f=1+z, g=z² at 1, degree one: 5=2·2+1·1. | Pass. |
| 172, absolute expansion | Geometric coefficients with control radius 1/2 and displacement 1/4: absolute control sum 2, evaluated sum 4/3. | Pass. |
| 181, Taylor expansion at a point | z² at 3, displacement 1/2: 9+6/2+1/4=49/4=(7/2)². | Pass. |
| 190, total-order vanishing under linear maps | f=z₀², A(s,t)=(s+t,t): degree-one coefficients are 0 before and after. Degree-two mixed coefficient changes 0→2, so rectangular-order preservation is not asserted. | Pass. |
| 198, divided slope | f=z², centre 3: extended slope at 3 is 6; at 4 it is (16−9)/(4−3)=7. | Pass. |
| 211, little-o order bound | f=w², T=2: norm divided by norm(w)^(T−1) is norm(w)→0. A nonanalytic germ does not acquire positive analytic order from its default zero coefficients. | Pass. |
| 218, Schwarz order estimate | f=w², ρ=2, M=4, T=2, w=1: 1=4(1/2)². T=0 yields 1≤4. | Pass. |
| 229, multivariate Cauchy bound | f=z₀z₁, R=2,M=4,ρ=1,index(1,1): 1≤4. At ρ=0 the positive-degree weighted coefficient is 0≤4. | Pass. |
| 236, remainder bound | f=z²,R=2,M=4,z=1, cutoffs T=0,2,3: remainder norms 1,1,0; respective bounds 4,3,2. | Pass. |
| 246, Cartesian Schwarz estimate | One variable, E={0}, multiplicity 2, r=1,R=5,M=25,f=z²: 1≤225. Empty interpolation set gives no zero gain. | Pass. |
| 265, exponential-monomial coefficient | z²exp(z) at 1, coefficient degree one: 3e=e(1+2). exp(z) at 0, degree two: 1/2, including an index greater than the polynomial degree. | Pass. |
| 272, exponential-polynomial independence | Frequencies 0,i with polynomials 1,−1: value 0 at 0 but 2 at π; (D−i) eliminates exp(iz) and leaves −i. Empty coordinate space admits at most one distinct frequency. | Pass. |
| 288, archimedean Liouville | K=ℚ,x=2: norm·house^0=2≥1. x=1/2 would give 1/2<1 and is excluded by integrality. | Pass. |
| 295, denominator-aware bound | x=1/2,δ=2,a=1,H=1: clearing gives 1; the lower-bound product equals 1. δ=0 is excluded. | Pass. |
| 302, real Thue–Siegel | Form (1,1),U=2,X=1, three boxes < four candidate vectors: ξ=(1,−1) gives value 0≤2/3. Zero unknowns do not satisfy the counting hypothesis. | Pass. |
| 309, complex Thue–Siegel | Four coefficients 1/2,U=log2,V=0,X=1: (2√2+1)²≈14.657≤16; ξ=(1,−1,0,0) gives 0≤1. No equations yields count 1≤2. | Pass. |
| 320, number-field Siegel | Matrix [1,1]: vector (1,−1) has image 0 and house 1≤2C. Zero matrix admits (1,0), handled outside the native nonzero-matrix lemma. | Pass. |
| 335, auxiliary function | 1024 constant functions, N=1,U=log1024,V=6,log(R/r)=2: W≈13.931, count ≈776.34≤2048; coefficients (1,−1,0,…) give function 0. | Pass. |
| 353, inhomogeneous Schneider–Lang | n=d₀=d₁=1,x=y=1: coordinate candidate 1 is algebraic, exponential candidate e is not. n=0 cannot meet the required nonempty independent family and strict dimension conditions. | Pass. |
| 368, homogeneous criterion | n=1,d=2,x=(1,√2),y=(log2,0): candidate values 2,2^√2,1,1; at least 2^√2 is transcendental. | Pass. |
| 376, one-dimensional criterion | d=1,x=y=1: exponential is e≈2.7182818285. d=0 is excluded by NeZero. | Pass. |
| 385, logarithm form of Hermite–Lindemann | log2 has exponential 2; 2πi has exponential 1; both logarithms are nonzero. Zero would also exponentiate to 1 and is excluded. | Pass. |
| 391, exponential form | Input 1 gives e; input 0 gives 1 and fails the nonzero hypothesis. | Pass. |
| 397, principal logarithm | Inputs 2,1,0 give log2≈0.693147,0,0; the latter two are excluded. | Pass. |
| 403, branch-free Gelfond–Schneider | x=log2,b=√2: exp(bx)=2^√2≈2.665144. Rational b=1/2 would give √2 and is excluded. | Pass. |
| 409, principal-power form | 2^√2 is covered; 4^(1/2)=2 is excluded by irrationality. The j=0 rational-quotient test gives 0 and does not create a loophole. | Pass. |
| 416, quotient of logarithms | log4/log2=2; log3/log2≈1.5849625 is the transcendental alternative. Denominator zero is excluded. | Pass. |
| 429, Baker relation in an algebraic basis | Basis (2) of ℚ: logarithm 0 gives sum 0. With log2 the sum is log4, so the premise that the sum is algebraic fails. | Pass. |
| 437, Baker affine independence | Logs 2,3 with β₀ and all coefficients zero give sum 0. Logs 2,4 with β₀=0 and coefficients 2,−1 give 0 but fail rational linear independence. | Pass. |
| 444, affine independence | Empty logarithm family leaves the relation β₀=0. For one independent logarithm, all-zero coefficients give 0 and no nontrivial relation. | Pass. |
| 452, nonzero algebraic constant in affine form | Logs 2,4 with coefficients 2,−1 cancel; adding β₀=1 gives 1≠0 even though those logs are dependent. | Pass. |
| 460, nonzero linear form is transcendental | Coefficients 3,−1 on logs 2,4 give log2; coefficients 2,−1 give 0 and are excluded. | Pass. |
| 467, exponential of affine form | Empty family and β₀=1 gives e. β₀=1, log2 coefficient 1 gives 2e. Setting β₀=0 would give algebraic 2 and is excluded. | Pass. |
| 476, exponential with independent algebraic coefficients | ℓ=(0,log2),β=(√2,√3): value 2^√3≈3.321997. All-zero ℓ would give 1 and is excluded. | Pass; previous R01 repaired. |
| 486, product of algebraic powers | Bases (1,2), coefficients (√2,√3): product 2^√3. All bases 1 give 1 and fail the existential hypothesis. | Pass. |
| 504, integer norm comparison | p=3,n=3,6,−3: real absolute value times p-adic norm is 1,2,1 respectively. n=0 gives 0 and is excluded from the lower bound. | Pass. |
| 514, exponential radius | p=2 gives 1/2; p=3 gives 1/√3. On the boundary, terms indexed by p^j have constant norm ρ, not a sequence tending to 0. | Pass; completeness unnecessary for the radius. |
| 519, local exponential addition | In ℚ₃, x=3,y=−3: exp(x+y)=1=exp3·exp(−3), both inputs inside the disc. | Pass. |
| 525, exponential minus one norm | p=3,x=3: both sides 1/3. p=2,x=4: both sides 1/4. | Pass. |
| 530, isometry/injectivity | In ℚ₃,x=3,y=6: norm(x−y)=1/3=norm(exp x−exp y)>0. | Pass. |
| 535, exponential-polynomial HasSum | Q=X,ψ=3 over ℚ₃: at x=1 the series equals exp3; at x=0 both sides are 0. | Pass. |
| 546, coefficient norm bound | Q=1,ψ=3,r=1,p=3: coefficient norms at k=0,1,3 are 1,1/3,1/9, all ≤1. At r=0 positive-degree weighted terms are 0. | Pass. |
| 556, integral ultrametric bound | In ℚ₃, integral 3 has norm 1/3≤1; nonintegral 1/3 has norm 3 and is excluded. In characteristic 2, integral 1 has norm 1≤1. | Pass. |
| 561, ultrametric Liouville | x=3,H=3,D=1: norm(x)H^D=1. x=1/3,δ=3,H=1 gives product 3≥1. Replacing D by D−1 in the first test gives 1/3<1. | Pass. |
| 570, one-zero coefficient bound | f=X²,r=M=1,T=2,x=3 over ℚ₃: value norm 1/9=(1/3)². | Pass. |
| 588, many-zero coefficient estimate | f=X²,A={0},S=2,r=2,M=4: coefficient bound at k=2 is 1=4/2². Empty A gives 1≤4. | Pass. |
| 598, many-zero value estimate | Same f,A,S,r,M: at x=1 value norm 1≤1; at x=3 norm 1/9≤1. | Pass. |
| 611, Hermite interpolation | One node 0,S=3,s=2,ϱ=1: W=X²/2 over ℚ₃ has jets (0,0,1) and coefficient bound 1=1; over ℚ₂ bound 2=2. In characteristic 2, D²W=0≠1. | Lean passes; repair README per R01. |
| 622, (D+c)^m definition | (D+2)X=1+2X; D²X³=6X; zero ring gives zero on both sides. | Pass. |
| 627, binomial formula | c=2,m=2,P=X²: both operator expansion and binomial sum give 2+8X+4X². | Pass. |
| 633, degree bound | The preceding polynomial has degree 2≤2. D³X²=0, whose natural degree is 0≤2. | Pass, including zero-polynomial junk degree. |
| 639, ultrametric coefficients | Over ℚ₃,c=1/3,m=2,P=X²: coefficients 2,4/3,1/9 have norms 1,3,9; all ≤max(1,3)²=9. | Pass. |
| 645, formal derivative identity | D(X exp(cX))=(1+cX)exp(cX); order zero is the original product on both sides. | Pass. |
| 656, p-adic affine independence | Empty family forces β₀=0; log₃4 has norm 1/3 inside the disc. Off-disc ℓ=1 has total exp value 0 and the relation −1+ℓ=0: the disc hypothesis excludes this false extension. | Pass. |
| 665, p-adic linear-form corollary | Singleton log₃4, coefficient 1: norm 1/3, nonzero. Coefficient 0 gives zero and fails the nonzero hypothesis. | Pass. |
| 674, transcendence of exp p for odd primes | Input 3 in ℚ₃ has norm 1/3<1/√3. The p=2 boundary input 2 has norm 1/2 and divergent exponential series. | Pass; the prime 2 exclusion is a convergence condition. |
| 684, transcendence of e | e=exp1≈2.7182818285; input 1≠0. | Pass, headline corollary. |
| 688, transcendence of π | exp(πi)=−1, with πi≠0; π≈3.1415926536. | Pass. |
| 691, exp π | Principal log(−1)=πi and (−i)(πi)=π; expπ≈23.1406926328. | Pass; sign pinned. |
| 694, 2^√2 | 2^√2≈2.6651441427; base 2 differs from 0 and 1. | Pass. |
| 697, log2 | exp(log2)=2 and log2≈0.6931471806≠0. | Pass. |
| 700, log2/log3 | Value ≈0.6309297536. A rational a/b would force 2^b=3^a; the integer-prime valuations force a=b=0, inconsistent with the nonzero denominator representation. | Pass. |
| 704, π+log2 | (−i)(πi)+log2=π+log2≈3.8347398341≠0. Both exponential values, −1 and 2, are algebraic. | Pass. |

### Adversarial table: remaining prose and proof quantities

These rows additionally test the README APIs, Checks and proof steps that are not separate Lean declarations. Characteristic, dimension and radius failures are tested only where the corresponding carrier admits them; schemes, nonabelian groups and nilpotent thickenings are not carriers of these targets.

| Target/convention | Computed instance or comparison | Result / change |
|---|---|---|
| Sup norm and polydisc convention | norm(2,3i)=3; membership in the radius-3 product disc and the closed sup ball both hold. | Pass. |
| 0.1, finite products | Two geometric sums at 1/2 and 1/3 give 2·(3/2)=3; double sum also 3. Empty product=1; a zero factor gives 0. | Pass. |
| 0.2, normally convergent analytic sum | g_n(z)=2^(−n)z: sum=2z; at z=1/2 both sum and claimed function are 1. Tail after N has size 2^(1−N)·norm(z). | Pass. |
| 0.3, coefficient API | Addition gives 1+3=4; scalar 2 gives 2·1=2; zero series gives 0. Constant series 1 has coefficient 1 and does not represent the zero germ. | Pass. |
| 0.4, constants, subtraction and monomials | Constant 7 has degree-zero coefficient 7 and positive coefficients 0; subtraction 2−3=−1. z₀²z₁ has coefficient (2,1)=1 and all other coefficients 0. | Pass. |
| 0.5, coordinate division | f=z₀²(1+z₁), at (2,3): f=16, quotient=4, factor z₀²=4, product=16. Constant 1 has nonvanishing degree-zero coefficient and is excluded. | Pass. |
| 1.1, coordinate maximum | z₀z₁ on radius-2 polydisc has boundary maximum 4; at (1,1) norm=1≤4. Radius zero reduces to the single point where the value is 0. | Pass. |
| 1.2, division estimates | f=z²,R=3,r=1,M=9: quotient by z² is 1; the crude bound is 9/4, and the central power estimate gives the sharp 9/9=1. | Pass. |
| 1.4, homogeneous term and coefficient extraction | Degree-two term z₀z₁ at (1,1) has norm 1≤4. Averaging over third roots isolates index (1,1): selected term contributes ρ², index (2,0) contributes 0. | Pass; normalization fixed. |
| 1.5, Taylor truncation | z²,R=2,M=4,z=1,T=3: norm(f)=1≤2+1=3, with remainder bound 2 and retained term norm 1. | Pass. |
| 1.6, Cartesian bound constant | n=1,r=1,R=5,total multiplicity 2: K=1+(1+3)=5; multiplying by M=25 gives 125≥norm(f(1))=1. | Pass; intentionally nonsharp. |
| 2.1, finite exponential-polynomial combinations | (z²−1)expz at 1 has degree-one coefficient 2e; it is a finite sum of entire terms. | Pass. |
| 2.2, growth | At z=1 the exponential norm is e≤4e under the corresponding polynomial bound. Degree-zero monomial at zero is 0^0=1, not 0. | Pass. |
| 2.3, distinct frequencies necessary | Repeated frequencies 0,0 and polynomials 1,−1 give the zero function although neither polynomial is zero. | Pass; injectivity excludes this. |
| 3.2, denominator arithmetic | α=1/2,β=1/3,δ=6: cleared sum 5=3+2; cleared product 6=3·2; square numerator 9=3²; raising denominator exponent multiplies 3 by 6 to 18. | Pass. |
| 3.2, indexed product versus set product | Family (2,2) has product 4; its image set has product 2. The requested indexed version retains multiplicity. | Pass; not duplicate set API. |
| 3.3, finite number field and common denominator | S={√2,1/3}: field ℚ(√2), δ=3, cleared houses 3√2 and 1, both ≤5. Empty S gives ℚ with δ=G=1. | Pass. |
| Packing input to 3.4 | S={−1,1},ε=c=1: separation 2>1 and cardinality 2≤16. Taking ε=5,c=1 would give a singleton bound 1≤16/25, false; ε≤c is retained. | Pass. |
| 4.1, modified analytic constant | At W=12 and T=17, 1+T=18<e⁴/2≈27.299. This supplies slack for the declared 1+T variant. | Pass. |
| 5.1, F and Γ normalization | T=0 gives a constant family bounded by e^N. z₀expz₁ at (2,3) is 2e³, not 3e². For exp(2z),ρ=2,N=0,T=2, actual norm e⁴≈54.598≤Γ=3e⁴≈163.794; a mis-scaled exponent would give ≈22.167 and fail. | Pass. |
| 5.2, arithmetic size parameters | For M=0,1,2, exponent a=2,3,4 and H=8,24,64. Constant coefficient 2 is bounded by H=2 when T=0. | Pass. |
| 5.2, G need not exceed δ in complex estimate | d₀=0,T=1,δ=2,G=1,ε=1/2,θ=3/2: cleared value 3≤4. This tests the permitted asymmetry without assuming G≥δ. | Pass. |
| 5.3, Λ and factorial loss | The same small cases give Λ=8,24,256. For total degree 2, σ! is 1 or 2, each ≤2²=4. M=0 uses 0^0=1. | Pass. |
| 5.4, nonvanishing requires independence | x=(1,2): multi-indices (2,0) and (0,1) both have frequency 2; opposite coefficients cancel to F=0. | Pass; hypothesis excludes the example. |
| 5.5, transporting vanishing | n=2,M=3 gives floor(M/n)=1: the required coordinate rectangle contains only (0,0), total degree 0<3. With Λ=8,U=log16, upper 1/16 contradicts lower 1/8 for a nonzero value. | Pass; uses total-order control. |
| 5.6, parameter constants | In the recorded smallest-dimensional test c=1/144,K₁=3457,S₁=60,r=63. At q=10⁶, W≈2.15867352468·10¹¹; counting sides ≈1.86394855447·10²³ and 3.31369294642·10²³. | Pass for counting. |
| 5.6, “sufficiently large” is essential | At q=10⁶,S₀=289268151 the initial log bound is about −9.03052733·10¹⁰, but extrapolation logs at S₀ and 2S₀ are positive, about 1.56778975·10¹³ and 2.20545850·10¹³. At q=10¹⁰⁰⁰ their normalized logs are about −18.7485 and −50.7718. | Consistent with an eventual, not all-q, claim. |
| 5.7, zero basis vector | Setting y=0 makes coordinate/exponential candidates 0 and 1, both algebraic; it fails the independent-family hypothesis. | Pass. |
| 6.1, broader rank version | x=(1,√2,2) has rational rank 2 but is not independent as a three-element family. The stronger rank formulation belongs to the named consumer. | Pass; scope boundary explicit. |
| 7.1, embedding matrix | Basis (1,√2): matrix rows (1,√2),(1,−√2), determinant −2√2, determinant square 8≠0. Both uses of invertibility in the argument have this input. | Pass. |
| 7.3, joint coefficient independence | Coefficients √2,−√2 on the same nonzero logarithm sum to 0 and exponentiate to 1; each is irrational but the pair is rationally dependent. | Pass; joint hypothesis is needed. |
| 8.1, factorial and small primes | p=2,n=4: norm(4!)=1/8≥1/16. p=3,n=3: norm(3!)=1/3≥3^(−3/2). exp6=(exp3)² and norm(exp3)=1 in ℚ₃. | Pass. |
| 8.2, trivial valuation and denominators | At a trivial norm on an algebraic closure of ℚ, integral 2 gives product 2≥1; x=1/2,δ=2,H=1 clears to 1. | Pass; no unnecessary nontrivial-norm assumption. |
| 8.3, characteristic restriction | In characteristic 2, f=X² has all ordinary derivatives of positive order zero, so S=3 at 0 would falsely imply 1≤4/2³=1/2. §8.3 explicitly excludes this by characteristic zero. | Pass; contrasts with R01. |
| 8.4, operator Checks | (D+2)X=1+2X, D²X³=6X, and (D+c)^m1=c^m. The wrong sign gives 1−2X in the first test. | Pass. |
| 8.6, frequencies | ℓ=(3,6): indices 0,(1,0),(2,3) give ψ=0,3,24. The last two have 3-adic norms 1/3 and 1/3, bounded by max norm(ℓ)=1/3. | Pass. |
| 8.6, γ and constant frequency | β=2,β₀=5: indices (2,3),(0,3),(1,0) give (γ,e_none β₀)=(7,10),(3,0),(2,5). | Pass. |
| 8.6, derivative factors and diagonal evaluation | For d=2 and (γℓ,c)=(42,10), the zeroth factor is X², none derivative 2X+10X², and other derivative 42X². At natural l=2, exp(2ℓ)=(expℓ)². The sum-of-derivatives formula additionally uses the stated affine relation. | Pass. |
| 8.7, coefficient integrality | P=1/2,δ=1 would leave nonintegral 1/2 and is excluded. With k=0,L=l=δ=1,α=4,G=4,P=1,m=0, the algebraic coefficient has house 1≤32. | Pass. |
| 8.7, counting | k=0,L=h=1: two equations and four unknowns; doubling the equations gives 4≤4. The selected denominator exponent is 2. | Pass. |
| 8.7, logarithm separation | α=1/4,δ=G=4 at p=3 gives norm(log α)=1/3≥1/8. The erroneous choice G=1 would demand 1/3≥1/2 and is not allowed by the hypotheses here. | Pass. |
| 8.7, E API | The four supplied small cases evaluate to 4,64,12,64; increasing the relevant nonnegative parameter increases or preserves the product. | Pass. |
| 8.8, final inequality is a hypothesis | k=0,L=h=D=G=C=1,p=3,r₀=2,S=R=0 gives Π=16: the proposed smallness comparison reads 1536<1 and fails. This tiny instance is not claimed to finish the proof. | Pass; avoids vacuous parameter assertion. |
| 8.8, Hermite elimination | Two distinct frequencies with two derivative orders give product multiplicity 4; the interpolation order must cover all four conditions, not two. | Pass. |
| 8.9, k=0 parameter powers | K_max=21,h=X⁷,L=X¹¹,R_J=X^(7+J),S_J=2^(21−J)X¹³. Counting exponents are 21<22; S₀/h²=2²¹/X→0. | Pass. |
| 8.9, extrapolation and final margin | Gain exponent 20+J exceeds cost exponent 19+J; initial log E has size X¹⁴logX. In general final gain exponent 6k²+32k+41 exceeds 6k²+29k+33 by 3k+8>0, including k=0. | Pass. |
| 8.10, reciprocal radius and small primes | log₃4 has norm 1/3, reciprocal radius √3; log₂5 has norm 1/4, reciprocal radius 2. Both are strictly inside their exponential discs. | Pass. |

The computations expose no additional counterexample. They also distinguish total-order vanishing from rectangular vanishing, ordinary derivatives from Hasse derivatives, and base-compatible p-adic norms from normalized local-field absolute values.

## Not verifiable

- **Baker75**, Alan Baker, *Transcendental Number Theory* (1975), Chapter 2, Theorems 2.1–2.4 and Lemmas 1–7; **Brumer67**, *On the units of algebraic number fields* (1967), pp.121–124: the preceding source record treats these publisher texts as uncertified. I did not bypass access restrictions or reopen settled requests. Thus the exact source attribution for §§8.5–8.6 and the full primary-source proof of §8.10 are not certified by this review. Their stated mathematics was tested independently as recorded above.
- **BM80**, Bertrand–Masser, *Linear forms in elliptic integrals*; **Hua82**, *Introduction to Number Theory*, §17.9; **Lang66**, *Introduction to Transcendental Numbers*; **BG06**, Bombieri–Gubler, *Heights in Diophantine Geometry*, Chapter 2: these are likewise settled uncertified/background references in the preceding source record. W00's accessible statements and proofs were checked where the roadmap uses its presentation; this does not certify the unavailable original texts. No new missing-source request or manifest edit was made.
- The external Gelfond–Schneider [Mathlib contribution](https://github.com/leanprover-community/mathlib4/pull/42911) exposes the stated principal-power signature, which I compared. The Lindemann–Weierstrass contribution could not be read successfully during this review. Neither external branch nor the referenced frozen formalizations were built; claims about their complete proofs are not certified. The dependency and truth checks here concern the pinned libraries and the target signatures.
- Source checking used the service's text extraction, not an independent page-image transcription audit. Unavailable full open-roadmap files were not audited beyond available index matches, as noted in the ownership table.

## Source issues

- **Misprint** in W00 at Lemma 4.13 proof, printed p.134 (line 7001): the source says the scalar function is evaluated at the vector chosen to maximize the auxiliary polynomial; it should be the auxiliary polynomial G evaluated there; affects the proof.
- **Misprint** in W00 at §4.6 step 4, printed p.139 (line 7219): the source says (4.14) supplies the upper estimate and (4.16) the lower estimate; it should be the reverse assignment; affects nothing.
- **Gap** in W00 at §4.6 step 5, printed p.140 (lines 7246–7256): the source says rectangular derivative vanishing transfers through the chosen linear coordinates; it should be transferred through total-degree vanishing, then a smaller rectangle; affects the proof.
- **Error** in W00 at Exercise 2.4(a), printed p.60 (lines 3486–3493): the source says the consecutive-integer nonvanishing assertion holds over any field; it should require characteristic zero or a suitable characteristic-dependent range; affects a stated result.

For the last two issues, the short witnesses are z₁² becoming (z₁+z₂)² with mixed coefficient 2, and X²−X over 𝔽₂ vanishing at all integer images despite being nonzero. The roadmap's total-order treatment avoids the former issue.

