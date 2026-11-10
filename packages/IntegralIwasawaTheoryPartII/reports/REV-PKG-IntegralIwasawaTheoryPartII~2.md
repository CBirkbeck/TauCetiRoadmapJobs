# Review of IntegralIwasawaTheoryPartII (package, round 2)

**Verdict:** needs changes

Ten findings: three P1, two P2 and five P3. The package files were read without modification. The two review deliverables are the only package files written. No source entry was added or changed.

The six previous findings were checked first. Their repairs resolve several real problems, but the new general Eisenstein decomposition is false, the new homological route overlooks pinned Koszul infrastructure, and the repaired test-form definition still admits an empty tuple. The independent pass also finds a missing ramified-character supplier contract and an incorrect partial-zeta interpolation statement. These are repairable; the roadmap's scope does not warrant rejection.

## R01 (P1) — The general Eisenstein complement has repeated basis vectors

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:407`, §2.2a, and its uniqueness API at line 411: “these series being linearly independent”. The same decomposition is consumed at line 471.

**Claim.** All pairs of possibly imprimitive characters whose moduli multiply to the level give a linearly independent Eisenstein complement, at every level and parallel weight at least two.

**Witness.** At `F = ℚ`, level `8`, weight `4`, trivial nebentypus, the distinct pairs `(1_2,1_4)` and `(1_4,1_2)` both have constant `0` and coefficients `1,0,28,0,126,…`. Their difference is zero.

Here `1_d` means the trivial character presented modulo `d`, extended by zero off the integers prime to `d`. For either pair the divisor-sum coefficient in the cited supplier is `σ₃(n)` for odd `n` and `0` for even `n`. Thus equality holds at every coefficient, not just the displayed sample. Fourier injectivity gives equality of the two nonzero forms. Both pairs belong to the stated `J`, and neither meets the weight-two exclusion. The remaining two pairs are `(1,1_8)` and `(1_8,1)`, so the proposed span has dimension at most three, whereas the four degeneracy translates of the level-one weight-four Eisenstein series are independent. This is a spanning defect as well as a uniqueness defect.

The coefficient witness is `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md:367`, §2.12(a), at pull request #1066. DDP11 line 1157 states a decomposition only in its particular conductor-level setting; DDP11 line 1138 identifies the section as §2.3, not the cited §2.4. That passage does not justify the generalization to arbitrary level in §2.2a.

**Exact repair.** Retain the general-level objective, but formulate the Eisenstein complement using primitive character pairs together with the required oldform/degeneracy translates, with the weight-two exceptions stated separately. Import the level-changing operators from NoncommutativeAndEquivariantIwasawa §F.5. Specify their coefficients and constants and prove the basis theorem for that indexing; update §2.6 to use it. Cite DDP11 §2.3, p. 465 only for its stated specialization, and supply an exact source for the general basis theorem. Do not merely remove uniqueness or restrict to squarefree levels. Add the level-eight pair as a negative Check. On that instance the repaired basis contains `E₄(z), E₄(2z), E₄(4z), E₄(8z)`; their positive coefficients at indices `1,2,4,8` form a triangular matrix with nonzero diagonal, giving four independent vectors.

## R02 (P1) — Families for characters ramified above p are not supplied

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:380`: “`𝔫` is the conductor of `χ` (the tame level)”; supplier contracts at lines 100–114 and the uses in §§2.2–2.6, 3.7–3.10 and 4.1.

**Claim.** The cited ordinary-family and localization suppliers cover every totally odd finite-order character allowed by the conventions, once the three declared gaps are supplied.

**Witness.** Let `F=ℚ(√5)`, `p=11`, `H=F(√(−4−√5))`. The defining element has norm `11`; at the two primes over `11` its residues are `0` and `3=5²`. Thus `r=1`, but `11` divides the character conductor.

Both real conjugates of `−4−√5` are negative, so this is a quadratic CM extension and its quadratic character is totally odd. The roots of `X²−5` modulo `11` are `4` and `7`. At `√5=7` the defining element has valuation one and the quadratic extension ramifies; at `√5=4` it is a square unit by Hensel, so the prime splits. Consequently the example is a genuine positive-rank Case 1 datum, not a rank-zero exception.

At pull request #1307, `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2533`, §F.5 explicitly requires `χ` to have conductor prime to `p`. At #1019, `TauCetiRoadmap/PadicFamilies/README.md:2918`, §5.11 repeats this requirement, and §§5.12–5.13 continue that family setting. The package's first two gaps extend the prime to `2`; they do not remove the conductor restriction at `11`. The third gap quantifies over eigenfamilies already supplied by §5.13 and does not construct the missing families. Calling the full conductor “tame” does not eliminate its p-part.

**Exact repair.** Keep all Gross–Stark data. Separate the prime-to-p conductor from the finite character at primes over p. Declare matching README/plan gaps on NoncommutativeAndEquivariantIwasawa §F.5 and PadicFamilies §§5.10–5.13 for this missing finite-character ramification range: the coefficient families with specialization character `χω^(1−k)` and conductor-dependent level, their ordinary projector/control, the two Eisenstein families used here, Fourier injectivity, and the reduced localized cuspidal Hecke algebra/eigenfamily-field description at minimal tame level with the finite p-character retained. State the level and ordinary local eigenvalues explicitly, and propagate these contracts through the affected Needs lines and the representation gap. Alternatively cite an earlier owner that actually states exactly that range. The repaired contract must admit the example above with one split and one ramified prime over `11`; adding `p ∤ cond χ` to this roadmap is not a repair.

