# Review of ZerosOfLFunctions (pull request #253 at 6328e1c)

**Verdict:** needs changes

## R01 (P1) — The rectangle integral counts singularities outside the rectangle

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:1243`, “the conclusion … ∑ s ∈ S, ord_s f”.

**Claim:** The normalized boundary integral equals the sum of the orders at every member of the finite set `S ⊆ U`.

**Witness:** Take `U = ℂ`, `R = [−1,1] × [−1,1]`, `f(z) = z − 2`, and `S = {2}`. All four hypotheses hold. The normalized integral is `0`; the asserted sum is `1`.

**Repair:** State the weighted sum over `S`, then specialize it to the sum over `S ∩ interior R`. The text at line 1261 already gives this correction, contradicting line 1243. With the repair, the example gives `0 = 0`; with `f(z)=z`, `S={0}`, it gives `1 = 1`. Consume the pinned general theorem identified in R07.

## R02 (P1) — The ray-class contract identifies two different main coefficients

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:200` and `:2002`, “the analytic residue and the counting constant are one constant and not two”. Also the finite-Euler-factor explanation at line 1611.

**Claim:** `GlobalNumberFields.rayClassIdealMainTerm` supplies the coefficient in the effective prime count, including its finite Euler correction.

**Witness:** For `K=ℚ`, modulus `3∞`, the ray class group has order `2`. `rayClassIdealMainTerm_eq` gives `(1/2)(1−1/3)=1/3`. The weighted prime count in either invertible class has coefficient `1/2`.

**Repair:** Separate the residue of a partial zeta function, used to count all ideals, from the pole coefficient of its character logarithmic derivatives, used to count primes. Keep `x/#Cl` and `Li(x)/#Cl` in Layer 8.7; remove the identification with `rayClassIdealMainTerm`. Deleting the Euler factor at `3` changes the logarithmic derivative by a function regular at `1`, and changes the prime-power sum by `⌊log₃x⌋ log 3 = O(log x)`, not its leading coefficient. This gives `1/2` on the witness and retains `1/3` for the different all-ideal count. The supplier's actual formula is `TauCetiRoadmap/GlobalNumberFields/Suggested.lean:314` on main.

## R03 (P1) — Several exact supplier declarations do not exist at the cited pin

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:217` and `:235`, “all realized in Tau Ceti” and “as realized in Tau Ceti”. The average-coefficient field is also asserted at line 174.

**Claim:** The pinned Tau Ceti supplies the ArithmeticDirichletSeries and Chebotarev declarations listed here; the LFunctions data record supplies `HasAverageCoefficientBound.coeff_avg`.

**Witness:** At Tau Ceti `e8af08d0`, searches for `logIntegral`, `frobeniusPrimeSet`, `idealSummatory_mul_eq_sub_integral_mul`, and `truncatedPerron_LSeries` return no declarations. Neither named directory exists. LFunctions' supplied head has neither `HasAverageCoefficientBound` nor `coeff_avg`.

**Repair:** Cite the existing roadmap owners and their actual sections instead of nonexistent pinned implementations: `Completed/ArithmeticDirichletSeries/README.md` Layer 6 and Layer 10, and `Completed/Chebotarev/README.md` for the counting carriers and qualitative endpoint. The corresponding target statements occur in `Completed/ArithmeticDirichletSeries/Suggested.lean:1006`, `:1047`, `:1087`, `:1095`, and `Completed/Chebotarev/Suggested.lean:1438`. For the coefficient input, cite LFunctions Layer 0's actual average-growth target (`README.md:374`) and state the precise bound consumed; do not invent a structure field. If a stronger supplier output is needed, declare the precise gap through the prescribed mechanism. These repairs resolve to files actually present; they do not require changing either pin. `Suggested.lean:32` already correctly says that the pinned Tau Ceti lacks the ray-class/Frobenius carriers.

## R04 (P2) — The dependency gate fails on LFunctions

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:153` and `:169`, the LFunctions supplier edges.

**Claim:** This roadmap can consume LFunctions in the supplied merge order.

**Witness:** The dependency check reports `UPWARD: ZerosOfLFunctions (#310) -> LFunctions (#311)`. Moving this roadmap after LFunctions is obstructed by its existing consumer ComputationalNumberTheory at position 211.

**Repair:** Reconcile ownership and order for the chain `LFunctions → ZerosOfLFunctions → ComputationalNumberTheory`. For example, give the early generic rectangle/counting interfaces consumed by ComputationalNumberTheory an earlier owner, and cite that owner from both roadmaps; retain the L-function-specific results here after their supplier. Alternatively arrange a consistent order for all three. Re-run the same dependency check: the concrete acceptance condition is no `UPWARD` or `CYCLE` output and a passing gate. A move of this folder alone fails that test. The numbers in this finding are merge positions, not pull-request numbers.

## R05 (P2) — A height bound on the poles needs a strict margin

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:465`, “with T₀ any bound for the imaginary parts of the polar support”; compare the inclusive threshold at line 460 and the propagation in Layer 3.3.

**Claim:** The polynomial strip estimate holds for `T₀ ≤ |t|` whenever `T₀` bounds the pole heights.

**Witness:** Use the roadmap's shifted product `Λζ(s−iH)Λζ(s+iH)`, with `H>0`, and set `T₀=H`. At `t=H`, its norm tends to infinity as `σ→1`; `C(1+H)^A` stays finite.

**Repair:** Choose `T₀` strictly larger than the maximum absolute pole height, for example `H+1`, and allow the constants to depend on the positive margin. Merely changing `≤` to `<` does not give a uniform bound when heights approach the pole. With `H+1`, the witness's poles are distance at least `1` from the admitted heights; the entire-completion assertion and the families' threshold `2` remain valid.

## R06 (P2) — The first Hecke logarithmic-derivative bound needs the nontrivial-character hypothesis

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:1129`, “−Re (logDeriv L_χ)(σ + it) ≤ ½ Real.log … + O(1) − ∑_ρ …”.

**Claim:** This bound is stated for a primitive character without excluding the trivial primitive character, which Layers 6.2–6.4 explicitly include.

**Witness:** Set `K=ℚ`, `χ=1`, `t=0`, and `σ=1+u`. The left side is `1/u+O(1)`. The proposed right side is bounded above as `u↓0`, because its zero sum is subtracted and nonnegative.

**Repair:** Put `χ ≠ 1` in the first statement, or add the appropriate polar terms in a unified statement. Keep the separately displayed trivial-character estimate with `1/(σ−1)`. The corrected trivial specialization has the same leading `1/u` on both sides. Kadiri's identity includes both polar terms; it does not justify their omission (`kadiri2012 line 230`, §2.1.2).

