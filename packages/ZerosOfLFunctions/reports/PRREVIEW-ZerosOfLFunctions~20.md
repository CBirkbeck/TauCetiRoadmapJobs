# Review of ZerosOfLFunctions (pull request #1913 at 6ffb97a)

**Verdict:** needs changes

This is a full review: 400 lines of the folder changed since `288e45d`.

- **Previous findings.** Five of the six previous findings are repaired (R01–R05). Previous R06, the pull-request title and description, is not repaired; it is carried here as R04.
- **Mathematics.** No P1 or P2 defect was found. All 17 theorems of `Suggested.lean` survived the adversarial pass, including the 4 new ones.
- **Findings.** Five P3 findings, none blocking:
  - supplier contracts that call pinned Tau Ceti declarations unrealized;
  - a hypothesis misnamed in 5.6;
  - internal section ids that resolve to no heading;
  - the stale pull-request metadata, with no order stated against #1907;
  - one missing source locator.
- **Gate.** The gate passes.

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the Mathlib pin `1b1ccf4b`. Other roadmap paths are on main (`154c04a`) unless a pull request is named.

## R01 (P3) — The supplier contracts call four pinned Tau Ceti facts unrealized, or take them from roadmaps

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md` line 325: "What the Tau Ceti pin does not realize of the L-functions roadmap". Lines 356–357 then list "`three_four_one_nonneg`, `dedekindZeta_logDeriv_eq`, `dedekindZeta_idealVonMangoldt_nonneg`".
- Lines 363–367 take the ray-class Artin map from "Class Field Theory, Layer 12".
- The same citations recur in the 6.1 *Needs:* (lines 1270–1271), the 8.3 *Needs:* (lines 1677–1678), 8.8 (lines 1869 and 1893–1897), and the Layer 6 and 8 Dependencies.

**Claim.** The pin does not realize these objects.

**Witness.** Each of these elaborates at the pin:

- `TauCeti.LSeries.threeFourOneCombination_nonneg` (`LSeries/ThreeFourOne.lean:107`);
- `TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg` (`ArithmeticDirichletSeries/VonMangoldt.lean:164`);
- `TauCeti.hasSum_idealTerm_vonMangoldt` (`Prime/DedekindZeta.lean:69`);
- `TauCeti.ClassFieldTheory.rayClassArtinMap`, `_surjective`, `_idealClass` (`AdmissibleModulus/Reciprocity.lean:128, 161, 216`).

**Note.** The L-functions roadmap itself says the two Dedekind facts are closed by citation of Tau Ceti (`TauCetiRoadmap/LFunctions/README.md:1593–1597`). PRREVIEW-ZerosOfLFunctions~16 wrongly listed `three_four_one_nonneg` among the objects the pin lacks.

**Repair.**

1. Add this bullet under "From Tau Ceti":
   > the 3-4-1 combination and the Dedekind von Mangoldt identity (`NumberTheory/LSeries/ThreeFourOne.lean`, `NumberTheory/ArithmeticDirichletSeries/Prime/DedekindZeta.lean`, `ArithmeticDirichletSeries/VonMangoldt.lean`): `TauCeti.LSeries.threeFourOneCombination_nonneg` (`0 ≤ 3 + 4 Re z + Re z²` for `‖z‖ ≤ 1`), `TauCeti.IdealArithmeticFunction.vonMangoldt_re_nonneg`, and `TauCeti.hasSum_idealTerm_vonMangoldt` (`∑_𝔞 Λ_K(𝔞) 𝔑𝔞^{−s} = −ζ_K'(s)/ζ_K(s)` for Mathlib's `dedekindZeta` on `Re s > 1`), for 6.1 and 8.3.
2. Add a second bullet:
   > ray-class reciprocity (`NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean`, stated for `K L : Type`): `TauCeti.ClassFieldTheory.rayClassArtinMap`, `TauCeti.ClassFieldTheory.rayClassArtinMap_idealClass` and `TauCeti.ClassFieldTheory.rayClassArtinMap_surjective`, for 8.8.
3. Delete the three names from lines 356–357.
4. Replace the "From TauCetiRoadmap.ClassFieldTheory" subsection by one sentence saying that Tau Ceti realizes Layer 12 there.
5. Cite the pinned names in the 6.1, 8.3 and 8.8 *Needs:* lines and in the Layer 6 and 8 Dependencies. In 6.1, take `z = ψ(𝔞) 𝔑𝔞^{−it}`.

