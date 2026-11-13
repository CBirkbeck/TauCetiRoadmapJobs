<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12941#issuecomment-6849073775 -->
Review (claude) of f23a98b

Verdict: needs_changes

1. **F01** (P2) the coefficient field is never assumed to contain the residue field of `K′`

   **Location.** `packages/LocalGaloisDeformationRingsPartII/README.md` line 379 (3.7): "As in the Conventions, `𝔽` contains the values of the fundamental characters `ω_{f′}`." Line 26: "`E/ℚ_p` is a finite coefficient field, enlarged finitely where a statement says so". Line 29: "followed by `σ₀`".

   **Claim.** The Conventions make `𝔽` contain `k′`, so that `ω_{f′}` is `𝔽`-valued, `ω̃_{f′}` is `𝒪`-valued (0.1) and `W(k′) ⊗_{ℤ_p} R` splits along `σ_{−j′}` (1.1).

   **Witness.** `f = 1`, `s = w`, `E = ℚ_p`: `f′ = 2`, `ω̃₂` has values in `μ_{p²−1} ⊄ ℤ_p`; `W(𝔽_{p²}) ⊗ ℤ_p` is a domain, not `𝒪 × 𝒪`; `σ₀ : 𝔽_p → 𝔽_p` has no meaning on `𝔽_{p²}`. No Conventions bullet excludes it.

   **Repair.**

   - Line 26, after "`𝔽` the residue field.", insert: "Throughout, `E` is large enough that `𝔽` contains the quadratic extension `k₂` of `k`; equivalently `𝒪 ⊇ W(k₂)`, so `𝒪` contains the `(q² − 1)`-st roots of unity."
   - Line 27, after the first sentence, insert: "Fix also `σ′₀ : k₂ → 𝔽` extending `σ₀`. For `K′/K` unramified of degree `r ∈ {1, 2}`, with residue field `k′ ⊆ k₂` and `f′ = rf`, an index `j′` modulo `f′` on `σ` means `σ′₀ ∘ Frob_p^{j′}` restricted to `k′`."
   - Line 29: replace "followed by `σ₀`" by "followed by `σ′₀` restricted to the residue field of degree `f′` (this is `σ₀` when `f′ = f`)".

   Tested on the witness: `E = ℚ_p` is now excluded for every `p`; for `E ⊇ ℚ_{p²}` one has `W(𝔽_{p²}) ⊗_{ℤ_p} 𝒪 ≅ 𝒪 × 𝒪` through `σ′₀, σ′₁`, `ω̃₂` is `𝒪^×`-valued, and the sentence of 3.7 is true as written. The enlargement of `𝔽` in 3.6 (for unramified twists) is a different one and stays.

