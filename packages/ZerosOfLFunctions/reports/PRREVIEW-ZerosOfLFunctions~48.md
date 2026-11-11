# Review of ZerosOfLFunctions (pull request #1913 at 820a878)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is a full review of the folder at `820a878`. That head merges main (`c110735`, which carries the direct Dirichlet interfaces of 6.4a) into the previously reviewed `ecaa5a7`. All three findings are P3, and two of them come from that merge. Nothing is blocking. The gate passes and the dependency check reports no problem. What was checked is listed under *Verified sound*.

## Previous findings

The previous review (at `ecaa5a7`) had no findings. The repair it recorded still holds at this head:

- the 8.6 clause cites `TauCeti.Contour.classicalResidueTheorem_nullHomologous`, `…logDeriv_eventuallyEq_principalPart` and `…residue_eq_of_tendsto_sub_mul` (README lines 2558–2560);
- Layer 8 (lines 2321–2885) cites 7.2 nowhere (0 occurrences).

## R01 (P3) — 4.2 carries two Checks lists for the same object, one of them before its *Needs:* line

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1283–1306. Line 1285: "For the `ζ` record and `U = ∅`, `divisor Λ U 1 = 0` while `−polarOrder 1 = −1`". Line 1297: "The `ζ` record, `polarOrder = single 0 1 + single 1 1`, with `U = ∅`: `divisor completedRiemannZeta ∅ 1 = 0`".

**Claim.** The merge kept main's **Checks.** list (lines 1283–1291, placed before *Needs:*) and the pull request's list (lines 1295–1306, after *Needs:*). Their first bullets test the same instance: the `ζ` record, `U = ∅`, the point `1`. Every other subsection has one list per defined object, after its *Needs:* line.

**Witness.** `git show --cc 820a878` marks lines 1283–1291 as main's (`+ `) and lines 1295–1306 as the pull request's (` +`). `ecaa5a7` had only the second list and main only the first.

**Repair.** Keep a single **Checks.** list after line 1293 (*Needs:*). Drop the bullet at line 1285, which duplicates line 1297. Keep:
- main's `U = univ` bullet (lines 1287–1289);
- main's nontrivial Dirichlet bullet (lines 1290–1291);
- the pull request's three bullets (lines 1297–1306).

Tested: the resulting list has five bullets and no instance appears twice. Its values are recomputed in the adversarial table (rows 4.2).

## R02 (P3) — The Tau Ceti contract omits two declarations that the layers consume

**Location.** README lines 344–351 (the `dirichletData` bullet) and 405–407 (the §6.2 logarithmic-integral bullet). The two names are cited at:
- line 2062, the 6.4a *Needs:* line: "`dirichletData_polarOrder`, `dirichletData_dual`";
- line 1957: "`dirichletData_hasFunctionalEquation` with `dirichletData_dual`";
- lines 2839 and 2848, in 8.9: "`TauCeti.Real.isLittleO_integral_inv_log_sq`".

**Claim.** "Exact supplier contracts" lists the declarations consumed, but neither name appears in lines 186–542. The merge dropped the second one: at `ecaa5a7` the contract listed `isLittleO_integral_inv_log_sq` (its line 470), and the merged §6.2 bullet takes main's wording, which lacks it. `dirichletData_dual` was already missing from main's contract.

**Witness.** Both exist at the Tau Ceti pin `2fd255d`:
- `TauCeti/Analysis/SpecialFunctions/LogIntegral.lean:321`: `(fun x ↦ ∫ t in 2..x, (log t ^ 2)⁻¹) =o[atTop] fun x ↦ x / log x`;
- `TauCeti/NumberTheory/LFunctions/Dirichlet/Basic.lean:122`: `(dirichletData χ hχ).dual = dirichletData χ⁻¹ hχ.inv`.

**Repair.**
- Add `dirichletData_dual` (the dual record is that of `χ⁻¹`) to the bullet at lines 344–351, after `dirichletData_polarOrder`.
- Add `TauCeti.Real.isLittleO_integral_inv_log_sq` (`∫_2^x (log t)^(−2) dt = o(x/log x)`, for 8.9) to the §6.2 bullet at lines 405–407.

