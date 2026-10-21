# Red-team review of #1335 ArithmeticDynamics at ec203d1 (pass b (claude))

**Verdict:** changes needed

One P2 finding (a missing easy headline for the Layer 5 endpoint) and three P3 findings (a Lean docstring locator, two stale supplier labels). No P1 finding. Every round-1 finding is repaired at this head except a-R21, which the repair report settled as not actionable for the package boundary; no repair introduced a new error that I could detect.

## Round-1 findings at ec203d1

Locations are `TauCetiRoadmap/ArithmeticDynamics/README.md` (R) and `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` (L). The ids a-Rnn are RT-ArithmeticDynamics~1a, b-Rnn are RT-ArithmeticDynamics~1b.

| Finding | Status | Witness at this head |
|---|---|---|
| a-R01 atomic energy not Möbius invariant | repaired | R:2324 "invariance under PGL₂(C_v) for mass-zero measures whose total variations have continuous potentials"; R:2341 Check δ₀−δ₁ ↦ 2 log 2; correction Σ aᵢ² log|γ′(xᵢ)| gives 2·log 2 for γ = 2z, consistent. |
| a-R02 uniform convergence vs weak convergence | repaired | R:2309 "weak continuity as signed Radon measures when their total variations are uniformly bounded"; R:2319 sin(nx)/n negative control. |
| a-R03 quasi-projective adelic completion | repaired | §4.3a R:5596–5608 constructs `quasiProjectiveAdelicPicard`, boundary topology, `quasiProjectiveAdelic_projectiveComparison`; §4.4 R:5612 consumes it; Yuan–Zhang Theorem 5.4.3 is on printed p. 168 (yuan-zhang-adelic-v9 line 6607). |
| a-R04 / b-R08 TropicalAndBerkovichArithmetic | repaired | R:5628 "supplied by ArithmeticDynamics §§2.2–2.3"; grep for "Tropical" in the README returns nothing. |
| a-R05 / b-R05 DT slugs | repaired | R:115–117 contract with `prod_infinitePlace_comap_pow_mult`, `mulHeight_algebraMap`, `absMulHeight₁_eq_rpow`, `absMulHeight₁_eq_of_minpoly_eq`, `finite_setOf_absMulHeight₁_le`, §2.4; all five names exist in DiophantineApproximationAndTranscendence §§0.2–0.3 on main (its lines 259, 269, 289, 299, 358). No "DT." remains. |
| a-R06 Lattès good reduction | repaired | R:8141 "for an integral Weierstrass model over a valuation ring with unit discriminant, this lift has good reduction, including residue characteristic 2"; R:8162–8163 y²+y=x³ (Δ=−27, resultant 729) and y²+125y=x³ (resultant 729·5²⁴) recomputed: b₆=15625, Φ₂=X⁴−31250X, ΨSq₂=4X³+15625, Δ²=729·5²⁴. |
| a-R07 / b-R09 power map and k(t) heights in Layer 0 | repaired | §0.27a R:1414, §0.27b R:1447; §2.86 Needs R:3674 cites §0.27a; R:761–762 build paragraph; §1.19 Check R:2102 now has its instance earlier. |
| a-R08 point heights and base change | repaired | R:5815 `AdelicMeasure.baseChange` "Point heights need not be unchanged when that orbit splits"; R:5829 `IsLocallyGaloisInvariant`; R:5975 Check ½ log 2 over ℚ, 0 over ℚ(i), recomputed: energies (½ log 2 at ∞ and at 2) give ½ log 2; over ℚ(i) every local term is 0. |
| a-R09 scheme classification | repaired | R:1383–1385 owns `projectiveLine_picard_degree`, `projectiveLine_sections_O`, `projectiveLine_morphism_sections`, `RationalMap.toSchemeEnd_*`; Stacks tags verified: 01NE is constructions Lemma 13.1 (cache line 1267), 0BXJ divisors Lemma 29.5 (line 3204), 01XT coherent Lemma 8.1 (line 801). |
| a-R10 Lattès height factor | repaired | R:6781 and §6.64 R:9243 "ĥ_{f_{E,n}}(x(P)) = canonicalHeight(P)/[K : ℚ]"; non-torsion control (3,5) on y²=x³−2 is on the curve (27−2=25). |
| a-R11 monodromy/comparison cycle | repaired | §3.66a R:5129 Needs §§3.28, 3.49, 3.60, 3.61, 3.66 only; §3.67 R:5145 no longer lists §3.70; §3.70 R:5205 consumes §3.66a and §3.67. |
| a-R12 §6.86 self-link | repaired | R:9589 Needs §6.70, §6.28, §6.51; no anchor to §6.86 itself. |
| a-R13 residue reconstruction N ≥ 1 | repaired | R:8382 "for N ≥ 1"; R:8367 "n ≥ 1 + max bᵢ"; R:8391 N = 0 and threshold negative controls. |
| a-R14 / b-R01 Lean generality | repaired | L:483 `(p : ℕ) (hp : 2 ≤ p)`; L:512 `{K : Type*} [Field K] [CharZero K]`. |
| a-R15 polynomial endpoints | repaired | L:522 `polynomialOrbits_commonIterate`, L:532 `polynomialLine_returnTimes`; named in R:9549 and R:9641. Both statements are true as typed (GTZ Theorem 1.5 with α = 1, β = 0; Theorem 1.4, which allows constant polynomials, cache line 83). |
| a-R16 UBC dimension | repaired | R:4660 `UniformBoundednessConjecture N d D`, R:4671 `UniformBoundednessProperty N d D C`. |
| a-R17 filter predicate | repaired | R:4483 "S.filter (fun x ↦ orbitRepeatsWithin f S (|S| + 1) x)". |
| a-R18 Poonen rank hypothesis | repaired | R:4142 "Assuming PoonenConjecture and rank J(C₁(3₂))(ℚ)≤1". |
| a-R19 arboreal in every characteristic | repaired | R:8009 "(d,char k)≠(2,2)"; R:8011 `genericRational_fullArboreal` for every field; R:8019 characteristic-two polynomial image Rₙ⋊Rₙ×; §5.6a, §5.17a, §5.18 added. Juul Theorem 1.1 (cache lines 65–66) states exactly this. |
| a-R20 height-bound constants | repaired | R:1862 "upper constant 0 and lower constant −log 2". |
| a-R21 missing sources.toml | settled (not actionable) | The package folder still has only README.md, Suggested.lean, metadata.toml; the board copy of the manifest has 9 entries. The repair's reason (edit boundary) stands; not re-raised. |
| a-R22 Lean mirrors of Checks | repaired | L:392–398 four sign pairs and H(0,0) = −2; L:234 integer translation; L:477 {1} ∪ evens. |
| a-R23 Hölder Check | repaired | R:5948 "harmonic there but not locally constant". |
| a-R24 Misiurewicz equation | repaired | R:6546 "gives periodic critical parameters again (for D=2,n=2: c=0,−1)"; P_c³(0) − P_c(0) = (c²+c)² confirmed. |
| a-R25 infinity sign | repaired | R:1453 "= deg num(g) − deg denom(g) ... which is log|g|_∞"; g = t check. |
| a-R26 quadratic discriminant guard | repaired | R:7253 "Monic quadratic, n ≥ 1 ... At n=0 its factor is −4"; R:7507 "for n ≥ 1". |
| b-R02 GIT ownership | repaired | R:161–163 §1.17 contract; R:1481 §0.28 uses `IsInvariant`, `IsCategoricalQuotient`, `IsGeometricQuotient`, which exist on main (SchemeAndStackFoundations lines 2603–2608); reference `silverman-moduli-1998` at R:10860. |
| b-R03 multiplicity pattern | repaired | R:3951 "B ≡ 3: the transform is [N = 1] + 2·[N = 2]". |
| b-R04 sorry'd duplicate | repaired | L:178 `tateLimit_double` is the proved theorem; no admitted copy. |
| b-R06 SF.0 slug, RP.0 gaps | repaired | R:8499 "SchemeAndStackFoundations §0.9 `spreading_out_models`" (main line 841); gaps table R:69–73. The remaining labels "SF.0"/"SF.5" are S02 below. |
| b-R07 ConformalMapping anchors | repaired | R:209 "Layers, L0 (the local mapping engine)"; R:261 "Layers, L4 (analytic continuation and the reflection principle)". |
| b-R10 design slugs | repaired | The listed slugs are gone; §3.47 cites `gap:ed-bounded-height-candidates` (but see S04). |
| b-R11 missing references | repaired | Entries `silverman-moduli-1998`, `bijl-2014`, `demarco-faber-degeneration`, `stacks-projective`, `yuan-zhang-adelic-v9` at R:10854–10882; the background names (Boucksom–Jonsson, Gubler, Altman–Kleiman, van den Dries–Schmidt, Washington, Bousch, Buff–Tan, DF1/DF2, Tate 1983) no longer occur. |
| b-R12 ED.0 contract, "supplier gap" wording | repaired | `gap:ed-bounded-height-candidates` R:73; the four sentences now say "explicit hypothesis" (R:5376, 5438, 5452, 5544). |

