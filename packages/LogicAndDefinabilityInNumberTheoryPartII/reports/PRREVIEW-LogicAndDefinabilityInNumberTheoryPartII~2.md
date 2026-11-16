# Review of LogicAndDefinabilityInNumberTheoryPartII (pull request #2438 at 83f6dd6)

**Verdict:** needs changes

## R01 (P3) — The Suggested.lean docstring says the pins lack `μ_ℓ^{⊗d}`

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean:30–31`: "The pins also lack the coefficients `μ_ℓ^{⊗d}` for `d ≥ 2` (Tau Ceti's `TauCeti.KummerCoeff` is `μ_n`)".

**Claim:** The claim is false. Tau Ceti has `ℤ/ℓ(d)` for every `d`: `TauCeti.ZModTwist χ 1` is `ℤ/ℓ` with `G` acting through any continuous character `χ`, and a power of the cyclotomic character is such a character. This is the part of the previous R03 that is still unrepaired.

**Witness:** `TauCeti.ZModTwist` (`ZModTwist.lean:137`, action by `charScalar χ i g`, line 206) and `TauCeti.continuousLocalCyclotomicCharacter` (`Cyclotomic/Character.lean:54`). In a scratch file, `ZModTwist (continuousLocalCyclotomicCharacter ℓ K ^ d) 1` and its `ContinuousSMul (Field.absoluteGaloisGroup K)` instance both elaborate.

**Repair:** Replace lines 30–33 from "The pins also" to "complex;" with:

```text
  ideal and is not shown to be a domain when the ring is a discrete valuation ring. The twisted
  coefficients `ℤ/ℓ(d)` exist at the pins, as Tau Ceti's
  `TauCeti.ZModTwist (TauCeti.continuousLocalCyclotomicCharacter ℓ K ^ d) 1`; the pins lack Kato's
  groups of logarithmic differentials in characteristic two and the residue maps of Kato's
  complex;