## R07 (P2) — Generic contour theory is already owned by the pinned library

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:122` and `:244`, “hungerbuhlerWasem_residueTheorem is the first statement there that does”; Layers 7.2–7.3.

**Claim:** The generic cycle argument principle and continuous argument lift must be built here, through the principal-value theorem.

**Witness:** `TauCeti/Analysis/Contour/Argument/Cycle.lean:110` already proves `argumentPrinciple_nullHomologous` for closed piecewise-C¹ cycles avoiding the singularities. `TauCeti/Analysis/Contour/Argument/Lift.lean:412` already constructs the continuous argument lift.

**Repair:** Import these results by exact declaration, retaining the rectangle geometry, compact localization and L-function argument estimates as this roadmap's additions. Also consume `TauCeti/Analysis/Contour/LogDerivFTC.lean:226` for the winding/log-derivative bridge. Do not rebuild the general results through principal values. The theorem at line 110 has the finite-order, pointwise-analytic, nonvanishing, closed-curve and null-homology hypotheses needed here; its weights give `0` for the outside zero in R01 and `1` for an inside simple zero. The lift supplies an angle change `2π` for one counterclockwise turn. Likewise consume Mathlib's reciprocal-gamma entirety (`Analysis/SpecialFunctions/Gamma/Deligne.lean:89,97`) when forming the finite product in Layer 1.6; keep only the genuinely additional product/divisor interface.

## R08 (P2) — Statable Hadamard and Weil headlines are missing from Suggested.lean

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:119` and `:978`; `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean:76` states only the zeta instance.

**Claim:** The roadmap exports Hadamard factorization for every entire function of order at most one, but its acceptance test covers only `zetaEntireCompletion`.

**Witness:** A scratch declaration using `Differentiable ℂ f`, `f 0 ≠ 0`, the README's real-bodied `OrderLE`, `MeromorphicOn.divisor` and `Multipliable` elaborates at both pins, with only its theorem's `sorry` warning.

**Repair:** Add this general headline and its simple order predicate; it is not an API lemma or a free-predicate substitute. State convergence and the factorization exactly as in Layer 5.6. Keep the zeta specialization if it also serves as an acceptance theorem. The general statement covers `f(z)=1−z`, giving `a=0`, `b=−1`, and `(1−z)=exp(−z)E₁(z)`, and `f(z)=exp(cz)`, giving the empty product and `b=c`. The zeta-only statement tests neither of these promised cases. Also include the zeta instance of the smooth Weil formula in Layer 8.4: its test function, smoothness, compact support, Mellin transform, gamma logarithmic derivative, divisor sum and von Mangoldt prime sum all have native carriers. Missing general number-field continuation does not prevent stating this instance. The Mellin definitions and inversion theorem are at `Mathlib/Analysis/MellinTransform.lean:91,96` and `Mathlib/Analysis/MellinInversion.lean:92`; the zero-test instance gives zero on both sides. No stand-in for a general Hecke carrier is needed.

## R09 (P3) — Two negative-control Checks give the wrong answer

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:494`, “not simply connected, so the branch does not exist”; `:1819`, “2(φ̃(0) + φ̃(1))”.

**Claim:** The sector fails to be simply connected at `δ=0`; replacing only the positive divisor in the Weil identity by the signed divisor causes twice the pole contribution as an error.

**Witness:** At `δ=0`, `log` identifies the sector with `(0,∞) × (−π,π)`, a convex strip. If `Z=P+A` and `P=φ̃(0)+φ̃(1)>0`, signed counting changes `Z` to `Z−P`, leaving an error `−P`, not `−2P`.

**Repair:** Retain `δ>0` to ensure a uniform angular margin for Stirling's estimate, without asserting nonexistence of a branch at `δ=0`. Replace the Weil Check's error by one pole contribution. For a nonnegative, nonzero smooth compactly supported test function, `P>0`, so the repaired Check discriminates the two conventions. Also correct “not in the fixed region” at line 1046: the displayed inequality defines membership in that region. Delete the universal claim at lines 1502–1503 that the test transform vanishes at only finitely many zeros: the permitted zero test function vanishes at every zero. Absolute summability is the required statement.

## R10 (P3) — The source table misreports the texts at its locators

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:1993` and `:1995`, the Titchmarsh and Trudgian source rows.

**Claim:** Titchmarsh leaves the extension to zero ordinates unproved; the displayed decimal constants are those of Trudgian's published Theorems 1 and 2.

**Witness:** `titchmarsh1986 lines 6980–6985`, pp. 212–213, explicitly extends Theorem 9.3 to ordinates. `trudgian2015 lines 19–29`, p. 1439, gives `(0.315,6.455)` and `(0.316,5.872,3.655)`, not the displayed tuples.

**Repair:** Cite the already proved extension, and either use the published constants or identify and legally verify the version containing the other constants. With `n=1`, `d=1`, `T=1`, the published Dedekind right side is `9.527`; the README's is `9.815`, so these are different formulas even before estimating a zero. The asymptotic headline survives either tuple; this finding concerns accurate sourcing. Add exact locators to the unsourced individual targets as part of R11; a general reading reference does not certify a theorem.

## R11 (P3) — The README does not have the required roadmap structure or per-definition Checks

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:3`, `:36`, `:403`, and the numbered definitions beginning at `:426`, `:632`, `:959`.

**Claim:** The document supplies the required prose layers, exact per-target dependencies, and three discriminating Checks for each definition.

**Witness:** There is no opening `**Summary.**`, no `*Needs:*` line, and no per-layer `### Examples` or `### Dependencies`. Layer headings are level three; the elementary factor definition has no three-Check list. Own backticked names such as `OrderLE` have no declaration in Suggested.lean.

**Repair:** Reshape it to the prescribed headings and prose subsections; retain each definition's API and attach at least three discriminating Checks. Add statement-specific dependencies and locators, keeping supplied results in Scope and ownership and Exact supplier contracts. For `E₁`, suitable computed controls are `E₁(0)=1`, its simple zero at `1` with derivative `−e`, and the vanishing linear term in `E₁(z)=1−z²/2+O(z³)`. Use prose for internal target names not declared in Suggested.lean. Remove process commentary, including the retrospective repair discussion at lines 412–416. Do not fill the Lean file with the missing API or Checks.

## Verified sound

This is a review of the entire two-file folder, not an acceptance based on a successful sorry build. The finite-instance computations below test conventions and refute overclaims; they are not substitutes for proofs or for the unavailable sources listed below. There are **11 findings: 3 P1, 5 P2, 3 P3**. No previous review was supplied.