No repair introduced a new mathematical error that I could find: every recomputed Check in the repaired sections (listed under Verified sound) holds.

## S01 (P3) — Lean docstring cites the ℂ-only theorem for a statement over every characteristic-zero field

**Location:** `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:520–521`, "(Ghioca–Tucker–Zieve Theorem 1.1; README §6.84)".

**Claim:** The docstring attributes `polynomialOrbits_commonIterate`, stated for `{K : Type*} [Field K] [CharZero K]`, to GTZ Theorem 1.1.

**Witness:** ghioca-tucker-zieve-2008 line 18: Theorem 1.1 is for "x0,y0 ∈ C and f,g ∈ C[X]". The characteristic-zero statement is Theorem 1.5 (line 94) with α = 1, β = 0, as README line 9551 itself says.

**Repair:** Change the docstring to "(Ghioca–Tucker–Zieve Theorem 1.5 with α = 1, β = 0; Theorem 1.1 is the case K = ℂ; README §6.84)".

## S02 (P3) — Supplier keys `SF.0` and `SF.5` name sections that do not exist in SchemeAndStackFoundations

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:1394`, "`SchemeAndStackFoundations:SF.0`"; also lines 26, 1785, 5788, 6945, 8501, 8876, 8880, 9803, 9969.

**Claim:** `SF.0` and `SF.5` identify the consumed SchemeAndStackFoundations material.

**Witness:** SchemeAndStackFoundations on main has no label "SF.0" or "SF.5" (grep returns nothing); its relevant units are §0.3 (line 550), §0.9 (line 824) and "Layer 5: intersection theory and Riemann–Roch" (line 6475). The contract headers at lines 119, 165, 197 say "Layer 0", "Layer 5".

**Repair:** Replace each `SchemeAndStackFoundations:SF.0` by "SchemeAndStackFoundations §0.3" (line 1394), "§0.9 `spreading_out_models`" (lines 8501, 8880, 9803) or "Layer 0 quasi-projective varieties" (line 8876) as consumed, and `SF.5` by "SchemeAndStackFoundations Layer 5"; rewrite line 26 and the Dependencies paragraphs accordingly.

## S03 (P2) — The Layer 5 endpoint has no Lean headline although it is easy on pinned carriers

**Location:** `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:432–447` (Layer 5 holds only `discr_iterate_sub_succ`); `TauCetiRoadmap/ArithmeticDynamics/README.md:6949`, "The all-level x²+1 example is the selected endpoint"; README §5.65 (line 8095).

**Claim:** The file records "the end theorems and the milestone of each layer ... when every carrier in the statement exists" (brief); Layer 5's selected endpoint is Stoll's theorem for x² + 1.

**Witness:** §5.65(iii) "|G_n| = 2^{2ⁿ−1} for every n ≥ 1" with G_n ≅ Polynomial.Gal (fⁿ − α) (§5.42, line 7740). `Polynomial.Gal`, `Polynomial.comp`, `Nat.card` and `Function.iterate` all exist at the pin; no tree carrier is needed.

**Repair:** Add to Layer 5 of Suggested.lean, with its README name in §5.65:
```lean
/-- Stoll: the n-th iterate of x² + 1 over ℚ has Galois group of order 2^(2ⁿ − 1)
(the full automorphism group of the binary tree of depth n; README §5.65). -/
theorem stoll_X_sq_add_one_card_gal (n : ℕ) :
    Nat.card (Polynomial.Gal ((X ^ 2 + 1 : ℚ[X]).comp^[n] X)) = 2 ^ (2 ^ n - 1) := sorry
