# Review of NoncongruenceModularForms (pull request #1709 at 5342d2e)

**Verdict:** accepted

No P1 or P2 finding. The gate passes, the dependency check reports no problem, and the five findings of the previous review are repaired at this head (table below). Two P3 notes follow; they are the author's to take or leave.

## R01 (P3) — Scholl pins the sign of `A_{2d}(p)` in the even-weight case

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:1679–1681`, “The sign is not pinned to `+1`: the source gives `A_{2d}(p)` only through `|A_{2d}(p)| = p^{d(k−1)}`”.

**Claim:** The cited source leaves the constant term of the Frobenius polynomial determined only up to sign.

**Witness:** scholl lines 856–862 (§5.3, printed p.71): `H_p(T) = ∏(T − α_i)(T − p^{k+1}/α_i)`, with the displayed consequences `A_{2d−r} = p^{(k+1)(d−r)} A_r`, `A_0 = 1`, `A_{2d} = p^{(k+1)d}` (his weight is `k+2`). In Scholl's setting (`Γ ⊂ PSL₂(ℤ)`, even weight) the sign is `+` and the polynomial is palindromic.

**Repair:** Attribute the `±` to this roadmap's signed odd-weight extension, where `ε_p = χ(p)` can be `−1`, and record Scholl's functional equation `A_{2d−r}(p) = p^{(k−1)(d−r)} A_r(p)` for the even-weight `±Γ` case as an API fact of the common Frobenius polynomial. Retested on the `d = 1`, `k = 12`, `p = 11` instance: `A_2 = +11^{11}`, as Scholl's formula gives.

## R02 (P3) — Two different weight bounds are quoted for the same theorem

**Location:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:1712–1714` (“Scholl's Theorem 5.4, p.71, uses `p > k−1`”) against `:1770–1771` (“Li–Long … `p > k − 2`, absorbed here into `T`”).

**Claim:** Both locators describe the hypothesis of the same theorem.

**Witness:** scholl line 866 (Theorem 5.4, printed p.71): `p ∤ M`, `p > k+1` with weight `k+2`, i.e. `p > k−1` in this roadmap's weight. li-long line 189 (§2, printed p.5): “for `p > k−2` and `p ∤ M`”, weight `k`. The survey's bound is off by one from the primary source it restates.

**Repair:** Keep the primary bound (`p ≤ k−1` in `T`, as line 1713 already does) and drop or flag the `p > k − 2` clause in the Li–Long source line, so that §8.3 states one bound. No statement changes: `T` already contains every prime `≤ k−1`.

## Verified sound

This was a full read of both files at `5342d2e`, including the passages unchanged since `75731ff`. Every finding of the previous review was checked first, then the whole roadmap: the seeded source sample, the adversarial pass with computed values, the duplication and supplier audits, the Lean form, the padding probe and the headline coverage. Computations were done in scratch on integer matrices, permutations, finite rings and truncated series; they test statements and do not replace proofs. No repository file was changed.

**Previous findings, checked first.**

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01 (P1), geometric monodromy is the mirror triple | README:253–257 and :1255–1279: fibre `g Γ̄ ↦ Γ̄ g⁻¹τ₀`, a loop lifting to `hτ₀` sends `gΓ̄ ↦ h⁻¹gΓ̄`, positive loop at `∞` acts by `T̄⁻¹`, triple equivalent to `(σ1 σ0⁻¹ σ1⁻¹, σ1, σinf⁻¹)`; §6.3 and §9.1 propagated; Checks :1295–1303 | Repaired. Recomputed: `S U⁻¹ S⁻¹ = −R`, so the mirror is `(ρR̄, ρS̄, ρT̄⁻¹)` and `T̄⁻¹ S̄ R̄ = −I ↦ 1`; `R'(ρ) = e^{−2πi/3}` so the counterclockwise loop at `0` lifts to `R̄⁻¹` and has monodromy `ρR̄`; the pinned `periphInf` is the circle clockwise in `z`, counterclockwise in `1/z` (BelyiMaps §5.8 conclusion, `PeripheralLoops.lean:31`), and `IsCoveringMap.monodromy` is the lift endpoint (`Lifting.lean:386`); for the chiral row `t(1) = 3`, `t⁻¹(1) = 4`, the centraliser of `s` has 48 elements and none conjugates `t` to `t⁻¹`, and the mirror of the first `{6,1}` row is simultaneously conjugate to the second. The LMFDB mirror `(permS·permT⁻¹, permS, permT)` follows from the row triple by the same formula. |
| R02 (P1), order obstruction rejects `Γ(2)` | README:849–851 and Checks :886–890: `n ∤ |Q_N|` with `|Q_1| = 1`, `|Q_2| = 6`, product only for `N ≥ 3` | Repaired. Enumerated `|SL₂(ℤ/N)| = 6, 24, 48, 144, 384, 720, 1152` for `N = 2,3,4,6,8,10,12`; `|Q_N| = 6, 12, 24, 72, 192, 360, 576`; `6 ∣ 6`; `72, 360, 576 ≡ 2, 3, 2 (mod 7)`. |
| R03 (P2), rescaled Fourier parameter | README:1606–1614, :1631–1666, :1675–1678, Checks :1743–1759 | Repaired. The `a_m`/`b_m` distinction, `b_m = κ^m a_m`, the unit `γ_p ∈ 1 + pℤ_p` with `γ_p^h = C^{p−1}` and the factor `γ_p^{(mp^d − r_i)/(p−1)}` are exactly Scholl's interpretation (scholl lines 863–864, 870–881). Recomputed: `b₁₁ = 2¹⁰·534612 = 547442688`, untwisted difference `546908076 = 11·49718916` of valuation 1, transported difference `0`; at `p = 13`, `b₁₃ = −2366414848`, untwisted valuation 1, transported `0`; `p = 3, m = 1, d = 2` gives indices `9, 3, 1` with exponents `3, 4`; `x² = 4` has the root `−2 ≡ 1 (mod 3)` and `2 ≢ 1`; odd squares are `1 (mod 8)`. Independent cross-check: on the quadratic twist of `X(2)` by `T̄` over `ℚ(√D)`, `γ_p = χ_D(p)·16^{−(p−1)}D^{−(p−1)/2}` and the twisted `A'_p = χ_D(p)A_p` cancel exactly to the untwisted congruence, which the naive branch `κ^{p−1}` would not. |
| R04 (P2), short Hsu words omit a normal generator | README:921–928 (presentations include `L^N` and the ambient relations) and :1017–1022 (`T^M` with the test words normally generates `Γ(M)`), Checks :1036–1042 | Repaired. The `ℤ/4` quotient (`T ↦ 1`, `R_H ↦ −1`) sends the three short relators and both ambient relators to `0` and `T²` to `2`. Sufficiency of the signed list for even `M` follows from Hsu's projective theorem: `Z = (LR_H⁻¹L)²` is central by the braid trick, `Z² = 1` is in the ambient list, so the presented group has order at most `2·|Q_M| = |SL₂(ℤ/M)|`, and all listed relations hold in `SL₂(ℤ/M)` (checked on matrices for `M = 2, 4, 8, 16, 6, 10, 12, 24, 40`). |
| R05 (P3), index-18 example without locator | README:1960–1965: Hsu Example 1.1 with explicit `E, V, L`; noncongruence by Example 2.5 | Repaired. hsu lines 64–69 (printed p.1352) give exactly these permutations; lines 113–124 (Example 2.5, p.1353) show `L²` and `R¹⁵` do not commute. Recomputed: `V⁻¹E = L` (Hsu's left-to-right `L = EV⁻¹`), widths `{2, 3, 5}`, `ε₂ = 0`, `ε₃ = 1`, `12g = 12 + 10 − 4 − 18 = 0`, `L² = (2 9 8 5 10)(3 6 7)`, `R¹⁵ = (2 3)`, mixed test at `N = 30` fails (B1), (B3), (B4). |

**Gate, dependency check, elaboration.** The worker's gate at this head reports every counter zero and `OK`. `git diff --stat origin/main...HEAD` outside the folder is empty. Independent `lake env lean` of `Suggested.lean` exited 0 with exactly 26 `declaration uses 'sorry'` warnings and no other warning. The required dependency command returned:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `ModularFormsPartII` is the entry immediately before this roadmap in the merge order (a design-stage package whose contracts W1.2–W1.3, W1.5–W1.6, W1.8, W6.3–W6.5 I read at `packages/ModularFormsPartII/design/README.md:200–380, 986–1040`); the resolver's W1.3 lead is that design contract, not a missing owner. No declared supplier gaps.

**Lean form, signatures, padding.** The change to `Suggested.lean` since `75731ff` is five docstring lines. A scratch copy with `#check @name` for all 58 declarations elaborated with no error; each elaborated type was compared with its README statement. The only dropped section binder is `[Γ.FiniteIndex]` on `cuspExpansion`, whose body is a native q-expansion of a translated form and needs no finiteness; every theorem about it carries the binder. The one-tactic probe (`first | rfl | (simp; done) | infer_instance | decide` in place of each `sorry`) fails on all 26 sorried theorems, so none is padding. Definitions have real bodies: `U`, `modularHom` (with proved relations), `lift`, `ρ`, `modularTriple` (proved product relation), `cuspWidths`, `cuspCount`, `ellipticTwo/Three`, `genus`, `generalLevel`, `strictLevel`, `hsuTest`, `FareySymbol` with its generators and `group`, `cuspExpansion`, `regularCuspCount`, `congruenceClosure`. Imports are `import Mathlib` plus nine existing `TauCeti.*` modules; no `set_option`, no `lemma`, no sorried data.

**Headline coverage** (README headline → declaration): triangle presentation and torsion-free rank → `modularHom_bijective`, `exists_freeGroupBasis_of_torsionFree`; Millington, realization, subgroup count → `millington`, `exists_modularTriple_equivalent`, `card_subgroups_of_class`; cusp dictionary, genus identity, principal index → `period_permT_coset`, `cuspCount_eq_card_cuspOrbits`, `genus_formula`, `index_Gamma_map_toPSL`; strict Wohlfahrt and composition factors → `wohlfahrt_strict`, `compositionFactor_of_isCongruenceSubgroup`; Hsu projective and signed → `hsu`, `hsu_strict`; Kulkarni → `FareySymbol.group_finiteIndex`, `exists_group_eq`, `group_index`; dimensions → `finrank_cuspForm`, `finrank_modularForm`, `finrank_cuspForm_two`, `finrank_odd`, `finrank_one`; Berger and algebraic coefficients → `berger`, `exists_basis_coeff_mem_numberField`; denominators → `exists_bounded_denominators_numberField`, `unbounded_denominators`, `unbounded_denominators_numberField`. The module docstring names the Belyi identification (mirror triple), the Scholl congruence with its coordinate factors, and the special-polygon presentation as not statable and states nothing in their place.

**Adversarial pass (computed values).** `G = PSL₂(ℤ)`; `e₂, e₃` fixed-point counts; `c` cycles of `σinf` including fixed points; `N = lcm` of widths. Rows marked “all classes” use an independent enumeration of transitive pairs `(σ1, σ0)` with `σ1² = σ0³ = 1` up to simultaneous conjugation.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.1 relations | integer `S, T, R = ST, U = ST⁻¹` | `S² = R³ = TSU = −I`, `U³ = I`, `SR⁻¹S⁻¹ = −U = [[0,1],[−1,1]]`, `RU⁻¹ = ST²S⁻¹ = [[1,0],[−2,1]]`, `T⁻¹ = S⁻¹U` | agrees, signs as stated |
| 0.1 mirror | `J = diag(1,−1)` | `J⁻¹SJ = S⁻¹`, `J⁻¹TJ = T⁻¹`, `J⁻¹UJ = [[0,1],[−1,−1]] = −R` | agrees |
| 0.3 ping-pong sets | `q > 0` | `R̄q = −1/(q+1) ∈ (−1,0)`, `R̄²q = −1−1/q < −1`, `S̄` swaps signs | hypotheses of `lift_injective_of_ping_pong` met, `|ℤ/3| = 3` |
| 0.3 rank headline | `Γ̄(2)`, commutator, `Γ̄(3)` | `(n, 1+n/6) = (6,2), (6,2), (12,3)`, all `n ≡ 0 (6)` | agrees |
| 0.4 lift | `Γ(3)`, `Γ(2)`, `G` | integral/projective indices `24/12`, `6/6`, `1/1` | factor 2 iff `−I ∉ Γ` |
| 1.1 opposite convention | `Γ̄₀(2)` row | `permR = permS·permT = (1 3 2)` matches worked example; `σ0 = permS·permT⁻¹` | agrees |
| 1.1 `R_H` | matrices | `S⁻¹T⁻¹S = [[1,0],[1,1]]`, `LR_H⁻¹L = S⁻¹`, `(LR_H⁻¹L)² = (R_H⁻¹L)³ = −I`, `(LR_H⁻¹L)⁴ = I` | signed ambient relations as in §4.2 |
| 1.2–1.3 class counts | all classes, degrees 1–8 | `1, 1, 2, 2, 1, 8, 6, 7` classes; noncongruence `0,0,0,0,0,0,4,2` | table of §1.3 agrees |
| 1.3 degree-6 list | all 8 classes | `(e₂,e₃,widths,g,N)`: `(4,0,{6},0,6)`, `(2,0,{5,1},0,5)`, `(2,0,{3,3},0,3)`, `(2,0,{4,2},0,4)`, `(0,3,{6},0,6)`, `(0,0,{4,1,1},0,4)`, `(0,0,{6},1,6)`, `(0,0,{2,2,2},0,2)`; all pass Hsu | agrees with worked examples |
| 2.1 widths | worked rows | sums `3, 6, 6, 12, 7, 8` equal indices; cusp counts `2, 3, 3, 2, 2, 1` | fixed points counted |
| 2.2 elliptic counts | `Γ₀(N)`, `N = 2, 4, 7, 11` | DS 3.7.2 gives `(1,0), (0,0), (0,2), (0,0)`; permutations give the same | agrees |
| 2.3 genus | `G`, `Γ̄₀(11)`, `Γ̄(2)`, index-7 rows | `12g+3e₂+4e₃+6c = 13, 24, 18, 19 = 12+n` | `g = 0, 1, 0, 0` |
| 2.4 invariant vector | two `{6,1}` rows | both `(7,0,1,1,{6,1})`; not conjugate (canonical forms differ); mirror of one is the other | agrees |
| 2.5 `|Q_N|` | `N = 1…12` | see R02 row; `N = 8`: `192` vs `96` by the full centre | product only for `N ≥ 3` |
| 3.1 level | `{4,3}` at index 7 | `lcm = 12 > 7` | `N ≤ n` false |
| 3.1 strict vs signed | `{γ ∈ Γ(2): a ≡ 1 (4)}`, `σ = [[1,−1],[1,0]]` | `σT²σ⁻¹ = [[−1,2],[−2,3]] ∉ Γ`, its negative `∈ Γ`; `σT⁴σ⁻¹ = [[−3,4],[−4,5]] ∈ Γ` | strict 4, signed 2 |
| 3.3 KSV `Γ₀(6)` lifts | ksv lines 641–649 | the table's noncongruence lifts have strict widths `{2,12,3,2}` and `{2,6,3,4}`, lcm 12 | Check (iv) agrees |
| 3.3 witness | `g = [[73,−32],[16,−7]]` | `det = 1`, `g ≡ I (mod 8)`, `T⁴ST⁻²ST⁻⁵ST⁻²ST⁻¹ = −g` | agrees |
| 3.5 order obstruction | index 7, `N = 6, 10, 12`; `Γ̄(2)` | `7 ∤ 72, 360, 576`; `6 ∣ 6` | agrees after repair |
| 3.5 monodromy orders | index 7 and 8 rows | `42, 42, 5040, 5040, 168, 168`; index 8: `336, 336, 48, 48`, `Γ̄₀(7)`: 168; `Γ̄₀(11)`: 660 | `336 ∤ 192`, `48 ∣ 192` |
| 3.5 `A_n` exclusion | `n = 6, 7` | `n³ = 216, 343 ≤ n!/2 = 360, 2520` | inequality holds |
| 4.2 relations in `Q_N` | matrices mod `N` | odd `N = 3,5,7,9,15`: (A) `= −I` (projectively 1); `N = 2,4,8,16`: (A1),(A2),(A3 with RHS `X²`) `= I`, Hsu's `= 1` form fails signed for `N ≥ 4`; mixed `N = 6,10,12,24,40` with `1/5 mod e`: all seven hold; with `1/5 mod m`: (B5),(B7) fail at `6, 12, 24`, no inverse at `10, 40` | agrees with §4.2 |
| 4.2 test on worked rows | all 17 rows | passes on every congruence row; fails (B1)–(B4),(B7) on `{6,1}×2`, `{4,3}`, (B1)–(B4) on `{5,2}`; fails (A1),(A2) on the two index-8 noncongruence rows | agrees |
| 4.2 Hsu's letters | hsu lines 38–46, 61–62 | `L = [[1,1],[0,1]]`, `R = [[1,0],[1,1]]`, `E = LR⁻¹L`, `V = R⁻¹L` | matches conventions |
| 4.4 `ℤ/4` quotient | `T ↦ 1`, `R_H ↦ −1` | relators `(A1),(A2),(A3) ↦ 0, 0, 0`; `(LR⁻¹L)⁴ ↦ 0`; `(LR⁻¹L)² , (R⁻¹L)³ ↦ 2, 2`; `T² ↦ 2` | `T^M` needed |
| 4.4 `Γ₁(5)` | `N_s = 5`, `M = 10` | mixed case `e = 2`, `m = 5`; (A) at 5 evaluates to `−I` | doubling needed |
| 5.1 nondegeneracy | singletons | scores `(even,even) 6`, `(free,free) 6`, `(even,odd) 7`, `(odd,odd) 8`; two entries give `≥ 9` | equivalent to `6r+3e₂+4e₃ > 6` |
| 5.2 generators | `(−1/0,0/1)`, `(0/1,1/0)`, `(0/1,1/1)` | even `= S⁻¹ = MSM⁻¹`; odd `= [[0,1],[−1,1]] = −U`; even `= [[−1,1],[−2,1]]`, trace 0 | agrees |
| 5.2 free generators | `Γ̄₀(2)`, `Γ̄(2)`, `{4,3}`, `Γ̄₀(11)` | `−T`; `−T²`, `[[−3,2],[−2,1]]`; `[[−3,1],[−1,0]]`, `[[−4,7],[−3,5]]`; `[[−7,2],[−11,3]]`, `[[−8,3],[−11,4]]`; all det 1 | agrees (signs projectively irrelevant) |
| 5.2 formulas vs source | kurth-long lines 330–350 | each formula is the negative of Kurth–Long's `G_{i+1}` | projectively equal |
| 5.3–5.4 index | five symbols | `7, 9, 12, 18, 13` minus 6 = `1, 3, 6, 12, 7` | agrees |
| 5.4 widths | `Γ̄₀(11)`, `{4,3}` | terms `3,1,3,1,3` sum 11 and `x_m − x_0 = 1`; `1, 2, 1` plus one odd side give `3` and `4` | agrees with 2.1 |
| 6.1–6.2 orientation | pinned loops | `γ0, γ1` counterclockwise (`PeripheralLoops.lean:22–24`), `periphInf := (periph1·periph0)⁻¹` (`:31`), clockwise in `z` (BelyiMaps §5.8); `1/J = 1728q + …` so counterclockwise in `1/J` is `τ ↦ τ+1` | monodromy `T̄⁻¹` |
| 6.2 mirror checks | chiral rows, `Γ₀(2)`, `{4,3}`, `{5,2}`, index-8 rows | mirror twice is the identity; `{4,3}`, `{5,2}`, both index-8 noncongruence rows self-mirror; the two index-7 congruence rows and the two index-8 congruence rows are mirror pairs | agrees |
| 7.3 even weights | `SL₂(ℤ)`, `Γ̄₀(11)`, index 7, index 8, `Γ̄₀(4)` | `(M₁₂,S₁₂) = (2,1)`; `S₂ = g = 1`, `S₄ = 2`; index 7: `M₂ = 1, S₄ = 1, S₆ = 2`; index 8: `M₂ = 0, S₄ = 2, M₄ = 3`; `M₂(Γ₀(4)) = 2` | agrees |
| 7.3 odd weights | `Γ₁(3)`, `Γ₁(4)`, `k = 3` | doubled `(2M, 2S) = (4, 0)` both; `Γ₁(3)` regular at both cusps | agrees with `dim M₃ = 2` |
| 7.3 weight one | Clifford | `deg(L₁ − D_reg) = g − 1 − r/2`; `h⁰ ≤ (2g+2−r)/4` when special, `S₁ = 0` when `r > 2g−2` | `finrank_one` agrees |
| 7.4 normalization | `Δ`, `p = 2` | `τ(2) = −24` | agrees |
| 7.5 rationalized parameter | `t = 1/j` | `q = t + 744t² + …`, `κ = 1` | `z ≠ t` |
| 8.1 | `Δ/11` | first coefficients `1/11, −24/11`; `D = 11` | agrees |
| 8.3 Hensel | `h, C, p` as in Checks | `F(1) = 1 − C^{p−1}`, `‖F'(1)‖ = ‖h‖ = 1`, Mathlib's `hensels_lemma` (`Hensel.lean:459`) gives the unique root with `‖z − 1‖ < 1` | agrees |
| 8.3 `d = 1` transport | `Δ/2`, `κ = 2`, `p = 11, 13` | see R03 row | agrees |
| 8.3 weight bound | scholl line 866 | `p > k+1` at weight `k+2` | `p > k−1` here; R02 |
| 8.4 applicability | index-7 rows | `{4,3}`, `{5,2}` unique with their widths, prime index non-normal so `N(Γ̄) = Γ̄`; `{6,1}` rows are a mirror pair | agrees |
| 9.1 prefix | index 7, 8 | `(7,0,2,1,1)` with levels `6,6,10,12`; `(8,0,1,2,2)` with Hsu pass/fail `2/2` | agrees |
| Worked example, Hsu degree 10 | hsu Example 1.1 | see R05 row | agrees |

**Seeded source audit.** Line numbers refer to the sources cache (`<id> line N`); printed pages are the journal's.

| Sampled target | Locator inspected | Outcome |
|---|---|---|
| 0.3 injectivity | Mathlib `CoprodI.lean:903` (`lift_injective_of_ping_pong`), Tau Ceti `TriangleGroup/Basic.lean:281` (`equivTwoGenerator`); Alperin and Serre not readable | ping-pong sets recomputed; the route is sound; Alperin's page locator uncertified |
| 0.4 lifts | Mathlib index API (`index_comap_of_surjective`, `index_map_eq` exist at the pin) | recomputed on `Γ(2)`, `Γ(3)` |
| 2.1 widths and cusps | kurth-long lines 452–458 (§4, p.9); Mathlib `Cusps.lean:171, 223, 242, 317, 328`; Tau Ceti `Cusps/Basic.lean:143` | cycle length = width statement supported; Kurth–Long's last sentence is the erratum already registered |
| 2.2 elliptic points | DS Cor. 3.7.2 not readable; formula tested at `N = 2, 4, 7, 11` against the permutations | agrees on all four |
| 2.5 congruence data | Tau Ceti `CongruenceSubgroups/Basic.lean:556, 640`; `|Q_N|` enumerated | composite index, widths and elliptic counts are owned here, as stated |
| 3.1 level | hsu lines 89–95 (Definition 2.2, Theorem 2.3, p.1352); ksv lines 183–195 (Lemma 7, pp.4–5) | lcm/order and signed-width hypotheses agree |
| 4.1 principle | hsu lines 100–109 (Theorem 2.4, p.1353) | normal-kernel argument as stated |
| 4.4 subgroups without `−1` | hamilton-loeffler lines 49–102 (Theorem 2, Proposition 3, list, pp.1–2); hsu lines 303–329 ((3.31)–(3.33), pp.1356–1357); ksv lines 78–79, 262–268 | repaired statement supported; HL's list omits `L^N`, which the README now adds |
| 5.2 generators | kurth-long lines 330–351 (Theorem 3, p.7) | formulas agree up to sign |
| 5.4 invariants | kurth-long lines 354–390 (§3.4, p.8) | genus, cusp classes, width terms and `μ = 3e₂+4e₃+12g+6t−12` agree |
| 6.1 covering | FuchsianOrbifolds Layer 0 item 5, Layer 2 item 1, Layer 4; `Completed/UniversalCovers` Stage 2; Mathlib `Lifting.lean:386, 443` | lift-endpoint monodromy; left-coset computation recomputed |
| 7.1 carrier facts | Tau Ceti `SturmBound.lean:79–100`, Mathlib `Cusps.lean:242` | bound `(k·index).toNat/12` on the strict-width order, as stated |
| 7.5 algebraic coefficients | scholl lines 787–847 (Prop. 5.2, pp.69–71); bmr-database lines 75–86 ((2.5), p.2) | `t = γ·q^{1/μ}`, `b(n) ∈ ℤ[1/M]`, `a_n = u^n b_n` |
| 8.1 bounded denominators | AlgebraicModularFormsAndSerreWeights §2.9 (open head of #928) and its `boundedDenominators` signature (`Gamma N ≤ Γ`, width-`N` expansion, rational coefficients) | contract as cited |
| 8.3 ASD | scholl lines 763–786 (§5.1), 787–847 (5.2), 848–864 (5.3), 865–881 (5.4 and its interpretation), 884–887 (5.5), 900–929 (proof), 990–1007 (5.10); li-long lines 180–199; li-long-yang lines 606–619 (Prop. 5.1, pp.12–13) | statement, interpretation and bound as in R03; R01/R02 notes |

Other readable checks: cdt line 59 (Theorem 1.0.1, p.2) and line 71 (number-field remark via Remark 6.3.1); bmr-computation lines 214–219 (Theorem 2.7); hsu lines 146–172 (procedure (A), (B), (C), p.1354) against `hsuTest` relation by relation; ksv lines 560–649 (the `Γ₀(6)` lifts table).

**Pinned libraries** (Mathlib `f6090c70`, Tau Ceti `358314d4`): every library name used in `Suggested.lean` elaborates; every backticked library name in the README (73 names checked by grep, including `rank_two_simple`, `finiteIndex_normalCore`, `eq_zero_of_neg_one_mem`, `relIndex_strictPeriods`, `isCusp_SL2Z_iff`, `T_pow_mem_iff`, `equivOppositeConvention`, `genus_eq_of_equivalent`, `TransitiveGroupLabel`, `referenceSubgroup`, `exists_width_eq_nat_mul`, `coordinate_pow_eq`, `heckeSlashCuspFormEnd`) exists at the pins. `hensels_lemma` (`NumberTheory/Padics/Hensel.lean:459`) has the hypothesis shape the README uses. `IsCoveringMap.monodromyTriple_σinf` (`MonodromyTriple.lean:190`) reads the third component on `periphInf`.

**Supplier resolution.** Every cross-roadmap citation was resolved on main or at the named open head: FreeGroupsAndLimitGroups §4.11 (`README.md:1013`); FuchsianOrbifolds Layers 0–6 by numbered item; ModularForms Layers 1, 2, 3, 8, 10A–10C (`README.md:327, 383, 481, 764, 1052, 1068, 1119`) and `JInputs`; BelyiMaps §§2.5, 4.1–4.2, 4.6, 5.2, 5.8, 6.2, 8.4, 8.6, 9.1, 9.5, 10.7, 11.3, 11.5, 11.6 (`README.md:961, 1327, 1358, 1564, 1688, 1911, 2036, 2691, 2767, 2847, 3122, 3508, 3616, 3681, 3701`); `Completed/PolynomialGaloisGroups` Layer 0 and Layer 6 (`README.md:442, 1172`); `Completed/UniversalCovers` Stage 2; ModularFormsPartII design W1.2, W1.3, W1.5, W1.6, W1.8, W6.3–W6.5; AlgebraicModularFormsAndSerreWeights §2.9 (#928); ModularCurvesPartII §§14.1–14.4 (#913); CrystallineCohomology CR.2.3 and CR.DDR.6.11–6.14 (#857); DeligneWeightsAndPurity §6.4 (#929). All are earlier in the merge order or on main. Ownership by object: the strict level, the signed Hsu criterion, the Farey carrier, the mirror identification of the modular cover, the noncongruence pullback of Scholl's realization and the number-field denominator transport were searched across main, the board's packages and the open heads given to this review; no second owner was found, and generic triples, cusps, covers, Hecke double cosets and cohomology are imported by name. Open pull requests whose files this brief does not provide were not searched beyond the service's index.

## Not verifiable

Fourteen cited works could not be read legally in this run; each was attempted through the sources service and is listed in `needs-references.toml`. Their locators are cited as written and were corroborated where a readable secondary source quotes them. The verdict does not depend on them.

| Source | Use | Where looked |
|---|---|---|
| wohlfahrt | Theorem 2 (§3.3) | Project Euclid landing page, no PDF link; KSV Remark 8 restates the theorem |
| millington | Theorem 2 (§1.2) | not fetched (Wiley); BMR cite “[33, Theorem 2]” for the same statement |
| alperin, serre | §0.3 presentation | service search found no legal copy |
| diamond-shurman | Thm 3.1.1, Cor. 3.7.2, §3.8, Thm 3.6.1, Thm 5.8.3 | no legal copy; formulas tested numerically |
| shimura | Prop. 1.40, §3.5 | no legal copy |
| kulkarni | Theorems 3.2–3.3, §6 | JSTOR only; Kurth–Long restates Theorems 1–3 |
| berger, long | §7.4 | no legal copy; Li–Long §2 read instead |
| atkin-swinnerton-dyer, jones | §8.3, §3.5 | AMS/Cambridge landing pages only |
| girondo-gonzalez, katok | cited through suppliers | not fetched |
| scholl (published) | §§5, 8.3 | Springer DOI paywalled; the author-page copy was read (OCR) and its numbering used |

## Source issues

- **Misprint** in li-long at §2, equation (2.4), printed p.5: the source says Scholl's congruence holds for primes `p > k − 2` with weight `k`; it should be `p > k − 1`, Scholl's `p > k + 1` at weight `k + 2`; affects a stated result.
- **Misprint** in hamilton-loeffler at the mixed-modulus list, preprint p.2 (line 94): the source says the inverse of 5 is taken modulo the odd part `m`; it should be modulo the 2-power part `e`, since (B5) and (B7) fail in `SL₂(ℤ/12)` with the other choice; affects a stated result.
- **Misprint** in bmr-computation at Theorem 2.7, printed p.4 (lines 216–217): the source says the number of cusps is the number of fixed elements of `σ_T`; it should be the number of cycles of `σ_T`, fixed points included; affects a stated result.
