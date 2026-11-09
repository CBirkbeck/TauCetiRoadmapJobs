# Review of FunctionFieldArithmetic (pull request #1474 at 297522c)

**Verdict:** needs changes

This is a full review. Since 8c93181 the folder changed by 275 lines (`README.md` 204, `Suggested.lean` 71). All six findings of the previous review are repaired (table under *Previous findings*).

On this head:
- the gate passes and the dependency check reports no problem;
- `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else;
- the one-tactic probe closes none of the 14 theorems;
- the 15 sampled targets agree with their sources at the stated locators, and no mathematical defect was found.

Two findings remain, both P3:
- **R01.** The `### Dependencies` blocks of Layers 0, 2, 5 and 7 omit the pinned declarations that their targets' *Needs* lines name.
- **R02.** The pull-request description names a consumer roadmap that exists nowhere.

## R01 (P3) — Four layer `### Dependencies` blocks omit the pinned declarations their *Needs* lines name

**Location.** `TauCetiRoadmap/FunctionFieldArithmetic/README.md`:
- Layer 2, lines 1020–1022: "… AlgebraicCurves Layers 4 and 5; Tau Ceti `degree_weilDifferentialDivisor`."
- Layer 5, lines 2461–2463: roadmap sections only.
- Layer 7, lines 3475–3480: roadmap sections only.
- Layer 0, lines 738–740: roadmap sections only.

**Claim.** Each block reads as the complete layer-level prerequisite list. Layers 1, 4 and 6 do list their pinned declarations there (lines 859, 2016–2028, 2854–2855). These four do not, so the README disagrees with itself about what each layer needs. The Layer 2 block names exactly one Tau Ceti declaration out of eleven.

**Witness.**
- §2.1 *Needs*, lines 907–910: `riemannRochSpace`, `repartitionSpace`, `adeleFiltration`, `diagonalRepartitions`, `finrank_quotient_repartitionSpace`, `Divisor.indexOfSpecialty`, `repartitionToFiniteAdeles`, `denseRange_repartitionToFiniteAdeles`, `adeleFiltrationQuotientEquiv`, `Place.finrank_quotient_filtration`.
- §5.8 *Needs*, lines 2422–2425: six `Place.*` declarations, `genus`, and Mathlib `IsArithFrobAt`, `ValuationSubring.decompositionSubgroup`, `algebraicClosure`. Also §5.1 (line 2078) and §5.2 (line 2113).
- §7.1 *Needs*, lines 2914–2916: `Divisor.conorm`, `Divisor.conorm_principal`, `Divisor.conormClassGroup`.
- §0.1 (line 654) and §0.3 (line 721).

**Repair.** Append to each block the declarations its *Needs* lines already name:
1. Layer 0: "Tau Ceti `Divisor.degree`, `Divisor.degree_principal`, `Place.ordAddMonoidHom`, `Divisor.degreeClass`, `Divisor.finite_ker_degreeClass`, `Divisor.classNumber`."
2. Layer 2: replace "Tau Ceti `degree_weilDifferentialDivisor`" by "Tau Ceti `degree_weilDifferentialDivisor`, `riemannRochSpace` and the repartition declarations listed in §2.1's *Needs*".
3. Layer 5: "Tau Ceti `Divisor.finite_setOf_isEffective_degree_le`, `Place.degree`, `Place.one_le_degree_of_isFunctionField`, `Divisor.classNumber`, `Divisor.finite_ker_degreeClass`, `genus` and the place-extension declarations listed in §5.8's *Needs*; Mathlib `IsArithFrobAt`, `ValuationSubring.decompositionSubgroup`, `algebraicClosure`."
4. Layer 7: "Tau Ceti `Divisor.conorm`, `Divisor.conorm_principal`, `Divisor.conormClassGroup`."

**Test.** After the edit, every pinned name in the *Needs* lines at 907–910 appears in, or is referred to by, the Layer 2 block; the same holds for lines 2422–2425 against Layer 5 and 2914–2916 against Layer 7. All of these names exist at the pin (table under *Pinned declarations opened*).

