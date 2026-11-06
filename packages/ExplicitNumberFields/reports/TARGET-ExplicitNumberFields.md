# Triage report: TARGET-ExplicitNumberFields (#6064)

Verdict: `design`, name `ExplicitNumberFields`, no base, no owner. The target file is
`packages/ExplicitNumberFields/target.md`; the manifest is `packages/ExplicitNumberFields/sources.toml`.

## What was searched

- **The board.** The nineteen open targets and designs listed in the brief, by mathematical object.
  The four sibling "explicit" jobs were read in full: `packages/ExplicitZetaBounds/target.md`
  (#6894), `packages/ExplicitMultiplicativeFunctions/target.md` (#6897), and the issue texts of
  `ExplicitCharacterSumsAndSieves` (#6062) and `ExplicitPrimeCounting` (#6066), together with the
  full issue text of #6064 itself (the brief truncates it after the Trudgian entry of the sources).
  `packages/ExplicitCharacterSumsAndSieves` and `packages/ExplicitPrimeCounting` hold only a
  manifest; the index of packages under review lists none in this area.
- **Roadmaps on main and at the open heads**, with `roadmaps grep` for: Louboutin, primitive root,
  Burgess, relative class number, Kadiri, Sunley, Debaene, ideal counting, Rademacher, Grosswald,
  Minkowski bound, Trudgian, Hasse unit index, Vinogradov sieve, Aramata, Bordellès; then the
  READMEs of `LFunctions`, `ZerosOfLFunctions`, `ClassicalArithmeticCompletion`,
  `ImaginaryQuadraticClassNumber`, `ClassFieldTheory` (main), `Completed/GlobalNumberFields`, and,
  from pull requests, `AnalyticNumberTheoryPartI` (#1126), `EffectiveClassNumbers` (#1406),
  `ComputationalNumberTheory` (#1408), `CharacterSumsOverFiniteFields` (#1712),
  `SieveMethodsAndPrimePatterns` (#1495), `CyclotomicClassGroupsAndStickelberger` (#1260),
  `GeometryOfNumbersAndQuadraticArithmetic`.
- **The pinned libraries**: Mathlib's `NumberField/DedekindZeta.lean`, `NumberField/CMField.lean`,
  `NumberField/Units/Regulator.lean`, `NumberField/ClassNumber.lean`,
  `CanonicalEmbedding/ConvexBody.lean`, `RingTheory/ZMod/UnitsCyclic.lean`; Tau Ceti's
  `NumberTheory/LFunctions/Mertens.lean` and the Dedekind-zeta files it imports.
- **The merge order** for every supplier named.

## What was found

**No overlap that would merge.** `ExplicitZetaBounds` reserves, in its own Scope, "the Dedekind
instance (Rademacher's Theorem 4)" and "explicit zero counts, zero-free regions and zero densities
for `ζ_K` with `K ≠ ℚ`" for the open target `ExplicitNumberFields` (#6064), and lists this target
among its consumers. `ExplicitMultiplicativeFunctions` owns Bordellès' Piltz divisor sums (its T7.5)
and the Cully-Hugill–Trudgian `τ₄` asymptotic with its finite-range hypothesis, and names
`ExplicitNumberFields` as the consumer "for class-number bounds". `ExplicitCharacterSumsAndSieves`
(filed first) owns Treviño's Burgess inequality, uniform and tabulated, and McGown's and Booker's
tables, each as a named hypothesis. `ExplicitPrimeCounting` is about `ψ, θ, π` only. These are
supplier relations, not the same theory; each is recorded as a boundary in the target file, and the
filed hypotheses H1 and H4 are dropped in favour of the siblings' `Prop`s.

**No duplicate.** Nothing on main or at the open heads states an explicit constant for a Dedekind
zeta function except one: `AnalyticNumberTheoryPartI` §2.15 plans Louboutin's
`κ_K ≤ (e log d_K/(2n−2))^{n−1}` as `dedekindZeta_residue_le`, with the proof in its §2.15a. That
single theorem is consumed, not restated. The same roadmap's §2.7 (quadratic factorisation
`ζ_E = ζ_F L(s, η)` with the residue quotient), §2.21 (Hecke convexity with an inexplicit constant),
§2.31e (ineffective residue lower bound), §2.32 (Brauer–Siegel), §2.42 (`DedekindERH`) and §3.27
(ideal count `O(x^{1+ε})`) are suppliers or comparisons. `ZerosOfLFunctions` 6.2 and 7.5 prove the
Dedekind zero-free region and `N_K(T)` with existential constants and list decimal constants under
"Not owned here". `Completed/GlobalNumberFields` Layer 3 proves ray-class ideal counting with an
existential `O(x^{1−1/n})`, and Tau Ceti has `isBigO_card_idealsLE_sub`; the explicit constants of
Lee, Debaene and Gun–Ramaré–Sivaraman are nowhere. `CyclotomicClassGroupsAndStickelberger` §3.4
proves `ζ_F = ∏ L(χ, s)` for abelian `F`, the relative class number and the Hasse index for abelian
CM fields, which Layer 4(a) and Layer 0 consume. No roadmap mentions Grosswald, the least primitive
root, or Vinogradov's sieve identity.

**Mathlib already carries Layer 0.** `NumberField.dedekindZeta_residue` is defined as
`2^{r₁}(2π)^{r₂} R_K h_K/(w_K √|d_K|)` and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` is the
class-number formula; `IsCMField`, `maximalRealSubfield`, `indexRealUnits` (`= 1` or `2`), the
regulator ratio, `torsionOrder`, `minkowskiBound` and `ZMod.isCyclic_units_of_prime_pow` exist. The
filed Layer 0 shrinks to the Minkowski constant, the local factor `Π_K(p)`, the relative class
number of a general CM field, the quadratic Hecke character and the predicates.

**Not a Part II.** No roadmap develops explicit Dedekind constants as its direction;
`AnalyticNumberTheoryPartI` is a general analytic roadmap with one such bound, and
`ExplicitZetaBounds` is a sibling design, not a merged base. A new roadmap with the suggested name
is the right shape; the name is used by no roadmap, pull request or package.

**Generality.** The filed statement is already general (arbitrary `K`, Mathlib carriers); the triage
adds the degree-one and imaginary-quadratic Checks and corrects three constants (below).

## Corrections to the filed statement, from the texts read

- Bordellès 2006, Theorem 2.2 (`bordelles2006` line 158) assumes `b_K ≥ 13`, so the discriminant
  threshold is `d_K ≥ 169 M_K⁻²`, not `139 M_K⁻²`.
- Trudgian 2015, Theorem 2 (`trudgian2015` line 25) displays `0.317, 6.333, 3.482`; the filed
  `0.316, 5.872, 3.655` is a Table 2 row, and Hasanalizade–Shen–Wong state that their table
  "repairs" Trudgian's Table 2 (`hasanalizadeshenwong2022` line 67). The target states the
  displayed theorem.
- The filed "Louboutin (2017), `d_K ≥ 8`" regions with `1/1.7` and `1/1.62` are Kadiri's
  Corollary 1.2 as quoted at `louboutin2017` line 37; Louboutin's own Theorem 3 (line 47) gives
  the regions `S(c₂, 0)`, `S(d₂, d₂)`, `S(0.59110, 1/4)` and, for `d_K > 8`, `S(0.10379, 1)`.
- Lee 2023, Theorem 1.2 in the arXiv v2 text (`lee2023ideals` line 57, Table 1 at line 44) has a
  constant `A_K(n)` with `A_K(2) ≈ 2.49·10¹⁰`, not the filed `C(K)` with `8.80·10¹¹`; the published
  text is paywalled, so the design must state the constant of the version it reads.
- McGown–Trudgian 2020 do not apply Burgess's inequality itself but Treviño's table `C(r)`
  (`mcgowntrudgian2020` line 46) and three small finite checks (lines 327, 352, 634).
- `h(2) = 3 > 2^{0.74}`, so the mod-`p²` bounds are for odd primes; Kerr–McGown–Trudgian's
  Theorem 1 (`kerrmcgowntrudgian2020` line 50) is `h(p) < p^{0.99}`.
- Louboutin 2003 states its bounds with the root discriminant `ρ_K = d_K^{1/2n}`: Theorem 12
  (`louboutin2003` line 481) needs `ρ_K ≥ 2800`, that is `d_K ≥ 2800^{2n}`, not `2800ⁿ`, and its
  factor is `(πe log ρ_K)^{−n} = (2n/(πe log d_K))ⁿ`, not `(n/(πe log d_K))ⁿ`; Theorem 13 (line
  503) is for `2n > 4` with the power `(πe log ρ_K)^{n−1}` in the numerator. Its Theorem 1 (line
  65) is an explicit zero-dependent lower bound for `κ_K` that the filed statement omits; it is
  added to Layer 3.
- Kadiri 2012's arXiv text (`kadiri2012` line 79) assumes `d_K` sufficiently large and notes that
  the theorems can be made explicit for every `log d_K`; the filed `d_K ≥ 2` must be checked
  against the published text.
- The finite range of H2 is `409 < p < 2.5·10¹⁵` (`cohenoliveirasilvatrudgian2016` line 35), and
  McGown–Treviño–Trudgian's Theorem 1 (`mcgowntrevinotrudgian2016` line 40) also bounds the least
  prime primitive root for `p > 2791`.

## Why the verdict

A new roadmap (`design`), because the explicit Dedekind-specific constants are claimed by no roadmap
and are reserved for this target by the one design that could have absorbed them
(`ExplicitZetaBounds`). Not `merge-into`: each overlap found is a supplier relation already
recorded on both sides, and the four explicit targets are ordered `ExplicitCharacterSumsAndSieves`
→ `ExplicitZetaBounds` → `ExplicitMultiplicativeFunctions` → `ExplicitNumberFields`, with no cycle
through this one. Not `part-ii`: no base roadmap develops this theory. Not `duplicate`: the only
planned explicit Dedekind constant (`AnalyticNumberTheoryPartI` §2.15) is one theorem among
twenty-three, and it is consumed. The filed hypotheses H1 and H4 are replaced by the siblings'
named `Prop`s, and only H2 and H3 are declared here, with H2's range now read from its source.

## Sources

The manifest `packages/ExplicitNumberFields/sources.toml` now records 31 works. The operator had
already answered the previous request for five (`bordelles2002`, `bordelles2006`, `louboutin2017`,
`louboutin2015ijnt` as local texts; `louboutin2015mmj` waived). This run fetched, through the
sources service and from legal places only:

- read (arXiv, HAL, Numdam, AMS open back volumes): `lee2023ideals` (arXiv v2, OCR), `debaene2019`,
  `gunramaresivaraman2023` (HAL), `garcialee2022mertens`, `garcialee2022artin`, `trudgian2015`,
  `hasanalizadeshenwong2022`, `kadiri2012` (arXiv v1), `mcgowntrudgian2020`,
  `mcgowntrevinotrudgian2016`, `kerrmcgowntrudgian2020`, `trevino2015`, `mcgown2012`,
  `cohenoliveirasilvatrudgian2016`, `louboutin2003` (AMS), `louboutin2005` (Numdam; its displayed
  formulas are not in the text layer), `booker2006` (AMS), `sunley1973` (AMS);
- recorded `uncertified` by locator, paywalled: `rademacher1959`, `louboutin2000`,
  `lee2021zerofree`, `cullyhugilltrudgian2021`, `ahnkwon2014` (by the service), and
  `louboutin2001`, `chen2022` (by hand, after the service reported "no legal source" for a
  Cambridge and a World Scientific landing page); `ramare2001` is open at IMPAN but the archive
  answered HTTP 502 on every attempt, so it is recorded `uncertified` by locator too, and its
  bounds are consumed from `ExplicitZetaBounds`, which records the same work.

The arXiv search endpoint rate-limited the service during the first pass (HTTP 429), which is why
several works needed a second pass with explicit arXiv identifiers or publisher URLs. Each arXiv
text was checked to be the paper cited (title and abstract), and the locators in the target file
are into the version read, named in the manifest. No text in `needs-references.toml` remains:
every work the manifest lacks is either read or settled as `uncertified`, so the file was removed.

Three sibling targets record some of the same works under their own keys (`ExplicitZetaBounds`:
Rademacher, Ramaré 2001; `ExplicitMultiplicativeFunctions`: Bordellès 2002, Cully-Hugill–Trudgian;
`ExplicitCharacterSumsAndSieves`: Treviño, McGown, Booker). They are recorded here as well because
this roadmap's design must check the constants it quotes; the theorems themselves are consumed.

## Suspicious text

None. No fetched text or issue asked for any action.
