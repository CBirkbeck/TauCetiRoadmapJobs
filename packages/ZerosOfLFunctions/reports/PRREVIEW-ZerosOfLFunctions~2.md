# Review of ZerosOfLFunctions (pull request #253 at 787d1de)

**Verdict:** needs changes

## R01 (P1) — The exact supplier contracts still use a different Tau Ceti pin

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:193`, “Exact declarations of the Tau Ceti pin”, followed by lines 206–232.

**Claim:** The build's Tau Ceti supplies the listed logarithmic-integral, arithmetic-Dirichlet-series, ray-class, Artin-symbol and Chebotarev APIs.

**Witness:** At manifest revision `e8af08d0`, the named LogIntegral, ArithmeticDirichletSeries, Global/RayClass and Chebotarev modules do not exist. Searches for `logIntegral`, `truncatedPerron_LSeries`, `RayClassGroup` and `frobeniusPrimeSet` find no declarations.

Re-raised: H03 in `packages/ZerosOfLFunctions/reports/GATE-ZerosOfLFunctions~2.md` (previous review R03). Its response acknowledges absence at the branch pin but substitutes main's newer pin. This review explicitly uses the branch manifest, so that reason does not resolve the finding. `Suggested.lean:35` correctly says the ray-class and Frobenius carriers are absent, contradicting the README.

**Repair:** Keep the branch pin and cite the actual roadmap owners: `Completed/ArithmeticDirichletSeries/README.md` Layers 2, 6 and 10; `Completed/GlobalNumberFields/README.md` Layer 2; `Completed/NumberFieldArithmetic`; and `Completed/Chebotarev`. Give their exact target names and distinguish roadmap contracts from pinned implementations. Keep the existing contour declarations under Tau Ceti. The all-ideal/prime coefficient witness then still gives `1/3` versus `1/2`, while every consumed object has a real owner. No pin edit is needed. The LFunctions average-growth part of the old finding is repaired.

## R02 (P1) — Completed zeta does not have polynomial growth on a right half-plane

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:381`, “On the right half-plane `Re s ≥ 2` … the predicate holds there with `A = 0`”; also lines 385–387.

**Claim:** Boundedness of the uncompleted Dirichlet series implies polynomial growth of its completion throughout the half-plane.

**Witness:** At fixed height `s=2m+2i`, `‖Λζ(s)‖ ∼ π⁻ᵐ(m−1)!`, beating every polynomial. For `m=10,20`, the norms are approximately `3.67680,13519751.81`; thus even the permitted height `|t|=2` fails.

**Repair:** State the completed bound on each fixed vertical line, or on each compact real-part interval `[1+δ,b]`, with constants depending on `b`. Keep the half-plane bound only for the uncompleted series. Add both the positive-real-axis example and the fixed-height `t=2` example as negative controls. On `σ ∈ [2,b]`, the displayed exponential decay absorbs the bounded range of powers and gives a height bound with `A=0`; on `σ→∞` it does not. DLMF equation 5.11.9 explicitly requires bounded real parts (`dlmf line 524`).

## R03 (P1) — The finite-order proof uses finite order before establishing it

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:676`, “satisfies `OrderLE _ 1`”, with the route ending “and 3.1 between them” at line 680.

**Claim:** The right-half-plane Mellin representation and the functional equation, followed by §3.1, establish order one. But §3.1 assumes finite order on the strip, and §3.3 asserts that the pole-cleared function has finite order without supplying this input.

**Witness:** On `0≤Re s≤1`, `g(s)=exp(sin(πs))` has both edge norms `1`, but `log ‖g(1/2+it)‖=cosh(πt)`. Edge bounds cannot replace §3.1's growth hypothesis.

The cited `LFunctions/Suggested.lean:1680` only supplies an existential Mellin representation on `Re s>1`; its signature contains no decay or strip-growth bound. This is a missing proof input, not a counterexample to the classical family theorem.

**Repair:** Make finite order an explicit hypothesis of the generic convexity statements. Independently prove the families' growth using their continued, split Mellin integrals, before invoking §3.1. Name the actual supplied kernels and exponential-decay inputs: LFunctions Layer 3's `mellinKernel_sub_const_isBigO`, and Layer 6's `heckeMellinTotal`, inversion law and exponential decay. State the intervening estimate, for example `‖Λ₀(s)‖ ≤ exp(C(1+‖s‖) log(2+‖s‖))`, derived from tails bounded by `C₀ exp(−c t^α)` with `c,α>0`. It implies `OrderLE _ 1` and excludes the witness, whose logarithmic growth is exponential in `|t|`. Move the Layer 0 strip-growth consequence after its gamma and finite-order inputs; its present forward dependency on Layer 1.5 should not remain a purported foundation.

## R04 (P2) — Exclude the zero clearing polynomial

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:634`, “a polynomial `P` whose roots dominate those poles”; the order identity is at lines 640–641.

**Claim:** The pole-cleared function has order `ord(continuedL)+rootMultiplicity P` for every such polynomial.

**Witness:** Take the primitive character modulo 4, whose L-function is entire, and `P=0`. The pole condition is empty. At `s=2`, the product has order `⊤`, but the proposed right side is `0+0=0`.

**Repair:** Require `P ≠ 0` in the definition's intended signature and every API theorem. This also makes extension from the complement of the polynomial's zeros determine a unique function. At the same character with `P=1`, both orders at `2` are `0`; with `P=X−2`, both are `1`. The zero-polynomial control must be rejected. The junk values were verified at the pin: `Polynomial.rootMultiplicity_zero` is `0`, whereas `meromorphicOrderAt` of the zero function is `⊤`; both computations elaborate in the scratch probe.

## R05 (P3) — The reciprocal-gamma Checks need a subsequence away from its zeros

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:315`, “along the negative reals … grows like `exp(x log x)`”; the same assertion for `Gammaℝ` occurs at lines 502–504.

**Claim:** These are asymptotics along the whole negative real ray.

**Witness:** `1/Γ(−n)=0` for every natural `n`; `(Gammaℝ(−2n))⁻¹=0`. These values cannot be asymptotic to the strictly positive expressions displayed in the Checks.

**Repair:** Use `x=n+1/2` for ordinary gamma and `x=2n+1` for `Gammaℝ`, and assert the logarithmic asymptotic on those subsequences. Reflection gives `|1/Γ(−n−1/2)|=Γ(n+3/2)/π`, with logarithm `n log n+O(n)`. For `Gammaℝ`, the corresponding value is `π^(−n−3/2)Γ(n+3/2)`. These prove the intended failure of exponential type; retain the intervening zeros as a separate control. The order-one conclusions themselves are not refuted.

## R06 (P3) — A shift of an argument lift does not change its variation

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:1130`, “started at the argument `2π` … shifts every value of `S` by `2`”.

**Claim:** Changing the initial lift changes `S`, although line 1116 defines `S` using argument variation.

**Witness:** If the endpoint arguments are `a,b`, the shifted lift gives `(b+2π)−(a+2π)=b−a`. For the constant positive path, both variations are `0`, not `0` and `2π`.

**Repair:** Keep the variation definition and replace the Check by its invariance under adding `2π`. Explain that the normalized endpoint value equals the variation only when the initial value is `0`. Alternatively define `S` by that endpoint value and consistently describe the normalization. The small-height calculation `S(T)→−1` survives either consistent formulation.