## R02 (P3) — The pull-request description names a consumer that exists nowhere

**Location.** Pull-request description, summary block, paragraph *Why Tau Ceti wants it*: "the zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, FiniteFieldsAndCharacterSums and GlobalGaloisDeformationsPartII."

**Claim.** No roadmap is called FiniteFieldsAndCharacterSums: not on main, not in the merge order, not on the board, not in an open pull request.

**Witness.** The roadmap meant is CharacterSumsOverFiniteFields. Its README at its open head cites this roadmap at line 91 ("Artin–Schreier covers are `FunctionFieldArithmetic`'s (Layer 5)") and line 223 (the root bound of §5.4). The README's own *Downstream consumers* does not use the wrong name.

**Repair.** In the description, replace "FiniteFieldsAndCharacterSums" by "CharacterSumsOverFiniteFields". No change to the folder is needed.

**Test.** `roadmaps grep --fixed FiniteFieldsAndCharacterSums` returns nothing; `roadmaps list` shows CharacterSumsOverFiniteFields as an open new roadmap.

## Previous findings

| Previous | Status at 297522c | Passage |
| --- | --- | --- |
| R01 (P2): §5.8 restated ArithmeticGaloisRepresentations §5.13's count and vanishing | Repaired | Lines 2351–2355: "is ArithmeticGaloisRepresentations §5.13's `π_B(r)` for the cover attached to `M/F` … that section also proves that it vanishes unless the image of `C` … is `Frob_q^r`". The target frobeniusPlaceCount_constant_congruence is gone (no match in the README). §5.13 at its head (line 3888) defines `π_B(n)` and proves the vanishing |
| R02 (P2): §5.8's bound statable but absent; §7.1 docstring reason wrong | Repaired | `Suggested.lean` lines 323–360 add `IsArithFrobAtPlace`, `frobeniusPlaceCount`, `degree_sensitive_chebotarev`. Module docstring lines 17–19 and 36–39: "the degree-sensitive Chebotarev estimate … [is] statable below"; "need the idele class group of a function field (the divisor pullback is the pinned `TauCeti.Divisor.conorm`)" |
| R03 (P3): §2.1 attributed pinned repartition results to AlgebraicCurves only | Repaired | Lines 283–297 list the repartition declarations with files; lines 881–885 and 894–903 cite them; *Needs* at 907–910 |
| R04 (P3): two locators did not support their statements | Repaired | (a) Line 718 ends "by 0.2 and `picardComponent_point_iff`."; the Milne A.7 parenthetical is gone. (b) Lines 2314–2317: "(3.1) for the definition … over a coefficient field, (3.2) … for everywhere-unramified `ρ`. The ramified, finite-ring identity rests on Stacks Tag 03UZ" |
| R05 (P3): §2.3 Check false without `c ∉ A(D′)` | Repaired | Lines 999–1004: "For `|k| > 2`, `c ∉ A(D′)` and `λ ∈ kˣ ∖ {1}` … so the hypothesis `c ∉ A(D′)` is needed." |
| R06 (P3): titles and layer labels | Repaired | Lines 126–129 quote the four SchemeAndStackFoundations headings exactly (main lines 3896, 4713, 4905, 7273); line 112 "§3.7 *Computations and Artin–Schreier characters*"; line 627 "Layers 0, 1, 2, 3 and 5"; `Suggested.lean` lines 64, 170, 210, 283 carry the README titles |

## Verified sound

### Gate, dependencies and scope

The head is `297522c7e3c3edf343a6596728b0f99d6815d01b`. The diff outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