## R03 (P1) — The principal branch does not interpolate every partial-zeta moment

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:209`: “an integral of `⟨Nx⟩^{−s}` … interpolating `ζ^*_{𝔣,𝔠}(𝔞, −k)` for every `k ≥ 0`”; the global “analytic unit” description at lines 217 and 225.

**Claim.** The integral on the principal-character component is the full weight-space partial zeta function and interpolates its untwisted values at all nonpositive integers.

**Witness.** For `F=ℚ`, `𝔣=1`, `p=3`, `𝔠=(2)`, the full weight `−1` value is `(1−2²)(1−3)ζ(−1)=−1/2`. The principal branch is identically `0`, since its values at all negative even integers are zero.

The negative even integers are dense in `ℤ₃`. The value `x↦x^(−1)` has nontrivial torsion character, whereas `x↦⟨x⟩^(−1)` has trivial torsion character. CD14 lines 96–101 explicitly use the weight space `Hom_cts(ℤ_p^×,ℂ_p^×)` with integers embedded as full powers. CD14 lines 1265–1270 give the full-character integral with its factor `(N𝔞𝔠)^(−s)`. Only afterward is the principal-character restriction used in the character sum, at CD14 lines 123–130.

There is also a domain error in calling the smoothing factor an analytic unit on all of `ℤ_p`. For `p=2`, `χ=ω⁻¹` of conductor `4`, `𝔠=(3)`, it is `1+3(−3)^(−s)`: its values at `0` and `1` are `4` and `0`. It is a unit as a germ at zero; at one it cancels the zeta pole.

**Exact repair.** Define the partial zeta function on the full weight space. For a weight character `κ`, use the integrand `κ(Nx)⁻¹` and the prefactor `κ(N𝔞𝔠)⁻¹` of Proposition 4.3. State untwisted interpolation at `κ(x)=x^(−k)`. Separately define the restriction `κ(x)=⟨x⟩^s` used in the smoothed character sum and retain the `ω^(−k)` twist in its interpolation. State the smoothing comparison as meromorphic functions with removable values, or as analytic germs at zero; call the factor a unit only in the latter ring. Add the two numerical tests above. Then the full `−1` moment remains `−1/2`, the principal moment remains `0`, and the order comparison at zero remains valid because `4≠0` in `ℚ₂`.

## R04 (P2) — The new homological route does not import the pinned Koszul construction

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:18` claims ownership of “the Koszul resolution”; lines 239–242 construct/use it without a Tau Ceti contract.

**Claim.** The Koszul construction, regular-sequence exactness and degree-zero quotient required by the new §0.7 are new library work here.

**Witness.** Pinned `TauCeti/RingTheory/KoszulComplex/Basic.lean:219,399` defines the complex and its degree-zero quotient; `TauCeti/RingTheory/KoszulComplex/Regular.lean:140` proves positive-degree exactness for every weakly regular finite sequence over a commutative ring.

The repair report's search of Mathlib alone missed these objects. The neighboring supplier already consumes them: pull request #1689, `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:451`–460, lists the exact native construction, tensor isomorphisms, degree-zero equivalence and regular-sequence theorem. This finding concerns that existing algebraic substrate, not the new discrete-group cap pairing or the comparison with group homology.

**Exact repair.** Add `TauCeti.koszulComplex`, `TauCeti.koszulComplex.homologyZeroEquivSpan`, `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` and the needed native tensor isomorphisms to the Tau Ceti contract; remove ownership/reconstruction of those objects. Keep as §0.7 targets the regularity of the augmentation sequence in the group ring, its conversion to a projective resolution in `Rep`, the group-homology comparison and the edge map. Specify the rank-r group ring as a multivariable group algebra; Mathlib `LaurentPolynomial` is only `AddMonoidAlgebra R ℤ` (`Mathlib/Algebra/Polynomial/Laurent.lean:85`). For rank one the imported exactness gives `ker(1−π)=0` and `H₀=A/(1−π)=ℂ_p`; for rank two the successive quotient is `ℂ_p[π₂,π₂⁻¹]`, followed by `ℂ_p`. These are the same values needed by the existing Checks, without reconstructing the pinned complex.

## R05 (P2) — Empty test-form tuples make Q-summation undefined

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:207`: “the set `𝒬` of finite tuples”; integrality on the same line uses `1/m`.

**Claim.** Every finite tuple satisfying the individual nonvanishing condition is an admissible Sczech summation datum.

**Witness.** Take `n=1`, the empty tuple, `A=(1)`, `P=1`, `v=0`. Its product is `Q(x)=1`; every cutoff with `t>1` contains all nonzero integers, and the absolute sum of `1/x` diverges.

The pointwise nonvanishing condition on tuple entries is vacuous for `m=0`. CD14 lines 322–332 require absolute convergence at each cutoff before taking the limit; the empty tuple fails it. The displayed denominator `1/m` also has no intended value at zero.

**Exact repair.** Say “nonempty finite tuples, of length `m≥1`”, retaining all lengths independently of `n`. Add the empty tuple as a negative Check. For `n=1`, `Q=(X₁)` gives finite cutoffs `0<|x|<t`; for `n=2`, the repaired single irrational form remains allowed. Thus the repair preserves the legitimate one-form example from F04 and excludes the undefined case.

## R06 (P3) — The completion Check misstates the dimension of its coefficient order

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:613`: “a one-dimensional local domain such as `Λ_H = 𝒪_E[[T]][y]/(y² − T²(T + p))`”.

**Claim.** The displayed coefficient order is one-dimensional.

**Witness.** It is finite integral over the two-dimensional ring `𝒪_E[[T]]`, hence has dimension `2`; explicitly `(0) ⊊ (T,y) ⊊ (ϖ_E,T,y)` is a prime chain of length two.

**Exact repair.** Call the displayed order a two-dimensional local domain, and explicitly take its localization at the height-one prime `(T,y)` before completing. That localization has dimension one; its completed total quotient ring is the stated `E((T))×E((T))`. The intended splitting Check then remains valid.

## R07 (P3) — The rational-field Case 1 example cannot occur

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:477`: “For `F = ℚ`, Case 1 with `r = 1`”.

**Claim.** This is a Gross–Stark datum illustrating the Case 1 family.

**Witness.** Over `ℚ` there is one prime over `p`. If `r=1`, it belongs to `R`, so `R′=∅`; Case 1 requires `R′≠∅`.

**Exact repair.** Replace it with an actual totally real datum having at least two primes over `p`, for example the quadratic-base datum in R02, and keep the displayed Case 1 formula. That example gives `#R=1`, `#R′=1`. Rational-field positive-rank examples belong to the empty-`R′` cases.