The head and both pins were checked: Mathlib `05ae0103f49b1ad1248f6039bbbad43d8aeb52a9`, Tau Ceti `e8af08d0aeda4012832880bd56edfc88af061691`. The main-branch comparison used content head `2b363a2b5643eed47f0cf2ed7ffcc85141b79af4`. The pull request changes nothing outside this roadmap folder. Both reviewed files remain unchanged. I read the repository README's writing checklist and CONTRIBUTING, and compared the shape with the complete `Completed/ContourIntegration/README.md` and `Completed/ArithmeticDirichletSeries/README.md`.

The worker's gate reports **build pass, dependency failure**. All other reported counters, including imports, sorry-data, stray files and outside-folder edits, are zero. I independently elaborated Suggested.lean: exit 0, nine sorry warnings and no other diagnostics. There are **11 declarations: two definitions and nine theorems**. A scratch copy with `#check @name` for each of the eleven elaborated successfully; no needed section binder disappeared. The worker's reported twelfth name was the word `in` mistakenly extracted from the module docstring, not a declaration. I compared the actual signatures with the README, including the conductor quantifier order, positive versus symmetric height ranges, the modulus-zero exclusion and the `2 ≤ T ≤ x` restriction.

All nine admitted theorems were tried on a scratch copy with the single-tactic alternatives `simp`, `rfl`, `infer_instance` and `assumption`; none closed. Object searches at the pins did not identify an existing theorem supplying one of these nine headlines by a single `exact`. There is no padding finding. The generic Hadamard scratch signature also elaborated successfully after opening the `Bornology` namespace. Separate gamma probes verified the totalized values of both logarithmic derivatives at zero; they show why the sector/off-pole qualification must accompany the identities, rather than being silently removed.

The dependency command was run with `--depcheck`, `--name ZerosOfLFunctions`, the supplied order, and `--movable`. Its output, with only the README path rendered repository-relative, is:

```text
not movable: ZerosOfLFunctions consumes LFunctions (#311) and is consumed by ComputationalNumberTheory (#211), which comes first: moving ZerosOfLFunctions after LFunctions would put a supplier after a consumer, a cycle through ZerosOfLFunctions
UPWARD: ZerosOfLFunctions (#310) -> LFunctions (#311) at README lines [153, 169]
depcheck: 162 roadmaps, 1163 edges, 1 problem(s)
```

This is an ordering obstruction; the output alone is not evidence that LFunctions mathematically consumes this roadmap. ComputationalNumberTheory's supplied head explicitly consumes the rectangle/counting interfaces in its README at lines 365–379.

The README's headline inventory is: strip convexity; general order-one Hadamard factorization and its L-function corollaries; Dedekind and Hecke zero-free regions including the exceptional-zero alternative; Riemann–von Mangoldt for zeta, Dedekind and primitive Hecke functions; truncated and smooth explicit formulas; effective prime-ideal, ray-class and abelian Frobenius counts; and the semantic certificate/RH interfaces. The nine Lean theorems cover convexity, the zeta Hadamard instance, two zero-free statements, two counting formulas, the zeta truncated formula and two effective prime counts. General Dedekind/Hecke continuation and ray-class/Frobenius carriers are absent at the pins as the docstring says. R08 records a general headline that needs no missing carrier. The generic certificate and rectangle interfaces are described in the docstring as README targets, with no sorried data standing in for them.

Adversarial computations follow. “Survives” means the displayed instance agrees, not that a finite computation proves the general theorem. Asterisks identify the 15 reproducibly sampled targets. The brief supplied no target IDs (it said none were found by heading); I enumerated the 64 numbered layer targets and selected 15 using seed `int('6328e1c768f64ec1',16)`. The sample is 1.1, 2.2, 3.2, 3.4, 4.4, 4.6, 4.7, 4.9, 4.10, 6.1, 6.5, 7.6, 8.6, 8.8, 9.2. Every numbered target is represented below, with separate rows for consequential subclaims, conventions and all nine Lean theorems.