Tested: I scanned every backticked name in Layers 0–9 that is declared at the Tau Ceti pin against lines 186–542. These two are the only Tau Ceti names missing from the contract.

## R03 (P3) — The pull-request description no longer matches the head after the merge

**Location.** The description. Its hand-written "What this changes" paragraph says: "Suggested.lean imports the Tau Ceti modules its statements use and adds eight theorems" and "`primeIdealCount_effective` and `primeCounting_progression_effective` are restated on Tau Ceti's prime count `TauCeti.primeCount`". The generated block `roadmap-summary` says: "Effective counts now use `TauCeti.primeCount`". Its sentence on Layers 6–8 presents five kinds of number-field headline as new.

**Claim.** None of this holds at `820a878`.
- Against main, `Suggested.lean` adds four theorems, not eight.
- `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_heckeLFunction`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian` are identical to main's.
- The effective counts are main's: `Set.ncard` of height-one primes (`Suggested.lean:395`) and `Nat.primesBelow … filter` (`Suggested.lean:468`).
- `TauCeti.primeCount` does not occur in `Suggested.lean`.

**Witness.** `git diff origin/main...HEAD -- TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` adds only four declarations: `riemannZeta_zeros_summable_ordinate`, `neg_re_logDeriv_riemannZeta_le`, `dedekindZeta_weilExplicitFormula` and `heckeLFunction_weilExplicitFormula`. The other 23 declarations have the same statements as main.

**Repair.**
- Rewrite "What this changes" to name those four theorems.
- Say there that the effective counts keep main's `Set.ncard` and `Nat.primesBelow` carriers. README 8.5 (lines 2479–2481) and 8.7 (lines 2705–2711) relate these to `TauCeti.primeCount`.
- Regenerate `roadmap-summary` so that among the Layer 6–8 headline statements only the Weil formulas are described as new, and drop "Effective counts now use `TauCeti.primeCount`".

Tested against the `git diff` above. The README already agrees with the Lean carriers, so only the description changes.

## Verified sound

### Gate, dependency check, elaboration

- **Gate, re-run at `820a878`:** `gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
  - The worker's run, which includes the targeted build, also reports `build=0`.
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - `PROGRESS.md` and `STATUS.md` in the folder are main's generated files, not changes of this pull request.
- **Dependency check:** `depcheck: 236 roadmaps, 2134 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
  - Every supplier is on main: LFunctions, ClassFieldTheory, and the completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev and ContourIntegration roadmaps.
  - AnalyticNumberTheoryPartI, ImaginaryQuadraticClassNumber and SpecialFunctionsEiLiErfIncompleteGamma are cited only as owners of excluded material or as consumers.
- **Elaboration:** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0` with 23 ``declaration uses `sorry` `` warnings, one per theorem, and nothing else.
- **Signatures:** a scratch file with `#check @n` for all 27 declarations elaborates with no error.
  - The file has no `variable` or `include` line, so no binder can be lost.
  - The elaborated types of `completed_orderLE_one` and `finite_zero_sum_le_logDeriv` match 6.4a: primitive `χ ≠ 1`, `S` in `0 < Re ρ < 1`, `1 < σ ≤ 2`, and the constant fixed before `S`, `q`, `χ` and `σ`.
- **Padding probe:** every `sorry` was replaced by `first | rfl | simp | infer_instance | norm_num | positivity` in a scratch copy. All 23 theorems still fail, so none is one-tactic padding.

### The merge

`git show --cc 820a878` has 13 README hunks that combine both parents. Apart from R01–R03, every combined hunk is coherent:
- the 6.4 paragraph and its *Needs:* line;
- the Layer 6 Dependencies;
- the 7.5 *Needs:* line;
- 8.4 now stated on `TauCeti.meromorphicContinuation 1 (NumberField.dedekindZeta K)`, which matches `dedekindZeta_weilExplicitFormula`;
- 8.5 and 8.7 stated on `Set.ncard` and `Nat.primesBelow`, which match the Lean; the 8.7 Check at line 2754 uses `Nat.Coprime 2 4`, as the Lean does;
- the 8.9 *Needs:* line;
- the References.

