# PKG-ExplicitNumberFields: roadmap package of ExplicitNumberFields

Files: `packages/ExplicitNumberFields/README.md` (3067 lines, Layers 0–7, 78 subsections including
the Examples and Dependencies of each layer, 62 Checks blocks), `packages/ExplicitNumberFields/Suggested.lean`
(12 theorems, 5 definitions), `packages/ExplicitNumberFields/metadata.toml` (`topic = "math.NT"`, as
`TauCetiRoadmap/ClassFieldTheory/metadata.toml` and `TauCetiRoadmap/LFunctions/metadata.toml` on
main), `packages/ExplicitNumberFields/sources.toml` (64 entries, `cited_for` updated), and the
top-level `gaps` list of `packages/ExplicitNumberFields/design/plan.json` (18 gaps; the rest of the
file is identical to the committed version, checked by comparing the parsed JSON without `gaps`).

This run starts from the earlier attempt's deliverables. That attempt was refused because
`Suggested.lean` did not start with `module`: the build warned that it imports `Mathlib`, which is
designed for the module system. That is repaired. The by-object duplication sweep was also redone
and found five more objects that are owned elsewhere (section "Duplication sweep" below).

## Headline theorems

Rule: the headlines are the end theorems of the Summary taken from refereed sources. Results
that rest on unrefereed preprints are README targets: Fehnker 2.6, Amberger 4.2,
Das–Gaba–Lee–Savalia–Wong 4.8 and 4.10, Guo and Banks 4.9 and 5.7, Das–Kadiri–Ng 7.3. This file
follows ZerosOfLFunctions on main: no statement about `ζ_K` off `Re s > 1 − 1/n` is forced
through a "for every continuation `F`" encoding.

| Headline | Status |
|---|---|
| Sunley's explicit ideal count (2.2) | stated: `idealCount_sunley` |
| Debaene's uniform count, all ideals (2.4) | stated: `idealCount_debaene` (with `log⁺`) |
| Debaene's uniform count in one class (2.4) | stated: `classIdealCount_debaene` (class group = Tau Ceti `RayClassGroup (Modulus.one K)`) |
| Gun–Ramaré–Sivaraman's narrow ray-class count (2.5) | stated: `rayClassIdealCount_gunRamareSivaraman` |
| Friedman's lower bound `κ_K ≥ 0.36232/√d_K` (3.3) | stated: `dedekindZeta_residue_ge_friedman` |
| Stark's bound for fields with no quadratic subfield (4.7) | stated: `dedekindZeta_residue_gt_stark` (with `starkAlpha`, `HasNormalTower`, exact `c₄`) |
| Bordellès' regulator-free bound (5.3) | stated: `classNumber_le_bordelles` |
| `h(K⁺) ∣ h(K)` (0.4) | stated: `classNumber_maximalRealSubfield_dvd` |
| Louboutin's relative class-number upper bound (5.5) | stated: `relativeClassNumber_le` (with `relativeClassNumber`) |
| MTT Theorem 2, `ĝ(p)` under GRH (6.4) | stated: `leastPrimePrimitiveRoot_le_grh` (with `GRHMod`, `leastPrimePrimitiveRoot`) |
| Garcia–Lee's Mertens theorems (7.1) | stated: `primeIdeal_mertens_garciaLee` ((A) and (B); `M_K` = Tau Ceti `mertensConstant K`) |
| Ahn–Kwon's least prime ideal (7.4) | stated: `leastPrimeIdeal_ahnKwon` (Tau Ceti `frobeniusPrimeSet`) |
| Odlyzko's discriminant bound (former 4.11) | no longer a headline here: AnalyticNumberTheoryPartI §2.9a owns it (removed from both files, see the duplication sweep) |
| Zero counts, zero-free and one-zero regions, real zeros, repulsion (4.1–4.6, 4.10), Rademacher (1.1), zero-dependent and GRH residue bounds (3.1, 3.4, 3.6), relative class-number lower bounds (5.6), gap consequences (4.9), GRH Chebotarev and Bach–Sorenson (7.2, 7.4) | not statable: neither library has the continuation of `ζ_K` to `ℂ`, Hecke L-functions or `DedekindERH` at the pins |
| `g(p) < p^{5/8}`, `h(p) < p^{0.99}`, `h(p) < p^{2/3}`, Grosswald under GRH (6.3–6.5) | not statable: each depends on finite verifications. These either assert the conclusion on an initial range (*McGownSorensonTable*, *SmallPrimitiveRootsModPSquare*, *GrosswaldFiniteRange*) or are case analyses of the source's sieve that have no statement on the pinned carriers |
| Debaene's Brun–Titchmarsh inequality (7.5) | not statable: needs the conductor of an abelian extension (ClassFieldTheory Layer 13 `abelianConductor`), absent at the pins |