## R07 (P3) — Finish the exact locators and per-definition API/Checks

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:351`, “Define finite order”; sampled §§1.5, 3.3, 5.3–5.4, 6.5 and 7.6 also need precise attribution.

**Claim:** Every definition has its API and three discriminating Checks, and every theorem has an exact source or supplier locator.

**Witness:** `IsFiniteOrder` has three examples but no API. §1.5 has no DLMF equation locator. §6.5 cites a theorem whose actual signature requires `χ.character ≠ 1`, while its claim includes the trivial character.

**Repair:** Add the finite-order closure/transport API and discriminating examples for the separate exceptional-sum definitions in §8.7. Attach locators to the individual claims, distinguishing a source theorem from an adapter proved here: DLMF 5.11.1/2/9 for gamma, the named pinned Jensen/product/logarithm declarations for the analytic adapters, and Titchmarsh 9.4, printed p. 214, for the zeta density corollary. In §6.5 consume LFunctions `meromorphicOrderAt_dedekindZetaC_one_add` for `t≠0` and its exact pole order at `1`, in addition to the nontrivial-character theorem. At the trivial character and `s=1`, the order is `−1`, so the positive-zero implication is true although the cited nontrivial-character theorem is inapplicable. Correct dangling internal references such as “4.11” at line 169 and “4.7” at line 670 to §§4.6 and 4.4. Do not add API padding to `Suggested.lean`.

## Verified sound

This is a full review of the 1,533-line README and 222-line Lean file, including unchanged passages. There are **7 findings: 3 P1, 1 P2 and 3 P3; 4 blocking**. No scope rejection is warranted: the order-one, rectangle and L-function zero theory is a distinct library development. No computational algorithm, copied source passage, sorry-defined data, `set_option`, extra import, or change outside this roadmap folder was found.

The reviewed head is `787d1de143c73308a84e5e4401082ef55038c450`. Mathlib is `05ae0103f49b1ad1248f6039bbbad43d8aeb52a9`; Tau Ceti is `e8af08d0aeda4012832880bd56edfc88af061691`; the content main used for suppliers is `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. Each was checked from the actual checkout. I read the repository writing checklist and CONTRIBUTING, and compared the shape with `Completed/ContourIntegration/README.md` and `Completed/ArithmeticDirichletSeries/README.md`.

The worker's gate at this head passes **every counter, including the targeted build**. Independently, the requested `lake env lean` elaboration succeeds with exactly eleven `sorry` warnings and no other diagnostics. The independent dependency command, using the supplied order, `--movable` and content main, prints:

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line and supplier section was read. LFunctions and ClassFieldTheory are admissible suppliers; no later roadmap is imported, and no notion was moved down. The mechanical result does not validate the nonexistent pinned APIs in R01 or the internal growth bootstrap in R03.

There are **14 actual Lean declarations: three definitions and eleven theorems**. The supplied signature index's fifteenth entry, `of`, comes from prose in the module docstring; it is not a declaration. I generated and elaborated a fresh `#check @name` for all fourteen, and compared every type with the README. No section binder disappeared; all substantive hypotheses are explicit. The Weil integral closes before the prime sum, `ContDiff ℝ ∞` denotes smoothness rather than analyticity, modulus zero is excluded, and the uniform constants occur before the parameters they must bound. No reviewed file changed.

All eleven sorried theorems were tried on a scratch copy with the individual tactics `simp`, `rfl`, `infer_instance` and `assumption`, each required to close the goal before the next alternative was attempted. All eleven reached the diagnostic fallback. Pin searches by objects and theorem forms found no single-library-lemma `exact` proof for a retained headline. Thus there is no padding finding. The probe itself emits trace-linter warnings; these are probe instrumentation, not diagnostics from the reviewed file. Separate proved probes establish the zero polynomial, zero meromorphic function and reciprocal `Gammaℝ(−2)` values used above. For R02, the fixed-height gamma norm was computed from `|Γ(m+i)|²=(π/sinh π)∏_{k=1}^{m−1}(k²+1)`; the zeta sum through 100 has tail bounded by `100^(1−2m)/(2m−1)`, below `6·10^−40` for both displayed inputs.

### Previous findings, checked before the full pass

Each quoted repair passage is from this head; old IDs refer to the previous review.

| Old finding | Current passage and verdict |
|---|---|
| R01 rectangle sum | §7.2: “collapse the right side to `∑_{s ∈ S ∩ R} ord_s f`.” **Repaired**: outside zero contributes `0`, inside simple zero `1`. |
| R02 ray-class coefficient | §8.7: “The main coefficient of the prime count is therefore `1/#Cl_𝔪`”. **Repaired**: modulo 3 gives `1/2`, all-ideal residue coefficient remains `1/3`. |
| R03 supplier drift | Line 193: “Exact declarations of the Tau Ceti pin”. **Partly repaired**: average-growth field fiction is gone; wrong-pin claims remain, R01 above. The repair report's two-pin explanation was read and tested. |
| R04 upward dependency | Supplier remains LFunctions; fresh depcheck has `0 problem(s)`. **Repaired by order change**, not by deleting a legitimate supplier. |
| R05 pole height | Line 366: “strictly larger than” the maximum pole height. **Repaired**: `H=5`, `T₀=6` has margin 1; `T₀=5` fails. |
| R06 trivial character | §6.4d: “For a nontrivial primitive `χ`”; trivial estimate retains `1/(σ−1)`. **Repaired**: both trivial sides have leading `1/u`. |
| R07 contour duplication | §7.2 names `argumentPrinciple_nullHomologous`; §7.3 names the lift and winding bridge; §1.6 cites reciprocal-gamma entirety. **Repaired**: only geometry/localization and product adapters remain here. |
| R08 missing headlines | Lean lines 90 and 186 now state `hadamard_of_orderLE_one` and `riemannZeta_weilExplicitFormula`. **Repaired**, including summability and the smooth test class. |
| R09 false Checks | §1.1 says `S₀` is “still simply connected”; §8.4 says “fails by exactly `P`”; the exceptional region and infinite-support wording are corrected. **Repaired** for the four old defects; R05–R06 above concern different Checks. |
| R10 source misreporting | References now give Trudgian's theorem shapes with “primitive nonprincipal”; §7.4 derives boundary heights without claiming Titchmarsh omitted them. **Repaired**: the opened sources agree. |
| R11 shape and Checks | Opening `**Summary.**`, level-two layers, Needs, Examples and Dependencies are present. **Partly repaired**: substantial structural repair, remaining exact locator/API issues in R07. |

### Headline inventory

The README promises strip convexity; general order-one Hadamard and its L-function corollaries; Dedekind/Hecke zero-free regions with a real simple exceptional-zero alternative; conductor-uniform Riemann–von Mangoldt; truncated and smooth explicit formulas; effective prime-ideal, ray-class and abelian Frobenius counts; and the certificate/GRH interfaces.

The eleven acceptance statements cover primitive Dirichlet convexity, general and zeta Hadamard, zeta and Dirichlet zero-free regions, zeta and primitive Dirichlet counting, truncated zeta and smooth zeta explicit formulas, general number-field prime-ideal counting and rational progressions. The docstring explicitly names the absent full-plane Dedekind/Hecke continuations and the absent ray-class/Frobenius carriers at these pins. The certificate statements are supporting semantic interfaces, correctly left in the README. No additional statable headline was found missing. The general Hadamard test uses native analytic/divisor carriers and a real growth predicate, not an empty assumption containing its conclusion.