## R08 (P3) — Two source keys identify two versions of one work

**Location.** `packages/IntegralIwasawaTheoryPartII/sources.toml:5,23`, keys `DKV16` and `DKV18`; the two corresponding References entries in the README.

**Claim.** The preprint and publication are recorded as separate source identities.

**Witness.** Both entries have the same three authors and title; arXiv `1605.08169v1` and DOI `10.4007/annals.2018.188.3.3` identify versions of the same paper. Only the normalization in Theorem 3.2 requires distinguishing versions.

**Exact repair.** Have the fix worker reconcile the duplicate records under the original key `DKV16`, retaining both identifiers, the certified provenance, both sets of cited targets, and a version note distinguishing published pagination from v1 Theorem 3.2, p. 16. Use version-qualified citations under that one key, including the published theorem at p. 837. Do not lose either version locator or fetch the paper under a third key. This reviewer has left both author-recorded entries untouched, as required.

## R09 (P3) — The Lean docstring incorrectly says the complex Hecke L-function carrier is absent

**Location.** `packages/IntegralIwasawaTheoryPartII/Suggested.lean:13`–14: “the complex Hecke (Artin) `L`-function … of a number field other than `ℚ`”.

**Claim.** Such a carrier is missing at the pinned libraries.

**Witness.** `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` defines `TauCeti.LFunctions.heckeLFunctionC (χ : RayClassCharacter 𝔪) : ℂ → ℂ` for any number field `K`, not just `ℚ`.

This is a presented meromorphic continuation, with a zero fallback when continuation does not exist; the native definition does not itself prove all the arithmetic/functional-equation results needed here. Nevertheless the blanket carrier-absence statement is incorrect. The genuine missing Deligne–Ribet branch and normalized global p-adic logarithm still prevent the headline from being stated in this file.

**Exact repair.** Remove the complex Hecke carrier from the list of absent carriers; distinguish the existing presented function from the further analytic theorems and Galois/ray-class identification consumed from LFunctions and ClassFieldTheory. Keep the other missing-carrier explanations and the empty acceptance file. Do not introduce a stand-in theorem or unused import. Test: the native signature admits, for example, `K=ℚ(√5)` with a ray-class character, while no Deligne–Ribet function is thereby supplied.

## R10 (P3) — The ownership paragraph contains process state

**Location.** `packages/IntegralIwasawaTheoryPartII/README.md:17`: “no roadmap on main, in the merge order or in an open roadmap pull request”.

**Claim.** The permanent roadmap records a transient inventory of branches and pull requests, and calls itself the cocycle's only consumer.

**Witness.** The quoted clause is process narrative expressly excluded by the house style; the same README exports the cocycle and its measures to downstream consumers at line 811.

**Exact repair.** Delete the transient inventory and only-consumer clause. Retain the mathematical ownership statement and its comparison with IntegralIwasawaTheory §6.3. Put the inventory evidence in this review, where it belongs. The resulting sentence still identifies exactly the cocycle, smoothing, measures and comparison owned here.

## Verified sound

### Finding-by-finding verification of the preceding repair

These checks preceded the new adversarial pass. No previous finding was marked “not actionable in this package”, so none is re-raised against a settled exemption.

| Previous finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01, nonexistent representation supplier and wrong coefficient field | Repaired | README line 114 now asks for “`ρ_H : G_F → GL_2(L_H)`”; line 112 anchors this at “§2.12(b)”. The same §2.12 anchor and slug occur in `design/plan.json`. At #1066 §2.12(b) is the Hilbert-family/ordinary-shape interface. DKV18 lines 981–998 have the specified coefficient field, topology, determinant and unramified quotient. R02 is a separate input-range gap. |
| F02, unowned Eisenstein complement | Partly repaired | README line 407 now explicitly says “Prove that `M_k(𝔟, ψ)` is the direct sum”. Ownership and the §2.6 dependency are now explicit; however its arbitrary-level basis assertion fails in R01. |
| F03, missing cap product and homological edge map | Partly repaired | README line 237 says “Define the cap product”; line 240 says the projection-induced map “is an isomorphism for every `n`”. The double-complex proof works with the stated freeness, but the pinned algebraic Koszul substrate must be imported (R04). |
| F04, n-tuples instead of variable-length test forms | Partly repaired | README line 207 now says “finite tuples `Q = (Q_1, …, Q_m)`”; line 233 includes the single form `X₁+√2X₂` when `n=2`. That inclusion is correct. Nonemptiness is still needed (R05). |
| F05, missing Sczech primary citation | Repaired | README line 207 cites “Sczech … Theorem 4, restricted to `u = 0`”; the References and `Sc93` record agree. CD14 line 351 attributes the theorem to precisely this source. The uncertified status is respected, not reopened. |
| F06, missing Checks in §§2.4 and 4.1 | Partly repaired | Both sections now have three Check bullets. README line 448 gives “`w = L^*_an(χ)/L^*_an(χ⁻¹)`”; line 611 gives `det ρ_H(c)=−1` and trace zero. Those calculations are correct. The third §4.1 Check has the dimension error R06. |

The repaired patterns were searched elsewhere: all three gap slugs agree between the plan and README; no §3.14 supplier remains; §2.6 now points to §2.2a; the new §0.7 is used by §0.8; the Lean docstring uses the renumbered lower-bound section. The positive-rank constructions consistently use `r≥1`, and `w=−1` is consistently Case 2.

### Coverage, principles and shape

Read all 52 numbered targets, all six layer Examples/Dependencies blocks, every Needs line, conventions, supplier contracts, worked examples and source-correction list. For unchanged material, only the computed rows of the earlier report were reused; newly sampled targets and the added/changed mathematical passages were independently recomputed below. The earlier blanket claim that the pins lack all Hecke L-functions was not reused (R09). The earlier claim that there is no Koszul complex was tested against both pins (R04).

