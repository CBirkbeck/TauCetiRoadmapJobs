# Review of LinearFormsInLogarithms (pull request #451 at 2081ee8)

**Verdict:** accepted

This is an incremental re-review of the 42 lines changed since 768487d: the repair of the previous review's single finding R01 (characteristic zero in §8.5, with two new Checks), the removal of the author's name from four README passages and one Lean docstring, and nothing else. The gate passes, the dependency check reports no problem, the module elaborates with `sorry` as the only warning, and the one previous finding is repaired without introducing a new defect. One P3 note on wording is left to the author.

## R01 (P3) — `p` is unbound in the §8.5 warning now that the target is stated over a general `K`

**Location:** TauCetiRoadmap/LinearFormsInLogarithms/README.md:1146–1147, §8.5: “⚠ `‖1 / s!‖ = p ^ (v_p (s!))` is at least `1`, unlike at an archimedean place.”

**Claim:** The repaired target opens “Over an ultrametric normed field `K` of characteristic zero”, and the Lean statement at Suggested.lean:611–619 has exactly `[NormedField K] [IsUltrametricDist K] [CharZero K]`. The warning sentence then names a prime `p` and a valuation `v_p` that the target no longer introduces. The inequality is right for every such `K`; the equality is right only for a normed `ℚ_[p]`-algebra with the base-compatible norm.

**Witness:** `ℚ` with the trivial absolute value is an ultrametric normed field of characteristic zero; there `‖1 / s!‖ = 1` for every `s`, and no `p` is in play. In general `‖s!‖ ≤ 1` by `IsUltrametricDist.norm_natCast_le_one` (Mathlib/Analysis/Normed/Ring/Ultra.lean:67 at the pin), so `‖1 / s!‖ ≥ 1` once `s! ≠ 0`; checked in a scratch Lean file at the pin.

**Repair:** Write the warning as: “⚠ `‖1 / s!‖ ≥ 1`, since `‖s!‖ ≤ 1` in every ultrametric normed field (`IsUltrametricDist.norm_natCast_le_one`); for `K` a normed `ℚ_[p]`-algebra it equals `p ^ (v_p (s!))`; unlike at an archimedean place.” No change to the Lean statement. Not blocking.

## Previous findings

- R01 — repaired: README §8.5 now reads “Over an ultrametric normed field `K` of characteristic zero, for points `σ i` of norm at most `1` …”, with a Checks block giving `W = X ^ 2 / 2` over `ℚ_[3]` and `ℚ_[2]` and the `𝔽₂((t))` negative control. Both Checks recomputed below and in Lean; the Lean signature at Suggested.lean:612 already carried `[CharZero K]` and is unchanged. The only problem the repair introduced is the P3 wording note above.

## Verified sound

This review read in full only the passages the diff adds or changes and what cites them; everything else carries forward from the review of 768487d, which was a full review of all 1,458 README lines and all 76 Lean declarations.

### Gate, dependency check and elaboration

The head was verified as 2081ee8409dc69bbe604ee9c94d91ff66c4bdf4d; the worktree was clean and the diff against origin/main outside the roadmap folder is empty. The worker's gate at this head (quoted below, with its targeted build) passes; my own run of the gate at this head reports the same result on every text check and the dependency check, and the build is covered by the direct elaboration below:

    gate LinearFormsInLogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The prescribed dependency check:

    depcheck: 205 roadmaps, 1652 edges, 0 problem(s)

No UPWARD or CYCLE line. The diff adds no `*Needs:*` line, no supplier citation and no cross-roadmap citation (§8.5 still reads “*Needs:* Mathlib only”), so the supplier-order audit of the previous review stands. No supplier gaps are declared.

`lake env lean` on TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean at this head: exit 0, exactly 73 `declaration uses sorry` warnings, 0 errors, and the output of the file's 28 `#check` pins; no other warning. The file changed by one docstring line (Suggested.lean:406), so every declaration keeps its line number and the elaborated signatures of the previous review still describe it; I compared the two touched declarations against the README: `GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational` (line 409) has exactly the hypotheses README §6.4 lists, and `Polynomial.exists_iterate_derivative_eval_eq_ite_of_isUltrametricDist` (line 611) has `[NormedField K] [IsUltrametricDist K] [CharZero K]`, points of norm at most `1`, `0 < ϱ ≤ 1`, separation `ϱ ≤ ‖σ i - σ j‖` for `i ≠ j`, `s < S`, the `ite` jets and the bound `‖(s!)⁻¹‖ · (ϱ ^ (card ι · S))⁻¹`, which is the README's `‖1 / s!‖ ϱ ^ (-(card ι · S))`. The two binders the signature scan flags as possibly dropped are the ones at lines 514 and 546 the previous review found intentional (the radius and the formal coefficient bound need no completeness); they are untouched by this diff.

### The changed passages