Gate rerun:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. This roadmap is at line 356 of the merge order; ArithmeticGaloisRepresentations is at 58 and LubinTateFormalModulesAndQuasiCanonicalLifts at 345.

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean`: 14 `sorry` warnings, nothing else.
- **Signatures.** I compared the elaborated types of all 23 declarations with their README statements, and re-elaborated ten with `#check @` in a scratch copy. They match. For the three new ones: `IsArithFrobAtPlace` and `frobeniusPlaceCount` carry `[IsScalarTower k F M]` and `[FiniteDimensional F M]` in their own signatures; `degree_sensitive_chebotarev` carries `[Finite k]`, `[IsGalois F M]`, `hF`, `hk`, `hM`, `0 < r` and the compatibility hypothesis. The quotient `|C|/|N|` is a division in `ℝ` of two casts, not a natural-number division.
- **Padding probe.** Each `sorry` replaced by `first | (rfl; done) | (simp; done) | (simp_all; done) | (infer_instance; done) | (trivial; done) | (norm_num; done) | (decide; done) | (aesop; done) | sorry`: all 14 theorems still report `sorry`.
- **Headlines.** The Summary's end theorems are §§5.3, 4.2, 4.10, 6.4–6.5 and 7.6. §5.3 and §4.2 are stated. §4.10, §§6.4–6.5 and §7.6 are named in the module docstring with the carrier each lacks; the pins have no generalized Picard schemes, adelic automorphic modules or Hermitian densities.
- **Form.** One module docstring; one `import Mathlib` and four `TauCeti.*` modules, each used; no `set_option`; `theorem` throughout; a docstring on every declaration.
- **Notes, not findings.** `hk` is not needed by `zeta_eulerProduct` or `zeta_logDeriv`, and `hM` follows from `hF` and finiteness of `M/F`; both match the layer's standing hypotheses.

### Pinned declarations opened

All in Tau Ceti under `TauCeti/FieldTheory/FunctionField/` unless noted.

| File:line | Content checked |
| --- | --- |
| `Repartition/Basic.lean:122, 178, 308` | `repartitionSpace`; `adeleFiltration` by `P.valuation (a P) ≤ exp (D.coeff P)`, so `0` is always a member; `diagonalRepartitions` |
| `Repartition/IndexOfSpecialty.lean:199` | `finrank_quotient_repartitionSpace (hex : IsIntegrallyClosedIn k F)`: the quotient dimension equals `Divisor.indexOfSpecialty D` |
| `RiemannRoch/Genus.lean:340` | `Divisor.indexOfSpecialty`, documented as `ℓ(D) − deg D − 1 + g` |
| `Repartition/FiniteAdele.lean:53, 178`; `Repartition/Quotient.lean:193`; `Place/Filtration.lean:366` | `repartitionToFiniteAdeles`, its dense range; `adeleFiltrationQuotientEquiv` for divisors agreeing off `P`; `finrank_quotient_filtration` for `a ≤ b`, value `(b − a) · deg P` |
| `Place/Extension/Basic.lean:337, 510` | `ramificationIdx`; `instAlgebraIntegers : Algebra (P'.restrict k F).integers P'.integers` |
| `Place/Extension/Inertia.lean:143, 164, 171, 182, 278` | `instSMulCommClassIntegers`; `residueAut`; `residueAut_residue`; `ker_residueAut` (kernel is the inertia subgroup); `residueAut_surjective` under `[FiniteDimensional] [IsGalois]` |
| `Divisor/Conorm.lean:136, 413, 455` | `conorm` (integral extension, finite restriction fibres); `conorm_principal`; `conormClassGroup` |
| `Divisor/Principal.lean:248`; `Divisor/ProductFormula.lean:303`; `RiemannRoch/ClassNumber.lean:143`; `Differential/CanonicalDivisor.lean:432`; `Place/Degree.lean:243`; `Place/Basic.lean:196`; `ArtinSchreier/Genus.lean:350`; `Place/Expansion/CoefficientField.lean:317` | `Divisor.poles`, `degreeClass`, `finite_ker_degreeClass`, `degree_weilDifferentialDivisor`, `one_le_degree_of_isFunctionField`, `ordAddMonoidHom`, the Artin–Schreier genus theorem, the filtration lemma of §4.5 |
| Mathlib `RingTheory/Frobenius.lean:55, 184`; `RingTheory/Valuation/RamificationGroup.lean:39` | `AlgHom.IsArithFrobAt φ Q := ∀ x, φ x − x ^ Nat.card (R ⧸ Q.under R) ∈ Q`; the monoid-action form `IsArithFrobAt`; `decompositionSubgroupMulSemiringAction` |

