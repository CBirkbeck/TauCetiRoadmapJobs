# Review of NumberFieldEnumeration (pull request #1718 at 9f24910)

**Verdict:** needs changes

## R01 (P2) — Include the promised prefix characterization in the acceptance test

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:609`, “The prefix version”; `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:10`, “It states the roadmap's headline theorems”.

**Claim:** The exact prefix specialization is an explicitly owned end theorem (§§Scope, 2.3), but none of the 18 Lean theorems states it. The earlier easy prefix inclusion has been deleted without stating the promised characterization by real roots and exact field discriminant. This characterization is statable at the pins.

**Witness:** A scratch extension with `TauCeti.NumberTheory.NumberField.IntrinsicLabel` elaborates the set equality below. Its native predicate is defined at `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72`; the required real roots and `AdjoinRoot` carriers also exist.

**Repair:** State the exact characterization with `sorry`, using the existing canonical set and native intrinsic-label predicate. For example, the following signature elaborated with the default options:

```lean
theorem prefix_characterization (d r D : ℕ) :
    {Q : ℤ[X] | ∃ (K : Type) (_ : Field K) (_ : NumberField K),
      TauCeti.NumberField.HasLMFDBIntrinsicLabel K d r D ∧ polredabs K = Q} =
    {Q ∈ canonicalPolys d D | (Q.map (Int.castRingHom ℝ)).roots.card = r ∧
      ∃ h : Irreducible (Q.map (Int.castRingHom ℚ)),
        haveI : Fact (Irreducible (Q.map (Int.castRingHom ℚ))) := ⟨h⟩
        (discr (AdjoinRoot (Q.map (Int.castRingHom ℚ)))).natAbs = D} := by
  sorry
```

Use the **field** discriminant in this filter: the canonical Dedekind cubic has polynomial discriminant −2012, but its field has discriminant −503 and prefix `3.1.503`. Tests of the proposed statement give the singleton `{X²−X−1}` for `2.2.5`, `{X²+1}` for `2.0.4`, and the empty set for `2.1.5`. Also spell out rank-`d−1` admissibility in the README's prime-degree Hunter-image corollary: at `d=2,D=5,Γ=0`, that image is empty although prefix `2.2.5` is nonempty. This is why the hypothesis of the preceding prime-degree theorem must accompany its use here.

## R02 (P3) — Delete the immediate integer specialization from Suggested.lean

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/Suggested.lean:52`, `abs_coeff_le_of_t2`.

**Claim:** After adding the general complex coefficient theorem, the integer version is an immediate specialization, not another headline acceptance theorem.

**Witness:** Replacing only its `sorry` by this single tactic elaborates successfully and reduces the file's `sorry` warnings from 18 to 17:

```lean
simpa [t2, Polynomial.coeff_map] using
  (norm_coeff_le_of_complexT2 (hP.map (Int.castRingHom ℂ))
    ((hP.natDegree_map (Int.castRingHom ℂ)).trans hn) hpos k hk)
```

**Repair:** Delete it from `Suggested.lean`; keep the integer specialization in README prose and remove the backticked claim of an acceptance-file declaration. Do not prove it in place. The complex theorem still gives `2 ≤ 2` for the constant coefficient of `X²+2`, `0 ≤ 2√2` for its linear coefficient, and the bounds needed by both candidate constructions.