**Test.**

- At `z = e^{iθ}` the pinned combination is `3 + 4 cos θ + cos 2θ`. It equals `0` at `θ = π` and `0.5` at `θ = 2π/3`, which is `2(1 + cos θ)²` both times.
- After the repair, the "does not realize" list contains none of the three names.

## R02 (P3) — 5.6 attributes `Re b = −∑ Re(1/ρ)` to a reality hypothesis that does not imply it

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1188–1190: "`Re b = −∑_ρ m_ρ Re (1/ρ)` under the reality hypothesis `Λ₀(conj s) = conj Λ₀(s)` … it is false for a general entire function of order one, since multiplying by `exp (c s)` changes `b` and no zero."

**Claim.** Reality is the hypothesis that makes the identity hold, and the factor `exp (c s)` shows that it is needed.

**Witness.** Take `f(s) = e^s · zetaEntireCompletion(s)`.

- `f` satisfies `f(conj s) = conj f(s)` and has the same zeros.
- Its `b` is `B + 1 = 0.976904`, while `−∑ Re(1/ρ) = −0.023096`.
- With real `c`, multiplying by `exp (c s)` keeps reality.

**Repair.** Replace the quoted clause with this text, and add `HasFunctionalEquation.eventuallyEq` to the 5.6 *Needs:*:

> `Re b = −∑_ρ m_ρ Re (1/ρ)` for a self-dual record (`d.dual = d`), as `ζ_K` and a real character are: `HasFunctionalEquation.eventuallyEq` gives `b(d) + b(d.dual) = −∑_ρ m_ρ (1/ρ + 1/(1 − ρ))`, and `ρ ↦ 1 − ρ` permutes the zeros, so the nonnegative real parts sum equally. Reality alone does not give it: `e^s · zetaEntireCompletion` is real on `ℝ`, has the same zeros, and its `b` is larger by `1`.

**Test.**

- At `ζ`, which is self-dual, `B = −γ_E/2 − 1 + ½ log 4π = −0.023096 = −∑ Re(1/ρ)`.
- `e^s · zetaEntireCompletion` is not self-dual, since `f(1 − s) = e^{1−2s} f(s) ≠ f(s)`. The restated hypothesis therefore excludes it.