Duplication by object: Loogle and LeanSearch leads for all 23 declarations give no pinned statement of a function-field zeta series, `L`-polynomial predicate, ASW quotient, or Chebotarev estimate. The one same-name hit, `ArithmeticFunction.zeta`, is a different object.

### Cross-roadmap citations resolved

| Citation | Where | Result |
| --- | --- | --- |
| ArithmeticGaloisRepresentations §§1.8, 2.5, 3.7, 5.13 | open head, lines 1227, 2082, 3064, 3829 | Exist. §5.13 lines 3840–3841: its groups "agree in finite Galois quotients with the valuation-theoretic groups", the input of §5.8's third API bullet. Lines 3884–3890: `π_B(n)`, vanishing for `n ≢ b mod a`, main coefficient `#B/#H_geom` |
| ArithmeticGaloisDuality §R02.3.2 and its two named paragraphs | open head, lines 2075, 2077, 2246 | Exist |
| AutomorphicLFunctionsAndLocalFactors AL.0.1.7, AL.0.1.8, AL.0.3.1, AL.0.6.1, AL.R.3, AL.3.4.1, AL.3.4.2, AL.3.10.2–4, AL.3.14.1 | open head, lines 370, 386, 484, 580, 616, 1633, 1654, 1925, 1931, 1941, 2212 | Exist, with the quoted titles |
| DeligneWeightsAndPurity §§1.6, 1.9, 3.7; WeilConjectures WC.1, §§1.16, 5.20 | open heads, lines 990, 1026, 1263; 605, 1081 | Exist |
| RelativeJacobiansAndIntegralCurveModels §§1.3–1.5; SmoothRepresentationsOfLocalGroups SR.2.1–2.3, SR.4.1, SR.4.4 | open heads, lines 300, 331, 358; 1917, 3192, 3460 | Exist |
| AdelicAlgebraicGroups Layers 0 and 1; GeometryOfNumbersAndQuadraticArithmetic §§3.1–3.2 with its three named declarations | open heads, lines 634, 997; 844, 880, 857, 868, 872 | Exist; Layer 1 is for number fields |
| AutomorphicSpectralTheory §§1.11–1.13, 2.15–2.16, 4.11–4.17; MetaplecticAutomorphicForms §§2.5, 3.2a, 3.3, 3.3b | open heads | All headings exist |
| SchemeAndStackFoundations §§1.1, 2.11, 2.16, 3.3, 3.6, 3.7, 5.11; ReductiveGroupsPartII RG2.0, RG2.0a | main | Exist |
| LubinTateFormalModulesAndQuasiCanonicalLifts §§0.1–0.2, 1.1–1.4, 2.1–2.5 | board package | Headings exist; Layer 1 is over every discrete valuation ring with finite residue field. This is the one lead of the citation check: the package has no pull request yet, and is at line 345 of the merge order |

Ownership against open pull requests, by object (`roadmaps grep` on nine object names): CurvesOverFiniteFields consumes §5.6's predicate; HigherLocalClassFieldTheory and FieldOfNorms consume §§3.1 and 4.3; none states these objects again. No second owner was found. The overlap report lists no dropped id and no pull request that changes this roadmap.

### Seeded sample (15 targets)