## R03 (P3) — Record the cited works in sources.toml

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:718`, “References”; `TauCetiRoadmap/NumberFieldEnumeration/sources.toml` is absent.

**Claim:** The previous review's source-record finding remains partly unrepaired. The bibliography has improved locators, but none of its works has the required manifest record, including the version-dependent Martinet citation and the unavailable background texts.

**Witness:** The folder contains no `sources.toml`. The service read seven source resources this round, classified Cohen and Pohst as uncertified, and could not obtain HLP or Hermite. Those distinctions currently have no roadmap record.

**Repair:** Add one source key per work, preserving the previously used keys: `cohen1993`, `hunter1957`, `martinet1985`, `pohst1982`, `jonesroberts2014`, `hermite1850`, `hlp1952`, `lmfdb-polredabs`, `lmfdb-label`, `lmfdb-discriminant`, `pari-guide`. Record the service's provenance/status and the version actually cited; do not mark unread texts verified. In particular, the Martinet author-version locator must resolve to Proposition 2.3 on printed page 6, and Jones–Roberts to arXiv:1404.0266v1 §3. No source manifest was edited during this review.

## R04 (P3) — Correct the page of Martinet Proposition 2.3

**Location:** `TauCetiRoadmap/NumberFieldEnumeration/README.md:384` and `:727`, “Proposition 2.3, p. 5” / “p. 5”.

**Claim:** In the corrected author version explicitly chosen by the roadmap, Proposition 2.3 is on printed page 6, not page 5.

**Witness:** `martinet1985` lines 248–281 place Proposition 2.3 on physical PDF page 8, headed printed page 6. The page image confirms the subfield-lattice covolume formula.

**Repair:** Change these two exact locators to p. 6; in the §2.2 grouped reference distinguish Proposition 2.3, p. 6, from Theorem 2.6, p. 7. The formula is unchanged: for relative degree 2 over a quadratic field of discriminant −3, its squared covolume is `2²·3=12`, yielding quotient determinant `1008/12=84`.

## Previous findings, checked individually

All eleven previous findings were compared with this head before the full review. No repair report marking any of them “not actionable in this package” was supplied or found in the readable package reports.

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01, impossible rank-zero hypothesis | README:575, “positive rank `1 ≤ k < n`”; Lean:276 has both inequalities. | Repaired. At n=4 the required ranks are 1,2,3, and the base cases are at README:599. |
| R02, truncated coefficient indexing | README:71, “`a_k = 0` for `k > n`”; README:225 computes the linear case. | Repaired. `X−1` now gives `1=1`, and the nonmonic counterexample is explicitly excluded. |
| R03, complex coefficient and symmetric-mean inputs missing | README:182, “for monic `P : ℂ[X]`”; README:187 explicitly states Maclaurin's inequality and its averaging route. | Repaired. Lean:37 states the complex theorem; §2.2 consumes it. The projected-lattice prerequisites are now supplied by the resolved earlier roadmap. |
| R04, module warning fails gate | Lean:1, `module`; Lean:23, `public section`. | Repaired. Supplied gate passes; independent direct elaboration gives only 18 `sorry` warnings. |
| R05, relative and composite headlines absent | Lean:219, `exists_mem_relCandidates_of_maximal`; Lean:274, `hunter_relativeImage_eq_canonicalPolys`. | Repaired for both results previously requested. Their degree, generation, maximality, admissibility and residue-cover conditions are present. R01 above concerns the separate prefix end theorem. |
| R06, bounded generating families wrongly claimed absent | README:42–44, “including `NumberField.exists_mem_rootSet_eq_adjoin_of_abs_discr_le`”. | Repaired. The supplier contract accurately describes the native finite polynomial family. |
| R07, false equality criterion for coefficients | README:221, “sharp for the constant coefficient”; README:222, “cancellation”. | Repaired. The example now records `2=2` at k=2 and `0<2√2` at k=1. |
| R08, elementary/boundary padding | The three previous declarations `t2_nonneg`, `admissible_rank_one`, `hunterCandidates_finite` are absent. | Repaired. R02 above is a new immediate specialization created by adding the complex theorem. |
| R09, source locators and manifest | README:328 cites Corollary 2.9; README:409 identifies prime completeness as a deduction; README:674 distinguishes database background. | Partly repaired. The source/derived-result distinction and version choices are repaired; R03 and R04 above remain. |
| R10, roadmap shape and definition checks | The Summary, Conventions, Exact supplier contracts and How to read the build headings are present; both layers end with Examples and Dependencies. | Repaired in the identified structural and definition-check respects. Explicit candidate, key, defining-polynomial, relative-bound and image controls have been added. |
| R11, inaccurate assertion about imports | README:110–113, “those modules need not be imported by the acceptance file”. | Repaired. The two Tau Ceti imports serve the acceptance statements; the other contracts identify proof/example modules. |

## Verified sound

This was a full review of all six subsections, the conventions, API claims, proof routes and worked examples, and all **33 Lean declarations: 15 definitions and 18 admitted theorems**. Four findings remain, one blocking. No pull-request file was changed. The supplied passing gate and the independent elaboration establish form and typing, not the truth of admitted theorems.

The following **60 adversarial rows** record actual values, including the sampled targets, every headline, the definition APIs and every finding's mathematical instance. `C`, `H`, `I`, `CP` abbreviate candidates, Hunter candidates, Hunter image and canonical polynomials. Let `φ=(1+√5)/2`, `ω=(1+√−3)/2`, `g=X³−X²+1`, and let `K₋,K₊` be the quartics given by `X⁴∓5X²+7`. Decimal root calculations are numerical checks, not formal proofs of global minima.

| # | Statement | Instances and values computed on both sides | Result; change |
|---|---|---|---|
| 1 | `complexT2`, root multiplicity and zero convention | `0,1,X,X−1` have root norms `0,0,0,1`; `(X−1)²` has `1²+1²=2`, not 1. | Multiplicities and empty roots agree; retain. |
| 2 | `t2`, integer specialization | `X²−X−1,X²−5,X²+1,X²+4` give `3,10,2,8`, equal to the mapped complex root sums. | Definition agrees; retain. |
| 3 | Nonnegativity | At zero, `0≥0`; at `X²+1`, `2≥0`, while the power sum is −2. | Wrong power-sum model excluded. |
| 4 | Nonzero scalar invariance | `X²−1` and `2X²−2` both give 2. Scalar zero gives norm 0 instead of 2. | Nonzero-scalar hypothesis necessary. |
| 5 | Product additivity | `(X−1)(X+1)` gives `2=1+1`; `1·(X²+1)` gives `2=0+2`; multiplication by zero gives `0≠0+2`. | Nonzero factors retained. |
| 6 | `candidates` membership | `C(0,−1)=∅`, `C(0,0)={1}`, `C(1,1)={X−1,X,X+1}`. The zero polynomial has norm 0 but monicity false. | Degree-zero and negative-bound controls work. |
| 7 | Candidate monotonicity and degree separation | `C(1,0)={X}⊆C(1,1)` of size 3; `C(0,0)∩C(1,0)={1}∩{X}=∅`. | Inclusion and disjointness have concrete witnesses. |
| 8 | Complex coefficient bound | `P=X²−(2+ω)`: norm `2√7`; at k=2, coefficient norm `√7=(2√7)/2`. For `X²+2`, k=1 gives `0≤2√2`. | Handles nonreal coefficients and cancellation. |
| 9 | Integer coefficient bound / R02 | `X²+2`, k=0,1,2 gives respectively `1≤1`, `0≤2√2`, `2≤2`. For `X²`, k=0 gives `1≤0⁰=1`. | True specialization; delete its separate Lean declaration. |
| 10 | Maclaurin inequality | For `(1,3)`, k=2, `e₂/C(2,2)=3≤4`; `(2,2)` gives `4=4`; `(0,0)` gives `0=0`; k=0 gives `1=1`. | Nonnegative inputs and endpoint range correct. |
| 11 | Averaging proof route | Replace `(1,3)` by `(2,2)`: product rises `3→4`, difference `1=(1−3)²/4`; square sum falls `10→8`. | Least-square-sum maximizer argument survives even if the symmetric-polynomial increment vanishes. |
| 12 | Cauchy–Schwarz step | Root moduli `(1,3)` have mean 2 and quadratic mean `√5`; `(√2,√2)` gives `√2=√2`. | Correct direction and equality control. |
| 13 | `candidates_finite` and explicit count | `C(2,2)` has nine polynomials. Coefficient interval product is `(2·2+1)(2·1+1)=15`, so `9≤15`. Degree zero cardinalities are 0 and 1. | Finite boxes support the theorem and boundary clauses. |
| 14 | Embedding/minimal-polynomial norm comparison | In `ℚ(√5)`, φ gives `3=(2/2)·3`; 1 gives `2=(2/1)·1`; 0 gives `0=(2/1)·0`. In K₋, ω gives `4=(4/2)·2`. | Nongenerators require the degree factor. |
| 15 | All-real power-sum formula | `X²−X−1`: `3=1−2(−1)`; `X−1`: `1=1−0`; constant 1: `0=0−0`. | Zero extension repairs the earlier natural-subtraction error. |
| 16 | Monicity and real-root restrictions | `2X²−2`: norm 2 versus unnormalized coefficient expression 4. `X²+1`: norm 2 versus power sum −2. | Both restrictions discriminate. |
| 17 | `signVector` | `X²−X−1→[1,−1,1,−1]`, `X²+X−1→[1,1,1,−1]`, `X→[0,0]`, constants → `[]`. | Lengths 4,4,2,0 and negative-sign preference agree. |
| 18 | `polredabsKey` | The quadratic keys are `(3,5,[1,−1,1,−1])<(3,5,[1,1,1,−1])`. Constants 1 and 2 both have `(0,1,[])`. | Monicity must remain in injectivity; retain. |
| 19 | Key injectivity in fixed monic degree | The two monic quadratics differ at signed entry 2, −1 versus 1; equal lists recover both lower coefficients. Constants 1 and 2 coincide in key but 2 is nonmonic. | Wrong model excluded by the stated domain. |
| 20 | `definingPolys` and its iff | In `ℚ(√5)`, `X²−5` is monic of full degree 2 with generating root and belongs. `X²−1` in ℚ has a generating root 1 but degree `2≠1`, so both membership and the full-degree conjunction fail. | Both directions tested, with integrality supplied by monicity. |
| 21 | Nonemptiness, index and presentation | `X` defines ℚ via root 0; `X²−5` defines `ℚ(√5)` with index 2 and `20=2²·5`. `X²+1` has no root in `ℚ(√5)`. | Nonmaximal orders are allowed; reducible/wrong fields excluded. |
| 22 | Quotient-field comparison | `ℚ[X]/(X²−5)→ℚ(√5)` sends the class of X to √5; source/target degrees `2=2`, evaluation `5−5=0`. | Map source, target and generating root agree. |
| 23 | `polredabs` and `polredabs_mem` | For ℚ the minimum is X with norm 0, not `X−1` of norm 1. For `ℚ(√5)` it is `X²−X−1` with norm 3 rather than `X²−5` of norm 10. | Finite nonempty sublevel argument excludes fallback polynomial 0. |
| 24 | Minimality, uniqueness and monic/irreducible consequences | Quadratic minimizing key `(3,5,[1,−1,1,−1])` beats the sign mate and norm-10 presentation; degree 2, leading coefficient 1, discriminant 5. | One least key, and it defines the intended field. |
| 25 | Isomorphism invariance | Quadratic presentations with norms 3 and 10 yield the same canonical polynomial. Cubic presentations `g` and `X³−X−1` have norms `3.219276205` and `3.264632999`. | Presentation norm is not an invariant; canonical output is. |
| 26 | Converse classification | K₋ and K₊ both have norm `4√7≈10.583005244`, but their quadratic coefficients are −5 and +5. | Equal norm does not imply equal canonical polynomial or field. |
| 27 | Additional canonical examples | Fifth cyclotomic signed mates both have norm 4 and discriminant 125; signed cubic coefficient −1 beats +1. Dedekind generator norms are `13.158646091<13.439915867`. | Sign and norm preferences checked; global-minimum certification limits stated below. |
| 28 | Hermite admissibility, positive rank | Rank one A=(2): minimum 2, determinant 2, Γ=1 gives `2=2`. A₂ has determinant 3 and minimum 2: Γ=1 gives `2>√3`, Γ=`2/√3` gives `2=2`. | Arbitrary admissible constants retained. |
| 29 | Rank-zero exclusion | Empty matrix determinant 1; vector set has one element, namely 0; nonzero-vector set has cardinality 0. For n=4 required ranks are 1,2,3. | No vacuous admissibility hypothesis remains. |
| 30 | Absolute projected lattice | Basis `(1,φ)` has Gram matrix `[[2,1],[1,3]]`, determinant 5. Orthogonal quotient squared norm `3−1/2=5/2=|d|/n`. | Trace normalization and projected determinant agree. |
| 31 | `hunter` | Quadratic φ: `3=1/2+5/2`; real cubic discriminant 49: `5=1/3+(2/√3)√(49/3)`; g: `3.219276205≤3.530554349`. | Non-strict inequality and all embeddings are necessary. |
| 32 | Trace translation and sign | φ+2 has trace 5, norm 15; projected norm `15−25/2=5/2`. Subtract 2: trace 1, norm 3, same `3−1/2=5/2`; negation changes trace sign. | Reduction to `0≤Tr≤n/2` valid. |
| 33 | `hunterBound` including junk values | `(2,0,1)→1/2`, `(2,5,1)→3`, `(2,8,1)→9/2`, `(3,23,2/√3)→3.530554349`, `(3,49,2/√3)→5`; n=0 gives 0, n=1 gives Γ. | Floor before division is correct; completeness uses n≥2. |
| 34 | Bound monotonicity | With n=2,Γ=1, D=0,5,8 gives `0.5≤3≤4.5`; at D=5 changing Γ from 0 to 1 gives `0.5≤3`. | Nonnegative-Γ assumption accompanies monotonicity in D. |
| 35 | `hunterCandidates` | At `(2,8,1)`, 11 candidates have discriminants −4 (3), 5 (2), −3 (2), −7 (2), 8 (1), −8 (1). `X²−1` is rejected as reducible. | Definition and listed quadratic family agree. |
| 36 | Cubic candidates and discriminant filter | At D=23, four candidates, all discriminant −23. At D=49, 28 candidates: −23 (10), −31 (6), −44 (6), 49 (2), −104 (2), −108 (2). | Square-factor condition does not itself enforce the field bound. |
| 37 | Rejection and equality cases | `X³+X−1` has norm `3.396713696≤3.530554349` but squarefree discriminant magnitude 31>23. Real cubic norm 5 equals the D=49 bound. | Both filters and closed inequality discriminate. |
| 38 | Prime completeness | `ℚ(√5)`, D=5: norm `3≤3`, discriminant `5=1²·5`; cubic g: `3.219276205≤3.530554349`, `23=1²·23`. | Prime hypothesis yields generation. |
| 39 | Primitive-field completeness | Cubic intermediate degrees divide 3, hence are 1 or 3. K₋ has intermediate degree 2 between 1 and 4; its minimum defining norm `10.583005244>9.421812797`. | The primitive hypothesis excludes the imprimitive counterexample. |
| 40 | Discriminant reduction | ℚ⊆`ℚ(√5)`: `1²∣5`; `ℚ(ω)⊆K₋`: `(-3)²=9∣1008`, quotient 112; identity extension: `d¹∣d`. | Signed integer versus ideal conventions agree after absolute values. |
| 41 | Hunter-or-subfield dichotomy | g satisfies the candidate alternative. K₋ has degrees `1<2<4`, `3²=9≤1008`, while `4√7>9.421812797`. | Both alternatives have meaningful instances. |
| 42 | Relative projection and source locator / R04 | For K₋/`ℚ(ω)`, subfield squared covolume `2²·3=12`; quotient determinant `1008/12=84`, unlike relative discriminant norm `1008/9=112`. | Formula correct; locate Proposition 2.3 on p.6. |
| 43 | `hunter_relative` | Trace-zero quartic generator: `4√7=(2/√3)√84=10.583005244`. Over ℚ, φ gives `3=1/2+5/2`. | Relative and absolute normalizations agree. |
| 44 | Arbitrary residue covers | ℚ, r=2, cover `{0,3}`: φ+1 has trace 3 and norm 7, and `7=9/2+5/2`. Empty cover has 0 representatives of residue 0. | Covering, not a particular choice of representatives, is required. |
| 45 | `relT2` | Over `ℚ(ω)`, `X²−(2+ω)` has image norm `2√7` at each of two embeddings, total `4√7`; `X²−ω` has total 4; polynomial 1 has 0. | Complex embedding multiplicity is correct. |
| 46 | Relative norm API | Over ℚ, `relT2(X²+1)=2=t2(X²+1)`; over `ℚ(ω)`, factors `X−1` and `X−ω` have norms 2 and 2, product norm 4. | Base specialization and nonzero-product additivity agree. |
| 47 | `relCandidates` | Over ℚ, degree 2 bound 2 gives nine polynomials; degree 0 bound 0 gives `{1}`. Over `ℚ(ω)`, the quartic relative polynomial lies at bound `4√7` and fails at bound 10. | Positive, negative and off-bound membership controls work. |
| 48 | `relCandidates_finite` and monotonicity | Over any base, B=−1 gives 0 candidates; degree 2, B=0 gives only `X²`, cardinal 1. Over ℚ, raising B to 2 increases the cardinality to 9. | Complex coefficient theorem supplies the finite-coordinate argument. |
| 49 | `relativeBound` | ℚ, r=2,D=5,Γ=1: covers `{0,1}` and `{0,3}` give `1/2+5/2=3` and `9/2+5/2=7`. Empty R gives trace term 0. | Representative dependence is real, and empty R cannot prove completeness. |
| 50 | Relative maximum and denominators | For `R={0,1,ω,1+ω}`, trace terms are `0,1,1,3`; maximum 3, uniform bound `3+4√7≈13.583005244`. Denominators are 2,12 and rank 2. | Element-specific equality `4√7` is not confused with uniform maximum. |
| 51 | Maximal-subfield relative completeness | K₋/`ℚ(ω)` has degree 2, generator x with `x²=2+ω`, trace 0 and norm `4√7≤3+4√7`; a scalar ω generates degree 1 instead. | Generation, evaluation and degree identify the minimal polynomial. |
| 52 | `relativeImage` and finite-output API | Over ℚ, r=2,D=5, cover `{0,1}`, output includes `X²−X−1` with norm 3. Over `ℚ(ω)`, r=2,D=1008, both quartics enter at `4√7≤3+4√7`. At D=0, 0 fields pass. | Actual generating roots prevent arbitrary extensions from entering. |
| 53 | `canonicalPolys` and base cases | `CP(0,8)=∅`, `CP(1,0)=∅`, `CP(1,1)={X}`; `CP(2,8)` has six displayed quadratics. | Positive field dimension and discriminant 1 in degree one agree. |
| 54 | `hunterImage` and inclusion | Eleven quadratic inputs yield six canonical outputs, each of degree 2 and `|d|≤8`; at D=0 the image has 0 outputs. At cubic D=49, extraneous polynomial discriminants −104 and −108 must be filtered. | Field filter is essential; image finite/inclusion route valid. |
| 55 | Prime complete-list equality | At `(2,8,1)` both sides are the same six quadratics. At `(3,23,2/√3)` both are `{g}`. At D=49, retained cubic canonical discriminants are −23,−31,−44,49. | Both inclusion directions tested on these finite families. |
| 56 | Composite complete-list equality | n=4 uses proper divisor m=2; for the common base D′=3, `3²=9≤1008`. Absolute bound is 9.421812797, while relative candidates supply norm 10.583005244. n=2 has no proper m and reduces to the prime equality. | Relative branch fixes the absolute omission; recursion strictly decreases degree. |
| 57 | Canonical/image finiteness and D-monotonicity | CP cardinalities for `(0,8),(1,0),(1,1),(2,8),(3,23),(3,49)` are `0,0,1,6,1,4`; cubic D=23 singleton is contained in the D=49 four-element set. | Consistent with native Hermite finiteness and classification. |
| 58 | Effective count comparison | D=0: rank bound 1, coefficient bound 2, count bound 25, hence `0≤25`. D=1: coefficient bound 4, count bound 81, hence `1≤81` for degree one. | Native count bounds field classes via an injective choice of embedded model. |
| 59 | Prefix end theorem / R01 | Prefixes `2.2.5`, `2.0.4`, `2.1.5` give respectively `{X²−X−1}`, `{X²+1}`, `∅`. Dedekind canonical polynomial: one real root, polynomial discriminant −2012, field discriminant −503. Γ=0 gives `I(2,5,0)=∅`, not the nonempty `2.2.5` prefix. | Add exact Lean characterization; retain field discriminant and admissibility. |
| 60 | Carrier, universe and identity controls | `AdjoinRoot(X²−5)` is a Type-sized degree-2 model; characteristic-p fields fail characteristic zero. The zero ring fails Field. Identity relative extension has r=1 and is excluded; n=0 is excluded from Hunter and retained only in total definitions. | No dropped scalar tower, empty-rank or universe loophole found. |

The coefficient-box enumeration was recomputed independently, not inferred from field counts. Quadratic and cubic irreducibility used the square-discriminant and integer-root criteria, respectively. Cubic discriminants were computed by the integer formula. Roots were used only to test the norm bounds; the equality cases also have the exact calculations displayed above. The canonical classification, integral basis and discriminant arguments distinguish the six quadratic outputs. For the cubic −104 and −108 inputs, a smaller possible field discriminant would have magnitude at most 26 or 27; the lower-degree comparison and the supplied field-discriminant filter are indispensable. No claim of a formal exhaustive field-classification proof is made by these numerical checks.

**Headline coverage.** The README's headlines are complex coefficient bounds and finite bounded-norm families (§1.1); canonical existence, uniqueness and classification (§1.2); absolute Hunter (§1.3); prime/primitive completeness (§2.1); subfield reduction, relative Hunter, relative candidate finiteness and maximal-subfield completeness (§2.2); prime and all-degree canonical-list equality, finiteness, comparison with the effective count, and exact prefix specialization (§2.3). All have the intended carriers at the pins. All substantive families are represented in Lean except the prefix characterization in R01. Uniqueness is determined by membership, minimality and the explicitly defined injective key; no extra boundary/API theorem is requested for it.

**Lean and padding evidence.** Direct `lake env lean` on the supplied absolute target completed successfully, with exactly 18 `sorry` warnings. A scratch copy appended `#check @name` for every one of the 33 declarations and elaborated successfully. Every resulting type was compared with its README statement: the number-field instances, relative algebra structure, relative-degree lower bound, maximality, hΓ and hR all remain. No signature repair was needed. The `Type` restriction occurs only in the sets of models and their composite theorem; the individual field theorems remain universe-polymorphic. Rational scalar towers are canonical, and finite dimensionality between number fields is native.

