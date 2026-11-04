# Review of ZerosOfLFunctions (pull request #253 at 98c62f2)

**Verdict:** accepted

Two P3 notes, no blocking finding. The gate passes, the dependency check reports no problem, the previous review's seven findings are repaired, and the adversarial table below carries computed values for every sampled target and every headline.

## R01 (P3) — A supplier declaration named that the cited roadmap does not have, and that no target uses

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:221`, "Layers 9–10: `LSeries.wienerIkehara` and `primeNumberTheoremTransfer`"; also the scope bullet at line 60, "Layers 0–2, 6 and 10".

**Claim:** Arithmetic Dirichlet Series Layers 9–10 supply `LSeries.wienerIkehara`.

**Witness:** `Completed/ArithmeticDirichletSeries/Suggested.lean:1441` declares `wienerIkehara` inside `namespace TauCetiRoadmap.ArithmeticDirichletSeries`; its README export table (line 105) names it `wienerIkehara`. No `LSeries.` prefix exists there. Neither name occurs in any `*Needs:*` line or target of this README (only line 221).

**Repair:** Write `wienerIkehara`, or delete the Layers 9–10 bullet since no target consumes a Tauberian input (Layer 8 goes through the explicit formula). Align the scope bullet with the contract section (Layers 0–3, 5, 6 and 9–10, or whatever remains after the deletion). Tested: with the bullet deleted every remaining supplier name of that section resolves to a declaration of the Completed roadmap (lines 568, 1006, 1045, 1047, 1073, 1087, 1095, 1112, 1586).

## R02 (P3) — The Lagarias–Odlyzko reference has no locator

**Location:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:1689`, "effective counting in a fixed Galois extension"; used at line 1538, "Lagarias–Odlyzko prove the estimate for every Galois `L/K`".

**Claim:** The reference supports the attribution in 8.8.

**Witness:** Every other reference carries a theorem or section; this one has neither, and the text could not be read legally (see Not verifiable). The attribution is background, not a proof input of 8.8, whose route is 8.7 plus the dictionary.

**Repair:** Add the theorem number of their unconditional effective Chebotarev theorem and the page, or phrase the sentence as historical attribution without a claim about their hypotheses. No target changes.

## Verified sound

This is a full review of the 1,693-line README and the 222-line Lean file at `98c62f29c4a8acb338a972b48876dcfde9f78fdc`, every passage read, changed or not. Mathlib pin `05ae0103`, Tau Ceti pin `e8af08d0` (from `lake-manifest.json`), content main `fa41b374`. I read the repository README's writing checklist and CONTRIBUTING, and compared the shape with `Completed/ContourIntegration/README.md` and `Completed/ArithmeticDirichletSeries/README.md`. No change outside the roadmap folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty). No route-specific shortcut, re-planned roadmap, computational algorithm, copied passage, sorry'd data, `set_option`, extra import or process word was found.

**Gate and build.** The worker's gate at this head passes every counter including the targeted build. My own `lake env lean` of `Suggested.lean` emits exactly eleven `declaration uses sorry` warnings and nothing else. The dependency check I ran prints

```text
depcheck: 204 roadmaps, 1554 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. In the merge order this roadmap is at line 76, after LFunctions (23); ClassFieldTheory and every Completed supplier are on main. Every consumer that touches the same objects is later: AutomorphicLFunctionsAndLocalFactors (77), GlobalHolomorphicFunctions (80), AnalyticNumberTheoryPartI (81), ComputationalNumberTheory (179).

**Signatures.** I elaborated a scratch file with `#check @name` for all fourteen declarations (three definitions, eleven theorems); every type matches its README statement and no section binder is dropped (the file has no `variable` block; every hypothesis is explicit). The worker's signature index lists a fifteenth entry `of`, which is prose of the module docstring, not a declaration. The uniform constants are quantified before the modulus and character in `dirichletLFunction_convexity`, `dirichletLFunction_zeroFreeRegion`, `riemannVonMangoldt_dirichlet` and `primeCounting_progression_effective`; the field is fixed before `c` in `primeIdealCount_effective`, as the README's uniformity convention says.

