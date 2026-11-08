# PORT-ExplicitNumberFields: port of ExplicitNumberFields to the roadmap repository

## Result

- Branch: `roadmap/explicit-number-fields`, one commit on `eaf17b1`: head `6c7e499d`,
  "ExplicitNumberFields: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/ExplicitNumberFields/README.md` (3088 lines),
  `TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` (272 lines, 12 theorems, 5 definitions),
  `TauCetiRoadmap/ExplicitNumberFields/metadata.toml` (`topic = "math.NT"`, the form of
  `TauCetiRoadmap/ZerosOfLFunctions/metadata.toml` and `TauCetiRoadmap/LFunctions/metadata.toml`).
  Nothing outside the folder is touched (`git diff --stat origin/main...HEAD`: 3 files, all in the
  folder).
- Build, `lake build TauCetiRoadmap.ExplicitNumberFields.Suggested`: exit 0, last line
  `Build completed successfully (18674 jobs).`. **12 warnings**, each
  `declaration uses 'sorry'` (one per theorem), and no other warning or error.
- Gate:
  `gate ExplicitNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), full output:

      depcheck: 240 roadmaps, 2440 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.

## Draft pull request body

Explicit number theory needs numerical constants for number fields, not just existential ones:
the count of integral ideals of norm at most `x` with an explicit error, two-sided bounds for the
residue `κ_K` of the Dedekind zeta function, class-number, regulator and relative class-number
bounds, and zero counts, zero-free regions and the Chebotarev and least-prime-ideal theorems with
numerical constants. Mathlib and Tau Ceti have the carriers (the Dedekind zeta function and its
residue, class number, regulator, CM fields, ray class groups, Mertens' constant, Frobenius prime
sets) but only existential estimates. This roadmap builds the explicit theory on those carriers.
It covers:

- the explicit Lipschitz lattice-point count and the ideal counts of Sunley, Lee, Debaene,
  Fehnker, Gun–Ramaré–Sivaraman and Ramaré;
- the residue bounds of Louboutin, Friedman and Stark, and the GRH bounds of
  Garcia–Grenié–Lee–Molteni, Palojärvi–Simonič and Garcia–Lee;
- Bordellès' regulator-free class-number bounds, and Louboutin's upper and lower bounds for
  relative class numbers;
- explicit Riemann–von Mangoldt formulae, Stark-like and zero-free regions and zero repulsion for
  `ζ_K`;
- the consequences of a uniform real-zero gap for quadratic fields, including an effective
  Brauer–Siegel bound for Galois fields;
- the least primitive root modulo `p` and `p²`, and Grosswald's conjecture under GRH;
- Garcia–Lee's three Mertens theorems, the explicit Chebotarev theorems, the least prime ideal
  with a given Frobenius class, and Debaene's Brun–Titchmarsh inequality.

Every finite verification a source relies on is a named predicate carried as a hypothesis, and
results resting on unrefereed preprints are stated beside a refereed counterpart. `Suggested.lean`
states the twelve headline theorems that are statable at the pins, with the five definitions they
need. Its docstring names the headlines that need the continued `ζ_K`, Hecke L-functions or the
abelian conductor, none of which exists at the pins.

Written with Claude (Opus 5.5) from the accepted board package. I checked the citations against
the cited roadmaps, and the headline statements against the cached sources.

## Roadmaps this one depends on that are still pull requests

- New-roadmap pull requests, all earlier in the merge order. I checked the cited sections at their
  indexed heads:
  - AnalyticNumberTheoryPartI: §§0.34, 0.34a, 1.6, 2.5, 2.7, 2.9a, 2.15, 2.15a, 2.17a, 2.18, 2.21,
    2.22, 2.31d, 2.31e, 2.39, 2.39b, 2.42, 2.43, 2.46, 2.49;
  - CyclotomicClassGroupsAndStickelberger: §3.4;
  - ComputationalNumberTheory: §4.17a;
  - SmallRamificationAndAbelianVarietyBaseCases: §1.7, cited in Scope only;
  - EffectiveClassNumbers: cited in Scope only.
- Earlier in the merge order but neither on main nor in an open pull request: ExplicitZetaBounds,
  ExplicitPrimeCounting, ExplicitCharacterSumsAndSieves and ExplicitMultiplicativeFunctions.
  - The cited sections exist in their board packages:
    - `packages/ExplicitPrimeCounting/README.md` §§1.7, 2.2, 4.7, 6.5;
    - `packages/ExplicitMultiplicativeFunctions/README.md` §§7.5, 7.9, 8.1, 9.1, 9.4.
  - ExplicitZetaBounds and ExplicitCharacterSumsAndSieves have only target files, so their
    "Required location" lines name the targets of those files.
- On main: LFunctions, ZerosOfLFunctions, ClassFieldTheory, ClassicalArithmeticCompletion,
  ImaginaryQuadraticClassNumber, SuccessiveMinima, Completed/GlobalNumberFields,
  Completed/Chebotarev, Completed/EffectiveBounds and Completed/ArithmeticDirichletSeries.
- No citation uses a numbering that only an open revision defines. `scratch/overlaps.md` lists no
  dropped id and no other pull request that changes this roadmap.

## What moved from the Lean to the README

Nothing moved out. The package file already met the acceptance-test form: headlines only, five
definitions with real bodies on native carriers, no sorry'd data and no `set_option`. Changes:

- **Added: the third Mertens theorem.** Garcia–Lee's (C1)–(C2) is now the third conjunct of
  `primeIdeal_mertens_garciaLee`. It reads
  `|e^γ κ_K log x ∏_{N𝔭 ≤ x}(1 − 1/N𝔭) − 1| ≤ Θ e^Θ` with `Θ = n/(x − 1) + 2Υ_K/log x`.
  - It is statable at the pins and is part of the headline "Garcia–Lee's explicit Mertens
    theorems" (`garcialee2022mertens` lines 98–101 and 115).
  - It is equivalent to (C1)–(C2) with (B2) substituted, because `t ↦ t eᵗ` is increasing.
  - README 7.1 states it the same way, with a new Check pinning the `e^γ` normalisation.
- **Reordered.** Sections now follow README order:
  - `starkAlpha` moves from the Layer 0 section to Layer 4 (README 4.7);
  - `classNumber_maximalRealSubfield_dvd` moves from Layer 5 to Layer 0 (README 0.4).
- **Docstring.** It now names, besides the non-statable headlines, the statable targets that stay in
  the README as variants:
  - Lee's count (2.3), whose constant differs between the two printings;
  - Ramaré's counts (2.7);
  - Louboutin's refinements (3.2, 5.1, 5.2) of AnalyticNumberTheoryPartI §2.15;
  - Bordellès' other forms (5.3);
  - (M2) (7.1);
  - Kadiri–Ng–Wong's thresholded least prime ideal (7.4).
  - I could not check 3.2 and 5.2 against the cached `louboutin2005` text, which drops their
    displays.
- **Kept.** `module` header, `import Mathlib` and the four Tau Ceti modules. All exist at the pin.

**`#check @name` pass.** I appended `#check @TauCetiRoadmap.ExplicitNumberFields.<name>` for all 17
declarations to the file, ran the one allowed build, and removed the lines again.
- I compared each elaborated type with its README statement; all agree.
- The file has no `variable` block, so no binder can be lost.
- Real exponents are `ℝ`, natural exponents (`10 n²`, `12 n²`, `8n`, `4n`, `12577`) are `ℕ`, and
  `n − 1` inside `Υ` is real subtraction.