| Statement | Instances tried | Values computed on the two sides / models | Result and change |
|---|---|---|---|
| Germ convention; total representatives | Function equal to 1 except value 0 at one point | Punctured germ is 1, order 0; point value 0 and failure of continuity | Survives: germ regularity does not give the pointwise boundary input |
| 0.1 OrderLE and closure | `1`, `z²`, `exp z`, `exp(z²)` | Along positive radius, log norms are `0`, `2 log r`, `r`, `r²`; products add these exponents | Distinguishes order 0, 1 and 2; do not infer order 1 from finite order |
| 0.2 entire completion and divisor | Zeta at 0 and 1 | Raw `s(s−1)Λ(s)` is 0 at either totalized pole; the extension is 1; orders `−1+1=0` | Real-bodied Lean definition passes; raw product rejected |
| 0.3 finite order | `exp(z²)` versus `exp z` | Orders 2 and 1 are both finite; `exp(r²)/exp(r^1.5)→∞` | Survives the explicit refusal of finite-order ⇒ order-one |
| 0.4 strip-growth threshold | Shifted zeta product, pole height H | At `t=H`, norm tends to infinity as `σ→1`; proposed polynomial bound is constant | Fails R05; require positive separation from pole heights |
| 0.5 average coefficients | Zeta coefficients `a(n)=1`, positive n | Sum through X is `⌊X⌋`; on `Re s=1+δ`, absolute series is `ζ(1+δ)` | Mathematical input works; cited record field fails R03 |
| 1.1* logarithmic branch | Sector at δ=0; normalization at 2 | Log-coordinate domain `(0,∞)×(−π,π)` is simply connected; Γ(2)=1, normalized logarithm 0, wrong branch `2πi` | R09 corrects endpoint explanation; normalized branch discriminates additive ambiguity |
| 1.2 Stirling expansion | Positive real s=2, then s→∞ | Residual at 2 is approximately `0.041340696`; leading remainder is `1/(12s)` | Sign and constant survive; source DLMF 5.11.1 |
| 1.3 vertical gamma norm | `σ=1/2`, t and −t | Exact log norm is `½log(2π)−π abs(t)/2−½log(1+exp(−2π abs(t)))` | Same leading expression in both directions; survives |
| 1.4 digamma and gamma logarithmic derivatives | Regular s=2 versus totalized s=0 | At 2, Γℂ logarithmic derivative is `1−γ−log(2π)` on both sides; at 0 it is 0 while the unqualified RHS is `−log(2π)` | Preserve the sector/off-pole domain; do not extend the pointwise identity across poles |
| 1.5 degree and gamma divisor | One Γℝ; one Γℂ; two colliding Γℝ poles | Degrees 1 and 2 give decay `−π abs(t)/4` and `−π abs(t)/2`; pole orders at 0 are −1, −1, and −2 | Survives multiplicity and degree conventions |
| 1.6 reciprocal gamma | Γℝ at 0 and −2 | Inverse is 0 at both points and entire; at −2, zeta order 1 cancels gamma order −1 | Product construction valid; consume pinned reciprocal entirety, R07 |
| 1.6 continued uncompleted function | Zeta at 0 | Raw quotient of total representatives gives 0; analytic continuation gives `−1/2` | Extension is essential; wrong raw quotient excluded |
| 2.1 analytic conductor | Empty gamma lists N=1; one Γℝ shift 0; one Γℂ shift 0, s=0 | Conductors `1`, `3`, and `3·4=12`; degrees 0,1,2 | Survives; positive degree is separately needed when asserting q≥3 |
| 2.2* comparison; complex shift | One Γℝ shift i, N=1, σ=0 | q(0)=4 and q(−i)=3 despite increasing abs(t); ratio to `1+abs(t)` stays bounded for fixed shift | Survives comparison; monotonicity would be false |
| 2.3 normalization translation | Weight w=2, arithmetic gamma shift 0 | Analytic shift is 1; at analytic s=0 the factor is 4, matching arithmetic s=1 | Positive shift and conductor factor `N^(−w/4)` are consistent |
| 2.4 modular specialization | Weight k=2 at s=1/2 | Two conductor factors 4 and 5 give `20N`, the supplier's formula | Survives convention crossing |
| 2.5 arithmetic conductor | ℚ, primitive conductor 5; ℚ(i), trivial character | `D·Norm(f)` is 5 and 4; using square-root discriminant would give 2 in the second case | Survives |
| 3.1 strip interpolation | Constant function 1, both edge bounds 1 | Interpolated bound `1^(1−θ)·1^θ=1`; actual norm 1 | Survives; native theorem has an explicit growth hypothesis |
| 3.2* left/right edges | Zeta, δ=1/2 | Right absolute-series bound `ζ(3/2)`; gamma quotient on the reflected left edge has power `1/2+δ=1` | Functional equation exponent consistent; general source locator unverified |
| 3.3 pole-cleared convexity | `(s−1)ζ(s)` at 1 and on critical line | Analytic value 1 versus raw 0; `abs(1/2+it−1)=sqrt(1/4+t²)≥sqrt(1+t²)/2` | Pole clearing and division on critical line survive; threshold issue R05 |
| 3.4* family order one | Completed zeta on large positive real r | Leading log growth `½r log r+O(r)` is dominated by `r^(1+ε)` for every ε>0 | Supports order ≤1, not polynomial global growth |
| 4.1 signed and positive counts | `f(z)=z²/(z−2)`, region containing 0 and 2; empty region | Signed count `2−1=1`, positive count 2; both empty counts 0 | Survives; equality requires no poles |
| 4.2 zero divisor / clearing | Completed zeta pole at 1; zero of multiplicity m away from poles | Clearing changes `−1` to `0`, and leaves m unchanged | Survives |
| 4.3 additivity | One simple zero on a horizontal subdivision edge | Half-open pieces count `1+0=1`; both closed pieces count `1+1=2` | Survives stated half-open convention |
| 4.4* monotonicity and enlargement | Include or omit a double zero | Counts `0≤2`; enlargement excluding the zero gives `2=2`, including it gives `0≠2` | Survives finite support and nonnegative-divisor assumptions |
| 4.5 Jensen bound | `f=z−2`, center 0, outer radius 1, inner 1/2, M=3 | Count 0; bound `log(3/2)/log 2>0` | Survives |
| 4.5 trailing coefficient | `f=z`, r=1/4, R=1/2, M=1, a=1, m=1 | Count 1; corrected bound `log 4/log 2=2`; uncorrected bound 0 | Survives central-order correction |
| 4.6* box-to-disc | Unit square; collapsed point rectangle | Corner distance `sqrt(2)/2`; collapsed radius 0 | Containment survives; equality of counts is not asserted |
| 4.7* Jensen displacement | Target disc radius 1 centered at 1/2+iT, basepoint 2+iT | Maximum distance to basepoint `1.5+1=2.5<3`; outer radius 4 gives real strip [−2,6] | Geometry survives |
| 4.7* exponential cancellation | Degree n gamma factors at heights T and T+u, abs(u)≤4 | Ratio of exponential parts `exp(−πn u/4)`, bounded by `exp(πn)` for positive large T | Correctly retains numerator's decay; dropping it leaves `exp(πnT/4)` |
| 4.8 unit-height to global count | M zeros in each of k disjoint height cells | Differences M; total kM, matching a sum of k local bounds | Survives once uniform local bounds are supplied |
| 4.9* N and symmetric count | Roots `1/2±i` and `1/2`; alternatively just `1/2+i` | First example `N(1)=1`, `N±(1)=3=2·1+1`; second gives `1≠2·1` | Reality hypothesis is necessary and retained |
| 4.9* zero/negative height | T=0, T=−1 | `Ioc 0 T` empty and N=0; symmetric count at 0 can include a real zero | Survives, with different conventions explicitly distinguished |
| 4.10* bounded finiteness | `sin(πz)` on closed disc radius 1; zero function | First has three simple zeros; zero function has order ∞ but divisor totalized to 0 | Use the model's nonzero-germ input when calling these “zeros”; it is supplied by Dirichlet agreement |
| 4.11 Nevanlinna comparison | `f=z` and `f=1/z`, 0<r<R | First: `n=1`, `N(R)−N(r)=log(R/r)`; second positive count and log-count both 0, signed difference `−log(R/r)` | Survives positive-part convention; signed replacement fails |
| 5.1 growth to zero count | Constant 1; polynomial z−1 | Counts 0 and, for r≥1, 1; respectively order 0 and 0 | Survives `f(0)≠0`; constants cannot be mistaken for positive-order growth |
| 5.2 multiplicity indexing | `(z−1)²`; constant 1 | Support {1} with weight 2; empty support with weight 0 everywhere | Survives, including empty product |
| 5.3 elementary factor | z=0, z=1, Taylor expansion | `E₁(0)=1`, `E₁(1)=0`, `E₁′(1)=−e`; linear coefficient 0, quadratic coefficient −1/2 | Correct definition; add three explicit Checks, R11 |
| 5.4 canonical product | f=1−z; f=(1−z)² | Products `E₁(z)` and `E₁(z)²`; inverse-square multiplicity sums 1 and 2 | Multiplicity and local convergence agree |
| 5.5 entire logarithm | `g=exp z`, and the rejected `g=z` | Logarithms z and z+2πi exponentiate identically; g=z has g(0)=0 | Survives nonvanishing hypothesis |
| 5.6 general Hadamard | `1−z`; `exp(cz)` | `exp(−z)E₁(z)=1−z`; empty product gives `exp(cz)` | General headline statable but absent, R08 |
| 5.6 logarithmic derivative | `f=1−z`, s=2 | `f′/f=1`; `b+(1/(s−1)+1)=−1+1+1=1` | Sign of b and both summands survive |
| 5.7 positivity | ρ=1/2+i, s=2; empty support | Real part `1.5/(1.5²+1)=6/13>0`; empty sum 0 | Nonnegative sum, not unconditionally positive |
| 5.7 constant b | `exp(cz)` without a functional equation | b=c, zero sum 0; equality would force Re c=0 | General countermodel explicitly excluded by family hypotheses |
| 6.1* trigonometric inequality | θ=0, θ=π | `3+4+1=8`; `3−4+1=0` | Survives sharp nonnegative boundary case |
| 6.2 region constant | q=3, c=log(3)/2; smaller c | Left boundary `1−c/log q=1/2`; halving c moves it to 3/4 | Decreasing c shrinks the region, as claimed |
| 6.3 exceptional-zero predicate | Candidate β=1/2 at maximal capped c; β=1 | First meets the lower bound; second fails β<1; `x^β/β=2sqrt(x)` in first case | Cap excludes division by zero; “not in” wording needs R09 |
| 6.4a common presentation | A prime dividing the presentation modulus | All three presented character coefficients vanish, giving 0; primitive zeta alone would leave a positive coefficient 3 | Common modulus requirement discriminates the wrong expression |
| 6.4b Euler deletion | Factor `1−2^(−s)`, s=0 and s=1 | Values 0 and 1/2; at s=1 logarithmic derivative log 2, finite | Zeros lie on Re s=0; positive-half-plane comparison survives |
| 6.4c reality | Quadratic character mod 4 at 3; quartic character mod 5 at 2 | Values −1 and i have squares 1 and −1 | Reality is χ²=1, not merely unit norm |
| 6.4d Hecke bound | Trivial primitive χ over ℚ at s=1+u | Left leading term `1/u`; first proposed right side bounded above | R06: exclude χ=1 or retain polar terms |
| 6.4d reflection conventions | ρ=0.3+2i | `1−ρ=0.7−2i`; conjugate `0.3−2i`; combined reflection `0.7+2i` | Distinguishes inverse-character and same-character symmetries |
| 6.4e bounded residual family | K=ℚ, conductors at most 3 | Primitive characters: trivial conductor 1 and quadratic conductor 3; finite set of size 2 | Concrete finite-family case survives; degree-uniform argument needs its number-field finiteness input |
| 6.4f exceptional multiplicity | A double real zero β; σ>1 | Logarithmic-derivative contribution `2/(σ−β)` rather than `1/(σ−β)` | Correct obstruction to nonsimple exceptional zeros; no existence assumed |
| 6.5* edge nonvanishing | Completed zeta at 0 and 1 | Meromorphic orders −1 and −1; neither is a positive-order zero | Survives pole-aware formulation, not a raw-value claim |
| 7.1 rectangle contour | Counterclockwise square, inside 0 and outside 2 | Winding numbers 1 and 0; zero-width edge has derivative 0 | Orientation survives; immersion requires nondegeneracy |
| 7.2 finite-set argument principle | R01's f=z−2; also f=z | Normalized integrals 0 and 1; unweighted S sums 1 and 1 | First fails R01; weighted sums give 0 and 1 |
| 7.2a localization | `sin(πz)` on bounded neighborhood of [−1,1]; one-point defect of constant 1 | Locally three zeros versus infinitely many globally; defect has order 0 but is not analytic at the defect | Localization and representative condition are both needed |
| 7.2b principal/ordinary integrals | Continuous integrand 1 on interval [0,4] | Ordinary integral 4 and its principal value 4 | Survives; generic off-cycle route already provided, R07 |
| 7.3 argument lift | Unit circle once counterclockwise; constant −1 | Angle increment 2π and 0; constant curve's initial argument π, not 0 | Lift and initial normalization survive; use pinned supplier |
| 7.4 zeta main normalization | Formal T=2 main term; linear coefficient identity | `T/(2π) log(T/(2πe))=−0.682688726`; expanded expression has the same value | Exact rearrangement survives; the O(log T) theorem is not an equality to the main term |
| 7.5 boundary ordinate | One simple zero at height h | Left count n, value/right count n+1; smooth main-term jump 0 | Right-limit convention agrees with half-open count; already in Titchmarsh |
| 7.6* conductor coefficient | Imaginary quadratic field D=4, degree 2 | Symmetric conductor contribution `(T/π)log 4`; one-sided contribution `(T/(2π))log 4` | Halve entire count, not discriminant; source constants need R10 |
| 7.6* published constants | n=d=T=1 | Published error constant `5.872+3.655=9.527`; README `6.333+3.482=9.815` | Different versions/formulas, R10 |
| 7.7 mean density | Main term `a T log T+bT`, fixed increment h>0 | Average increment divided by `h log T` tends to a; zeta has `a=1/(2π)` | Leading density and existence of infinitely many zeros consistent |
| 8.1 Perron endpoint | x=1, c=T=1 | Finite integral `atan(1)/π=1/4`; limiting half weight 1/2 | Survives finite-height correction |
| 8.2 residues | ζ pole 1, simple nontrivial zero ρ, trivial zero −2 | Residues `x`, `−x^ρ/ρ`, `x^(−2)/2`; at 0 constant `−log(2π)` | Signs and denominator conventions survive |
| 8.3 trivial-zero series | x=2, r₁=1,r₂=0 | Sum over −2n is `−½log(3/4)≈0.143841036`; odd contribution 0 | Matches displayed closed form |
| 8.3 endpoint scale | x=T=2 | ψ(2)=log 2; expression without nontrivial zero sum is `0.305963970`; difference `0.387183211`, error scale `log²2≈0.480453014` | Shows endpoint jump is compatible with the stated scale; not a proof of the general bound |
| 8.4 Mellin dual | y=2, φ(1/2)=1 | Dual value `φ̌(2)=1/2`; transform substitution changes s to 1−s | Factor 1/y survives; omitting it gives 1 |
| 8.4 test class and summation | φ=0; rapidly decreasing Mellin weights on zero shells | All terms 0 for φ=0; weights `O(T^(−k))` times `O(log T)` shell counts have summable bound for k>1 | Absolute-sum route survives; do not claim every test transform vanishes at only finitely many zeros |
| 8.4 positive versus signed divisor | Pole sum P>0, correct identity Z=P+A | Signed left side `Z−P=A`; unchanged right side `P+A`; error −P | R09 corrects factor 2 |
| 8.5 fixed-field exceptional term | β=3/4, log x=u² | Ratio to `x exp(−c sqrt(log x))` is `(4/3)exp(−u²/4+cu)→0` | Fixed-field absorption survives; does not prove conductor-uniform absorption |
| 8.6* nonreal character | Quartic χ mod 5, χ(2)=i, φ supported in (0.4,0.6), φ(1/2)=1 | Dual prime-sum contribution `−i log 2/2`; wrong same-character term `+i log 2/2` | Conjugate-character convention survives (formula subtracts this prime sum) |
| 8.6* trivial-zero parity | Nontrivial even and odd Dirichlet characters at 0 | Even character's Γℝ pole forces L zero order 1; odd Γℝ(s+1) is regular and forces order 0 | Parity substitution survives; trivial character excluded in this item |
| 8.7 ray-class main coefficient | ℚ, modulus 3∞ | All-ideal coefficient 1/3; weighted-prime coefficient 1/2 | R02 separates them |
| 8.7 exceptional orthogonality | Group C₂ with its two characters | Nontrivial weight sum `1+(−1)=0`; trivial weight sum 2 | Fibre sums select characters trivial on the kernel; primitive-source definition avoids modulus dependence |
| 8.7 partial summation | 0<β<1 | Derivative of `Li(x^β)` is `x^(β−1)/log x`; transformed lower-end constant is `Li(2^β)` | Survives β≥1/2; no extra 1/β in derivative |
| 8.7 Li versus x/log x | log x=u² | Ratio `(x/log²x)/(x exp(−cu)/log x)=exp(cu)/u²→∞` | Using x/log x would exceed proposed error; Li is necessary |
| 8.8* abelian transport | Trivial group; quotient C₂ | Fibre size h or h/2 gives main coefficient 1 or 1/2; singleton conjugacy class has #C=1 | Main-term transport survives; no nonabelian result asserted |
| 8.8* discarded bad primes | One excluded prime of norm p | Weighted prime-power contribution `⌊log_p x⌋ log p≤log x`; unweighted contribution at most 1 | Finite exclusions do not alter coefficient |
| 9.1 certificate semantics | `f=(z−1/2)²`, one box enclosing root | Box multiplicity 2, total 2; empty list would demand `2=0` | Completeness clause excludes omitted roots |
| 9.2* coverage | Same double root; list omits its box | Counts would be total 2 versus sum 0 | Survives nonnegative divisor and finite support; signed cancellation is unavailable |
| 9.3 stability | Shrink box while retaining root, then excluding root | Counts remain 2 in first case and become 0 in second | Required equality `0=2` rejects second shrinking |
| 9.4 critical-line semantics | Reflection pair 0.3+i and 0.7+i; single fixed root 0.5+i | Pair count 2, neither real part 1/2; single count 1 with real part 1/2 | Uniqueness hypothesis discriminates the wrong model |
| 9.5 GRH bridge | Zeta at −2, 0, 1 | At −2 uncompleted order 1 plus gamma order −1 gives completed order 0; completed orders at 0 and 1 are −1 | Positive completed divisor excludes all three, as required |
| 9.6 certificate boundary | Boundary simple zero, boundary pole, point defect of constant 1 | Orders 1, −1, 0 respectively; first two violate boundary order=0, third does not | Germ-level certificate deliberately does not imply pointwise contour regularity |
| Lean convexity | q=1, primitive trivial χ; forbidden q=0 | Bound becomes `C(abs(t)+3)^(1/4+ε)`; `[NeZero q]` prevents a zero conductor bound | Signature matches special case and uniform quantifiers |
| Lean zeta Hadamard | s=0 and 1 | Entire completion values 1 and 1; at s=0 every canonical factor is 1, requiring `exp A=1` | Correct endpoint values; no sorried data |
| Lean zeta zero-free region | s=1 versus large real s=2 | s=1 excluded; threshold is <1, so 2 is admitted and ζ(2)=π²/6≠0 | Survives pole exclusion |
| Lean Dirichlet zero-free region | q=1, principal character; q=2 imprimitive principal at s=0 | At 1 order −1, not a zero; at 0 lower bound ≥1/2 excludes Euler-factor zero | Survives positive-order and capped-region conditions |
| Lean zeta zero count | T=0 convention, then theorem domain T≥2 | Underlying count at 0 is 0; theorem explicitly avoids log 0 and small-height asymptotics | Signature does not assert a false small-height bound |
| Lean Dirichlet symmetric count | q=1 versus a nonreal primitive character | At q=1 symmetric count is `2N` (no real nontrivial zeta zero); nonreal counts need not equal `2Nχ` | Correct symmetric domain; no missing reality binder |
| Lean truncated explicit formula | x=T=2; excluded T=0 | Error scale `log²2>0`; T=0 not in domain | Endpoint jump can be absorbed; no division by zero |
| Lean progression count | q=3,a=1,x=7; q=1 | Count in first case 1 (prime 7); coefficient 1/φ(3)=1/2. At q=1 coefficient 1 | Carrier includes the upper endpoint and coprimality avoids noninvertible classes |
| Lean prime ideal count | K=ℚ, x=2; x<2 | Counts 1 and 0; Li(2)=0 | Finite endpoint discrepancy allowed by atTop estimate; zero ideal excluded by HeightOneSpectrum |
| 7.6 generic hypotheses: constant card | Completed function 1, degree 1, no zeros | Count 0 versus predicted `T log T/(2π)`; Dirichlet agreement would require `1/Γℝ(σ)→1`, but its limit is 0 | The stated agreement hypothesis excludes this model |
| 7.6 generic hypotheses: twisted card | Factor `2^s+5+2^(1−s)` | With y=2^s, roots `(-5±sqrt(17))/2` have moduli about 0.4384 and 4.5616; real parts about −1.1895 and 2.1895 | Confinement excludes both extra zero lines; wrong conductor main term differs by `(T/(2π))log 4` |