**Padding probe.** On a scratch copy every sorried theorem was given `first | (simp; done) | (rfl; done) | (infer_instance; done) | (assumption; done) | (exact?; done) | sorry`; all eleven fell through to `sorry` (the linter lines in the probe output are the probe's own unreachable alternatives). No declaration restates a definition, mirrors a Check or computes a value. No padding.

**Headline inventory.** The README's end theorems: conductor-uniform convexity (3.4); Hadamard at order one and its ζ instance (5.5); the zero-free regions for ζ_K and Hecke L-functions with the exceptional-zero alternative (6.2–6.4); the Riemann–von Mangoldt formula and its conductor-uniform form (7.4–7.5); the truncated and Weil explicit formulas (8.3–8.4); the effective prime ideal theorem (8.5), ray-class count (8.7) and abelian Chebotarev (8.8). `Suggested.lean` states the eleven that are statable: convexity for primitive Dirichlet characters; general and ζ Hadamard; ζ and Dirichlet zero-free regions; ζ and primitive-Dirichlet counting; truncated and Weil formulas for ζ; prime ideals over any number field; progressions over ℚ. The docstring names the absent carriers for the rest (continued `ζ_K` and Hecke completions, ray class groups, Artin symbol, Frobenius counts), which I confirmed are absent at the pins: Tau Ceti `e8af08d0` has no `NumberTheory/Chebotarev`, `Global/RayClass` or `ArtinSymbol` module, and Mathlib's `NumberField.dedekindZeta` is the series. No statable headline is missing and none is forced through a stand-in.

### Previous findings, checked first

| Previous finding | Passage at this head and verdict |
|---|---|
| R01 (P1) wrong Tau Ceti pin in supplier contracts | Lines 194–245: the Tau Ceti section keeps only the eight contour declarations (all present at `e8af08d0`: `Analysis/Contour/PiecewiseC1On.lean`, `Winding/Number/Basic.lean`, `NullHomologous.lean`, `Argument/Cycle.lean`, `Residue/LogDeriv.lean`, `LogDerivFTC.lean`, `Argument/Lift.lean`); new sections "From TauCetiRoadmap.ArithmeticDirichletSeries", "…GlobalNumberFields", "…NumberFieldArithmetic", "…Chebotarev" cite roadmap sections "rather than declarations of the Tau Ceti pin". Every cited section and name resolved (table below). **Repaired.** |
| R02 (P1) completed half-plane growth | 3.5, "There is no completed bound uniform in unbounded real part"; the bound is now on `[1+δ, b]` with constants depending on `b`, and the Checks carry `Λ(2m)` and `‖Λ(2m+2i)‖ ≈ 3.67680, 13519751.81`, both recomputed. **Repaired.** |
| R03 (P1) finite order used before proved | New 3.1 proves `‖Λ₀(s)‖ ≤ exp(C(1+‖s‖) log(2+‖s‖))` from the split Mellin integrals with the named kernels; 3.2 "edge bounds alone do not imply finite order"; 3.4 takes *IsFiniteOrder* as a hypothesis; Layer 0 now says "Section 3.5 proves the finite-order implication after the gamma and convexity inputs". **Repaired**; the route is checked in the table. |
| R04 (P2) zero clearing polynomial | 3.4, "with `P ≠ 0` … Every clause below assumes `P ≠ 0`", plus the Check at `P = 0, 1, X − 2`. **Repaired.** |
| R05 (P3) reciprocal-gamma ray | Layer 0 and 1.6 Checks use the subsequences `−n−1/2` and `−2n−1` with the values recomputed below. **Repaired.** |
| R06 (P3) shift of the argument lift | 7.3, "its variation remains `(b + 2π) − (a + 2π) = b − a`, and *S* is unchanged". **Repaired.** |
| R07 (P3) locators and per-definition API | *IsFiniteOrder* has three API bullets and four Checks; DLMF equation locators at 1.2–1.5; 6.5 consumes `meromorphicOrderAt_dedekindZetaC_one_add` and `_one` with its own Checks; 7.6 cites Theorem 9.4, p. 214; "4.11"→"4.6", "4.7"→"4.4"; 8.7 has the exceptional-term Checks. **Repaired.** |

### Computed adversarial pass

Every row records the values computed on each side. An asterisk marks a seeded target; the eleven Lean headlines are included. Rows unchanged from the previous review were recomputed, not copied.

| Statement | Instances | Values on each side / competing model | Result; change |
|---|---|---|---|
| Layer 0 `OrderLE` | `exp z²`, `exp z`, `1−z`, constant 1 | log norms `r², r, log r+O(1), 0` against `r^{A'}`; `exp(r²)/exp(r^{3/2}) → ∞`, `exp r/exp(r^{3/4}) → ∞` | Agrees |
| Layer 0 reciprocal gamma Check | `n = 3, 10` | `|1/Γ(−n−1/2)| = 3.70249, 3787704.0`; `Γ(n+3/2)/π` identical; `1/Γ(−n) = 0` | Agrees (DLMF 5.5.3 at `dlmf line 141–145`) |
| Entire completion at ζ | `s = 0, 1` | `s(s−1)Λ₀ + 1 = 1, 1`; raw `s(s−1)Λ = 0, 0` | Agrees |
| Completion symmetry | `s ↦ 1−s` | `s(s−1)` invariant; `completedRiemannZeta₀_one_sub` at `RiemannZeta.lean:100` | Agrees |
| *IsFiniteOrder* API (new) | sum `exp z − exp z`, product `exp z·exp z`, pullback `exp(2s+1)` | `0`; `exp(2z)` log norm `2r`; log norm `2r+1` at `s = r` | Agrees |
| *IsFiniteOrder* converse needs `a ≠ 0` (new) | `F = exp(exp z)`, `a = b = 0` | pullback constant `e`, finite order; `F` has `log log|F(r)| = r` | Agrees; hypothesis necessary |
| *HasVerticalStripGrowth* Checks (new) | constant 1; `exp(−s²)` on `[0,1]` | `C = 1, A = 0, T₀ = 0`; at `it` norm `exp(t²)` beats every `C(1+|t|)^A` | Agrees |
| Strip growth sum/product API (new) | two functions with exponents `A, B` | sum bounded by `(C₁+C₂)(1+|t|)^{max}`; product by `C₁C₂(1+|t|)^{A+B}` | Agrees |
| 1.1 branch normalization | `s = 2, 3` | `logGamma 2 = 0`; `log Γ(3) = 0.693147 = log 2` | Agrees |
| 1.2* Stirling on the sector | DLMF 5.11.1 (`dlmf line 104–108`), §5.11(ii) (`line 526, 563–568`) | sector `|ph z| ≤ π−δ`; remainder bounded by `sec^{2n}(½ ph z)` times first neglected term | Agrees; uniform constant depends on `δ` as stated |
| 1.3 vertical strip | `σ = 1/2`, `t = 50, 200` | `log‖Gammaℝ(σ+it)‖ − (−πt/4 + ((σ−1)/2) log t) = 0.80606, 0.80604` | Agrees: bounded remainder, `O(1/t)` difference `2·10⁻⁵` |
| 1.4 log derivatives | `Gammaℂ` at 1 | `digamma 1 − log 2π = −γ_E − log 2π`; `log π` version differs by `log 2` | Agrees |
| 1.5 record gamma growth | `gammaR = {0}`; `{0,1}` | rates `π|t|/4`, `π|t|/2`; coefficient `(σ−1)/2`, `σ−1/2` | Agrees with 5.11.9 (`dlmf line 490–524`, "bounded real values of x") |
| 1.6* reciprocal factor at ζ (new Check) | `n = 3` | `|1/Gammaℝ(−7)| = 0.0673705 = π^{−9/2}Γ(9/2)`; at `−2n` value `0` | Agrees |
| 1.6* continued L at ζ | `s = 0, −2, 2` | `ζ(0) = −1/2` vs raw quotient `0`; orders `(Λ,γ,L) = (0,−1,1)` at `−2`; `Λ/Γℝ = (π/6)/(1/π) = π²/6` | Agrees |
| 1.6* functional-equation exclusions | `F = 1/((s−2)(s+1))` with assigned values `1, 0` | pointwise equation at `2` reads `0 = 1`; both polar exclusions needed | Agrees |
| 2 conductor | ζ at `1/2`; `gammaR = {i}` at `t = 0, −1` | `7/2`; factors `4, 3` while `|t|` grows | Agrees |
| 2.4 newform | `k = 2, N = 11, s = 1/2` | `11·4·5 = 220`; shifts `(k−1)/2, (k+1)/2` as ModularForms README | Agrees |
| 3.1* gamma-integral identity (new) | `R = 2, c = 1/2, α = 1/2` | `∫_1^∞ u^R e^{−cu^α} du/u = 191.66`; bound `c^{−(R+1)/α}Γ((R+1)/α)/α = 15360` | Agrees (inequality) |
| 3.1* Check 1 (new) | `R = 0, c = α = 1` | `E₁(1) = 0.21938 < e^{−1} = 0.36788 < Γ(1) = 1`; `Γ(R/α)` would be `Γ(0)` | Agrees |
| 3.1* Check 2 (new) | `m = 5, 10` | `s(s−1)Λ(s)` at `2m`: `7.0654, 1472.48`; formula `(2m)(2m−1)π^{−m}(m−1)!ζ(2m)` identical; logs `1.955, 7.295` against `m log m = 8.05, 23.0` | Agrees with `m log m + O(m)` |
| 3.1* Check 3 (new) | `g = exp(sin πs)` at `3i, 1+3i, 1/2+3i` | log norms `0, 7.6·10⁻¹³, 6195.82 = cosh 3π` | Agrees; edge bounds give no order |
| 3.1* route inputs | kernels and laws | `completedPartialZeta_eq_mellin` at `s/2` (LFunctions:1245), decay `exp(−c u^{1/n})` (:1255), inversion (:1278), continuity (:1270), class sum (:1175); Hecke total kernel (:2390), constant (:2398), continuity (:2425), decay (:2432), inversion with root number and inverse character (:2447), `completedHeckeLFunction_eq_mellin` at `(s + Tr p/n)/2` (:2550); inverted fundamental domain `IsUnitFundamentalDomain.inv` (:875) | All resolve; shifts as stated |
| 3.1* polar terms | ζ_K kernel | `∫_1^∞ (v^{1/2}b₀ − a₀)v^{−s/2}dv/v = 2b₀/(s−1) − 2a₀/s` | Poles at `0, 1` only; cleared by `s(s−1)` |
| 3.2 PL growth hypothesis (new) | `A = 5`, `s = 1/2+10i`, `c = 1/10`, `B = 1` | `(1+‖s‖)^5 = 1.6·10⁵` is `O(exp(B exp(c|t|)))` for every fixed `c`; pinned theorem wants `c < π/(b−a)` (`PhragmenLindelof.lean:275`) | Agrees |
| 3.3 edge exponent | real shift `μ`, left edge `σ = −δ` | gamma-power difference `(1+δ+Re μ−1)/2 − (−δ+Re μ−1)/2 = 1/2+δ` | Agrees |
| 3.4* clearing orders (new Check) | character mod 4 at `s = 2`, `P = 0, 1, X−2` | left orders `⊤, 0, 1`; right `rootMultiplicity + 0 = 0, 0, 1`; `rootMultiplicity_zero` at `Div.lean:535` | `P = 0` excluded; agrees |
| 3.4* interpolation exponent | `σ = −δ, 1/2, 1+δ` | `(1/2+δ)(1+δ−σ)/(1+2δ) = 1/2+δ, 1/4+δ/2, 0` | Agrees |
| 3.4* central line from pole-cleared bound | ζ, `P = X−1` | bound carries `(1+|t|)^1`; `|P(1/2+it)| ≥ (1+|t|)/2`, so division cancels it with constant from the line-to-pole distance `1/2` | Agrees with the stated constant dependence |
| 3.4* convexity Lean | `q = 1, t = 0, ε` | `|ζ(1/2)| ≈ 1.4604`; scale `3^{1/4+ε} ≥ 1.316` | No contradiction; `C` absorbs |
| 3.5 half-plane (new) | ζ at `2m`, `2m+2i`, `m = 10, 20` | `π^{−m}(m−1)! = 3.875, 1.387·10⁷`; `‖Λ(2m+2i)‖ = 3.67680, 13519751.81` (via `|Γ(m+i)|² = (π/sinh π)∏(k²+1)`) | Agrees; no half-plane bound |
| 3.5 uncompleted half-plane | ζ, `σ ≥ 2` | `|ζ| ≤ ζ(2) = 1.6449` | Agrees |
| 3.5 margin | poles at `±5i, 1±5i` | `T₀ = 6` margin `1`; `T₀ = 5` unbounded as `σ → 1` | Agrees |
| 4.1 two counts | `z(z−1)`, `z/(z−1)` on `closedBall 0 2` | `(zeroCount, divisorCount) = (2,2), (1,0)` | Agrees |
| 4.1 zero function | `f = 0` | orders `⊤`, divisor `0`, counts `0` (`Divisor.lean:39` junk) | Agrees |
| 4.2* record divisor | ζ record | `div Λ = −1` at `0, 1`; `polarOrder = 1`; sum `0`; `exact_pole_order` at LFunctions:186 | Agrees |
| 4.2* generic record | record with `polarOrder` support `{2, −1}` (1.6 example) | divisor of `P·Λ` extension `0` at both; off support `div Λ ≥ 0` | Agrees |
| 4.3 Jensen | `z`, `r = 1/4, R = 1/2, M = 1`; `1−z/2`, `r = 1, R = 3/2, M = 2` | trailing form `1 + log 2/log 2 = 2 ≥ 1`; naive `0` false; `log 2/log 1.5 = 1.7095 ≥ 0` | Agrees |
| 4.4 base point | ζ at 2 | `|ζ(2)| ≥ 1/ζ(2) = 0.608` | Agrees |
| 4.5 counts | ζ, `T = 14, 15, 100` | `0, 1, 29`; symmetric `58` | Agrees (classical controls) |
| 4.6 Nevanlinna | `z`, `1/z`, `z²` at `r = 2, R = 4` | `log 2 = log 4 − log 2`; signed gives `0 ≤ −log 2` false; `2 log 2` | Agrees |
| 5.2 elementary factor | `z = −1/2` | `|E₁ − 1| = 0.090204 ≤ 0.125 = ½ z²`; genus 0 gives `0.5` | Agrees |
| 5.3 canonical product | `cos z`; `exp`; `1−z` | paired zeros, `∑ 1/((k+½)²π²) = 1/2 … ` convergent; empty product `1`; single factor `E₁` | Agrees; `TendstoLocallyUniformlyOn.differentiableOn` at `LocallyUniformLimit.lean:136` |
| 5.4 entire logarithm | `g = e^{2z}`, `g = z` | `h = 2z + 2πik`; `g(0) = 0` has no `exp h` | Agrees |
| 5.5 Hadamard Lean | `1−z`, `e^{cz}`, constant 2 | `(a,b) = (0,−1), (0,c), (log 2, 0)`; factor at `ρ = 0` is `(1−0)·exp 0 = 1` since `m_0 = 0` | Agrees |
| 5.5 at a zero | `f = 1−z`, `s = 1` | both sides `0`; `HasProd` with a zero factor holds | Agrees |
| 5.6 positivity | `ρ = 1/2+i`, `s = 2` | `Re 1/(s−ρ) = 6/13 > 0` | Agrees |
| 5.6 reality needed | `exp(cz)`, real `c` | no zeros, `b = c ≠ 0` | Family hypothesis retained |
| 6.1 positivity | `θ = 0, π, π/2` | `3+4cos θ+cos 2θ = 8, 0, 2 = 2(1+cos θ)²` | Agrees |
| 6.2* cap | `c = log 3/2`, `t = 0`, `q = 1` | `1 − c/log 3 = 0.5` | Agrees |
| 6.2* Kadiri | `kadiri2012 lines 79–85` | `d_K` sufficiently large; region (1.7) for `|Im s| ≥ 1`; at most one zero, simple and real, for `|Im s| ≤ 1` | README statement matches; "passage to all fields" correctly assigned to 6.4e |
| 6.2* zeta Lean | `s = 2; 1; −2` | `ζ(2) ≠ 0`; `1` excluded; `−2` outside region since `1 − c/log 5 ≥ 0.32 > −2` | Agrees |
| 6.3 predicate | `β = 1`; non-real χ; `β = 1/2` | excluded by `β < 1`; empty by reality; qualifies only with positive divisor | Agrees |
| 6.4* explicit formula | `kadiri2012 lines 230–237` | `−Re ζ'_K/ζ_K = −∑ Re 1/(s−ρ) + ½ log d_K + Re 1/s + Re 1/(s−1) + Re γ'_K/γ_K` | 6.4d matches, pole terms for the trivial character only |
| 6.4* trivial character | ζ, `σ = 1+u`, `t = 0` | `−ζ'/ζ = 1/u + O(1)`; nontrivial bound bounded | Restriction correct |
| 6.4* reality split | `χ² = 1`; quartic mod 5 | `χ(2) = i`, `i² = −1` | Agrees both directions |
| 6.4* imprimitive factor | `1 − w N𝔭^{−s}`, `‖w‖ = 1` | zero iff `N𝔭^{−Re s} = 1` iff `Re s = 0` | Agrees |
| 6.4* Dirichlet Lean | `q = 2` principal; induced χ from `χ*` mod `q* ≤ q` | `L = (1−2^{−s})ζ`, zero at `0` outside region (`≥ 1/2`); region for `q` ⊆ region for `q*`; `χ² = 1 ⟺ χ*² = 1` | Agrees |
| 6.5* edges | odd χ mod 4 at 1; ζ at `1+2i`; trivial at 1 | `2·Gammaℝ(2)·L(1) = 2·0.31831·0.78540 = 0.5`; order `0` (LFunctions:2688, `t ≠ 0`); order `−1` (LFunctions:977) | Agrees; nontrivial theorem (:2680) needs `χ.character ≠ 1` as stated |
| 7.1* rectangle | unit square at `1/2+i/2`, `2`; degenerate width 0 | windings `1, 0`, clockwise `−1`; retraced segment winding `0` | Agrees |
| 7.1* first edge | `rectBoundary R 1` | `σ₂ + it₁` | Agrees |
| 7.2 argument principle | `z`, `z−2`, `1/z` on `[−1,1]²` | normalized integrals `1, 0, −1`; sum over all of `S` would give `1` for `z−2` | Agrees |
| 7.3* vertical argument | ζ on `Re s = 2` | `Re ζ(2+it) ≥ 2 − ζ(2) = 0.3551 > 0` | Agrees |
| 7.3* small height | `T → 0⁺` | `N = 0`, `θ(0) = 0`, `S → −1`; `0 = 0 + 1 − 1` | Agrees with Titchmarsh §9.3 convention (`titchmarsh1986 lines 6944–6949`) |
| 7.3* lift shift (new) | `+2π` | `(b+2π) − (a+2π) = b − a`; constant positive path variation `0` | Agrees |
| 7.4* RvM Lean | `T = 2` | count `0`; main term `−0.682689`; `C ≥ 0.98491` | Agrees (inequality) |
| 7.4* boundary heights | zero at `h` | `N` jumps by `1`; main term moves `O(η log T)` over length `η` | Agrees; Titchmarsh counts `0 < t ≤ T` (`line 6918–6919`) as `Ioc 0 T` |
| 7.5* Dirichlet Lean | `q = 1`; Trudgian Thm 1 | symmetric main `(T/π) log(T/2πe)` is twice the ζ main; Trudgian `(T/π) log(kT/2πe)`, `T ≥ 1`, primitive nonprincipal (`trudgian2015 lines 19–22`) | Agrees; principal case is `completedLFunction_modOne_eq` (`DirichletContinuation.lean:232`) |
| 7.5* Dedekind | imaginary quadratic | `(T/π) log(|D|(T/2πe)²)` equals ζ main plus `L(χ_D)` main; halved conductor short by `(T/2π) log|D|`; Trudgian Thm 2 (`lines 25–27`) | Agrees |
| 7.5* confinement | `ζ(s)(1+5·2^{−s}+2·4^{−s})` | roots `u = (−5±√17)/4`, real parts `≈ 2.19, −1.19` | Confinement hypothesis needed |
| 7.6* density and mean increment (new) | main `aT log T + bT` | `N/(T log T) → a = n/2π`; `∫_0^T (N(t+1)−N(t))dt = ∫_T^{T+1}N − ∫_0^1 N`, leading `(n/2π)T log T`, lower integral constant | Agrees; Titchmarsh (9.4.4) at `lines 7028–7036` |
| 8.1 Perron endpoint | `x = c = T = 1` | `arctan(1)/π = 0.25` | Agrees; ADS theorem hypotheses `0 < x, 0 < c, 0 ≤ T, LSeriesSummable f c` (`Suggested.lean:1087`) |
| 8.2 residues | ζ at 1; zero ρ; origin, unit rank `r` | `+x`; `−x^ρ/ρ`; `c_K − r log x` | Agrees |
| 8.3 truncated Lean | `x = T = 2` | `ψ = 0.693147`; right side `0.305964`; discrepancy `0.387183 ≤ C·0.480453` | Agrees for `C ≥ 0.806` |
| 8.3 trivial zeros | `K = ℚ`, `x = 2`; `r₂ = 1` | `∑ 2^{−2m}/(2m) = 0.143841`; odd series `log 3/2 = 0.549306` | Agrees |
| 8.4* Weil derivation | shift of `(2πi)⁻¹∫_{(2)} (Λ'/Λ) φ̃` to `Re s = −1` and reflection | residues `m_ρφ̃(ρ)`, `−φ̃(0)−φ̃(1)`; reflected integral `−(2πi)⁻¹∫_{(2)}Λ'/Λ(w)φ̃(1−w)dw`; prime terms by inversion at `y = n` and `y = 1/n` giving `φ(n) + φ(1/n)/n`; `ds = i dt` gives `(2π)⁻¹` | Lean statement reproduced sign by sign |
| 8.4* test class | `φ = 0`; `ContDiff ℝ ⊤` | all terms `0`; analytic compactly supported ⟹ `0` | Agrees |
| 8.4* divisor sign | nonnegative `φ`, `K = ℚ` | `P = φ̃(0)+φ̃(1) > 0`; signed divisor fails by `P` | Agrees |
| 8.4* gamma constant | `φ(1) = 1` | `−(log π)/2` twice gives `−log π` | Agrees |
| 8.5 prime ideals Lean | `K = ℚ`, `x = 2` | count `1`; `Li 2 = 0`; asymptotic `=O[atTop]` | Agrees |
| 8.6 conjugate term | quartic mod 5, `φ(1/2) = 1` | `−(i log 2)/2`; wrong spelling `+(i log 2)/2` | Agrees |
| 8.7 coefficient | `ℚ`, modulus `3∞` | prime coefficient `1/2`; ideal coefficient `(1/2)(1−1/3) = 1/3` (GNF:314) | Agrees |
| 8.7 exceptional Checks (new) | `β = 3/4`, `x = 2^{4/3}` | `x^β = 2`, `Li 2 = 0`; weighted `2/β = 2.6667` over `#Cl` | Agrees |
| 8.7 trivial character (new) | only trivial `ψ` exceptional | `Re ψ(c) = 1` for every class; omission gives `0` | Agrees |
| 8.7 progressions Lean | `q = 1`; `q = 4, a = 3` | totients `1, 2`; coefficients `1, 1/2`; `primesBelow(⌊x⌋+1)` are primes `≤ x` | Agrees |
| 8.8 dictionary | `C₄ → C₂`; abelian → `S₃` | fibre density `1/2`; commutators force abelian image | Agrees |
| 8.8 vs ray-class sum | unramified primes dividing `𝔪` | present in `frobeniusPsi`, absent in `rayClassPsi`; contribution `≤ log x` each, finitely many | Absorbed, as 8.7 states |
| 8.9* integration by parts (new) | `x = 1000` | `Li = 176.56450`; `x/log x − 2/log 2 + ∫_2^x dt/log² t = 176.56450` | Agrees |
| 8.9* two-term (new) | `x = 10⁶` | `(Li − x/log x)/(x/log² x) = 1.19`, decreasing toward `1` | Agrees with `∼` |
| 8.9* insufficiency of `x/log x` | `log x = u²` | `(x/log² x)/(x e^{−cu}) = e^{cu}/u⁴ → ∞` (at `x = 10²⁰`, `c = 1`: `0.42`, still rising) | Agrees |
| 9 certificates | two simple zeros, `ms = [1,1]`; drop a box | `2 = 2`; `1 ≠ 2` | Agrees |
| 9 boundary | completed ζ on `[0,1]×[−1,1]` | orders `−1` at `0, 1` on the boundary; entire completion admits `Bs = []` | Agrees |
| 9 GRH bridge | ζ at `−2, 0, 1` | completed divisor `0, −1, −1`; `RiemannHypothesis` at `RiemannZeta.lean:185` | Agrees |

### Pinned declarations opened

Mathlib `05ae0103`, paths under `Mathlib/`: `Analysis/Meromorphic/Order.lean:459` (`meromorphicOrderAt_mul`, meromorphy of both factors), `:784`; `Analysis/Meromorphic/Divisor.lean:39`, `:417`; `Analysis/Meromorphic/FactorizedRational.lean:296`; `Analysis/Meromorphic/TrailingCoefficient.lean:36`; `NumberTheory/LSeries/AbstractFuncEq.lean:80` (`WeakFEPair`), `:376` (`Λ₀ = mellin f_modif`), `:379` (`Λ = Λ₀ − f₀/s − ε g₀/(k−s)`); `Analysis/Complex/LocallyUniformLimit.lean:136`; `MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean:142` in `namespace intervalIntegral`; `Algebra/Polynomial/Div.lean:535`; `Analysis/Complex/PhragmenLindelof.lean:275` (growth `exp(B exp(c|Im z|))`, `c < π/(b−a)`, needed only for large `|Im z|`); `Analysis/Complex/Liouville.lean:114`; `Analysis/Complex/BorelCaratheodory.lean:86` and the general form named in its header; `Analysis/Complex/JensenFormula.lean:309`, `:391`; `Analysis/Complex/ValueDistribution/LogCounting/Basic.lean:329`, `:580`; `Analysis/Complex/BranchLogRoot.lean:37`; `Analysis/Complex/RemovableSingularity.lean:101`; `Topology/LocallyFinsupp.lean:106`, `:496`; `Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`; `Analysis/SpecialFunctions/Log/Summable.lean:215`; `Analysis/Calculus/LogDerivUniformlyOn.lean:24`; `Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:94`, `:229`; `Analysis/SpecialFunctions/Gamma/Deligne.lean:73`, `:89`, `:97`, `:122`; `Gamma/Beta.lean:427`, `:522`; `Gamma/Digamma.lean:39`; `NumberTheory/LSeries/Nonvanishing.lean:308`, `:398` (`χ ≠ 1 ∨ s ≠ 1`), `:411`; `NumberTheory/LSeries/RiemannZeta.lean:100`, `:154`, `:185`; `NumberTheory/LSeries/ZetaZeros.lean:35`, `:62`, `:66`; `NumberTheory/LSeries/DirichletContinuation.lean:224` (`completedLFunction χ := ZMod.completedLFunction χ`), `:232`; `Analysis/MellinInversion.lean:92`; `NumberTheory/NumberField/DedekindZeta.lean:54`; `NumberTheory/Chebyshev.lean:74`. Tau Ceti `e8af08d0`: the eight contour declarations listed under R01 above, each in the file the README names.

### Supplier resolution and ownership by object

| Citation | Resolved at |
|---|---|
| LFunctions Layer 0 record, predicates, duals, translation | `TauCetiRoadmap/LFunctions/Suggested.lean:117`, `:186`, `:188`, `:202`, `:216`, `:266` on main `fa41b374`; the sixteen "found nowhere" leads of the citations file are declarations of this roadmap, not of the pinned libraries |
| LFunctions Layer 3 Dedekind and Mellin kernels | `:977`, `:1004`, `:1175`, `:1223`, `:1234`, `:1245`, `:1255`, `:1270`, `:1278`, `:875` |
| LFunctions Layers 4–6 | `:1462`, `:1576`, `:1607`, `:1620`, `:1632`, `:1648`, `:1656`, `:1661`, `:1670`, `:1680`, `:2390`, `:2398`, `:2425`, `:2432`, `:2447`, `:2468`, `:2550` |
| LFunctions Layers 7–8 | `:2680` (needs `χ.character ≠ 1`), `:2685`, `:2688` (`t ≠ 0`), `:2819`, `:2827`; section comments at `:2676`, `:2815` confirm the layers |
| Arithmetic Dirichlet Series §§2.3, 6.1–6.4, Layers 3, 5, 9–10 | `Completed/ArithmeticDirichletSeries/README.md:181`, `:258–275`; `Suggested.lean:568`, `:611`, `:923`, `:1006`, `:1045` (`logIntegral` body by `rfl`), `:1047`, `:1073`, `:1087`, `:1095`, `:1112`, `:1441`, `:1586` (R01 on the one wrong name) |
| Global Number Fields Layers 2, 3E, 9 | `Completed/GlobalNumberFields/README.md:279`, `:393`, `:508`; `Suggested.lean:43`, `:52`, `:128`, `:143`, `:155`, `:165`, `:304–318`, `:338` |
| Number Field Arithmetic §2.3 | `Completed/NumberFieldArithmetic/README.md:647`; `Suggested.lean:630–647` (`NumberField.artinSymbol 𝔭 hur`) |
| Chebotarev Layers 2, 11, 13–14 | `Completed/Chebotarev/README.md:175`, `:425`, `:593`, `:612`; `Suggested.lean:249`, `:1134`, `:1181`, `:1186`, `:1427`, `:1432`, `:1469` (namespace `NumberField.Chebotarev` opened at `:144`) |
| Class Field Theory Layer 12 | `TauCetiRoadmap/ClassFieldTheory/README.md:1724`; `Suggested.lean:3730`, `:3742`, `:3756`, with `IsAdmissibleModulus` and the unramified hypotheses |
| ModularForms Layer 7 conductor | shifts `(k−1)/2, (k+1)/2`, as 2.4 |

Ownership by object: `roadmaps grep` over the 439 open pull requests and main for Hadamard factorization, zero-free regions, the Riemann–von Mangoldt formula and the Weil formula finds consumers only: AnalyticNumberTheoryPartI (#1126, merge order 81) imports this roadmap's Layers 0–8 by section; AutomorphicLFunctionsAndLocalFactors (#924, order 77) cites Layer 0 and 5.1–5.6 as its supplier; GlobalHolomorphicFunctions at its supplied head assigns the genus-one factor and order-one products here (`README.md:23`, `:29`, `:135`); ComputationalNumberTheory consumes `zeroCount` and the rectangle localization; ArtinRepresentations (#1711) excludes zero-free regions from its scope. On main, ArithmeticDirichletSeries, Chebotarev and LFunctions each state that zero-free regions, counting and the explicit formula are not theirs. No `Suggested.lean` in the supplied sibling collection declares a `TauCetiRoadmap.ZerosOfLFunctions` name. Open pull requests whose files the brief does not supply were searched only through the service's index, not inspected. One observation for a downstream author, not a finding here: AnalyticNumberTheoryPartI cites "ZerosOfLFunctions 3.3–3.4" for order one and "4.5–4.8", "5.2–5.7", which after this head's renumbering are 3.1 and 3.4, 4.5–4.6 and 5.2–5.6.

### Seeded source sample

| Target | Text at its locator | Result |
|---|---|---|
| 1.2 | DLMF 5.11.1, `dlmf line 104–108`; §5.11(ii), `line 526`, `563–568` | Sector and remainder bounds support the uniform statement; implied constant depends on `δ` through `sec(½ ph z)` |
| 1.6 | DLMF 5.5.3, `dlmf line 141–145`; values recomputed | Supports both Checks |
| 3.1 | No textbook claimed; LFunctions kernels and Mathlib `WeakFEPair` as listed; identity checked numerically and by the substitution `v = c u^α` | Route sound as a growth adapter |
| 3.4 | Titchmarsh §5.1, `titchmarsh1986 lines 3123–3140` (finite order, order problem); Iwaniec–Kowalski §5.2 unavailable; Mathlib `PhragmenLindelof.lean:275` | Interpolation exponent and growth hypothesis verified; book page not certified |
| 4.2 | LFunctions `exact_pole_order`, `regular_away` (`:186–188`) | Divisor arithmetic verified at ζ and at the 1.6 example record |
| 6.2 | Kadiri Theorem 1.1, `kadiri2012 lines 79–85`, preprint pp. 2–3 | Hypothesis `d_K` large and the two regions are as the README says |
| 6.4 | Kadiri §2.1.2, `lines 230–237`, p. 5 | Explicit formula with `½ log d_K` and both pole terms as in 6.4d; no source claims the full Hecke statement, and the README says so |
| 6.5 | LFunctions `:2680`, `:2688`, `:977`; Mathlib `Nonvanishing.lean:398`, `:411` | Nontrivial and trivial cases now use the right declarations |
| 7.1 | Tau Ceti contour files at the pin | New geometry on those APIs; windings computed |
| 7.3 | Tau Ceti `Argument/Lift.lean`, `LogDerivFTC.lean`; Titchmarsh §9.3, `lines 6944–6949` | `S(T)` convention (path `2, 2+iT, 1/2+iT`, start `0`, `S(T+0)` at ordinates) matches |
| 7.4 | Titchmarsh §9.2 (`lines 6918–6919`), Theorem 9.4 (`lines 7020–7027`, printed p. 214) | Count over `0 < t ≤ T`; `N(T) = (T/2π) log T − (1+log 2π)T/2π + O(log T)`, which is the README's `(T/2π) log(T/2πe)` |
| 7.5 | Trudgian Theorems 1–2, `trudgian2015 lines 19–27` (Math. Comp. 84, 1439) | Primitive nonprincipal, `T ≥ 1`, `0 < β < 1`, main terms as stated; the conductor enters as `k`, not `k^{1/2}` |
| 7.6 | Titchmarsh after Theorem 9.4, `lines 7028–7036` | Leading density and (9.4.4); averaged increment is an elementary adapter, computed |
| 8.4 | Lang XVII §3 uncertified (paywalled); formula re-derived independently (table row) | Lean statement correct in every sign and normalization |
| 8.9 | ADS §6.2, `Completed/ArithmeticDirichletSeries/README.md:263–264`, `Suggested.lean:1045`, `:1047`; Mathlib `IntegrationByParts.lean:142` | Integration by parts verified numerically and symbolically |

## Not verifiable

- **Davenport, *Multiplicative Number Theory*, §§11–20** (`davenport2000`): the sources service returns `uncertified` (paywalled Springer DOI `10.1007/978-1-4757-5927-3`). The Hadamard, zero-free-region and explicit-formula attributions are cited by locator; the mathematics was checked independently above.
- **Lang, *Algebraic Number Theory*, XVII §3 Theorems 3.1–3.2, XV §§4–5** (`lang1994`): `uncertified` (paywalled DOI `10.1007/978-1-4612-0853-2`). The Weil formula was re-derived; Barner's test-class condition is not source-certified.
- **Iwaniec–Kowalski, *Analytic Number Theory*, §5.1 (5.7) and §5.2** (`iwaniec-kowalski2004`): no legal text (AMS landing page only); recorded in the scratch missing-reference list. The analytic-conductor normalization was checked against ModularForms Layer 7 instead.
- **Lagarias–Odlyzko (1977)** (`lagarias-odlyzko1977`): no legal text found; recorded in the same list. See R02.
- **Titchmarsh** was read from the cached copy the service holds from a university course page (`titchmarsh1986`); I cite its line numbers and printed pages but do not certify the copy's licence beyond the service's record.
- Finite instances do not prove the Hecke zero-free theorem, the conductor-uniform counts or the general Hadamard proof; the tabulated zeta counts are classical controls, not new numerics.

## Source issues

- none
