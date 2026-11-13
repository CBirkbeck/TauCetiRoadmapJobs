# Port report: IntegralIwasawaTheoryPartII

Branch: `roadmap/integral-iwasawa-theory-part-ii`.
Head commit: `f3022f4637435f2c768a0e067bf67a7cba84050c`.
Base verified clean at `1d2aa9a` before branch creation. Only `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md`, `TauCetiRoadmap/IntegralIwasawaTheoryPartII/Suggested.lean` and `TauCetiRoadmap/IntegralIwasawaTheoryPartII/metadata.toml` are committed. No push or GitHub write was made.

## Validation

Command: `lake build TauCetiRoadmap.IntegralIwasawaTheoryPartII.Suggested`.
Exact outcome: `Build completed successfully (18239 jobs).`
Warning count: **1**, `declaration uses sorry` at the single theorem. No other final warning. The module header uses `module`, a single root `public import Mathlib`, and `public section`; the public qualifier keeps the statement exported under the pinned module system and avoids the legacy-import warning. There are no Tau Ceti imports, definitions, instances, examples, options or audit commands in the final Lean file.

The exact push gate was run before commit: all content checks were zero and the only failure was its clean-worktree check, which rejects staged additions too. The same prescribed command was rerun on the committed clean tree.

```text
gate IntegralIwasawaTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency command: the prescribed `gate --depcheck` invocation with this README, name, merge order, `--movable` and content checkout. Full output:

```text
depcheck: 216 roadmaps, 1909 edges, 0 problem(s)
```

No UPWARD or CYCLE line, no merge-order edit, and no later supplier was introduced. `git diff --check` passes. The top-level roadmap list and pins are unchanged.

## Draft pull request body

Extend IntegralIwasawaTheory to the Gross–Stark leading-term theorem over every totally real field and at every prime, including 2 and characters ramified above p. The roadmap builds the signed regulator, the integral Eisenstein-cocycle lower bound, cyclotomic cohomology, weight-one families, infinitesimal Hecke quotients and their Galois classes, then compares determinants; it distinguishes the proved leading-term identity from the higher-rank order conjecture. These interfaces support subsequent p-adic Stark and Brumer–Stark work.

The exact supplier contracts retain the accepted extensions for dyadic and p-ramified Hilbert families and localizations, weight-one forms, and the all-degree family representations.

AI-assisted port and mathematical self-review with Codex (GPT-6).

## Dependencies still in open roadmap work

- IntegralHeckeAndGaloisDeterminants: §§1.3–1.4 and 4.1.
- IntegralIwasawaTheory: Conventions and §§0.1, 4.2, 6.0, 6.3, 9.3; §12.6 is an ownership boundary, not a new construction here.
- NoncommutativeAndEquivariantIwasawa: §F.5 and the explicit extensions in the supplier contracts.
- ArithmeticGaloisDuality: §§R02.1.3, R02.2.3, R02.3.3, R02.4.2–R02.4.3, D7.6–D7.7.
- DirichletPadicLFunctions: §0.6.
- PadicFamilies: §§5.9a–5.13 and the explicit localization extensions.
- OrdinaryAutomorphicFormsAndModularityLifting: §2.12(a)–(b) and its explicit extensions.

ClassFieldTheory, Chebotarev, LFunctions, ModularForms and SchemeAndStackFoundations are consumed from main. Only an open revision defines: **none**. No cited section is renumbered, no original numbered heading is dropped, and no old-to-new map is needed.

## Accepted decisions and preserved detail

The accepted review has no outstanding findings or separate non-blocking requests. Its five conditional gaps are retained, as are the three more detailed reversed-family/weight-one contracts in the package. None is disguised as an implemented declaration or removed by restricting the theorem to good primes. The review report's statement that Lean has no declarations describes an older file: the supplied package has one theorem, which this port retains.

All **54** original numbered targets, **26** Checks blocks, all API facts except supplied duplicates, the five worked examples, source corrections, exact supplier contracts and six layer endings are retained. Every definition with an API has at least three Checks. The phrase `API:` is changed to prose, `The API includes:`. Metadata remains `topic = "math.NT"`.

## What moved from Lean to the README

Nothing. The package's one theorem is the general Spiess edge isomorphism, a deep homological input statable on native carriers. It remains the acceptance test. The docstring names every other headline and its missing Deligne–Ribet, normalized logarithm, cocycle, ordinary-family or Hecke-algebra carrier. No scalar identity, API lemma or computed example was added to Lean in its place.

## Mechanical signature audit

A scratch `SignatureAudit.lean` contained the final theorem and `#check @TauCetiRoadmap.IntegralIwasawaTheoryPartII.isIso_coinfNatTrans_app_of_isZero_groupHomology_res`. To obey the prescribed Lean-command restriction, its contents were temporarily elaborated through the same roadmap module and the exact module-specific `lake build` command, then restored and rebuilt without the check. Its elaborated type was:

```lean
∀ {k G : Type u_1} [CommRing k] [Group G]
  (S : Subgroup G) [S.Normal] (A : Rep.{u_1, u_1, u_1} k G),
  (∀ q : ℕ, 0 < q → CategoryTheory.Limits.IsZero
    (groupHomology (Rep.res S.subtype A) q)) →
  ∀ n : ℕ, CategoryTheory.IsIso
    ((groupHomology.coinfNatTrans k S n).app A)
```