The object audit searched pinned Mathlib and Tau Ceti, main-branch roadmap files, board package files, and the supplied open-head collection with `roadmaps grep`/`roadmaps show`. The relevant open supplier inspected directly was LFunctions; the supplied ComputationalNumberTheory head was also inspected for its incoming dependency. Open revisions of existing roadmaps were not substituted for their main-branch contracts. No fully qualified declaration-name collision was found for the eleven declarations in `TauCetiRoadmap.ZerosOfLFunctions`. The findings concern ownership of mathematical objects and inaccurate supplier claims, not merely spelling. No existing ZerosOfLFunctions roadmap on main was found that this folder replans. The generic entire-function factorization and L-function zero-distribution extension remain legitimate ownership here after the contour duplication is removed. The table records 99 computed rows, covering the 64 numbered targets, their consequential subclaims and the nine Lean theorems.

These are the pinned declarations actually opened, with the hypotheses that matter. File paths in this table are relative to the named library repository.

| Pin evidence | Content verified and limits |
|---|---|
| Mathlib `Analysis/Meromorphic/Divisor.lean:39`, `MeromorphicOn.divisor` | Its body uses meromorphicity and membership in U, then `meromorphicOrderAt.untop₀`; outside those conditions or at infinite order its value is 0. It supplies neither pointwise analyticity nor a chosen analytic representative. |
| Mathlib `Analysis/Meromorphic/Order.lean:784`, `meromorphicOrderAt_ne_top_of_isPreconnected` | Finite order at one point propagates on a preconnected meromorphic domain; both points must belong to that domain. |
| Mathlib `Analysis/Complex/JensenFormula.lean:391`, `AnalyticOnNhd.sum_divisor_le` | Requires nonzero center value, `0<abs r<abs R`, `1≤M`, analyticity on the outer closed ball and the sphere bound. The trailing-coefficient variant is additional work. |
| Mathlib `Analysis/Complex/ValueDistribution/LogCounting/Basic.lean:274`, `ValueDistribution.logCounting` | At a finite value it uses the positive divisor of f minus that value; at infinity it uses the negative divisor. It is not the signed zero-minus-pole count. |
| Mathlib `Analysis/Complex/BranchLogRoot.lean:37`, `Complex.exists_continuousOn_eqOn_exp_comp` | Open simply connected domain, continuous function, image excluding 0; returns a continuous logarithm, not directly a holomorphic logarithm. |
| Mathlib `Analysis/Complex/PhragmenLindelof.lean:275`, `Complex.PhragmenLindelof.vertical_strip` | Closed-strip continuity/holomorphy, both boundary bounds, and the explicit sub-double-exponential growth hypothesis are present. No pole-clearing extension is implicit. |
| Mathlib `Analysis/Complex/BorelCaratheodory.lean:109`, `Complex.borelCaratheodory` | Positive real bound M on Re f, positive radius, holomorphy in the ball, and a strictly interior evaluation point. |
| Mathlib `Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`, `multipliableLocallyUniformlyOn_one_add` | Open domain, summable dominating family, eventual domination throughout that domain and continuous factors. For the canonical product use bounded domains and then localize; domination on all of ℂ is not supplied. |
| Mathlib `Analysis/Calculus/LogDerivUniformlyOn.lean:24`, `logDeriv_tprod_eq_tsum` | Requires summability of logarithmic derivatives, locally uniform product convergence and nonvanishing of each factor and of the product at the evaluation point. |
| Mathlib `Analysis/SpecialFunctions/Gamma/Deligne.lean:43,51,89,97` | Gamma-factor definitions and entire inverses; the totalized poles have inverse value 0. |
| Mathlib `Analysis/SpecialFunctions/Gamma/Digamma.lean:39,44` | Digamma is the logarithmic derivative; `digamma_zero=0` is a total-function value, not a regular value of the meromorphic logarithmic derivative. |
| Mathlib `Analysis/MellinInversion.lean:92`, `mellinInv_mellin_eq` | Positive evaluation point, Mellin convergence, vertical integrability, continuity at the point, and complete target normed space. The actual declaration name differs from the file's introductory shorthand. |
| Mathlib `NumberTheory/LSeries/RiemannZeta.lean:64,68,121` | Native entire auxiliary completion, meromorphic completion and zeta carriers used by Suggested.lean. |
| Mathlib `NumberTheory/LSeries/Nonvanishing.lean:398,411` | Existing Dirichlet and zeta nonvanishing for Re s≥1 does not supply a quantitative region left of 1; Dirichlet theorem retains its principal-character/pole exclusion. |
| Tau Ceti `Analysis/Contour/PwC1ImmersionOn.lean:91` | Continuity and a finite breakpoint set with nonzero within-piece derivatives; a collapsed edge does not satisfy it. |
| Tau Ceti `Analysis/Contour/HungerbuhlerWasem.lean:100` | Generalized residue theorem has immersion, analytic-off-set, meromorphic-at-set, null-homology and principal-value conditions. They are not supplied by a divisor alone. |
| Tau Ceti `Analysis/Contour/Residue/LogDeriv.lean:63` | Residue equals a specified finite integer meromorphic order. |
| Tau Ceti `Analysis/Contour/Argument/Cycle.lean:110` | The stronger directly useful off-cycle result uses ordinary integration and piecewise C¹ regularity; see R07. |
| Tau Ceti `Analysis/Contour/Argument/Lift.lean:412` | Continuous curve on a closed interval avoiding the chosen center; constructs a real argument and partition. |
| Tau Ceti `Analysis/Contour/LogDerivFTC.lean:226` | Winding of the image equals normalized logarithmic-derivative integral, with local analyticity and nonvanishing along the curve. |