| Target | Locator checked | Outcome |
| --- | --- | --- |
| 0.1 | yu lines 366–373 (§2.2.1, p. 8); line 569 (§2.3.4, p. 12) | Match: `deg g = −Σ [κ(x):𝔽_q] x(g_x)`; `|g| = q^(deg det g)` |
| 2.1 | parshin lines 290–292 ((5)–(6), p. 7); 363–382 (p. 9); 415–421 (p. 10) | Match: `K_x(D) = {ν_x(a_x) + n_x ≥ 0}`; annihilator `A((ω) − D)`; `μ(A(D)) = q^(1−g+deg D)` |
| 3.2 | kw lines 720–736 (Prop. 4.3, p. 15); 1169–1180 (Lemma 4.13, p. 22) | Match, parts i–iii and the `n_c`, `n₀` statement |
| 3.3 | kw lines 280–300 (Thm 3.2, pp. 6–7); 722–733 | Match |
| 4.7 | guignard lines 794–824 (Props 4.11–4.12, pp. 1319–1320); 830–864 (Prop. 4.14, pp. 1320–1321); russell lines 1654–1684 (§3.3, Thm 3.24, p. 34) | Match: `d ≥ N + 2g − 1`, torsor under a bundle of rank `d − N − g + 1`, surjective smooth with geometrically connected fibres. Russell assumes `k` algebraically closed; the README takes from him only the congruence form `f ≡ 1 mod D` |
| 4.8 | conrad_geom lines 41–117 (§2, pp. 1–3; section bounds located), 157–171 (Thm 3.2, p. 4, read); guignard lines 737–749 (§4.7, pp. 1317–1318, read) | Match: rigidification `α : O_Y → i^*L`, the README's direction; dimension `N + g − 1` |
| 4.10 | conrad_geom lines 157–171; milne lines 5026, 5048 (A.8–A.9, pp. 132–133), 5072, 5107, 5152 (A.10–A.12, pp. 134–136) | Match: least modulus `f_π`; geometric connectedness criterion; `C_K/NC_F ≅ G_{F/K}` |
| 5.3 | roquette §4.3.3, pp. 26–28 | Not readable (*Not verifiable*); the statement is recomputed in the table |
| 5.4 | No external locator; WeilConjectures WC.1, §1.16 and DeligneWeightsAndPurity §1.6 resolved above | Sound |
| 6.4 | morris1 lines 421–443 (§§4.1–4.3, p. 101), 444–504 (§§4.4–4.7, pp. 101–103), 529–610 (§§5.3–5.6, pp. 104–106); harder lines 211–295 (§1.2, Thm 1.2.1, Lemma 1.2.2, Cor. 1.2.3, pp. 254–256) | Match. §4.4 opens on the last two lines of p. 101; its theorem is on p. 102 |
| 6.5 | ciubotaru_harris lines 370–396 (Prop. 3.1, p. 8), 412–415 (Lemma 3.2, p. 9); bhkt lines 1593–1599 (Prop. 8.2, p. 35) | Match, for semisimple `G`; the README says so and rests the reductive case on Morris §5.3 |
| 6.7 | yu lines 1934–1935 (Lemma 5.3.3, p. 36), 1943–1998 (p. 37), 2000–2033 (p. 38) | Match; both source corrections confirmed |
| 7.4 | fyz lines 453–479 (§2.3, p. 10), 481–529 (Def. 2.2, Thm 2.3, pp. 10–11), 530–580 (proof, pp. 11–12), 582–603 (Remarks 2.4–2.6, pp. 12–13); li_zhang line 688 (Thm 3.5.1, p. 17) | Match, including the embedding count (2.7) |
| 7.5 | fyz lines 605–627 (§2.5, Lemma 2.7, p. 13); kudla_rapoport line 1719 (Prop. 10.1, p. 37) | Match: `W_{Tθ}(1, s, Φ) = L_n(s)⁻¹ Den(q^(−2s), L)`; reduction to `s = j` with source rank `n + 2j` |
| 7.6 | fyz lines 628–678 (§2.6, (2.9)–(2.12), Thm 2.8, pp. 13–14), 679–710 (proof, pp. 14–15) | Match: (2.12) is the README formula; `|det α|_{F′} = q^(deg 𝓔)` |