## R03 (P3) — Internal ids `2.2`, `0.1` and `0.2` resolve to no heading

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md` cites "2.2" at lines 868, 912, 925, 1047, 1402, 1418, 1600 and 1625. Layer 2 (lines 736–758) labels only "(2.4)".
- `Suggested.lean` lines 69 and 82 read "Layer 0.1" and "Layer 0.2". Layer 0 (lines 381–476) has no numbered subsections.

**Claim.** These ids name targets.

**Witness.**

- No `### 2.2`, `### 0.1` or `### 0.2` heading exists, and no inline label exists either.
- AnalyticNumberTheoryPartI (#1126) cites "[ZerosOfLFunctions 0.1–0.2]" in its supplier table (its `README.md` line 84), which resolves nowhere.

**Repair.**

1. Split Layer 2 into these subsections, keeping the text:
   - `### 2.1 The three conductors` (the definitions and `1 ≤ analyticConductorAt`);
   - `### 2.2 Two-sided comparison`;
   - `### 2.3 Normalization translation`;
   - `### 2.4 Newform specialization`;
   - `### 2.5 The two families`.
2. Split Layer 0 into these subsections:
   - `### 0.1 The order predicate`;
   - `### 0.2 The entire completion`;
   - `### 0.3 Finite order`;
   - `### 0.4 Vertical-strip growth`.
3. Keep each Checks list with its subsection.

This adds ids and drops none.

**Test.** After the repair, every "2.2" in a *Needs:* line, and "Layer 0.1" and "0.2" in `Suggested.lean`, name an existing heading.

## R04 (P3) — The pull request's title, description and merge order are stale, and no order is stated against #1907 (previous R06, not repaired)

**Location.** The pull request's title reads "effective statements under the exclusion of Landau–Siegel zeros". Its description reads "Merge order: after AnalyticNumberTheoryPartI (#1126) lands, since the strengthened statements refer to its §0.34."

**Claim.** The head restates the roadmap without exceptional zeros, and it depends on AnalyticNumberTheoryPartI.

**Witness.**

- README lines 86–88 exclude "the nonexistence of exceptional zeros".
- `ORDER.txt` puts ZerosOfLFunctions at line 48 and AnalyticNumberTheoryPartI at line 50.
- #1907's `Suggested.lean` line 339 reads `rayClassPrimeCount_effective (n : ℕ)`; this head's line 307 reads `(K : Type*) … (𝔪 …)`.

**Repair.**

1. Retitle the pull request, and describe this head: the general-field headlines at the pin, the pinned record names, `TauCeti.IsPiecewiseC1On`, and the Bennett–Martin–O'Bryant–Rechnitzer and Hasanalizade–Shen–Wong counts.
2. Delete the merge-order sentence.
3. State which of #1913 and #1907 is rebased on the other. Both declare `heckeLFunction_zeroFreeRegion`, `riemannVonMangoldt_heckeLFunction`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian` in `TauCetiRoadmap.ZerosOfLFunctions`, with different statements.

**Test.** The new description agrees with README lines 86–88 and with `ORDER.txt` lines 48–50. Once one pull request is rebased on the other, `overlaps.md` reports no conflict.

## R05 (P3) — 8.8 attributes the nonabelian estimate to Lagarias–Odlyzko with no locator

**Location.**

- `TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 1890–1891: "Lagarias–Odlyzko prove the estimate for every Galois `L/K` through Artin L-functions".
- The References entry (lines 2080–2081) gives only "effective counting in a fixed Galois extension".

**Claim.** The source supports this statement.

**Witness.**

- Neither passage gives a theorem or a page, the entry is not marked "Cited by locator", and the work is not in the manifest.
- Later papers number the unconditional estimate differently, so the attribution cannot be checked as written.

**Repair.**

1. Give the theorem number and page of the unconditional estimate in Lagarias–Odlyzko, *Algebraic Number Fields* (Academic Press, 1977), pp. 409–464. The estimate carries the exceptional term `Li(x^{β₀})`, for `log x ≫ n_L (log d_L)²`.
2. Mark the entry "Cited by locator", as for Davenport and Lang.

**Test.** The 8.8 remark then names a theorem whose hypotheses can be compared with "every Galois `L/K`".

## Previous findings (PRREVIEW-ZerosOfLFunctions~19)

- **R01 — repaired.**
  - `Suggested.lean` now states `heckeLFunction_zeroFreeRegion` (line 154), `riemannVonMangoldt_heckeLFunction` (line 228), `rayClassPrimeCount_effective` (line 307) and `frobeniusPrimeCount_effective_abelian` (line 337).
  - Its docstring now names only "the completed Dedekind zeta function and the completed Hecke L-functions … which are not at the pins". A grep of the pin confirms that `completedDedekindZeta`, `completedHeckeLFunction` and `dedekindZetaC` are absent.
  - The README names the statements at 6.2, 6.4, 7.5, 8.7 and 8.8.
- **R02 — repaired.**
  - A grep for `regular_away|exact_pole_order|hasFunctionalEquation_eventuallyEq|reflectedPoint|dualCompleted|roadmap contracts|PrimitiveRayClassCharacter.inv|eq_away|completes` finds nothing.
  - Lines 240–258 list the pin names, and all 39 record, field and predicate names elaborate.
- **R03 — repaired.** Lines 212, 1473 and 1480 read `TauCeti.IsPiecewiseC1On`, and the file `Analysis/Calculus/ContDiff/PiecewiseC1On.lean` is given.
- **R04 — repaired.**
  - Lines 1577–1582 cite "Bennett–Martin–O'Bryant–Rechnitzer, Corollary 1.2, for conductor `q > 1` and `T ≥ 5/7`" and "Hasanalizade–Shen–Wong, Corollary 1.2". They keep Trudgian as the earlier statement, with the gap.
  - The References (lines 2061–2075) and `Suggested.lean` line 241 match.
- **R05 — repaired.** Lines 787–789 add "Tau Ceti `HeckeRing.GL2.Newform.analyticConductorAt` and `HeckeRing.GL2.Newform.analyticConductorAt_eq` … for 2.4".
- **R06 — not repaired.** The title and description are unchanged. Carried as R04.

## Verified sound

### Gate, dependency check and elaboration

- **Gate.** My run printed every check at 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and exited 0. The worker's gate, which includes `build=0`, also passes.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0 and prints no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 240 roadmaps, 2322 edges, 0 problem(s)
```

- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0 with exactly 17 "declaration uses `sorry`" warnings (lines 97–337). There are 20 declarations: 3 definitions with real bodies and 17 theorems.
- **Imports.** The 6 `TauCeti.*` imports all exist at the pin, with object files.
- **`#check` comparison.**
  - I put `#check @name` for all 20 declarations in one scratch copy and elaborated it with no error.
  - Every elaborated type matches its README statement and `signatures.md`. No `variable` block exists, so no binder can be lost.
  - The new statements quantify `∀ K : Type u_1` under the existential, which is harmless.
  - `frobeniusPrimeCount_effective_abelian` carries `[IsAbelianGalois K L]` (Mathlib, elaborated).
- **Padding probe.** I decided it by reading the statements and the pin.
  - Each of the 17 theorems is existential over a deep analytic constant, or about a `sorry`-free definition, and none follows from one library lemma.
  - The five `K = ℚ` instances are stated on Mathlib's `riemannZeta` and `DirichletCharacter.LFunction`. Their connection to `heckeLFunctionC` over `ℚ` is itself a theorem, so they are not one-step restatements.
  - `dirichletLFunction_zeroFreeRegion` also covers imprimitive characters.

### Library declarations opened this round

I opened 37 declarations at their file and line:

- **Contour integration.**
  - `TauCeti.IsPiecewiseC1On` (`Analysis/Calculus/ContDiff/PiecewiseC1On.lean:91`);
  - `argumentPrinciple_nullHomologous` (`Analysis/Contour/Argument/Cycle.lean:110`). It gives `∫ γ'·logDeriv f(γ) = 2πi ∑_{S} windingNumber·ord`, with `S` allowed outside `U`, as 7.2 says;
  - `windingNumber`, `IsNullHomologous` and `isNullHomologous_iff` (`Winding/Number/Basic.lean:76, 147, 152`).
- **Hecke L-functions and ray classes.**
  - `heckeLFunctionC` (`LFunctions/Hecke/Basic.lean:74`) is `meromorphicContinuation 1` of the presented series, in normal form on `ℂ`;
  - `heckeLFunctionC_eq_primitive` and `heckeLFunctionC_eventuallyEq_primitive` (`:130`, `:138`);
  - `meromorphicContinuation` (`Analysis/Meromorphic/Continuation.lean:72`), which is `0` without a continuation;
  - `PrimitiveRayClassCharacter`, `of`, `One`, `Inv` and `of_inv` (`Hecke/Primitive.lean:91, 135, 175, 192, 213`);
  - `eulerCorrection` and `eulerCorrection_self` (`:236`, `:257`);
  - `RayClassCharacter`, defined as `RayClassGroup 𝔪 →* ℂˣ` (`RayClass/Character/Basic.lean:62`), and `Modulus` (`RayClass/Modulus.lean:98`);
  - `finiteEulerCorrection` (`LFunctions/DedekindZeta/PartialZeta.lean:198`);
  - `rayClassIdealMainTerm` and `rayClassIdealMainTerm_eq` (`RayClass/MainTerm.lean:56, 62`).
- **Chebotarev counts.**
  - `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`), which counts unramified primes only;
  - `frobeniusPrimeSet` (`Chebotarev/FrobeniusPrimeSet.lean:93`);
  - `tendsto_frobeniusPrimeCount` and `hasNaturalDensity_frobeniusPrimeSet` (`PrimeCounting/FrobeniusPrimeCount.lean:91, 108`).