The scope is a Part II extension of IntegralIwasawaTheory, not a replacement of its cyclotomic/main-conjecture plan. The headline retains all primes, all totally real degrees, and possible vanishing of the rank-r coefficient. No computation algorithm, copied source exposition, sorry'd data, `set_option`, forbidden supplier, or source-directed instruction was found in the package. The source arrangement is not asserted as the plan; the regulator/cohomology, family/Hecke-image and Galois/determinant interfaces explain the layers. R02 must be fixed to make the claimed generality achievable from its suppliers.

The README has the required summary, ownership, conventions, contracts, build guide, numbered layers, examples, dependencies, consumers and references. Definition/API/Check blocks were read; the repaired sections add explicit properties and three or more Checks. The definition/Check defects found are R01, R05–R07. There are no claimed own ASCII Lean declaration names missing from `Suggested.lean`: symbols such as `W_1`, `κ` and `F̃` are mathematical notation, while the camel-case declarations in the contract are explicitly supplier names. The only unresolved-name tool lead, `Determinant.eq_of_charpoly_frobenius`, is resolved below. R10 records the process-residue exception; no machine path, job id, or HTML anchor appears in the roadmap.

### Seeded source sample

All fifteen selected passages were opened in the cached legal texts. The printed page of DKV18 is its extraction page plus 832. Sources were read, not inferred from the previous report. No additional locator was labelled unverified in the README; the three uncertified works are recorded under Not verifiable.

| Target | Source text opened and printed locator | Outcome |
| --- | --- | --- |
| 0.5 Analytic leading terms | DKV18 lines 55–90, 124–160, 310–330; (2)–(4), pp. 834–835; definition before Theorem 1, p. 837; §1.3, p. 841 | Correct branch, Euler factors, finite first order and separation between rank-r and first nonzero coefficients. |
| 1.3 Poitou–Tate orthogonality | DKV18 lines 392–426, Proposition 2.1, Proof 1, pp. 843–844 | Supports finite-dimensional vector coefficients, common evaluation sign and the global sum. The lattice/rational input is named. |
| 1.4 Reciprocity orthogonality | DKV18 lines 429–474, Proposition 2.1, Proof 2, (23)–(24), pp. 844–845 | Correct equivariance, exceptional-unit spanning and division in characteristic zero; README correctly avoids identifying an uncompleted idele quotient with the whole Galois group. |
| 1.9 Cohomological regulator | DKV18 lines 228–253, comparison following Proposition 1, p. 839 | Supports `det X/det Y = det(−L)/det O`; no extra sign. |
| 2.3 Ventullo family | DKV18 lines 583–612, Lemma 3.1 and shift, p. 848; V15 lines 568–610, 728–792, Theorem 2, p. 14, §§4.1–4.2, pp. 15–20 | Supports the level-one family, constant one, weight shift, absence of Leopoldt assumption and dyadic exponent. The auxiliary-level denominator is nonzero in characteristic zero. |
| 2.5 Semi-cusp family | DKV18 lines 596–641, (28)–(31), pp. 848–849 | All three specializations and both primitive constant terms match. |
| 3.4 Case 1 normal form | DKV18 lines 721–737, proof of Theorem 3.3, pp. 851–852; lines 1425–1431, p. 867 | Basis, dimension `2^r+s−1`, and surviving class of `π^r` agree. |
| 3.6 Case 3 normal forms | DKV18 lines 898–939, Theorem 3.8, pp. 855–856; lines 1474–1487, p. 868 | Relations and proposed basis match; README supplies the source's omitted linear-independence calculation. Distinct y-adic filtration is essential and correctly retained. |
| 4.3 Adapted extension | DKV18 lines 1140–1176, (65)–(69), pp. 861–862 | Upper entry is normalized by `χ⁻¹`; finite module and original topology are retained. |
| 4.4 Infinitesimal characters | DKV18 lines 1188–1223, (70)–(74), p. 862 | The README correctly starts the series at zero and obtains the character product using `yz=0`. |
| 4.7 Restricted ramification | DKV18 lines 1298–1317, Lemma 4.7, p. 864 | Conclusion agrees; README corrects the finite-torsion and compact-lattice defects in the printed proof. |
| 5.4 Inverse determinant | DKV18 lines 1440–1487, Lemma 5.1 and (88)–(89), pp. 867–868 | Correct inverse character, sign, error ideal and y-adic line; fixes the final printed character slip. |
| 5.5 Rank zero | DKV18 lines 55–87, 124–160, pp. 834–837 | Follows from interpolation and empty determinant, including the dyadic pole branch at zero. |
| 5.7 Exact order | DKV18 lines 152–160, discussion after Theorem 1, p. 837 | Equivalence, not unconditional nonvanishing at arbitrary rank. |
| 5.8 Rank one/classical cases | DKV18 lines 133–160, pp. 836–837; lines 228–255, pp. 839; IntegralIwasawaTheory §4.2 | Nonvanishing for `r≤1` and the stated classical specializations agree. Baker–Brumer is used for algebraic coefficients, not arbitrary `E`-coefficients. |

Additional repaired passages were checked against CD14 lines 306–351 (test forms and primary attribution), 1397–1400 (cap-pairing sign), 1426–1472 (Spiess statements/proof); DDP11 lines 1138–1163 (the restricted Eisenstein decomposition); DKV18 lines 981–998 (the representation contract); and DKV16 lines 559–561 (the normalized projection). The errors of extrapolation are stated as findings, not as source certification.

### Adversarial table

Each row records values or algebraic expressions evaluated on both sides. Formal coefficient/algebra examples test identities and do not assert the existence of an arithmetic datum with an open-conjectural vanishing regulator. In particular the Case 3 rank-one Artin example is an algebra test, not a claimed rank-one arithmetic counterexample to §5.8.