The merge dropped other contract names: `eulerCorrection_self`, `isAdmissibleModulus_abelianConductor` and the separate Arithmetic Dirichlet Series subsection. No layer cites `eulerCorrection_self` or `isAdmissibleModulus_abelianConductor`, and the layers' admissibility citation, `isAdmissibleModulus_iff_abelianConductor_dvd`, is in the contract. The subsection's names now sit in the Tau Ceti list.

Every Lean name of `Suggested.lean` occurs backticked in the README, and every backticked name of this roadmap's own in the README is declared there. `one_zero_le_logDeriv` and `bounded_level_zero_free` are README-only, written in italics.

### The seeded sample, at its locators

| Target | Locator in the README | Checked against | Result |
| --- | --- | --- | --- |
| 0.3 Finite order | Davenport §11 | uncertified; statement computed (rows 0.1/0.3) | statement sound; text not verifiable |
| 1.2 Stirling on the sector | DLMF 5.11.1, §5.11(ii) | `dlmf-5.11` lines 104–108: sector `\|ph z\| ≤ π − δ`; lines 563–569: remainder ≤ `sec^{2n}(½ ph z)` times first neglected term | supports it: with `n = 1` the bound is `1/(12‖s‖ sin²(δ/2))` on `S_δ` |
| 1.3 Vertical strips | DLMF 5.11.9 with remainder from 5.11.1 | `dlmf-5.11` lines 488–492 (`\|Γ(x+iy)\| ∼ √(2π)\|y\|^{x−1/2}e^{−π\|y\|/2}`) | supports the main term; the `O(1/\|t\|)` follows from 5.11.1 as computed (row 1.3) |
| 1.5 Gamma factor of a record | DLMF 5.11.9; L-functions Layer 0 | as above | supports it; `A(σ)` re-derived per factor |
| 1.6 Analytic reciprocal, `continuedL` | none (junk-value adapters) | Checks computed; `riemannZeta_zero` | sound |
| 2.5 The two families | L-functions Layers 3, 5 | LFunctions README line 795 (`dedekindZetaData` conductor `\|d_K\|`), line 317 (card conductor `\|d_K\| N(𝔣₀)`), line 1582 (odd character mod `4∞`: conductor `4`, shift `1`) | matches |
| 3.2 Phragmén–Lindelöf input | Mathlib `PhragmenLindelof.vertical_strip` | `Mathlib/Analysis/Complex/PhragmenLindelof.lean:275`: `DiffContOnCl` on the open strip, growth `O(exp(B exp(c\|Im z\|)))` with `c < π/(b − a)`, edges `≤ C` | the paraphrase matches the pin |
| 4.1 The two counts | Mathlib only | `LocallyFiniteSupport.finite_inter_support_of_isCompact` (`Topology/LocallyFinsupp.lean:108`), `MeromorphicOn.divisor_restrict` (`Analysis/Meromorphic/Divisor.lean:431`) | sound |
| 4.2 Zero divisor of a record | Mathlib `MeromorphicOn.divisor_def` | statement and both Checks lists computed | sound; R01 is shape only |
| 4.5 Counting functions | Titchmarsh Theorem 9.2 (`K = ℚ`) | not readable (see below) | `N(14) = 0`, `N(15) = 1`, `N(100) = 29` computed |
| 5.1 Zeros of finite order | from 4.3 | `AnalyticOnNhd.sum_divisor_le` (`Analysis/Complex/JensenFormula.lean:389`: `0 < \|r\| < \|R\|`, `1 ≤ M`, `f c ≠ 0`) | sound |
| 5.3 Canonical product | Davenport §11 | uncertified; `Summable.multipliableLocallyUniformlyOn_one_add` (`Analysis/Normed/Module/MultipliableUniformlyOn.lean:137`), `tprod_one_add_ne_zero_of_summable` (`Analysis/SpecialFunctions/Log/Summable.lean:214`) | sound; `cos` product computed |
| 6.2 Region for `ζ_K` | Kadiri Theorem 1.1 | `kadiri2012` lines 79–82 (p. 2: (1.7) no zero for `\|Im s\| ≥ 1`, (1.8) at most one for `\|Im s\| ≤ 1`, `d_K` large), line 85 (p. 3: real and simple) | supports it; small discriminants are handled by 6.4e |
| 7.4 Riemann–von Mangoldt for `ζ` | Titchmarsh §§9.2–9.4, Theorem 9.4 | not readable | `N(100) = 29` against `28.127` computed |
| 8.3 Truncated formula | Davenport §17 | uncertified | `K = ℚ` instance computed (row 8.3) |

