# Review of LinearFormsInLogarithms (pull request #451 at ce174b2)

**Verdict:** accepted

This is an incremental re-review of the 9 lines changed since 4ff34d9. All of them are in `## Downstream consumers` of `TauCetiRoadmap/LinearFormsInLogarithms/README.md`, now lines 1374–1376: two bullets are deleted and the integral Iwasawa bullet is rewritten. `Suggested.lean` is byte-identical to the head the previous review read. Nothing outside the folder changed, the gate passes, the dependency check reports no problem, and the module elaborates with `sorry` as its only warning. The previous finding is repaired as proposed, and the repair introduces nothing new. No finding remains.

## Findings

None.

## Previous findings

- R01 — repaired: lines 1374–1376 now read “The integral Iwasawa theory roadmap, for the algebraic-number form of Baker–Brumer (its §4.2) and abelian Leopoldt (its §4.4): 8.10. The GL₂ … and the Euler systems … roadmap take those two forms from that roadmap, not from 8.10.”

## Verified sound

This review read the changed passage in full, plus everything it cites or depends on:
- README §8.10 (lines 1319–1335) and its Lean statements (lines 657 and 666);
- the integral Iwasawa theory, GL₂ modularity lifting, and Euler systems and cyclotomic main conjecture roadmaps at their open heads;
- every roadmap, on main or at an open head, that cites this one.

The rest carries forward from the review of 4ff34d9. That review carried it, through 6549fd3 and 5a64661, from the full review of 768487d (all README lines; all 76 Lean declarations at lines 77–705).

### Head, gate, dependency check and elaboration

- Head `ce174b2d4b1c7a24b70560419de8d86fc2131833`. `git diff --stat 4ff34d9 HEAD` touches only `TauCetiRoadmap/LinearFormsInLogarithms/README.md` (3 insertions, 6 deletions). `git diff --stat origin/main...HEAD` outside the folder is empty. `Suggested.lean` has no diff against 4ff34d9.
- Gate, run by this review: `gate LinearFormsInLogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate at this head adds `build=0`: every check passed.
- The prescribed dependency check gives `depcheck: 240 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` line and no supplier citation; it only removes consumer bullets, which are not edges of this roadmap.
- `lake env lean` on `TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean` at this head: exit 0, exactly 73 `declaration uses sorry` warnings, 0 errors, no other warning. This is identical to every earlier run on the unchanged file.
- Signatures: the worker's elaborated types (76 declarations) were computed at this head. The two binders the scan flags as possibly dropped are `[CompleteSpace L]` in `PadicExp.le_radius_expSeries` (line 515) and in `PowerSeries.norm_coeff_coe_mul_rescale_exp_mul_pow_le` (line 547). Both are the ones found intentional since the review of 768487d: a radius of `NormedSpace.expSeries L L` and a bound on `PowerSeries.coeff` are formal statements that need no completeness. The other `PadicExp`/`PowerSeries` statements keep `[CompleteSpace L]`, e.g. line 536. The Lean file is unchanged, so no `#check @name` re-run was needed.

### The changed passage

- **Integral Iwasawa theory, at the head of #1306 (539ca66, unchanged since the previous review).**
  - §4.2 (README line 556, “The algebraic-number form of Baker–Brumer”) owns `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers`. Line 560 proves the latter by applying “LinearFormsInLogarithms §8.10, with `β_0=0`”.
  - §4.4 (line 576) owns `abelianLeopoldt`, reached through §4.3: `abelianUnit_resolvent_ne_zero` holds because a vanishing resolvent would contradict §4.2.
  - Layer 4's dependencies (line 586) list “LinearFormsInLogarithms §8.10”.
  - The supplier contract (line 49) states 8.10 with the disc `‖ℓ_i‖<ρ_p=p^{−1/(p−1)}`, algebraic `NormedSpace.exp ℓ_i`, ℚ-independence and algebraic `β_0, β_i`, concluding that all of them vanish. This matches README 1323–1324 and the Lean hypotheses `hsmall`, `halg`, `hli`, `hβ₀`, `hβ`, `hrel` and conclusion `β₀ = 0 ∧ ∀ i, β i = 0` at line 657, item for item.
  - Both parenthetical section numbers in the new bullet are therefore exact, and so is the claim that the roadmap consumes 8.10.