Kadiri–Ng–Wong's `N𝔭 ≤ d_L^{16}` (7.4) is statable but stays a README target. It is the
thresholded variant of the Ahn–Kwon headline, and `kadiringwong2019` is uncertified.

## Corrections made in this run

1. **`Suggested.lean` starts with `module`**, then `import Mathlib` and the four Tau Ceti modules.
   All four are module-system files at the pin. Like the accepted packages ArcTopologyAndDescent
   and AlgebraicModuliForArithmeticGeometryPartII, the file has no `public section`.
2. **Docstrings no longer begin a line with a keyword.** The signature scanner read the docstring
   line "class `c` and real `x ≥ 1`" as a declaration named `` `c` ``. It then appended
   `#check @TauCetiRoadmap.ExplicitNumberFields.`c``, which produced the three "line 278" errors in
   `scratch/signatures.md`. That docstring is reflowed. The module docstring's lines that began
   "theorems …" and "definitions …" are reflowed too.
3. **`DedekindERH.of_abelian`**, which the resolver flagged, now appears only in prose. It is an
   API bullet of AnalyticNumberTheoryPartI §2.42's README, not a declaration anywhere. README §0.5
   and the AnalyticNumberTheoryPartI contract describe the abelian case of §2.42 in words.
4. The duplication removals below.

The corrections of the earlier attempt are unchanged:

- *McGownTrudgianOmegaChecks* is restated. At `ω = 17` the least left side over all `s` is
  `1.462·10¹¹ > 10¹¹`, so the predicate gains the window predicate *McGownTrudgianWindowCheck*.
- EffectiveClassNumbers is no longer listed among the downstream consumers: it is ORDER 247,
  before this roadmap.
- The supplier gaps point at the sections where the sibling designs actually state them.
- `dedekindZeta_residue_gt_stark` keeps the source's strict inequality.
- The finite verifications of ExplicitMultiplicativeFunctions are carried as hypotheses by the
  theorems that use them.

## Duplication sweep (by object)

Removed in this run (each cited in Scope and, where it is consumed, in the supplier contracts):