### Computed adversarial pass

A row records actual values or an explicit limiting expression, not a proof of the general result. “Agrees” means the tested instances agree. Inequalities are compared with their bound, and asymptotics with their leading expression or normalized error. The asterisk marks a seeded target. API clauses with different behavior have separate rows; conventions and the eleven Lean headlines are included. The 164 rows span every layer, with extra rows for the claims touched by findings.

| Statement | Instances | Values computed on each side / competing models | Result; change |
|---|---|---|---|
| Normalization | Weight 12 newform | Arithmetic center `6`; analytic `1/2`; `1/2+11/2=6` | Agrees; retain +shift |
| Germ versus value | Constant 1 with value 0 at one point | Germ order `0`, divisor `0`; point value `0` and discontinuity | Agrees; pointwise analyticity essential |
| Signed versus positive count | `z/(z−1)` on disc radius 2 | Signed `1−1=0`; positive `1+0=1` | Agrees |
| Infinite sums | `sin πz`, all integer zeros | Infinite positive support; finsum `0`; bounded disc contains finitely many integers | Agrees; global zero formula must use summability |
| Rectangle validity | Reversed heights; collapsed width | Empty set count `0`; collapsed interior empty, off-curve winding `0` | Agrees |
| Counting endpoints | Simple zero at height `h>0` | Count below `h`: `0`; at `h`: `1`; symmetric count includes its lower partner | Agrees |
| Smoothness convention | Compactly supported analytic versus smooth bump | Analytic class has only `φ=0`; smooth bump can have `φ(1)=1` | Agrees with pinned smoothness type |
| OrderLE definition | `exp z`, `exp(z²)` | Log norms on positive radius `r`, `r²`; against `r^1.5`, first ratio→0, second→∞ | Distinguishes order 1 and 2 |
| Order monotonicity | `exp z`, exponents 1 and 2 | `r/r^1.5→0` and `r/r^2.5→0` | Agrees |
| Order under addition | `exp z + (−exp z)` | Sum `0`, norm `0`; each summand order ≤1 | Agrees |
| Order under product | `exp z · exp z` | Log norm `2r`; `2r/r^(1+ε)→0` | Agrees |
| Polynomial order | `1−z`, `z²` | Log growth `log r+O(1)`, `2log r`; divided by `r^ε`→0 | Agrees |
| Exponential order | `exp(cz)`, `c=0,2` | Log maximal norms `0,2r` | Agrees |
| Negative-order Liouville | Constant 1, `A=−1` | Norm `1`; comparison `exp(r^−1/2)→1`; nonconstant `z` has ratio→∞ | Agrees |
| Reciprocal-gamma Check | Negative integers versus half-integers | `1/Γ(−n)=0`; `|1/Γ(−n−1/2)|=Γ(n+3/2)/π` | R05: choose subsequence |
| Entire completion construction | Zeta at 0 and 1 | Extended values `1,1`; raw products `0,0` | Agrees |
| Completion order law | Zeta at 0 and 1 | `−1+1=0`, extension nonzero | Agrees |
| Completion symmetry | `s=0,1` | Both values `1`; `s(s−1)` preserved by `s↦1−s` | Agrees |
| Shifted completion | Shift parameter `H=5` | Clearing roots `±5i,1±5i`; pole plus clearing order `−1+1=0` at each | Agrees |
| Finite-order definition | `exp z`, `exp(z²)`, `exp(exp z)` | Orders 1,2 finite; last log-log growth `r`, exceeding `A log r` | Agrees; API needed R07 |
| Vertical strip threshold | Shifted poles at heights ±5 | At `T₀=5`, norm unbounded near `1+5i`; at 6 distance ≥1 | Agrees with repaired margin |
| Family strip threshold | Zeta, poles at heights 0 | `T₀=2` has distance ≥2 in height | Agrees |
| Completed half-plane growth | Zeta at `2m` and `2m+2i` | Real-axis norm `π^−m(m−1)!ζ(2m)`; at height2 norms for m=10,20 are `3.67680,13519751.81`, against a constant height bound | R02 |
| Uncompleted right bound | Zeta, `σ≥2` | Absolute series ≤`ζ(2)=π²/6`; completion unbounded as above | Keep series half-plane bound only |
| Log-gamma sector | `δ=0,π/2,π` | Log-images: strip width `2π`, width `π`, empty; 2 lies in first two | Agrees |
| Log-gamma normalization | `s=2,3` | Branch values `0,log 2`; shifted branch adds `2πi` | Agrees |
| Log-gamma nesting | `δ<δ'`, `s=3` | Both normalized branches `log 2`, difference `0` | Agrees |
| Principal-log rejection | `s=it`, large t | Continuous phase `t log t−t−π/4+o(1)`; principal phase jumps `2π` | Agrees |
| Sector Stirling | Positive real `r` | Remainder after main terms `1/(12r)+O(r^−3)` | Agrees with O(1/r) |
| Vertical gamma | `σ=1/2` | Exact squared norm `π/cosh πt`; log norm `−π|t|/2+log(2π)/2+o(1)` | Agrees |
| Digamma asymptotic | Positive real `r` | `ψ(r)−log r=−1/(2r)+O(r^−2)` | Agrees |
| Gamma log-derivatives | `s=1` for Gammaℂ | `−γ_E−log(2π)`; wrong normalization differs by `log 2` | Agrees |
| 1.5* record gamma growth | One real factor shift 0 | Degree 1, rate `−π|t|/4`, logarithmic coefficient `(σ−1)/2` | Agrees |
| 1.5* complex/paired factors | Real shifts 0,1 versus one complex shift 0 | Degree 2, rate `−π|t|/2`, coefficient `σ−1/2` on both sides | Agrees |
| 1.5* gamma divisor | Same paired shifts | Each nonpositive integer has order `−1`; at 1 order `0` | Agrees |
| Reciprocal gamma extension | Zeta record at 0,−2 | Inverse values `0,0`, orders `+1,+1`; gamma orders `−1,−1` | Agrees |
| Reciprocal product off poles | Gammaℂ at 1 | Gamma value `1/π`, reciprocal `π`, product `1` | Agrees |
| Degree-zero reciprocal | Empty shift multisets | Empty product `1`, divisor `0` | Agrees |
| Reciprocal order Check | Gammaℝ at `−2n` and `−(2n+1)` | `0` on first sequence; `π^(−n−3/2)Γ(n+3/2)` on second | R05 |
| Continued L extension | Zeta at 0 | Analytic extension `−1/2`; raw quotient `0/0=0` | Agrees |
| Continued L order | Zeta at −2 | `ord Λ=0`, `ord γ=−1`, `ord L=1` | Agrees |
| Continued L agreement | Zeta at 2 | `L=π²/6`; `Λ/Γℝ=(π/6)/(1/π)=π²/6` | Agrees |
| Functional equation polar exclusions | `F=1/((s−2)(s+1))` with assigned pole values 1,0 | At `s=2`, two point values `1,0`; germs reflect correctly | Agrees; keep both polar exclusions |
| Functional equation dual | Quartic χ modulo 5 | At prime 2, `χ(2)=i`, inverse value `−i` | Agrees; same-character reflection unjustified |
| Conductor definition | Zeta at `s=1/2` | `1·(1/2+3)=7/2`; empty degree-zero product gives N | Agrees |
| Conductor lower bound | N=1, degree 0; degree 1 at s=0 | Values `1,3`, both ≥1 | Agrees |
| Conductor comparison | Zeta, `σ∈[0,1]` | `|t|+3 ≤ |σ+it|+3 ≤ |t|+4 ≤ (4/3)(|t|+3)` | Agrees |
| Conductor nonmonotonicity | Shift i; t=0,−1 | Factors `4,3` while |t| grows `0→1` | Agrees |
| Translation | Weight 0; weight 12 | Shift `0`; shift `11/2`, analytic center `1/2` maps to `6` | Agrees |
| Newform specialization | k=2, N=11, s=1/2 | Conductor `11·4·5=220` | Agrees with ModularForms |
| Family arithmetic conductor | ℚ; ℚ(i); χ modulo4 | `1`, `4`, `4` | Agrees |
| 3.1 growth hypothesis | `exp(sin πs)`, strip [0,1] | Edge norms `1`; interior log norms at t=0,1,2: `1,11.592,267.747` | R03: cannot discard growth input |
| 3.2 gamma quotient exponent | Real shift μ, left σ=−δ | Difference of gamma powers `(1+δ+Re μ−1)/2−(−δ+Re μ−1)/2=1/2+δ` | Agrees at large height |
| 3.3* clearing polynomial | Zeta | `P=X−1`; extended value at 1 is residue `1`, raw value `0` | Agrees |
| 3.3* entire-character clearing | Primitive χ modulo4 | No poles; canonical clearing polynomial `1`; function unchanged | Agrees |
| 3.3* arbitrary polynomial order | Same character, P=0,1,X−2 at s=2 | Left orders `⊤,0,1`; right orders `0,0,1` | R04: require P≠0 |
| 3.3* interpolation | σ=−δ,1/2,1+δ | Exponents `1/2+δ`, `1/4+δ/2`, `0` | Agrees algebraically; R03 supplies growth |
| 3.3* central convexity / Lean | q=1,t=0 | `|ζ(1/2)|≈1.4604`; scale `3^(1/4+ε)>0` | No boundary contradiction; C must dominate ratio |
| 3.3* wide-strip margin | Pole height H, T₀=H+1 | Height distance ≥1; reciprocal clearing factor has no pole there | Agrees |
| 3.4 family order | Zeta on positive real 2m | Log norm `m log m+O(m)`; divided by `(2m)^(1+ε)`→0 | Agrees with desired order; route needs R03 |
| 4.1* finite support | `sin πz`, closed disc radius 2 | Five divisor points `−2,−1,0,1,2`; unrestricted support infinite | Agrees |
| 4.1* positive/signed equality | `z(z−1)` versus `z/(z−1)` | `(signed,positive)=(2,2)` versus `(0,1)` | Agrees under no-pole condition |
| 4.1* empty and zero function | Empty region; f=0 | Counts `0,0`; zero function orders `⊤` but divisor values `0` | Agrees with explicit junk convention |
| 4.1* monotonicity/equality | z, enlarge disc radius 1 to 2; enlarge away from 0 to include 0 | Counts `1→1`, `0→1`; added divisor sums `0,1` | Agrees with finite-support hypotheses |
| 4.1* height additivity | One simple zero on splitting height | Half-open contributions `1+0=1`; two closed contributions `1+1=2` | Agrees |
| 4.2 record divisor | Zeta at poles | `div Λ=−1`, polar weight 1, entire divisor `0` | Agrees |
| 4.3* Jensen nonzero center | `1−z/2`, r=1,R=1.5,M=2 | Count `0`, bound `log2/log1.5≈1.7095`; sphere maximum 1.75 | Agrees |
| 4.3* trailing coefficient | z, r=1/4,R=1/2,M=1 | Count `1`, corrected bound `2`, naive bound `0` | Agrees |
| 4.3* trailing multiplicity | z², same radii and M | Count `2`, bound `2+2log2/log2=4` | Agrees |
| 4.4 disc geometry | Centers 1/2+iT and 2+iT | Center distance `1.5`; small-disc farthest distance `2.5<3<4` | Agrees |
| 4.4 Euler lower bound | Zeta at 2 | `ζ(2)=π²/6 ≥6/π²≈0.608`; no exponential small denominator from L | Agrees |
| 4.4 ratio normalization | Same gamma evaluated within bounded height distance | Exponentials differ by factor ≤`exp(πn)` for distance≤4; residual height power polynomial | Agrees asymptotically; compact heights need separate bound |
| 4.5 count/right continuity | ζ, T=14,15,100 | N values `0,1,29`; symmetric at100 `58` | Agrees as classical numerical controls, not certified numerics |
| 4.5 unit interval bound | Simple zero at h | Increment across h `1`; logarithmic upper bound may absorb it | Agrees |
| 4.5 conjugation correction | Conjugate pair plus real zero multiplicity m | `N±=2N+m`; equality `2N` only if m=0 | Agrees |
| 4.6* Nevanlinna comparison | z at r=2,R=4 | n(r)=1; log counts `log2,log4`; `log2=log4−log2` | Agrees |
| 4.6* positive versus signed | 1/z at r=2,R=4 | Positive side `0≤0`; signed substitution `0≤−log2` false | Agrees |
| 4.6* multiplicities | z² at r=2,R=4 | `2log2=2log4−2log2` | Agrees |
| 5.1 zero bound/support | `1−z`, exp z | Counts for r≥1: `1,0`; supports `{1},∅` | Agrees |
| 5.2 elementary factor value | z=0,1 | `E₁=1,0`; zero set exactly {1} since exp never 0 | Agrees both directions |
| 5.2 derivative/log derivative | z=0,−1/2 | Derivatives `0,(1/2)e^−1/2`; log derivatives `0,1/3` | Agrees |
| 5.2 quadratic approximation | z=−1/2 | Error `0.090204...≤0.125`; genus-zero error `0.5` | Agrees for this Check |
| 5.2 global upper bound | z=−r, r>0 | `log|E₁|=log(1+r)−r ≤1+r`; near1 log→−∞ | Agrees; upper bound only |
| 5.3* zero summability | cos z | Paired zeros ±(k+1/2)π; reciprocal-square sum `1`; reciprocal-(1+ε) sum finite | Agrees |
| 5.3* canonical product | `1−z`, exp z | Products `E₁(z)`, `1`; divisors `{1↦1}`, `0` | Agrees |
| 5.3* opposite zeros | ±a | `E₁(z/a)E₁(−z/a)=1−z²/a²` | Agrees |
| 5.4* entire logarithm | `g=e^(2z)`, g=1 | h=2z, h=0; shifts h+2πik have same exponential | Agrees |
| 5.4* nonvanishing necessary | g=z | g(0)=0; every exp h(0)≠0 | Agrees, excludes wrong model |
| 5.5* general Hadamard / Lean | `1−z`, `e^(cz)`, constant 2 | `(a,b)=(0,−1),(0,c),(log2,0)`; products E₁,1,1 | Agrees |
| 5.5* product at a zero | f=1−z, s=1 | Both sides 0; finite products eventually 0 | Agrees with Multipliable allowing zero limit |
| 5.5* logarithmic derivative | f=1−z, s=0,2 | Formula `−1+1/(s−1)+1=1/(s−1)`; values −1,+1 | Agrees signs |
| 5.6* positivity | ρ=1/2+i, s=2 | `Re 1/(s−ρ)=(3/2)/(13/4)=6/13>0` | Agrees |
| 5.6* reality alone versus family | exp(cz), real c | No zeros, b=c; claimed cancellation would give c=0 | Generalization rejected; keep family functional equation |
| 5.6* symmetric family model | f=(s−1/2)²+1 | Zeros 1/2±i; sum Re(1/ρ)=4/5; b=f'(0)/f(0)=−4/5 | Agrees cancellation |
| Zeta Hadamard / Lean | s=0,1 | Entire completion values 1,1; at0 product1 forces exp A=1 | Agrees normalization |
| 6.1* positivity polynomial | θ=0,π,π/2 | `3+4cosθ+cos2θ=8,0,2`, matching `2(1+cosθ)²` | Agrees |
| 6.1* common presentation | Delete prime3 | Its term omitted in all three sums, contribution0; mixed presentation could leave nonmatching weights | Agrees |
| 6.2 region cap | q=1,t=0,c=log3/2 | Left boundary `1−c/log3=1/2` | Agrees |
| Zeta zero-free / Lean | s=2; s=1; s=−2 | ζ(2)=π²/6≠0; 1 excluded; trivial zero −2 outside capped region | Agrees |
| 6.3 exceptional predicate | β=1,1/2; nonreal χ | β=1 rejected; β=1/2 only qualifies if an actual positive divisor; nonreal character rejected by theorem | Agrees; predicate never assumes existence |
| 6.3 simple uniqueness | Two zeros or a double zero | Weighted reciprocal contribution doubles from `1/(σ−β)` to `2/(σ−β)` | Same positivity obstruction; not a proof of constant |
| 6.4b Euler zeros | factor `1−2^−s` | At0 zero; zero real part0; at β≥1/2 factor≥`1−1/√2>0` | Agrees |
| 6.4b Euler derivative bound | σ>1, norm2 | Magnitude≤`log2/(2^σ−1)<log2≤2log2` | Agrees |
| 6.4c reality iff | χ²=1 versus quartic χ | Real values ±1 square to1; χ(2)=i squares to−1 | Agrees both directions |
| 6.4d pole term | ζ, σ=1+u,t=0 | `−ζ'/ζ=1/u+O(1)`; nontrivial formula omits this divergence | Repaired restriction agrees |
| 6.4d conjugate constants | b=a+ic | b+conj b=2a; paired reciprocal sum gives twice real part | Agrees |
| 6.4e bounded conductors | Degree1, bound X=1 | Only ℚ and primitive trivial character up to isomorphism | Agrees with finite-subfield formulation |
| Dirichlet zero-free / Lean | q=2 principal, zero s=0 | Denominator log6; capped boundary≥1/2; Euler-factor zero excluded | Agrees |
| 6.5* nontrivial edge | Odd χ modulo4 at s=1 | L(1)=π/4, Gammaℝ(2)=1/π, conductor factor2: Λ(1)=1/2≠0 | Agrees |
| 6.5* trivial edge | Completed ζ at0,1 | Orders −1,−1; no positive divisor | Claim sound; fix supplier locator R07 |
| 7.1* orientation | Unit square, points .5+.5i and2 | Windings1,0; clockwise winding−1 | Agrees |
| 7.1* collapsed rectangle | Width0 | Interior empty; retraced segment winding0 off segment | Agrees with IsPiecewiseC1On, no immersion needed |
| 7.1* breakpoints/null homology | Unit square | γ(0)=0, γ(1)=1, γ(4)=0; every point outside any U⊇R has winding0 | Agrees |
| 7.2* outside singularity | f=z−2, square [−1,1]² | Integral/(2πi)=0; weighted sum0; unweighted sum1 | Old R01 repaired |
| 7.2* inside zero/pole | z; 1/z | Normalized integrals1,−1; signed counts1,−1; positive counts1,0 | Agrees |
| 7.2* localization | sinπz near bounded square | Locally finitely many zeros; global integer support infinite | Agrees; relatively compact V required |
| 7.2* representative condition | Value defect of constant1 on boundary | Order0 but point value0; no analytic boundary representative | Excluded correctly |
| 7.3 argument variation | One turn; constant positive path | Differences2π,0; adding2π to whole lift leaves both unchanged | R06 |
| 7.3 vertical argument | ζ at σ=2 | Lower real part `2−π²/6≈0.3551>0` | Agrees |
| 7.3 small-height S | T→0+ | N=0, theta→0, S→−1; `0=0+1−1` | Agrees |
| 7.4 zeta count / Lean | T=2 | Actual count0; main term≈−0.682689; admissible C≥0.98491 at this T | Agrees with inequality, not exact equality |
| 7.4 boundary heights | Simple zero at h | Left count k, count at h and right limit k+1; smooth main term jump0 | Agrees |
| 7.5 Dirichlet count / Lean | q=1 | Symmetric main term exactly twice zeta main term | Agrees |
| 7.5 conductor coefficient | Imaginary quadratic | Sum of degree1 mains equals `(T/π)log(D(T/(2πe))²)` | Agrees |
| 7.5 missing confinement control | Factor 1+5u+2u²,u=2^−s | Roots u=(−5±√17)/4; real parts approximately2.1895,−1.1895 | Confirms need for confinement |
| 7.6* leading density | Main aTlogT+bT | Divide by TlogT→a=n/(2π); logarithmic error divided by TlogT→0 | Agrees |
| 7.6* mean unit increment | Same main term | Integrated increment `aTlogT+O(T)`; divide by TlogT→a | Agrees; does not imply pointwise increment asymptotic |
| 8.1 finite Perron endpoint | x=c=T=1 | `atan1/π=1/4`; infinite-height limit1/2 | Agrees |
| 8.2 residue at1 | ζ, pole order−1 | Residue of −ζ'/ζ is+1; with x^s/s gives x | Agrees |
| 8.2 residue at zeroρ | Simple zeroρ≠0 | Residue −1; contribution−x^ρ/ρ | Agrees |
| 8.2 origin residue | ζ (unit rank0) | cℚ=−log2π; no log x term | Agrees |
| 8.2 general origin | Unit rank r | Product of `−r/s+cK` and `1/s+log x+…` has residue cK−rlogx | Agrees |
| 8.3* even trivial zeros | ℚ,x=2 | Sum Σ2^−2m/(2m)=−log(3/4)/2≈0.143841 | Agrees |
| 8.3* odd trivial zeros | r₂=1,x=2 | Σodd 2^−m/m=log3/2≈0.549306 | Agrees |
| 8.3* truncated zeta / Lean | x=T=2 | ψ=log2; zero sum0; formula discrepancy≈0.387183; scale log²2≈0.480453 | Agrees for C≥0.806; endpoint jump absorbable |
| 8.4 test zero / Lean | φ=0 | All transforms, integrals, prime terms and zero terms0 | Agrees; also test nonzero normalization below |
| 8.4 Mellin dual | φ(1/2)=1,y=2 | φ̌(2)=1/2; substitution sends s to1−s | Agrees |
| 8.4 signed divisor control | Pole contribution P>0 | Correct Z=P+A; signed Z−P=A differs from unchanged RHS by−P | Old R09 repaired |
| 8.4 gamma constant | φ(1)=1, ℚ | Two Mellin inversion integrals give2; constant−logπ/2 gives−logπ | Agrees |
| 8.4 summability | Smooth test, shell height m | Shell bound `O(log m)`, weight `O(m^−k)`; Σm^−k logm converges for k>1 | Agrees; finite support not required |
| 8.5 exceptional absorption | β=3/4, log x=u² | Ratio `(x^β/β)/(xe^−cu)=(4/3)e^(−u²/4+cu)→0` | Agrees for fixed object |
| Prime ideal count / Lean | K=ℚ,x=2 | One height-one prime, count1; offset Li(2)=0; error bound is asymptotic | Agrees; finite initial discrepancy allowed |
| 8.6 conjugate prime term | Quartic χ, norm2, φ(1/2)=1 | Inside prime sum `−i log2/2`; wrong χ on dual side gives+i log2/2 | Agrees |
| 8.6 trivial-zero parity | Odd χ over ℚ | Order at0=0; at−1=1; at−2=0 | Agrees |
| 8.7 ray-class coefficient | ℚ, modulus3∞ | Prime coefficient1/2; all-ideal coefficient(1/2)(1−1/3)=1/3 | Old R02 repaired |
| 8.7 deleted primes | Modulus3∞, x=9 | Omitted powers3,9 contribute2log3, not a changed linear coefficient | Agrees |
| 8.7 character orthogonality | Group C₂ | For classes e,g: character sums2,0; divided by2 gives indicators1,0 | Agrees |
| 8.7 exceptional terms | One real exceptional character of C₂ | Class weights+1/2,−1/2; no exceptional zero gives empty sum0 | Agrees; explicit Checks should be added |
| 8.7 Abel exceptional term | β=1/2 | Integral substitution u=√t gives Li(√x)−Li(√2) | Agrees; β>0 needed |
| Progressions / Lean | q=1; q=4,a=3 | Totients1,2; leading coefficients1,1/2; count at x=3 in latter class1 | Agrees |
| 8.8 reciprocity forces abelian | Surjection C₄→C₂; attempted abelian→S₃ | Fibre size2, density2/4=1/2; commutators in image1, so no surjection to S₃ | Agrees; nonabelian case excluded structurally |
| 8.8 abelian prime example | ℚ(i)/ℚ | Nonidentity Frobenius primes≡3 mod4, coefficient1/2; ramified prime2 excluded | Agrees |
| 8.8 exceptional fibre sum | C₄→C₂ | Character sum on fibre is2 for factoring characters,0 otherwise; divide4 gives1/2 or0 | Agrees |
| 8.8 dictionary independence | Enlarge modulus4∞ to12∞ | Additional prime3 factor zeros only on Re s=0; primitive character unchanged | Agrees on exceptional region |
| 8.9 Li normalization | x=2 | Offset Li=0, x/logx=2/log2≈2.88539 | Agrees; distinct normalizations |
| 8.9 two-term asymptotic | logx=u² | Ratio `(x/log²x)/(xe^−cu)=e^(cu)/u⁴→∞` | Confirms x/logx is insufficient |
| 9 certificate coverage | Two simple zeros, boxes counts[1,1] | Total2=sum2; drop a box gives sum1≠2 | Agrees |
| 9 certificate stability | Shrink boxes without crossing zero | Counts remain1,1 and total2 | Agrees with boundary/count conditions |
| 9 boundary exclusion | Completed ζ on [0,1]×[−1,1] | Orders at boundary0,1 are−1,−1; certificate fails | Agrees |
| 9 empty certificate | Entire zeta completion on same rectangle | Count0, empty sum0; no boundary poles | Agrees |
| 9 signed-count rejection | Omitted zero plus omitted pole | Signed omitted sum1−1=0; positive omitted sum1 | Agrees; no-pole condition prevents cancellation |
| 9 critical-line coverage | Boxes all containing only line zeros | Coverage sends every counted zero to a box; real part1/2 | Agrees |
| 9 symmetry criterion | Pair .4+i,.6+i versus a single invariant zero | Pair count2; a single orbit of size1 obeys β=1−β, β=1/2 | Agrees |
| 9 GRH/native RH bridge | ζ at−2,0,1 | Completed divisor0,−1,−1; uncompleted trivial zero−2 has positive order | Agrees with completed-zero convention |