- README:96–110 (Coordination with Mathlib), :957–958 and :960–962 (§6.4), :1394–1395 ([Hua82]), :1407–1408 (Provenance) and Suggested.lean:405–406: the author's name is replaced by “the Mathlib formalisation of Gelfond–Schneider” / “its author is the author of this roadmap”. No mathematics changes; no process word, round label, pull-request number or path enters (gate prnum=0, round-labels=0, private-paths=0). The three Lean names §6.4 cites, `transcendental_exp_mul`, `GelfondSchneider.transcendental_cpow_of_isAlgebraic_of_irrational` and `exists_rat_eq_div_or_transcendental`, are declared at Suggested.lean:403, :409 and :416; the citations scan lists them only because they are this roadmap's own names, not pinned ones.
- README:1143–1147 (§8.5 statement): now self-contained over `K`, matching the Lean generality in both directions. Hypotheses and bound unchanged otherwise. The `*Needs:*` line is unchanged.
- README:1149–1155 (§8.5 Checks): both bullets recomputed by hand and in a scratch Lean file at the pin, see the adversarial table. The first bullet is a positive instance with the bound attained; the second is the negative control the previous review asked for, and it is a genuine discriminator: it fails exactly the hypothesis added.
- Shape: the Checks heading “**Checks**, with one point `0`, …” matches the file's existing pattern (README:898, :1184, :1189); Checks on a theorem as negative controls are what the adversarial rules ask for; no Lean name is claimed by a Check.

### Sources and the seeded sample

None of the fifteen seeded targets of this round (0.1, 0.3, 0.5, 1.1, 1.6, 2.3, 3.1, 3.3, 3.4, 4.1, 5.1, 5.2, 5.7, 6.2, 8.2) lies in the changed passages, so none is re-read here; seven of them (0.1, 0.3, 0.5, 1.1, 3.4, 4.1, 8.2) were read at their locators in the review of 768487d and their text is unchanged at this head. The changed passages cite two sources: Hua82 §17.9 (settled uncertified; background to the Mathlib Gelfond–Schneider formalisation, not used by any target) and Baker75, Chapter 2, Lemma 7 (settled uncertified; the archimedean original of §8.5). The §8.5 statement's mathematics was tested independently of the source as recorded below. No source was opened this round and no manifest was edited.

### Ownership and duplication

The diff creates no new object. The §8.5 object (ordinary-derivative Hermite interpolation with an ultrametric coefficient bound) was searched by object in the previous review against the pins, the roadmaps on main and the readable open heads (GenericDoublePointInterpolation §1 first jets, GlobalHolomorphicFunctions finite jets), with no owner found; nothing in this diff changes that. `Polynomial.factorial_smul_hasseDeriv` and `IsUltrametricDist.norm_natCast_le_one` at the pins are inputs, not duplicates of the target. Ownership against open pull requests whose files the brief does not supply was not checked beyond the roadmap index.

### Adversarial table: every Lean declaration

Rows for the two touched declarations (lines 409 and 611) are this review's own, with the values computed; every other row is carried forward from the review of 768487d, the statement and its line being unchanged at this head.