- The only change from the package's elaborated signatures is the new third conjunct of
  `primeIdeal_mertens_garciaLee`.

## Supplier replacements and duplication removals

No new removal was needed. The package's removals stay recorded in Scope: Odlyzko to
AnalyticNumberTheoryPartI §2.9a, the coefficient bound to §2.15a, `h(p)` to Tau Ceti's
`conreyGenerator`, and the Mertens series to LFunctions Layer 8. Citation repairs:

- **Heilbronn's theorem is AnalyticNumberTheoryPartI §2.39, not §2.31e.** The README attributed
  "a simple real zero of `ζ_N` for Galois `N` comes from a quadratic subfield" to §2.31e. At the
  head, §2.31e is the fixed-degree residue lower bound, which contains Stark's Lemma 8 argument
  (near-one zeros, without normality). §2.39 states the theorem.
  - Now cited as §2.39 at the Galois simple-zero uses: 4.3 corollary, 4.9, 5.6, 5.7, 7.3 and the
    dependency lists.
  - §2.31e stays where Stark's Lemma 8 is used (4.7). The supplier contract describes both.
- **ClassFieldTheory's `abelianConductor` is in Layer 12, not Layer 13** (its README lines
  1752–1755). Fixed in Scope, in the supplier contract (which now lists Layer 12 with
  `isAdmissibleModulus_iff_abelianConductor_dvd`), in 7.5 and in the Layer 7 dependencies. The
  conductor–discriminant formula and `hilbertClassField` stay in Layer 13.