### Pinned declarations opened

Paths below are relative to the relevant library repository. These are inspections of definitions and hypotheses, not just matching names.

| Pinned file and declaration | What it supplies, and the limits checked |
|---|---|
| `Mathlib/Analysis/Meromorphic/Divisor.lean:39`, `MeromorphicOn.divisor` | Conditional on meromorphy and membership in U, takes `meromorphicOrderAt.untop₀`; otherwise 0. Infinite order also becomes 0. It does not assert pointwise analyticity or nonvanishing. |
| `Mathlib/Analysis/Meromorphic/Order.lean:362`, `meromorphicOrderAt_const`; `:784`, `MeromorphicOn.meromorphicOrderAt_ne_top_of_isPreconnected` | Zero constant has order top. Finite order propagates on a preconnected meromorphic domain from a point in that domain. |
| `Mathlib/Topology/LocallyFinsupp.lean:106`, `LocallyFiniteSupport.finite_inter_support_of_isCompact` | Compact intersection of locally finite support is finite; one must work inside the meromorphy domain. |
| `Mathlib/Analysis/Meromorphic/FactorizedRational.lean:296`, `MeromorphicOn.extract_zeros_poles` | Requires finite orders and finite divisor support; produces a nonvanishing analytic factor and a codiscrete equality. It is not a global infinite Hadamard theorem. |
| `Mathlib/Analysis/Complex/JensenFormula.lean:391`, `AnalyticOnNhd.sum_divisor_le` | Positive radii with r<R, nonzero center, analytic neighborhood of outer disc, sphere bound M≥1. The central-zero adapter remains additional work. |
| `Mathlib/Analysis/Complex/ValueDistribution/LogCounting/Basic.lean:274`, `ValueDistribution.logCounting`; `:329`, `log_counting_zero_sub_logCounting_top`; `:580`, `Function.locallyFinsuppWithin.logCounting_divisor_eq_circleAverage_sub_const` | Finite-value count uses positive divisor; infinity uses negative divisor. Their difference is signed counting. Jensen uses the trailing coefficient, not f(0) when that vanishes. |
| `Mathlib/Analysis/Complex/BranchLogRoot.lean:37`, `Complex.exists_continuousOn_eqOn_exp_comp` | Open simply connected domain, continuous g, zero outside its image; produces a continuous logarithm. Analytic upgrading is an adapter, not already in this signature. |
| `Mathlib/Analysis/Complex/PhragmenLindelof.lean:275`, `Complex.PhragmenLindelof.vertical_strip` | Closed-strip regularity, two boundary bounds and explicit sub-double-exponential growth. The latter is mandatory; see R03. |
| `Mathlib/Analysis/Complex/BorelCaratheodory.lean:109`, `Complex.borelCaratheodory` | Positive radius and real-part bound, holomorphy in a disc, strictly interior evaluation point. Its denominator R−norm z is positive. |
| `Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`, `multipliableLocallyUniformlyOn_one_add` | Summable majorant, eventual domination on the open set, continuous factors. Apply on bounded open sets for canonical products, then localize; no global uniform majorant is implicit. |
| `Mathlib/Analysis/Calculus/LogDerivUniformlyOn.lean:24`, `logDeriv_tprod_eq_tsum` | Requires summability of log derivatives, locally uniform product convergence, differentiability, and nonzero factors and product at the point. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:43`, `:51`, `:73`, `:89`, `:97`, `:122` | Real/complex gamma definitions, totalized real-gamma zero values, entire reciprocals and duplication. These give the factor-of-two and pole controls in the table. |
| `Mathlib/Algebra/Polynomial/Div.lean:505`, `rootMultiplicity`; `:535`, `rootMultiplicity_zero` | Root multiplicity of the zero polynomial is deliberately 0. It is not the infinite order of the zero analytic function. |
| `Mathlib/Analysis/MellinTransform.lean:91`, `mellin`; `:96`, `mellinInv`; `Mathlib/Analysis/MellinInversion.lean:92`, `mellinInv_mellin_eq` | Native transforms; inversion requires positive x, Mellin convergence, vertical integrability, continuity and a complete target space. |
| `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:1190`, `ContDiff.analyticOnNhd` | Top/omega regularity entails analyticity. The inner-top infinity used in this Lean file is smoothness. |
| `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64`, `:68`, `:121` | Entire auxiliary completion, meromorphic completion, and uncompleted zeta. Raw total quotients at poles are not analytic extensions. |
| `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:398`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; `:411`, `riemannZeta_ne_zero_of_one_le_re` | Qualitative boundary nonvanishing. Dirichlet statement retains principal/pole exclusion; neither proves a region left of 1. Zeta's total value at 1 happens to be nonzero. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:497`, `NumberField.finite_of_discr_bdd` | Finitely many bounded-discriminant number subfields in a fixed ambient extension, not literal finiteness of all type presentations. This is the native route for §6.4e. |
| `TauCeti/Analysis/Contour/Argument/Cycle.lean:110`, `TauCeti.Contour.argumentPrinciple_nullHomologous` | Ordinary integral, finite integer orders, analytic/nonvanishing off S, closed piecewise C¹ curve avoiding S and null-homology. Orders are weighted by winding numbers. |
| `TauCeti/Analysis/Contour/Argument/Lift.lean:412`, `exists_continuousOn_arg_lift_with_partition` | Continuous interval curve avoiding its center; yields a continuous argument and a partition. A constant curve is allowed. |
| `TauCeti/Analysis/Contour/LogDerivFTC.lean:226`, `windingNumber_comp_eq_integral_logDeriv` | Analyticity and nonvanishing at each curve point identify image winding with the normalized log-derivative integral. |