Each of the 18 admitted theorems was tried with `simp`, `rfl` and `infer_instance` in a scratch copy; none closed. The targeted single-`simpa` specialization in R02 did close. The exact prefix equality in R01 also elaborated with the additional existing intrinsic-label module, whose object file was already available. No Lean process remains running. These are typing/padding checks, not proofs of the admitted headline mathematics.

**Pinned-library audit.** Pins read from `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following 22 source entries were inspected. Paths in this table are relative to the corresponding library repository.

| # | File and line at the pin | Contract checked and its limits |
|---|---|---|
| 1 | `Mathlib/NumberTheory/NumberField/Basic.lean:42` | `NumberField` contains characteristic zero and finite dimensionality over ℚ; it does not include a chosen primitive element. |
| 2 | Same file:60, :71, :446 | Number-field extensions are finite dimensional; intermediate fields are number fields; `AdjoinRoot.numberField` requires irreducibility over ℚ. |
| 3 | Same file:101, :275, :284, :427 | Ring of integers is native, has fraction field K and is integrally closed; `Rat.ringOfIntegersEquiv` identifies the rational case with ℤ. |
| 4 | `Mathlib/Algebra/Polynomial/Roots.lean:56` | Roots are a multiset with multiplicity; zero has empty roots, not every scalar as a root. |
| 5 | `Mathlib/RingTheory/Polynomial/Vieta.lean:116` | `coeff_eq_esymm_roots_of_card` retains leading coefficient and the root-cardinality equality. |
| 6 | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935` | `Polynomial.discr` is polynomial discriminant, distinct from the field invariant. |
| 7 | `Mathlib/FieldTheory/Minpoly/IsIntegrallyClosed.lean:57` | The fraction-field comparison retains integral-domain, integrality and scalar-tower hypotheses. |
| 8 | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:94` | `coeff_bdd_of_norm_le` uses a bound on every conjugate; it is not the sharper sum-of-squares coefficient estimate. |
| 9 | Same file:109, :173 | `finite_of_norm_le` applies to integral elements in a fixed number field; `ComplexEmbedding.lift` supplies extension of embeddings for algebraic field extensions. |
| 10 | `Mathlib/LinearAlgebra/Matrix/PosDef.lean:164` | `PosDef` includes Hermitian symmetry and positivity for nonzero finitely supported vectors; in rank zero that positivity is vacuous. |
| 11 | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` | Covolume uses its specified measure; it does not itself assert the orthogonal-projection quotient theorem. |
| 12 | `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:91` | The closed Minkowski inequality requires nontrivial ambient space, compactness, convexity, symmetry and a lattice fundamental domain. |
| 13 | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:242`, :332, :494 | Discriminant lower bound requires degree >1; the rank bound has a minimum of 1; Hermite finiteness concerns subfields of a fixed characteristic-zero ambient field. |
| 14 | `Mathlib/RingTheory/Ideal/Operations.lean:1301` | Divisibility of principal ideals is equivalent to divisibility of their generators. |
| 15 | `Mathlib/Analysis/Complex/Norm.lean:131` | The norm of an integer cast is its real absolute value; this supports the specialization probe. |
| 16 | `TauCeti/NumberTheory/NumberField/Index/Basic.lean:68`, :108 | Integral primitive elements include the rational generation equation; index uses the order quotient. |
| 17 | `TauCeti/NumberTheory/NumberField/Index/Discriminant.lean:58` | Signed index formula `disc(minpoly)=index²·discr K` on that primitive-element carrier. |
| 18 | `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean:33` and `Separable.lean:50` | Relative discriminant is the norm of the different; the tower theorem retains separability. |
| 19 | `TauCeti/NumberTheory/NumberField/Discriminant/Relative.lean:37`, :43 | Identification with the ideal generated by the signed field discriminant, and the number-field tower identity. |
| 20 | `TauCeti/NumberTheory/NumberField/IntrinsicLabel.lean:72`, :81, :96 | Intrinsic label is degree, real-place count and absolute field discriminant; no fourth index or canonical polynomial is included. |
| 21 | `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:78`, :139, :172, :202 | Coefficient bound, explicit bounded generating family, field count and its elementary count function. The sharper Hunter family does not duplicate that construction. |
| 22 | `TauCeti/NumberTheory/NumberField/WorkedExamples/Cubic23/Invariants.lean:87`; `DedekindCubic/Invariants.lean:48`, :61; `FifthCyclotomic/Invariants.lean:66`, :85 | Field invariants and the index-sensitive Dedekind discriminants are native. These files do not establish canonical root-norm minimization. |

Polynomial maps, monicity, degree, elementary symmetric functions, trace, adjoin and the lexicographic products/lists were also checked through the source audit and the elaborated signatures. The real coefficients of the absolute norms and the signed integer field discriminant are not silently interchanged.

**Ownership and suppliers.** Object searches used `roadmaps grep` on main/open heads, the supplied sibling files, the readable board packages, and the pinned libraries, including searches for root norms, symmetric-mean inequalities, canonical polynomials, Hunter bounds, generating-polynomial bounds, Hermite constants and projected covolumes. Newton identities and algebraic elementary-symmetric APIs were found; these are not the nonnegative-real Maclaurin inequality. No second owner of canonical polynomials or absolute/relative Hunter completeness was found in the readable work. The namespace search located `TauCetiRoadmap.NumberFieldEnumeration` only in this folder.

The following **nine supplier locations** were resolved afresh:

- `Completed/NumberFieldArithmetic/README.md:840` (§3.1), :904 (§3.3), :1092 (§4.1), :1123 (§4.2), and :2140 (§8.1), all on main. The index, relative discriminant and prefix contracts agree. §8.1 explicitly excludes canonical polynomials and complete canonical lists, so this roadmap is not re-planning that completed work.
- `Completed/EffectiveBounds/README.md:123`, Layer 2 on main, supplies bounded generating coefficients and the effective count, as now acknowledged.
- `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, targets 0.2.1, 0.2.2 and 0.3.1 at its open head, read with `roadmaps show`: adapted bases, projected bases with discreteness, and `covolume_projection`. Their full/discrete lattice and rational-subspace assumptions match the saturated integer subfield lattices used here. This supplier precedes NumberFieldEnumeration in the candidate order. The section labels resolve; the former unowned projected-lattice construction is now imported, not re-planned.