Other locators the merged text cites, all verified:
- Montgomery–Vaughan Theorem 10.16, p. 351 (`montgomery-vaughan2006` lines 1261–1268) and Corollary 10.18, (10.37)–(10.38), p. 352 (lines 1315–1328). Primitive `χ` mod `q > 1`, as 6.4a says.
- Hasanalizade–Shen–Wong Theorem 1.1, p. 2 (`hasanalizade2022` lines 52–54, and line 27 for `N_K(T)` over `0 < β < 1`, `|γ| ≤ T`).
- Bennett–Martin–O'Bryant–Rechnitzer Corollary 1.2 (`bennett2021` lines 83–84: `min{0.247 log qT + 6.894, 0.298 log qT + 4.358}`).
- Kadiri (1.5)–(1.6) (`kadiri2012` lines 65–73).
- DLMF:
  - 5.4.13 (`dlmf-5.4` lines 428–431) and 5.4.15 (lines 490–492);
  - 5.5.2 (`dlmf-5.5` lines 100–102) and 5.5.3 (lines 141–143);
  - 5.15.1 (`dlmf-5.15` lines 64–66);
  - 5.6.6 (the cached DLMF §5.6 text, lines 264–266).

### Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)

- **Mathlib, gamma and digamma:**
  - `Complex.digamma_one_half` (`Analysis/SpecialFunctions/Gamma/Digamma.lean:59`), `digamma_apply_add_one` (`:64`), `digamma_one_sub` (`:94`), `digamma_two_mul` (`:124`);
  - `Real.convexOn_log_Gamma` (`Gamma/BohrMollerup.lean:111`);
  - `Complex.Gammaℝ_ne_zero_of_re_pos` (`Gamma/Deligne.lean:69`), `Gammaℝ_eq_zero_iff` (`:76`), `differentiable_Gammaℝ_inv` (`:112`).
- **Mathlib, zeta:** `differentiableAt_completedZeta` (`NumberTheory/LSeries/RiemannZeta.lean:94`), `logDeriv_riemannZeta_one_sub` (`RiemannZetaLogDeriv.lean:35`).
- **Mathlib, complex analysis:** `logDeriv_tprod_eq_tsum` (`Analysis/Calculus/LogDerivUniformlyOn.lean:24`), `Complex.borelCaratheodory` (`Analysis/Complex/BorelCaratheodory.lean:109`), `MeromorphicOn.circleAverage_log_norm` (`JensenFormula.lean:307`), and the five listed in the sample table.
- **Tau Ceti, Dirichlet record** (`NumberTheory/LFunctions/Dirichlet/Basic.lean`): `dirichletData` (`:38`), `_conductor` (`:66`), `_gammaR` (`:72`), `_completed` (`:82`), `_polarOrder` (`:86`), `_dual` (`:122`), `_hasDirichletAgreement` (`:147`), `_hasMeromorphicContinuation` (`:160`), `_hasFunctionalEquation` (`:178`).
- **Tau Ceti, other:**
  - `TauCeti.Real.isLittleO_integral_inv_log_sq` (`Analysis/SpecialFunctions/LogIntegral.lean:321`);
  - `TauCeti.primeCount_eq_card` (`NumberTheory/ArithmeticDirichletSeries/Counting.lean:648`);
  - `abelianConductor` (`NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:193`), `isAdmissibleModulus_iff_abelianConductor_dvd` (`:200`).

The `roadmaps resolve` leads (13 names) are the Provenance names of the PrimeNumberTheoremAnd project and the L-functions roadmap's own `Grossencharacter` targets. Neither group is a pin declaration, and the README does not claim either is.

### Cross-roadmap citations resolved on main (21)