### Supplier resolution and ownership by object

I used the roadmap service's object searches and `roadmaps show LFunctions`, and searched main, the board's packages and the supplied sibling checkouts. Broad hits for Hadamard three-lines, differential Hadamard lemmas and algebraic genus-one curves were separated from entire-function products. The supplied heads of GlobalHolomorphicFunctions, ComputationalNumberTheory and FuchsianOrbifolds explicitly consume this roadmap's generic analytic objects. They are not competing owners. No other fully qualified `TauCetiRoadmap.ZerosOfLFunctions` headline declaration was found in the supplied sibling collection. Searches of the wider index were leads only; no unsupplied open head was assumed inspected. No new Mathlib PR was used as a supplier.

| Object / exact owner inspected | Resolution |
|---|---|
| LFunctions main, `TauCetiRoadmap/LFunctions/Suggested.lean:117`–`:266` | Record fields, degree, gamma factor, dual, reflected point, all three predicates, transport and normalization translation exist. In particular the ten scanner leads resolve here, not in the pinned libraries. Average growth is the prose target in its README Layer 0, at line 374; no invented structure field is required. |
| LFunctions main, `Suggested.lean:922`, `:927`, `:940`, `:965`, `:972`, `:977`, `:1012`, `:1025`, `:1028`, `:1046`, `:1053` | Finite Euler correction, partial zeta, sum identity, full-plane continued zeta, exact poles and completed functional equation resolve. They are roadmap contracts, not assertions about native Mathlib's raw Dirichlet series off convergence. |
| LFunctions main, `Suggested.lean:1440`, `:1462`, `:1476` | Dirichlet records and quadratic/cyclotomic identities resolve with their actual character/field hypotheses. |
| LFunctions main, `Suggested.lean:1535`, `:1548`, `:1553`, `:1566`, `:1576`, `:1597`, `:1607`, `:1620` | Primitive character, inverse, presented L-function, Euler correction, induced/primitive germ identities and character reconstruction all resolve. At poles the supplier gives germ identities, not arbitrary pointwise equalities. |
| LFunctions main, `Suggested.lean:1632`, `:1645`, `:1648`, `:1656`, `:1661`, `:1670`, `:1680` | Hecke record/completion, nontrivial entirety, root-number norm, value/germ functional equations and existential Mellin representation resolve. The last has no growth estimate; R03 names the stronger kernel contract needed. |
| LFunctions main, `Suggested.lean:2680`, `:2685`, `:2689`, `:2819`, `:2827` | Nontrivial Hecke boundary theorem, trigonometric positivity, separate Dedekind boundary order, logarithmic derivative and coefficient positivity resolve. §6.5 must use the separate Dedekind theorem. |
| `Completed/GlobalNumberFields/Suggested.lean:155`, `:165`, `:314` | Ideal class on ideals prime to the modulus, finite ray-class group, and all-ideal main coefficient. The finite Euler correction in the last is now correctly distinguished from the prime coefficient. The README's old relative link should point to Completed. |
| `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:3730`, `:3742`, `:3756` | Ray-class Artin map, splitting law and surjectivity require an admissible modulus and the appropriate unramified-prime hypotheses. This suffices for the stated abelian dictionary after the NumberFieldArithmetic comparison. |
| `TauCetiRoadmap/ModularForms/README.md:750`–`:762` | Its conductor has the two shifts `(k−1)/2,(k+1)/2`, agreeing with §2.4. This roadmap's general-record definition specializes that existing convention. |
| `Completed/ArithmeticDirichletSeries/README.md` Layers 2,6,10; `Suggested.lean:1006`, `:1047`, `:1073` | Generic ideal weights, Abel/Perron and Li transfers are existing work. Their statements supply the contracts even though their newer implementations are absent at the reviewed pin. |
| `Completed/Chebotarev/Suggested.lean:249`, `:256` and its prime-counting layer; `Completed/NumberFieldArithmetic/Suggested.lean:781`, `:827` Artin-symbol comparison | Exact Frobenius sets, counts and unramified Artin dictionary are owned there. They should be cited as roadmap suppliers here, not rebuilt or described as present at this pin. |
| `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:23`, `:135` at its supplied head | Explicitly assigns genus-one factors, order-one canonical products and the entire logarithm to ZerosOfLFunctions, and consumes them. Its general Weierstrass development is later. |
| `TauCetiRoadmap/ComputationalNumberTheory/README.md:101`, `:362` at its supplied head | Consumes generic counts and rectangle localization. This roadmap supplies their mathematics; no numerical algorithm is introduced here. |
| `TauCetiRoadmap/FuchsianOrbifolds/README.md:135`, `:785` at its supplied head | Consumes Hadamard/growth; its Selberg-specific analysis is distinct. |