For a convention witness across that last boundary, the supplier's adapted basis `(1,1),(0,1)` has Gram determinant `1=2·(1/2)` and covolume quotient `1/√2`. Here the corresponding arithmetic example is `5=2·(5/2)` for `(1,φ)`. The relative arithmetic instance is `1008=12·84`. Thus its Euclidean volume, not a squared volume mistakenly used as a volume, is being consumed.

`LatticePackingsAndPerfectForms` at the supplied open head owns the Hermite constant and its values; it is later and is not used as a supplier. This roadmap instead quantifies over the explicit matrix property. The ArtinRepresentations and BianchiModularForms names occur as prospective consumers, not prerequisite edges; Bianchi's own scope excludes polredabs normalization. Neither creates a supply cycle. The shapes of SuccessiveMinima, completed EffectiveBounds and completed NumberFieldArithmetic on main were compared with this README.

Every `*Needs:*` line and supplier citation was read. The recursive use of §2.3 from §2.2 decreases the absolute degree; it is not a same-degree cycle. There are no declared gaps. The mechanical dependency check, with the supplied candidate order, main content and `--movable`, returned exactly:

```text
depcheck: 204 roadmaps, 1600 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The worktree head was verified as `9f24910c8c3d4cfd9b99ae82d27ccb4a58beddeb`; the outside-folder diff and final worktree status were empty. No computational procedure, restricted-prime shortcut, sorry-valued data, `set_option`, copied source passage or suspicious instruction was found in the two reviewed files.

**Gate.** The worker's supplied gate at this exact head reports all checks zero and `OK`, including dependency, build, outside-folder, stray-file, import, dropped-binder and README-name checks. Direct elaboration was rerun independently as described above. There is no gate failure being waived.

**Seeded source audit.** All six requested sections were checked. The README has no separately flagged unverified locator. Every bibliography work was submitted to the sources service; readable texts remained in its cache. The source readings and version choices are:

| Sampled target | Text/locator read | Assessment |
|---|---|---|
| §1.1 T₂ and coefficient bounds | `lmfdb-polredabs` lines 90–100; pinned Vieta; HLP Chapter II requested | Root-norm convention confirmed. The complex bound is the roadmap's Vieta/triangle/Maclaurin/Cauchy–Schwarz deduction. Its averaging proof has the correct increment and compactness hypotheses. HLP's book text was not certified. |
| §1.2 Canonical defining polynomial | `lmfdb-polredabs` lines 94–102; `pari-guide` lines 19346–19354, §3.13.170, p.466 | All three key coordinates and the negative-sign tie-break agree with the [LMFDB definition](https://www.lmfdb.org/knowledge/show/nf.polredabs). Existence and invariance are deductions, not quotations of a separate source theorem. |
| §1.3 Hunter | `hunter1957` lines 15–39, Theorem 1, p.57; `martinet1985` lines 323–390, Theorem 2.6 p.7 and Corollary 2.9 p.8; lines 438–444, p.9 | Original Hunter theorem is quintic. The [corrected Martinet author version](https://jamartin.perso.math.cnrs.fr/AlgNT/dpp8384.pdf) supplies the general inequality and trace reduction. Formula images were read; the rank and trace factors agree. |
| §2.1 Prime/primitive completeness | Same Martinet corollary and residue discussion; native index formula | Proper intermediate degrees, rather than a further quoted theorem, turn the nonrational Hunter element into a generator. The README now correctly labels this a deduction. |
| §2.2 Composite completeness | `martinet1985` lines 278–290, Proposition 2.3 p.6; lines 323–336, Theorem 2.6 p.7; lines 378–387, Theorem 2.8 p.8; lines 434–444 p.9 | Subfield factor `m'^m`, relative rank `n−m`, trace coefficient `1/m'`, and translation invariance match the page images. Proposition's page is corrected by R04. Candidate finiteness and maximality are explicit additional deductions here. |
| §2.3 Complete lists and prefixes | `jonesroberts2014` lines 190–235, arXiv v1 §3 p.5; `lmfdb-label` lines 90–100; `lmfdb-discriminant` lines 90–100 | [Jones–Roberts](https://arxiv.org/abs/1404.0266v1) provides database-completeness background, not this roadmap's equality. The [label convention](https://www.lmfdb.org/knowledge/show/nf.label) uses the field discriminant. The all-degree equality is a deduction from the preceding layers; prefix acceptance coverage needs R01. |

The Martinet table on printed p.3, `martinet1985` lines 133–140, lists powers `γ_n^n`: the first values are 1, 4/3, 2. They give `γ₁=1`, `γ₂=2/√3`, `γ₃=2^(1/3)≤4/3`, as the README uses. The cover explicitly distinguishes the corrected author version from the published pagination. No published-page equivalence was silently assumed.

## Not verifiable

- **`hlp1952`, Chapter II.** The sources service did not find a legally readable full text. Its precise book locator remains uncertified. The roadmap now gives an independent averaging proof route; that route and the numerical controls were checked without pretending to have read the book.
- **`hermite1850`, pp.261–315.** The sources service did not find a legal readable copy from the supplied bibliographic citation. This is historical background; the numerical constants actually used were verified against Martinet's table.
- **`cohen1993`, §§4.4.12 and 6.4.1; `pohst1982`, §§2–3.** The service classified the DOI citations as uncertified/paywalled. Their contents were not guessed. They are not new missing-text requests; accessible Martinet and the LMFDB/PARI definitions cover the operative formulas and ordering.
- **Global minima in all worked examples.** Root norms, ordering comparisons, coefficient-box counts and the supplied field invariants were checked. Numerical comparisons alone do not certify that every displayed cubic/quartic polynomial is a global minimum over its entire ring of integers. The report does not treat the previous review's computations as a new certificate or the `sorry` build as such a proof.
- **Unprovided work.** Ownership was checked against readable main, the supplied open heads and the roadmap service's searchable index, and readable board packages. No assertion is made about unavailable private/unlisted files or separate board heads whose content was not provided.

The scratch missing-reference record contains only HLP and Hermite. Failed initial fetches that subsequently resolved were removed from it. The review is complete; the unavailable background texts are not used to park it.

## Source issues

- **Misprint** in martinet1985 at the derivation before Theorem 2.8, printed page 8: the source says the complex-idempotent coordinate range ends at s′; it should be r′+s′; affects the proof.
- **Error** in martinet1985 at Theorem 2.8 and Corollary 2.9, printed page 8: the source says an extension contains an integer outside its base, and any degree-n number field contains an irrational integer; it should be restricted to proper extensions and n≥2, respectively; affects a stated result.