Every needed binder is present, including the arbitrary coefficient ring, normality and all positive degrees of restricted homology. No binder or mathematical statement changed. The README now explicitly records the common universe and arbitrary-ring scope. The scratch `#check` is absent from the committed file.

## Supplier replacements and duplication removals

Removals are recorded in the README only in Scope and ownership.

- The generic S-unit group and its equivalence with S-integer units use Mathlib `Set.unit` and `Set.unitEquivUnitsInteger`, `Mathlib/RingTheory/DedekindDomain/SInteger.lean` lines 108 and 124. The underlying valuation and kernel use `Set.unitValuation` and `Set.unitValuation_ker`, `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` lines 105 and 130. Rational surjectivity uses `TauCeti.finiteIndex_range_unitValuation`, `TauCeti/RingTheory/DedekindDomain/SInteger/Rank.lean` line 108. Sections 0.2–0.3 now specify the character/minus adapters instead of a second generic construction. The valuation sign is pinned by additive order 1 versus native exponent −1.
- Degree-zero homology is supplied by Mathlib `groupHomology.H0Iso`, `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean` line 849. Its separate target assertion is deleted.
- Free/induced positive-degree vanishing uses `groupHomology.isZero_indBot_succ`, `groupHomology.isZero_res_indBot_succ` and `TauCeti.groupHomology.isZero_res_leftRegular_succ`, `TauCeti/RepresentationTheory/Homological/GroupHomology/Induced.lean` lines 49, 59 and 70. The target is recentered on the genuinely additional flat-coefficient extension, already requested by the package API, and the general edge isomorphism. The latter does not appear in either pinned library.
- The library near-matches were read: `groupHomology.indIso` and `groupCohomology.coindIso` are Shapiro statements, not the normal-quotient edge theorem; `groupHomology.opcyclesIso₀` and `groupHomology.H0Iso` are degree-zero statements; `Rep.resOfQuotientIso` concerns an action factoring through a quotient. None proves the retained all-degree headline.
- The elliptic Eisenstein decomposition remains supplied by Tau Ceti and ModularForms §0.1; the kept general totally-real primitive-pair complement extends it. No new copy of the primitive two-character series, family module, GMA theory or determinant uniqueness is introduced.
- IntegralIwasawaTheory §12.6 owns the smoothed integral Rubin–Stark lattice and exterior order map. This roadmap owns the rational unsmoothed character-space regulator and all-prime leading term. Scope explicitly distinguishes them.

The citation tool's determinant-name lead is a false positive against Lean alone: `Determinant.eq_of_charpoly_frobenius` is explicitly a target of IntegralHeckeAndGaloisDeterminants §4.1 at the readable head. Its statement requires continuous determinants, Hausdorff coefficients and dense conjugates of Frobenius representatives, exactly the contract consumed here. No replacement name was invented.

Ownership was searched by mathematical objects through the prescribed `roadmaps grep` tool over main and all indexed open heads, and through the supplied board packages. The nearest scopes read were IntegralIwasawaTheory, NoncommutativeAndEquivariantIwasawa, PadicFamilies, OrdinaryAutomorphicFormsAndModularityLifting, EulerSystemsCyclotomicMainConjecture, IntegralHeckeAndGaloisDeterminants and main PadicMeasuresIwasawaAlgebras. Their cyclotomic/main-conjecture, generic measure, family and determinant constructions are supplied; none owns the retained Gross–Stark regulator, integral Sczech cocycle, Spiess group-homology edge theorem or the three specialized Hecke quotients. Continuous Hochschild–Serre in ArithmeticGaloisDuality concerns cohomology and does not duplicate this arbitrary discrete-group homology theorem. Singular cap products in the topology roadmaps are likewise different carriers. No declaration shares another roadmap's fully qualified name. No generic ownership was moved from a later roadmap. No second copy or dropped cited id was found.

The live citation tool refreshed its shared index during this job; its negative search result was treated only as a lead. Pin claims were checked in this worktree, whose Mathlib revision is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti revision is `2fd255d997f47c0b5d834ee416c7015d55444ce5`. No dependency was taken from a newer library. Zulip and open Mathlib searches for the homological object found no usable replacement; the native S-unit API already adopts the upstream design noted in its source.

## Mathematical fixes from the final upstream-style reread