The three main/supplied-owner comparisons above justify ownership here of the general order-one factor/product, the rectangle specialization and L-function zero distribution. Generic residue calculus, native Jensen and reciprocal-gamma entirety remain consumed. The source material was not copied into the repository, and no source manifest was edited.

### Seeded source sample

Every one of the fifteen requested targets was inspected. Four relevant works were legally fetched and read through the source service: DLMF, Titchmarsh, Kadiri and the published Trudgian paper. The Iwaniec–Kowalski author excerpt was also fetched, but contains the wrong chapter and certifies none of Chapter 5. The source-only “Cited by locator”/generality qualifications in the prose were treated as claims to examine, not as prior verification. No missing text was silently counted as verified.

| Sampled target | Source text / exact locator examined | Result and limit |
|---|---|---|
| 1.5 gamma factor | `dlmf line 104`, equation 5.11.1; `line 158`, 5.11.2; `lines 488–524`, 5.11.9 | Sector margin and bounded-real-part vertical asymptotic support summing finite shifted factors. Each real factor contributes π/4, each complex factor π/2. They do not support R02's whole-half-plane claim. DLMF uses equation locators, not printed pages. |
| 3.3 strip bound/convexity | Iwaniec–Kowalski §5.2, unavailable; pinned `PhragmenLindelof.lean:275` opened | Interpolation exponent checked algebraically. The native theorem confirms the omitted proof input in R03. Exact book hypotheses/page cannot be certified. |
| 4.1 two counts | Pinned `Meromorphic/Divisor.lean:39`, `Topology/LocallyFinsupp.lean:106` | Native divisor, positive part, compact finiteness and junk conventions verified; polynomial/pole examples computed above. No external passage is claimed for the new rectangle adapter. |
| 4.3 Jensen | Pinned `JensenFormula.lean:391` | Exact radius, analyticity, nonzero-center and M≥1 hypotheses verified. Trailing-coefficient form is a derived adapter; the center-zero counterexample distinguishes it. |
| 4.6 Nevanlinna | Pinned `LogCounting/Basic.lean:274`, `:329`, `:580` | Positive versus signed carriers and the trailing-coefficient normalization verified. The displayed n/N inequality is the monotone-count integral consequence, checked at z,z²,1/z. |
| 5.3 canonical product | Pinned uniform-product theorem at `MultipliableUniformlyOn.lean:137`; Davenport §11 unavailable | Existing convergence machinery requires the locally constructed majorant. Zero summability and divisor equality are work here; no unread book claim is certified. |
| 5.4 entire logarithm | Pinned `BranchLogRoot.lean:37` | Continuous logarithm on simply connected univ is supplied. Holomorphic upgrading and ambiguity require the stated analytic hypotheses; exp and a function with a zero distinguish them. |
| 5.5 Hadamard | Davenport §11, unavailable; pinned Borel–Carathéodory and product differentiation | General signature and examples verified; textbook theorem/page and the complete large-circle proof are not source-certified. |
| 5.6 L-function corollaries | `kadiri2012 lines 230–238`, §2.1.2, preprint p.5; Lang XVII §3 unavailable | Kadiri's Dedekind identity retains discriminant, gamma and both pole terms. The general/complex-character assertions require the roadmap's functional-equation argument; they are not asserted as Kadiri's theorem. |
| 6.1 quantitative 3-4-1 | LFunctions main `Suggested.lean:2685`, `:2819`, `:2827` | The trigonometric identity and positive Dedekind coefficients resolve. Same-modulus character series are the additional specialization; values 8,0,2 checked. |
| 6.5 edges | LFunctions main `Suggested.lean:2680`, `:2689`; Mathlib `Nonvanishing.lean:398`, `:411` | The nontrivial theorem does not itself cover the trivial character. The correct separate Dedekind input exists; R07 fixes attribution. |
| 7.1 rectangle contour | Pinned contour regularity, winding and null-homology APIs | Rectangle is new geometry on those APIs; winding 1/0 and collapsed-case 0 computed. No textbook theorem/page is supplied by the README for this adapter. |
| 7.2 rectangle argument principle | Pinned `Argument/Cycle.lean:110` and `LogDerivFTC.lean:226` | Weighted integral theorem inspected with all hypotheses. Corrected outside/inside/pole instances give 0,1,−1 respectively. |
| 7.6 corollaries | `titchmarsh1986 lines 7020–7035`, Theorem 9.4 and following discussion, printed p.214; `trudgian2015 lines 16–29`, Theorems 1–2, printed p.1439 | Zeta leading density and the symmetric conductor mains agree. Mean-increment result is an additional elementary integration consequence, computed above; Trudgian does not state a general Hecke-family theorem here. |
| 8.3 truncated formula | Davenport §17, unavailable | Signs, zero/pole multiplicities, origin residue, even/odd trivial-zero series and x=T=2 computed. The full uniform error bound and its precise source page remain uncertified. |

