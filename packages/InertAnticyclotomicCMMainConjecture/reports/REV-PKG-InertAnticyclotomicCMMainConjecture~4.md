<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13122#issuecomment-6790767820 -->
Review (codex) of 5f390c6

Verdict: needs_changes

1. **F01** (P3) The pinned Selmer carrier also accepts compact and rational coefficients

   **Location:** `packages/InertAnticyclotomicCMMainConjecture/README.md:63`: “has no R-module structure, compact or rational coefficients, or limits”.

   **Claim:** Compact and rational coefficients are outside the domain of the pinned `TauCeti.ContCohomology.SelmerStructure`, and require a supplier extension of the carrier.

   **Witness:** `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:58` requires topological additive coefficient groups and continuous actions, without `DiscreteTopology`. Its `H1` at `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829` likewise accepts ℤ₅ and ℚ₅ with their native topologies.

   For a nonzero test, take G=(ℤ₅,+), trivial action, and M=ℤ₅ or ℚ₅. The continuous cocycle c(x)=x has d¹c(x,y)=y−(x+y)+x=0, whereas every coboundary is zero; c(1)=1. Use one local index, identity group and coefficient maps, and the full local subgroup. This is a valid native Selmer structure containing the nonzero class [c]. With local condition zero its Selmer group is zero. Thus these are actual compact/rational coefficient examples, not merely empty structures. The pinned `H1EquivOfSmulEqSelf` at `LowDegree.lean:1057` explicitly identifies this trivial-action cohomology with continuous homomorphisms.

   **Exact repair:** Replace the quoted inventory sentence by a statement that the carrier accepts arbitrary topological additive coefficient groups with continuous actions, including compact lattices and rational p-adic representations. State the actual missing APIs separately: an R-submodule interface, the intended arithmetic/cohomology topologies and comparisons, propagated signed local conditions, and tower-limit comparisons. Keep those additional comparisons with SelmerIwasawaCohomology; do not plan a second underlying kernel carrier. Calling the particular W-instance in §1.4 discrete remains correct. No new import or theorem in Suggested.lean is needed.

   **Repair test:** For both M=ℤ₅ and M=ℚ₅ the corrected inventory admits the structure above; full and zero identity-localisation conditions give H¹ and 0 respectively. It does not claim that the bare additive `H1` quotient already carries the intended arithmetic topology: `LowDegree.lean:824` expressly distinguishes its pointwise quotient topology from the intended topology. The four arithmetic headlines still lack their signed conditions and/or Rubin L-function.

One P3 finding; no P1 or P2 findings. The five previous repairs pass their original tests. The new finding concerns the description of an existing pinned carrier, not the arithmetic conclusions or the empty acceptance-test file.

## Previous findings, checked first

Locations below are in `packages/InertAnticyclotomicCMMainConjecture/README.md` unless specified. Quotations are repaired roadmap wording, not source passages.

| Round-3 finding | Status | Repaired passage and test |
|---|---|---|
| F01: unsupplied field-level Leopoldt | Repaired | Line 97: “For every imaginary quadratic field k, every finite abelian extension F/k and every prime ℓ, δ(F,ℓ)=0”. The identical slug and named owner occur in the plan's top-level gaps. Lines 552 and 564 apply it to the correct Billot tower. For K₁/K of degree 5, Gal(K₁/ℚ)=C₅⋊C₂ is nonabelian, but K₁/K is abelian and the contract applies. |
| F02: nonexistent coefficient conjugation | Repaired by a different valid comparison | Line 554: “Conjugation by τ is an R-linear isomorphism from the cohomology of W onto that of its τ-conjugate W^τ”. Line 249 retains the non-stable cubic counterexample. At α=−1+2i over ℚ(i), p=7, the conjugate character value is −1−2i=5/α, unequal to α. The argument compares the two modules and cancels two Γ-involutions; it does not infer ideal invariance from one semilinear map. |
| F03: tower locator | Repaired | Line 146: “§6.0.1, p.961, for the two-variable identification”. BKO21 lines 828–829 contain that identification; lines 853–860 contain the completion comparison. The p.950 reference is now correctly §3.0.1 for H_𝔭=Φ. References and the manifest agree. |
| F04: degree of H | Repaired | Line 138: “H is a cubic extension of K, so [H:ℚ]=6”. The three reduced forms give h_K=3 and the tower law gives 3·2=6. The other examples use the same relative degree. |
| F05: missing pinned Selmer inventory | Repaired; new adjacent inventory defect is R01 | Line 269: “Each group below is the Selmer group of an instance of Tau Ceti's `TauCeti.ContCohomology.SelmerStructure`”. Scope, contracts and Suggested.lean now acknowledge the generic and arbitrary-m elliptic carriers. Line 788 uses the pinned Kummer injection and Mordell–Weil finite generation. For A=ℚ, A⊗ℤ₅=ℚ₅ but lim A/5ᵏA=0, confirming why the newly stated finite-generation input matters. |