1. **Shifted scalar action, §2.2b.** Unshifted Λ-linearity was false. It is semilinear for `a(T) ↦ a((1+T)u⁻¹−1)` from the weight-zero localization to the weight-one localization. With `p=5`, `u=6`, `a=T`, the scalar at weight one is `−5/6`, whereas unshifted T gives 0. Added this negative-control Check. The affine shift is DKV16 line 578.
2. **Formal versus arithmetic unequal orders, Layer 3, Layer 5 Examples and Worked examples.** The algebra with `r=t=1,s=2` exists and has dimension 3; no arithmetic datum has these orders once §5.8 is proved. Both example passages now say this explicitly and retain the two-filtration calculation. DKV16 line 146 states rank-at-most-one regulator nonvanishing.
3. **Rank-zero quotient, §3.1.** The assertion that an empty top product always gives the zero ring missed `s=0,a=−1`: its relation is 0=0 and the quotient is E. The arithmetic rank-zero choice `s=0,a=1` gives 2=0 and the zero ring; `s≥1` gives an invertible nilpotent. The Check now separates these cases.
4. **Edge-map scope, §0.7.** The API's full-subgroup vanishing conclusion explicitly retains the positive-degree vanishing hypothesis. For the trivial representation of ℤ it would otherwise assert ℂ_p=0 in degree one. This changes no Lean binder.
5. **Native prerequisites, §§0.2–0.3 and 0.7.** The S-unit and induced-homology supplier replacements above remove duplicate generic work while preserving the character adapters and flat-coefficient extension. A flat localization ℚ[t,t⁻¹] has H₁=0, H₀=ℚ; the trivial ℤ/2 coefficient has H₁=ℤ/2. Added the discriminating flatness Check.
6. **Layer 2 dependency prose.** Its analytic invariants come from Layer 0, not Layer 1; removed the unnecessary Layer 1 prerequisite without changing any target.

7. **Local reciprocity locator.** ClassFieldTheory has no §2.6 for the cited unit formula. Its Layer 7 cyclotomic-normalization paragraph states the exact norm-inverse identity; replaced the stale parenthetical by that locator. The same identity exists at the pin as `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit`, `TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean` line 311; added it and the norm adapter in `TauCeti/NumberTheory/ClassFieldTheory/Local/Cyclotomic.lean` line 271 to the native supplier contracts. No open revision is needed.

No theorem is narrowed in p, degree, character conductor or rank. No higher-rank regulator nonvanishing is asserted.

## Sources checked and limitations retained

Five legal PDFs were fetched read-only, converted to text for exact locators, and their SHA-256 hashes matched all five corresponding entries in the accepted manifest. Source line locators below refer to those extracted versions.

| Source | Exact locator read | What was checked |
| --- | --- | --- |
| DKV16 line 144 | Theorem 1, p. 837; introduction pp. 834–837 | Leading term, odd character, all primes, rank-at-most-one nonvanishing and distinction from order conjecture |
| DKV16 line 578 | §3.2, p. 848, weight shift | Affine substitution and semilinear scalar correction |
| DKV16 line 608 | Theorem 3.2, p. 849 | Published existence lacks the normalization explicitly retained from the preprint in the accepted package |
| CD14 line 1364 | Theorems 5.1–5.2, Lemma 5.3, pp. 30–31 | Edge map, freeness and the three-term augmentation identity; the free-module homological-dimension wording at CD14 line 1405 is corrected |
| DDP11 line 970 | Proposition 2.3, pp. 462–463; Proposition 2.7 at DDP11 line 1151 | The opposite printed exponents and the retained conductor normalization; numerical witness 1/64 versus the erroneous factor16 |
| V15 line 538 | Theorem 2, p. 14; construction at V15 line 687, §§4.1–4.2 | Constant-weight-zero family, small-disc nature, dyadic exponent and level removal |
| Lin12 line 234 | Proposition 3.2 and Theorem 3.3, p. 6 | Primitive-pair new/old decomposition and the strict agreement-density threshold |

The four accepted locator-only sources remain locator-only: Sc93 Theorem 4, W86 Proposition 1.5, AL13 Proposition 3.11/Theorem 3.6, and Br82 Chapters III §6, V §3, VII §6. No paywalled full text is claimed read. Br82 Chapter III §6 is also the locator used by the pinned induced-homology module. Their accessible restatements and the elementary homological argument were checked; this does not certify the original full hypotheses. The preprint normalization is retained as accepted rather than represented as present in the published theorem.

## Unresolved

The five accepted supplier gaps remain explicit: `dyadic-hilbert-coefficient-families`, `dyadic-hilbert-hida-localization`, `hida-family-representations-all-degrees`, `p-ramified-hilbert-coefficient-families`, `p-ramified-hilbert-hida-localization`. The package also spells out `reversed-ordinary-eisenstein-family`, `weight-one-hilbert-forms-and-products` and `weight-one-hilbert-eisenstein-series`; these contracts are preserved. Supplier heads still have the narrower domains recorded in the README, so their extensions remain a condition of the accepted design, not a claim of completed implementation. Source-access limits are recorded above. There are no unresolved port-format, binder, build, dependency-direction or gate failures.

## Computed adversarial mathematics pass

These are self-review computations, not proofs of the admitted theorem. Each row identifies an assertion (including defining laws and API assertions); shared computations are repeated where used. Formal Artin-algebra tests do not assert the existence of Hida families with assigned orders. The standing field E has characteristic zero, even at p = 2; a zero ring and positive-characteristic coefficients are tested only for the general group-homology statement. Exact rational arithmetic and modular witnesses were recomputed in scratch; the homological calculations use the cyclic two-term resolution and Shapiro, read at the pins.