| Statement | Instances tried | Computed sides / values | Result and change |
| --- | --- | --- | --- |
| Conventions; 0.1 splitting | `ℚ(i)`, `p=2,3,5` | `χ(p)=0,−1,1`; `r=0,0,1`; arithmetic Artin at `2` on `μ₅` over `ℚ₂` has exponent `2`, inverse Artin exponent `3` | Sound; finite ramification is not an exceptional prime. |
| 0.3 valuation isomorphism | `ℚ(i)`, `p=5`; rank zero | `u=(2+i)/(2−i)` has divisor `(1,−1)`, minus rank `1`; root-of-unity tensor is `0`; rank-zero map is `0→0` with determinant `1` | Sound after rationalization, not an integral unit/divisor isomorphism. |
| 0.4 regulator | `O=(2), L=(3)`; two diagonal entries | `det(−L)/det O=−3/2`; `35/6`; simultaneous basis scaling gives `140/24=35/6` | Sound sign and basis independence. |
| 0.5 leading coefficient | `f=6Ds²`, `r=2`; `f=Ds³` | `f''(0)/(2D)=12D/(2D)=6`; rank-two coefficient `0`, first coefficient `1`; `Dχ` for `χ₄,p=2,3` is `1/2,1` | Sound; denominators nonzero in `E`. |
| 0.6 test forms | `n=2`, one irrational form; zero coordinate form; empty tuple | `a+√2b=0` over `ℚ` forces `(a,b)=(0,0)`; `X₁(0,1)=0`; empty product is `1`, cutoff absolute sum is `Σ 1/|n|=∞` | First two discriminate; empty tuple needs R05. |
| 0.6 moment domain | `F=ℚ, f=1, p=3, c=2, k=1` | full weight moment `(−3)(−2)(−1/12)=−1/2`; principal component `0` by its dense zero even moments | False as written; R03. |
| 0.6 smoothing unit | `p=2, χ=χ₄, c=3` | `h(0)=1+3=4`; `h(1)=1+3/(−3)=0` | Unit at the germ zero, not globally; R03. |
| 0.7 cap pairing | generator acts on `M=ℂ_p` by `2`; `m=6`, `λ=id` | contragredient evaluation `λ(2⁻¹6)=3` on both balanced expressions; wrong action gives `12` | Sound action and balancing. |
| 0.7 nonabelian pairing | `U=S₃`, permutation module; `u=(123)`, coordinate functional `e₁*`, vector `e₂` | `(u e₁*)(e₂)=e₁*(u⁻¹e₂)=1`; using `u` instead of `u⁻¹` gives `0` | Sound for nonabelian groups, not just cyclic ones. |
| 0.7 vanishing/edge | `T=ℤ`, regular module versus trivial module; `E₊=ℤ` | regular: `ker(1−π)=0`, cokernel `ℂ_p`; trivial: kernel `ℂ_p`, hence false edge `ℂ_p→0`; regular with `E₊=ℤ`: both `H₁=ℂ_p` | Freeness correctly excludes failure. Import existing Koszul objects, R04. |
| 0.7 rank two/rank zero | `T=ℤ²`; `T=0` | quotient by `1−π₁` is `ℂ_p[π₂±1]`, then `ℂ_p`; rank zero `I=0`, `M/IM=M`, edge identity | Sound, with multivariable carrier clarification in R04. |
| 0.8 all-prime lower bound | one exceptional coordinate, `k=0`; no exceptional coordinates | `1_O=(1−π)1_{O_R′}`, hence class `0` in coinvariants and integral `0`; rank zero gives `ord≥0` | Sound homological mechanism; depends on repaired analytic comparison. |
| 1.3 Poitou–Tate orthogonality | `r=1`, local `x=−3,y=2`, unit coordinates `o=2,ℓ=3`; `r=0` | `xo+yℓ=−6+6=0`; reversing pairing gives `6−6=0`; empty sum `0` | Sound; a common sign cancels. |
| 1.4 reciprocity orthogonality | quadratic `G={1,c}`, minus unit | term at conjugate prime is `χ⁻¹(c)κ(c⁻¹u)=(−1)κ(−u)=κ(u)`; total `2κ(u)=0` gives `κ(u)=0`, also over `ℚ₂` | Sound; rational division, not integral division by two. |
| 1.9 cohomological regulator | `O=diag(2,3)`, `L=diag(5,7)`, `Y=I` | `X=diag(−5/2,−7/3)`; `XO+YL=0`; both determinants ratios `35/6`; empty ratios `1` | Sound. |
| 2.2a proposed basis | `F=ℚ, b=8, k=4, ψ=1` | two distinct indexed forms both have coefficients `(1,0,28,0,126,0,344,0,757)` and constant `0`; relation coefficients `(1,−1)` give zero | False; R01. |
| 2.2a retained elementary Checks | levels `11`, `p²`, and `4` | weight two level `11`: `2=1+1`, Hecke eigenvalues `3,−2`; weight at least four level `p²`: `p+1` pairs; weight three/χ₄: eigenvalues `−8,8` | These small tests are sound but did not detect level `p³`. |
| 2.3 weight shift | evaluate shifted coordinate at `ν_k`; auxiliary prime norm `q` | `((1+u^(k−1)−1)/u)−1=u^(k−2)−1`; at `k=1` this is `u⁻¹−1`, hence constant form `1`; denominator `(q+1)/q≠0` | Sound shift and normalization, including `p=2`. |
| 2.4 case split | equal leading orders; inverse orientation; `w=−1` | `ord W=s−t`, inverse has `t−s`; for `s=t`, sign ratio is `1`, so `w=a/b`; `w=−1≠0` remains Case 2 | Repaired Checks sound. |
| 2.5 semi-cusp constants | Case 1; primitive Case 2; `w=−1` | `2^(−d)ℒ−2^(−d)D·ℒ/D=0`; primitive second constant cancels with `E(χ,1)W`; specialization `(1+w)E₁=0` | Sound. |
| 2.6 projection | identity eigenvalue versus zero operator | normalized `t` gives `ν₁(t)E₁=E₁`; zero gives `0≠E₁`; Eisenstein separator `T₂−3` gives `0` and `−5` on level-eleven components | Normalization sound; decomposition input needs R01. |
| Layer 2 supplier range | `F=ℚ(√5),p=11,α=−4−√5` | `Nα=11`; residues `0,3`; valuations `1,0`; square unit at second prime; `#R=1,#R′=1`, but conductor not prime to `11` | Contract failure, R02. |
| Layer 2 Examples | `F=ℚ,r=1` | number of primes above `p` is `1`; `#R′=1−1=0`, whereas Case 1 needs `#R′≥1` | R07. |
| 3.4 Case 1 basis/graded line | `r=1,s=2,a=1`; `r=2,s=3` | `ε=−π²`, basis `1,π,π²`, dimension `3`; second dimension `4+3−1=6`, basis `1,π,π²,ε₁,ε₂,ε₁ε₂`, with `ε₁ε₂=π³` | Sound; `π^r` survives in degree r. |
| 3.6 Case 3 two filtrations | `r=t=1,s=2,a=b=1,c=−1` | `y=−π²`, `ε=−π²`, basis dimension `3`; `y mod 𝔪²=0`, but `yW/y²W=E·y≠0`; `z mod 𝔪²=π≠0` | Sound and discriminating. |
| 3.8 Hecke image headline | rank-one Case 1, `s=1` | `W₁=E[π]/π²`, `U_p=1+aπ`; basis dimension `2=2^1+1−1`, top product `aπ` | Source theorem checked; algebra and Hecke relation agree. |
| 3.9 Hecke image headline | `r=s=1,w=−1`; `w=1` | first: `π=0,ε=−ay,z=−y`, dimension `2`; second: `y=π/2,ε=aπ/2`, bad-prime image `1+(log⟨Nℓ⟩)π/2` | Sound; no division by `1+w` in general. |
| 3.10 Hecke image headline | `r=t=1,s=2`; general `d=s−t≥1` | basis `1,π,π²`, `y=cπ²`; elimination order `j+t−m+d≥2s−t≥s+1` | Sound stronger truncation and independence route. |
| 4.1 representation contract | complex conjugation; `χ₇,p=2`; coefficient-order dimension | `det=−1,trace=0,eigenvalues=±1`; modulo `ϖ_E`, `−1=1`, but in `E`, `−1≠1`; ring dimension `2`, localization dimension `1` | Representation test sound; dimension label R06. |
| 4.2 simultaneous element | split residual eigenvalues `1,−1` in `E`; line `(1,1)` | eigenvalue difference `−2≠0` even for p-adic coefficient prime `2`; both coordinates of `(1,1)` nonzero, unlike either eigenline | Correct residual field and line-avoidance condition at all primes above p. |
| 4.3 upper cocycle | `χ(g)=−1,χ(h)=1`, `b(g)=2,b(h)=3` | `b(gh)=3+2=5`, normalized value `−5`; `κ(g)+χ⁻¹(g)κ(h)=−2−3=−5`; unnormalized left expression `2−3=−1` | Sound normalization. |
| 4.4 infinitesimal characters | `A=(ε−1)/π`, `yz=0`; two-term test `A=3` | `(1+Ay)(1+Az)=1+Aπ+A²yz=ε`; without orthogonality, extra term is `9yz` | Sound product and constant term `1`. |
| 4.5 refined diagonal | residual `τ=diag(1,−1)` | second-trace system determinant `−2`, hence invertible over `E`; residual trace alone `a+d` cannot distinguish `(a+t,d−t)` | Sound use of both traces, not trace alone. |
| 4.6 local comparison | `ρ=[[2,1],[0,3]]`, ordinary eigenline `(1,1)` of eigenvalue `3` | `b=(1/1)(3−2)=1`; `c=(1/1)(3−3)=0` | Both formulas and directions agree. |
| 4.7 ramification | residue characteristic `ℓ≠p`; `χ(g)=−1`, local coefficient `v=2` | finite torsion maps to `0`; pro-ℓ/pro-p intersection image `0`; local formula `(1−χ⁻¹(g))v=4` equals coboundary of `−2` | Sound finite-part treatment and coboundary sign. |
| 4.8 inertia generation | quotient class coboundary, `χ(τ)=−1` | `κ(τ)=(−1−1)v=−2v=0` forces `v=0`; all generating values zero, finite-module Nakayama gives quotient `0` | Sound; finiteness is explicitly established in 4.3. |
| 4.9 second-order bound | `Â=E[[t]],α=t⁻¹`, inertia values `αtE[[t]]` | `B⊆E[[t]]`; `𝔪B⊆tE[[t]]=α𝔪²` | Sound without integrality of α. |
| 5.1 exact determinant | weighted rows with scalars `2,3`, columns `(3t,−2t)` and `(6t,−4t)` | weighted column sums `6t−6t=0`, `12t−12t=0`; unweighted determinant `−12t²+12t²=0` | Sound cancellation in the total quotient ring before specialization. |
| 5.2 leading determinant | `r=s=2`, `O=diag(2,3)`, `L=diag(5,7)`, `a=35/6` | `35z²+6(−a z²)=0`; regulator `35/6`; if `s>r`, product dies in degree r and coefficient `det L=0` | Sound sign and graded comparison. |
| 5.4 inverse determinant | `r=t=1,s=2`, `O⁻=2,L⁻=3`, `b=−3/2` | `(3+2b)y=0`; `b=−3/2=R_p(χ⁻¹)`; `𝔪y=y²`, nonzero quotient line retained | Sound; maximal-ideal degree-one quotient would incorrectly give zero information. |
| 5.5 rank zero | `χ₄`, `p=2,3` | `fχ(0)=Dχ=1/2,1`; quotient `1,1`; empty regulator `1`; order `0` | Sound boundary theorem; not Lean padding because not declared there. |
| 5.6 headline | `χ₄`, split `p=5`; coefficient comparison | `Dχ=1/2`, `o(u)=1`; both normalized expressions reduce to `−log₅ u`, and derivative is `−(log₅ u)/2` | Source Theorem 1 verified; determinant normalization consistent. |
| 5.7 equivalence | formal germs `Ds^r` and `Ds^(r+1)` | first: order `r`, normalized coefficient `1≠0`; second: order `r+1`, coefficient `0` | Both implications tested; no exact-order assumption. |
| 5.8 rank-one nonvanishing | `u=(2+i)/(2−i)` | valuations at conjugate primes `(1,−1)`; a putative `u^N=ζ·5^k` forces `(N,−N)=(k,k)`, hence `N=k=0`, contradicting `N≥1` | Logarithm kernel excludes zero in this example; general algebraic-character case uses the named Baker–Brumer supplier. |