The last repair report marked no finding “not actionable in this package”. No such finding is re-raised. The coefficient-field repair's rejection of an involutive extension of local conjugation is not an instruction followed here; the replacement module comparison was checked directly. No finite conjugation-stable coefficient extension is needed by the replacement argument.

I searched the rest of the package for the repaired patterns. There is no remaining claim that (π) is the height-one prime for ramified R, that every R-basis has an O-valued derivative, that shifting a fixed-support p-power modulus changes ξ by 1+p⁻¹, that the localisation cokernel must be nonzero, or that a nonzero logarithm alone detects a nonzero discrete Kummer tensor.

## Verified sound

### Coverage and principles

Read the four authored package files, the plan's gaps, the board-package index, the overlap report, all 36 numbered targets and their 36 target Needs lines, all 36 Checks blocks, and all seven layer Examples and Dependencies endings. Rechecked every repair and all 15 seeded targets. For unchanged targets outside that sample, relied only on the round-3 adversarial rows with explicit computed values: §§0.3, 0.5, 1.3, 3.1–3.3, 3.5, 4.1, 5.1, 5.4–5.6 and 6.1–6.3. Their text and their use elsewhere were also read for contradictions and recurrence of repaired errors. The table below records the present sample, changed material, headlines and the finding; it is not a catalogue of every API sentence.

The general inert Gross datum over H is retained, with arbitrary finite coefficient extension R/O. The E/K hypothesis is explicit on the finite-character application. The primitive class, the complete auxiliary family and the integral p-primary divisor are distinct throughout. No new good-prime shortcut, replacement of a pre-existing roadmap, computational algorithm, copied source passage, own backticked declaration missing from Suggested.lean, `set_option`, sorry'd data, process residue, HTML anchor or machine path was found in the authored roadmap. Scope and the supplier contracts identify the general owners. R01 corrects one inaccurate limit placed on a native carrier.

The organization is mathematical: transport and signed local conditions precede global elliptic units; duality and the strict comparison precede the integral characteristic formula; finite-level control precedes the rank bound. The Needs edges force these steps. No heading is named for a source chapter and no sentence says to follow a source's organization. The style comparisons on main were `TauCetiRoadmap/EllipticCurves/README.md`, `TauCetiRoadmap/ClassFieldTheory/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`. Definitions retain their prose APIs and at least three Checks. Theorems have standing or explicit hypotheses, locators and dependency lines.

### Computed adversarial table

Algebraic lattice examples below test the displayed identities; they do not assert that every such module is realized by an elliptic curve.