2. **F02** (P2) 5.4 and 5.5 need the starred coordinate to be a unit, and 5.5 states it by an undefined term

   **Location.** README line 574 (5.4): "Prove `p³ ∈ I^poly_j + J₅`, and `p² ∈ I^poly_j + J₅` in charts 1 and 3". Line 584 (5.5): "if `a ∈ A⁸` lies in the residual chart and `G(a) ∈ p^n A⁵` with `n > 6`, there is `a° ∈ A⁸`".

   **Claim.** The Jacobian bound holds for the ideal `I^poly_j` that 5.2 generates "in the dense polynomial ring", and the approximation holds over every `p`-adically complete Noetherian `p`-torsion-free `A`, under a hypothesis ("lies in the residual chart") defined nowhere and meaningless for non-local `A`.

   **Witness.** Chart 1, `X = c₁₂/e₁₁*`, `Y = d₂₁/d₂₂*`: `G₅ = e₁₁* X((a−1)(a−2)XY − 2p)`. At `e₁₁* = X = 0` all `G_i` and all minors vanish. `A = ℤ_p`, `e₁₁* = X = p³`, `Y = 1`: `G(a) ∈ p⁷`, no zero within `p⁴`.

   In detail, for the second instance (`n = 7`, `G₁ = … = G₄ = 0` solved for `d₁₁, c₂₂, c₂₁, c₁₁`): `G₅(a) = p⁶((a−1)(a−2)p³ − 2p)` has valuation `7`; every `a° ≡ a` modulo `p⁴` keeps `e₁₁*` and `X` of valuation `3` and the third factor of valuation `1`, so `G₅(a°) ≠ 0` (checked on 2000 random such `a°` at `p = 29`, `a₁ = 5`: minimal valuation `7`, never zero). So 5.5 is false unless "the residual chart" means that the starred coordinates of `a` are units, and 5.4 is false in the polynomial ring unless `e₁₁*` (chart 1), `e₂₂*` (chart 3) is inverted. Chart 2 needs no unit: its identity is polynomial.

   **Repair.**

   - 5.4, replace the first two sentences up to the locator by: "For each chart let `(G₁, …, G₅)` be its chart ideal in the dense polynomial ring of 5.2 with the two starred coordinates inverted, and `J₅` the ideal of `5 × 5` minors of the Jacobian matrix in the eight polynomial parameters. Prove `p³ ∈ (G₁, …, G₅) + J₅`, and `p² ∈ (G₁, …, G₅) + J₅` in charts 1 and 3; in chart 2 the starred coordinates need not be inverted". Keep the locator and the rest.
   - 5.4, add the Check: "Chart 1 without inverting `e₁₁*`: with `X = c₁₂/e₁₁*`, `Y = d₂₁/d₂₂*` one has `G₅ = e₁₁* X((a−1)(a−2)XY − 2p)`; at `e₁₁* = X = d₁₁ = c₁₁ = c₂₁ = c₂₂ = 0` every `G_i` and every partial derivative of `G₅` vanish, hence every `5 × 5` minor, and no power of `p` lies in the ideal. With `e₁₁*` a unit, `p·H_X + cY(X·H_X − 2Y·H_Y) = −2p²` for `H = X(cXY − 2p)`, `c = (a−1)(a−2)`."
   - 5.5, replace "if `a ∈ A⁸` lies in the residual chart and" by "if the two starred coordinates of `a ∈ A⁸`, in the polynomial parameters of 5.2, are units of `A` and"; after "surjective for `N ≥ 12`." add "(the images in `R/I∞` of the coordinates of `R_j` satisfy the unit hypothesis: the starred ones reduce to nonzero elements of `𝔽`)".
   - 5.5, add the Check: "`A = ℤ_p`, chart 1, `n = 7`, `e₁₁* = X = p³`, `Y = d₂₂* = 1`, the other four coordinates solving `G₁ = … = G₄ = 0`: `G₅(a) = p⁶((a−1)(a−2)p³ − 2p) ∈ p⁷A`, and every `a° ≡ a` modulo `p⁴` has `G₅(a°) ≠ 0`; the unit hypothesis cannot be dropped."

   Tested on the refuting instances: the point `e₁₁* = X = 0` is not a point of the ring with `e₁₁*` inverted; `e₁₁* = p³` is not a unit of `ℤ_p`, so the second instance no longer satisfies the hypothesis; for `A = R/I∞` nothing changes.

Two findings, both P2, both in `packages/LocalGaloisDeformationRingsPartII/README.md`. `Suggested.lean`, `metadata.toml` and `sources.toml` need no change. The three findings of round 5 are repaired. R01 is a standing hypothesis that 3.7 attributes to the Conventions and the Conventions do not contain (the last repair report pointed at it without editing). R02 is a unit hypothesis that 5.4 and 5.5 use and do not state; it was found on the sampled target 5.4.

## Round-5 findings

