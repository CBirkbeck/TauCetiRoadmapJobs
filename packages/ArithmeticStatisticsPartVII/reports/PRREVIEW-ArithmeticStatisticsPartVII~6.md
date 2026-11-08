# Review of ArithmeticStatisticsPartVII (pull request #1178 at effcdf5)
**Verdict:** needs changes

## R01 (P2) — The sharp additive large sieve, now an owned and consumed statement, has no range for δ

**Location:** `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:1035` “Then prove the additive large sieve `Σ_r|S(α_r)|²≤(N−1+δ⁻¹)Σ|a_n|²` for … points `α_r` with `‖α_r−α_s‖≥δ` for `r≠s`”; `:17` “the sharp additive large sieve with constant `N−1+δ⁻¹` for points `δ`-spaced modulo one”.

**Claim:** No hypothesis bounds `δ`. For a family of one point the spacing condition is vacuous, so every `δ` is admitted, and the inequality is false once `δ>1`; for `δ≤0` the constant `δ⁻¹` means nothing. The cosecant corollary in the same sentence also states no `δ>0` (with `δ=0` two coinciding points put `sin 0` in a denominator). `:17` and `:2535` now make these the statements that SieveMethodsAndPrimePatterns consumes, so the missing hypothesis is part of the contract.

**Witness:** `N=1`, `M=0`, `a_1=1`, the single point `α_1=0`, `δ=2`: left side `|S(0)|²=1`, right side `(1−1+1/2)·1=1/2`. Montgomery1978 line 61 (p. 548): every admissible constant is at least `N`.

**Repair:** In `:1035` and `:17` state the additive large sieve for `0<δ≤1`. Two or more points force `δ≤1/2` automatically, and one point needs only `δ≤1`, by Cauchy–Schwarz. In the cosecant corollary write “for `δ>0`”. Use `δ≤1`, not `δ≤1/2`: at `Q=1` the target's own reduction uses the single point `0` with `δ=Q⁻²=1`, which `δ≤1/2` would exclude. Add a negative-control Check: one point, `N=1`, `a_1=1`; `δ=2` gives `1>1/2`, and `δ=1` gives equality `1=1`. Tested on the refuting instance: `δ=2` is now excluded, and `δ=1` and `δ=1/2` give `1≤1` and `1≤2`. Cohen's dilation still works for `δ≤1`: the dilated points of one point are `1/K≥δ/K` apart. The consumer's form (SieveMethodsAndPrimePatterns `README.md:2328` at its head, `0<δ≤1/2`) is a special case.

## R02 (P3) — “the constant π that the sharp additive constant needs” is too strong

**Location:** `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:17` “the weighted Hilbert inequality of AnalyticNumberTheoryPartI §1.5a, with local spacings and constant `3π/2`, does not give the constant `π` that the sharp additive constant needs.”

**Claim:** The sharp constant `N−1+δ⁻¹` does not need any Hilbert inequality. Selberg's majorant gives it directly, and `:1035` offers that route. Only the Hilbert-inequality route through the cosecant corollary and Cohen's dilation needs `π`.

**Witness:** Montgomery1978 lines 441–445 (p. 559): Theorem 3, `A=N−1+δ⁻¹`, follows from inequality (17) and Selberg's majorant (Lemma 5), with no use of Theorem 2. `README.md:1035` itself offers this route.

**Repair:** Replace the clause with: “… gives at uniform spacing only `3π/(2δ)`, so the route through the cosecant corollary and Cohen's dilation reaches only `N−1+(3/2)δ⁻¹` from it, not `N−1+δ⁻¹`; the uniform-spacing inequality `π/δ` is stated here for that route and for SieveMethodsAndPrimePatterns.” Tested at `N=3`, `δ=1/2`: `N−1+(3/2)δ⁻¹=5`, against the value `4` that the Check at `:1044` attains.

## Previous findings

- R01 — repaired: `README.md:17` “That target owns the Montgomery–Vaughan Hilbert inequality with the uniform-spacing constant `π/δ` and its cosecant corollary, the sharp additive large sieve … SieveMethodsAndPrimePatterns consumes these three inequalities”; `:2535` “SieveMethodsAndPrimePatterns §2.9 consumes the Hilbert inequality `π/δ` …”. The repair introduced R01 and R02 above.

## Verified sound