| Line / statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 76, multi-index coefficient definition | p₂(u,v)=u₀v₁: coefficient (1,1)=1+0=1. For p₂=u₀v₀, coefficient (2,0)=1, not 2. Constant degree zero over an empty coordinate type gives 7. | Pass; permutation multiplicity is correct. (carried from the review of 768487d) |
| 83, diagonal evaluation as monomials | z=(2,3), p₂(u,v)=u₀v₁: p₂(z,z)=6 and coefficient sum 1·2·3=6. Empty coordinates: degree zero c=c, positive degrees 0=0. | Pass. (carried from the review of 768487d) |
| 91, regrouped HasSum | Geometric series at z=1/2: sum=2=f(z). Empty coordinates leave the constant c=c. | Pass. (carried from the review of 768487d) |
| 100, constructing a series from coefficients | c_k=1, controlling radius 1/2: weighted absolute sum=2; at z=1/4, sum=4/3 and extracted c₂=1. | Pass. (carried from the review of 768487d) |
| 108, coefficient uniqueness | Alternating p₂(u,v)=u₀v₁−u₁v₀ has diagonal 0 and mixed coefficient 1−1=0, although p₂ is nonzero. | Pass; excludes the false stronger uniqueness claim. (carried from the review of 768487d) |
| 116, Taylor-coefficient definition | z² at 3 has coefficients 9,6,1. For 1+conj(z) at 0, nonanalytic default coefficients are all 0 although f(0)=1. | Pass; junk convention explicit. (carried from the review of 768487d) |
| 120, representative independence | Adding the alternating form above changes the representative but leaves the mixed coefficient 1+0=1. | Pass. (carried from the review of 768487d) |
| 126, addition | z²+3z at 1: coefficient of degree one is 5=2+3. | Pass. (carried from the review of 768487d) |
| 132, scalar multiplication | Nonanalytic conjugation, scalar 2: default coefficient 0=2·0; scalar 0: coefficient 0=0·0. | Pass, including zero scalar. (carried from the review of 768487d) |
| 137, locality | z² near 3: coefficient of degree one is 6 on both sides; altering a value at 100 leaves 6. | Pass. (carried from the review of 768487d) |
| 142, translation | z² translated by 2 and expanded at 3: derivative coefficient 10=2(3+2). | Pass. (carried from the review of 768487d) |
| 148, factorial and iterated derivative | z₀²z₁, index (2,1): coefficient 1 multiplied by 2!1! gives 2, the derivative. In characteristic 2 both derivative and factorial multiple are 0, while coefficient is 1. | Pass; no division by factorial. (carried from the review of 768487d) |
| 157, univariate factorial identity | z³, order 3: 3!·1=6. In characteristic 3 both sides are 0. | Pass. (carried from the review of 768487d) |
| 164, product coefficients | f=1+z, g=z² at 1, degree one: 5=2·2+1·1. | Pass. (carried from the review of 768487d) |
| 172, absolute expansion | Geometric coefficients with control radius 1/2 and displacement 1/4: absolute control sum 2, evaluated sum 4/3. | Pass. (carried from the review of 768487d) |
| 181, Taylor expansion at a point | z² at 3, displacement 1/2: 9+6/2+1/4=49/4=(7/2)². | Pass. (carried from the review of 768487d) |
| 190, total-order vanishing under linear maps | f=z₀², A(s,t)=(s+t,t): degree-one coefficients are 0 before and after. Degree-two mixed coefficient changes 0→2, so rectangular-order preservation is not asserted. | Pass. (carried from the review of 768487d) |
| 198, divided slope | f=z², centre 3: extended slope at 3 is 6; at 4 it is (16−9)/(4−3)=7. | Pass. (carried from the review of 768487d) |
| 211, little-o order bound | f=w², T=2: norm divided by norm(w)^(T−1) is norm(w)→0. A nonanalytic germ does not acquire positive analytic order from its default zero coefficients. | Pass. (carried from the review of 768487d) |
| 218, Schwarz order estimate | f=w², ρ=2, M=4, T=2, w=1: 1=4(1/2)². T=0 yields 1≤4. | Pass. (carried from the review of 768487d) |
| 229, multivariate Cauchy bound | f=z₀z₁, R=2,M=4,ρ=1,index(1,1): 1≤4. At ρ=0 the positive-degree weighted coefficient is 0≤4. | Pass. (carried from the review of 768487d) |
| 236, remainder bound | f=z²,R=2,M=4,z=1, cutoffs T=0,2,3: remainder norms 1,1,0; respective bounds 4,3,2. | Pass. (carried from the review of 768487d) |
| 246, Cartesian Schwarz estimate | One variable, E={0}, multiplicity 2, r=1,R=5,M=25,f=z²: 1≤225. Empty interpolation set gives no zero gain. | Pass. (carried from the review of 768487d) |
| 265, exponential-monomial coefficient | z²exp(z) at 1, coefficient degree one: 3e=e(1+2). exp(z) at 0, degree two: 1/2, including an index greater than the polynomial degree. | Pass. (carried from the review of 768487d) |
| 272, exponential-polynomial independence | Frequencies 0,i with polynomials 1,−1: value 0 at 0 but 2 at π; (D−i) eliminates exp(iz) and leaves −i. Empty coordinate space admits at most one distinct frequency. | Pass. (carried from the review of 768487d) |
| 288, archimedean Liouville | K=ℚ,x=2: norm·house^0=2≥1. x=1/2 would give 1/2<1 and is excluded by integrality. | Pass. (carried from the review of 768487d) |
| 295, denominator-aware bound | x=1/2,δ=2,a=1,H=1: clearing gives 1; the lower-bound product equals 1. δ=0 is excluded. | Pass. (carried from the review of 768487d) |
| 302, real Thue–Siegel | Form (1,1),U=2,X=1, three boxes < four candidate vectors: ξ=(1,−1) gives value 0≤2/3. Zero unknowns do not satisfy the counting hypothesis. | Pass. (carried from the review of 768487d) |
| 309, complex Thue–Siegel | Four coefficients 1/2,U=log2,V=0,X=1: (2√2+1)²≈14.657≤16; ξ=(1,−1,0,0) gives 0≤1. No equations yields count 1≤2. | Pass. (carried from the review of 768487d) |
| 320, number-field Siegel | Matrix [1,1]: vector (1,−1) has image 0 and house 1≤2C. Zero matrix admits (1,0), handled outside the native nonzero-matrix lemma. | Pass. (carried from the review of 768487d) |
| 335, auxiliary function | 1024 constant functions, N=1,U=log1024,V=6,log(R/r)=2: W≈13.931, count ≈776.34≤2048; coefficients (1,−1,0,…) give function 0. | Pass. (carried from the review of 768487d) |
| 353, inhomogeneous Schneider–Lang | n=d₀=d₁=1,x=y=1: coordinate candidate 1 is algebraic, exponential candidate e is not. n=0 cannot meet the required nonempty independent family and strict dimension conditions. | Pass. (carried from the review of 768487d) |
| 368, homogeneous criterion | n=1,d=2,x=(1,√2),y=(log2,0): candidate values 2,2^√2,1,1; at least 2^√2 is transcendental. | Pass. (carried from the review of 768487d) |
| 376, one-dimensional criterion | d=1,x=y=1: exponential is e≈2.7182818285. d=0 is excluded by NeZero. | Pass. (carried from the review of 768487d) |
| 385, logarithm form of Hermite–Lindemann | log2 has exponential 2; 2πi has exponential 1; both logarithms are nonzero. Zero would also exponentiate to 1 and is excluded. | Pass. (carried from the review of 768487d) |
| 391, exponential form | Input 1 gives e; input 0 gives 1 and fails the nonzero hypothesis. | Pass. (carried from the review of 768487d) |
| 397, principal logarithm | Inputs 2,1,0 give log2≈0.693147,0,0; the latter two are excluded. | Pass. (carried from the review of 768487d) |
| 403, branch-free Gelfond–Schneider | x=log2,b=√2: exp(bx)=2^√2≈2.665144. Rational b=1/2 would give √2 and is excluded. | Pass. (carried from the review of 768487d) |
| 409, principal-power Gelfond–Schneider (docstring reworded; statement unchanged) | `2 ^ √2 ≈ 2.6651441427` with base `2 ∉ {0, 1}` and `√2 ≠ i / j` for all integers `i, j` is admitted. `4 ^ (1 / 2) = 2` is algebraic: `1 / 2 = i / j` with `(i, j) = (1, 2)`, so the irrationality hypothesis excludes it. `β = 0 = 0 / 1` and `β = 0 / 0 = 0` (junk division) are both excluded, so `j = 0` opens no loophole. Elaborated type at this head agrees with the README form of 6.4 verbatim. | Pass, this review. |
| 416, quotient of logarithms | log4/log2=2; log3/log2≈1.5849625 is the transcendental alternative. Denominator zero is excluded. | Pass. (carried from the review of 768487d) |
| 429, Baker relation in an algebraic basis | Basis (2) of ℚ: logarithm 0 gives sum 0. With log2 the sum is log4, so the premise that the sum is algebraic fails. | Pass. (carried from the review of 768487d) |
| 437, Baker affine independence | Logs 2,3 with β₀ and all coefficients zero give sum 0. Logs 2,4 with β₀=0 and coefficients 2,−1 give 0 but fail rational linear independence. | Pass. (carried from the review of 768487d) |
| 444, affine independence | Empty logarithm family leaves the relation β₀=0. For one independent logarithm, all-zero coefficients give 0 and no nontrivial relation. | Pass. (carried from the review of 768487d) |
| 452, nonzero algebraic constant in affine form | Logs 2,4 with coefficients 2,−1 cancel; adding β₀=1 gives 1≠0 even though those logs are dependent. | Pass. (carried from the review of 768487d) |
| 460, nonzero linear form is transcendental | Coefficients 3,−1 on logs 2,4 give log2; coefficients 2,−1 give 0 and are excluded. | Pass. (carried from the review of 768487d) |
| 467, exponential of affine form | Empty family and β₀=1 gives e. β₀=1, log2 coefficient 1 gives 2e. Setting β₀=0 would give algebraic 2 and is excluded. | Pass. (carried from the review of 768487d) |
| 476, exponential with independent algebraic coefficients | ℓ=(0,log2),β=(√2,√3): value 2^√3≈3.321997. All-zero ℓ would give 1 and is excluded. | Pass; previous R01 repaired. (carried from the review of 768487d) |
| 486, product of algebraic powers | Bases (1,2), coefficients (√2,√3): product 2^√3. All bases 1 give 1 and fail the existential hypothesis. | Pass. (carried from the review of 768487d) |
| 504, integer norm comparison | p=3,n=3,6,−3: real absolute value times p-adic norm is 1,2,1 respectively. n=0 gives 0 and is excluded from the lower bound. | Pass. (carried from the review of 768487d) |
| 514, exponential radius | p=2 gives 1/2; p=3 gives 1/√3. On the boundary, terms indexed by p^j have constant norm ρ, not a sequence tending to 0. | Pass; completeness unnecessary for the radius. (carried from the review of 768487d) |
| 519, local exponential addition | In ℚ₃, x=3,y=−3: exp(x+y)=1=exp3·exp(−3), both inputs inside the disc. | Pass. (carried from the review of 768487d) |
| 525, exponential minus one norm | p=3,x=3: both sides 1/3. p=2,x=4: both sides 1/4. | Pass. (carried from the review of 768487d) |
| 530, isometry/injectivity | In ℚ₃,x=3,y=6: norm(x−y)=1/3=norm(exp x−exp y)>0. | Pass. (carried from the review of 768487d) |
| 535, exponential-polynomial HasSum | Q=X,ψ=3 over ℚ₃: at x=1 the series equals exp3; at x=0 both sides are 0. | Pass. (carried from the review of 768487d) |
| 546, coefficient norm bound | Q=1,ψ=3,r=1,p=3: coefficient norms at k=0,1,3 are 1,1/3,1/9, all ≤1. At r=0 positive-degree weighted terms are 0. | Pass. (carried from the review of 768487d) |
| 556, integral ultrametric bound | In ℚ₃, integral 3 has norm 1/3≤1; nonintegral 1/3 has norm 3 and is excluded. In characteristic 2, integral 1 has norm 1≤1. | Pass. (carried from the review of 768487d) |
| 561, ultrametric Liouville | x=3,H=3,D=1: norm(x)H^D=1. x=1/3,δ=3,H=1 gives product 3≥1. Replacing D by D−1 in the first test gives 1/3<1. | Pass. (carried from the review of 768487d) |
| 570, one-zero coefficient bound | f=X²,r=M=1,T=2,x=3 over ℚ₃: value norm 1/9=(1/3)². | Pass. (carried from the review of 768487d) |
| 588, many-zero coefficient estimate | f=X²,A={0},S=2,r=2,M=4: coefficient bound at k=2 is 1=4/2². Empty A gives 1≤4. | Pass. (carried from the review of 768487d) |
| 598, many-zero value estimate | Same f,A,S,r,M: at x=1 value norm 1≤1; at x=3 norm 1/9≤1. | Pass. (carried from the review of 768487d) |
| 611, Hermite interpolation with ultrametric bounds (README §8.5 re-stated over `K` ultrametric of characteristic zero) | One node `σ 0 = 0`, `ϱ = 1`, `S = 3`, `s = 2`; separation vacuous, `‖0‖ = 0 ≤ 1`, `0 < 1 ≤ 1`, `2 < 3`. `W = X ^ 2 / 2`: jets `D⁰W(0), D¹W(0), D²W(0) = 0, 0, 1` (scratch Lean over `ℚ`). Bound `‖(2!)⁻¹‖ · (1 ^ 3)⁻¹`: in `ℚ_[3]`, `‖1 / 2‖ = 1 = max coefficient norm`; in `ℚ_[2]`, `‖1 / 2‖ = 2 = 2` (scratch Lean, `Padic.norm_natCast_eq_one_iff`, `Padic.norm_p`). Over `ZMod 2[X]`: `D²W = 2! • hasseDeriv 2 W = 0` for every `W` (scratch Lean via `Polynomial.factorial_smul_hasseDeriv`, Mathlib/Algebra/Polynomial/HasseDeriv.lean:133), so no `W` has `D²W(0) = 1`; and `((2!) : ZMod 2)⁻¹ = 0` makes the bound `0`, forcing `W = 0`. Lean carries `[CharZero K]` at line 612; README now states it. | Pass; R01 repaired, this review. |
| 622, (D+c)^m definition | (D+2)X=1+2X; D²X³=6X; zero ring gives zero on both sides. | Pass. (carried from the review of 768487d) |
| 627, binomial formula | c=2,m=2,P=X²: both operator expansion and binomial sum give 2+8X+4X². | Pass. (carried from the review of 768487d) |
| 633, degree bound | The preceding polynomial has degree 2≤2. D³X²=0, whose natural degree is 0≤2. | Pass, including zero-polynomial junk degree. (carried from the review of 768487d) |
| 639, ultrametric coefficients | Over ℚ₃,c=1/3,m=2,P=X²: coefficients 2,4/3,1/9 have norms 1,3,9; all ≤max(1,3)²=9. | Pass. (carried from the review of 768487d) |
| 645, formal derivative identity | D(X exp(cX))=(1+cX)exp(cX); order zero is the original product on both sides. | Pass. (carried from the review of 768487d) |
| 656, p-adic affine independence | Empty family forces β₀=0; log₃4 has norm 1/3 inside the disc. Off-disc ℓ=1 has total exp value 0 and the relation −1+ℓ=0: the disc hypothesis excludes this false extension. | Pass. (carried from the review of 768487d) |
| 665, p-adic linear-form corollary | Singleton log₃4, coefficient 1: norm 1/3, nonzero. Coefficient 0 gives zero and fails the nonzero hypothesis. | Pass. (carried from the review of 768487d) |
| 674, transcendence of exp p for odd primes | Input 3 in ℚ₃ has norm 1/3<1/√3. The p=2 boundary input 2 has norm 1/2 and divergent exponential series. | Pass; the prime 2 exclusion is a convergence condition. (carried from the review of 768487d) |
| 684, transcendence of e | e=exp1≈2.7182818285; input 1≠0. | Pass, headline corollary. (carried from the review of 768487d) |
| 688, transcendence of π | exp(πi)=−1, with πi≠0; π≈3.1415926536. | Pass. (carried from the review of 768487d) |
| 691, exp π | Principal log(−1)=πi and (−i)(πi)=π; expπ≈23.1406926328. | Pass; sign pinned. (carried from the review of 768487d) |
| 694, 2^√2 | 2^√2≈2.6651441427; base 2 differs from 0 and 1. | Pass. (carried from the review of 768487d) |
| 697, log2 | exp(log2)=2 and log2≈0.6931471806≠0. | Pass. (carried from the review of 768487d) |
| 700, log2/log3 | Value ≈0.6309297536. A rational a/b would force 2^b=3^a; the integer-prime valuations force a=b=0, inconsistent with the nonzero denominator representation. | Pass. (carried from the review of 768487d) |
| 704, π+log2 | (−i)(πi)+log2=π+log2≈3.8347398341≠0. Both exponential values, −1 and 2, are algebraic. | Pass. (carried from the review of 768487d) |