```
Optionally also the stability statement of §5.56 for the same polynomial, `Irreducible ((X ^ 2 + 1 : ℚ[X]).comp^[n] X)` for n ≥ 1.

## S04 (P3) — Two Needs lines cite "ED.0, bounded-height-enumeration" instead of the declared gap

**Location:** `TauCetiRoadmap/ArithmeticDynamics/README.md:4828`, "EffectiveDiophantineMethods ED.0, bounded-height-enumeration"; same at line 4935.

**Claim:** The Needs lines of §3.47 and §3.53 name their supplier input.

**Witness:** The Scope table (line 73) declares the input as `gap:ed-bounded-height-candidates`, and the statement of §3.47 (line 4822) uses that slug; "bounded-height-enumeration" is not declared anywhere.

**Repair:** In both Needs lines write "`gap:ed-bounded-height-candidates` (EffectiveDiophantineMethods, ED.0)".

## Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| L:33–118 orbits, preperiodicity | id, successor, z²−1 at 1 and 2, group power map with d = 0, 1, 2 | d ≥ 2 needed and present; iterate/semiconjugacy transfers hold with 0 < k and bijectivity | none |
| L:133–201 Tate limit | a = 1 (divergent), φ = id, h = 0, stationary orbit, C < 0 (vacuous) | all true as typed; `tateLimit_eq_zero_iff` uses Northcott only for ⇒ | none |
| L:166 elliptic doubling | pinned `canonicalHeight` = lim h(2ⁿP)/4ⁿ without ½ (TauCeti file lines 24, 40) | normalisation agrees | none |
| L:211–315 backward orbits, Fatou, Julia | id, constant, real doubling, z^d on `OnePoint ℂ` with the compact uniformity, d = 1 | d ≥ 2 required for {0, ∞} and the circle; present | none |
| L:324–412 Morton equations | (±1,±1), (0,0), (1,−1) with t+u = 0, cycle 3,−3,0, c = −29/16 | all identities hold; guards t²≠1, t+u≠0 present | none |
| L:415–424 height bound adapters | K = ℚ, quadratic K | logHeight₁ = log mulHeight₁ (Mathlib line 146), finrank > 0 | none |
| L:436–447 discriminant recursion | d = 1, n = 0, monic quadratic n = 0, 1, 2, non-monic (3x²+x+2, n=1), char p ∤ d | derived from Mathlib's `discr` (det·(−1)^{d(d−1)/2}) and `resultant_deriv`; sign (−1)^{d(d−1)d^n/2} and a-exponent (d−1)dⁿ+(dⁿ−1)(dⁿ⁺¹+1) both check (d=2,n=2 gives 31; d=3,n=1 gives 26) | none |
| L:457–484 progressions | {3,7}, ∅, ℕ, {1}∪2ℕ, powers of p, N = 0 | equivalence with eventual periodicity true | none |
| L:487–497 primitive root, Lech–Cassels | y ∈ F, s ∋ 0, L = ℚ | true (Cassels Theorem I, integral form) | none |
| L:501–508 Ritt | F = −X², G = X² (fails, (−1)³ ≠ 1), F = ζX², ζ³ = 1, s = 0 monomials, translations | matches GTZ Proposition 6.3 verbatim (cache lines 678–681) | none |
| L:512–518 synchronized affine | a = c = 1, a = 1 ≠ c, roots of unity, A₁ = 0 | true via unit equation / growth | none |
| L:522–535 GTZ endpoints | constants in 1.4, equal degree in 1.5 | true; docstring locator S01 | S01 |
| §0.4–0.15 resultants | Res_{2,1}(X₀X₁, X₀+X₁) = −1, diag(2,1) conjugate (64, 4), swap, d = 0 | all values check | none |
| §0.29–0.40 moduli | 1/z² vs 2/z² (c³ = 2), σ(z²+c) = (2,4c,0), z(z+2)/(3z+1) ↦ 18/5, b=0,c=1 case, A³(A−1)=BC rescaling | all check | none |
| §1.3, §1.4 | mulHeightBound (3, 9), lower constant −log 2 | check against Mathlib `mulHeightBound`, `logHeight_eval_ge` (lines 230, 491) | none |
| §1.19, §1.26 | z²+t at 0 over k(t) (1/2), product counterexample (z², w+1) | hold | none |
| §2.12–2.89 escape rates | (z^p−z)/p at 0 (−log p/(p−1)), (z²−z)/2 at √2 (−log 2/4), (z²+1)/(3z) over ℚ₃ and ℂ₃ (resultant 9, G(i,1) = −½ log 3), z²−z−1 mod 2, 3, 7 | all recomputed and correct | none |
| §2.51–2.71 periods | z²−z−1 at 2 (n = m·r·p), bounds p³−p, 24, 6, Zieve e ≤ 1 at p = 2,3 | consistent | none |
| §3.1–3.66 dynatomic | Φ*₂(z²+c), Φ*₃(z²+c), ν₂(1..7), Möbius transform r=2,B≡3, e₁..e₆ = 1,1,1,2,3,5, kneading 1/7 (d=3) and 28/31 (d=4), z²−3/4 at −1/2 | all recomputed and correct | none |
| §3.58 FPS reduction | node (−1,−4/3); q = 3 ⇒ t = −4/3, c = −64/9; q = −1 ⇒ t = 1/3, c = −16/9; r = 0 covers c = −4/3 and c = −2 (trace −1) | matches fps95 lines 258–276 | none |
| §3.81–3.88 Morton | t-coordinates 3,−3,0, η = 0, (−1,−1) ↦ (0,0) | hold | none |
| §4.14–4.31 energies | {±1} at ∞ (−½ log 2), {0,1} r = ¼, n-th roots of unity (−log n/n), Gauss-radius measure (½ log p), centred circle at i | all hold | none |
| §4.58, §4.65 | ⟨z², 2−(2−z)²⟩ = log 2; bound log 2 sharp | consistent with PST | none |
| §5.x arboreal | x²+1 (c = −1,2,5,26,677,458330; b₂,b₃,b₄,b₆; |G₃| = 128), x²+3 (c₂c₃ = 42²), x²−2 (cyclic), x²+5 primitive primes, Aut(T²₂) = 8, kernel orders, Fin.tail convention | all check | S03 (missing headline only) |
| §6.3–6.35 Lattès | y²=x³−x doubling, y²=x³+1 at (2,3) ↦ (0,1), Legendre Δ, j, τ_T formulas, lift resultant Δ² | all check | none |
| §6.44 Ghioca example | p = 2: {0,1,5,21,85} | holds | none |
| §6.60, §6.83, §6.88, §6.89, §6.96, §6.100 | (2,3) heights log 4 vs log 3; diameter |2|^{2/3}|t(t−1)|^{1/3}; ∫φ̂dμ̂ = −1/3; 2-adic G = −(11/4) log 2; (2/9) log p; (b−1)²/(6b) | all recomputed and correct | none |
| Gaps table | `rp-dominant-height`, `rp-geometric-height-field`, `ed-bounded-height-candidates` | precise and minimal as far as readable; suppliers not on main (see Not verifiable) | S04 (slug consistency) |

## Verified sound

- **Declarations read:** all 68 in `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` (15 definitions, 37 `sorry`'d theorems, 16 proved examples, one local instance). Single `import Mathlib` plus one `TauCeti.*` module; no `set_option`, `lemma`, `#eval`, `True` placeholder or sorry'd data; every Lean name occurs in the README.
- **Targets read:** every line of the README (10882 lines; 686 headed sections including 63 corrections and the references). Each kept definition has at least three Checks and at most two proved examples.
- **Pinned declarations checked at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): `Polynomial.discr`, `resultant_deriv`, `AdmissibleAbsValues` (empty archimedean multiset allowed), `logHeight₁`, `mulHeight₁`, `mulHeightBound`, `logHeight_eval_ge`, `uniformSpaceOfCompactR1`, `Algebra.EssFiniteType`, `IntermediateField.fg_top_iff`, `canonicalHeight` and `tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, the twelve `OnePoint` sphere-atlas names (TauCeti OnePoint.lean lines 68–201).
- **Supplier citations checked on main:** SchemeAndStackFoundations §0.3 (`relativeProj_*`), §0.7–0.9 (`spreading_out_models`), §1.17 (three quotient predicates), Layer 5; DiophantineApproximationAndTranscendence §§0.2, 0.3, 2.4 and the five named theorems; HeightsAndUnits §1.1 `Northcott`; ClassicalArithmeticCompletion §6.16, §6.37 (`projectiveWeilHeight`, `projectivePowerMap`, `powerMapCanonicalHeight_eq`); RestrictedPowerSeries §§2.1, 2.4, `PowerSeries.IsRestricted`; ModularCurves 0D; FuchsianOrbifolds Layer 5; ConformalMapping L0/L4. ErdosProgressionPowers (rev 1336) is never cited and shares no object with this package.
- **Locators verified** (23 groups): Stacks 01NE/0BXJ/01XT; GTZ Theorems 1.1, 1.4, 1.5, Lemma 5.1, Proposition 5.3, Propositions 6.1–6.3, Corollary 6.4, Lemmas 6.5–6.7; Ritt 1920 §IV pp. 354–356; FPS §3 displays and Table 2; Juul Theorem 1.1 and §5 pointer; Yuan–Zhang Theorem 5.4.3 (printed p. 168); call-silverman-1993 and ms95 locators as in round 1 (unchanged text).
- **Checks tested:** about 140 numerical and algebraic assertions recomputed by hand (table above), including all Checks in the repaired sections.
- **Policy:** no pull-request numbers or process narrative in README or docstrings; `theorem` throughout; every target carries a locator; the pull request touches only `TauCetiRoadmap/ArithmeticDynamics/` (outside-folder diff empty).
- **Dependency gate** (`gate --depcheck`, this head, merge order of the board):

```text
depcheck: 2 roadmaps, 14 edges, 0 problem(s)
```

No UPWARD or CYCLE line; ArithmeticDynamics is at position 145, all cited suppliers earlier.

## Not verifiable

- **Suppliers not on main and not in an open pull request available here:** HeightsRationalPointsAndObstructions (RP.0, RP.4, RP.5), EffectiveDiophantineMethods (ED.0, ED.3, ED.4 and their slugs `fps-genus-two-mordell-weil`, `poonen-genus-two-mordell-weil`, `stoll-genus-four-subgroup`, `fps-quintic-cycle-curve`, `poonen-type-three-two-curve`, `stoll-six-cycle-curve`, `rank-zero-curves`), InverseGaloisAndArithmeticFundamentalGroups IG.2, ArakelovGeometryAndAbelianHeights. Their contract texts (README lines 123–149, 193–203, 265–271) and the three declared gaps cannot be compared with the suppliers' own statements.
- **Declared gaps:** the README declares three gaps (lines 69–73) but no readable `design/plan.json` exists, so "declared where the intake reads it" cannot be confirmed; a-R21 (no `sources.toml` in the package) remains outside the repair's edit boundary.
- **Lean elaboration:** not run (read-only brief); the repair report's build is taken as evidence of elaboration only, not of truth.
- **Sources not re-read in this pass:** locators into Benedetto's and Silverman's AWS notes, Baker–Rumely, Favre–Rivera-Letelier, DKY, Ingram, Jones, AHM, Stoll 1992 (waived), Zieve (waived), Morton 1992/1996/1998, Hutz, Doyle–Poonen, Gao–Ou, Fili, PST, Yuan 2008, Chambert-Loir, Baker–Hsia, Baker–DeMarco, Favre 2017, DWY, Milnor, McMullen, Lyubich were checked only where round 1 reported them or where a Check depended on them; the remaining locators in those works are not certified here.
- **Analytic targets without finite witnesses** (Layers 2 and 4: Lyubich transfer limit, Bowen nets, hybrid potentials, quasi-projective completion) were checked for hypothesis consistency and sign conventions only.