| Statement | Instances tried | Computed values on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: total oddness and CM quotient | χ₄ over ℚ; trivial character | χ₄(c) = −1 and H = ℚ(i); trivial χ(c) = 1 and H = ℚ | Trivial character fails total oddness | None |
| Conventions: coefficient inverses | E = ℚ₂; characteristic 2 alternative | 2·(1/2) = 1 in ℚ₂; 2·x = 0 in characteristic 2 | Dyadic coefficient field remains characteristic zero | None |
| Conventions: ramified Frobenius value | χ₄, p = 2, 3, 5 | χ(p) = 0, −1, 1; r = 0, 0, 1 | Ramified value must be 0 | None |
| Conventions: reciprocity direction | μ₅ over ℚ₂; unit 2 over ℚ₅ | Art₂(2) exponent 2, rec₂(2) exponent 3; rec₅(2) exponent 2, Art₅(2) exponent 3; 2·3 = 1 mod 5 | Inverse conventions agree | None |
| Conventions: logarithm and Teichmüller sign | p = 2, x = −1; p = 3, x = 9 | ω(−1) = −1, angular part 1, log 1 = 0; log₃ 9 = 2 log₃ 3 = 0 | Keeps dyadic sign and log(p) = 0 | None |
| Conventions: topology | ℤ_p → ℚ_p, trivial action | Inclusion sends 1 to 1; every continuous map to discrete torsion-free coefficients sends 1 to 0 | Discrete replacement loses classes | None |
| Conventions: empty determinant and positive rank | r = 0, 1 | det(empty) = 1; det((2)) = 2 | Empty regulator equals 1 | None |
| 0.1 exceptional partition and inverse character | ℚ(i), p = 2, 3, 5 | (R,R′) has sizes (0,1), (0,1), (1,0); χ⁻¹ = χ gives the same sizes | Split iff exceptional for faithful χ | None |
| 0.1 coefficient extension and excluded even character | ℚ₅ ⊂ E′; nontrivial even quadratic χ | Rank 1 stays 1 after extension; even χ has L(χ,0) = 0 rather than D ≠ 0 | Oddness needed | None |
| 0.2 native S-unit carrier | ℚ, S = {5} | Units ±5ⁿ; ord₃(5) = 0, ord₅(5) = 1; native multiplicative valuation exponent −1 | Native carrier and additive sign agree | Cite Set.unit and supplied valuation map |
| 0.2 minus and character projectors | C₂ over ℚ₂ | e = (1−c)/2; e² = (1−2c+c²)/4 = e; e(1+c) = 0 | Rational projector works also at 2 | None |
| 0.2 valuation/logarithm source and target | u = (2+i)/(2−i), p = 5; torsion i | Divisor of u is (1,−1), c(u) = u⁻¹; i has divisor (0,0) and log i = 0 | Both maps land in minus components | None |
| 0.2 equivariance, prime lifts and scalar change | u and c(u); E ⊂ E′ | Valuations 1 and −1; logs λ and −λ; eχ[𝔓] has coefficients (1,−1); scalar extension keeps (1,−1) | Common row factor is −1 | None |
| 0.2 nonexceptional permutation component | C₂ with decomposition group C₂ | eχ(1+c) = 0; split orbit has eχ(1−c) = 1−c | Nonsplit χ-part has dimension 0 | None |
| 0.3 valuation isomorphism and determinant | ℚ(i), p = 5; r = 0 | O = (1), determinant 1; zero-space map has empty determinant 1 | Rational isomorphism includes rank zero | Use finiteIndex_range_unitValuation for surjectivity |
| 0.3 ordinary-unit kernel and restricted support | ℚ(i), p = 3,5 | Ordinary units μ₄ tensor E = 0; p=3 gives Xχ = 0; p=5 supported split divisor (1,−1) spans a line | Minus kernel 0; restricted units span | Cite unitValuation_ker |
| 0.4 determinant sign | O = (2), L = (3) | det(−L)/det O = −3/2, versus unsigned 3/2 | Sign discriminates definitions | None |
| 0.4 basis, lift and permutation invariance | O = diag(2,3), L = diag(5,7), P = diag(4,1) | 35/6 = 140/24; swapping rows negates numerator and denominator; conjugating first row multiplies both by −1 | Ratio invariant; conjugate composite has same determinant | None |
| 0.4 singular and empty logarithm matrices | Equal logarithm rows; r = 0 | det L = 0 gives regulator 0; empty ratio 1/1 = 1 | Does not assume regulator nonvanishing | None |
| 0.5 divided Taylor coefficient | f = 6Ds², r = 2 | f″(0) = 12D; f″/(2!D) = 6 versus 12 without factorial | Correct normalization | None |
| 0.5 first term versus rank term | f = Ds³, r = 2; f = 0 | Rank coefficient 0, first coefficient 1, order 3; zero series order ⊤ | Nonzero-germ condition essential for finite sχ | None |
| 0.5 Dχ and transport | χ₄ at p=2,3 | L(χ₄,0) = 1/2; D₂ = 1/2, D₃ = (1+1)/2 = 1; embeddings fix these rational values | Denominators nonzero | None |
| 0.6 Q-domain and polynomial action | n=1 empty/singleton; n=2 irrational form | Empty cutoff contains all integers and absolute harmonic sum diverges; singleton cutoff finite; (X₁+√2X₂)(a,b)=0 for rational a,b implies a=b=0 | Nonempty tuple independent of n | None |
| 0.6 smoothing integrality | F=ℚ, ℓ=3, k=0 | (1−3)ζ(0) = (−2)(−1/2) = 1 | Refined smoothed object has integral value | None |
| 0.6 distribution and scaling independence | One-dimensional dilation 3 and its inverse | λ=1 gives 3x; λ=3 for inverse gives x, and α(3v)(3U)=α(v)(U) | Scaling law identifies choices | None |
| 0.6 measure-action domain | n=1, ℓ=5, p=3 | 3 and 1/3 are units in ℤ[1/3]; 1/2 is not; no 3ʲ/2 is integral | Restrict action to Γℓ,p | None |
| 0.6 full-weight interpolation versus principal branch | F=ℚ, p=3, ℓ=2, k=1 | (1−4)(1−3)ζ(−1)=−1/2; principal branch has dense even-weight values 0, hence value 0 | Branches differ | None |
| 0.6 smoothing factor as a germ | χ₄, p=2, ℓ=3 | h(0)=1+3=4; h(1)=1+3/(−3)=0 | Unit at 0, not a global analytic unit | None |
| 0.6 moment and degeneracy laws | P=1; singular first-column matrix | Zeroth moment is Ψℓ(A,1,Q,v); singular data give both moment and measure 0 | Normalization and zero model separated | None |
| 0.7 cap balance | Scaling u=2, m=6, λ=id | (uλ)(6)=3=λ(u⁻¹6), while wrong action gives 12 | Must use contragredient | None |
| 0.7 nonabelian action | S₃, u=(123), m=e₂, λ=e₁* | λ(u⁻¹e₂)=1; λ(ue₂)=0 | Inverse law matters beyond abelian groups | None |
| 0.7 boundary/evaluation and degree zero | q=0, invariant λ; q=1 cycle [g,h] with trivial scalar coefficient | λ(gm−m)=0; on boundary [h]−[gh]+[g], homomorphism gives λ(h)−λ(gh)+λ(g)=0 | Evaluation descends | None |
| 0.7 flat vanishing | k=ℤ, S=ℤ, M=ℚ[t,t⁻¹]; M=ℤ/2 trivial | ker(1−t)=0, cokernel ℚ; trivial ℤ/2 gives ker = ℤ/2 | Flat extension is broader than regular free example | Cite native induced cases; keep flat target |
| 0.7 edge map: trivial/full subgroup | S=1; S=G=ℤ with regular coefficients | Identity in all degrees for S=1; for full subgroup H₀=k→k identity and Hₙ=0→0 above | General edge statement includes both | Explicitly qualify API by vanishing hypothesis |
| 0.7 edge map negative control | G=S=ℤ, trivial M=ℂ_p | H₁=ℂ_p→0; kernel ℂ_p | Fails without positive-degree vanishing | None |
| 0.7 edge map: proper normal subgroup | S₃, S=A₃, M=ℂ_p[S₃] | Coinvariants ℂ_p[C₂]; H₀=ℂ_p on both sides, Hₙ=0 above | No commutativity assumption on G | None |
| 0.7 edge map: nonzero higher homology | G=ℤ×ℤ, S=second factor, M=ℂ_p[S] | Both H₁=ℂ_p; omitting coinvariants yields ℂ_p[S], infinite dimensional | Correct target carrier | None |
| 0.7 edge map: zero cases and normality | k=0; M=0; S=⟨(12)⟩ in S₃ | Zero coefficients give Hₙ=0→0; conjugating (12) by (123) gives (23) outside S | Zero cases true; nonnormal quotient excluded by binder | None |
| 0.8 function-space support | One shell and one inner ball | Shell indicator 1−0=1; inner indicator 1−1=0; logarithm times shell vanishes near exceptional zero | Stated function space contains primitive | None |
| 0.8 augmentation identity and correction degree | g=ℓ², ℓ=5, c=2 | Dg=25−9=16; inner RHS 16−16+0=0; shell RHS 25−16+16=25; correction degree 1<2 | Three-term identity required | None |
| 0.8 arithmetic cross shift | ℚ(√5), p=11, √5=48 mod121 | 48²=5, 52¹⁰=100, log₁₁52=22, c=4·22=88 mod121 | Cross shift nonzero | None |
| 0.8 corrected two-coordinate primitive | (π₁,1); (1,12) | Corrected values 88−88=0; log₁₁12=11 mod121 | Both sides agree; uncorrected value 88 fails | None |
| 0.8 all-prime order bound | r=0; r=1,k=0; f=s²,r=1 | No coefficient condition for r=0; shell primitive kills constant term; order2≥1 | Inequality permits higher order | None |
| 0.9 boundary iff | f=Dsʳ and f=Dsʳ⁺¹ | Orders r,r+1; normalized rank coefficients 1,0 | Both implications agree | None |
| 1.1 restricted classes and coboundaries | Zero class; χ=-1, v=1 | Zero restrictions 0; coboundary χ⁻¹−1=−2 outside R but class 0; inside R coboundary function 0 | Condition must be on classes | None |
| 1.1 local o,ℓ independence and functoriality | ϖ and 1+p² in ℚ_p; V=E² | Values (1,0) for o; ℓ(1+p²)≠0 with o=0; two coordinate copies give (κ₁,κ₂) | Independent pair and direct-sum law | None |
| 1.2 Kummer limit order and local unit condition | Finite class group C_p; local uniformizer/unit | C_p⊗ℚ_p=0 but C_p/pC_p=C_p; unramified evaluation gives 1 on ϖ,0 on units | Limits before rationalization; units annihilate unramified classes | None |
| 1.2 cup order | x=−3,y=2,O=2,L=3 | Evaluation −6+6=0; reversed cup order gives 6−6=0 | Universal sign cancels globally | None |
| 1.3 Poitou–Tate orthogonality | Same rank-one data; r=0 | xO+yL=0; empty sum 0 | Includes zero rank | None |
| 1.4 reciprocity orthogonality | C₂ acting on minus unit u | χ(c)κ(cu)=(−1)κ(−u)=κ(u); sum 2κ(u)=0 gives κ(u)=0 over ℚ₂ too | Rational averaging legitimate | None |
| 1.5 inertia injection | Finite class group exponent m; R empty | m f(g)=f(gᵐ)=f(1)=0, hence f(g)=0; H¹∅=0 | Torsion-free coefficient hypothesis used | None |
| 1.6 cyclotomic coordinate extraction | Local 2o+3ℓ; all y=0 | Coordinates (2,3); if y=0 inertia restriction 0 and global class 0 | Wrong coordinate order gives (3,2) | None |
| 1.7 cyclotomic dimension | r=0,1,2; O=2,L=3 | 2r−r = 0,1,2; x=−3y/2 solves xO+yL=0 uniquely for every y | Logarithmic coordinate isomorphism | None |
| 1.8 invariant and basis change | X=diag(2,5),Y=diag(3,7); r=0 | 10/21=40/84 after common scaling; empty ratio1 | Invariance and normalization | None |
| 1.9 regulator comparison | O=diag(2,3), L=diag(5,7),Y=I | X=diag(−5/2,−7/3); XO+YL=0; detX/detY=35/6=det(−L)/detO | No extra sign | None |
| 2.1 coordinate and universal character | k=1+h; σ with cyclotomic value −1 at2 | π=h+O(h²), T=log(u)h+O(h²); ε(σ)=1 | Derivative normalization fixed | None |
| 2.1 leading coefficient transport | f=cs and f=as² | f(1−k)=−ch and ah²; π-leading coefficients −c,a | Sign (−1)ˢ correct | None |
| 2.2 weight-one stabilization | χ₄,p=5, prime powers 5ʲ | Unstabilized coefficients j+1=1,2,3; stabilized all1; U−1 gives1 then (U−1)² gives0 | Modulus changes encoded | None |
| 2.2 modulus-one constant convention | L(χ,0)=L(χ⁻¹,0)=1/2, λ=1 | Two-term constant (1/2)(1/2+1/2)=1/2 versus single1/4 | One-term formula excluded at modulus1 | None |
| 2.2a primitive-pair indexing and shifts | ℚ,level8,k=4 | Coefficients at1,2,4,8: 1,9,73,585; translate matrix triangular diagonal1, determinant1; imprimitive two pairs give same E−9B₂E+8B₄E | Primitive indexing prevents duplicates | None |
| 2.2a level-change composition | f coefficient1 at1; B₂B₃ vs B₆ | Both first nonzero coefficient at6 equals1; at1 both0 | Source/target and multiplicative index agree | None |
| 2.2a weight-two exception | ℚ,level11,k=2 | Corrected Eisenstein dimension1, cusp dimension1, total2; two uncorrected translates give false Eisenstein dimension2 | Supplier handles elliptic exception | None |
| 2.2a prime eigenvalues and density | Level25, quadratic ξ mod5,k4 | Eigenvalues9,−9 at2; both1332 at11; disagreement2/4=1/2 | Bound non-strict; distinct pairs essential | None |
| 2.2a U action and ordinary tame multiplicity | Level6,k4,p2; level4,k3,p2 | g and B₃g columns (1,28),(0,1), determinant1; both U₂=1; E₃(χ₄,1) has U₂=4 | Ordinary dimension2 at tame3,0 for ramified first character | None |
| 2.2a local characteristic polynomial | k4,q2,m1 and m2, η=φ=1 | (X−1)(X−8)=X²−9X+8; m2 adds factorX | Exactly one unit root per tame translate | None |
| 2.2a constants and imprimitive formula | k4,q2, trivial chars | (1−B₂)(1−8B₂)E=E−9B₂E+8B₄E; constant factor (1−1)(1−8)=0 | Constant-zero series need not be cuspidal | None |
| 2.2b shifted products and regularity | g=θ²/4; k2, weight-one localization | g coefficients1,1,0,1,2 and constant1/4; ν₂(d₂)=0; ν₁(d₂)=−5 or−4 | Product and killed exceptional weight correct | None |
| 2.2b scalar law | a=T, p=5,u6, weight1 | Shifted scalar1/6−1=−5/6; unshifted T value0 | Ordinary unshifted linearity false | Replace by semilinearity; add Check |
| 2.2b constant multiplication | χ₄ and auxiliary constant1 | Constant1/4·1=1/4; wrong modulus-one constant leaves −ℒχ/2 | Correct product normalization | None |
| 2.3 small disc | p5,u6,r2,w20 | v₅(6ᵏ−1)=1+v₅(k); disc weights25ℤ₅; k20j in disc iff5 dividesj; 8 divides20j iff2 dividesj | Small disc not full family space | None |
| 2.3 weight shift and constant normalization | a=1+g₀; ν₀ and ν₁ | ν₀(a)=1, ν₁(a)=2−u⁻¹; leftover constant −2⁻ᵈu⁻¹Tℒχ | Divide by unit a, not merely normalize at a point | None |
| 2.3 ordinary projector and separating denominator | Constant tuple; η(λ)=−1,Nλ=3 | U(1)=1, e(1)=1; ν₀(dη)=2(1+1/3)=8/3≠0 | Zero family and zero denominator excluded | None |
| 2.4 valuation case split and inversion | s−t=1,0,−1; w=−1 | Inverted valuation−1,0,1; w=-1 has valuation0 | Case2 includes−1, Case3 has w0 | None |
| 2.4 conductor correction | χ₄,p5, n4,k3 | W specialization angular4²=16; missing factor leaves1−16=−15 | ε(n) required | None |
| 2.4 inverse orientation with conductor | χ=χ⁻¹, ε(n)≠1 | W=ε(n), inverse-character expression ε(n)²/W=ε(n) | Bare inversion would give ε(n)⁻¹ | None |
| 2.5 semi-cusp constants | d1,D1/2,G constant1 | ℒχ/2−(1/4)ℒχ/(1/2)=0 | Constants cancel identically | None |
| 2.5 leading correction and specialization | s1,s2; w−1 | Correction −aπ,+aπ²; specialization(1+w)E₁=0 | Vanishing specialization allowed | None |
| 2.5a tame cusp exponent | ℚ,n4,p5,k3 | φ(4)⁻¹4⁻³=1/64=4⁻¹angular4⁻²; reciprocal coefficient factor16 | Printed opposite exponent fails | None |
| 2.5a nonordinary cusp cancellation | n4,p5,k5,L(χ₄,−4)=5/2 | c=5κ/1024; E−B₅E constant0; E−625B₅E constant−624c | Ordinary projector preserves relevant constants | None |
| 2.6 normalized projection | Level11,k2,T₂ | Eisenstein eigenvalue3, cusp−2; T₂−3 gives0,−5; t=0 gives tE₁=0≠E₁ | Normalization excludes zero operator | None |
| 2.6 minimal tame level | n≤a+b≤n−t, n=2 | t≥0 forces t0 and a+b2; at extra tame level3 two ordinary translates survive | Multiplicity reduction uses actual minimal level | Remove unrelated Layer1 dependency |
| 3.1 W₁ relations and universal specialization | a2,r=s1 | ε=2π, π²=0; ε²=πε=0; top ε−2π=0 | Dual-number model satisfies all relations | None |
| 3.1 excluded empty product | r0,s1; arithmetic s0,a1; formal s0,a−1 | 1−aπ with nilpotent π forces0 ring; rank-zero relation2=0; a−1 gives0=0 and quotient E | Unqualified zero-ring claim false at formal exception | Split the cases explicitly |
| 3.2 W₂ relations and w−1 | a2,r=s1,w1 or−1 | At1: y=π/2, ε=π; at−1: π0, ε=−2y, z=−y≠0 | No division by1+w uniformly | None |
| 3.3 W₃ relations and sign | a2,b3,r=t1,s2,c−2/3 | y=−2π²/3, ε=−2π²=3y | Both top-product formulas agree | None |
| 3.4 W₁ basis and filtration | r2,s3; r1,s2 | Dimension4+3−1=6; ε=−aπ², π nonzero mod m² | Degree-r line survives | None |
| 3.5 W₂ basis and z identity | r2,s3; πy=y² | Dimension4+6−2=8; (π−y)²=π²−y²; yz=0 | Correct count and signs | None |
| 3.6 W₃ two filtrations | r=t1,s2,c−2/3 | Dimension3; y∈m², image0 in m/m²; yW/y²W=E·y has dimension1; my=0=y² | Filtrations cannot be exchanged | None |
| 3.7 orbit and denominator | χ(q)=1 or−1, log angular Nq=L≠0 | Denominator residues0 or2L; Y²−πY=0 | Auxiliary prime must have χ(q)≠1 | None |
| 3.8 Hecke image, Case1 | r=s1,a2 | W₁ dimension2; U_p=1+2π, (U_p−1)²=0 | Correct image generator and nilpotence | None |
| 3.9 Hecke image, Case2 | r=s1,w1 or−1 | At1 tame U=1+Lπ/2; at−1 z=−y≠0 with π0 | Tame U is not always1 | None |
| 3.10 Hecke image, Case3 | r=t1,s2,c−2/3 | Y=−2π²/3, Y²=0; elimination threshold2s−t=3=s+1 | Stronger truncation holds | None |
| 4.1 representations and residual characteristic | Complex conjugation, p2 | det−1, trace0, eigenvalues±1 in E; modulo dyadic uniformizer both become1 | Height-one residue E must be retained | None |
| 4.1 finite completion versus field factors | y²=T²(T+p), √p∈E | Two roots ±T√(T+p) in E[[T]]; total quotient has2 fields for1 original domain | No claimed family/factor bijection | None |
| 4.1 determinant character and closedness | Frobenius with angular norm logarithm L≠0 | χε=χ+χLπ modπ² versus χ; reduction1+χ agrees | Continuity plus closed coefficient image needed | None |
| 4.2 simultaneous line avoidance | Diagonal τ with χ(τ)=−1; ordinary line(1,1) | Eigenlines (1,0),(0,1); line(1,1) differs from both; residual eigenvalue difference−2 is a unit in E | Valid also at2 | None |
| 4.3 upper cocycle normalization | χ(σ)=χ(τ′)=−1, κ(σ)=1, κ(τ′)=2 | κ(στ′)=1−2=−1; unnormalized b values−1,−2 give b(στ′)=−1, not bσ+χ⁻¹σ bτ′=1 | χ⁻¹ twist required | None |
| 4.3 coboundary and finite module | χ(τ)=−1; B=(x,y) in E[[x,y]] | κ(τ)=−2v=0 impliesv0; dim B/mB=2 | Normalization kills coboundary; rank-one freeness unwarranted | None |
| 4.4 infinitesimal characters | Identity; y0; yz0 | ε_y(1)=1; y0 gives ε_y1,ε_zε; (1+Ly)(1+Lz)=1+Lπ | Starts at degree0 and product law holds | None |
| 4.4 substitution negative control | E[y′,z′]/(y′²,z′²), ε(X)=(1+LX)² | Cross coefficients4L² versus2L²; difference2L²y′z′≠0 | yz0 essential | None |
| 4.5 diagonal recovery | χ(τ)=−1, ψ₁τ1, ψ₂τ−1 | System determinant−2, inverse−1/2 in ℚ₂ too | Full traces determine diagonal entries | None |
| 4.6 local comparison and units | Ordinary line(A,C)=(2,3), eigenvalue7 | With a1, b=(2/3)(7−1)=4; with d5, c=(3/2)(7−5)=3; row equations2+12=14 and6+15=21 | Ratios have correct orientation | None |
| 4.7 local triviality and torsion | χ=-1 and α1; finite torsion orderm | κ=(1−χ⁻¹)α=2, coboundary of−1 gives2; mf=0 impliesf0 in E | Class zero although representative nonzero | None |
| 4.8 inertia generation | Quotient class κ=(χ⁻¹−1)v, κτ0 | −2v=0 givesv0; generated quotient Q has Q/mQ=0, henceQ0 | Normalization and Nakayama both needed | None |
| 4.9 second-order bound | r1, A=E[[t]], α=t⁻¹ | αm=A; mB⊆αm²=tA whenB=A | Cancellation belongs to K, not A | None |
| 5.1 exact determinant before specialization | α=(2,3), rows (3,6),(−2,−4) | Weighted row sums0; unweighted det−12+12=0; scaling multiplies det by6 | Exact cancellation precedes quotient | None |
| 5.2 leading determinant | r1,s1,O2,L3 | ε=aπ; (3+2a)π=0 forcesa−3/2=regulator | Sign and coefficient correct | None |
| 5.2 higher-order case | r2,s3,O=I,L=diag(1,0) | detL0, top ε₁ε₂∈m³ is0 in gr²; normalized rank-two coefficient0 | Leading identity permits s>r | None |
| 5.3 lower cocycle and refined ideal | χσ−1, cσ1,cτ′2; W₃ r=t1,s2 | cστ′=1−2=−1; yW=E·(−2π²/3) nonzero although y modm²=0 | Use χ-action and inverse image of yW | None |
| 5.4 inverse determinant | r=t1,s2,a2,b3,O⁻1,L⁻−3 | L⁻y+O⁻ε=−3y+3y=0; ratio−L⁻/O⁻=3=b | y-adic quotient retains needed line | None |
| 5.5 rank-zero interpolation | χ₄,p2 and3 | f(0)=D=1/2 or1; quotient1, empty regulator1, order0 | No Artin algebra needed | None |
| 5.6 Gross–Stark headline sign witness | χ₄,p5, i=68 mod125 | i²=−1 mod125; u/5=21 mod25; log₅u=20 mod25; regulator−20=5 and D·R=15 mod25 | Formula fixes signed prediction; computation does not prove L′ | None |
| 5.7 exact-order iff | f=Dsʳ, f=Dsʳ⁺¹ | (order=r, regulator=1) and (order>r, regulator=0) | Both directions use lower bound and identity | None |
| 5.8 Baker–Brumer rational kernel | u and cu in ℚ(i),p5 | Logs(λ,−λ) have relation(1,1); χ-weighted vector(1,−1)/2 maps toλ | Independence of full list would be false | None |
| 5.8 minus hypothesis | uⁿ=5ᵃζ versus plus unit5 | Valuations(n,−n)=(a,a) force n=a0; plus unit5 has log0,ord1 | Minus hypothesis essential for nonvanishing | None |
| Layer5 and worked unequal-order example | Formal r=t1,s2; arithmetic rank1 | Formal W₃ dimension3 and upper ratio0; arithmetic theorem forces both orders1 | Formal ring exists; arithmetic datum does not | Mark both examples as formal controls |


Pull request: #2267 (roadmap/integral-iwasawa-theory-part-ii at f3022f4)