### Adversarial table: remaining prose and proof quantities

| Target/convention | Computed instance or comparison | Result / change |
|---|---|---|
| §8.5 statement over general `K` (this review) | Trivial absolute value on `ℚ`: ultrametric, characteristic zero; `‖1 / s!‖ = 1 ≥ 1` for every `s`, the bound is `ϱ ^ (-(card ι · S))`, and the Lagrange–Hermite polynomial with the requested jets has coefficients of norm `≤ 1 ≤` that bound: the statement is consistent, and the equality `‖1 / s!‖ = p ^ (v_p (s!))` has no `p` to refer to. `ℚ_[2]`, `s = 2`: `‖1 / 2!‖ = 2 = 2 ^ (v_2 (2!))`; `ℚ_[3]`, `s = 3`: `‖1 / 3!‖ = 3 = 3 ^ (v_3 (6))`. | Statement passes; the warning's equality is the P3 note. |
| §8.5 first Check (this review) | `W = X ^ 2 / 2`: `D⁰W(0) = 0`, `D¹W(0) = 0`, `D²W(0) = 1`; `‖coeff 2‖ = ‖1 / 2‖`, which is `1` in `ℚ_[3]` (`gcd(3, 2) = 1`) and `2 = (2⁻¹)⁻¹` in `ℚ_[2]`; the bound `‖(2!)⁻¹‖ · 1 ^ (-3)` is the same number in each case, so “which is the bound” and “both are `2`” hold. The wrong normalisation `W = X ^ 2` would give `D²W(0) = 2 ≠ 1`. | Pass. |
| §8.5 second Check (this review) | Over `𝔽₂((t))` with the `t`-adic norm (ultrametric, characteristic two): `D²(X ^ n) = n (n - 1) X ^ (n - 2)` and `n (n - 1) ∈ {0, 2, 6, 12, …}` is even, so `D²W = 0` for every `W`; Lean: `D²W = 2! • hasseDeriv 2 W = 0` over `ZMod 2`. The requested jet `D²W(0) = 1` is unattainable. `((2!) : 𝔽₂)⁻¹ = 0⁻¹ = 0`, so the bound is `0 · 1 = 0` and forces `W = 0`, failing the same jet a second way. | Pass; negative control is discriminating. |
| Sup norm and polydisc convention | norm(2,3i)=3; membership in the radius-3 product disc and the closed sup ball both hold. | Pass. (carried from the review of 768487d) |
| 0.1, finite products | Two geometric sums at 1/2 and 1/3 give 2·(3/2)=3; double sum also 3. Empty product=1; a zero factor gives 0. | Pass. (carried from the review of 768487d) |
| 0.2, normally convergent analytic sum | g_n(z)=2^(−n)z: sum=2z; at z=1/2 both sum and claimed function are 1. Tail after N has size 2^(1−N)·norm(z). | Pass. (carried from the review of 768487d) |
| 0.3, coefficient API | Addition gives 1+3=4; scalar 2 gives 2·1=2; zero series gives 0. Constant series 1 has coefficient 1 and does not represent the zero germ. | Pass. (carried from the review of 768487d) |
| 0.4, constants, subtraction and monomials | Constant 7 has degree-zero coefficient 7 and positive coefficients 0; subtraction 2−3=−1. z₀²z₁ has coefficient (2,1)=1 and all other coefficients 0. | Pass. (carried from the review of 768487d) |
| 0.5, coordinate division | f=z₀²(1+z₁), at (2,3): f=16, quotient=4, factor z₀²=4, product=16. Constant 1 has nonvanishing degree-zero coefficient and is excluded. | Pass. (carried from the review of 768487d) |
| 1.1, coordinate maximum | z₀z₁ on radius-2 polydisc has boundary maximum 4; at (1,1) norm=1≤4. Radius zero reduces to the single point where the value is 0. | Pass. (carried from the review of 768487d) |
| 1.2, division estimates | f=z²,R=3,r=1,M=9: quotient by z² is 1; the crude bound is 9/4, and the central power estimate gives the sharp 9/9=1. | Pass. (carried from the review of 768487d) |
| 1.4, homogeneous term and coefficient extraction | Degree-two term z₀z₁ at (1,1) has norm 1≤4. Averaging over third roots isolates index (1,1): selected term contributes ρ², index (2,0) contributes 0. | Pass; normalization fixed. (carried from the review of 768487d) |
| 1.5, Taylor truncation | z²,R=2,M=4,z=1,T=3: norm(f)=1≤2+1=3, with remainder bound 2 and retained term norm 1. | Pass. (carried from the review of 768487d) |
| 1.6, Cartesian bound constant | n=1,r=1,R=5,total multiplicity 2: K=1+(1+3)=5; multiplying by M=25 gives 125≥norm(f(1))=1. | Pass; intentionally nonsharp. (carried from the review of 768487d) |
| 2.1, finite exponential-polynomial combinations | (z²−1)expz at 1 has degree-one coefficient 2e; it is a finite sum of entire terms. | Pass. (carried from the review of 768487d) |
| 2.2, growth | At z=1 the exponential norm is e≤4e under the corresponding polynomial bound. Degree-zero monomial at zero is 0^0=1, not 0. | Pass. (carried from the review of 768487d) |
| 2.3, distinct frequencies necessary | Repeated frequencies 0,0 and polynomials 1,−1 give the zero function although neither polynomial is zero. | Pass; injectivity excludes this. (carried from the review of 768487d) |
| 3.2, denominator arithmetic | α=1/2,β=1/3,δ=6: cleared sum 5=3+2; cleared product 6=3·2; square numerator 9=3²; raising denominator exponent multiplies 3 by 6 to 18. | Pass. (carried from the review of 768487d) |
| 3.2, indexed product versus set product | Family (2,2) has product 4; its image set has product 2. The requested indexed version retains multiplicity. | Pass; not duplicate set API. (carried from the review of 768487d) |
| 3.3, finite number field and common denominator | S={√2,1/3}: field ℚ(√2), δ=3, cleared houses 3√2 and 1, both ≤5. Empty S gives ℚ with δ=G=1. | Pass. (carried from the review of 768487d) |
| Packing input to 3.4 | S={−1,1},ε=c=1: separation 2>1 and cardinality 2≤16. Taking ε=5,c=1 would give a singleton bound 1≤16/25, false; ε≤c is retained. | Pass. (carried from the review of 768487d) |
| 4.1, modified analytic constant | At W=12 and T=17, 1+T=18<e⁴/2≈27.299. This supplies slack for the declared 1+T variant. | Pass. (carried from the review of 768487d) |
| 5.1, F and Γ normalization | T=0 gives a constant family bounded by e^N. z₀expz₁ at (2,3) is 2e³, not 3e². For exp(2z),ρ=2,N=0,T=2, actual norm e⁴≈54.598≤Γ=3e⁴≈163.794; a mis-scaled exponent would give ≈22.167 and fail. | Pass. (carried from the review of 768487d) |
| 5.2, arithmetic size parameters | For M=0,1,2, exponent a=2,3,4 and H=8,24,64. Constant coefficient 2 is bounded by H=2 when T=0. | Pass. (carried from the review of 768487d) |
| 5.2, G need not exceed δ in complex estimate | d₀=0,T=1,δ=2,G=1,ε=1/2,θ=3/2: cleared value 3≤4. This tests the permitted asymmetry without assuming G≥δ. | Pass. (carried from the review of 768487d) |
| 5.3, Λ and factorial loss | The same small cases give Λ=8,24,256. For total degree 2, σ! is 1 or 2, each ≤2²=4. M=0 uses 0^0=1. | Pass. (carried from the review of 768487d) |
| 5.4, nonvanishing requires independence | x=(1,2): multi-indices (2,0) and (0,1) both have frequency 2; opposite coefficients cancel to F=0. | Pass; hypothesis excludes the example. (carried from the review of 768487d) |
| 5.5, transporting vanishing | n=2,M=3 gives floor(M/n)=1: the required coordinate rectangle contains only (0,0), total degree 0<3. With Λ=8,U=log16, upper 1/16 contradicts lower 1/8 for a nonzero value. | Pass; uses total-order control. (carried from the review of 768487d) |
| 5.6, parameter constants | In the recorded smallest-dimensional test c=1/144,K₁=3457,S₁=60,r=63. At q=10⁶, W≈2.15867352468·10¹¹; counting sides ≈1.86394855447·10²³ and 3.31369294642·10²³. | Pass for counting. (carried from the review of 768487d) |
| 5.6, “sufficiently large” is essential | At q=10⁶,S₀=289268151 the initial log bound is about −9.03052733·10¹⁰, but extrapolation logs at S₀ and 2S₀ are positive, about 1.56778975·10¹³ and 2.20545850·10¹³. At q=10¹⁰⁰⁰ their normalized logs are about −18.7485 and −50.7718. | Consistent with an eventual, not all-q, claim. (carried from the review of 768487d) |
| 5.7, zero basis vector | Setting y=0 makes coordinate/exponential candidates 0 and 1, both algebraic; it fails the independent-family hypothesis. | Pass. (carried from the review of 768487d) |
| 6.1, broader rank version | x=(1,√2,2) has rational rank 2 but is not independent as a three-element family. The stronger rank formulation belongs to the named consumer. | Pass; scope boundary explicit. (carried from the review of 768487d) |
| 7.1, embedding matrix | Basis (1,√2): matrix rows (1,√2),(1,−√2), determinant −2√2, determinant square 8≠0. Both uses of invertibility in the argument have this input. | Pass. (carried from the review of 768487d) |
| 7.3, joint coefficient independence | Coefficients √2,−√2 on the same nonzero logarithm sum to 0 and exponentiate to 1; each is irrational but the pair is rationally dependent. | Pass; joint hypothesis is needed. (carried from the review of 768487d) |
| 8.1, factorial and small primes | p=2,n=4: norm(4!)=1/8≥1/16. p=3,n=3: norm(3!)=1/3≥3^(−3/2). exp6=(exp3)² and norm(exp3)=1 in ℚ₃. | Pass. (carried from the review of 768487d) |
| 8.2, trivial valuation and denominators | At a trivial norm on an algebraic closure of ℚ, integral 2 gives product 2≥1; x=1/2,δ=2,H=1 clears to 1. | Pass; no unnecessary nontrivial-norm assumption. (carried from the review of 768487d) |
| 8.3, characteristic restriction | In characteristic 2, f=X² has all ordinary derivatives of positive order zero, so S=3 at 0 would falsely imply 1≤4/2³=1/2. §8.3 explicitly excludes this by characteristic zero. | Pass; contrasts with R01. (carried from the review of 768487d) |
| 8.4, operator Checks | (D+2)X=1+2X, D²X³=6X, and (D+c)^m1=c^m. The wrong sign gives 1−2X in the first test. | Pass. (carried from the review of 768487d) |
| 8.6, frequencies | ℓ=(3,6): indices 0,(1,0),(2,3) give ψ=0,3,24. The last two have 3-adic norms 1/3 and 1/3, bounded by max norm(ℓ)=1/3. | Pass. (carried from the review of 768487d) |
| 8.6, γ and constant frequency | β=2,β₀=5: indices (2,3),(0,3),(1,0) give (γ,e_none β₀)=(7,10),(3,0),(2,5). | Pass. (carried from the review of 768487d) |
| 8.6, derivative factors and diagonal evaluation | For d=2 and (γℓ,c)=(42,10), the zeroth factor is X², none derivative 2X+10X², and other derivative 42X². At natural l=2, exp(2ℓ)=(expℓ)². The sum-of-derivatives formula additionally uses the stated affine relation. | Pass. (carried from the review of 768487d) |
| 8.7, coefficient integrality | P=1/2,δ=1 would leave nonintegral 1/2 and is excluded. With k=0,L=l=δ=1,α=4,G=4,P=1,m=0, the algebraic coefficient has house 1≤32. | Pass. (carried from the review of 768487d) |
| 8.7, counting | k=0,L=h=1: two equations and four unknowns; doubling the equations gives 4≤4. The selected denominator exponent is 2. | Pass. (carried from the review of 768487d) |
| 8.7, logarithm separation | α=1/4,δ=G=4 at p=3 gives norm(log α)=1/3≥1/8. The erroneous choice G=1 would demand 1/3≥1/2 and is not allowed by the hypotheses here. | Pass. (carried from the review of 768487d) |
| 8.7, E API | The four supplied small cases evaluate to 4,64,12,64; increasing the relevant nonnegative parameter increases or preserves the product. | Pass. (carried from the review of 768487d) |
| 8.8, final inequality is a hypothesis | k=0,L=h=D=G=C=1,p=3,r₀=2,S=R=0 gives Π=16: the proposed smallness comparison reads 1536<1 and fails. This tiny instance is not claimed to finish the proof. | Pass; avoids vacuous parameter assertion. (carried from the review of 768487d) |
| 8.8, Hermite elimination | Two distinct frequencies with two derivative orders give product multiplicity 4; the interpolation order must cover all four conditions, not two. | Pass. (carried from the review of 768487d) |
| 8.9, k=0 parameter powers | K_max=21,h=X⁷,L=X¹¹,R_J=X^(7+J),S_J=2^(21−J)X¹³. Counting exponents are 21<22; S₀/h²=2²¹/X→0. | Pass. (carried from the review of 768487d) |
| 8.9, extrapolation and final margin | Gain exponent 20+J exceeds cost exponent 19+J; initial log E has size X¹⁴logX. In general final gain exponent 6k²+32k+41 exceeds 6k²+29k+33 by 3k+8>0, including k=0. | Pass. (carried from the review of 768487d) |
| 8.10, reciprocal radius and small primes | log₃4 has norm 1/3, reciprocal radius √3; log₂5 has norm 1/4, reciprocal radius 2. Both are strictly inside their exponential discs. | Pass. (carried from the review of 768487d) |

The two new rows and the previous row “8.3, characteristic restriction” agree with each other and with §8.3 and §8.5: ordinary derivatives of positive order vanish identically in characteristic two, and both targets now exclude it.

## Not verifiable

- **Baker75**, A. Baker, *Transcendental Number Theory* (1975), Chapter 2, Lemma 7, the source §8.5 cites; **Brumer67**; **BM80**; **Hua82** §17.9 (cited in the changed Scope and §6.4 passages); **Lang66**; **BG06**: all settled uncertified in the source record; not opened, no request made.
- The two external Mathlib formalisations the changed passages mention (Gelfond–Schneider by the one-variable method; Lindemann–Weierstrass) and the frozen branches in Provenance were not built or read this round; the previous review compared the Gelfond–Schneider signature, and the statement at Suggested.lean:409 is unchanged.
- Ownership against open pull requests whose files were not supplied was not checked beyond the roadmap index.

## Source issues

- none