| Id | Status | Repaired passage (README unless said) |
| --- | --- | --- |
| F01 (P2), `Y^{[0,h],τ}(R)` used over rings where nothing defines it | repaired | line 247: "`Y^{[0,h],τ}(R)` is the groupoid of gap:rank-two-descent-kisin-modules for rings of both kinds: its objects are finitely generated projective `𝔖_{L′,R}`-modules `𝔐`, locally free of rank two"; line 77 widens the gap to "every `p`-adically complete `𝒪`-algebra `R`"; line 264: "`𝔐` with an eigenbasis `β`". Checked against `LLHLM23 lines 3360–3411` (Definitions 5.1.1, 5.1.3, 5.1.6, pp. 74–75) and `LLHLM23 lines 4383–4396` (Proposition 7.1.3, p. 98). `design/plan.json` carries the same `needs`. |
| F02 (P3), wrong value at `f = 1` in the non-gauge Check of 1.3 | repaired | line 220: "For `f = 1` every index is congruent to `j + 1` … for `s = 1` the matrix is `diag((1+v)^{p−1} v², v)` over `𝔽`, a polynomial whose upper-left pivot has degree `p + 1 > 2`". Recomputed from `LLHL19 lines 755–768`. |
| F03 (P3), BHHMS23 manifest locator | repaired | `sources.toml`, `BHHMS23`: "Remarks 2.3.5, 2.3.6, 2.4.5, 3.1.2, 3.1.3, 3.2.2, 4.2.5"; all four read (`BHHMS23 lines 750, 833, 838, 1014`). |

The repair report's note on 3.7 (the Conventions do not contain the hypothesis 3.7 attributes to them) holds: it is R01. Patterns looked for in the rest of the package: a ring class wider than the class on which the objects are defined (none left: 1.1, 1.2, 1.4, 4.2 take complete local `R` or `𝔽`); a hypothesis attributed to another passage that does not state it (R01; no other "as in the Conventions" or "as in 5.x" fails); a statement over a ring in which a displayed "unit" is not one (R02).

## Verified sound

**Principles.** All profiles `{(3,0),(2,1)}^f`, reducible and irreducible `ρ̄`, ramified `𝒪` (`p` versus `ϖ` kept apart in 5.4 and 7.5). The base roadmap is imported by section; no source passage copied; no algorithm; no sorried data; no `set_option`. Layers are named by their mathematics and their order is forced by the *Needs:* lines (1←0; 2←1; 4←0,1,3; 5←1–4; 6←5; 7←3–6).

**Elaboration.** `lake env lean` on `packages/LocalGaloisDeformationRingsPartII/Suggested.lean` from the content checkout: one message, `47:8: warning: declaration uses 'sorry'`. Import header: `import Mathlib` only.