| Statement | Instances tried | Values computed on the two sides / excluded model | Result and change |
|---|---|---|---|
| Conventions and §0.1, repaired degree/Frobenius | K=ℚ(√−23), p=5; excluded p=2,3 | Reduced forms: 3. [H:K]=3 and [H:ℚ]=6. Squares mod 5 are {0,1,4}, while −23=2. (X+5)²=X²+10X+25, trace −10. | Degree repair passes; p=2,3 fail the stated p≥5 hypothesis. |
| §0.2, repaired tower locator | n=0,1 at p=5 | Completions have degrees 1 and 5; first tame division degree is 24. cγc⁻¹γ=1, not γ². | Correct tower and map directions at the corrected BKO locators. |
| §0.4, local module and trace dual | R=O; R=O[√π] | Differents are O and (2√π); inverse-different quotient has 25 elements at p=5. Tr(1)=2 gives 2/pᵏ, not 1/pᵏ. | Ramification and trace factors retained; the dual lattice is not silently T. |
| §1.1, signed Kummer conditions | n=0; Q versus [π]Q; tensor denominator πʲ | L₀⁺=0, corank L₀⁻=1. Q⊗π⁻¹≠0, but [π]Q⊗π⁻¹=Q⊗1=0. In the complementary lattice, πᵐe⊗π⁻ʲ vanishes iff j≤m. | Correct primitivity criterion and exact annihilator. |
| §1.1, transitions | Base logarithm b, one step | Restriction gives b; corestriction/formal trace gives 5b. | Maps cannot be interchanged. |
| §1.2, repaired conjugation | p=5, β³=aπ, a of order 24 | c(a)/a=a⁴ has order 6; every cube root has order 18. Cubes in μ₂₄ have exponents divisible by 3; 4 is not one. The totally ramified cubic has only μ₂₄ as prime-to-5 roots. | No automorphism of L extending c; the replacement compares different O-algebra structures. |
| §1.4, arithmetic kernel | n=0; full or zero local condition | Sel₊=Sel_str, Sel₋=Sel_ord. Full conditions at every index give H¹; identity localisation with condition 0 gives 0. A nonzero away-p localisation fails every displayed kernel. | Native-carrier instantiation is correct. |
| New pinned-carrier contract, R01 | G=(ℤ₅,+), trivial M=ℤ₅ or ℚ₅ | c(x)=x has d¹c=0, c(1)=1; B¹=0. Full condition retains [c], zero identity-local condition removes it. | Both coefficient types already fit the signature. Correct the inventory. |
| §1.5, duals and compact limits | χ(γ)=ζ₅; away-p condition 0 | Dual character is ζ₅⁻¹=ζ₅⁴, unequal to ζ₅. Annihilator of 0 is the full compact local group. | Contragredient action and compact strict/relaxed reversal agree. |
| §2.1, primitive class | ν=1; original compatible family and its tail | R[Gal(K/K)]=R and evaluation=id. Recovering the removed coordinate by corestriction multiplies by 1, not 6/5. Tame denominator 24 is a 5-unit. | Trivial-auxiliary construction and fixed-support indexing are coherent. |
| §2.2, special values | χ=1 and order 5 | Deleted p-factor is 1−(−5)/25=6/5 at χ=1; at ramified χ it is 1. | Conjugation and Euler deletion agree with the source convention. |
| §2.3, sign/nonvanishing | ε=+, order 25; ε=−, χ=1; ξ=πv | c=3 gives (−1)³·1=−1 and value 0. At ε=− the trivial derivative is 0. πv≠0 in the free line but has nonunit coordinate π. | Wrong-parity vanishing does not assert primitive lattice generation. |
| §2.4, integral coordinate | ξ=Tv, v′=(1+T)v; e=2 | Coordinates T and T/(1+T) generate (T). Coordinate ϖ_R generates (ϖ_R), strictly larger than (π)=(ϖ_R²). | Unique coordinate and inverse unit covariance hold integrally. |
| §2.5, interpolation | χ(γ)=ζ₅; ε=− at χ=1 | δ_(χ⁻¹)(γv)=ζ₅δ_(χ⁻¹)(v), not ζ₅⁴ times it. For ξ=πv₋ both derivatives at 1 are 0, while L_p(1)=π≠0. | No reversed evaluation or division by zero. |
| §3.4, global ranks | Rank-one ideal (ϖ_R,T); imaginary quadratic K | Generic rank 1, minimal generator number 2. Euler rank difference is 1 complex place times coefficient rank 1. | Torsion-free rank one is not upgraded to freeness. Nonzero Euler-system input is required. |
| §4.2, headline opposite torsion | ε=+ and ε=− | (rank S_ε,rank X_ε)=(1,1); S_(−ε)=S_str=0 and rank X_(−ε)=0. A torsion submodule of the free H=Λ_R² is 0. | Rank/saturation argument, including S_ε=S_rel, passes. |
| §4.3, repaired Leopoldt input | F=K and F=K₁ at p=5 | Unit rank over K is 0, so defect 0. Over K₁, τγτ⁻¹=γ⁴≠γ and Gal(K₁/ℚ) has order 10; Gal(K₁/K)=C₅. | New gap supplies exactly the abelian-over-K case. |
| §4.3, repaired dual-character symmetry | K=ℚ(i), p=7, α=−1+2i | α·ᾱ=5 and ᾱ=5/α≠α. For root a=5, ι sends a to −5/6 and a second application sends −5/6 to 5. | R-linear W→W^τ comparison changes the character; two Γ-involutions cancel without an R-automorphism. |
| §4.4, headline signed formula | H^ε=Λ, S=(T), C=(T²), char X_str=(T) | char(S/C)=(T); char X_(−ε)=(T)(T)=(T²)=char(H^ε/C). If C=πS, the vertical multiplicity added is e. | Both displayed exact-sequence calculations retain the local quotient. |
| §4.5, primitive versus full lattice | Smoothing α≡2 mod 5; hypothetical common factor ϖ_R | Nα−φ(α)≡4−2=2 is a unit. A common ϖ_R factor instead gives char quotient (ϖ_R L_p), not (L_p). | Integral unit-factor comparison is necessary and the named normalized-class supplier gives its test. |
| §4.6, headline main conjecture | [R:O]=2, L_p=T; e=2, L_p=π | Restriction of scalars gives (T²), not (T). For π, char=(ϖ_R²) and μ=2; after inverting p the quotient is 0. | Integral statement and norm convention pass. |
| §5.2, signed local control | p=5, n=0,1,2, both signs | Corank pairs are (0,1), (0,5), (20,5). Finite divisible cokernel Q killed by ϖ_Rᵏ obeys Q=ϖ_RᵏQ=0. Nonfree countermodel 𝔪/T𝔪=R⊕R/ϖ_R has a finite part. | Roadmap's isomorphism follows from the stated freeness; it is stronger than the source's finite-cokernel wording for a valid reason. |
| §5.3, global control | n=0, signs ±; e=2 | Plus quotients by ω₀⁺=1 are both 0; minus uses T-coinvariants. Lengths of ϖ_R⁻¹R/R and π⁻¹R/R are 1 and 2. | Dual surjection/injective restriction and integral local errors agree. |
| §6.4, headline rank bounds and repaired Kummer route | χ=1 with ε=±; order 25 with ε=+; A=ℚ | Bounds are ord₁L_p and ord₁L_p+1; order 25 receives +1. At order 0: matching rank 0, opposite rank≤1. ℚ⊗ℤ₅=ℚ₅ but lim ℚ/5ᵏℚ=0. | Correct parity and explicit finite-generation input; no claim for E/H without E/K. |