- **AnalyticNumberTheoryPartI:** §0.1 (line 167), §0.6 (247), §0.9 (288), §0.11b (357), §0.12 (473), §0.15 (530), §0.18 (578), §0.23 (644), §0.30 (773), §0.32 (849), §0.34 (883), §0.34b (891), §2.18a (1676), §2.31e (1887), §2.39 (1997), §2.49 (2166).
- **ImaginaryQuadraticClassNumber:** H2.4 (line 93).
- **SpecialFunctionsEiLiErfIncompleteGamma:** §8.4 (line 1053).
- **LFunctions:** lines 317, 795 and 1582, as in the sample table.

§0.34b of AnalyticNumberTheoryPartI consumes 6.4d through its §0.30, which agrees with this README's Downstream consumers and 6.4a.

### Duplication and ownership

- No library candidate at the pins proves a headline. The `library-matches.md` leads are all qualitative or special: `Nat.infinite_setOf_prime_and_modEq`, `NumberField.Ideal.tendsto_norm_le_div_atTop`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`.
- `OrderLE`, `zeroCount`, `zetaEntireCompletion`, `entireCompletion`, `logGamma` and `weierstrassFactorOne` do not occur at the Tau Ceti pin `2fd255d` (grep empty). The implementations that STATUS.md describes are at a later Tau Ceti, so defining the three in `Suggested.lean` is right at this pin.
- I ran `roadmaps grep --lean-only` over the open pull requests for the 27 declaration names. No other roadmap declares any of them.
- ExplicitPrimeCounting cites 8.4 as a consumer (its README lines 157 and 428).
- `overlaps.md` lists no other open pull request changing this roadmap, no dropped id cited here and no id dropped here that others cite.

### Adversarial table

All values were computed in double precision this round, using Euler–Maclaurin (Hurwitz) zeta, a Stirling log-gamma with upward recurrence, zeros found from sign changes of Hardy's `Z`, Ramanujan's series for `li`, and a prime sieve.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1/0.3 `OrderLE`, finite order | `1/Γ` at `−n−1/2`, `n = 10, 100, 1000` | `log‖1/Γ‖ = 15.147, 364.901, 5914.438`; ratio to `n log n` `0.658, 0.792, 0.856` (→ 1) | order 1, not exponential type | none |
| 0.2 `zetaEntireCompletion` | `s = 2, 3, −2+10⁻⁶i`; `0.3+2i` vs `0.7−2i` | `F(2) = 1.0471976 = π/3`; `F(3) = 1.1478798 = F(−2)`; `F(0.3+2i) = 0.906897 − 0.016873i = F(0.7−2i)` | true | none |
| 1.1 `logGamma` | value at `3` | `0.6931472 = log 2` | true | none |
| 1.2 Stirling | `(r, θ) = (10, π/4), (100, π/2), (5, 2.5), (50, 2.5)` | `‖R‖·‖s‖ = 0.08333` each (`1/12`); at `δ = π − 2.5`: `0.01666 ≤ 0.1676`, `0.001667 ≤ 0.01676` | true | none |
| 1.3 strips | `σ = −3, ½, 4`; `t = 100, 1000` | `t·remainder = −0.0700/−0.0070, 0/0, 0.0700/0.0070` | `O(1/\|t\|)` | none |
| 1.3a | `½+i`, `3/2+3i`, `2+10i` | `‖Γ‖ = 0.52059, 0.068485, 1.20·10⁻⁵` vs `Γ(Re s) = 1.77245, 0.88623, 1` | true | none |
| 1.5 | `gammaR = {0,1}`, `σ = ½, 2`, `t = 100, 1000` | remainder `0.693147/0.693147`, `−2.063618/−2.063668` | `O(1)` | none |
| 1.6 `continuedL` | `ζ` at `0`; quartic `χ` mod 5 | `ζ(0) = −0.5000000`, raw quotient junk `0`; `χ(−1) = i² = −1` | true | none |
| 2.1/2.5 conductors | `ζ` at `½`; `gammaC = {0}`; `ℚ(i)`; odd `(4)∞` | `7/2`; `12`; `48`; `16` (`4` without `𝔑𝔣`) | true | none |
| 2.4 newform | `Δ`, `k = 12` | `90` at the analytic centre; `15.75` at the wrong point | true | none |
| 3.2 Phragmén–Lindelöf | `(s−1)ζ(s)` on `[−½, 3/2]`, exponents `2`, `1`, centre `3/2` | `t = 100`: `0.2047, 1.2990, 0.2653`; `t = 1000`: `0.1525, 0.9594, 0.0315` | bounded, as stated | none |
| 3.3 gamma quotient | `ζ` record, `δ = ¼`, `t = 100, 1000` | `log‖Γℝ(1−s̄)/Γℝ(s)‖ − ½(1+2δ)log t = −1.378404, −1.378408` | `O(1)` | none |
| 3.4 / `dirichletLFunction_convexity` | `q = 1`, `t = 100, 1000` | `‖ζ(½+it)‖/(t+3)^{1/4} = 0.8452, 0.1773` | bounded | none |
| 4.1 counts | `z(z−1)`; `z/(z−1)`; `sin πz` on `ℝ` | `2`; zero count `1`, signed `0`; finsum junk `0` | true | none |
| 4.2 (R01) | `ζ` at `1`, `−2`; `U = ∅` | `Λ(3) = 0.1913133`, `6Λ(3) = 1.1478798`; `−1 + 1 = 0`; `0` vs `−1` | true; duplicated list | R01 |
| 4.5 / 7.4 `riemannVonMangoldt` | `T = 14, 15, 100` | `N = 0, 1, 29`; first ordinate `14.1347251`; main term `28.1273` (`+7/8 = 29.0023`) | true | none |
| 5.1 | `1/Γ`, `r = 1000` | `n(r) = 1001 ≤ C r^{1+ε}` | true | none |
| 5.3 product | `cos z` at `1`, `2·10⁵` factors | `0.5403026` vs `cos 1 = 0.5403023` | true | none |
| 5.5 / `zetaEntireCompletion_hadamard`, `hadamard_of_orderLE_one` | `B = F′(0)/F(0)`; `f = 1 − s` | `−0.0230957090` vs `−γ/2 − 1 + ½ log 4π = −0.0230957090`; `a = 0`, `b = −1` | true | none |
| 5.6a / `riemannZeta_zeros_summable_ordinate` | first pair | `2/(1 + 14.1347²) = 0.0099606` | true | none |
| 6.2 cap | `c ≤ log 3/2 = 0.5493` | `c/log 3 ≤ ½`; at `14.13i` the region starts at `0.806 > ½` | true | none |
| `dirichletLFunction_zeroFreeRegion` | principal mod 2, mod 6; mod 6 induced from 3 | region `≥ 0.6934`; double zero at `0` enters at `c ≥ log 18 = 2.890`; zero at height `4.532` at `c ≥ 3.811`, both above `0.549` | true | none |
| `dedekindZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion` | `n = 0`; `n = 1` | vacuous (no field of degree `0`); `log(\|t\|+3) ≥ log 3 > 0` | true | none |
| 6.4a `gammaLogDerivBound` | `s = 1, 2, 3` | `C_Γ = 1.5723649 = 1 + ½ log π`; `logDeriv Γℝ = −1.554120, −0.860973, −0.554120` | true | none |
| `finite_zero_sum_le_logDeriv` | `χ₋₄`, `σ = 2`, `S = {½ + 6.020948905i}` | `L(2) = 0.915965594`, `Re L′/L(2) = 0.089065`; `0.038959 ≤ 0.089065 + 0.693147 + 1.572365 = 2.354577` | true | none |
| `completed_orderLE_one` | `χ₋₄`, `log Λ(2m)/(2m log 2m)`, `m = 10, 50, 200` | `0.263, 0.343, 0.379` (→ ½) | order exactly 1 | none |
| `neg_re_logDeriv_riemannZeta_le` | `(δ, t) = (0.01, 2)`, `(0.02, 0.01)`; at `½ + 14.13i`, `δ = 0.1` | `−0.1969 ≤ C log 2`; `24.43 ≈ 1/(4\|t\|) − γ`, with `log\|t\| < 0`; `−1.2962 ≤ −1.6667 + C·2.649` for `C ≥ 0.140` | true | none |
| `chebyshevPsi_explicitFormula` (8.3) | `x = 100`, `T = 50`, 10 zeros | `ψ(100) = 94.04531`, formula `95.04034`, difference `−0.995` against `x log²x/T = 42.42` | true | none |
| 8.3 trivial zeros | `ℚ(i)`, `x = 2` | `−½ log(3/4) + ½ log 3 = 0.6931 = −log(1 − 1/2)` | true | none |
| 8.4 / Weil formulas | sign and normalisation | re-derived: `∑ m_ρ φ̃(ρ) = φ̃(0) + φ̃(1) + (2πi)⁻¹∫₍₂₎ Λ′/Λ (φ̃(s) + φ̃(1−s))`; `½ log\|d_K\|` gives `(log\|d_K\|)φ(1)`; `ψ⁻¹` gives `conj ψ(𝔞)` | matches the Lean | none |
| 7.5 `riemannVonMangoldt_dedekindZeta` / `_dirichlet` | `K = ℚ`, `T = 100`; HSW at `T = 2` | `N± = 58` vs `56.2547`; `27.692` (with `r₁/4`) `≤ 41 log 2 = 28.419` | true | none |
| `primeIdealCount_effective` | `K = ℚ`, `x = 10⁶` | `π = 78498`, `Li = 78626.504`, difference `−128.5` vs `x e^{−√log x} = 24308.7` | true | none |
| `primeCounting_progression_effective`, `rayClassPrimeCount_effective` at `ℚ` | `q = 4`, `x = 20` | `4` vs `Li(20)/2 = 4.4301`; `a = 2` excluded by `Nat.Coprime` | true | none |
| 8.9 `Li` | `x = 10`; `li 2` | `Li(10) = 5.120436`; `li(2) = 1.045164` | true | none |
| `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ` | `#C/#G = ½` per class | true | none |
| contract (R02) | the two names | both present at the pin, absent from lines 186–542 | contract incomplete | R02 |