```

## R02 (P3) — The route of 1.3b rests on Cossart–Piltant Part I, which the README does not cite

**Location:** `README.md:646`: "the first part of their work deduces the theorem from local uniformization of three-dimensional Artin–Schreier and purely inseparable singularities along suitable rank-one valuations, and the second part proves that uniformization by blow-ups along regular centres".

**Claim:** The global theorem is deduced from local uniformization in Part I, a separate paper. The README neither lists nor locates Part I: References line 1621 has only Part II. Part II also blows up regular cylinders over the base, which the sentence omits.

**Witness:** cossart_piltant line 139 says the article proves Conjecture 3.1 of [CP1]. Line 160 says [CP1] proves that the main theorem answers that conjecture. Lines 181–183 list blow-ups along regular centres and along regular cylinders over `Spec S`.

**Repair:** In 1.3b, replace the quoted clause with: "their first paper deduces the theorem from local uniformization, along suitable rank-one valuations, of three-dimensional Artin–Schreier and purely inseparable singularities (cossart_piltant_i, Conjecture 3.1 and its reduction to local uniformization), and the second proves that uniformization by blow-ups along regular centres and along regular cylinders over the base". Add to References: "- **cossart_piltant_i** — Vincent Cossart and Olivier Piltant, *Resolution of singularities of threefolds in positive characteristic I. Reduction to local uniformization on Artin–Schreier and purely inseparable coverings*, Journal of Algebra 320 (2008); HAL hal-00139124: Conjecture 3.1 and the theorem reducing it to local uniformization." Record it in `sources.toml`, and give the number of that theorem once the text has been read.

## R03 (P3) — The description does not say that the roadmap now owns threefold resolution

**Location:** Pull-request description, `roadmap-summary` block: "and three cohomological local–global principles that no other roadmap states." and "imports Pfister forms, henselizations, surface resolution and interpretations from the roadmaps that own them."

**Claim:** The head now owns the projective resolution of quasi-projective threefolds in positive characteristic (1.3b, listed in the ownership paragraph). The description names no resolution theorem among what the roadmap supplies, and presents resolution only as imported.

**Witness:** README line 11 lists, among the roadmap's own targets, "the projective resolution of reduced quasi-projective threefolds over a field of positive characteristic differentially finite over a perfect subfield (1.3b)". Line 23 says AdicCoefficientsAndComparisonsPartII §PA.0.12 gives proper modifications only.

**Repair:** In the `roadmap-summary` block, replace "and three cohomological local–global principles that no other roadmap states." with "three cohomological local–global principles that no other roadmap states, and Cossart–Piltant's projective resolution of quasi-projective threefolds over fields of positive characteristic differentially finite over a perfect subfield."

## Previous findings

- R01 — repaired: "### 1.3b Projective resolution of threefolds in positive characteristic … a projective morphism `π : Z̃ → Z` … (Cossart–Piltant, Theorem of the introduction, p. 5 of the HAL version)". The 1.4 *Needs:* line now cites "1.3b (for `d = 3`)". The route's missing reference is R02.
- R02 — repaired: "The converse is certified at a single smooth closed point; fix `t ∈ K ∖ L`. *Slots.* …". The longest run shared with poonen_uniform lines 436–469 is 5 words.
- R03 — partly repaired: the henselization and simple-normal-crossings clauses (Suggested.lean lines 26–30, 37–38) are now correct. "The pins also lack the coefficients `μ_ℓ^{⊗d}` for `d ≥ 2`" is false and is carried forward as R01.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 1.3b statement | `xy − zw` over `𝔽₂`; `ℙ³`; `𝔽₂(t₁, t₂, …)` | Jacobian `(y, x, w, z)` vanishes only at the origin; exceptional `Q ≅ ℙ¹ × ℙ¹` is a divisor; `Σ = ∅` gives the identity; the `dt_i` are independent | holds; hypotheses as at cossart_piltant lines 162–167 |
| 1.3b small-resolution Check | charts `(x, w, v)`, `(z, y, u)` | `x(y − vw)`, `z(uy − w)`; fibre over the origin `x = w = 0` with `v` free: a `ℙ¹` of codimension 2 | Check correct; the divisor clause excludes it |
| 1.3b route (R02) | Part II lines 139, 160, 178–183 | reduction proved in [CP1]; centres are regular, or regular cylinders over `Spec S` | Part I unreferenced |
| 1.4, `d = 3` model from 1.3b | `𝔽₂(s,t,u)`; general `K`, char 2, `δ = 3` | `ℙ³` with `Σ = ∅`; `Ω¹_{𝔽₂/𝔽₂} = 0`; `π` closed and an isomorphism on a dense open, so onto; regular over perfect `𝔽₂` gives smooth | holds |
| 0.12(b) rewrite | `κ = 𝔽₅`, `y² = x³+x+1`, `P₀ = (2,1)`, `c = 2`, `ℓ = 5` | `1 = 8+2+1`; `z(P₀) = 3`, `b = 1`; `∂(s²−1)/∂s = 2`; `2^{(5⁵−1)/2} = (−1)⁵ = −1`, a nonsquare | holds |
| 0.12(b) constant field of `K_u` | `L_u = L(y_u)`, pole order 3 at `∞` | `𝔽₂₅L/L` is unramified, but `∞` ramifies in `L_u`; `K_u/L_u` is regular | claim holds |
| 0.12(b) slots | `ρ ≠ 0`; `η = F^ℓ − 1` | `σρ(ξ) = −ρ(ξ)`; `d(F^ℓ − 1) = −1`, so separable; `ord_P(z∘η) = −1`; `t − b` restricts to `t − τ` over `P` | holds |
| Docstring `μ_ℓ^{⊗d}` (R01) | `ZModTwist (χ_cyc ^ d) 1` | elaborates with `ContinuousSMul (absoluteGaloisGroup K)`; `g` acts by `χ(g)^d mod ℓ` | claim false |
| Docstring henselization | `TauCeti.Henselization.algebra` | `Ideal R → CommAlgCat R` (Algebra.lean:43); no `IsDomain` result in `RingTheory/Henselization/*` | holds |
| Docstring normal crossings | `TauCeti.SmoothPair.AlgebraicChart` | a structure on one ring (AlgebraicChart.lean:45); nothing at the pins on normal crossings divisors on schemes | holds |

The diff changes no Lean statement. The rows for the untouched statements stand as in the previous review, of `8eb7da8`.

- **Gate.** The worker's gate passes every check, including the build. A rerun of the dependency check gives "depcheck: 253 roadmaps, 2400 edges, 0 problem(s)". There are no changes outside the folder.
- **Elaboration.** `lake env lean Suggested.lean` gives only the 9 `declaration uses sorry` warnings. The declarations are unchanged since `8eb7da8`, so the earlier `#check @` comparison and one-tactic probe still apply.
- **Library declarations.** 9 opened at the pins: `continuousCohomology`, `ContinuousCohomology.map`, `Field.absoluteGaloisGroup.map`, `TauCeti.Henselization.algebra`, `TauCeti.KummerCoeff` (Coefficients.lean:134), `TauCeti.ZModTwist`, `TauCeti.continuousLocalCyclotomicCharacter`, `TauCeti.zModTwistEquivKummerCoeff` (Prescription.lean:96) and `TauCeti.SmoothPair.AlgebraicChart`.
- **Sources.** 6 locators checked against the text: cossart_piltant lines 139 and 160 (the role of [CP1]), 149 (main theorem, HAL p. 4), 162–167 (Theorem, p. 5) and 178–219 (overview, pp. 5–6); poonen_uniform lines 436–469 (Lemma 4.8 and its proof, pp. 9–10).
- **Cross-roadmap citations.** AdicCoefficientsAndComparisonsPartII §PA.0.11 and §PA.0.12, at its open head, resolve. Lines 454–456 there (proper modifications, projective only for affine `Y`) match README lines 23 and 97.
- **Seeded sample.** Of the sampled targets, the change touches 0.12 and 1.4, and 1.3b is new next to 1.3a. The other sampled targets are unchanged.
- **Pull request text.** Apart from R03, no sentence is contradicted by the head. No supplier was added or dropped: AdicCoefficientsAndComparisonsPartII was already one.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII, EtaleDualityAndPerverseSheavesPartII and SchemeAndStackFoundations. The one new object is the projective resolution of quasi-projective threefolds over differentially finite fields, and this roadmap owns it (1.3b). AdicCoefficientsAndComparisonsPartII §PA.0.12 owns only the proper form, projective over affine `Y`. ResolutionOfSingularitiesCharacteristicZero covers characteristic zero only. No other roadmap names Cossart–Piltant's theorem over a field. The other shared objects and their owners are as in the previous review.

Source independence: changed passages only. 3 passages compared with 2 sources. The 0.12(b) route against poonen_uniform lines 436–469 shares at most 5 words. The 1.3b statement and route against cossart_piltant lines 138–220 share at most 8 words, the theorem's hypothesis list, which the statement forces. The largest share is still dittmann_pop, 68 of about 276 locators; Cossart–Piltant citations fell from 10 to 3. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Cossart–Piltant Part I (HAL hal-00139124): the HAL page and the document were blocked by bot protection, and no arXiv copy was found. The number of its reduction theorem is unchecked (R02).
- kato_hasse, merkurjev_suslin, moret_bailly, lenstra_cm: uncertified and cited by locator only, as in the previous review.

## Source issues

- none

## For the human reviewers

- none