- **Odlyzko's discriminant bound (former 4.11 and `log_discr_ge_odlyzko`)**: deleted.
  AnalyticNumberTheoryPartI §2.9a (ORDER 90) plans exactly `r₁ log 60 + 2 r₂ log 22 ≤ log D` for
  `D` large, as its discriminant input. It derives this from Odlyzko's
  `log D ≥ r₁ log 60.1 + 2 r₂ log 22.2 − 254`, with the analytic inputs of that proof.
  SmallRamificationAndAbelianVarietyBaseCases §1.7 (ORDER 116) states Poitou's bound
  `P(n, r₁, b) ≤ log d_K` for every `b > 0` (`poitouLowerBound_le_log_abs_discr`).
  - That bound implies the same statement, which I checked numerically: `I₁(b) → log 2`,
    `I₂(b) → π/2 − 1`, and the coefficients tend to `log 60.84` and `log 22.38`. At `b = 200` they
    are `4.10732 > log 60` and `3.10773 > log 22`.
  - Nothing else in this roadmap used 4.11, so it is cited in Scope ("Already in the library or
    stated by an earlier roadmap"). No target remains in its place, and no other subsection is
    renumbered: 4.11 was the last subsection of Layer 4.
- **The coefficient bound `0 ≤ a_K(m) ≤ τ_n(m)`** (0.3): AnalyticNumberTheoryPartI §2.15a proves
  it, ramified primes included. 0.3 now consumes it and keeps only the class-number lemma
  `h_K ≤ Σ_{m ≤ b_K} τ_n(m)`. Tau Ceti's `classNumber_le_bound` uses the coarser count `X² 2ⁿ`,
  so the lemma is not at the pin.
- **The least primitive root modulo `p²`** (0.6 `h(p)`): this is Tau Ceti's
  `TauCeti.conreyGenerator p` (`TauCeti/NumberTheory/DirichletCharacter/Conrey.lean`).
  - Its body is `Nat.find` of `∃ g, orderOf (g : ZMod (p ^ 2)) = (p ^ 2).totient`, and `0` when
    no such `g` exists. So it equals our `g(p²)` for every `p`, junk values included.
  - 0.6 no longer defines `h(p)`; it cites `conreyGenerator`, `orderOf_conreyGenerator`,
    `conreyGenerator_le` and `conreyGenerator_three`.
  - Computed: `h(2) = 3`, `h(3) = 2`, `h(5) = 2`, `h(7) = 3`, `h(40487) = 10` against
    `g(40487) = 5`.
- **The series for the Mertens constant** (7.1, (M1)):
  `M_K = γ + log κ_K + Σ_𝔭 (1/N𝔭 + log(1 − 1/N𝔭))` is step 3 of LFunctions Layer 8's Mertens
  product for `K` (on main). 7.1 now consumes it and proves only the explicit (C1)–(C2) and the
  bounds (M2), with a route for (M2). LFunctions Layer 8 is added to 7.1's *Needs* and to the
  Layer 7 dependencies.
- **Comparisons added to Scope**:
  - LFunctions Layer 8 has Mertens' first theorem and Mertens' product as asymptotics, and Tau
    Ceti has Mertens' second theorem with an `O(1/log x)` error
    (`isBigO_primeSummatory_inv_absNorm_sub_log_log_sub_mertensConstant`). 7.1 is explicit.
  - ZerosOfLFunctions Layer 3 has convexity in vertical strips with existential constants. 1.1
    is Rademacher's numerical form.

Kept from the earlier attempt:

- The Frobenius prime counts are Tau Ceti's `frobeniusPrimeSet`, `frobeniusPsi` and
  `frobeniusPrimeCount`.
- *LuZamanZhaoRealZeroCheck* is deleted in favour of ExplicitPrimeCounting §1.7's
  *LuZamanZhaoSweep*.
- *UniformQuadraticZeroGap* is kept as the field form of ExplicitPrimeCounting §1.7's
  *RealZeroGap* `c ∞`, with the agreement stated in 0.5.
- The GeometryOfNumbersAndQuadraticArithmetic citation is replaced by SuccessiveMinima Layer 1
  through Tau Ceti.
- The Scope comparisons with AnalyticNumberTheoryPartI §§2.43, 2.49 and ZerosOfLFunctions 6.2,
  7.5, 8.5.

Searched by object with `roadmaps grep` (main and the 472 open heads) and in the pins:
- explicit ideal counts (Sunley, Debaene, Gun–Ramaré–Sivaraman, Widmer, Lipschitz counts);
- relative class numbers and the Hasse unit index;
- Mertens for number fields, Stark's bound or one-zero lemma, zero counts and Rademacher;
- least primitive roots, Vinogradov's identity, Brun–Titchmarsh and Odlyzko.

The only other hits are the cited owners above and CyclotomicClassGroupsAndStickelberger §3.4: its
rational `h/h⁺` for abelian CM fields is cited as an agreement. CharacterSumsOverFiniteFields
(ORDER 154) uses `conreyGenerator` only to label characters. AnalyticNumberTheoryPartII's match was
a false positive (field counting). No relative class number and no generator-indicator identity
exists at the pins (Tau Ceti's `ArtinCoefficient` is unrelated).

Ownership against open pull requests: checked through the tool's index, with `roadmaps list`,
`show` and `grep`, for:
- AnalyticNumberTheoryPartI, SmallRamificationAndAbelianVarietyBaseCases and its Part II,
  CharacterSumsOverFiniteFields, CyclotomicClassGroupsAndStickelberger, ComputationalNumberTheory;
- GeometryOfNumbersAndQuadraticArithmetic, EffectiveClassNumbers, ZerosOfLFunctions;
- the board's sibling packages.

No declaration of `Suggested.lean` has the fully qualified name of another roadmap's declaration:
all are in `TauCetiRoadmap.ExplicitNumberFields`. `GRHMod q` restates the body of
AnalyticNumberTheoryPartI's `DirichletGRH`, quantified over the characters modulo `q`, because
that roadmap is still a pull request and cannot be imported.

## Notions moved down from later roadmaps

None. Every supplier is on main or earlier in the merge order:
- on main: LFunctions, ZerosOfLFunctions, ClassFieldTheory, ClassicalArithmeticCompletion,
  ImaginaryQuadraticClassNumber and SuccessiveMinima;
- ORDER 34–272: CyclotomicClassGroupsAndStickelberger, AnalyticNumberTheoryPartI,
  ComputationalNumberTheory and the four explicit siblings (269–272).

No citation uses a numbering that only an open revision defines.

## What the README could not support from a readable text

- These sources are uncertified (settled, cited by locator): `ahnkwon2019`, `kadiringwong2019`,
  `odlyzko1976`, `bachsorenson1996`, `thornerzaman2017`, `mcgownsorenson2024`, `chen2022`,
  `louboutin2000`, `louboutin2001`, `friedman1989`. The Lean headlines that rest on them are
  `leastPrimeIdeal_ahnKwon`, `relativeClassNumber_le` and `dedekindZeta_residue_ge_friedman`.
  - The last two were checked against their quotations in readable texts: `louboutin2003`
    line 605 and `garcialee2022mertens` lines 1214–1225.
  - Ahn–Kwon's statement could not be checked against any cached text.
- 2.3: Lee's constant differs between printings: `2.49·10¹⁰` in arXiv v2 against `8.81·10¹¹`
  quoted by `ramare2025`.
- 4.9: `guo2026` is unrefereed. Every consequence is stated for an arbitrary `c₀` under the
  predicate.

## Verification against the cached sources in this run

- **Sunley.** Theorem 1.1(1): `sunley1973` line 112 (OCR) and Lee's restatement at
  `lee2023ideals` lines 39–41, for `x > 0` and `n ≥ 2`.
- **Debaene.** Corollary 2: `debaene2019` lines 107–124.
- **Gun–Ramaré–Sivaraman.** Theorem 1 with `F(𝔮) = 2^{r₁} φ(𝔮) h_K/h_{K,𝔮}` and `E(K)`:
  `gunramaresivaraman2023` lines 66–81.
- **Friedman and Stark.**
  - The Friedman bound (22): `garcialee2022mertens` lines 1214–1225.
  - Stark's `α(n_K) ∈ {4, 16, 4·n!}`: lines 1247–1253, together with the no-quadratic-subfield
    clause (line 1254) and `c₄` (lines 1271–1277).
- **Υ_K.** `garcialee2022mertens` lines 117–126; the Lean term matches term for term.
- **Bordellès.** Theorem 5.3: `bordelles2002` lines 193–204.
- **MTT Theorem 2.** `mcgowntrevinotrudgian2016` lines 56–61. The threshold is `p ≥ 10⁹`: the OCR
  drops the superscript, and line 78's `((8/5) log 10⁹)² ≈ 1099.4` confirms it.
- **Louboutin.** `louboutin2003` line 605.
- **Carriers at the pin.**
  - Mathlib: `IsCMField.indexRealUnits` (the index of `realUnits ⊔ torsion`, Hasse's `Q_K`) and
    `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`.
  - Tau Ceti: `idealsLE`, `primesLE`, `mertensConstant` (the limit) and `frobeniusPrimeSet` (the
    unramified primes with Artin class `C`).

All 108 Mathlib and Tau Ceti names that the README attributes to a library resolve at the pins.
The 4 misses of the scan are notation (`b_K`, `h_K`, `M_K`) and this roadmap's own
`classIdealCount_debaene`. `abs_discr_ge'` and `volume_fundamentalDomain_latticeBasis` are in
`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`.

## Adversarial pass

Values computed in this run.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `idealCount_sunley` | ℚ(i), x = 10 | `|9 − 7.854| = 1.146 ≤ 1.153·10³¹` | true (`x > 0`, `n ≥ 2`) | — |
| `idealCount_debaene` | cubic −23; n = 1 | `1 + log(0.2812) = −0.2687` (printed form false), `1 + log⁺ = 1`; `|⌊x⌋ − x| ≤ 1` | true with `log⁺` | — |
| `rayClassIdealCount_gunRamareSivaraman` | ℚ, 𝔮 = (1) | `F = 2`, `E(ℚ) = 1039.72`, bound `3729.86` | true | — |
| `dedekindZeta_residue_ge_friedman` | ℚ(i); ℚ(√5); cubic −23 | `0.785 ≥ 0.181`; `0.430 ≥ 0.162`; `0.368 ≥ 0.0755` | true | — |
| `c₄`, consequence constant | — | `43.162115`; `1/(16c₄) = 0.00144803`; `1/(4c₄) = 0.0057921` | match source | — |
| `dedekindZeta_residue_gt_stark` | ℚ(ζ₇)⁺ (α = 4); cubic −23 (α = 24) | `0.001488 < 0.30026`; `3.08·10⁻⁴ < 0.3684` | true | — |
| `classNumber_le_bordelles` | ℚ; ℚ(√−14); cubic −23; ℚ(ζ₅) | `1 ≤ 1`; `4 ≤ 60.25`; `1 ≤ 94.30`; `1 ≤ 1677.95` | true | — |
| `relativeClassNumber_le` | ℚ(i); ℚ(√−3); ℚ(√−5); ℚ(ζ₈) | `4.80 ≥ 1`; `4.94 ≥ 1`; `11.59 ≥ 2`; `12.72 ≥ 1` | true | — |
| `leastPrimePrimitiveRoot_le_grh` | p = 10⁹+7 (ω = 2); 1000000021 (ω = 6) | `9894.6` vs `√p − 2 = 31620.8`; `4.36·10⁶` | consistent with Checks | — |
| `primeIdeal_mertens_garciaLee` | ℚ(i), x = 2 | `|0.3466 − 0.6931| = 0.3466 ≤ Υ` | true | — |
| `GRHMod q ↔ DedekindERH ℚ(ζ_q)` (reworded) | q = 1, 2, 3, 4 | ℚ(ζ_1) = ℚ(ζ_2) = ℚ: both sides RH; q = 3: RH ∧ GRH(χ₋₃) on both sides; q = 4: RH ∧ GRH(χ₋₄); imprimitive factors vanish only on `Re s = 0` | true | `of_abelian` → prose |
| `h(p) = conreyGenerator p = g(p²)` | p = 0, 1, 2, 3, 5, 7, 40487 | junk `0` on both sides at p = 0, 1; `3, 2, 2, 3, 10` (and `g(40487) = 5`) | equal | h(p) cited from Tau Ceti |
| 0.3 (consumed coefficient bound) | ℚ(i), m = 2, 4, 5 | `a = 1 ≤ 2`, `1 ≤ 3`, `2 ≤ 2` | true | consumed from AnalyticNumberTheoryPartI §2.15a |
| 7.1 (M2) route | N = 2; Σ_p | `1/2 + log(1/2) = −0.1931 ∈ [−1/2, 0]`; `Σ_p 1/(p(p−1)) = 0.7732 < 1` | `γ + log κ − n ≤ M_K` follows | route added |
| 7.1 (M1) identity at ℚ | — | `γ + Σ_p (1/p + log(1 − 1/p)) = 0.2615 = M` | true | consumed from LFunctions Layer 8 |
| former 4.11 vs SmallRamification §1.7 | b = 8, 20, 50, 200, ∞ | coefficients `(3.720, 2.884)`, `(4.027, 3.062)`, `(4.094, 3.100)`, `(4.107, 3.108)`, `(4.10824, 3.10824)` vs `(4.09434, 3.09104)` | the supplier's bound implies the statement | target deleted (owned by AnalyticNumberTheoryPartI §2.9a) |
| dominated-convergence majorant (former 4.11 route) | b = 1, 2, 8, 200; x ∈ (0, 60) | `max (1 − F_b)/min(1, (C + 1/8)x²) = 1.0`; `F = 0` majorant `1/(2 sinh(x/2))` not integrable | corrected before deletion | — |
| `HasNormalTower`, `starkAlpha` | ℚ(ζ₅); `ℚ(2^{1/4})`; non-Galois cubic; α⁴ − α − 1 | `4`; `16`; `24`; no tower (S₄ with S₃ maximal) | discriminates | — |
| `leastPrimePrimitiveRoot` | m = 7, 409, 2, 1 | `3`; `29` (`g = 21`); `3`; `2` (junk) | as Checks | — |

## Elaboration

`lake env lean` on `packages/ExplicitNumberFields/Suggested.lean`, run from the content checkout,
exits with status 0. It prints exactly **12** warnings `declaration uses 'sorry'` and no other
message. The Tau Ceti object files were present: the earlier attempt's build had unpacked them.

The file contains:
- `module`, then `import Mathlib` and four Tau Ceti modules (`ArithmeticDirichletSeries.Counting`,
  `NumberField.Global.RayClass.Count.Basic`, `LFunctions.Mertens`,
  `Chebotarev.FrobeniusPrimeSet`);
- no `set_option`, no `lemma` and no sorry'd data.

**`#check @name` pass.** I put a scratch copy of the final file, with `#check @name` for all 17
declarations, through one elaboration (exit 0, 12 `sorry` warnings).
- Every declaration carries its binders in its own signature; the file has no `variable`.
- Each elaborated type was compared with its README statement. Real exponents are real, the
  natural exponents (`10 n²`, `12 n²`, `8n`, `4n`, `12577`) are `ℕ`, and `2^{ω(p−1)} − 1` is
  formed in `ℝ`.
- The `module` header changed no type, so nothing needed changing.

## Dependency check

    depcheck: 240 roadmaps, 2440 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line.

`roadmaps resolve` on the README finds no Lean name that resolves nowhere. Three citations are
reported as found nowhere: ExplicitMultiplicativeFunctions §§7.5, ExplicitPrimeCounting §2.2 and
ExplicitCharacterSumsAndSieves Layers 4. These are the sibling board packages (ORDER 270–272,
earlier), cited by the sections of their accepted designs (`packages/ExplicitPrimeCounting/design/README.md`
§§1.7, 2.2, 4.7, 6.5; `packages/ExplicitMultiplicativeFunctions/design/README.md` §§7.5, 7.9, 8.1,
9.1, 9.4, all re-read in this run) and the target files of the two without a design.

`roadmaps overlaps ExplicitNumberFields` answers "no roadmap ExplicitNumberFields on main or in an
open roadmap pull request", as expected for a package. The worker's `scratch/overlaps.md` lists no
dropped ids.

## Supplier gaps (plan.json `gaps`)

The 18 gaps are unchanged from the earlier attempt. Each is named by a target of `plan.json`, and
each has one `What <Supplier> must provide (gap:<slug>)` line in the README whose supplier agrees
with `plan.json`.
- ExplicitZetaBounds: `rademacher-general-convexity`, `complex-stirling-constants`,
  `backlund-argument-lemma`, `iterated-perron`, `ramare-L1-bounds`,
  `nonnegative-trig-polynomials`, `uniform-landau-siegel-gap`.
- ExplicitCharacterSumsAndSieves: `burgess-moment-estimate`, `polya-vinogradov-lapkova`.
- ExplicitPrimeCounting: `explicit-mertens-second` (§4.7), `bach-grh-smoothed-sum` (§6.5),
  `schoenfeld-psi-rh` (§2.2, which states it).
- ExplicitMultiplicativeFunctions: `piltz-divisor-sums` (§7.5), `tudzi-tau3-remainder` (§7.9),
  `omega-pointwise-robin` (§9.1), `totient-quotient-bound` (§9.4), each already stated by that
  section, and `rh-mertens-product` (§8.1).
- ClassFieldTheory: `artin-norm-compatibility` (Layer 11).

This run's new citations need no gap, because the cited sections state what is used:
- AnalyticNumberTheoryPartI §§2.9a and 2.15a;
- LFunctions Layer 8 (step 3 of its Mertens product, a planned route step that is consumed);
- Tau Ceti `conreyGenerator`;
- SmallRamificationAndAbelianVarietyBaseCases §1.7 (Scope only).

## Sources

No source was fetched, and no `needs-references.toml` was written. `sources.toml` has 64 entries:
every key is cited in the README, every cited key is in the manifest, and the file contains no
machine path. Two `cited_for` fields changed:
- `odlyzko1976` is now a Scope comparison;
- `kadiringwong2019` drops 4.11 and gains its Theorem 2.3 quotation in Scope.

## Source issues

- **Gap** in mcgowntrudgian2020, in the proof of Corollary 1, p. 11. The source says the left side
  of (9) is below `10¹¹` for `9 ≤ ω ≤ 17` with `s = ω − 3`. It should exclude `ω = 17`, where the
  least value over every `s` is `1.462·10¹¹` (at `s = 14`). So (9) is unverified for the primes
  `10²² ≤ p < 2.14·10²²` with `ω(p − 1) = 17`. This affects a stated result: Corollary 1, and
  through it `mcgownsorenson2024` Theorem 3, on those primes.
- **Error** in mcgowntrudgian2020, in the proof of Corollary 1, p. 11. The source says
  `p ≤ 10¹⁰⁰⁰` implies `ω ≤ 200`. It should be `ω ≤ 350`. Also, `s = ω − 5` gives `δ < 0` from
  `ω = 258` on, where `s = 0` works instead. This affects the proof.

## Untrusted text

Nothing read asked for an action.