Cross-roadmap citations were resolved against these actual owners, not from memory:

| Owner and location | Resolution |
|---|---|
| LFunctions supplied head, `Suggested.lean:117,169,178,184,190,216` | Analytic data, dual gamma shifts, normalized Dirichlet agreement, exact polar data and `regular_away`, functional equation and normalization translation exist. Average-bound field does not: R03. |
| LFunctions supplied head, `Suggested.lean:965,972` and surrounding Layer 3 statements | Continued Dedekind zeta and its meromorphic continuation are supplier targets; these are not assertions that native Mathlib's Dirichlet series is continued. |
| LFunctions supplied head, `Suggested.lean:1632,1645,1648,1661,1670,1680` | Hecke card, completed function, nontrivial entirety, functional equation and Mellin input exist. The germ functional equation covers the trivial case where pointwise pole exclusions matter. |
| LFunctions supplied head, Layer 5 presentation/primitive-source and partial-zeta statements | Character presentations, Euler corrections, partial-zeta sum and character orthogonality resolve; their residues are all-ideal residues, not prime main coefficients (R02). |
| LFunctions supplied head, `Suggested.lean:2680,2685,2819,2827` | Edge nonvanishing, 3-4-1 inequality, Dedekind logarithmic derivative and coefficient nonnegativity resolve. |
| Main `TauCetiRoadmap/GlobalNumberFields/Suggested.lean:71,155,165,314,338` | Modulus, ideal class for ideals prime to the modulus, finite ray class group, exact all-ideal coefficient and ray-class characters resolve. |
| Main `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:3730,3742,3756` | Ray-class Artin map, splitting law and surjectivity resolve with their admissibility/unramified hypotheses. They are suppliers for discharging the dictionary, not constructions owned here. |
| Main `Completed/NumberFieldArithmetic/Suggested.lean:2798` | The Artin-symbol comparison to the NumberField carrier resolves. |
| Main `TauCetiRoadmap/ModularForms/README.md:750` | Newform conductor formula is `N(abs(s_an+(k−1)/2)+3)(abs(s_an+(k+1)/2)+3)`, matching Layer 2's specialization. |
| Main `Completed/ArithmeticDirichletSeries` and `Completed/Chebotarev` | Owners of the generic summation, Li and Frobenius-counting objects resolve; pin realization claims fail, as R03 specifies. |
| Main `Completed/ContourIntegration` plus pinned contour files above | Existing general-cycle theory supersedes the roadmap's claimed need to construct it again. Rectangle geometry and localization are the remaining additions. |