Additional source checks: Titchmarsh §9.2, printed p.211 (`titchmarsh1986 lines 6918–6941`), uses an inclusive upper ordinate and gives the unit-height bound. Section 9.3, printed pp.212–213 (`lines 6944–6985`), fixes the argument path/right-limit convention and explicitly treats zero ordinates. Trudgian's published Theorem 1 excludes principal characters; Theorem 2 has the full discriminant and degree in the symmetric main term, with T≥1. Kadiri Theorem 1.1, preprint pp.2–3 (`kadiri2012 lines 79–85`), retains sufficiently large discriminant and separates high and low heights. I verified the arXiv version read; I do not certify identity of every printed-page locator with the journal version.

## Not verifiable

- **Davenport, Multiplicative Number Theory (2000), §§11–20** (`davenport2000`): the source service returned `uncertified` through the paywalled Springer DOI. I did not read these chapters. Hadamard's exact source hypotheses and the truncated formula's full error term remain uncertified; the independent computations and native-library inspections above are separate evidence. No new missing-text request was made for this settled paywall result.
- **Lang, Algebraic Number Theory (1994), XV §§4–5 and XVII §§1–3, especially XVII §3 Theorems 3.1–3.2** (`lang1994`): likewise returned `uncertified` through the paywalled publisher. The claimed Barner test-class inclusion and precise source normalization are not source-certified. The Mellin inversion signs and archimedean constant were checked independently.
- **Iwaniec–Kowalski, Analytic Number Theory (2004), §5.1 equation (5.7) and §5.2** (`iwaniec-kowalski2004`): the title/DOI route did not provide the text; the author's legal excerpt begins with Chapter 11 (`iwaniec-kowalski2004 line 17`). It contains neither requested section. The main ModularForms convention was checked, but that does not certify the book locator. Recorded under the same source key in the scratch missing-reference list.
- **Lagarias–Odlyzko, Effective versions of the Chebotarev density theorem (1977)** (`lagarias-odlyzko1977`): source-service title resolution and a search of the author-site route did not yield readable text. The README supplies no theorem number or printed page for this attribution. Recorded in the same missing-reference list. The abelian fibre/character calculation is independently checked, not certification of that historical source.
- **Limits of the mathematics checks:** finite instances do not prove the Hecke zero-free theorem, conductor-uniform estimates or the full Hadamard proof. The tabulated numerical zeta-zero counts are classical controls, not newly generated numerical certificates. The review does not claim inspection of open heads absent from the supplied sibling collection. No source content or missing-source status was inferred from the PR description or repair report.

## Source issues

- none