- **Ideal arithmetic and newforms.**
  - `idealSummatory_mul_eq_sub_integral_mul` (`ArithmeticDirichletSeries/AbelSummation.lean:390`);
  - `primeIdealTheorem` (`Prime/PrimeIdealTheorem.lean:39`), which is qualitative only, so 8.5 duplicates nothing;
  - `HeckeRing.GL2.Newform.analyticConductorAt` and `analyticConductorAt_eq` (`ModularForms/Newforms/AnalyticInvariants.lean:125, 133`), read at the pin.
- **The R01 witnesses.** The 7 declarations listed in R01.
- **Mathlib.**
  - `AnalyticOnNhd.sum_divisor_le` (`Mathlib/Analysis/Complex/JensenFormula.lean:389`) takes `1 ≤ M`, `f c ≠ 0` and the bound on `sphere c |R|`, as 4.3 says;
  - `logDeriv_riemannZeta_one_sub` (`Mathlib/NumberTheory/LSeries/RiemannZetaLogDeriv.lean:35`).

### Names elaborated

- **Tau Ceti.** 88 cited names elaborate by `#check`, including all 39 record, field and predicate names of the "From Tau Ceti" list. Six more are in modules my scratch file did not import, and I located each at its line above.
- **Mathlib.** 86 cited names elaborate, including `Complex.borelCaratheodory`, `PhragmenLindelof.vertical_strip`, `ValueDistribution.log_counting_zero_sub_logCounting_top` and `IsAbelianGalois`.