### Pinned libraries, ownership and supplier resolution

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The following native definitions/statements were opened, not inferred from name matches:

| Object | Pinned file and line | Relevant qualification |
| --- | --- | --- |
| `Matrix.det`, `Matrix.det_mul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63,141` | Finite square matrices over a commutative ring; empty product is one. |
| `Matrix.det_nonsing_inv` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean:422` | Ring inverse on the determinant; use nonzero determinant over E for the intended division. |
| `LinearMap.det`, `LinearMap.det_toMatrix` | `Mathlib/LinearAlgebra/Determinant.lean:164,203` | Native determinant has fallback one without a finite basis; §0.3 supplies the finite-dimensional basis here. |
| Class-group finiteness; unit rank | `Mathlib/NumberTheory/NumberField/ClassNumber.lean:59`; `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:462` | Ordinary number-field units and class group; the p-unit/minus-component adapter is new. |
| Totally real / CM | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48`; `Mathlib/NumberTheory/NumberField/CMField.lean:70` | Totally real condition on infinite places; CM is totally complex and quadratic over its maximal real subfield. |
| Power-series coefficient, variable, order | `Mathlib/RingTheory/PowerSeries/Basic.lean:77,155`; `Mathlib/RingTheory/PowerSeries/Order.lean:50` | Zero series has order infinity; §0.5 separately proves a nonzero analytic germ. |
| Henselian completion | `Mathlib/RingTheory/Henselian.lean:81,154` | Henselian at a specified ideal; adic completeness supplies the instance. |
| Total fractions | `Mathlib/RingTheory/Localization/FractionRing.lean:52` | Localization at nonzerodivisors, not automatically a field. |
| Laurent polynomials; regular sequences | `Mathlib/Algebra/Polynomial/Laurent.lean:85`; `Mathlib/RingTheory/Regular/RegularSequence.lean:147` | One variable in the first carrier; regularity includes the nonzero final quotient. |
| Group homology and projective-resolution computation | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226,246,254` | Algebraic representations, not continuous cohomology; no cap/edge theorem is supplied by these names. |
| Shapiro | `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65` | Native induced representation; gives the rank-one edge Check. |
| Continuous `H¹`, trivial-action homomorphisms | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829,1057` | Quotient of continuous cocycles; preserves nondiscrete coefficients. Its additive carrier alone does not supply the E-linear local-condition space. |
| Local Artin map and its topology/norm | `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,188,248,345` | Map on local-field units into topological abelianization; dense, continuous and norm-compatible. |
| Dyadic Frobenius witness | `TauCeti/NumberTheory/ClassFieldTheory/Local/Cyclotomic.lean:205` | Arithmetic exponent two on fifth roots over `ℚ₂`; inversion gives exponent three. |
| Koszul substrate | `TauCeti/RingTheory/KoszulComplex/Basic.lean:219,399`; `TauCeti/RingTheory/KoszulComplex/Regular.lean:140` | General commutative-ring carrier and weakly regular exactness; R04. |
| Presented Hecke L-function | `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` | Arbitrary number field, presented ray-class character, meromorphic-continuation carrier; R09. |