**Binder check.** `#check @crossing_prime` (worker's `signatures.md`): `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d`, a unit `u` of `MvPowerSeries (Fin (n + 2)) O`; conclusion `Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`. Same generality as 5.3. Nothing lost, nothing changed.

**Padding probe** on the one sorried theorem, in scratch copies elaborated the same way: `simp` leaves the goal; `rfl` fails; `infer_instance` fails ("type class instance expected"); `exact?` in a file of its own: "could not close the goal"; `aesop` fails; `rw [← irreducible_iff_prime]` fails for want of `DecompositionMonoid (MvPowerSeries (Fin (n + 2)) O)`. No `UniqueFactorizationMonoid (MvPowerSeries …)` at either pin. Not padding.

**Headlines.** From the Summary: 6.1, 6.2, 6.3, 7.3, 7.5; deep intermediate results 4.3, 3.6, 3.9, 5.3. Only 5.3 is statable at the pins and it is stated; the module docstring names every other one with its missing carrier. No file of Mathlib or Tau Ceti at the pins contains `DeformationRing`, `FramedDeformation`, `SerreWeight`, `KisinModule` or `EtalePhiModule`. The only backticked name of this roadmap's own is `crossing_prime` (extracted by script from all backticked identifiers), declared in the file.

**Pinned declarations**, each elaborated by `#check` in one scratch file and opened: Mathlib `MvPowerSeries.C`, `MvPowerSeries.X`; `MvPowerSeries.isEmptyEquiv`, `MvPowerSeries.finSuccEquiv` (`RingTheory/MvPowerSeries/Equiv.lean` 54, 169); `IsRegularLocalRing`, `IsRegularLocalRing.of_ringEquiv`, the instance for a local principal ideal domain (`RingTheory/RegularLocalRing/Defs.lean` 52, 69, 80; `inferInstance : IsRegularLocalRing O` elaborates for a discrete valuation ring); `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `PowerSeries.exists_isWeierstrassFactorization` (`RingTheory/PowerSeries/WeierstrassPreparation.lean` 561, 814; both need `IsAdicComplete (maximalIdeal A) A` and a nonzero reduction, as line 44 says); `IsLocalRing.notMem_maximalIdeal`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two`, `Matrix.adjugate`, `Polynomial.derivative`, `Field.absoluteGaloisGroup`, `modularCyclotomicCharacter`, `LaurentSeries`. Tau Ceti `TauCeti.PowerSeries.isRegularLocalRing` (`RingTheory/RegularLocalRing/PowerSeries.lean` 157), `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`RingTheory/RegularLocalRing/UniqueFactorization.lean` 59, hypothesis `ringKrullDim R ≤ 2`), `TauCeti.inertiaTameCharacter`, `TauCeti.quotientWildInertiaSubgroupEquiv` (`NumberTheory/LocalField/Tame/Character.lean`). All 20 exist with the stated meaning.

**Dependency check** (the brief's command):

```text
depcheck: 206 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Supplier citations resolved now** (main and the open heads of the index of 2026-11-13; the board package for ModpRepresentationsOfGL2OverLocalFields). Every cited section exists under the cited heading:

- LocalFieldsRamification (main) "Layer 4: the tame quotient of the absolute Galois group" (line 1155); no Kummer-tower statement, so the gap is not redundant. ClassFieldTheory (main) "Layer 7" (1205).
- PadicLocalLanglandsForGL2Qp §§0.3, 0.4, 4.4 (268, 292, 1473); §4.4 is stated for `GL₂(ℤ_p)` and supercuspidal classes over any `F`, as line 63 says.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, .2, .5, .6, .24, .36, .39 (5483, 5559, 5684, 5715, 6528, 7307, 7412), with `kisinOpenDiscBounded` and `KisinModuleCoeff`.
- LocalGaloisDeformationRings §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 8.10 (1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3810), with `heightLatticeFunctor`. §6.9 is the `GL₃` construction with `r ∈ {1,2,3}`; §8.10 is the reducible case over `ℚ_p`: lines 76 and 78 describe them correctly, and the two gaps ask for what they lack.
- ModpRepresentationsOfGL2OverLocalFields §§3.1, 3.2, 3.4, 5.5 (938, 963, 1008, 1373); its depth (`N < r_i + 1 < p − N`) is the one of line 31 and its `W(ρ̄)` the one of line 83.
- DeformationAndDerivedPatchingAlgebra §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 4.6, 4.7, 6.8 (213, 233, 262, 282, 305, 325, 991, 1006, 1327), with `seriesPresentation_surjective`, `flatCompletion_finiteComparison`; no Hamann or power-invariance statement.
- PurityForFlatCohomology §7.4 (2299), `isRegularLocalRing_uniqueFactorizationMonoid`.

**Gaps.** A script compared `design/plan.json` with the README's "must provide" lines: 9 and 9, same slugs, same suppliers, every `needs` equal word for word. Each names a roadmap and a section and states one construction with its hypotheses. Any later acceptance is conditional on the nine.

**Ownership and overlaps.** `scratch/overlaps.md`: no pull request changes this roadmap, no dropped id, no id only a revision defines, no second copy. Searched by object on main and at the 440 open heads: "gauge basis", "monomial étale", `crossing_prime`, `G_{K∞}` with `Φ_p`: no match; "cyclotomic free": one unrelated match (StableHomotopyKTheoryPartII, the free-loop spectrum); BHHMS23 Propositions 4.2.1 and 4.3.3: only HilbertModularVarietiesAndShimuraCurvesPartII, which cites this roadmap for them. No other `Suggested.lean` declares `TauCetiRoadmap.LocalGaloisDeformationRingsPartII.crossing_prime`.

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, LocalGaloisDeformationRings, PotentialAutomorphyInfrastructurePartII, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicLocalLanglandsForGL2Qp; Kisin modules with tame descent: owner LocalGaloisDeformationRings §6.9 (cited, with a gap); the types `σ(τ)`: owner PadicLocalLanglandsForGL2Qp §4.4 (cited, with a gap); single- and multiple-type rings of BHHMS23 §4: owner this roadmap (the first cites it); the generic-tame domain theorem of LLHLM23 that the third asks of LocalGaloisDeformationRings is not stated here; nothing has two owners.

Remark, no change here: HilbertModularVarietiesAndShimuraCurvesPartII cites this roadmap as `T.0–T.7` and declares on it three gaps (`tame-types`, `single-type-rings`, `breuil-mezard-pbt`) about potentially Barsotti–Tate rings and lattices of `σ(τ)`, which line 9 and line 15 place outside this roadmap; it also asks DeformationAndDerivedPatchingAlgebra for Hamann's theorem under another slug. These are points for that roadmap's review.

**Sources, seeded sample**, each read at its locator in the cached text.

| Target | Locator read | Result |
| --- | --- | --- |
| 0.4 | LLHL19 Proposition 2.2.16 (`LLHL19 lines 508–512`, p. 14), 2.2.15 (491–494); BHHMS23 Remark 2.3.5 (665–667, p. 15), §4.1 (1143–1147, p. 25) | matches: `d − n + 1 = d − 1` at `n = 2`, `d ≥ 2` |
| 2.1 | BHHMS23 §3.1.2 and Proposition 3.1.7 (878–912, p. 20); LLHLM23 Definitions 5.1.1, 5.1.3, 5.1.6 (3365–3406, pp. 74–75), Proposition 7.1.3 (4383–4396, p. 98) | matches; the source's ring class is the first kind only (Source issues) |
| 2.3 | BHHMS23 (16), Proposition 3.1.9 (946–971, pp. 20–21) | matches: `N ≥ 2h − 3`, `(N−1)(p−1) ≥ h`, remainders in `p^{N−(h−1)−t}` |
| 3.3 | Definition 3.2.4 and the lines before 3.2.5 (1033–1047, p. 22) | matches |
| 3.4 | Definition 3.2.5 (1048–1052, p. 22) | matches |
| 3.5 | Lemma 3.2.6 (1055–1074, p. 23) | matches: `nr` sends arithmetic Frobenius to `α` |
| 3.8 | Lemma 3.2.8 (1097–1103, pp. 23–24); LLHLM18 Definition 3.8, Lemma 3.10 (1114–1131, p. 29), Proposition 3.12 (1223–1236, p. 31); LLHLM23 Lemma 7.2.10 (4806–4824, p. 107) | matches |
| 3.10 | BHHMS23 proof of Proposition 4.3.1 (1691–1712, p. 35; 1825–1827, p. 37) | matches: the ring of `G_{K∞}` is used without construction |
| 5.4 | Lemma 4.2.3 (1478–1495, p. 31) | the identity matches; the unit is not stated (R02, Source issues) |
| 5.6 | lines 1523–1536 (p. 32), (26); GHLS17 Theorem D (`GHLS17 lines 174–177`, p. 4), Theorem 3.1.5 (1041–1043, p. 21) | matches |
| 5.8 | Lemma 4.2.4 and lines 1517–1558 (pp. 32–33) | matches: `N ≥ 9` suffices |
| 6.1 | Proposition 4.2.1 and proof (1319–1578, pp. 28–33) | matches: index `λ_{f−1−j}` |
| 6.2 | the same; dimension at 1890–1893 (p. 38) | matches |
| 6.3 | Corollary 4.2.6, (27)–(28) (1588–1616, pp. 33–34); Lemma 8.1.2 (4405, p. 88); Hamann75 Theorem 4 (`Hamann75 line 101`, p. 155) | matches: `m ≤ f` |
| 7.1 | Proposition 4.3.1 (1644–1680, pp. 34–35), Figure 2 (1852–1856, p. 38), Tables 4–5 (2175–2324, pp. 44–45) | matches, entry by entry |

Also read: BHHMS23 lines 612–674 (0.1–0.3), 700–764 (0.5), 797–872 (1.1–1.4), 1003–1134 (3.1–3.9, 5.3), 1201–1284 (4.2, 4.3), Tables 1–3 (1957–2172), 1900–1954 (7.4, 7.5); LLHL19 713–782, 975–989; Elkik73 Lemme 1 (`Elkik73 line 118`, p. 556). All eight cited works are in `sources.toml`; no local path in it. The author flagged no locator as unverified.

**Adversarial table** (values computed this round).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, coefficient field | `f = 1`, `s = w`, `E = ℚ_p` | `ω̃₂` valued in `μ_{p²−1} ⊄ ℤ_p`; `W(𝔽_{p²}) ⊗ ℤ_p` a domain | hypothesis missing | R01 |
| 0.1 | `f = 1`, `s = w`; `p = 7`, `s = 1`, `μ = 0` | `α′ = ((μ₁+1, μ₂), (μ₂, μ₁+1))`, exponents `μ₁+1+pμ₂`, `μ₂+p(μ₁+1)`; `ω₁ ⊕ 1` | holds | none |
| 0.3 | `p = 5`, `s = w`, `μ = (1,0)` | `a′^(0) = (2,10)`, `a′^(1) = (10,2)`; orientations `w, 1`; `w(2,10)` dominant | holds | none |
| 0.4 | `N = 13`; `N = 1` | 2.2.16 gives `13 − 2 + 1 = 12`; at `N = 1` the definition | holds | none |
| 1.3 Check (repaired) | `f ≥ 2`; `f = 1, s = 1`; `f = 1, s = w` | `diag(v²(1+v)^{−1}, v)`; `diag((1+v)^{p−1}v², v)`, degree `p+1`; `diag(v²(1+v)^{−1}, (1+v)^p v)` | all three as stated | none |
| 1.3 Check, normal form `t^(2,1)` | `g·diag(v²,v)·h`, `g, h ∈ I` | entries `(av²a′+bv²c′, av²b′+bvd′; cv³a′+dv²c′, cv³b′+dvd′)`: `v²`, `v`, `v²`, valuation exactly 1 | forces `[[xv²,0],[yv²,zv]]` | none |
| 2.1 (repaired text) | `𝒪⟦x⟧`; `𝒪⟨T⟩`; `Σ p^{−i}(u′)^i` | uncountable `𝔽⟦x⟧`, so not first kind; `T + (1−T) = 1` non-units, not local; needs `i ≤ c + ⌊i/2⌋` for all `i` | holds | none |
| 2.1 Frobenius rule | `u′e` | `−p(u′)^pλ = −E(u′)^pφ(λ)` by `pλ = Eφ(λ)` | holds | none |
| 2.3 | `h = 3`, `N = 12`; `h = 2` | `L = 11`: `p^{11−2−t} = p⁹, p⁸`; `2h − 3 = 1`, one jet | holds | none |
| 3.3 variance | `K = ℚ_p`, `φ(e) = αe` | `φ(c) = αc`, Frobenius acts by `α`; on `T_𝔽(M)` by `α^{−1}`; on `T_𝔽(M^∨)` by `α` | holds | none |
| 3.3 basis change | diagonal `B_j` | `φ(e^{(j)}B_j) = e^{(j+1)}B_{j+1}·B_{j+1}^{−1} D_j w̃_j φ(B_j)` | holds | none |
| 3.4 / 3.5 | `λ = (c,…,c)`; `f = 2`, `(c, c^{−1})` | `nr(c^f)`; trivial twist | matches Lemma 3.2.6 | none |
| 3.7 digit estimate | `p ∈ {7, 11, 13}`, `f′ ∈ {1, 2, 4}`, all digits with `3 ≤ |δ_i| ≤ p − 3` | `Σ p^i(δ_i ∓ 1)` and `Σ p^i δ_i` never `≡ 0` modulo `p^{f′} − 1`: 0 violations by enumeration | holds | none |
| 3.7 controls | `ω ⊕ 1`; `p = 7`, `ω⁵ ⊕ 1`; `s_τ = w` | coordinates `1`, `p − 2`: 1-generic, not 2-generic; `ω^{−5} = ω`; `gcd(q+1, p−1) = 2` | depth 2 sharp | none |
| 3.8 | `W = ω`, `K = ℚ_p`; `W = 𝔽` | Kummer cocycle of `−p` nonzero on `G_K`, zero on `G_{K∞}`; `K(p₁)/K` not Galois (`ζ_p ∉ K`), so no nonzero character kills `G_{K∞}` | hypothesis needed and present | none |
| 3.10 (i), (ii) | `Γ = ℤ_p`, `n = 1`; `Γ = ℤ/2`, `H = Γ` | `lim 𝒪[T]/((1+T)^{p^m} − 1) = 𝒪⟦T⟧`; no term for `H ⊄ ker ρ̄` | holds | none |
| 3.10 (iv), (v) | `T ↦ T²`; `ω ⊕ 1` | tangent map zero, image `𝒪⟦T²⟧ ∌ T`; `[[ω, εc],[0,1]]` is a lift since `c(gh) = c(g) + ω(g)c(h)`, trivial on `G_{K∞}` | hypotheses needed and present | none |
| 4.1 | `μ(τ)_j + η = (r_j, 0)`, `(r_j+1, −1)` | coordinates `r_j`, `r_j + 2 ∈ (N−1, p−N+1)` | `(N−1)`-deep | none |
| 5.2 charts against Tables 1–3 | all 15 generators, the three matrices, the constants | identical to `BHHMS23 lines 1996–2011, 2061–2096, 2152–2169` without tails; `a₁, a₂, a₃` as at 2012, 2098, 2170; `det A₁`, `det A₂` expanded in `z`: lower coefficients equal the Table generators (100 random integer points) | matches | none |
| 5.2 `G₅`, chart 2 | random rational `a, t, p` (200) | `(t+p)(a(a−1)t/((a−2)(a+1)) + p) = κ^{−1}(t+p)(t+κp)`; `κ − 1 = −2/(a(a−1))`; `p = 3, κ = −1, x = 2, y = 3`: `−27` | holds | none |
| 5.3 / `crossing_prime` | `d = 0`; `u = x₁`; `ϖ | b(b+x₂)` | unit; `x₁(x₂ + ϖ^d)`; `ϖ | b` and `ϖ | b + x₂` would give `ϖ | x₂` | hypotheses needed and present | none |
| 5.4 identity | 500 random rational `(x, y, p, κ)`; `x = y = 0, p = 3, κ = −1` | both sides equal; `108` | holds | none |
| 5.4 minors | chart 2; chart 1 | columns `c₂₁, c₁₂, c₁₁, c₂₂` unitriangular, so `F_x ∈ J₅`; chart 1: `J₅ ∋ e₁₁*H_X, e₁₁*H_Y, H`, giving `−2p²e₁₁*`; at `e₁₁* = X = 0` everything vanishes | `p²` only with `e₁₁*` a unit | R02 |
| 5.5 | `A = ℤ_p`, `e₁₁* = X = p³`, `p = 29` | `v(G₅(a)) = 7`; minimal `v(G₅(a°))` over 2000 `a° ≡ a` mod `p⁴`: `7` | false without the unit hypothesis | R02 |
| 5.6 | `λ_j = (3,0)`, `(2,1)` | `λ_j − (1,0) = (2,0)`, `(1,1)`; middle summand `(a+1, b+1)` | matches (26) | none |
| 5.8 | `ψ(X_i) = X_i + p^{N−8}ε_i`, `N = 9` | identity modulo `(𝔪², p)` | automorphism | none |
| 6.1 | `f = 2`, `λ = ((3,0),(2,1))` | `P_{0,λ₁} + P_{1,λ₀} = P_{0,(2,1)} + P_{1,(3,0)}` | holds | none |
| 6.2 | `f = 1`; `f = 3` | `3f + 4 − 2f = f + 4`: 2 components of dimension 5; 8 of dimension 7 | holds | none |
| 6.3 | chart 1, both profiles; chart 2 | `(2,1)`: `c₁₂ = 0`, `m_j = 0`; `(3,0)`: `c₁₂d₂₁ = 0`, `m_j = 1`; chart 2: `d₁₁d₂₂ = 0` for both; variables `3f + m + 4 − 2f = f + 4 + m` | holds | none |
| 7.1 | substitutions against Figure 2; Table 1 generator 1 | `d₁₁ + (a₁−2)c₁₂d₂₁/d₂₂* ↦ c₁₂ − pd₁₂* + (a₁−2)d₁₁d₂₂/d₂₁*`, the Table 4 generator; `(z d₁₁ + c₁₁)/v = d₁₁` exactly when `c₁₁ + p d₁₁ = 0` | matches | none |
| 7.3 | pair of types at one embedding | difference `p(a₂−1)d₁₂* + (a₁+a₂−2)d₁₁d₂₂/d₂₁*`; `p k_j ≤ k_{j−1} + r_j + 3 < k_{j−1} + p − 1` gives `max k_j < 1` | holds | none |
| 7.4 | `p = 5`, units `1` | `Q₁` at `(0,0,5,0,0,0,25)`: `25 − 25`, `5 − 5`; `Q₂` at `(0,1,0,0,0,−5,0)`: `−5 + 5`; `Q₃` at `(0,0,0,5,0,0,25)` | all vanish | none |
| 7.5 | elimination | `t + p = (1−κ)p = 2p/(a₂(a₂−1))`; coefficients `2p/a₂` (Table 4) and `2p/(a₂−1)` (Table 5); modulo `Q₂ + P`: `p = 0`, quotient `(𝒪/p)⟦…⟧/(d₁₁d₂₂)`, where `ϖ ≠ 0` if `e ≥ 2` | holds; `p` not `ϖ` | none |
| gaps | plan against README | 9 slugs, 9 equal `needs` strings | agree | none |

**Shape and style.** Every definition has its API and at least three Checks; every theorem a locator; every layer ends with Examples and Dependencies. A scan of the README and the Lean file found no LaTeX delimiter, pull-request number, date, machine path, HTML anchor or process word; `theorem` only; one module docstring; no `#eval`, no `set_option`.

## Not verifiable

- Kisin06, Corollary 1.3.15: recorded `uncertified`; cited behind BHHMS23 Proposition 3.1.7, which states the result used.
- LLHLM18, LLHL19 and LLHLM23 were read in their arXiv versions; the numbering was compared with the published versions only through BHHMS23's citations.
- Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-13 and in the board's packages; nothing newer was looked at.

## Source issues

- **Gap** in BHHMS23 at Lemma 4.2.3, printed page 31: the Jacobian bound for the two outer tables is stated in the polynomial ring; it should invert the starred coordinate, since the last generator carries it as a factor; affects the proof.
- **Gap** in BHHMS23 at the proof of Proposition 4.2.1, printed pages 28–29: Proposition 3.1.9 is applied to a complete local ring, though §3.1.2 assumes algebras topologically of finite type; it should state the complete local case or reduce to it; affects the proof.
- **Gap** in BHHMS23 at Proposition 3.2.7, printed page 23: the proof splits every semisimple representation with the given inertia along the orbits; it should assume the residue field large enough, since two equal inertial characters allow a non-split irreducible; affects a stated result.
- **Misprint** in BHHMS23 at the final note of Table 5, printed page 45: the note says the tails come from Tables 1–2; it should say Tables 2–3, the charts of the two shapes of that table; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f23a98b31fef968ebca1cccc3b9c7133706e11ca", "job": "REV-PKG-LocalGaloisDeformationRingsPartII~6", "model": "fable", "worker": "chris-x13"} -->