Zero rings, equal-characteristic coefficient rings, noncompact coefficient rings, p=2,3 and split p are excluded by the arithmetic conventions rather than hidden in a proof. The algebraic §5.5 inequality separately admits M=0, giving dimension=length=0, M=A/(t²), giving 1≤2, and M=κ², giving 2=2. Natural-number indexing at the trivial character is explicitly n=0; no c−1 is evaluated there. R01 is precisely a test where the *native* carrier admits more inputs than the prose inventory says.

### Seeded source verification

Read all five cached accessible texts at the relevant locators. There are no additional author-flagged unverified locators. BRU67 is explicitly waived and was not requested again. The manifest has exactly one entry for each of the six referenced works; no source was added or rewritten.

| Sampled target | Source passage opened | Verification |
|---|---|---|
| 0.4 | BKO21 lines 847–860, §6.0.2, pp.961–962; AHII05 lines 70–76, 112–113 and 190–211, pp.612–613,615 | Actual local W and dual pairing. The ramified inverse-different extension is proved in the roadmap using its named duality supplier; it is not attributed verbatim to AHII's unramified coefficient case. |
| 1.1 | BKO21 lines 860–865, p.962; AHII05 lines 98–125, p.613 | Same signed Kummer construction, with the stated order/conductor dictionary. Compact conditions are annihilators, not arbitrary complements. |
| 1.4 | BKO21 lines 866–872, p.962; AHII05 lines 78–97 and 114–122, pp.612–613 | Signed, ordinary, strict and relaxed kernels, including zero away-p local conditions. |
| 1.5 | AHII05 lines 95–97, 123–128 and 172–178, pp.613,615 | Restriction/corestriction limits and inverse action on the dual. |
| 2.1 | BKO21 lines 398–416, 434–466 and 823–836, pp.951–953,961 | Trivial auxiliary character is explicitly discussed; arrows, coefficient untwist and augmentation are present. Modulus f p^(n+1) is the cofinal family. |
| 2.2 | BKO21 lines 467–488, Proposition 3.3, p.953, and 823–830, p.961 | Derivative values and p-factor at the trivial character. Overbars are subject to the extraction qualification below. |
| 2.3 | BKO21 lines 831–834, p.961; AHII05 lines 151–169, Proposition 3.1 and Remark 3.2, p.614 | Correct sign, nonzero global localization and almost-all matching central nonvanishing. The general Gross nonvanishing input is explicitly NCM.5, resolved to its supplied target. |
| 2.4 | BKO21 lines 831–839, §6.0.1, p.961 | Definition as signed basis coordinate; no lattice indivisibility follows from the name “primitive”. |
| 2.5 | BKO21 lines 840–844, p.961, and Corollary 2.2 at line 308, p.949 | Inverse-character derivative in denominator and matching-parity nonvanishing. The roadmap separately handles χ=1. |
| 3.4 | AHII05 lines 180–189 and 235–244, pp.615–616; AHI06 lines 364–408, Lemma 1.1.9, pp.1009–1010 | Ranks and torsion-freeness; read the proof's actual invariants and limit argument. Ordinary AHI is a proof template, not an inert theorem imported unchanged. |
| 4.2 | AHII05 lines 216–231, Theorem 3.6, p.616, and 274–280, p.617 | Opposite torsion and compact vanishing; equality with relaxed follows using the integral local splitting. |
| 4.5 | AHII05 lines 283–298, Theorem 4.3 and following paragraph, p.617; BKO21 lines 831–844 and 881–886, pp.961–962 | Integral coordinate/characteristic comparison. General Gross scope is stated in BKO's proof; the roadmap exposes the extra lattice comparison instead of inferring it from a rational formula. |
| 5.2 | AHII05 lines 318–338, Lemma 5.1, pp.618–619 | Source proves injectivity and finite cokernel under the splitting. The extra divisibility proof giving zero cokernel was recomputed above. |
| 5.3 | AHII05 lines 343–391, Theorem 5.2 and proof, pp.619–620 | Correct direction, finite kernel after splitting, and inertia-error argument. General R follows by the stated finite coefficient comparison. |
| 6.4 | BKO21 lines 888–908, Theorem 6.2 and proof, pp.962–963 | E/K assumption, CM coefficient dimensions, matching bound and opposite +1. Extension from the conductor-indexed level to every layer through which χ factors is justified by the stated character control, not by claiming the source uses minimal-level indexing. |