Also re-read for §5.7 and §5.8: stacks lines 1138–1153 and 1204–1209 (Theorem 20.1, Remark 20.3, Theorem 20.4, as cited); kosters lines 47–85.

### Adversarial table (values computed this round)

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 degrees and reciprocity | uniformizer idele at `v`; `r = d_v = 2`; `r = 3, d_v = 2` | `deg = d_v`, `deg_Yu = −d_v`; `gcd = 2` factors of degree 1, `φ² = 1`; one factor of degree 3, `φ²` of order 3; local degrees sum to `r` | Pass | None |
| `exists_divisor_degree_eq_one` (0.2) | `𝔽_q(t)`; real conic | `deg ∞ = 1`; over `ℝ` every degree is even, so finiteness is needed | Pass | None |
| 2.1 lattices | `𝔽_q(t)`, `W = −2∞`, `D = −∞, −2∞`; `f·A(D)`; degree-2 place | `i = ℓ(−∞) = 0`, `ℓ(0) = 1`; `ord(f a_v) ≥ −(D − div f)_v`; index `q²`. Pinned `indexOfSpecialty` gives the same `1` | Pass | R01 |
| `riemannRoch_reducedBasis` (1.2) | `y² = x³+x+1`, `D = 0`; `x = t^p` | `d = (0, −2)`: `r` gives `(r+1) + (r−1) = 2r = ℓ(2rO)`. `d = (0, −1, …, −1)`, sum `1 − p = 0 + 1 − p` | Pass | None |
| `witt_additiveHilbert90`, ASW checks | `y^p − y = a`; `p = 2, n = 2`; `[t]` over `𝔽₂(t)` | `Σ_i (y+i)^(p−1) = −1`, so `Tr(−y^(p−1)) = 1`; `(y,0)+(y+1,0) = (1, y²+y) = (1, t)`; `℘[t] = (t²+t, t²+t³)` using `−[t] = (t, t²)` | Pass | None |
| 3.2 reduced forms | `[T^(−p)]`; `[1+T]`, `k = 𝔽_{p^p}` | `Frob[T⁻¹] = [T^(−p)]`; coordinates of `[1+T] − [1]` vanish at `T = 0`; `c = p/Tr(β) ∈ pℤ_p` | Pass | None |
| 3.3 one-pole | `y³ − y = t⁻²/𝔽₃`; `p = 2, m = 1` | Different 6, `2g − 2 = 0`; `N₁ = 1+0+0+3 = 4`; `L = 1+3T²`; `N₂ = 10 − (0 − 6) = 16`. `2g − 2 = −4 + 2 = −2` | Pass | None |
| `localAbelianExistence_all`, `injective_artinMap_all` (4.2) | `𝔽_p((T))`, `H = ⟨𝔽_pˣ, T, 1+T²O⟩`; `1 + T` | Index `#(U¹/U²) = p`; `[T⁻¹, 1 − aT) = −a` at `a = −1` gives `1 ≠ 0`, so `1 + T` is not a norm | Pass | None |
| 4.4 conductor | `𝔽₃`, `[T⁻²]`, `n = 1, 2`; `3[T⁻²]` | `1+2 = 3`; `1+2·3 = 7`; `1+2·3⁰ = 3` | Pass | None |
| 4.7 Abel bundle | `ℙ¹`, `m = 2[∞]`, `n = 1, 2`; elliptic, `m = [P]`, `n = 1, 2`; `g = 0, N = 1, n = 0` | Ranks `0, 1`; `E − P → E` misses `P` at `n = 1`, fibre `ℙ¹` minus a point at `n = 2`, rank `1`; rank `0` at the bound `n = 0`. `deg L(−m) ≥ 2g − 1` gives `H¹ = 0` | Pass | None |
| 4.8 coordinates | `m = [0]+[∞]` over `𝔽₅`, `λ = 2`; `m = 2[∞]`, `1+bT` | `λ⁻¹ = 3`; rigidification `1 − bT`, coordinate `b` | Pass | None |
| 4.10 classification (headline) | `B = ℤ/4`, `θ = 2·deg`; surjective `θ` | Image of index 2: two components, each a constant quadratic cover; constants `𝔽_{q^c}`, `c = [B : θ(C_m⁰)]` | Pass | None |
| `zeta_eulerProduct`, `zeta_logDeriv`, `effectiveDivisorCount_of_large` | `ℙ¹` | `placeCount 2 = (q²−q)/2`, `N₂ = q²+1`, `A₂ = q²+q+1`; `2A₂ = N₁A₁ + N₂A₀ = (q+1)² + q²+1`; `(q−1)A_n = q^(n+1) − 1` | Pass | None |
| `zeta_rationality` (5.3, headline) | `E/𝔽₅`, `N₁ = 9`; `g = 0` | `L = 1+3T+5T²`: `a₂ = 5a₀`, `a₁ = 9 − 6`, `L(1) = 9 = h`. `g = 0`: `P = 1`, `a₁ = 0 = N₁ − (q+1)`, degree 0 | Pass | None |
| 5.4 comparison | `E/𝔽₅`; reversed versus not | Discriminant `9 − 20 < 0`, roots of modulus `√5`; the non-reversed polynomial has constant term `5` | Pass | None |
| `isLPolynomialData_iff_eq_lPolynomial` | `q = 5, g = 1, N₁ = 9`; `q = 0, 1` | Accepts `1+3T+5T²`; rejects `1+2T+5T²` and `1+3T+T²`; junk `q` gives `1+8T`, `1+7T+T²` | Pass | None |
| `degree_sensitive_chebotarev` (5.8) | `M = F = 𝔽_q(t)`, `r = 2, 3`; `M = F𝔽_{q²}`, `C = {1}`, `r = 2`; `M = F𝔽_{q³}`, `C = {σ₁}`, `r = 1`; `M = F(√t)`, `r = 1`; elliptic `M = F`, `r = 1` | `q+1 ≤ 2q+2`; `q+1 ≤ 3q^(3/2)+3`; `|q²−q−(q²+1)| ≤ 2q+2`; left `0`, and `q+1 > √q+1` under the geometric convention; `|(q−1)/2 − (q+1)/2| = 1 ≤ √q+3`; `2√q ≤ 5√q+1`. Deduction: `|C| ≤ |N|` (one coset of `N`); proper divisors `e ≤ r/2`, fewer than `r` of them | Pass | R01 |
| 6.4 reduction, finiteness, base change | `GL₂`, `diag(π^a, 1)`; `𝔾_m`, `deg a = 1`; `2x = 0` over `ℤ[1/3] → 𝔽₂` | `⟨α, H₀⟩ = log_q q^(−a) = −a`; `C_K/(UΞ) ≅ Cl⁰`, rank `h`; kernel `0` becomes `𝔽₂`. The support argument uses only `f(t) = CT f(t)`, valid over any ring with `p` invertible | Pass | None |
| 6.5 integral model | `R ⊂ C` | `R` is a domain, `R → Frac R → C` flat; Hecke characteristic polynomials over `ℚ` | Pass | None |
| 6.7 Yu | general `n`, `g`; `n = 2, g = 2` | `ord det t_v = −n_v n(n−1)/2`, valuation degree `−n(n−1)(g−1)`, Yu degree `+n(n−1)(g−1)`; scalar `a^(−(n−1)(g−1))` contributes `−n(n−1)(g−1)`; sum `0`. `2 − 2 = 0`, against `2 + 2 = 4` with Yu's sign | Pass | None |
| 7.1 criterion | constant quadratic cover, `d` odd and even | `d` odd: one point of `𝔽_{q²}`-degree `d`, `χ = −1 = η`; `d` even: two of degree `d/2`, `χ = 1`. Extension from `ν^*Pic(X)` exists since `ℂˣ` is divisible | Pass | R01 |
| 7.4 densities | split `(O, π^rO)`; inert `π^r x ȳ`, `r = 1, 2`; `𝔽₄²` linking form | `L′ = (π^(−a)O, π^(r−c)O)`, `a + c ≤ r`: `Σ_{e<r}(e+1)T^e(1−T) + (r+1)T^r = Σ_{i≤r} T^i`. Inert: `1−T`, `1−T+T²`. 9 isotropic vectors, 3 lines: `(1−T)(1+2T)+3T² = 1+T+T² = T²(1+T⁻¹+T⁻²)`. Functional equation holds in each case | Pass | None |
| 7.5 Whittaker = density | `n = m = 1`, `q = 3`; `s = j` | Split `2·3^(N−1)/3^N = 2/3 = 1 − 3⁻¹`; inert `4·3^(N−1)/3^N = 4/3 = 1 + 3⁻¹`. `∏(1 − η^i q^(−i−2j))` on both sides, since `η^(−i−2j) = η^i`. Section values `q^(−1/2)`, `q^(−3/2)`; inert `q⁻¹`, `q⁻³` | Pass | None |
| 7.6 FYZ (headline) | `n = 1`, `ℙ¹`, split, self-dual; constant cover | Exponent `−deg𝓔(s − ½) + 1`; `L₁⁻¹ = ∏(1 − q_v^(−1−2s))`; `Den = 1`. `q^(−n²(g−1)) = q^(−n² deg ω_X/2)`; `deg ω_{X′} = 2 deg ω_X` | Pass | None |