- **Scope gains one comparison.** CyclotomicClassGroupsAndStickelberger §3.4 defines `h(F)/h(F⁺)`
  for abelian CM fields as a rational, integral at prime-power conductors. 0.4 proves
  `h(K⁺) ∣ h(K)` for every CM field.

Duplication sweep, by object, against main and the 472 open heads (`roadmaps grep`) and the pins.
I searched:
- relative class number and `maximalRealSubfield`;
- Friedman's regulator bound;
- least primitive roots, Grosswald and the Vinogradov sieve;
- Mertens for number fields, Brauer–Siegel, Rademacher, the ideal counts, Stark, Louboutin and
  Brun–Titchmarsh.

What I found:
- The only hits are the cited owners, plus the following, all distinct objects:
  - ClassicalArithmeticCompletion (revision #1409): Belabas–Diaz y Diaz–Friedman generators.
  - GlobalNumberFields (revision #1339): coarse unit-lattice regulator bounds, not Friedman's.
  - CharacterSumsOverFiniteFields: uses `conreyGenerator` only to label characters.
  - SieveMethodsAndPrimePatterns §1.6: Brun–Titchmarsh for progressions over `ℚ` with an absolute
    constant, not the Chebotarev form of 7.5.
  - IntegralIwasawaTheory: relative class numbers of cyclotomic layers only.
- ZerosOfLFunctions (revision at the head of #1913) explicitly leaves to others the field-level
  consequences of excluding Landau–Siegel zeros over `K ≠ ℚ`. So 4.9 and 5.7 have one owner.

Ownership against open pull requests: checked through the tool's index for every roadmap named
above and the vocabulary neighbours of `scratch/overlaps.md` (AnalyticNumberTheoryPartI,
ZerosOfLFunctions ×2, SieveMethodsAndPrimePatterns, ErdosProgressionPowers). No declaration of
`Suggested.lean` has another roadmap's fully qualified name. `GRHMod` restates the body of
AnalyticNumberTheoryPartI's `DirichletGRH` quantified over the characters modulo `q`, because that
roadmap is still a pull request and cannot be imported.

## Fixes a mathematician would flag (upstream read)

1. **Wrong supplier section.** Heilbronn's theorem was cited as AnalyticNumberTheoryPartI §2.31e;
   it is §2.39 (above).
2. **Wrong layer.** `abelianConductor` was cited as ClassFieldTheory Layer 13; it is Layer 12
   (above).
3. **Wrong description of Ramaré's fields (2.3 Check).** Ramaré's Corollary 1.6 was described as
   "the thirteen fields with `d_K ≤ 68`". There are 23 imaginary quadratic fields with
   `|d_K| ≤ 68`. The thirteen are the `ℚ(√−m)` listed in 2.7, with discriminants between `−68`
   and `−3`. Corrected.
4. **Lee's `λ(2)` (2.3 Check).** It was printed `1.4735·10⁹`. The closed form gives
   `1.473191·10⁹`; the resulting `A_L(2) = 2.4913·10¹⁰` matches Table 1. Corrected to `1.4732·10⁹`.
5. **Louboutin's constants (4.4) were truncated, not rounded.** `C₁ = 0.343146`,
   `D₁ = 0.276447`, `C₂ = 0.620756`, `D₂ = 0.500097`. Now `0.34315, 0.27645, 0.62076, 0.50010`.
6. **The third Mertens theorem** was in the README only as an unnamed "product statement". It is
   now a bullet of the headline, with a normalisation Check: at `ℚ(i)`, `x = 10` the quantity is
   `0.9162`; with `e^{−γ}` it would be `0.2888`.

## Adversarial pass

Values computed in this run (Python on the stated formulas; primitive roots by direct order
computation; the `ℚ(i)` counts by enumeration).

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `idealCount_sunley` (2.2) | `ℚ(i)`, `x = 10`; source | count `9` (`r₂(m)/4` summed), `κx = 7.8540`, error `1.1460`; RHS `> e^{61}`; `sunley1973` line 112 counts `N𝔞 < x`, the limit from the right gives `≤ x` | true | — |
| `idealCount_debaene` (2.4) | cubic `−23`; `n = 1`; source lines 107–115 | `R = 0.281200`, `1 + log R = −0.2687` (printed form false), `1 + log⁺ = 1`; `n = 1`: `|⌊x⌋ − x| ≤ 1` | true with `log⁺` | — |
| `classIdealCount_debaene` (2.4) | carrier at the pin | `rayClassIdealCountingFunction (Modulus.one K)` counts nonzero integral ideals of class `c`, norm `≤ x` (`Count/Basic.lean:100`); main term `κ/h` matches lines 116–124 | true | — |
| `rayClassIdealCount_gunRamareSivaraman` (2.5) | `ℚ`, `𝔮 = (1)`; source lines 66–81 | `F = 2`, `E(ℚ) = 1039.72`, bound `3729.86`; without `2^{r₁}`: `1144.25`; `E`, `F`, main term match term by term | true | — |
| `dedekindZeta_residue_ge_friedman` (3.3) | `ℚ(i)`; cubic `−23`; source lines 1214–1225 | `0.7854 ≥ 0.1812`; `0.3684 ≥ 0.0755`, `R/w = 0.1406 ≥ 0.09058` | true | — |
| `starkAlpha`, `HasNormalTower` (4.7, 0.5) | `ℚ(ζ₅)`; `ℚ(2^{1/4})`; non-Galois cubic; source lines 1247–1253 | `4`; `16`; `24`; definition order Galois → tower → `4n!` matches (24) | discriminates | — |
| `dedekindZeta_residue_gt_stark` (4.7) | `c₄`; `ℚ(ζ₇)⁺`; cubic `−23`; source lines 1254, 1271–1277 | `c₄ = 43.162115`; `0.001488 < κ = 0.3003` (`R = 0.525455`); `3.08·10⁻⁴ < 0.3684`; `1/(16c₄) = 0.00144803 > 1/(43.2·16) = 0.0014468` | true | — |
| `classNumber_le_bordelles` (5.3) | `ℚ`; `ℚ(√−14)`; cubic `−23`; `ℚ(ζ₅)`; source lines 193–198 | `1 ≤ 1`; `4 ≤ 60.25`; `1 ≤ 94.30`; `1 ≤ 1677.95` | true | — |
| `classNumber_maximalRealSubfield_dvd` (0.4) | `ℚ(√−5)`; `ℚ(ζ₈)` | `h⁺ = 1 ∣ 2`; `1 ∣ 1` | true | — |
| `relativeClassNumber` + formula (0.4) | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `Q w √(d/d⁺) L(1,η)/(2π)ⁿ = 1, 1, 2, 8·5.657·0.8724/39.478 = 1.000`; with `2ⁿ/Q` in place of `2^{n−1}/Q`: `2` at `ℚ(ζ₈)` | true | — |
| `relativeClassNumber_le` (5.5) | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)`, `d = 163`; `louboutin2003` line 605 | `4.798 ≥ 1`, `4.939 ≥ 1`, `11.592 ≥ 2`, `12.717 ≥ 1`, `56.27 ≥ 1`; display matches | true | — |
| `GRHMod` (0.5) | `q = 1, 2, 4`; ANT-I `DirichletGRH` at the head | `q = 2`: zeros of `1 − 2^{−s}` on `Re s = 0` excluded by `0 < Re s`; body identical to `DirichletGRH` quantified over `χ mod q` | true | — |
| `leastPrimePrimitiveRoot` (0.6) | `m = 2, 3, 7, 409, 2791` | `ĝ = 3, 2, 3, 29, 53`; `g(409) = 21` composite; no prime `< 29` is a primitive root mod `409` | as Checks | — |
| `leastPrimePrimitiveRoot_le_grh` (6.4) | `p = 10⁹+7` (`ω = 2`); `1000000021` (`ω = 6`); source lines 56–61 | `9894.6 < √p − 2 = 31620.8`; `4.36·10⁶`; display matches (2) | true | — |
| `primeIdeal_mertens_garciaLee` (A), (B) (7.1) | `ℚ(i)`, `x = 2`; source lines 89–126 | `|0.3466 − 0.6931| = 0.3466 ≤ Υ`, `Λ_{ℚ(i)} = 5.35·10³⁰`; `Λ`, `Υ` term by term | true | — |
| `primeIdeal_mertens_garciaLee` (C) (new) | `ℚ(i)`, `x = 2, 10`; `ℚ`, `x = 10⁶` | `|0.4848 − 1| = 0.5152`, `|0.9162 − 1| = 0.0838`, both `≤ Θe^Θ` (`Θ ≥ 2`); `ℚ`: `e^γ log x ∏(1 − 1/p) = 0.99996`; with `e^{−γ}`: `0.2888` | true | added |
| (M2) (7.1, README) | `ℚ(i)`; `Σ_p 1/(p(p−1))` | `[−1.664, 0.336]`; `0.7732 < 1` | consistent | — |
| `leastPrimeIdeal_ahnKwon` (7.4) | `L = ℚ(i)`, `K = ℚ` | least primes `3` (conjugation), `5` (identity) `≤ 4^{12577}`; `L = ℚ` excluded by `2 ≤ [L:ℚ]` | true (source not readable here) | — |
| 0.1 `μ_K`, `b_K` | `ℚ(i)`, `ℚ(√−14)`, `ℚ(√5)`, `ℚ` | `b = 1.2732, 4.7640, 1.1180, 1`; ratio bound `0.56419` | true | — |
| 0.2 `Λ_S` | `S = {2}` | `8.49264`; `2π²Λ = 167.638`, `32π²Λ = 2682.21`, `270Λ = 2293.0` | true | — |
| 2.3 Lee | `n = 2, 3` | `𝔪(2) = 2.4674`, `λ(2) = 1.473191·10⁹`, `A_L(2) = 2.4913·10¹⁰`, `A_L(3) = 8.4509·10¹¹` | Check value off | `λ(2)` fixed |
| 2.3 Check fields | imaginary quadratic `|d| ≤ 68` | 23 fields vs the 13 `ℚ(√−m)` of 2.7 | description false | fixed |
| 4.3 constants | `m = 1, 2`; `ℚ(ζ₇)⁺` | `c₁ = 0.343146`, `c₂ = 1.071797`, `c'₁ = 0.620756`, `e^{1.2416} = 3.4608`; `σ₂ = 0.72460` | true | — |
| 4.4 `S₀` etc. | `P` on `[0, 1]`, `[1, √2]` | `S₀ = 0.454334`, second root `1.221332`, `P(√2) = 2`, min `−1.1068` at `0.8892`; `D₁ = 0.276447`, `C₂ = 0.620756 = 1/1.61094`, `D₂ = 0.500097` | true; rounding off | rounding fixed |
| 6.x primitive roots | `p = 2, 3, 5, 7, 40487` | `h = 3, 2, 2, 3, 10`, `g(40487) = 5` | as Checks | — |
| 7.2 Check | `ψ_{ℚ(i)}(100)`; bound | `93.93`; `10(2.733·1.386 + 2.844·2) = 94.76` | true | — |
| AnalyticNumberTheoryPartI citations | §§2.31e, 2.39 at the head | §2.31e = fixed-degree residue lower bound with Stark's Lemma 8; §2.39 = Heilbronn | citation wrong | fixed |
| ClassFieldTheory citation | `abelianConductor` | defined in Layer 12 (lines 1752–1755) | citation wrong | fixed |

The package's own pass (in `reports/PKG-ExplicitNumberFields.md`) covers the remaining Checks. I
re-ran the ones whose values recur in the headlines.

## Unresolved

- **No review file.** The brief points to an accepted review `review.json`, but the package
  directory has none. Only `reports/REV-DESIGN-ExplicitNumberFields.md` (a `needs_changes` design
  review) and the later FIX-DESIGN and PKG reports exist. I checked all 26 design-review findings
  (F01–F26) against the README; each is addressed.
- **Unverifiable sibling citations.** ExplicitZetaBounds and ExplicitCharacterSumsAndSieves have
  no README yet. Their "Required location: target N" lines refer to the targets of their target
  files, so these citations will need re-checking when those roadmaps are written. The resolver's
  three "found nowhere" leads are these siblings (ExplicitMultiplicativeFunctions §7.5,
  ExplicitPrimeCounting §2.2, ExplicitCharacterSumsAndSieves Layer 4), all present in the board
  packages or target files.
- **Uncertified sources.** `ahnkwon2019`, `louboutin2000`, `friedman1989` and the others listed in
  the PKG report stay cited by locator. `leastPrimeIdeal_ahnKwon` could not be checked against a
  readable text. `relativeClassNumber_le` and `dedekindZeta_residue_ge_friedman` were checked
  through their quotations (`louboutin2003` line 605, `garcialee2022mertens` lines 1214–1225).
- **Library names.** The resolver could not check library names on this host ("no pinned Lake
  packages"). I scanned the pinned `.lake/packages` instead: every backticked name attributed to
  Mathlib or Tau Ceti is declared at the pin, and the non-matches are notation or supplier-roadmap
  names, which the resolver did match.

## Untrusted text

Nothing read asked for an action or a change of procedure.


Pull request: #1944 (roadmap/explicit-number-fields at 6c7e499)