- **GL₂ modularity lifting, at the head of #1071 (2c701b5).**
  - README and `Suggested.lean` contain 0 occurrences of `LinearFormsInLogarithms`, `PadicBaker` or “linear forms in logarithms”.
  - Line 2622 takes `abelianLeopoldt` from “IntegralIwasawaTheory §4.4”, and says its Baker–Brumer proof (that roadmap's §§4.2–4.3) “is not an input here”.
- **Euler systems and the cyclotomic main conjecture, at the head of #1311 (c386732).**
  - It contains 0 occurrences of the same three strings.
  - Line 224 takes `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers` from “IntegralIwasawaTheory §4.2”, and says that section “takes the disc form of Baker–Brumer from its own supplier”.
  - Abelian Leopoldt comes from IntegralIwasawaTheory §4.4 (lines 2203, 3554), and the §4.2 citations recur at lines 855 and 3147.
  - Line 3786's “including both forms of Baker–Brumer” refers to items (a) and (b) of line 224, both owned by IntegralIwasawaTheory.
- **“Take those two forms from that roadmap, not from 8.10.”** Read collectively, the sentence is exact: GL₂ takes §4.4, the Euler systems roadmap takes §4.2 and §4.4, and neither takes 8.10. Its operative claim, “not from 8.10”, holds for each roadmap separately. No change is needed.
- **The section's opening claim.** It reads “These roadmaps consume this one by section and by declaration name”. After the edit, both listed roadmaps do:
  - DiophantineApproximationAndTranscendence on main (eaf17b1): 61 README lines and 5 `Suggested.lean` lines name this roadmap.
  - IntegralIwasawaTheory at 539ca66: lines 11, 49, 560, 562, 586.

  `roadmaps grep --fixed LinearFormsInLogarithms` finds two other citing roadmaps, and neither consumes this one:
  - SubspaceTheorem on main, line 251, lists “Effective methods … (DAT Layers 3–4, LinearFormsInLogarithms)” among things outside its scope.
  - EllipticPeriods at #1059, line 819, says that 5.7 “covers `ℂ^{d₀} × (ℂˣ)^{d₁}` only”, as a scope boundary.
- **Nothing left behind.** Grepping README and `Suggested.lean` for `GL₂`, `GL2`, `Euler system`, `Iwasawa` and `Leopoldt` hits only lines 1374–1375. The deleted bullet's declaration name `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` is still named at README lines 1051 and 1321 and declared at Lean line 657 (`readme-ids-missing=0`). The integral Iwasawa bullet has no relative link, which is right: that roadmap is not on main, so a link would be broken until it merges. The Diophantine approximation link resolves on main.
- **Merge order.** IntegralIwasawaTheory is at line 29, EulerSystemsCyclotomicMainConjecture at 164, GL2ModularityLifting at 170 and this roadmap at 397. A consumer bullet is not an edge of this roadmap, so this folder has no direction defect. IntegralIwasawaTheory cites §8.10 from above this roadmap; placing that citation belongs to the review of that roadmap (`--movable` moves it after its last supplier).
- **Seeded sample.** None of the fifteen seeded targets lies in the changed passage, which cites only 8.10. The targets are 0.3 (README line 392), 1.1 (506), 1.3 (525), 1.4 (538), 3.3 (680), 4.1 (732), 5.2 (794), 5.3 (820), 5.7 (903), 6.2 (936), 7.3 (1011), 8.1 (1059), 8.4 (1114), 8.8 (1270) and 8.9 (1305).
  - Their text is unchanged since the full review of 768487d. `git diff -U0 768487d HEAD` has hunks only at README lines 48–57, 91–92, 99–101, 105, 958–964 (inside 6.4, which starts at 956), 1143–1155 (inside 8.5, which starts at 1138), 1374–1376, 1395 and 1408–1409.
  - Their adversarial rows are carried below: 0.3 at Lean 77–109; 1.3 at 212–219; 1.4 at 230; 4.1 at 336; 5.7 at 354; 6.2 at 377; 7.3 at 453–487; 8.1 at 515–531; 8.4 at 536–547 and 623–646. Prose rows: 0.3, 1.1, 1.4, 3.3, 4.1, 5.2, 5.3, 5.7, 7.3, 8.1, 8.4, 8.8 and 8.9.
  - No source is cited by the changed passage. No source was opened and no manifest was edited.
- **Tools.** The citations resolver lists no cross-roadmap citation that is found nowhere. Its 55 Lean-name leads are all names of this roadmap's own, declared in `Suggested.lean` (`readme-ids-missing=0`); none is in the changed passage. The overlaps tool lists no other pull request changing this roadmap and no dropped id in either direction. Its closest roadmaps in vocabulary are DiophantineApproximationAndTranscendence #1906, ColemanIntegration #1043, ArithmeticInterpolationDeterminants #1905 and LocallyAnalyticDistributions #854; the diff touches none of them.

### Headline theorems and ownership

The headline theorems are unchanged and all stated in `Suggested.lean`, as found in the earlier reviews. They are:
- the Schneider–Lang criterion (5.7, line 354) and its corollaries 6.2 (377);
- Hermite–Lindemann (6.3, 386–398);
- Gelfond–Schneider (6.4, 404–417);
- Baker's theorem (7.1–7.3, 430–487);
- Baker–Brumer over `ℂ_[p]` (8.10, 657–666) with its corollary 675;
- the worked examples (685–705).

The diff creates no object and no declaration. Its one substantive claim, that the algebraic-number form of Baker–Brumer and abelian Leopoldt are downstream of 8.10, now names IntegralIwasawaTheory, their owner, and no longer names two consumers of that owner as consumers of 8.10.

### Adversarial table: the changed statements

| Target/convention | Computed instance or comparison | Result / change |
|---|---|---|
| Consumer bullet, integral Iwasawa theory, “algebraic-number form of Baker–Brumer (its §4.2) … 8.10” (this review) | IIT line 560 applies 8.10 with `β₀ = 0` to `ℓ = log u`, `α^N = p^k u`. At `p = 3`, `α = 2`: `K = ℚ_3`, `e = 1`, `q = 3`; depth `i = 1` is admitted (`1 < (3 − 1)·1 = 2`); `N = e(q − 1)p^0 = 2`, `α^2 = 4 = 3^0 · 4`, `u = 4 = 1 + 3 ∈ U(ℚ_3, 1)`; `log 4 = 3 − 9/2 + 27/3 − 81/4 + …` with valuations `1, 2, 2, 4, …`, so `‖ℓ‖ = 1/3 < 3^{−1/2} ≈ 0.5774 = ρ_3` (`hsmall` of line 657), `exp ℓ = 4` algebraic (`halg`), `log_3 2 = ℓ/2`. At `α = 5`: `25 = 1 + 3·8`, `‖log 25‖ = 1/3`. `2^a 5^b = ζ 3^k` forces `a = b = 0`, so by `algebraicLog_kernel` `(log 4, log 25)` is ℚ-independent (`hli`). 8.10 with `β₀ = 0` then gives independence over the algebraic numbers. | Pass; the bullet's attribution is exact. |
| Consumer bullet, “abelian Leopoldt (its §4.4): 8.10” (this review) | IIT §4.4 (line 576) goes through §4.3 (resolvents, “contrary to §4.2”) to 8.10; line 586 lists §8.10. Instance `E = ℚ(√2)`, `p = 3`: the squares mod 3 are `{0, 1}`, so 3 is inert. `K = ℚ_3(√2)`, `e = 1`, `q = 9`, `i = 1`, `N = e(q − 1) = 8`. `ε = 1 + √2` has `εε′ = −1` and infinite order, so `ε^N ≠ ζ 3^k` and `log_3 ε ≠ 0`. With `d = 2`, `r = 1`, the log matrix `(log ε, log ε′) = (log ε, −log ε)` (as `log(−1) = 0`) has rank `1 = r`, so `δ(E, 3) = 0`. | Pass. |
| “The GL₂ modularity lifting roadmap and the Euler systems … roadmap take those two forms from that roadmap, not from 8.10” (this review) | Occurrences of `LinearFormsInLogarithms` / `PadicBaker` / “linear forms in logarithms”: GL₂ at 2c701b5 (README + `Suggested.lean`) 0 / 0 / 0; Euler systems at c386732 0 / 0 / 0. Citations of IntegralIwasawaTheory: GL₂ §4.4 at line 2622 only, with §§4.2–4.3 “not an input here”; Euler systems §4.2 at lines 224, 855, 3147 and §4.4 at 2203, 3554. Collectively: {§4.4} ∪ {§4.2, §4.4} = {§4.2, §4.4}, the two items the sentence names; each roadmap's set of 8.10 citations is empty. | Pass. |
| Section opening, “These roadmaps consume this one by section and by declaration name” (this review) | Listed roadmaps: Diophantine approximation on main (61 + 5 lines naming this roadmap), integral Iwasawa at 539ca66 (lines 11, 49, 560, 562, 586, each citing §8.10). Unlisted citing roadmaps: SubspaceTheorem line 251 (scope exclusion), EllipticPeriods #1059 line 819 (scope boundary on 5.7); neither consumes a section. The deleted bullets named 2 roadmaps with 0 citations. | Pass. |

### Adversarial table: the scope sentence (text unchanged in this diff)

| Target/convention | Computed instance or comparison | Result / change |
|---|---|---|
| Scope sentence, `TauCeti.deepUnitExpLogEquiv` with `e` the absolute ramification index and depth `i` (carried from the review of 4ff34d9) | Threshold as the pinned hypothesis `absoluteRamificationIndex K p < (p - 1) * i`: `K = ℚ_3` (`e = 1`): `i = 1` gives `1 < 2`, admitted; `K = ℚ_2` (`e = 1`): `i = 1` gives `1 < 1`, excluded, `i = 2` gives `1 < 2`, admitted; `K = ℚ_3(√3)` (`e = 2`, `p = 3`): `i = 1` gives `2 < 2`, excluded, `i = 2` gives `2 < 4`, admitted; `i = 0` gives `e < 0`, excluded for every `K` (so `U(K,0) = 𝒪[K]ˣ`, where `log` does not converge at a unit with `v(u − 1) = 0`, is never claimed). Wrong model `e ≤ (p − 1) i`: admits `ℚ_2`, `i = 1`, where `exp` diverges at `2` (8.1's boundary, `‖2‖ = 1/2 = ρ`): excluded by the strict inequality. Membership: `u = 4 = 1 + 3 ∈ U(ℚ_3, 1) = 1 + 3ℤ_3`, `log 4 = Σ (−1)^{n+1} 3^n / n ∈ 3ℤ_3` (`‖3^n / n‖ ≤ 3^{−n + v_3(n)} ≤ 1/3`), `exp (log 4) = 4`: the forward map lands in `𝓂^1` and the inverse returns. With `e` now bound in the sentence, the earlier ambiguity (`2.718… < 2` at `(p, i) = (3, 1)`) is gone. Type and direction as at the pin (lines 117, 142, 148). | Pass; text unchanged in this diff. |

### Adversarial table: every Lean declaration

Line numbers are those of this head. `Suggested.lean` is unchanged since 5a64661, so every row is carried forward with its citation.

| Line / statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 77, multi-index coefficient definition | p₂(u,v)=u₀v₁: coefficient (1,1)=1+0=1. For p₂=u₀v₀, coefficient (2,0)=1, not 2. Constant degree zero over an empty coordinate type gives 7. | Pass; permutation multiplicity is correct. (carried from the review of 4ff34d9) |
| 84, diagonal evaluation as monomials | z=(2,3), p₂(u,v)=u₀v₁: p₂(z,z)=6 and coefficient sum 1·2·3=6. Empty coordinates: degree zero c=c, positive degrees 0=0. | Pass. (carried from the review of 4ff34d9) |
| 92, regrouped HasSum | Geometric series at z=1/2: sum=2=f(z). Empty coordinates leave the constant c=c. | Pass. (carried from the review of 4ff34d9) |
| 101, constructing a series from coefficients | c_k=1, controlling radius 1/2: weighted absolute sum=2; at z=1/4, sum=4/3 and extracted c₂=1. | Pass. (carried from the review of 4ff34d9) |
| 109, coefficient uniqueness | Alternating p₂(u,v)=u₀v₁−u₁v₀ has diagonal 0 and mixed coefficient 1−1=0, although p₂ is nonzero. | Pass; excludes the false stronger uniqueness claim. (carried from the review of 4ff34d9) |
| 117, Taylor-coefficient definition | z² at 3 has coefficients 9,6,1. For 1+conj(z) at 0, nonanalytic default coefficients are all 0 although f(0)=1. | Pass; junk convention explicit. (carried from the review of 4ff34d9) |
| 121, representative independence | Adding the alternating form above changes the representative but leaves the mixed coefficient 1+0=1. | Pass. (carried from the review of 4ff34d9) |
| 127, addition | z²+3z at 1: coefficient of degree one is 5=2+3. | Pass. (carried from the review of 4ff34d9) |
| 133, scalar multiplication | Nonanalytic conjugation, scalar 2: default coefficient 0=2·0; scalar 0: coefficient 0=0·0. | Pass, including zero scalar. (carried from the review of 4ff34d9) |
| 138, locality | z² near 3: coefficient of degree one is 6 on both sides; altering a value at 100 leaves 6. | Pass. (carried from the review of 4ff34d9) |
| 143, translation | z² translated by 2 and expanded at 3: derivative coefficient 10=2(3+2). | Pass. (carried from the review of 4ff34d9) |
| 149, factorial and iterated derivative | z₀²z₁, index (2,1): coefficient 1 multiplied by 2!1! gives 2, the derivative. In characteristic 2 both derivative and factorial multiple are 0, while coefficient is 1. | Pass; no division by factorial. (carried from the review of 4ff34d9) |
| 158, univariate factorial identity | z³, order 3: 3!·1=6. In characteristic 3 both sides are 0. | Pass. (carried from the review of 4ff34d9) |
| 165, product coefficients | f=1+z, g=z² at 1, degree one: 5=2·2+1·1. | Pass. (carried from the review of 4ff34d9) |
| 173, absolute expansion | Geometric coefficients with control radius 1/2 and displacement 1/4: absolute control sum 2, evaluated sum 4/3. | Pass. (carried from the review of 4ff34d9) |
| 182, Taylor expansion at a point | z² at 3, displacement 1/2: 9+6/2+1/4=49/4=(7/2)². | Pass. (carried from the review of 4ff34d9) |
| 191, total-order vanishing under linear maps | f=z₀², A(s,t)=(s+t,t): degree-one coefficients are 0 before and after. Degree-two mixed coefficient changes 0→2, so rectangular-order preservation is not asserted. | Pass. (carried from the review of 4ff34d9) |
| 199, divided slope | f=z², centre 3: extended slope at 3 is 6; at 4 it is (16−9)/(4−3)=7. | Pass. (carried from the review of 4ff34d9) |
| 212, little-o order bound | f=w², T=2: norm divided by norm(w)^(T−1) is norm(w)→0. A nonanalytic germ does not acquire positive analytic order from its default zero coefficients. | Pass. (carried from the review of 4ff34d9) |
| 219, Schwarz order estimate | f=w², ρ=2, M=4, T=2, w=1: 1=4(1/2)². T=0 yields 1≤4. | Pass. (carried from the review of 4ff34d9) |
| 230, multivariate Cauchy bound | f=z₀z₁, R=2,M=4,ρ=1,index(1,1): 1≤4. At ρ=0 the positive-degree weighted coefficient is 0≤4. | Pass. (carried from the review of 4ff34d9) |
| 237, remainder bound | f=z²,R=2,M=4,z=1, cutoffs T=0,2,3: remainder norms 1,1,0; respective bounds 4,3,2. | Pass. (carried from the review of 4ff34d9) |
| 247, Cartesian Schwarz estimate | One variable, E={0}, multiplicity 2, r=1,R=5,M=25,f=z²: 1≤225. Empty interpolation set gives no zero gain. | Pass. (carried from the review of 4ff34d9) |
| 266, exponential-monomial coefficient | z²exp(z) at 1, coefficient degree one: 3e=e(1+2). exp(z) at 0, degree two: 1/2, including an index greater than the polynomial degree. | Pass. (carried from the review of 4ff34d9) |
| 273, exponential-polynomial independence | Frequencies 0,i with polynomials 1,−1: value 0 at 0 but 2 at π; (D−i) eliminates exp(iz) and leaves −i. Empty coordinate space admits at most one distinct frequency. | Pass. (carried from the review of 4ff34d9) |
| 289, archimedean Liouville | K=ℚ,x=2: norm·house^0=2≥1. x=1/2 would give 1/2<1 and is excluded by integrality. | Pass. (carried from the review of 4ff34d9) |
| 296, denominator-aware bound | x=1/2,δ=2,a=1,H=1: clearing gives 1; the lower-bound product equals 1. δ=0 is excluded. | Pass. (carried from the review of 4ff34d9) |
| 303, real Thue–Siegel | Form (1,1),U=2,X=1, three boxes < four candidate vectors: ξ=(1,−1) gives value 0≤2/3. Zero unknowns do not satisfy the counting hypothesis. | Pass. (carried from the review of 4ff34d9) |
| 310, complex Thue–Siegel | Four coefficients 1/2,U=log2,V=0,X=1: (2√2+1)²≈14.657≤16; ξ=(1,−1,0,0) gives 0≤1. No equations yields count 1≤2. | Pass. (carried from the review of 4ff34d9) |
| 321, number-field Siegel | Matrix [1,1]: vector (1,−1) has image 0 and house 1≤2C. Zero matrix admits (1,0), handled outside the native nonzero-matrix lemma. | Pass. (carried from the review of 4ff34d9) |
| 336, auxiliary function | 1024 constant functions, N=1,U=log1024,V=6,log(R/r)=2: W≈13.931, count ≈776.34≤2048; coefficients (1,−1,0,…) give function 0. | Pass. (carried from the review of 4ff34d9) |
| 354, inhomogeneous Schneider–Lang | n=d₀=d₁=1,x=y=1: coordinate candidate 1 is algebraic, exponential candidate e is not. n=0 cannot meet the required nonempty independent family and strict dimension conditions. | Pass. (carried from the review of 4ff34d9) |
| 369, homogeneous criterion | n=1,d=2,x=(1,√2),y=(log2,0): candidate values 2,2^√2,1,1; at least 2^√2 is transcendental. | Pass. (carried from the review of 4ff34d9) |
| 377, one-dimensional criterion | d=1,x=y=1: exponential is e≈2.7182818285. d=0 is excluded by NeZero. | Pass. (carried from the review of 4ff34d9) |
| 386, logarithm form of Hermite–Lindemann | log2 has exponential 2; 2πi has exponential 1; both logarithms are nonzero. Zero would also exponentiate to 1 and is excluded. | Pass. (carried from the review of 4ff34d9) |
| 392, exponential form | Input 1 gives e; input 0 gives 1 and fails the nonzero hypothesis. | Pass. (carried from the review of 4ff34d9) |
| 398, principal logarithm | Inputs 2,1,0 give log2≈0.693147,0,0; the latter two are excluded. | Pass. (carried from the review of 4ff34d9) |
| 404, branch-free Gelfond–Schneider | x=log2,b=√2: exp(bx)=2^√2≈2.665144. Rational b=1/2 would give √2 and is excluded. | Pass. (carried from the review of 4ff34d9) |
| 410, principal-power Gelfond–Schneider | `2 ^ √2 ≈ 2.6651441427` with base `2 ∉ {0, 1}` and `√2 ≠ i / j` for all integers `i, j` is admitted. `4 ^ (1 / 2) = 2` is algebraic: `1 / 2 = i / j` with `(i, j) = (1, 2)`, so the irrationality hypothesis excludes it. `β = 0 = 0 / 1` and `β = 0 / 0 = 0` (junk division) are both excluded, so `j = 0` opens no loophole. Elaborated type at this head agrees with the README form of 6.4 verbatim. | Pass. (carried from the review of 4ff34d9) |
| 417, quotient of logarithms | log4/log2=2; log3/log2≈1.5849625 is the transcendental alternative. Denominator zero is excluded. | Pass. (carried from the review of 4ff34d9) |
| 430, Baker relation in an algebraic basis | Basis (2) of ℚ: logarithm 0 gives sum 0. With log2 the sum is log4, so the premise that the sum is algebraic fails. | Pass. (carried from the review of 4ff34d9) |
| 438, Baker affine independence | Logs 2,3 with β₀ and all coefficients zero give sum 0. Logs 2,4 with β₀=0 and coefficients 2,−1 give 0 but fail rational linear independence. | Pass. (carried from the review of 4ff34d9) |
| 445, affine independence | Empty logarithm family leaves the relation β₀=0. For one independent logarithm, all-zero coefficients give 0 and no nontrivial relation. | Pass. (carried from the review of 4ff34d9) |
| 453, nonzero algebraic constant in affine form | Logs 2,4 with coefficients 2,−1 cancel; adding β₀=1 gives 1≠0 even though those logs are dependent. | Pass. (carried from the review of 4ff34d9) |
| 461, nonzero linear form is transcendental | Coefficients 3,−1 on logs 2,4 give log2; coefficients 2,−1 give 0 and are excluded. | Pass. (carried from the review of 4ff34d9) |
| 468, exponential of affine form | Empty family and β₀=1 gives e. β₀=1, log2 coefficient 1 gives 2e. Setting β₀=0 would give algebraic 2 and is excluded. | Pass. (carried from the review of 4ff34d9) |
| 477, exponential with independent algebraic coefficients | ℓ=(0,log2),β=(√2,√3): value 2^√3≈3.321997. All-zero ℓ would give 1 and is excluded. | Pass. (carried from the review of 4ff34d9) |
| 487, product of algebraic powers | Bases (1,2), coefficients (√2,√3): product 2^√3. All bases 1 give 1 and fail the existential hypothesis. | Pass. (carried from the review of 4ff34d9) |
| 505, integer norm comparison | p=3,n=3,6,−3: real absolute value times p-adic norm is 1,2,1 respectively. n=0 gives 0 and is excluded from the lower bound. | Pass. (carried from the review of 4ff34d9) |
| 515, exponential radius | p=2 gives 1/2; p=3 gives 1/√3. On the boundary, terms indexed by p^j have constant norm ρ, not a sequence tending to 0. | Pass; completeness unnecessary for the radius. (carried from the review of 4ff34d9) |
| 520, local exponential addition | In ℚ₃, x=3,y=−3: exp(x+y)=1=exp3·exp(−3), both inputs inside the disc. | Pass. (carried from the review of 4ff34d9) |
| 526, exponential minus one norm | p=3,x=3: both sides 1/3. p=2,x=4: both sides 1/4. | Pass. (carried from the review of 4ff34d9) |
| 531, isometry/injectivity | In ℚ₃,x=3,y=6: norm(x−y)=1/3=norm(exp x−exp y)>0. | Pass. (carried from the review of 4ff34d9) |
| 536, exponential-polynomial HasSum | Q=X,ψ=3 over ℚ₃: at x=1 the series equals exp3; at x=0 both sides are 0. | Pass. (carried from the review of 4ff34d9) |
| 547, coefficient norm bound | Q=1,ψ=3,r=1,p=3: coefficient norms at k=0,1,3 are 1,1/3,1/9, all ≤1. At r=0 positive-degree weighted terms are 0. | Pass. (carried from the review of 4ff34d9) |
| 557, integral ultrametric bound | In ℚ₃, integral 3 has norm 1/3≤1; nonintegral 1/3 has norm 3 and is excluded. In characteristic 2, integral 1 has norm 1≤1. | Pass. (carried from the review of 4ff34d9) |
| 562, ultrametric Liouville | x=3,H=3,D=1: norm(x)H^D=1. x=1/3,δ=3,H=1 gives product 3≥1. Replacing D by D−1 in the first test gives 1/3<1. | Pass. (carried from the review of 4ff34d9) |
| 571, one-zero coefficient bound | f=X²,r=M=1,T=2,x=3 over ℚ₃: value norm 1/9=(1/3)². | Pass. (carried from the review of 4ff34d9) |
| 589, many-zero coefficient estimate | f=X²,A={0},S=2,r=2,M=4: coefficient bound at k=2 is 1=4/2². Empty A gives 1≤4. | Pass. (carried from the review of 4ff34d9) |
| 599, many-zero value estimate | Same f,A,S,r,M: at x=1 value norm 1≤1; at x=3 norm 1/9≤1. | Pass. (carried from the review of 4ff34d9) |
| 612, Hermite interpolation with ultrametric bounds (README §8.5 re-stated over `K` ultrametric of characteristic zero) | One node `σ 0 = 0`, `ϱ = 1`, `S = 3`, `s = 2`; separation vacuous, `‖0‖ = 0 ≤ 1`, `0 < 1 ≤ 1`, `2 < 3`. `W = X ^ 2 / 2`: jets `D⁰W(0), D¹W(0), D²W(0) = 0, 0, 1`. Bound `‖(2!)⁻¹‖ · (1 ^ 3)⁻¹`: in `ℚ_[3]`, `‖1 / 2‖ = 1 = max coefficient norm`; in `ℚ_[2]`, `‖1 / 2‖ = 2 = 2`. Over `ZMod 2[X]`: `D²W = 2! • hasseDeriv 2 W = 0` for every `W`, so no `W` has `D²W(0) = 1`; and `((2!) : ZMod 2)⁻¹ = 0` makes the bound `0`, forcing `W = 0`. Lean carries `[CharZero K]` at line 612; README states it. | Pass. (carried from the review of 4ff34d9) |
| 623, (D+c)^m definition | (D+2)X=1+2X; D²X³=6X; zero ring gives zero on both sides. | Pass. (carried from the review of 4ff34d9) |
| 628, binomial formula | c=2,m=2,P=X²: both operator expansion and binomial sum give 2+8X+4X². | Pass. (carried from the review of 4ff34d9) |
| 634, degree bound | The preceding polynomial has degree 2≤2. D³X²=0, whose natural degree is 0≤2. | Pass, including zero-polynomial junk degree. (carried from the review of 4ff34d9) |
| 640, ultrametric coefficients | Over ℚ₃,c=1/3,m=2,P=X²: coefficients 2,4/3,1/9 have norms 1,3,9; all ≤max(1,3)²=9. | Pass. (carried from the review of 4ff34d9) |
| 646, formal derivative identity | D(X exp(cX))=(1+cX)exp(cX); order zero is the original product on both sides. | Pass. (carried from the review of 4ff34d9) |
| 657, p-adic affine independence | Empty family forces β₀=0; log₃4 has norm 1/3 inside the disc. Off-disc ℓ=1 has total exp value 0 and the relation −1+ℓ=0: the disc hypothesis excludes this false extension. | Pass. (carried from the review of 4ff34d9) |
| 666, p-adic linear-form corollary | Singleton log₃4, coefficient 1: norm 1/3, nonzero. Coefficient 0 gives zero and fails the nonzero hypothesis. | Pass. (carried from the review of 4ff34d9) |
| 675, transcendence of exp p for odd primes | Input 3 in ℚ₃ has norm 1/3<1/√3. The p=2 boundary input 2 has norm 1/2 and divergent exponential series. | Pass; the prime 2 exclusion is a convergence condition. (carried from the review of 4ff34d9) |
| 685, transcendence of e | e=exp1≈2.7182818285; input 1≠0. | Pass, headline corollary. (carried from the review of 4ff34d9) |
| 689, transcendence of π | exp(πi)=−1, with πi≠0; π≈3.1415926536. | Pass. (carried from the review of 4ff34d9) |
| 692, exp π | Principal log(−1)=πi and (−i)(πi)=π; expπ≈23.1406926328. | Pass; sign pinned. (carried from the review of 4ff34d9) |
| 695, 2^√2 | 2^√2≈2.6651441427; base 2 differs from 0 and 1. | Pass. (carried from the review of 4ff34d9) |
| 698, log2 | exp(log2)=2 and log2≈0.6931471806≠0. | Pass. (carried from the review of 4ff34d9) |
| 701, log2/log3 | Value ≈0.6309297536. A rational a/b would force 2^b=3^a; the integer-prime valuations force a=b=0, inconsistent with the nonzero denominator representation. | Pass. (carried from the review of 4ff34d9) |
| 705, π+log2 | (−i)(πi)+log2=π+log2≈3.8347398341≠0. Both exponential values, −1 and 2, are algebraic. | Pass. (carried from the review of 4ff34d9) |

### Adversarial table: remaining prose and proof quantities

Every row is carried forward from the review of 4ff34d9, which carried them from earlier reviews. None of these passages changed in this diff.

| Target/convention | Computed instance or comparison | Result / change |
|---|---|---|
| Scope paragraph, “`ℂ_[p]` is not a finite extension of `ℚ_p`” and “does not give 8.1” | `[ℚ_p(p^{1/2^n}) : ℚ_p] = 2^n` for all `n` (Eisenstein), all inside `ℂ_p`, so the degree is infinite; `FinitePadicExtension` requires `Module.Finite ℚ_[p] K`. 8.1's four Lean facts are about `NormedSpace.exp` on a normed `ℚ_[p]`-algebra `L` with `[NontriviallyNormedField L]` (and `[CompleteSpace L]` for the three after the radius), none mentioning `IsNonarchimedeanLocalField` or `FinitePadicExtension`. | Pass; no change. (carried from the review of 4ff34d9) |
| Scope paragraph, Weierstrass sentence | Completed/AdicSpaces §0.5 item 3 is Weierstrass division and preparation over a complete rank-one nonarchimedean field; 8.3 (README line 1104) divides by `∏_{a ∈ A} (X − a)^S`, a distinguished polynomial of degree `|A| · S`, using `TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean`. Degenerate `A = ∅`: the divisor is `1`, division is the identity, and 8.3's bound reads `‖coeff‖ ≤ M / r^k`, the plain Cauchy bound. | Pass; no change. (carried from the review of 4ff34d9) |
| §8.5 warning | Lower bound: `ℚ_[2]`, `s = 2`: `‖1 / 2!‖ = 2 ≥ 1`; `ℚ_[3]`, `s = 3`: `‖1 / 3!‖ = 3 ≥ 1`; any normed field, `s = 0`: `‖1 / 0!‖ = 1 ≥ 1`. General inequality `1 ≤ ‖(s! : K)⁻¹‖` for ultrametric `K` of characteristic zero from `IsUltrametricDist.norm_natCast_le_one`. Equality: `2 = 2 ^ (v_2 (2))`, `3 = 3 ^ (v_3 (6))`, `1 = p ^ (v_p (1))`. Wrong models: archimedean `ℂ` has `‖1 / 2!‖ = 1/2 < 1`; `𝔽₂((t))` has `s! = 0` for `s ≥ 2`, so the inequality needs `[CharZero K]`. | Pass. (carried from the review of 4ff34d9) |
| §8.5 statement over general `K` | Trivial absolute value on `ℚ`: ultrametric, characteristic zero; `‖1 / s!‖ = 1 ≥ 1`, the bound is `ϱ ^ (-(card ι · S))`, consistent. `ℚ_[2]`, `s = 2`: `‖1 / 2!‖ = 2 = 2 ^ (v_2 (2!))`; `ℚ_[3]`, `s = 3`: `3 = 3 ^ (v_3 (6))`. | Pass. (carried from the review of 4ff34d9) |
| §8.5 first Check | `W = X ^ 2 / 2`: `D⁰W(0) = 0`, `D¹W(0) = 0`, `D²W(0) = 1`; `‖coeff 2‖ = ‖1 / 2‖`, `1` in `ℚ_[3]` and `2` in `ℚ_[2]`; the bound is the same number in each case. Wrong normalisation `W = X ^ 2` gives `D²W(0) = 2 ≠ 1`. | Pass. (carried from the review of 4ff34d9) |
| §8.5 second Check | Over `𝔽₂((t))`: `D²(X ^ n) = n (n - 1) X ^ (n - 2)` with `n (n - 1)` even, so `D²W = 0` for every `W`; the jet `D²W(0) = 1` is unattainable; `((2!) : 𝔽₂)⁻¹ = 0` makes the bound `0`. | Pass; negative control is discriminating. (carried from the review of 4ff34d9) |
| Sup norm and polydisc convention | norm(2,3i)=3; membership in the radius-3 product disc and the closed sup ball both hold. | Pass. (carried from the review of 4ff34d9) |
| 0.1, finite products | Two geometric sums at 1/2 and 1/3 give 2·(3/2)=3; double sum also 3. Empty product=1; a zero factor gives 0. | Pass. (carried from the review of 4ff34d9) |
| 0.2, normally convergent analytic sum | g_n(z)=2^(−n)z: sum=2z; at z=1/2 both sum and claimed function are 1. Tail after N has size 2^(1−N)·norm(z). | Pass. (carried from the review of 4ff34d9) |
| 0.3, coefficient API | Addition gives 1+3=4; scalar 2 gives 2·1=2; zero series gives 0. Constant series 1 has coefficient 1 and does not represent the zero germ. | Pass. (carried from the review of 4ff34d9) |
| 0.4, constants, subtraction and monomials | Constant 7 has degree-zero coefficient 7 and positive coefficients 0; subtraction 2−3=−1. z₀²z₁ has coefficient (2,1)=1 and all other coefficients 0. | Pass. (carried from the review of 4ff34d9) |
| 0.5, coordinate division | f=z₀²(1+z₁), at (2,3): f=16, quotient=4, factor z₀²=4, product=16. Constant 1 has nonvanishing degree-zero coefficient and is excluded. | Pass. (carried from the review of 4ff34d9) |
| 1.1, coordinate maximum | z₀z₁ on radius-2 polydisc has boundary maximum 4; at (1,1) norm=1≤4. Radius zero reduces to the single point where the value is 0. | Pass. (carried from the review of 4ff34d9) |
| 1.2, division estimates | f=z²,R=3,r=1,M=9: quotient by z² is 1; the crude bound is 9/4, and the central power estimate gives the sharp 9/9=1. | Pass. (carried from the review of 4ff34d9) |
| 1.4, homogeneous term and coefficient extraction | Degree-two term z₀z₁ at (1,1) has norm 1≤4. Averaging over third roots isolates index (1,1): selected term contributes ρ², index (2,0) contributes 0. | Pass; normalization fixed. (carried from the review of 4ff34d9) |
| 1.5, Taylor truncation | z²,R=2,M=4,z=1,T=3: norm(f)=1≤2+1=3, with remainder bound 2 and retained term norm 1. | Pass. (carried from the review of 4ff34d9) |
| 1.6, Cartesian bound constant | n=1,r=1,R=5,total multiplicity 2: K=1+(1+3)=5; multiplying by M=25 gives 125≥norm(f(1))=1. | Pass; intentionally nonsharp. (carried from the review of 4ff34d9) |
| 2.1, finite exponential-polynomial combinations | (z²−1)expz at 1 has degree-one coefficient 2e; it is a finite sum of entire terms. | Pass. (carried from the review of 4ff34d9) |
| 2.2, growth | At z=1 the exponential norm is e≤4e under the corresponding polynomial bound. Degree-zero monomial at zero is 0^0=1, not 0. | Pass. (carried from the review of 4ff34d9) |
| 2.3, distinct frequencies necessary | Repeated frequencies 0,0 and polynomials 1,−1 give the zero function although neither polynomial is zero. | Pass; injectivity excludes this. (carried from the review of 4ff34d9) |
| 3.2, denominator arithmetic | α=1/2,β=1/3,δ=6: cleared sum 5=3+2; cleared product 6=3·2; square numerator 9=3²; raising denominator exponent multiplies 3 by 6 to 18. | Pass. (carried from the review of 4ff34d9) |
| 3.2, indexed product versus set product | Family (2,2) has product 4; its image set has product 2. The requested indexed version retains multiplicity. | Pass; not duplicate set API. (carried from the review of 4ff34d9) |
| 3.3, finite number field and common denominator | S={√2,1/3}: field ℚ(√2), δ=3, cleared houses 3√2 and 1, both ≤5. Empty S gives ℚ with δ=G=1. | Pass. (carried from the review of 4ff34d9) |
| Packing input to 3.4 | S={−1,1},ε=c=1: separation 2>1 and cardinality 2≤16. Taking ε=5,c=1 would give a singleton bound 1≤16/25, false; ε≤c is retained. | Pass. (carried from the review of 4ff34d9) |
| 4.1, modified analytic constant | At W=12 and T=17, 1+T=18<e⁴/2≈27.299. This supplies slack for the declared 1+T variant. | Pass. (carried from the review of 4ff34d9) |
| 5.1, F and Γ normalization | T=0 gives a constant family bounded by e^N. z₀expz₁ at (2,3) is 2e³, not 3e². For exp(2z),ρ=2,N=0,T=2, actual norm e⁴≈54.598≤Γ=3e⁴≈163.794; a mis-scaled exponent would give ≈22.167 and fail. | Pass. (carried from the review of 4ff34d9) |
| 5.2, arithmetic size parameters | For M=0,1,2, exponent a=2,3,4 and H=8,24,64. Constant coefficient 2 is bounded by H=2 when T=0. | Pass. (carried from the review of 4ff34d9) |
| 5.2, G need not exceed δ in complex estimate | d₀=0,T=1,δ=2,G=1,ε=1/2,θ=3/2: cleared value 3≤4. | Pass. (carried from the review of 4ff34d9) |
| 5.3, Λ and factorial loss | The same small cases give Λ=8,24,256. For total degree 2, σ! is 1 or 2, each ≤2²=4. M=0 uses 0^0=1. | Pass. (carried from the review of 4ff34d9) |
| 5.4, nonvanishing requires independence | x=(1,2): multi-indices (2,0) and (0,1) both have frequency 2; opposite coefficients cancel to F=0. | Pass; hypothesis excludes the example. (carried from the review of 4ff34d9) |
| 5.5, transporting vanishing | n=2,M=3 gives floor(M/n)=1: the required coordinate rectangle contains only (0,0), total degree 0<3. With Λ=8,U=log16, upper 1/16 contradicts lower 1/8 for a nonzero value. | Pass; uses total-order control. (carried from the review of 4ff34d9) |
| 5.6, parameter constants | In the recorded smallest-dimensional test c=1/144,K₁=3457,S₁=60,r=63. At q=10⁶, W≈2.15867352468·10¹¹; counting sides ≈1.86394855447·10²³ and 3.31369294642·10²³. | Pass for counting. (carried from the review of 4ff34d9) |
| 5.6, “sufficiently large” is essential | At q=10⁶,S₀=289268151 the initial log bound is about −9.03052733·10¹⁰, but extrapolation logs at S₀ and 2S₀ are positive, about 1.56778975·10¹³ and 2.20545850·10¹³. At q=10¹⁰⁰⁰ their normalized logs are about −18.7485 and −50.7718. | Consistent with an eventual, not all-q, claim. (carried from the review of 4ff34d9) |
| 5.7, zero basis vector | Setting y=0 makes coordinate/exponential candidates 0 and 1, both algebraic; it fails the independent-family hypothesis. | Pass. (carried from the review of 4ff34d9) |
| 6.1, broader rank version | x=(1,√2,2) has rational rank 2 but is not independent as a three-element family. The stronger rank formulation belongs to the named consumer. | Pass; scope boundary explicit. (carried from the review of 4ff34d9) |
| 7.1, embedding matrix | Basis (1,√2): matrix rows (1,√2),(1,−√2), determinant −2√2, determinant square 8≠0. | Pass. (carried from the review of 4ff34d9) |
| 7.3, joint coefficient independence | Coefficients √2,−√2 on the same nonzero logarithm sum to 0 and exponentiate to 1; each is irrational but the pair is rationally dependent. | Pass; joint hypothesis is needed. (carried from the review of 4ff34d9) |
| 8.1, factorial and small primes | p=2,n=4: norm(4!)=1/8≥1/16. p=3,n=3: norm(3!)=1/3≥3^(−3/2). exp6=(exp3)² and norm(exp3)=1 in ℚ₃. | Pass. (carried from the review of 4ff34d9) |
| 8.2, trivial valuation and denominators | At a trivial norm on an algebraic closure of ℚ, integral 2 gives product 2≥1; x=1/2,δ=2,H=1 clears to 1. | Pass; no unnecessary nontrivial-norm assumption. (carried from the review of 4ff34d9) |
| 8.3, characteristic restriction | In characteristic 2, f=X² has all ordinary derivatives of positive order zero, so S=3 at 0 would falsely imply 1≤4/2³=1/2. §8.3 excludes this by characteristic zero. | Pass. (carried from the review of 4ff34d9) |
| 8.4, operator Checks | (D+2)X=1+2X, D²X³=6X, and (D+c)^m1=c^m. The wrong sign gives 1−2X in the first test. | Pass. (carried from the review of 4ff34d9) |
| 8.6, frequencies | ℓ=(3,6): indices 0,(1,0),(2,3) give ψ=0,3,24. The last two have 3-adic norms 1/3 and 1/3, bounded by max norm(ℓ)=1/3. | Pass. (carried from the review of 4ff34d9) |
| 8.6, γ and constant frequency | β=2,β₀=5: indices (2,3),(0,3),(1,0) give (γ,e_none β₀)=(7,10),(3,0),(2,5). | Pass. (carried from the review of 4ff34d9) |
| 8.6, derivative factors and diagonal evaluation | For d=2 and (γℓ,c)=(42,10), the zeroth factor is X², none derivative 2X+10X², and other derivative 42X². At natural l=2, exp(2ℓ)=(expℓ)². | Pass. (carried from the review of 4ff34d9) |
| 8.7, coefficient integrality | P=1/2,δ=1 would leave nonintegral 1/2 and is excluded. With k=0,L=l=δ=1,α=4,G=4,P=1,m=0, the algebraic coefficient has house 1≤32. | Pass. (carried from the review of 4ff34d9) |
| 8.7, counting | k=0,L=h=1: two equations and four unknowns; doubling the equations gives 4≤4. The selected denominator exponent is 2. | Pass. (carried from the review of 4ff34d9) |
| 8.7, logarithm separation | α=1/4,δ=G=4 at p=3 gives norm(log α)=1/3≥1/8. The erroneous choice G=1 would demand 1/3≥1/2 and is not allowed by the hypotheses here. | Pass. (carried from the review of 4ff34d9) |
| 8.7, E API | The four supplied small cases evaluate to 4,64,12,64; increasing the relevant nonnegative parameter increases or preserves the product. | Pass. (carried from the review of 4ff34d9) |
| 8.8, final inequality is a hypothesis | k=0,L=h=D=G=C=1,p=3,r₀=2,S=R=0 gives Π=16: the proposed smallness comparison reads 1536<1 and fails. This tiny instance is not claimed to finish the proof. | Pass; avoids vacuous parameter assertion. (carried from the review of 4ff34d9) |
| 8.8, Hermite elimination | Two distinct frequencies with two derivative orders give product multiplicity 4; the interpolation order must cover all four conditions, not two. | Pass. (carried from the review of 4ff34d9) |
| 8.9, k=0 parameter powers | K_max=21,h=X⁷,L=X¹¹,R_J=X^(7+J),S_J=2^(21−J)X¹³. Counting exponents are 21<22; S₀/h²=2²¹/X→0. | Pass. (carried from the review of 4ff34d9) |
| 8.9, extrapolation and final margin | Gain exponent 20+J exceeds cost exponent 19+J; initial log E has size X¹⁴logX. In general final gain exponent 6k²+32k+41 exceeds 6k²+29k+33 by 3k+8>0, including k=0. | Pass. (carried from the review of 4ff34d9) |
| 8.10, reciprocal radius and small primes | log₃4 has norm 1/3, reciprocal radius √3; log₂5 has norm 1/4, reciprocal radius 2. Both are strictly inside their exponential discs. | Pass. (carried from the review of 4ff34d9) |

## Not verifiable

- The changed passage cites no source, and none was opened this round. The source record for [Baker75] (settled as uncertified) and the locators into [W00] stand as in the previous reviews. So do the other works that README `## References` says are cited without an open copy.
- Ownership against open pull requests whose files the brief does not supply was checked only through the roadmap index and the three heads read above (#1306, #1071, #1311). It was not checked beyond them.

## Source issues

- none