### Cross-roadmap citations resolved

- **L-functions** (on main, `ORDER.txt` line 27, before line 48). All 27 Layer 2–8 names cited as unrealized occur in its `Suggested.lean`. Examples: `partialZeta_eq_sum_heckeLFunctionC`, `completedHeckeLFunction_one_sub_eventuallyEq`, and `Grossencharacter.heckeMellinTotal` (namespace at line 2092).
- **Class Field Theory** (on main). Layer 12 starts at README line 1724; `rayClassArtinMap` is at line 1756, and its `Suggested.lean` declares the three names at lines 3730–3756.
- **Completed roadmaps.** Arithmetic Dirichlet Series, Global Number Fields, Number Field Arithmetic, Chebotarev and Contour Integration are on main under `Completed/`.
- **Modular Forms.** It cites the pinned newform conductor, not this roadmap.
- **`citations.md`.** Its 13 leads are false positives: the six `Grossencharacter.*` names are in L-functions' `Suggested.lean`, and the seven others are PrimeNumberTheoremAnd names of the Provenance table.

### Ownership and overlaps

- `roadmaps grep` over the open heads finds this roadmap's headline names only in #1907 (the same roadmap; see R04).
- ExplicitPrimeCounting (#1945) and AnalyticNumberTheoryPartIII (#2008) use their own region hypotheses. ExplicitZetaBounds (#1954) and AnalyticNumberTheoryPartI (#1126) cite this roadmap's sections as suppliers. They sit later in the merge order, so neither is a second owner.
- `overlaps.md` reports no dropped id. The new statements live in `TauCetiRoadmap.ZerosOfLFunctions`, a namespace no other roadmap uses.
- AnalyticNumberTheoryPartI's claim to own the uniform exclusion of Landau–Siegel zeros (its §0.34) is that roadmap's matter. This README neither cites nor endorses it.

### Sources

- **Seeded sample.**
  - 1.1, 1.6, 4.1, 4.4, 6.3 and 7.2 cite no external source. Their pinned and Mathlib inputs were checked above.
  - 1.3a: DLMF 5.6.6, read this round from §5.6(ii) (fetched into a scratch copy of the manifest; the real manifest is untouched).
  - 1.2–1.5: `dlmf5` lines 104–108 (5.11.1, sector `|ph z| ≤ π − δ`), lines 158–160 (5.11.2) and lines 490–524 (5.11.9, uniform for bounded `x`).
  - 5.6 and 6.4(4d): `kadiri2012` lines 230–237 (§2.1.2, the real-part formula with `½ log d_K`, `Re 1/s`, `Re 1/(s − 1)`).
  - 6.2: `kadiri2012` lines 79–85 (Theorem 1.1).
  - 6.4: `kadiri2012` lines 65–73 ((1.5)–(1.6), reporting Lagarias–Montgomery–Odlyzko Lemma 2.3).
  - 7.5: `bennett2021` lines 56–58 and 83–84 (Corollary 1.2, `q > 1`, `T ≥ 5/7`, zeros with `0 < β < 1`), and `hasanalizade2022` lines 26–27 and 63–65 (Corollary 1.2, `T ≥ 1`).
  - 6.1, 6.5, 7.6, 8.3 and 8.8 rest on the pinned declarations above, on Davenport (8.3), on Titchmarsh (7.6) and on Lagarias–Odlyzko (8.8; R05). These are under "Not verifiable".
- **Unverified flags.** The README flags no locator as unverified.

### Adversarial table

The values were computed this round, with a Python script (primes to `10⁶`; the Stirling and constant values), Lean `#check`, and by hand where shown.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `heckeLFunction_zeroFreeRegion` (new) | `ℚ(i)`, `ψ = 1`, `t = 10` | coordinate log `6.51619`; analytic conductor log `6.52002`; LMO `log 4 + 2 log 12 = 6.35611`; difference `0.00383 ≤ 2 log(4/3) = 0.57536` | sound | none |
| same, nesting factor | any `n` | `1 + log(4/3)/log 3 = 1.26186 < 1.27` | sound | none |
| same, degenerate | `K = ℚ`, `ψ = 1`; pole; `n = 0` | `−2` excluded iff `c < 3 log 3 = 3.29584`; pole order `−1` not `> 0`; no field of degree `0` | sound | none |
| `riemannVonMangoldt_heckeLFunction` (new) | `ℚ`, `ψ = 1`, `T = 100` and `2` | open-strip count `58` against `56.25469`, gap `1.745 ≤ 4.605 C`; at `T = 2`: `0` against `−1.36538` | sound | none |
| same, a quadratic field | `ℚ(i)`, `T = 100` | main term `156.6365 = 56.2547 (ζ) + 100.3818 (χ₋₄, q = 4)`: degree 2 adds correctly | sound | none |
| `riemannVonMangoldt_dirichlet` | BMOR Corollary 1.2, `q ≥ 3`, `T ≥ 2` | `0.247 log qT + 6.894 ≤ 4.095 log qT` since `log qT ≥ log 6` | sound | none |
| `rayClassPrimeCount_effective` (new) | `ℚ`, `(3)∞`, `x = 10⁶` | classes `1`, `2`: `39231`, `39266` against `Li/2 = 39313.25` | sound | none |
| `primeCounting_progression_effective` | `q = 4`, `a = 3`, `x = 10⁶` | `39322` against `39313.25`; `a = 1`: `39175` | sound | none |
| `primeIdealCount_effective` | `ℚ`, `x = 10⁶` | `78498` against `Li = 78626.50` | sound | none |
| `frobeniusPrimeCount_effective_abelian` (new) | `ℚ(i)/ℚ`, class of conjugation; `K = L = ℚ` | `39322` against `(1/2)·78626.50`; `78498` against `78626.50` | sound | none |
| `dirichletLFunction_zeroFreeRegion` | principal `χ` modulo 2 at `0` | with `c ≤ log 3/2`, boundary `1 − 0.5493/log 6 = 0.6934 > 0`, so the zeros on `Re s = 0` are excluded | sound | none |
| `riemannZeta_zeroFreeRegion` | `s = −2`; `s = 1` | needs `c < 3 log 3`; `s ≠ 1` excluded | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1` | left sides `≤ −ζ'/ζ(2) = 0.569961`; `C ≥ 1.569961/log t₀` suffices | sound | none |
| `chebyshevPsi_explicitFormula` | `x = 2` | `c_ℚ = −log 2π = −1.837877`; `−½ log(1 − 1/4) = 0.143841`; signs match Davenport §17 | sound | none |
| `riemannZeta_weilExplicitFormula` | constant term of `logDeriv Gammaℝ` | `−(log π) φ(1) = −1.144730 φ(1)` | sound | none |
| `hadamard_of_orderLE_one` | `1 − s`; `exp` | `a = 0`, `b = −1`; empty product, `b = 1` | sound | none |
| `riemannZeta_zeros_summable_ordinate`; `dirichletLFunction_convexity` | first zero pair; `q = 1`, `t = 0` | `2/(1 + 14.1347²) = 0.00996`; `‖ζ(½)‖ = 1.46035 ≤ C · 3^{1/4+ε}` | sound | none |
| 1.1 (sample) | `S_δ` at `2`; `Γ(it)`, `t = 10` | `log S_δ = (0, ∞) × (−(π−δ), π−δ)` is convex; `logGamma 3 = log 2 = 0.693147`; `Im log Γ(10i) ≈ 12.2405 = 3.896π`, so the principal log jumps | sound | none |
| 1.3a (sample) | `½ + i`; `Re s = 3/2, 3, −½` | `‖Γ‖² = π/cosh π = 0.271015 ≤ π`; `Γ(3/2) = 0.886227`, `Γ(3) = 2`, `Γ(−½) = −3.544908 < 0` | sound | none |
| 1.5 (sample) | `gammaR = {0, 1}` against `gammaC = {0}` | both give `A(σ) = σ − ½` and rate `π\|t\|/2`, as `Gammaℝ(s) Gammaℝ(s+1) = Gammaℂ(s)` requires | sound | none |
| 1.6 (sample) | `ζ` at `0`; `F = 1/((s−2)(s+1))` | `continuedL = −0.5` against raw `0`; `F(1−s) = F(s)`, yet the assigned values `F(2) = 1 ≠ F(−1) = 0` | sound | none |
| 4.1 (sample) | `z(z − 1)`, `z/(z − 1)` on `closedBall 0 2` | counts `2`; `1` against signed `0` | sound | none |
| 4.3 (sample) | `z` (`r = ¼`, `R = ½`); `z/10`; `1 − z/2` | trailing bound `2` (true `1`); `3.3219`, scaled `2.3219`; `1.7095` | sound | none |
| 4.4 (sample) | base `2 + iT` | `‖L‖ ≥ ζ_K(2)⁻¹ ≥ 0.60793ⁿ`; `3/2 + 1 = 5/2 ≤ 3` | sound | none |
| 5.6 (sample) | `ζ`; `e^s · zetaEntireCompletion` | `B = −0.023096 = −∑ Re 1/ρ`; the real-on-`ℝ` multiple has `b = 0.976904` | wrong hypothesis | R02 |
| 6.1 (sample) | `θ = 0, 2π/3, π, 1.9` | `8`, `0.5`, `0`, `0.915874 = 2(1 + cos θ)²`; pinned `threeFourOneCombination_nonneg` | pinned | R01 |
| 6.3 (sample) | the cap | `c/log q(χ,0) ≤ (log 3/2)/log 3 = 0.5`, so `β ≥ ½` | sound | none |
| 6.5 (sample) | `χ₋₄` at `1` | `2 · (1/π) · (π/4) = 0.5`, order `0` | sound | none |
| 7.2 (sample) | `z − 2`, `z`, `1/z` on `[−1, 1]²` | integral `0` against `∑_S ord = 1`; `1 = 1`; `−1` | sound | none |
| 7.6 (sample) | the averaged count | `∫₀ᵀ (N(t+1) − N(t)) dt = ∫_T^{T+1} N − ∫₀¹ N`, and `∫₀¹ N = 0` for `ζ` | sound | none |
| 8.3 (sample) | `ℚ(i)` at `x = 2`; `ℚ(√5)` | trivial-zero terms `log 2 = 0.693147`; `ζ_K(0) = 0`, order `1 = r₁ + r₂ − 1` | sound | none |
| 8.8 (sample) | `ℚ(i)/ℚ`, `(4)∞`; the Lagarias–Odlyzko remark | coefficient `½`; no locator | locator | R01, R05 |
| Layer 2, 0 ids | grep | `2.2` cited 8 times with no label; `0.1`, `0.2` absent | id | R03 |

## Not verifiable

- **Paywalled books, cited by locator.** These were not read:
  - Davenport, *Multiplicative Number Theory*, §§11–20 (8.3's formula was recomputed instead);
  - Titchmarsh, Theorem 9.4, p. 214 (7.6);
  - Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1 (8.4; the formula was rederived);
  - Iwaniec–Kowalski §§5.1–5.2.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** It is settled as uncertified, and was checked only through `kadiri2012` lines 65–73.
- **Lagarias–Odlyzko 1977.** It is paywalled and has no locator (R05).
- **PrimeNumberTheoremAnd Provenance table.** The cached `primenumbertheoremand` text is the repository README only (36 lines), and contains none of the listed declarations. They were not checked this round. The section prescribes nothing.
- **`HeckeRing.GL2.Newform.analyticConductorAt`.** It was read at the pin, but not elaborated, because its module has no object file in this checkout.

## Source issues

- **Error** in kadiri2012 at §1, (1.6), p. 2: the source says Lagarias–Montgomery–Odlyzko prove that `L(s, χ)` has no zeros in region (1.6). Near the real axis, (1.6) lies inside (1.5), where one exceptional zero is allowed. It should read "no zeros other than the possible exceptional zero of (1.5)". Affects nothing.
- **Gap** in trudgian2015 at Theorems 1–2 (pp. 1, 6): the source says one parameter inequality in the Backlund-trick step follows from the others. It should verify every inequality, as the corrected proofs do. Affects a stated result; corrected in print at Bennett–Martin–O'Bryant–Rechnitzer, Math. Comp. 90 (2021), Corollary 1.2, and Hasanalizade–Shen–Wong, Math. Comp. 91 (2022), Corollary 1.2.