Object searches were run over both pinned libraries, main, the available open heads using `roadmaps grep`, and the indexed board packages. The board index was read before considering absence. The indexed AnalyticNumberTheory and LogicAndDefinabilityInNumberTheory READMEs were fetched at the supplied heads; their object searches identify no Gross–Stark, Sczech, Eisenstein-complement or Koszul owner. The indexed LawrenceVenkateshMethod README returned HTTP 404 and is recorded below as unverified. The closest open roadmaps were read by scope and supplier section: #1306 IntegralIwasawaTheory, #1307 NoncommutativeAndEquivariantIwasawa, #1019 PadicFamilies, #1311 EulerSystemsCyclotomicMainConjecture and #1066 OrdinaryAutomorphicFormsAndModularityLifting. The last supplies the series, not the complement. EulerSystemsCyclotomicMainConjecture has specialized cyclotomic/dyadic unit-logarithm applications; it does not own the general totally-real Gross–Stark determinant or the three Artin quotients. Singular cap-product roadmaps concern topological spaces/local systems; they do not already state the discrete-group dual-coefficient pairing in §0.7. The Koszul overlap is the exception recorded in R04.

The current supplier resolutions are as follows. Line numbers refer to the actual README, excluding the one-line wrapper added by `roadmaps show`.

| Supplier | Sections and resolved evidence |
| --- | --- |
| ClassFieldTheory, main | Layers 7, 11, 12, 13 at `TauCetiRoadmap/ClassFieldTheory/README.md:1204,1781,1834,1924`. The former §2.6 citation is valid: the old-to-new mapping at line 267 points to C.6 at line 531. The cyclotomic inverse-norm convention occurs at lines 543 and 1230. |
| Chebotarev, main/completed | `TauCetiRoadmap/Completed/Chebotarev/README.md:410,416`, Layer 10 and `hasDirichletDensity_frobeniusPrimeSet`. |
| LFunctions, main | `TauCetiRoadmap/LFunctions/README.md:929,1440`, Layers 5 and 7, finite-order Hecke functions and character-specific nonvanishing. |
| IntegralIwasawaTheory, #1306 | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:63,97,704,857,912,1302`: §§0.1, 0.4, 4.2, 6.0, 6.3, 9.3. Read `algebraicLog_kernel`, `bakerBrumer_algebraicNumbers`, rationality/distribution declarations, `deligneRibet_arithmeticInterpolation`, `deligneRibet_characterNumerator`, cusp geometry and Hasse lift. The G/H pole denominator and dyadic coordinate are retained. |
| ArithmeticGaloisDuality, #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700,1401,2294,3118,3436,6018,6222`: R02.1.3, R02.2.3, R02.3.3, R02.4.2, R02.4.3, D7.6, D7.7. Read rational/lattice descent, S-unit/Picard term, dual-first cup sign, Poitou–Tate, real-place correction and dual local conditions. |
| DirichletPadicLFunctions, #1039 | `TauCetiRoadmap/DirichletPadicLFunctions/README.md:268`, §0.6. Read the decomposition predicate, normalized logarithm predicate, intrinsic finite-extension construction, norm/trace law and generator transport; deep-unit series alone is not the global Iwasawa logarithm. |
| IntegralHeckeAndGaloisDeterminants, #1689 | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2270,2444,3244`, §§1.3, 1.4, 4.1. The disputed name `Determinant.eq_of_charpoly_frobenius` is explicitly present at line 3258 with Hausdorff coefficients and conjugacy density; its absence from the libraries is not a missing-supplier finding. |
| NoncommutativeAndEquivariantIwasawa, #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2519`, §F.5; the exact prime/conductor qualification is at line 2533. Both lattices, ordinary control, Hecke images and fractional Eisenstein families are supplied in that range. |
| PadicFamilies, #1019 | `TauCetiRoadmap/PadicFamilies/README.md:2848,2876,2914,2928,2942`, §§5.9a–5.13. Fourier injectivity, minimal-tame-level reducedness and product of eigenfamily fields exist. R02 records the missing ramified-character range, rather than pretending these sections are absent. |
| OrdinaryAutomorphicFormsAndModularityLifting, #1066 | `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md:365,367,369`, §2.12(a,b) and explicit nonownership of the complement. The representation gap is correctly anchored; the coefficient-formula witness for R01 is in clause (a). |