Also reopened the changed §4.3 inputs: BIL86 lines 285–295 give its standing setup and full torsion tower; lines 366–381 give the strict torsion and field-level Leopoldt assumption; lines 618–643 give Theorem 3.24, pp.364–365, and descent through the prime-to-p torsion field. AHI06 lines 415–427 give Lemma 1.2.1 and the interchange of conjugate components. For the two-variable gap and §3.5, RUB91 lines 486–551 give the hypotheses, module definitions, sequence (5) and Theorem 4.1(ii); lines 565–571 explicitly distinguish the nonsplit case from the torsion local-unit formulation. No additional source hypothesis was silently dropped in these comparisons.

### Pinned declarations and duplication by object

The checked checkout commits match `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations were opened at those pins, including their surrounding hypotheses. File names in this table are library-relative paths.

| Declaration or native object | File and line | Checked content |
|---|---|---|
| `Module.length`, `length_le_of_surjective`, `length_eq_finrank` | `Mathlib/RingTheory/Length.lean:31`, 202, 293 | ℕ∞ length; surjectivity retained by `include`; finite module required for finrank. Line 288 supplies the unrestricted-rank version. |
| `IsLocalRing.length_restrictScalars` | `Mathlib/RingTheory/LocalRing/Length.lean:54` | Local ring map and scalar tower; residue-field factor. |
| `Polynomial.cyclotomic`, `cyclotomic_prime_pow_mul_X_pow_sub_one` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:227`, 525 | Prime-power product; prime hypothesis and commutative ring. |
| `Module.Basis` | `Mathlib/LinearAlgebra/Basis/Defs.lean:89` | Actual representation equivalence, giving coordinates. |
| `Ideal.span_singleton_mul_left_unit` | `Mathlib/RingTheory/Ideal/Span.lean:100` | Unit assumption, equality of ideals. |
| `IsGalois.normalBasis` | `Mathlib/FieldTheory/Galois/NormalBasis.lean:121` | Finite Galois extension; regular representation. |
| `IsDedekindDomain.selmerGroup` | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161` | Multiplicative S-unit/valuation carrier, not a cohomological Selmer structure. |
| Local principal-domain regularity | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:80` | Local domain and principal-ideal hypotheses. |
| `TauCeti.PowerSeries.isRegularLocalRing`, `ringKrullDim_of_isDiscreteValuationRing` | `TauCeti/RingTheory/RegularLocalRing/PowerSeries.lean:157`, 169 | Power-series regularity and dimension 2. |
| `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` | `TauCeti/RingTheory/RegularLocalRing/UniqueFactorization.lean:59` | Dimension ≤2 is required and holds here. |
| `TauCeti.Iwasawa.charDivisor` | `TauCeti/RingTheory/Iwasawa/Char/Divisor.lean:87` | Local lengths with finite-support/toNat totalization; intended finite torsion domain is respected. |
| `TauCeti.Iwasawa.charIdeal` and the four cited operations | `TauCeti/RingTheory/Iwasawa/Char/Ideal.lean:85`, 125, 132, 152, 198 | Pseudo-isomorphism invariance, exact multiplicativity, semilinear comap direction and nonzero principal quotient. |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | Compatible finite-level inverse-limit carrier, without arbitrary-coefficient compactness. |
| `TauCeti.IsCompactModule.completedGroupAlgebraModule` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322` | Compact module and continuous action, with compactness data an explicit argument. |
| `TauCeti.ContCohomology.SelmerStructure`, `.localization`, `.selmerGroup`, `.mem_selmerGroup_iff` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SelmerStructure.lean:69`, 86, 97, 103 | Compatible continuous localization and subgroup kernel; no coefficient-discreteness requirement. R01. |
| `H1`, `H1EquivOfSmulEqSelf` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829`, 1057 | Continuous cocycles modulo coboundaries for topological coefficients; no intended arithmetic topology supplied merely by this bare group. |
| `WeierstrassCurve.selmerStructure`, `selmerGroup`, `kummerSelmerMap`, `kummerSelmerMap_injective` | `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean:147`, 176, 223, 238 | All m; Kummer injection assumes ellipticity and m invertible in the field. The local Kummer characterization is at line 199. |
| `WeierstrassCurve.Affine.fg_point_of_numberField` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean:145` | Number-field Mordell–Weil finite generation. |
| `WeierstrassCurve.Affine.selmerGroup₂`, `.selmerGroupA` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104`; `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroupA.lean:144` | Existing 2-descent carriers are acknowledged, not redefined. |
| `TauCeti.GlobalNumberFields.HeckeCharacter` | `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70` | Continuous idele-class characters; this alone is not a Gross datum or a Rubin L-function. |

Object searches at the pins for anticyclotomic towers, signed Selmer conditions, Coates–Wiles derivatives and Rubin's L-function found no implementation of the missing arithmetic objects. The formal-group rigidity hits are not a signed Lubin–Tate tower. The characteristic-ideal files contain no arbitrary-DVR restriction-of-scalars or character-order theorem discharging the declared gaps. Generic characteristic ideals, bases, lengths, Kummer kernels and Mordell–Weil are cited rather than redeclared in Suggested.lean.

### Supplier resolution and ownership at available heads

Read the board package index before checking absence. Used `roadmaps show`, `roadmaps grep` and `roadmaps resolve` against the indexed main/head copies. Resolve reports no cross-roadmap citation or roadmap Lean name found nowhere. Its library-name search is unavailable, so the separate pinned reads above were necessary. NonordinaryCMSpecialValues and LubinTateFormalModulesAndQuasiCanonicalLifts are available board packages, despite not being roadmap pull requests in that index; their local READMEs and retained plan target IDs were read.

| Supplier | Citations resolved in the available file |
|---|---|
| AnticyclotomicLocalUnits, #1692 | `TauCetiRoadmap/AnticyclotomicLocalUnits/README.md:148`, 237, 297, 324, 347, 361, 458, 498, 522, 591, 648, 673, 688, 1075, 1103, 1117 resolve every cited section: §§0.1,0.5,1.2–1.5,2.4,3.1–3.2,3.6,4.2–4.4,8.2,8.4–8.5. Derivatives have inverse covariance, logarithms direct covariance, points kill same parity, and annihilators keep labels. Scope at line 7 places global Selmer/L-functions downstream. |
| NonordinaryCMSpecialValues, board package | `packages/NonordinaryCMSpecialValues/README.md:168`, 247, 257, 368, 386, 396, 406, 453, 463, 473, 709 resolve the period, root signs, normalized class, reciprocity, twist/period laws, semilocal comparison, Frobenius, Honda comparison and central nonvanishing. NCM.0/dual-tate-convention, NCM.1/normalized-zeta-class and NCM.5/central-nonvanishing remain exact plan IDs. Fixed-support corestriction has multiplier 1; a smoothing α≡2 has unit residue 2. |
| LubinTateFormalModulesAndQuasiCanonicalLifts, board package | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:688`, 717 give the character and arithmetic Artin comparison. `design/plan.json:1125`, 1230, 3332 retain LT.2/lt-character, LT.2/reciprocity-comparison and LT.8/bko-fields: degrees p^(2n), pⁿ and inversion on the anticyclotomic quotient. |
| ComplexMultiplicationAndExplicitReciprocity, #1254 | `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:634`, 684 resolve §§4.1,4.3, including full CM action and Frobenius hypotheses. `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean:50`, 70 declare `IsCanonicalGrossCharacter`, `canonicalGrossExistence`. The consumer's Gross datum does not impose canonical conductor support. |
| SelmerIwasawaCohomology, #869 | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:343`, 372, 411, 427, 441, 469, 591, 717, 821, 1329, 1373, 1426, 1562, 1582, 1600, 1758 resolve §§2.1–2.6,2.10,2.13,2.19,3.0,3.1,3.3,3.10–3.12,3.16. Read coefficient propagation, trace dual, actual localization-image errors, duality involution and retained H²/Tor terms. R01 narrows what extension of the underlying carrier is still needed. |
| ArithmeticGaloisDuality, #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1303`, 1401, 3118, 3436, 3505, 6232, 6354 resolve R02.2.2–2.3, R02.4.2–4.4, D7.7.1–7.2. Ordered dual-first pairing and restriction/corestriction index agree. |
| EulerSystemsAndKolyvaginSystems, #1272 | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1606`, 4983, 5466 resolve §§2.2,8.11,8.25; §8.1 defines admissibility. The elliptic-unit application must have the non-torsion class, and the anticyclotomic alternative explicitly invokes condition (*). |
| IntegralIwasawaTheory, #1306 | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:310`, 680, 704, 712, 724 resolve §§2.2,4.1e–4.4. The field-level defect has torsion-free kernel; existing abelian Leopoldt is over ℚ. The new gap extends that owner to imaginary-quadratic base, rather than rebuilding logarithm theory. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909`, 2485, 2620, 2710, 2818, 2828 resolve §§1.7,4.3,4.5,4.6 and finite-DVR base change. Existing restriction of scalars is to ℤ_p, so the arbitrary-base-O gap is not redundant. |
| EllipticCurves and ClassFieldTheory, main | `TauCetiRoadmap/EllipticCurves/README.md:423`, 683, 793 resolve Layers 1,3,4; Layer 7 at 1262 is acknowledged as planned theory with a now-native kernel. `TauCetiRoadmap/ClassFieldTheory/README.md:1150`, 1781, 1834, 1924 resolve Layers 6,11–13 and their actual reciprocity/class-field interfaces. |