:robot: Independent AI incremental re-review of **10 changed lines since a20e647** (6 insertions, 4 deletions). The changed text is `README.md:17, 1035, 1037, 1044, 1045, 2535`. `Suggested.lean` is byte-identical to a20e647 (`git diff --stat a20e647 HEAD` lists only the README). Also checked: what depends on the changed text (the Kane estimates at `:1054–1056`, the consumer's §§2.3 and 2.9). Against `origin/main` the pull request changes nothing outside this folder (`git diff --stat origin/main...HEAD` outside the folder is empty).

**Gate, build, dependency check.**
- I ran the gate on this head: every check 0, `OK`, matching the worker's run. My run printed no `build` field. The build is confirmed by the worker's gate (`build=0`) and by my elaboration below.
- `lake env lean` on `Suggested.lean`: exit 0, nine `declaration uses 'sorry'` warnings (lines 74, 99, 112, 124, 139, 145, 170, 189, 206), nothing else.
- The dependency check printed exactly:

```text
depcheck: 240 roadmaps, 2449 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The new mentions of SieveMethodsAndPrimePatterns (merge order line 269; this roadmap is line 141) are consumer statements, not `*Needs:*` edges. AnalyticNumberTheoryPartI (line 90) is earlier.

**Signatures, padding, headlines.** `Suggested.lean` is unchanged, so [r5]'s `#check` comparison of the 20 declarations and its padding probe still hold (nine `sorry` warnings survive the one-tactic probe). The multiplicative large sieve and the three inequalities inside it are inputs to the Kane estimates, not headline theorems, so their absence from `Suggested.lean` is correct. No fully qualified name collides with SieveMethodsAndPrimePatterns' `SieveTaper.sharp_additive_largeSieve` (its `Suggested.lean:156`) or `SieveApplications.sharp_primitive_largeSieve` (`:181`). The 11 leads in the worker's citation file are unchanged lines. Ten are declarations of this `Suggested.lean`; I grepped each. `ArithmeticFamily.hasDensity_zero_of_finite` (`README.md:61`) resolves to ArithmeticStatisticsPartI `README.md:278` at its open head.

**Ownership after the repair.**

| Where | Statement | Bearing |
|---|---|---|
| This roadmap, `README.md:17, 1035` | Hilbert `π/δ` (ordered `λ`, gaps `≥δ>0`); cosecant `δ⁻¹`; additive `N−1+δ⁻¹`; primitive `N−1+Q²` (`N≥1`, real `Q≥1`) | Owner; earlier in the order (141). |
| SieveMethodsAndPrimePatterns at its head, `README.md:2318` | Hilbert `π/δ`, any finite family with pairwise separation `δ>0` | Same statement: after sorting, pairwise separation is the same as consecutive gaps. |
| same, `:2328` | sharp additive, `N≥1`, `0<δ≤1/2` | Special case of this target once R01 adds `0<δ≤1`. |
| same, `:2338` | sharp primitive, natural `H,Q≥1` | Special case (here `Q` is real). |
| same, `:1880`, `:1944` (§2.3) | reduced-residue and primitive sieves with `H+2Q²` | Weaker: `H=3, Q=2` gives `11≥6`. `Q=0` and `H=0` hold trivially (empty sums). |
| same, `:13` and `:2326` | still say “the uniform-spacing constant π/δ of §2.9 is owned here” | That roadmap is later and must cite this target; this is its own repair, not one for this pull request. |
| AnalyticNumberTheoryPartI at its head, `README.md:979–980` (§1.5a) | weighted `(3π/2)Σ|u_r|²/δ_r`, `|I|≥2`, local spacings | Matches the description at `:17`. |

**Montgomery locators for the new text** (source `Montgomery1978`; extraction page `k` is printed page `546+k`):

| README citation | Montgomery line | Printed page | Agrees |
|---|---|---|---|
| Theorem 2 (Hilbert inequality) | 285–287 | 554 | yes: `λ_1<…<λ_R`, `λ_{r+1}−λ_r≥δ`, constant `πδ⁻¹` |
| Corollary 1 (cosecant) | 338–339 | 556 | yes: constant `δ⁻¹` under spacing (1) |
| Corollary 2, second assertion | 359–363 | 556 | yes: `A=N+δ⁻¹` |
| Theorem 3 (Selberg) | 441–445 | 559 | yes: `A=N−1+δ⁻¹` from (17) and Lemma 5 |
| Note added in proof (Cohen) | 446–453 | 559 | yes: `T(α)=S(Kα)`, points spaced `δ/K`, constant `K(N−1)+1+K/δ`, divide by `K` and let `K→∞` |
| `A≥N` for every family | 59–61 | 548 | the source of R01's witness |

**Seeded sample.** No sampled target (§§5.1, 5.3–5.8, 5.24, 5.25, 5.27–5.32) contains a changed line: the changed text sits in Scope and ownership, §5.9 and Downstream consumers. Their locators stand as verified in [r5] and [r3]. The README flags no locator as unverified (`grep -i 'unverified\|uncertified'` finds nothing).

**Adversarial table.** Below are fresh rows for every changed statement, computed by hand and with a short script. Rows carried from [r5] follow; they keep a20e647's line numbers, and README lines after 1040 are now 2 lower in the file (`+2`).

| Statement | Instances and computed values on both sides | Result |
|---|---|---|
| README:1035, Hilbert inequality | `R=2`, `λ=(0,1)`, `w=(1,i)`: `(1·(−i))/(−1)+(i·1)/1=2i`, `|2i|=2≤π·2=6.283`. Operator norm of `[1/(r−s)]_{r≠s}` at spacing 1: `R=2`: 1.000; `R=3`: 1.500; `R=8`: 2.354; `R=40`: 2.939; all `<π=3.1416` and rising toward it. `R=0,1`: left side 0. | Holds; `π` is the limiting constant. |
| README:1035, cosecant corollary | `R=2`, `α=(0,1/2)`, `δ=1/2`, `w=(1,i)`: `(−i)/sin(−π/2)+i/sin(π/2)=2i`, `2≤δ⁻¹·2=4`. Equally spaced `α_r=r/R`, `δ=1/R`: norm of `[csc π(α_r−α_s)]` is 1.000, 2.000 and 7.000 at `R=2, 3, 8`, each `≤R`. `δ=0` with coinciding points: `sin 0` in a denominator. | Holds for `δ>0`, which is not stated (R01). |
| README:1035, additive large sieve | The Check's instance gives `4+4=8=(3−1+2)·2`. One point, `N=1`, `a_1=1`, `α=0`: `δ=2`: left 1, right 1/2; `δ=1`: `1=1`; `δ=1/2`: `1≤2`. | False for one point with `δ>1` (R01). |
| README:1035, `Q⁻²` spacing feeding the additive sieve | `Q=1`: points `{0}`, `δ=1`, one point; `Q=2`: `{0,1/2}`, gap `1/2≥1/4`; `Q=3`: `{0,1/3,1/2,2/3}`, gap `1/6≥1/9`. | `Q=1` uses `δ=1`, so the range must be `δ≤1`, not `δ≤1/2` (R01). |
| README:1035, Cohen's dilation | Dilate one point by `K`: the points are `k/K`, spaced `1/K`. That is `≥δ/K` only for `δ≤1`. For `R≥2` the spacing `δ/K` holds since `δ≤1/2`. | Route correct within `0<δ≤1`. |
| README:1035, “Both hold for the empty and the one-point family” | `R=0`: empty sums, `0≤0`. `R=1`: no pair `r≠s`, left side 0, right side `≥0`. | Correct. |
| README:1037, Needs | The Hilbert inequality, the cosecant corollary and the additive sieve are listed as part of the target. The Mathlib names are unchanged from [r5], which opened them at the pin. | Consistent with `:1035`. |
| README:1044, Check “additive constant attained” | `M=−1`, `N=3`: `n∈{0,1,2}`. `S(α)=1+e(2α)`, `S(0)=2`, `S(1/2)=1+e(1)=2`, left 8, right `4·2=8`. `N+δ⁻¹=5`, giving 10; `πN+δ⁻¹=11.425`, giving `22.850` (“≈11.4”, “22.8”). | Correct. |
| README:1045, Check “signed versus absolute” | `R=8`: `2(7+3+5/3+1+3/5+1/3+1/7)=27.486`; `8π=25.133`; the signed sum is 0 by antisymmetry. | Correct negative control. |
| README:17, `3π/2` versus `π` | Uniform spacing: `3π/(2δ)=4.712/δ` against `π/δ=3.142/δ`. Through the cosecant corollary and Cohen's dilation: `N−1+(3/2)δ⁻¹`, so `N=3`, `δ=1/2` gives 5 against 4. Selberg's majorant gives 4 with no Hilbert input. | `3π/2` is insufficient on the Hilbert route. “Needs π” is too strong (R02). |
| README:2535, §2.3 consequence | `H+2Q²≥H−1+Q²`: `H=3, Q=2` gives `11≥6`. `Q=1`: one point, `δ=1`, constant `H`. `Q=0` or `H=0`: empty sums. | Correct, given R01's `δ≤1`. |
| README:1054, Kane Lemma 14 from the target | The multiplicative statement at `:1033` is unchanged, so [r5]'s bound `C₁≤180` stands. | Unaffected by the changes. |

Carried rows from [r5]. The row “README:1035, 1039, constants” is replaced by the rows above.

| Statement | Instances and computed values on both sides | Result |
|---|---|---|
| README:1033, multiplicative large sieve at `Q=1` | Only `q=1`, trivial character primitive, weight `1/φ(1)=1`. `N=3`, `a≡1`: left `9`, right `3·3=9`, equality. `a=(1,−1,0)`: left `0≤6`. | Cauchy–Schwarz case; `N−1+Q²=N` is sharp. [r5] |
| README:1033, at `Q=3` | `N=2`, `a=(1,1)` at `n=1,2`: `q=1` gives `4`; `q=2` has no primitive character; `q=3`, `χ₃`: `(3/2)|1−1|²=0`; left `4≤(1+9)·2=20`. | Holds; primitive filter and weights as stated. [r5] |
| README:1044, Check at `Q=2`, `N=100` | Left `100²=10000≤103·100=10300`; principal character mod 2 would add `2·50²=5000`; `15000>10300`. | Negative control for primitivity holds. [r5] |
| README:1045, Gallagher identity | Mod 3, `n=2`: `τ(χ₃)=e(1/3)−e(2/3)=i√3`, left `−i√3`; right `e(2/3)−e(1/3)=−i√3`. Mod 4 principal, `n=2`: left `0`, right `e(1/2)+e(3/2)=−2`; `τ(χ₀)=i−i=0`. | Identity holds for primitive, fails for imprimitive. [r5] |
| README:1046, spacing | `q≤3`: `{0,1/3,1/2,2/3}`, least gap `1/6≥1/9`; `q≤2`: `{0,1/2}`, gap `1/2≥1/4`. | `Q⁻²` spacing holds. [r5] |
| README:1052, Kane Lemma 14 from the target | `Q²=N`: `M=1`, bound `(Q²+N−1)‖a‖²=(2N−1)‖a‖²≤2Q√N‖a‖²`. General: `NM²≥Q²` gives `M≥Q/√N`, so `(Q²+NM²−1)/M≤5Q²/M≤5Q√N`. Lower step: `Σ_n b_nχ(n)=#{m≤M:(m,2p)=1}/M≥(⌈M/2⌉−⌊M/p⌋)/M≥1/6` (`M=4,p=3`: `1/4`). So `C₁≤5·36=180`, absolute. | “absolute effective `C₁`” holds. [r5] |
| README:1052, Lemma 15 bound | Kane line 673: `O(X log X·A^(−1/8))`, primes `≥A`, `p₁p₂≤X`; README has `Y₀` for `A`; line 965: `A=(log N)^(8C+16)`. | Same statement and parameter. [r5] |
| README:1064, Check, first interval | Moduli `p₂≤X/Y₀`, `N=Y₀(1+Y₀^(−1/4))`, `(X/Y₀)²≥X≥N` for `Y₀≤√X`, `X≥4`. `√(X/Y₀)·(C₁(X/Y₀)√Y₀·Y₀^(3/4))^(1/2)=√C₁·X·Y₀^(−3/8)`. Kane lines 704–714 give the same. | `O(XY₀^(−3/8))` correct. [r5] |
| README:1064, Check, §5.29 in its place | `C_ε X^ε(X/Y₀)·Y₀^(3/4)`, square root, times `√(X/Y₀)`: `X^(1+ε/2)Y₀^(−5/8)`. Exceeds `X log X·Y₀^(−1/8)` iff `X^(ε/2)>Y₀^(1/2)log X` iff `X^ε>Y₀(log X)²`. Kane applies Lemma 15 with `X=N/P` (line 843), `P=1`: `C=1`, `N=e^200`: `Y₀=200^24=1.7·10^55`, `Y₀(log X)²=6.7·10^59<e^200=7.2·10^86`. | The `(QN)^ε` factor is fatal; Check correct. [r5] |
| README:1050, effectivity after the change | Inputs now: `N−1+Q²` (explicit), `C₁≤180`, AnalyticNumberTheoryPartI §§0.6, 0.18, 0.28, 0.34 (effective, [r4]). | No ineffective input remains in the estimates. [r5] |
| README:1054, 1056, 2529, 2533 | `*Needs:*` anchors resolve; §5.29 removed from Needs, Dependencies and Downstream; citation names Proposition 9's proof by page (Kane lines 609, 755, 869, 967). | Consistent with `:17` and `:1031`. [r5] |
| README:1074, Kane section | Line 1356 “5 From Sizes to Ranks” on p. 24; §4 begins line 1003 on p. 18. | “§5” correct; the [r3] row carried below cited “§4”. [r5] |
| Suggested.lean:59, `IsMaxIsotropic` with `IsTotallyIsotropic` | `𝔽₂²`, `Q=xy`: axis `⟨e₁⟩`: `Q(e₁)=0`, `polar(e₁,e₂)=Q(e₁+e₂)−0−0=1`, so `W^⊥=W`. Diagonal `⟨e₁+e₂⟩`: `polar(d,e₁)=Q(e₂)−Q(d)−0=0−1=1≠0` so `D^⊥=D`, but `Q(d)=1`. | The first conjunct excludes the polar-only model; equivalent to the old body by `isTotallyIsotropic_iff`. [r5] |
| Suggested.lean:74–81, `Finite K`, `Nat.card K` | `𝔽₂`, `n=2`, `z=1`: `(1+1)(1+2)=6=#I_V`; `𝔽₃`, `n=2`, `z=1`: `(1+1)(1+3)=8` ([r3] enumeration). `Nat.card 𝔽₂=2=Fintype.card`. | Same statement as before. [r5] |
| README:33, 1037, Mathlib names | Five declarations opened at the pin (list above); hypotheses `IsDomain R`, primitivity, `IsUnit a` are those the route uses. | All exist; descriptions accurate. [r5] |
| README:2571, reference [57] | Cache header: fetched from the AMS Bulletin open archive URL; 21 pages, pp. 547–567. | Legal copy; locators checked above. [r5] |
| README:45, §0.34 primitive contract | Real primitive nonprincipal conductors are 3, 4, 5, 7, 8 (two), 11, 12, …; none at 1, 2, 6, 10. So `q≥3` excludes nothing. At `q=3` a zero `β≤1/2` already gives `(log 3)/2=0.549`. | Matches `landau_siegel_exclusion`. [r4] [r5] |
| README:45, imprimitive clause | χ mod 12 from χ₋₃: `L(s,χ)=L(s,χ₋₃)(1+2^(−s))`. For real `s`, `1+2^(−s)∈(1,2]`; its zeros are at `s=i(2k+1)π/log 2`, so `Re s=0`. `log 12/log 3=2.262≥1`. | Same real zeros; `log m≥log q`. [r4] [r5] |
| README:45, §0.6 paraphrase | `T=2`: the only primitive character of modulus ≤2 is trivial, and `ζ(1/2)=−1.4604<0`, consistent with `ζ<0` on `(0,1)`. Quantifier order: `c` before `T`. | Equal to the supplier text. [r4] [r5] |
| README:1033, “No exceptional character is retained” | Old B: `max(e^((C+2)β log log N),…)`; new B: the last two terms. A Check at README:1046 shows the dropped term is dominated. | Consistent. [r4] [r5] |
| README:1035, imprimitive reduction | χ mod 12 versus χ₋₃: at 2 the values are 0 and −1, at 3 both 0. Prime sums differ by at most `ω(12)=2` terms, here 1. | Correct. [r4] [r5] |
| README:1035, cutoff `B` | `D=4, C=1, log log N=2`. First-term exponent ≤`(C+2)(log D/c_LS)log log N=3·462.1·2=2772.6`. Second, `K=1/c_LS=333.3`: `333.3·9·1.922·4.717=27196`. Negative control `1−β₀=10^(−6)`: first exponent `6·10^6>27196`. | The term drops only because of §0.34. [r4] [r5] |
| README:1046, new Check | `β₀=1−0.003/log 4=0.997836`; `log x=2772.6` gives `(1−β₀)log x=6.00=(C+2)log log N`. `x^β₀/β₀=e^(−6)x/0.9978=0.002484x≤2x(log N)^(−3)=0.004958x`. `log 4=1.386>1`; `log log(DN)=log 8.775=2.172≥2>1`. | Every inequality of the Check holds. [r4] [r5] |
| README:1046, Check versus `4|D` | The smallest `D` is 4, with `log D=1.386>1`. `D=2` would give `log 2=0.693<1` and break the last step, but 4∣D excludes it. | Standing hypothesis used, not added. [r4] [r5] |
| README:1035, variable-modulus recursion | Kane's choice `A=(log N)^(8C+16)`, `Y=DA^n`, `n<2L` (`L=log log N`), `C=1`: `log Y≤1.386+48L²`. At `L=10`: `log Y≤4801.4`, `β≤1.6·10^6` (`c_LS=0.003`), polynomial in `L`. So `log log B=O(log L)<εL` eventually. | Siegel input removed; Kane's induction still runs. [r4] [r5] |
| Dependents: determinacy and two-Selmer distribution | Hypotheses are limits (`Tendsto`), not rates. `a₀=0.20971122` and moments `1,3,15,135` are unchanged by an effectivity clause. | Unaffected; carried rows remain valid. [r4] [r5] |

Rows carried from [r4] through [r3], with [r3]'s line numbers:

| Previous line / statement | Instances and computed values on both sides | Result / provenance |
|---|---|---|
| README:61, imported finite-subset density | A singleton in N growing classes has proportion 1/N→0; the empty subset has 0/N=0. A singleton ambient family has 1/1=1. | Correct import; ambient infinitude/growth excludes the wrong case. [r3] [r5] |
| README:61, finite-symmetric-difference invariance | If two subsets differ on k points, count difference ≤k, normalized difference ≤k/N→0. For k=2,N=10,100 the bounds are 1/5,1/50. | Same limit in both directions; no new density theorem owned here. [r3] [r5] |
| README:1449, torsion-exception consumer | At p=3, E[3] has 9 points and 8 nonzero points, giving ≤8 exceptional characters. Density bounds at N=10,100,1000 are 4/5,2/25,1/125. At p=2, +P=−P for every P. | Part I's denominator removes the finite exceptions; the odd-prime hypothesis remains essential. [r3] [r5] |
| README:2170; Suggested.lean:200, bounded-exponent decomposition | A=C2, n=4: 4·0=4·1=0, choose d=2 dividing 4. Both sides have 2 elements; forcing d=4 would give at least 4 for a nonzero sum. | Proper-divisor summands retained. [r3] [r5] |
| Same headline, composite exponent | A=C2⊕C3, n=6: all six pairs are annihilated; d=(2,3) gives 2·3=6 elements. C2² and C3² give 4 and 9 elements with exponents 2 and 3. | Matches native direct sums and includes p=2,3. [r3] [r5] |
| Same headline, arbitrary index | For ⊕_I C4, n=4: (4a)_i=0 in each coordinate; d(i)=4 gives identity on the same group. For I=ℕ, distinct e_i give infinitely many elements; finite support remains finite for any I. | No finite-generation/countability restriction; arbitrary universe-sized I allowed. [r3] [r5] |
| Same headline, n=1 and zero group | 1a=a=0 forces A=0. Empty direct sum has cardinality 1 and its only element is 0, matching A. | Positive modulus includes the trivial case. [r3] [r5] |
| Same headline, n=0 negative control | In Q, 0a=0 for all a, but 1 has infinite additive order. Every element of a direct sum of positive-order finite cyclic groups has finite order. | The 0<n hypothesis excludes this counterexample. [r3] [r5] |
| README:2172, all-divisor splitting criterion | C2→C4 by 1↦2: modulo 4 images are 0,2 (injective); modulo 2 images are 0,0 (not injective). C2→C2⊕C4 by x↦(x,0) has retraction (x,y)↦x with composite identity. | All divisors are needed; inclusion alone does not force splitting. [r3] [r5] |
| README:2191, Kummer consumer | An order-m class lifted from H¹(k,A[m]) has order dividing m; its image has order m, so the lift has order exactly m. At m=1 both are 0; for m=4 neither order 1 nor 2 maps to order 4. | New decomposition supplies cyclic generators without any finiteness assumption. [r3] [r5] |
| README:2423–2425, principal-idele adapter | For Λ=Z+Zi, x=2, t=1/5: lattice Λ/2, coordinate 1/10, comparison z↦ξ(2z) gives ξ(1/5). Wrong coordinate 2t gives ξ(4/5); difference 3/5∉Λ. | Inverse-idele action agrees with Rubin and the imported CM action. [r3] [r5] |
| README:2434, composition and identity | Identity gives lattice Λ, coordinate 1/5 and comparison ξ. Principal 2 then 3 gives Λ/6, coordinate 1/30, and ξ(6/30)=ξ(1/5), equal to principal 6. | Composition and identity laws agree. [r3] [r5] |
| README:2436, nonprincipal direction | For an ideal class b of order 3, inverse action gives b⁻¹=b²≠b. With exponent labels in Z/3, −1=2, not 1. | Detects reversal that an order-two class would miss. [r3] [r5] |
| README:2437, exceptional units | Principal i keeps Z+Zi fixed, takes 1/5 to −i/5; comparison iz gives i(−i/5)=1/5. Without that comparison the difference is (−1−i)/5, not a lattice element. | Actual order-four unit retained, not a quotient by signs. [r3] [r5] |
| README:2469, nonprincipal ideal kernel and degree | In Z[√−5], the ideal basis (2,0),(1,1) has determinant 2. Thus [O:a]=2 and the quotient isogeny has degree 2. Norm equation x²+5y²=2 has no solutions: y=0 gives x²=2; otherwise ≥5. | Degree-two ideal quotient exists without a scalar generator. [r3] [r5] |
| README:2469, descent and change of order | F-defined CM maps give σ(αP)=α·σ(P); αP=0 implies α·σ(P)=0 for every α in a. For O=Z+2Zi, conductor 2Z[i], Λ=O: Λ′=Z[i], [Λ′:Λ]=2 and multiplier order Z[i]. | Galois-stable kernel descends; conductor quotient changes the order rather than merely multiplying by 2 on E. [r3] [r5] |
| README:2471, element differential action | [2] and [−2] have degree 4 and four-element kernel, but pullback coefficients 2 and −2. [0] has differential coefficient 0 and is not a nonzero ideal isogeny. | Element formula permits zero; nonzero quotient coefficient is asserted only for isogenies. [r3] [r5] |
| README:2473, chosen quotient coefficient | For the identity quotient with equal differentials, φ*ω=ω gives c=1 uniquely. For [2] with equal normalized differentials, φ*ω=2ω gives c=2≠0. | One-dimensional differential space and characteristic-zero separability give uniqueness and nonvanishing. [r3] [r5] |
| README:2474, formal linear coefficient | With normalized forms and t′=2t+bt²+…, pullback constant coefficient is 2dt; t′=−2t+bt²+… gives −2dt. These equal c=±2, not the common degree 4. | Correct first-order comparison for the specified source and target forms. [r3] [r5] |
| README:2475, rescaling API | Starting c=1: (u,v)=(1,2) gives c′=2; (2,2) gives c′=1. Starting c=2 with (u,v)=(2,3) gives c′=3; pullback 3·2ω=3·(2ω). | c′=(v/u)c with nonzero u,v; inverse ratio would give 4/3 in the last case. [r3] [r5] |
| README:2482, principal quotient versus endomorphism | Ideals (2)=(−2) have norm 4, so their quotient kernel is the same. Target identifications yield coefficients +2 or −2, hence distinct maps with the same kernel and degree. | Separates quotient data from a choice of target isomorphism. [r3] [r5] |
| README:2483, unit ideal | N(O)=1, kernel {0}, quotient identity. Equal forms give 1; only target scaled by 2 gives 2; both forms scaled by 2 give 1. | Three discriminating differential checks are valid. [r3] [r5] |
| README:1541–1556, dependent CM ratio/corank | F=K gives finite factor 3 times complex factor 1/3=1; [F:K]=2 gives 9·(1/9)=1. The composite λφ is an element of norm 3ℓ, so its 3-primary norm is 3. | The repaired distinction preserves the all-place proof and conditional half-density consequence. [r3] [r5] |
| README:2441–2457, dependent Hecke/unit comparisons | Principal 2 gives finite scalar 2 and inverse infinite norm 1/2, product ψ=1. A unit character ζ3 is cancelled by ζ3²: product 1; a sign character cannot cancel ζ3. | The adapter preserves principal triviality and the larger exceptional twist groups. [r3] [r5] |
| 75: Cohen lenstra heuristic for quadratic fields | p=3, B=0: imaginary predicted mass 0.56012608; real mass 0.84018912 (=3c/2). d=−1,2 have discriminants −4,8. | Conjecture remains a conjecture. [r3] [r5] |
| 101: Cohen lenstra moment conjecture for quadratic fields | A=0: Sur(G,0)=1 and prediction 1. A=C3: predictions 1 and 1/3 for u=0,1; Sur(C3,C3)=2. | No assertion that individual fields equal their mean. [r3] [r5] |
| 125: Cohen lenstra moment form implies heuristic | Adding mass 3^(−N) at C3^N changes TV by at most 2·3^(−N), but changes the C3-surjection moment by 1−3^(−N). | Converse correctly excluded. [r3] [r5] |
| 141: Cohen martinet predicted surjection moment | Sign action C2 on F3: fixed size 1 gives 1; identity fixed size3 gives1/3. In F2 sign=identity, prediction1/2. | Correct, including dyadic negative control. [r3] [r5] |
| 168: Cohen lenstra martinet average conjecture | Trivial class group contributes1, never0; C3 contributes3. For p=3,G=C2 the coprimality test is gcd(3,2)=1. | Only predicted limit, not a proved density. [r3] [r5] |
| 193: Cohen martinet surjection moment conjecture | Sign F3 has global invariant dimension0; infinite-place identity has fixed dimension1 and moment1/3. | The no-trivial-constituent condition does not replace local invariants. [r3] [r5] |
| 218: Relative three torsion as irreducible hom count | G=C2, H=1: V is the one-dimensional sign representation; a sign C3 class module has Hom-count3, a trivial C3 module has Hom-count1. | Correct distinction of relative and absolute torsion. [r3] [r5] |
| 232: Cohen martinet prediction for relative three torsion | u=0,1,2 give1+3^(−u)=2,4/3,10/9. | Correct unit-rank normalization. [r3] [r5] |
| 249: Cohen martinet prediction for three torsion of two extensions | W′=0 gives factor1 and predictions2 or4/3; a one-dimensional extra trivial-action-at-infinity summand multiplies by1+1/3. | Direct-sum multiplicities retained. [r3] [r5] |
| 268: Dihedral quartic proven average versus prediction | For u=0 and base h3-values1,3, weights1,2 give A_w=7/3, versus unweighted2; final factor2 gives14/3 versus4. | Correctly does not equate different base-field weights. [r3] [r5] |
| 290: Enhanced cohen lenstra finite level law | g=0: every cokernel0, mass1. g=1,F2: F=0 yields both cokernels0; F=1 yields neither0, joint zero mass1/2. | Shared matrix creates dependence. [r3] [r5] |
| 320: Zero cokernel probability at two | g=1:1/2; g=2 enumeration6/16=3/8, product(1−1/2)(1−1/4)=3/8. | Equal. [r3] [r5] |
| 338: Zero cokernel probability lower bound at odd primes | g=2,p=3:27/81=1/3; p=5:365/625=73/125. Both exceed2c3−1=0.12025216. | Bound, not equality or existence of a limit. [r3] [r5] |
| 356: Enhanced cohen lenstra conjecture | Empty prime set and empty tuple give singleton law mass1; (n1,n2)=(1,1) forces equal cokernels, so distinctness test rejects it. | Conjectural family hypothesis retained. [r3] [r5] |
| 382: Maximal isotropic subspaces of a quadratic space | F2 plane q=xy: axes q=0 and self-orthogonal; diagonal q(1,1)=1, although polar value on itself0. V=0 has one isotropic. | Correct quadratic condition. [r3] [r5] |
| 406: Isotropic reduction map | F2 plane,X=axis: X⊥/X=0, both axes map to0; X=0 gives identity on two axes. | Correct domain and quotient. [r3] [r5] |
| 438: Fibres of the isotropic reduction map | F2 four-space, X a line: total6, quotient has2 isotropics, fibre size3=2^(2−1)+1. Zero X gives fibre1. | Equal. [r3] [r5] |
| 455: Number of maximal isotropic subspaces | n=0,1,2 over F2:1,2,6; products empty,2,2·3. | Equal; excludes all35 Grassmannian planes. [r3] [r5] |
| 473: Intersection dimension generating function | F2,n=2: enumerated polynomial2+3z+z²=(z+1)(z+2). z=−1,0,1 gives0,2,6 on both sides. | Equal. [r3] [r5] |
| 491: Intersection dimension law closed form | p=2,n=2: d=0,1,2 masses1/3,1/2,1/6; d=3 mass0. Formula gives those three values. | Range restriction retained. [r3] [r5] |
| 510: Poonen rains distribution | p=2 weights at0…3:0.20971122,0.41942244,0.27961496,0.07988999; p=3:0.31950229,0.47925343,0.17972004,0.02073693. | Positive; includes factor1/2 at index0. [r3] [r5] |
| 533: Intersection law converges to poonen rains | p=2,n=1 finite masses(1/2,1/2) have L1 distance0.74173267; n=2 gives0.40839934; limit weights sum1.00000000 in truncation. | Finite laws differ from limit; convergence consistent. [r3] [r5] |
| 551: Poonen rains moments | p=2,m=0…3:1,3,15,135; p=3:1,4,40,1120, equal displayed products. Finite p2,n2 first moment2 versus limiting3; p2,n1,m2 gives5/2 on both sides. | Equal, now including n<m; parity-conditioned restriction remains separate. [r3] [r5] |
| 571: Poonen rains parity | p2,n2: even mass(2+1)/6=1/2, odd3/6=1/2. Conditional first moments both2; second moments6 and4 differ since m=n. | m<n restriction essential. [r3] [r5] |
| 589: Delaunay sha p rank law | p2,r0: mass at0=0.41942244=2a0; r1: mass at0=0.83884488=2a1. Odd Sha-ranks have mass0. | Correct rank shift. [r3] [r5] |
| 612: Delaunay compatibility of the selmer model | Half-prior gives a0…a3 as0.20971122,0.41942244,0.27961496,0.07988999. Prior δ0 gives0.41942244 at0, twice a0. | Both directions discriminate wrong prior. [r3] [r5] |
| 632: Count of nondegenerate alternating matrices | F2 sizes0,1,2,3,4: invertible counts1,0,1,0,28; totals1,1,2,8,64. 28/64=(1−1/2)(1−1/8). | Zero diagonal required at2. [r3] [r5] |
| 650: Alternating matrix kernel law | F2 n3 kernel histogram(j0…3)=(0,7,0,1); F3 n3=(0,26,0,1). | Parity and total8/27 verified. [r3] [r5] |
| 675: Alternating kernel law formula | F2 n4 kernel masses j0,2,4 are28/64,35/64,1/64; Gaussian factor [4 2]2=35. | Equal to enumeration. [r3] [r5] |
| 693: Alternating kernel law limit is poonen rains | p2,n0 parity average is(1/2,1/2); n1 average sizes2,3 gives(1/4,7/16,1/4,1/16). Target a0=0.20971122, not2a0. | Parity mixing factor correct. [r3] [r5] |
| 711: Symplectic finite abelian p groups | C2 has no perfect alternating form: its one generator pairs0 with everything. C2² has pairing matrix[[0,1/2],[1/2,0]], order4, Sp-order6. | Square-order condition necessary, not sufficient alone. [r3] [r5] |
| 742: Alternating cokernel law | A=[[0,2],[−2,0]] over Z2: coker=C2². Mod4 reproduces it. Mod2 cannot distinguish it from the zero matrix, whose integral cokernel is infinite; mod4 distinguishes C2² from C4². | e−1 annihilation condition retained. [r3] [r5] |
| 772: Bklpr alternating cokernel limit | p2,G=0: A0=0.41942244; G=C2²: A0=(4/6)·0.41942244=0.27961496. A1(0)=0.83884488. | Automorphisms are symplectic, not all24 permutations. [r3] [r5] |
| 792: Bklpr model | Q(0,0)=0.20971122; Q(1,0)=0.41942244; Q(2,G)=0; sums over G are1/2 for r0,r1. | Correct two-rank mixture. [r3] [r5] |
| 822: Bklpr random isotropic intersection law | n1: two axes. Equal axes give corank1 and T=0; distinct axes give corank0,T=0; four pairs split2/2. n0 instead corank0 with probability1. | n≥1 essential. [r3] [r5] |
| 839: Maximal isotropic direct summands modulo prime powers | n0 count1; n1 count2 for q2,q4; n2,q4 count12=4·(1+1/2)·2. | Not all self-annihilating subgroups. [r3] [r5] |
| 855: Bklpr injection moments | q4,n1,m1: two equal-axis pairs each have2 injections and two distinct pairs0; average1; at n2 enumeration gives12 summands and total288 injections over144 pairs, average2; limiting target4. m0 gives1. | Finite average not mistaken for limit. [r3] [r5] |
| 875: Poonen rains selmer conjecture | p2,d0 predicted0.20971122; first cardinality moment3. Curves with full rational2-torsion have Selmer size≥4, so are not individually distributed by this family law. | Conjecture and family retained. [r3] [r5] |
| 904: Bhargava shankar selmer average conjecture | n1,2,3,4,6: divisor sums1,3,4,7,12. n4 is7, not(2+1)²=9. | Correct composite convention. [r3] [r5] |
| 932: Selmer average conjecture implies rank at most one | n2 boundσ(2)/2²=3/4; n6 bound12/36=1/3; n prime p gives(p+1)/p²→0. | Unbounded N needed; one n is insufficient. [r3] [r5] |
| 948: Bklpr selmer conjecture | Predicted rank0/rank1 masses1/2 each; rank≥2 mass0. Finite Sha classes exhaust predicted mass1, while infinite Sha is not silently a finite class. | Conjecture stays separate from moment statements. [r3] [r5] |
| 975: Bklpr conjecture implies rank and selmer laws | Pair law on r0,r1 gives total1; rank-tail bound1−1/2−1/2=0. Delaunay convolution gives PR first masses above. | No unjustified unbounded moment inference. [r3] [r5] |
| 993: Full two-torsion descent data | Roots−1,0,1: products2,−1,2, none rational squares. Roots0,1,4 give4,−3,12 and fail the no4-isogeny condition. | Separating control for actual curve condition. [r3] [r5] |
| 1009: Swinnerton–Dyer transition and stationary limit | i0 probabilities(1/2,1/2,0); i1(1/8,7/8,0); i2(1/32,19/32,3/8); each sum1. | No negative-index transition mass. [r3] [r5] |
| 1041: Parity-sensitive twist moment determinacy | Even-conditioned PR and odd-conditioned PR have the same displayed cardinality moments, but parity expectations+1 and−1; equal mixture has0. | Parity hypothesis excludes two wrong laws. [r3] [r5] |
| 1058: Two selmer distribution in full two torsion twist families | W:y²=x³−x, b=1 gives Sel2 size4 and reduced d0. b=−1 is the same squareclass twist here. b=0 excluded; signed denominator2N counts±1 atN1, positive denominatorN counts1. | Torsion shift2 and real local condition preserved. [r3] [r5] |
| 1077: Geometric-height Weierstrass family | Constant nonsingular curve has d0; scaling coefficients by u^i multiplies Δ by u^12 and leaves isomorphism class fixed. | Carrier check only; de Jong text unavailable. [r3] [r5] |
| 1093: De Jong weighted denominator | q5 predicted constant(1−5^−9)(1−5^−10)/(1−1/5)≈1.24999923>0; q1 would divide by0 and is excluded. | Limit uncertified without source. [r3] [r5] |
| 1109: De Jong constant-j estimates | d1 count scaleq9 versus total scaleq11; ratioq^−2. d0 would make C1d=0 and is excluded from rank bound. | Growth comparison only; source unavailable. [r3] [r5] |
| 1125: De Jong torsor/surface comparison | Identity Selmer class removed: Selmer size1 gives0 nonidentity torsors; size3 gives2 classes, not3. | Normalization control; source unavailable. [r3] [r5] |
| 1141: De Jong projective-cubic count and geometric sum | d0,a=b=0: cubic section dimension10, #P(V)=(q10−1)/(q−1). Zero polynomial excluded from projectivization. | Counting control; asymptotic unavailable. [r3] [r5] |
| 1158: Function field 3 selmer average bound | Identity contribution1 plus three expected nonidentity contributions gives4; characteristic3 excluded, characteristic2 not excluded by the stated range. | Source unavailable; no certification of bound. [r3] [r5] |
| 1177: P infinity selmer corank distribution in twist families | M=(Qp/Zp)⊕C_p² has corank1, while dim M[p]=3; finite C_p² has corank0. | Correct distinction of corank and finite dimension. [r3] [r5] |
| 1206: Smith twist family hypothesis | E:x³−x has rational2-torsion dimension2 and roots products(−1,2,2); x(x−1)(x−4) has square4 and fails case3. | Discriminating examples. [r3] [r5] |
| 1233: Congruent number curve satisfies smith hypothesis | E[2](Q) has O and three roots, cardinal4; root-difference products−1,2,2 are nonsquares. | Matches case3. [r3] [r5] |
| 1249: Smith selmer rank limit equals corank | M=(Qp/Zp)^2⊕C_(p³): largest free ranks at levels1,2,3,4 are3,3,3,2, stabilizing at corank2. | Finite torsion is eventually removed. [r3] [r5] |
| 1264: Two point corank law forces zero density of high corank | Prob(c≥2)=1−Prob(c0)−Prob(c1); limits1−1/2−1/2=0. | Exact partition. [r3] [r5] |
| 1280: Even congruent twists have corank zero given smith law | Squarefree residues1,2,3 mod8 have total density1/2; on even-parity family excluded positive corank begins at2, whose density is0. | Parity bridges to corank0, not rank conjecture. [r3] [r5] |
| 1299: Selmer ratio of an isogeny | Identity map has kernel/cokernel sizes1/1, ratio1. Complex degree3 isogeny has1/3; reversing kernel and cokernel gives wrong3. | Correct direction. [r3] [r5] |
| 1329: Local selmer ratio via tamagawa numbers | Good reduction, p≠3 gives1·1=1. Complex degree3 gives1/3. Formal multiplier3 over Q3 contributes\|3\|3^−1=3. | Inverse derivative correct. [r3] [r5] |
| 1344: Tamagawa ratio under potentially good reduction | Equal Tamagawa numbers give quotient1; at p≠3 the derivative is a unit and ratio1, while at3 derivative can contribute3. | Residue-characteristic qualification essential. [r3] [r5] |
| 1359: Selmer ratio classes are locally defined | A product of local ratios3,1/3,1 has exponent0; changing first factor to1 gives exponent−1. | Finite local data, not signless exponent. [r3] [r5] |
| 1376: BKLOS average size of three-isogeny Selmer groups | Constant global ratio1 gives irreducible mean1, total Selmer mean2; ratio3 gives total4. | Identity orbit retained; conditional on C. [r3] [r5] |
| 1391: Cassels isogeny selmer ratio formula | With Selmer sizes3 and1, kernel sizes3 and1, formula forces c=1; removing torsion factor would force3. | Correct torsion correction. [r3] [r5] |
| 1406: Isogeny factorisation selmer exact sequence | For φ1=id, first kernel quotient0 and Selψ=Selφ2; φ2=id gives Selψ=Selφ1. | Maps have proper source and target. [r3] [r5] |
| 1421: Three isogeny selmer parity | Sel3 dimension2 with rational3-torsion dimension1 gives reduced parity1; raw dimension parity0 differs. | Subtraction essential. [r3] [r5] |
| 1471: Reduced p selmer rank bounds the corank | Sel_p dimension3, rational p-torsion dimension1 leaves bound2; corank2 attains it. Equal dimensions1−1 yield0. | Torsion subtraction correct. [r3] [r5] |
| 1486: Three selmer rank zero in selmer ratio one twists | Nonnegative even reduced rank with mean≤1 gives P(rank≥2)≤1/2 and P(rank0)≥1/2. | Correct lower-density bound. [r3] [r5] |
| 1501: Three selmer rank one in odd selmer ratio twists | Odd rank with mean≤4/3 gives P(rank≥3)≤(4/3−1)/2=1/6; rank1≥5/6. | Correct5/6, not2/3. [r3] [r5] |
| 1515: Positive proportions of three selmer ranks in local subfamilies | Strata masses1/2 and1/2 inside full family give rank0≥1/4 and rank1≥5/12. | Denominator weighting correct. [r3] [r5] |
| 1533: Cm curves have a twist with good reduction | O_K units order2,4,6 for generic,j1728,j0; a unit character of order3 cannot be killed by a quadratic character of order2. | Larger twist groups retained. [r3] [r5] |
| 1548: Cm three isogeny has selmer ratio one | F=K: finite3-part3 and complex factor1/3 give1; [F:K]=2 gives9·1/9=1. | General base-degree cancellation works. [r3] [r5] |
| 1563: Cm twists have corank zero at least half | K=Q(√−3), F=K(√2): finite factor9 and two complex factors1/9 give1, hence the same conditional half-bound. | General F is now retained; previous R03 repaired. [r3] [r5] |
| 1583: Lc quadratic | F2²,q=xy/2: polar matrix[[0,1/2],[1/2,0]] induces bijection of four-element groups. q=0 on same V has adjoint image size1, not4. | Stored topological equivalence excludes trivial model. [r3] [r5] |
| 1603: Weak metabolic | F2 hyperbolic axis: size2=orthogonal size2,q0. Diagonal has q(1,1)=1/2. Zero subgroup orthogonal has size4. | Correct three conditions. [r3] [r5] |
| 1626: Maximal isotropics | Finite hyperbolic plane has2; zero group has1; real hyperbolic x-axis equals its annihilator but is not compact-open. | Carrier is not just weakly metabolic subgroups. [r3] [r5] |
| 1648: Joint parity weight | Two marginals(1/2,1/2) give(1/2,0,0,1/2), total1; empty product mass1. Both δ0 marginals instead give total2. | Half-parity hypotheses essential. [r3] [r5] |
| 1672: Locally compact character and annihilator duality | C4 generator evaluation χ_k↦k/4; dual and bidual each have4 elements. Character on2C4 with value1/2 extends with value1/4 at1. | Evaluation is now imported from VNA; the extension target permits unbounded exponent. [r3] [r5] |
| 1689: Restricted product character duality | One factor C2 with reference0 gives dualC2, cardinal2; empty product has1 character. Infinite nontrivial restrictions on compact ∏C2 fail finite-support continuity. | Correct dual reference subgroup. [r3] [r5] |
| 1708: Lc finite reductions | Finite hyperbolic plane,X0: quotient size4 and2 isotropics; X=axis quotient size1 and1 isotropic. | Identity and maximal reduction consistent. [r3] [r5] |
| 1724: Lc canonical measure | Dyadic hyperbolic plane has masses1/2,1/2. q=(x²−y²)/4 on C2² has only diagonal isotropic: mass1; p q(e1)=1/2≠0 excludes it. | Value-group hypothesis necessary. [r3] [r5] |
| 1740: Lc random intersection | Finite n1 intersection dimensions0,1 each1/2, versus infinite model a0=0.20971122,a1=0.41942244. | Finite/infinite clauses necessary. [r3] [r5] |
| 1756: Lc restricted product | Two hyperbolic factors: q((1,1),(1,0))=1/2+0=1/2; a point supported wholly in references has q0. | Finite sum and zero references agree. [r3] [r5] |
| 1774: Finite-flat local topology and duality | L=F_p((t)), N=α_p: H1=L/L^p has nonzero class t; étale geometric α_p-points have cardinal1 and would lose it. | fppf required at characteristic p. [r3] [r5] |
| 1790: Integral flat reference and Kummer annihilators | α_p over F_p[[t]]: integral class t survives in L/L^p; class t^−1 is not integral. Reference is proper, not entire H1. | Integral/generic distinction retained. [r3] [r5] |
| 1806: Finite-flat global Poitou–Tate | N=0 gives every H1 term0 and annihilator0; α_p retains the nonzero t class over F_p(t), unlike geometric-point cohomology0. | Correct coefficient category; full duality not finite-example proof. [r3] [r5] |
| 1825: Sha one vanishing | Constant C2 and trivial module: locally trivial characters have kernel0 by splitting at all Frobenii; S3 acting on F2² has Sylow2 order2 cyclic. | Criterion includes nonabelian automorphism group. [r3] [r5] |
| 1839: Selmer quadratic intersection | Cup invariant1/3 has negative2/3; at2 −1/2=1/2. Identity isogeny gives zero Selmer, zero Sha1 and intersection0. | Sign detectable at3, not only2. [r3] [r5] |
| 1859: Global coefficient-model families | Over Q, height(1/2)=2; coefficients(0,0) have Δ0 and are excluded. In char2, short equation alone misses general models. | Height and nonsingularity controls. [r3] [r5] |
| 1879: Joint parity moments | Primes2,3: first moment(2+1)(3+1)=12=σ(6); second15·40=600. Empty product gives1. | Parity does not change these moments. [r3] [r5] |
| 1893: Squarefree selmer conjecture | n6 ranks(0,1) have mass0, ranks(0,0) mass2a_2(0)a_3(0)≈0.134006; n1 separately singleton mass1. | Conjecture normalized, including excluded n1 boundary. [r3] [r5] |
| 1917: Odd degree jacobian conjecture | g1 odd-degree model has degree3 and predicted mean3 atp2; even-degree,odd n3 predicts mean4; genus0 excluded. | Family conditions retained. [r3] [r5] |
| 1941: Even genus two selmer conjecture | g2,degree6: X=1+X_PR gives moments1,6,60,1080 versus unshifted1,3,15,135; g1 excluded. | Shift and even genus discriminate. [r3] [r5] |
| 1967: General Oesterlé measure | Spec Z2 mass1; A1 mass1, point ambient mass0. Spec Z2[T]/T²: integral reduction image size1; all mod2^e solutions size2^floor(e/2). | Reduction images crucial. [r3] [r5] |
| 1983: Alternating rank-stratum measure and pushforward | n2,r2 intrinsic point mass1 vs ambient mass0; n2,r0 dimension1; determinant integral p2,s1 is(1/2)/(7/8)=4/7. | Squared determinant exponent verified. [r3] [r5] |
| 2000: Smooth cylinder measure | P1/Z2 total3/2; level2 has6 points, each probability1/6. Two copies total3, components probability1/2. | Haar mass and normalized probability distinguished. [r3] [r5] |
| 2016: Ogr smooth projective | n0 point dimension0; n1 two points dimension0; n2,F2 count6 versus Gr count35; chart alternating2×2 has one free coordinate. | Includes characteristic2. [r3] [r5] |
| 2032: Ogr components | n1 axes intersect in dimension0≠1 mod2, hence opposite; equal axes intersect dimension1, hence same. n0 has one even point, no odd point. | Boundary fixed. [r3] [r5] |
| 2046: Ogr prime power count | p2,n2,e1…4 counts6,12,24,48; successive fibres2=p^(n(n−1)/2). n0 always1. | Equal. [r3] [r5] |
| 2063: Ogr schubert dimension | n2,r2 dimension0, point; n2,r0 dimension1; n1,r0 one point, not both OGr1 points. | Parity-selected resolution required. [r3] [r5] |
| 2083: All rank delaunay | p2,r0,G0 mass0.41942244; r1,G0 mass0.83884488. C2 alone has no symplectic structure and contributes0. | Intrinsic rank law, not ambient conditioning. [r3] [r5] |
| 2097: Positive rank all primes | r1,p2 nontrivial probability0.16115512 versus leading2^−3=0.125; exponent−3 gives convergent prime sum. | Correct summable order. [r3] [r5] |
| 2111: Rank zero all primes infinite | p2 nontrivial probability0.58057756≥1/2; at general p product≤1−1/p so nontrivial probability≥1/p. | Divergence excludes finite all-prime law. [r3] [r5] |
| 2125: Symplectic harmonic weights | N1,2,3,4 masses1,2/3,3/8,16/45; each between1/N and2/N. At L=N interval still has positive mass while log(N/L)=0. | +1 in bound necessary. [r3] [r5] |
| 2139: Sparse prime weighted limit | P empty,f1: both normalized averages1 and c_P sum1; f0 both0. P={2},f supported at0 yields predicted0.41942244. | Correct normalization; unbounded f needs L1. [r3] [r5] |
| 2155: Injection moment conjecture | q4: Inj(C4,C4)=2 but Inj(C4,C2²)=0 despite both orders4. m0 target1; m1 limiting target4. | Not a cardinality polynomial for e>1. [r3] [r5] |
| 2196: Kummer direct summand | n1: A(k)/A(k)=0,H1(A[1])=0, complement0. In characteristicp, α_p torsion must use fppf to retain class t. | Algebraic splitting, not continuity assertion. [r3] [r5] |
| 2213: Adelic kummer direct summand | Finite two-place model (C2⊕C2)²: Kummer productC2² and complementary direct sumC2² have trivial intersection, orders4·4=16. | Correct product/direct-sum roles. [r3] [r5] |
| 2230: Global image splitting conjecture | n1 global image0 in0 splits; a thin trivial-torsion-action family alone has no computed density1. | Remains a conjecture. [r3] [r5] |
| 2254: Trivial action global splitting | n2, full rational E[2] gives μ2²; scalar Kummer point1 is trivial in each quotient, nonsquare2 is detected atQ2. | All-divisor injection mechanism distinguishes local failure. [r3] [r5] |
| 2276: Abelian three-isogeny average | Degree3 complex local kernel3,cokernel1 gives1/3 regardless of dimension. Global ratio1 gives mean2, not1. | C uses actual abelian Kummer images. [r3] [r5] |
| 2290: Endomorphism rank bound | Z² with ψ=diag(1,3): quotient order3, rank2, log3 index1; bound requires c≤1/2. ψ=[3] gives index9, log3=rank2. | Uniform comparison is explicit, not inferred from degree. [r3] [r5] |
| 2304: Multiplication three rank bound | Z²⊕C3 modulo3 has order27≥9=3²; torsion increases quotient, never reduces bound. | c=1 valid. [r3] [r5] |
| 2319: Finite extension rank bound | A[3] over splitting field has order3^(2g), a full flag has2g degree3 factors; g1 gives2 factors and total degree9. | Height remains over the new field. [r3] [r5] |
| 2333: Elliptic explicit twist rank | m0,1,2 give\|m\|+3^−\|m\|=1,4/3,19/9; m=−1 also4/3. | Absolute exponent required. [r3] [r5] |
| 2347: Attainable local three-isogeny ratios | p≠3 requested value1; overQ3 interval[1,3] permits1,3; over degree2 extension interval[1,9]. | Does not assert every twist attains1. [r3] [r5] |
| 2363: Universal-twist local table | k1:t=26244,t+27=26271. Atx0 RHS16·26271=420336; (4√26271)²=420336, whereas(2√26271)²=105084. | Corrected kernel coordinate; k≥1 retained. [r3] [r5] |
| 2381: Signature positive twists | Totally real r2=0 permits m0; imaginary quadratic r2=1 permits local exponent offsets giving rank0 or1; degree4 totally imaginary falls outside those conclusions. | Signature conditions substantive. [r3] [r5] |
| 2398: Complex place obstruction | r2=0 bound0; r2=2 bound2. Exceptional torsion correction−2 is offset by two extra powers: (r2+2)−2=r2. | Uniform twist claim retains exceptional case. [r3] [r5] |
| 2447: CM Hecke character | Principal idele2 over F=K: finite scalar2 times infinite factor1/2 givesψ=1; omitting infinity gives2. | Normalization and principal triviality agree. [r3] [r5] |
| 2463: CM local unit character | Trivial inertia character gives inverse twist1; characterζ3 has inverseζ3², product1, while a quadratic sign cannot cancelζ3. | All roots-of-unity units retained. [r3] [r5] |
| 23: Quartic conventions | x4−y4: I=−12,J0,27Δ=−6912=4I³, Δ=−256. E(A,B)=(−1,0): H_E4,H_IJ27,27H_E=4H_IJ=108. | Sign and height factor verified. [r3] [r5] |
| 2418: Supporting quadratic comparisons | F2 split plane has two isotropics and masses1/2; quarter-valued dyadic plane has one and mass1. For q4,n1,m1 injection average1, limit4. | Synopsis agrees with the distinct finite, limiting and value-group clauses. [r3] [r5] |
| 19: Exclusions and total-function boundaries | A field has 0≠1, so the zero ring is outside finite-field signatures; q1 is not a prime power>1. At n0 the OGr carrier has1 element and mass1. S3 has commutator of (12),(23) a nonidentity3-cycle, so cannot instantiate AddCommGroup. | These hypotheses exclude the wrong carriers; no 0/0 used as a probability. [r3] [r5] |
| 473/855: Independent residue-field and prime-power checks | F3 dimension4 has8 maximal isotropics, intersection-cardinality histogram{1:3,3:4,9:1}; polynomial3+4z+z²=(z+1)(z+3). Over Z/4 rank4 there are12 summands and288 injections into pairwise intersections over144 pairs, mean2. | Independently enumerated; field3 and residue characteristic2 are not conflated. [r3] [r5] |

## Not verifiable

- **AnalyticNumberTheoryPartI §0.34**, the Landau–Siegel exclusion behind the Kane estimates: unchanged from [r5]. Its sources (a 2026 manuscript, Green's note, Tao's sketch, preprints by Banks and Kerr) were not peer-reviewed when checked. The diff does not touch this dependency.
- **Kane, published numbering**: *Algebra & Number Theory* 7 (2013) has no openly readable full text. The locators were checked against arXiv v4, the version the README cites.
- **Carried from [r3]**: DeJong, CM90, vanKampen, Silverman, Cassels1965, Oesterlé and Schaefer1996, as recorded there. No changed passage cites them.
- **SieveMethodsAndPrimePatterns' own sources** (KED-chap-largesieve, KED-ANT-16) were not opened. Only the statements at its head were compared with this target; its proofs are for its own review.

## Source issues

- **Gap** in Montgomery1978 at §7, Theorem 3 and the step before it, printed pp. 558–559: the source takes the diagonal majorant value to be `b̂(0)` and states Theorem 3 for any spacing `δ`, but `b̂(±1)` survives when `δ>1`; it should assume `0<δ≤1` (two or more points force `δ≤1/2`); affects a stated result (Theorem 3 for one point with `δ>1` contradicts the bound `A≥N` on p. 548).

[r5]: packages/ArithmeticStatisticsPartVII/reports/PRREVIEW-ArithmeticStatisticsPartVII~5.md
[r4]: packages/ArithmeticStatisticsPartVII/reports/PRREVIEW-ArithmeticStatisticsPartVII~4.md
[r3]: packages/ArithmeticStatisticsPartVII/reports/PRREVIEW-ArithmeticStatisticsPartVII~3.md