The source check fetched all nine cited works through the source service, without editing a roadmap manifest or copying source text into this report. Four works yielded relevant readable text; the Iwaniec–Kowalski URL yielded only an unrelated chapter. No theorem is certified from that unrelated chapter. Source statements below are paraphrases, with extraction locators.

| Source and locator examined | Supported claim or discrepancy |
|---|---|
| `dlmf lines 104–108`, §5.11 equation 5.11.1; `lines 158–160`, equation 5.11.2 | Sectorial Stirling and digamma expansions support Layers 1.2 and 1.4 away from the negative-axis boundary. The general logarithm, not pointwise principal log of Γ, is the appropriate branch. |
| `dlmf lines 488–524`, equation 5.11.9 | Fixed bounded-real-part vertical gamma asymptotic supports Layer 1.3. Taking logarithms yields the displayed `½log(2π)` and exponential coefficient. |
| `kadiri2012 lines 79–85`, Theorem 1.1, pp. 2–3, equations (1.7)–(1.8) | Constants 12.55, 9.69, 3.03, 58.63 and 12.74 match the README; the sufficiently-large-discriminant hypothesis is retained. This alone does not certify the proposed general Hecke theorem. |
| `kadiri2012 lines 230–238`, §2.1.2 | Logarithmic derivative includes the discriminant, gamma derivative, zero sum and both pole terms. Supports retaining the pole terms in R06. |
| `titchmarsh1986 lines 6918–6941`, §9.2, p. 211 | Positive-height count includes the upper endpoint; unit-height bound is logarithmic. |
| `titchmarsh1986 lines 6944–6985`, §9.3, pp. 212–213 | S(T)'s path and right-limit convention, the main-term formula, and its extension to zero ordinates are present. R10 corrects the claimed absence of the extension. |
| `titchmarsh1986 lines 7020–7027`, §9.4, p. 214 | S(T)=O(log T) and the rearranged Riemann–von Mangoldt main term support the zeta headline. |
| `titchmarsh1986 lines 2113–2165`, Lemma 3.12, pp. 60–62 | Perron discussion and endpoint distinction are visible; extraction quality prevents certifying every symbol of its error term. The finite-height kernel value was checked independently above. |
| `trudgian2015 lines 16–29`, Theorems 1–2, published p. 1439 | Symmetric height count, primitive nonprincipal restriction for Theorem 1, degree/discriminant dependence for Theorem 2 and T≥1 verified. Decimal tuples differ: R10. |