The overlap file lists no other head changing this roadmap, dropped cited ID, or revision-only ID. The closest open scopes were checked by object: AnticyclotomicLocalUnits owns the local decomposition; EulerSystemsAndKolyvaginSystems owns the generic Euler-system formalism; SelmerIwasawaCohomology owns general comparisons; `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/README.md:3` (#1311) constructs cyclotomic/circular units; `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:3` (#1423) constructs Heegner-point families. Neither of the latter owns this inert elliptic-unit signed main conjecture. Additional search hits were checked: `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:634` (#1499) is cyclotomic Coleman-kernel signed theory; `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2063` (#1307) assumes E/ℚ and split ordinary p, and its two-variable equality has that scope. They do not discharge the nonsplit Gross contracts. There are no fully qualified declaration collisions because Suggested.lean declares nothing.

All five declared gaps have named earlier owners, precise hypotheses, and matching slugs in the plan and README:

- `elliptic-unit-euler-system`: full auxiliary family and twisted tower beyond the supplied restricted-modulus normalized class;
- `inert-two-variable-main-conjecture`: Rubin's nonsplit class-group/global-unit comparison, with equality only on the specified decomposition components;
- `restriction-of-scalars-finite-extension`: arbitrary base DVR O, beyond the supplied ℤ_p-base norm formula;
- `character-prime-multiplicity`: the actual character-prime/order-of-vanishing identification;
- `leopoldt-abelian-over-imaginary-quadratic`: field-level defect zero beyond abelian extensions of ℚ.

No missing implementation of a declared gap was treated as a finding. Their hypotheses distinguish p∤h_K, tame averaging, finite coefficient extensions and field-level versus weak Leopoldt. This package's eventual acceptance remains conditional on those contracts.

Dependency-check output, with the prescribed name, order, movable and content arguments:

```text
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The increase from the previous report's counts is the currently available graph, not an edit to the merge order. All target Needs lines and supplier references were also read manually; downstream consumers are not used as suppliers.

### Headlines, Lean elaboration and exhaustive padding check

The README's end theorems are §4.6 (integral main conjecture) and §6.4 (finite-character CM rank bounds). Its additional deep endpoints are §4.2 (opposite torsion and compact vanishing) and §4.4 (signed characteristic formula). Suggested.lean explicitly names all four in its module docstring and lists the missing arithmetic objects for each. Existing generic H¹, characteristic ideals and Selmer kernels do not construct the signed local conditions, elliptic-unit class or Rubin L-function. R01 does not make any of these four headlines statable by a few simple definitions. No statable headline is replaced by a free predicate or algebraic stand-in.

Ran the prescribed `lake env lean` elaboration on `packages/InertAnticyclotomicCMMainConjecture/Suggested.lean` from the content checkout: **exit 0, no output and no warnings**. It contains exactly the single `import Mathlib`, one module docstring and the required namespace, with **zero declarations and zero sorry occurrences**. The exhaustive one-tactic padding probe therefore has **zero cases**, and the mechanical `#check @name` binder comparison has **zero declared signatures to compare**. No Tau Ceti import needed building; no Lean process was left running. Every backticked identifier in the README is attributed to a library or supplier, and each was resolved as above.

## Not verifiable

- BRU67 remains waived. Its text was not fetched or independently certified; its locator and manifest waiver were retained. The new supplier contract and its application, rather than the unavailable source text, were audited.
- BKO21's extraction loses overbars in several formulas. The previous review records rendered-page verification at pp.953 and 961; that unchanged typography evidence is retained. This round read the extracted passages and recomputed the character conventions, but did not independently rerender those pages. No source error was inferred from lost overbars.
- BIL86's cached extraction omits parts of displayed formulas, especially the coefficient-action displays around pp.351–352. The theorem hypotheses, conjugate-character description and involution in Theorem 3.24 are readable; individual missing glyphs were not certified. RUB91's OCR similarly garbles some §1 formulas; the §4 component condition and hypotheses are readable. No new source-access request was created for these already recorded sources.
- The declared supplier gaps and future arithmetic comparisons are contracts and proof targets, not completed formal proofs. The empty Lean file verifies its permitted form and imports, not the truth of those future results. The report records the concrete mathematical tests and source support actually checked.

## Source issues

- **Misprint** in AHII05 at proof of Proposition 5.3, p.620: the source says the control-product exponent uses p^k; it should be p^n for the fixed level n; affects nothing.
- **Misprint** in AHII05 at proof of Theorem 4.1, p.616: the source says the symmetry input is AHI06 Lemma 2.1.2; it should be Lemma 1.2.1; affects nothing.
- **Misprint** in BIL86 at Introduction, p.342: the source says the pseudo-isomorphism and characteristic-series results are Theorems 3.24 and 3.25; it should be Theorems 3.23 and 3.24; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5f390c6af706932c4a74dbefb42dc8d5356df829", "job": "REV-PKG-InertAnticyclotomicCMMainConjecture~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