## Not verifiable

- **roquette** (§4.3.3, pp. 26–28, cited in the sampled §5.3): recorded as waived; the text is not in the cache. The statement of §5.3 was recomputed instead (table).
- **rosen**, **goss**, **stichtenoth**, **hess**, **sga4half**: settled as uncertified, and not in this sample.
- Harder §1.1 (pp. 252–253) was not read line by line; §1.2 was.
- No source was fetched, and no missing-reference request was made.

## Source issues

- **Misprint** in yu at Lemme 5.3.3, p. 36 (yu lines 1934–1935): the source asserts the nonvanishing for every vector of the representation; it should exclude the zero vector, as its proof does on p. 38; affects nothing.
- **Error** in yu at the proof of Lemme 5.3.3, p. 38 (yu lines 2024–2033): the source gives the diagonal element degree `−n(n−1)(g−1)` and corrects by the scalar power `(n−1)(g−1)`; with its own §2.2.1 sign the degree is `+n(n−1)(g−1)` and the power is `−(n−1)(g−1)`; affects the proof.
- **Misprint** in parshin at §2.2, p. 9 (parshin lines 367–373): the source writes the adelic pairing as a sum of circle values; it should be their product, the character of the summed traced residues; affects nothing.
- **Error** in parshin at §2.2, p. 9 (parshin line 375): the source takes the additive character of the constant field to be injective; it should be nontrivial only, since no character is injective when `q` is not prime; affects nothing.
- **Error** in parshin at §2.1, p. 7, and §2.3, p. 10 (parshin lines 298–299, 439–441): the source says the indicators of divisor lattices span the test functions; it should say the indicators of their translates do; affects the proof.
- **Misprint** in kosters at Corollary 1.2, p. 2 (kosters line 84): the source sums the Frobenius weights over all places; it should sum over the rational places only, as Theorem 1.1 and the proof use; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 296): the source invokes "Theorem 3.1" for Hilbert 90; it should be Proposition 3.1; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 299): the source writes the Frobenius of `α + 1` minus `α + 1` with a wrong sign pattern; since `σα = α − 1` it should use `α − 1` throughout; affects nothing.
- **Misprint** in fyz at §2.4, p. 11, and Remark 2.5, p. 12 (fyz lines 505, 594–595): the source forms quotients and chains mixing the first lattice with the dual of the second, against its definition of the dual on p. 10; it should pair each lattice with its own dual; affects nothing.