For the 15 sampled targets: 1.1 was tested using the pinned logarithm theorem and the explicit sector counterexample; 2.2 and 3.2 were checked algebraically but their Iwaniec–Kowalski locators remain uncertified; 3.4's cited family finite-order argument remains source-unverified; 4.4, 4.6, 4.7, 4.9 and 4.10 were checked against the native divisor/Jensen infrastructure and the computations above, without claiming that a source theorem proves each new adapter; 6.1 resolves to the named LFunctions inequality; 6.5 resolves to the named supplier's boundary theorem; 7.6's Dirichlet/Dedekind source was read and the general Hecke variant is an internal proposed proof, not a result certified by that source; 8.6's conjugation and residue conventions were computed, but its Lang locator could not be read; 8.8's abelian fibre calculation and supplier dictionary were checked, but the historical effective-Chebotarev text was unavailable; 9.2 was checked directly by its finite nonnegative-count argument. There was no supplied source manifest with settled waivers or additional sampled target IDs.

## Not verifiable

- **Davenport, Multiplicative Number Theory (2000), §§12–20** (`davenport2000`): the service returned `uncertified`, identifying only a paywalled publisher route. I did not read these sections. Consequently their precise hypotheses, pages and proof steps for Hadamard, the zero-free region, counting and truncated formulas, and arithmetic progressions are not source-certified here. They were not added to a new missing-text request after that result.
- **Lang, Algebraic Number Theory (1994), XV §§4–5 and XVII §§1–3** (`lang1994`): likewise `uncertified` from the service; the Hecke/explicit-formula locators could not be read. No claim that those sections establish every uniformity asserted here is certified.
- **Neukirch, Algebraic Number Theory (1999), VII §§5,8** (`neukirch1999`): likewise `uncertified`; the cited analytic-number-theory passages remain unread.
- **Iwaniec–Kowalski, Analytic Number Theory (2004), equation (5.7), §§5.2–5.3** (`iwaniec-kowalski2004`): the author's legal `ik-ant-exp-sums.pdf` contains Chapter 11, not Chapter 5. The source service's title/DOI route did not produce the needed legal text. Recorded in the missing-reference file, using the same source key. The conductor specialization was independently compared to ModularForms on main; that is not certification of the book locator.
- **Lagarias–Odlyzko, Effective versions of the Chebotarev density theorem (1977)** (`lagarias-odlyzko1977`): source-service retrieval failed. Odlyzko's author publication list identifies the work, pp. 409–464, but provides no linked text there. No unauthorized retyped mirror was used. Recorded in the missing-reference file. The README does not give an exact theorem/page for the proposed abelian transport to certify.
- **Extraction limitation:** Titchmarsh's Perron formula has damaged mathematical OCR in the legally obtained extraction; I have not certified the precise printed error formula from that extraction. The readable zero-counting passages were sufficient for the separate checks above.
- **Scope of evidence:** the table's concrete instances and signature probes do not prove the proposed general Hecke zero-free and conductor-uniform counting theorems, the generic Hadamard proof route, or the intrinsic exceptional Chebotarev term. Their source-independent proof obligations remain implementation work. No additional open pull-request head beyond the supplied file collection was treated as an inspected owner.

## Source issues

- none