### A note on build order

6.2 (the Dedekind region and *heckeZeroFreeConstant*) and 6.3 cite 6.4, which follows them in Layer 6. Their *Needs:* lines say so, there is no cycle, and other roadmaps cite these ids, so I ask for no change.

## Not verifiable

- **Davenport, *Multiplicative Number Theory*** (`davenport2000`, uncertified). It is the locator of 0.3 and 5.3 (§11) and of 8.3 (§17). The statements were computed instead (table).
- **Titchmarsh, *The Theory of the Riemann Zeta-Function*.** It is the locator of 4.5 (Theorem 9.2), 7.4 (§§9.2–9.4, Theorem 9.4), 7.3 (§9.3), 7.6 (p. 214) and 3.3–3.4 (§5.1).
  - It has no entry in the roadmap's sources manifest.
  - The sources service, run against a scratch copy of the manifest, failed with network trouble (arXiv HTTP 429).
  - The book has no known open copy.
  - `N(100) = 29` and the shape of Theorem 9.4 were computed instead.
- **Iwaniec–Kowalski §§5.1–5.2.** It has no manifest entry and is a paywalled AMS book.
- **Lagarias–Montgomery–Odlyzko, Lemma 2.3** (`lagarias1979`, uncertified). Kadiri §1 reports it (lines 65–73).
- **Lang XVII §3** (`lang1994`, uncertified). The Weil formula was re-derived instead (table).
- **A manifest discrepancy, for the worker.** The `bennett2021` entry has the version note "arXiv v3", but the cached text is v1 (`bennett2021` line 2). The README cites the v1 numbering, which agrees with the text I read.

## Source issues

- **Misprint** in kadiri2012 at §1, (1.6), p. 2: the source says Lagarias–Montgomery–Odlyzko show that `L(s, χ, K)` has no zeros at all in region (1.6), across the whole strip. It should exclude the possible exceptional zero that (1.5) allows, that is, claim no zeros with `|Im s| ≥ 1/(R₄ log A(χ))`. Affects nothing: 6.4 reads (1.5)–(1.6) together as "at most one zero".