The overlaps report lists no conflicting head, dropped cited id or id available only in a revision. Main's explicit ClassFieldTheory numbering map was checked; it prevents a false drift finding. No two-way supply or upward edge was found. There is no competing fully qualified Lean declaration because this package declares none.

All three declared gaps have the same slug and named supplier in `design/plan.json` and the README. Their needs are precise extensions of the indicated family/localization/representation interfaces, not ownerless prerequisites. They are not findings merely because the suppliers have not implemented them. R02 identifies a different missing range not covered by those contracts.

The required dependency command, with the prescribed configuration, name, order, `--movable` and content checkout, returned exit zero and exactly:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This mechanical success does not detect a supplier's narrower character hypothesis.

### Headline coverage, elaboration and padding

The README headlines are the all-prime lower bound (§0.8); cohomological regulator formula (§1.9); three Hecke-image identifications (§§3.8–3.10); Gross–Stark leading term and rank zero (§§5.5–5.6); and exact-order/rank-one consequences (§§5.7–5.8). Every one is named in the module docstring with missing native infrastructure. Searches for the actual objects, including Deligne–Ribet functions, global Iwasawa logarithms and ordinary Hilbert family/Hecke carriers, found no carrier that makes those headlines statable with only a few simple definitions. The existing complex Hecke carrier corrects one reason in that docstring, not this conclusion. No statable headline was replaced by arbitrary scalars, a free proposition or a bounded substitute.

Ran `lake env lean` on the absolute path of the package's `Suggested.lean`, from the pinned content checkout as prescribed. Exit code `0`, no output: no errors and no warnings, including no sorry warnings. There is one `import Mathlib`, one module docstring, the correct namespace, and zero declarations. No Tau Ceti object build was needed. The every-declaration signature check has an empty domain, and the one-tactic padding probe likewise has exactly zero sorried theorems to probe. No boundary/API/Check padding was found in Lean. Nothing was proved in place or added to enlarge the file.

## Not verifiable

- `packages/LawrenceVenkateshMethod/README.md` at the board index's head `9ee7ac3` (board pull request #345): the supplied GitHub contents endpoint returned HTTP 404. Ownership against this one board package was not checked; no absence claim is made about it.
- `Sc93`, Theorem 4: settled `uncertified`; the original paywalled text was not read. CD14 line 351 confirms attribution and restriction, not the original proof.
- `W86`, Proposition 1.5: settled `uncertified`; the original paywalled text was not read. DDP11 lines 1157–1163 were read for their actual restricted statement. They cannot certify the arbitrary-level extrapolation in R01.
- `Br82`, Chapter V §3 and Chapter VII §6: settled `uncertified`; the book text was not read. The cap calculation and product-group double-complex argument were checked directly, and CD14's special case and proof were read.

No settled source was requested again; no new missing-reference request was created. Supplier gaps remain future library contracts, not claims of completed formal proofs. The successful empty Lean build supplies elaboration evidence only, not mathematical certification of the README.

## Source issues

- **Misprint** in DKV18 at §1.3, definition after (14), p. 841: the source says the first nonzero derivative uses the branch χ; it should use χω, consistently with the interpolation and main theorem; affects nothing.
- **Misprint** in DKV18 at Remark 1.1, p. 837: the source says the regulator composite acts on the unit component; it should act on the divisor component, with a conjugate on units; affects nothing.
- **Gap** in DKV18 at Theorem 3.2, p. 849: the source says there exists an operator making the family cuspidal without fixing its Eisenstein eigenvalue; it should also require eigenvalue one on the weight-one Eisenstein form; affects the proof.
- **Misprint** in DKV18 at §4.3 before (70), p. 862: the source says the cyclotomic character expansion begins in degree one; it should begin in degree zero with constant one; affects nothing.
- **Gap** in DKV18 at proof of Lemma 4.7, p. 864: the source says local inertia image is pro-ℓ and the coefficient vector space is pro-p; it should separate finite torsion and place compact images inside p-adic lattices; affects the proof.
- **Misprint** in DKV18 at §5.2, p. 867: the source says the first lower-entry product uses the same group argument twice; it should use the second argument in the diagonal factor; affects nothing.
- **Misprint** in DKV18 at the conclusion after (89), p. 868: the source says equality of first and rank-r coefficients concerns χ; it should concern χ⁻¹, whose order is t; affects nothing.
- **Misprint** in CD14 at proof of Theorem 5.1, p. 31: the source says a free group-ring module has homological dimension one; it should have projective dimension zero, yielding vanishing in every positive degree; affects nothing.
- **Misprint** in V15 at the final sentence of §4.2, p. 20: the source says the construction finishes Theorem 1; it should refer to Theorem 2; affects nothing.
