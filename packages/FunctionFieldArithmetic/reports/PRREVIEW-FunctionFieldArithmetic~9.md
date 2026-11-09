# Review of FunctionFieldArithmetic (pull request #1474 at f26248c)

**Verdict:** needs changes

This is an incremental re-review of the 47 lines changed since 297522c (all in `TauCetiRoadmap/FunctionFieldArithmetic/README.md`; `Suggested.lean` is unchanged). The change edits all eight `### Dependencies` blocks and nothing else: no statement, Check, locator or Lean declaration is touched.

On this head:
- the gate passes and the dependency check reports no problem;
- `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else;
- the previous R01 is repaired, and the repair introduces no new problem;
- the previous R02 (the pull-request description) is not repaired. It is the only finding, and it needs no change to the folder.

## R01 (P3) — The pull-request description still names a consumer that exists nowhere

Carried from the previous review's R02.

**Location.** Pull-request description, summary block, paragraph *Why Tau Ceti wants it*: "the zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, FiniteFieldsAndCharacterSums and GlobalGaloisDeformationsPartII."

**Claim.** No roadmap is called FiniteFieldsAndCharacterSums: not on main, not in the merge order, not in an open pull request.

**Witness.** `roadmaps grep --fixed FiniteFieldsAndCharacterSums` returns "no match on main or in any open roadmap pull request". The roadmap meant is CharacterSumsOverFiniteFields, an open new roadmap, which cites this roadmap's Layer 5. The README's own *Downstream consumers* uses the right name.

**Repair.** In the description, replace "FiniteFieldsAndCharacterSums" by "CharacterSumsOverFiniteFields". No change to the folder is needed.

**Test.** After the edit, `roadmaps grep --fixed FiniteFieldsAndCharacterSums` still returns nothing and the description names only roadmaps that `roadmaps list` or main shows.

## Previous findings

- R01 — repaired: the blocks of Layers 0, 2, 5 and 7 (README lines 738–742, 1023–1028, 2478–2485, 3499–3505) now list the pinned Tau Ceti and Mathlib declarations that their targets' *Needs* lines name.
- R02 — not repaired: the description still reads "the zeta functions serve CountingBundlesAndHallAlgebrasOfCurves, FiniteFieldsAndCharacterSums and GlobalGaloisDeformationsPartII." Written again as R01 above.

## Verified sound

### The changed passages

The diff changes the `### Dependencies` blocks of Layers 0, 1, 2, 3, 4, 5, 6 and 7 (Layers 1, 3, 4 and 6 beyond what the previous R01 asked). I checked each in two ways.

**Against the layer's own *Needs* lines.** For every layer I collected the backticked names in all its *Needs* lines and compared them with the names in its `### Dependencies` block:

| Layer | Pinned names in *Needs* lines missing from the block | Names in the block that no *Needs* line has |
| --- | --- | --- |
| 0 | none | none |
| 1 | none | `genus` (untouched text; §1.2's statement uses the genus) |
| 2 | none (all ten of §2.1's names are now listed, plus `degree_weilDifferentialDivisor`) | none |
| 3 | none | none |
| 4 | none | none |
| 5 | none (the `detLine` names are PadicMeasuresIwasawaAlgebras §5.1's, and the block cites that section) | none |
| 6 | none (the four `TauCeti.PointTopology` names are covered by the block's reference to §6.1's *Needs* line, which lists them at lines 2542–2544) | none |
| 7 | none | none |

**Against the pins** (Tau Ceti `2fd255d9`, the manifest's Mathlib). Every name the diff adds exists, in the namespace the README gives:

| Declaration | File:line at the pin |
| --- | --- |
| `Divisor.degree`; `Divisor.degree_principal` (`degree (principal hF z) = 0`); `Divisor.degreeClass` | `TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean:51`; `Divisor/ProductFormula.lean:255, 303` |
| `Place.ordAddMonoidHom`; `Place.degree`; `Place.one_le_degree_of_isFunctionField` | `Place/Basic.lean:196, 555`; `Place/Degree.lean:243` |
| `Divisor.finite_setOf_isEffective_degree_le`, `Divisor.finite_ker_degreeClass` (both under `[Finite k]`); `Divisor.classNumber := Nat.card (degreeClass hF).ker` | `RiemannRoch/ClassNumber.lean:82, 143, 203` |
| `riemannRochSpace`; `genus`; `Divisor.indexOfSpecialty` | `RiemannRoch/Basic.lean:92`; `RiemannRoch/Genus.lean:193, 340` |
| `repartitionSpace`, `adeleFiltration`, `diagonalRepartitions`; `finrank_quotient_repartitionSpace`; `repartitionToFiniteAdeles`, `denseRange_repartitionToFiniteAdeles`; `adeleFiltrationQuotientEquiv`; `Place.finrank_quotient_filtration` | `Repartition/Basic.lean:122, 178, 308`; `Repartition/IndexOfSpecialty.lean:199`; `Repartition/FiniteAdele.lean:53, 178`; `Repartition/Quotient.lean:193`; `Place/Filtration.lean:366` |
| `Place.restrict`, `Place.ramificationIdx`; `Place.residueAut`, `residueAut_residue`, `ker_residueAut`, `residueAut_surjective` | `Place/Extension/Basic.lean:322, 337`; `Place/Extension/Inertia.lean:164, 171, 182, 278` |
| `Divisor.conorm`, `conorm_principal`, `conormClassGroup` | `Divisor/Conorm.lean:136, 413, 455` |
| `TauCeti.Place.completionIntegersEquivPowerSeriesOfSection` (onto `PowerSeries P.ResidueField`) | `Place/Expansion/CoefficientField.lean:252` |
| `TauCeti.LocalFieldsRamification.lowerRamificationGroup`; `herbrand`, `upperRamificationGroup` | `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:99`; `LocalField/Herbrand/Basic.lean:258, 421` |
| `TauCeti.ClassFieldTheory.artinMap_restrict`, `ker_artinMap_eq_iInf`; `localClassField_unique`; `index_localNormSubgroup`; `conductorExponent_le_iff` | `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:132, 260`; `LocalExistence/Correspondence.lean:68`; `LocalExistence/AbelianLayer.lean:154`; `Local/Conductor/Basic.lean:113` |
| `OpenNormalSubgroup.IsAbelianClassFieldLayer` (root namespace `OpenNormalSubgroup`, as cited) | `ClassFieldTheory/Formation/AbelianLayer.lean:80` |
| `BialgHom.continuous_mapDomain` (declared outside the `TauCeti.PointTopology` namespace, as cited) | `TauCeti/Topology/Algebra/PointTopology/Group.lean:120` |
| Mathlib `WittVector`, `WittVector.frobenius`, `verschiebung`, `teichmuller`, `truncate`, `TruncatedWittVector` | `Mathlib/RingTheory/WittVector/Defs.lean:52`, `Frobenius.lean:218`, `Verschiebung.lean:109`, `Teichmuller.lean:93`, `Truncated.lean:288, 62` |
| Mathlib `Field.absoluteGaloisGroup`; `InfiniteGalois` (a namespace); `Algebra.trace_surjective` (finite separable) | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`; `FieldTheory/Galois/Infinite.lean:58`; `RingTheory/Trace/Basic.lean:519` |
| Mathlib `IsArithFrobAt`; `ValuationSubring.decompositionSubgroup`; `algebraicClosure`; `RestrictedProduct`, `RestrictedProduct.unitsEquiv`; `FormalGroup`; `PowerSeries` | `Mathlib/RingTheory/Frobenius.lean:184`; `RingTheory/Valuation/RamificationGroup.lean:29`; `FieldTheory/AlgebraicClosure.lean:39`; `Topology/Algebra/RestrictedProduct/Basic.lean:78`, `Units.lean:81`; `RingTheory/FormalGroup/Basic.lean:57` |

54 declarations opened. The blocks add no roadmap citation, so no supplier edge changes; the roadmap sections they already named were resolved in the previous review.

### Gate, dependencies and scope

The head is `f26248caa674b3c5c201951446a37ab8a28a9b2e`. The diff outside the folder is empty, and `git diff --stat 297522c HEAD` lists `README.md` only.

Gate rerun:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Overlaps: the overlap report lists no pull request that changes this roadmap, no dropped id and no id only an open revision defines. The citation check has one lead, LubinTateFormalModulesAndQuasiCanonicalLifts (README line 1246, untouched): the previous review resolved it in the board package and earlier in the merge order.

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean` at this head: 14 `sorry` warnings, nothing else.
- **Unchanged file.** `Suggested.lean` is byte-identical to the one read at 297522c, so the signature comparison of all 23 declarations, the one-tactic padding probe (none of the 14 theorems closes) and the headline list of the previous review stand. The worker's signature report at this head again shows no declaration that lost a section binder.

### Seeded sample

None of the 15 sampled targets (0.2, 0.3, 3.3, 4.3, 4.6, 4.8, 4.10, 5.1, 5.6, 5.8, 6.4, 6.5, 6.6, 6.7, 7.4) is changed by the diff. Where a sampled target's *Needs* line feeds a changed block, I checked the names: §0.3 (`Divisor.degreeClass`, `Divisor.finite_ker_degreeClass`, `Divisor.classNumber`), §5.1 and §5.8 (the `Place.*` declarations, `IsArithFrobAt`, `ValuationSubring.decompositionSubgroup`, `algebraicClosure`) all appear in the Layer 0 and Layer 5 blocks and exist at the pin (table above). No source locator is touched, so no source was reopened.

### Adversarial table

The diff changes no theorem, definition, convention or Check, so there is no new row. The rows below are carried from the review at 297522c, which computed the values.

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 degrees and reciprocity | uniformizer idele at `v`; `r = d_v = 2`; `r = 3, d_v = 2` | `deg = d_v`, `deg_Yu = −d_v`; `gcd = 2` factors of degree 1, `φ² = 1`; one factor of degree 3, `φ²` of order 3; local degrees sum to `r` | Pass (carried, statement untouched) | None |
| `exists_divisor_degree_eq_one` (0.2) | `𝔽_q(t)`; real conic | `deg ∞ = 1`; over `ℝ` every degree is even, so finiteness is needed | Pass (carried, statement untouched) | None |
| 2.1 lattices | `𝔽_q(t)`, `W = −2∞`, `D = −∞, −2∞`; `f·A(D)`; degree-2 place | `i = ℓ(−∞) = 0`, `ℓ(0) = 1`; `ord(f a_v) ≥ −(D − div f)_v`; index `q²`. Pinned `indexOfSpecialty` gives the same `1` | Pass (carried, statement untouched) | None |
| `riemannRoch_reducedBasis` (1.2) | `y² = x³+x+1`, `D = 0`; `x = t^p` | `d = (0, −2)`: `r` gives `(r+1) + (r−1) = 2r = ℓ(2rO)`. `d = (0, −1, …, −1)`, sum `1 − p = 0 + 1 − p` | Pass (carried, statement untouched) | None |
| `witt_additiveHilbert90`, ASW checks | `y^p − y = a`; `p = 2, n = 2`; `[t]` over `𝔽₂(t)` | `Σ_i (y+i)^(p−1) = −1`, so `Tr(−y^(p−1)) = 1`; `(y,0)+(y+1,0) = (1, y²+y) = (1, t)`; `℘[t] = (t²+t, t²+t³)` using `−[t] = (t, t²)` | Pass (carried, statement untouched) | None |
| 3.2 reduced forms | `[T^(−p)]`; `[1+T]`, `k = 𝔽_{p^p}` | `Frob[T⁻¹] = [T^(−p)]`; coordinates of `[1+T] − [1]` vanish at `T = 0`; `c = p/Tr(β) ∈ pℤ_p` | Pass (carried, statement untouched) | None |
| 3.3 one-pole | `y³ − y = t⁻²/𝔽₃`; `p = 2, m = 1` | Different 6, `2g − 2 = 0`; `N₁ = 1+0+0+3 = 4`; `L = 1+3T²`; `N₂ = 10 − (0 − 6) = 16`. `2g − 2 = −4 + 2 = −2` | Pass (carried, statement untouched) | None |
| `localAbelianExistence_all`, `injective_artinMap_all` (4.2) | `𝔽_p((T))`, `H = ⟨𝔽_pˣ, T, 1+T²O⟩`; `1 + T` | Index `#(U¹/U²) = p`; `[T⁻¹, 1 − aT) = −a` at `a = −1` gives `1 ≠ 0`, so `1 + T` is not a norm | Pass (carried, statement untouched) | None |
| 4.4 conductor | `𝔽₃`, `[T⁻²]`, `n = 1, 2`; `3[T⁻²]` | `1+2 = 3`; `1+2·3 = 7`; `1+2·3⁰ = 3` | Pass (carried, statement untouched) | None |
| 4.7 Abel bundle | `ℙ¹`, `m = 2[∞]`, `n = 1, 2`; elliptic, `m = [P]`, `n = 1, 2`; `g = 0, N = 1, n = 0` | Ranks `0, 1`; `E − P → E` misses `P` at `n = 1`, fibre `ℙ¹` minus a point at `n = 2`, rank `1`; rank `0` at the bound `n = 0`. `deg L(−m) ≥ 2g − 1` gives `H¹ = 0` | Pass (carried, statement untouched) | None |
| 4.8 coordinates | `m = [0]+[∞]` over `𝔽₅`, `λ = 2`; `m = 2[∞]`, `1+bT` | `λ⁻¹ = 3`; rigidification `1 − bT`, coordinate `b` | Pass (carried, statement untouched) | None |
| 4.10 classification (headline) | `B = ℤ/4`, `θ = 2·deg`; surjective `θ` | Image of index 2: two components, each a constant quadratic cover; constants `𝔽_{q^c}`, `c = [B : θ(C_m⁰)]` | Pass (carried, statement untouched) | None |
| `zeta_eulerProduct`, `zeta_logDeriv`, `effectiveDivisorCount_of_large` | `ℙ¹` | `placeCount 2 = (q²−q)/2`, `N₂ = q²+1`, `A₂ = q²+q+1`; `2A₂ = N₁A₁ + N₂A₀ = (q+1)² + q²+1`; `(q−1)A_n = q^(n+1) − 1` | Pass (carried, statement untouched) | None |
| `zeta_rationality` (5.3, headline) | `E/𝔽₅`, `N₁ = 9`; `g = 0` | `L = 1+3T+5T²`: `a₂ = 5a₀`, `a₁ = 9 − 6`, `L(1) = 9 = h`. `g = 0`: `P = 1`, `a₁ = 0 = N₁ − (q+1)`, degree 0 | Pass (carried, statement untouched) | None |
| 5.4 comparison | `E/𝔽₅`; reversed versus not | Discriminant `9 − 20 < 0`, roots of modulus `√5`; the non-reversed polynomial has constant term `5` | Pass (carried, statement untouched) | None |
| `isLPolynomialData_iff_eq_lPolynomial` | `q = 5, g = 1, N₁ = 9`; `q = 0, 1` | Accepts `1+3T+5T²`; rejects `1+2T+5T²` and `1+3T+T²`; junk `q` gives `1+8T`, `1+7T+T²` | Pass (carried, statement untouched) | None |
| `degree_sensitive_chebotarev` (5.8) | `M = F = 𝔽_q(t)`, `r = 2, 3`; `M = F𝔽_{q²}`, `C = {1}`, `r = 2`; `M = F𝔽_{q³}`, `C = {σ₁}`, `r = 1`; `M = F(√t)`, `r = 1`; elliptic `M = F`, `r = 1` | `q+1 ≤ 2q+2`; `q+1 ≤ 3q^(3/2)+3`; `|q²−q−(q²+1)| ≤ 2q+2`; left `0`, and `q+1 > √q+1` under the geometric convention; `|(q−1)/2 − (q+1)/2| = 1 ≤ √q+3`; `2√q ≤ 5√q+1`. Deduction: `|C| ≤ |N|` (one coset of `N`); proper divisors `e ≤ r/2`, fewer than `r` of them | Pass (carried, statement untouched) | None |
| 6.4 reduction, finiteness, base change | `GL₂`, `diag(π^a, 1)`; `𝔾_m`, `deg a = 1`; `2x = 0` over `ℤ[1/3] → 𝔽₂` | `⟨α, H₀⟩ = log_q q^(−a) = −a`; `C_K/(UΞ) ≅ Cl⁰`, rank `h`; kernel `0` becomes `𝔽₂`. The support argument uses only `f(t) = CT f(t)`, valid over any ring with `p` invertible | Pass (carried, statement untouched) | None |
| 6.5 integral model | `R ⊂ C` | `R` is a domain, `R → Frac R → C` flat; Hecke characteristic polynomials over `ℚ` | Pass (carried, statement untouched) | None |
| 6.7 Yu | general `n`, `g`; `n = 2, g = 2` | `ord det t_v = −n_v n(n−1)/2`, valuation degree `−n(n−1)(g−1)`, Yu degree `+n(n−1)(g−1)`; scalar `a^(−(n−1)(g−1))` contributes `−n(n−1)(g−1)`; sum `0`. `2 − 2 = 0`, against `2 + 2 = 4` with Yu's sign | Pass (carried, statement untouched) | None |
| 7.1 criterion | constant quadratic cover, `d` odd and even | `d` odd: one point of `𝔽_{q²}`-degree `d`, `χ = −1 = η`; `d` even: two of degree `d/2`, `χ = 1`. Extension from `ν^*Pic(X)` exists since `ℂˣ` is divisible | Pass (carried, statement untouched) | None |
| 7.4 densities | split `(O, π^rO)`; inert `π^r x ȳ`, `r = 1, 2`; `𝔽₄²` linking form | `L′ = (π^(−a)O, π^(r−c)O)`, `a + c ≤ r`: `Σ_{e<r}(e+1)T^e(1−T) + (r+1)T^r = Σ_{i≤r} T^i`. Inert: `1−T`, `1−T+T²`. 9 isotropic vectors, 3 lines: `(1−T)(1+2T)+3T² = 1+T+T² = T²(1+T⁻¹+T⁻²)`. Functional equation holds in each case | Pass (carried, statement untouched) | None |
| 7.5 Whittaker = density | `n = m = 1`, `q = 3`; `s = j` | Split `2·3^(N−1)/3^N = 2/3 = 1 − 3⁻¹`; inert `4·3^(N−1)/3^N = 4/3 = 1 + 3⁻¹`. `∏(1 − η^i q^(−i−2j))` on both sides, since `η^(−i−2j) = η^i`. Section values `q^(−1/2)`, `q^(−3/2)`; inert `q⁻¹`, `q⁻³` | Pass (carried, statement untouched) | None |
| 7.6 FYZ (headline) | `n = 1`, `ℙ¹`, split, self-dual; constant cover | Exponent `−deg𝓔(s − ½) + 1`; `L₁⁻¹ = ∏(1 − q_v^(−1−2s))`; `Den = 1`. `q^(−n²(g−1)) = q^(−n² deg ω_X/2)`; `deg ω_{X′} = 2 deg ω_X` | Pass (carried, statement untouched) | None |

## Not verifiable

- **roquette**, **rosen**, **goss**, **stichtenoth**, **hess**, **sga4half**: settled as waived or uncertified; none is cited by a changed passage.
- No source was fetched, and no missing-reference request was made: the diff touches no locator.

## Source issues

No new issue this round (no source was reopened). The issues recorded at 297522c are repeated for the register:

- **Misprint** in yu at Lemme 5.3.3, p. 36 (yu lines 1934–1935): the source asserts the nonvanishing for every vector of the representation; it should exclude the zero vector, as its proof does on p. 38; affects nothing.
- **Error** in yu at the proof of Lemme 5.3.3, p. 38 (yu lines 2024–2033): the source gives the diagonal element degree `−n(n−1)(g−1)` and corrects by the scalar power `(n−1)(g−1)`; with its own §2.2.1 sign the degree is `+n(n−1)(g−1)` and the power is `−(n−1)(g−1)`; affects the proof.
- **Misprint** in parshin at §2.2, p. 9 (parshin lines 367–373): the source writes the adelic pairing as a sum of circle values; it should be their product, the character of the summed traced residues; affects nothing.
- **Error** in parshin at §2.2, p. 9 (parshin line 375): the source takes the additive character of the constant field to be injective; it should be nontrivial only, since no character is injective when `q` is not prime; affects nothing.
- **Error** in parshin at §2.1, p. 7, and §2.3, p. 10 (parshin lines 298–299, 439–441): the source says the indicators of divisor lattices span the test functions; it should say the indicators of their translates do; affects the proof.
- **Misprint** in kosters at Corollary 1.2, p. 2 (kosters line 84): the source sums the Frobenius weights over all places; it should sum over the rational places only, as Theorem 1.1 and the proof use; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 296): the source invokes "Theorem 3.1" for Hilbert 90; it should be Proposition 3.1; affects nothing.
- **Misprint** in kw at Theorem 3.2, proof of (i), p. 7 (kw line 299): the source writes the Frobenius of `α + 1` minus `α + 1` with a wrong sign pattern; since `σα = α − 1` it should use `α − 1` throughout; affects nothing.
- **Misprint** in fyz at §2.4, p. 11, and Remark 2.5, p. 12 (fyz lines 505, 594–595): the source forms quotients and chains mixing the first lattice with the dual of the second, against its definition of the dual on p. 10; it should pair each lattice with its own dual; affects nothing.
