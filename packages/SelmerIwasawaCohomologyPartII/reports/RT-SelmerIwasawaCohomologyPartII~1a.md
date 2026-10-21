<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/589#issuecomment-6322183276 -->
Red team round 1 pass a (codex) of aac0445

Verdict: needs_changes

1. **F01** (P3) The cited archimedean supplier target has a different name

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:117, also :579: “The multiplicity of archimedean packets”.

   **Claim:** This is an exact target locator in AutomorphicGaloisRepresentationsPartII AG2.1b.

   **Witness:** TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1169 at c4cc6a1 names the target “The archimedean packet multiplicity”. The heading used by this package is absent. The supplied statement retains ST/END at :1171.

   **Exact repair text:** Replace every “The multiplicity of archimedean packets” in supplier citations with “The archimedean packet multiplicity”. Keep the compact ST/END restriction and the separate diagonal-concentration contract.

2. **F02** (P2) Integral Hecke normalization divides by an unspecified unit

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:29: “retain the fixed Haar measure at every other level, where the normalized idempotent is e_K=1_K/vol(K)”.

   **Claim:** This normalization is available throughout the integral and finite-coefficient level comparisons and is compatible with the stated spherical unit.

   **Witness:** With counting measure on C₂ and coefficients 𝔽₂, vol(C₂)=0 and 1_C₂*1_C₂=0, so e_C₂ is undefined. SmoothRepresentationsOfLocalGroups §SR.1.1 explicitly requires unit volume; ltxzz line 3774 distinguishes the two odd-rank level measures.

   **Exact repair text:** “All integral level algebras and mixed-level incidence maps use the permutation-module, coset-counting convention of SmoothRepresentationsOfLocalGroups §SR.1.2 and §SR.4.4. Their level units are 1_K. When comparing with convolution for a fixed Haar measure, write e_K=vol(K)⁻¹1_K only after assuming that vol(K) is a unit in the coefficient ring, and specify the rescaling of each mixed-level map. The incidence matrices and reciprocity factors below use the coset-counting convention of ltxzz Definition 5.8.1 and Remark 5.8.2.” Add the C₂ control to the normalization Checks.

3. **F03** (P2) The definite test pairing lacks its adjoint Hecke action

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:638–641: “The finite-set pairing descends because nα annihilates the test module.”

   **Claim:** An annihilator for the same unspecified Hecke action automatically pairs with the quotient by that ideal under the unweighted finite-set dot product.

   **Witness:** Over 𝔽₇, let P cycle e₀,e₁,e₂ and f=(1,4,2). Then (P−2)f=0, but ⟨(P−2)e₀,f⟩=2. Thus the asserted descent fails unless the action on the test functions is transposed.

   **Exact repair text:** “Put Mα=Oλ[Sh°_nα] with its specified geometric Hecke action and Aα=Mα/nαMα. Equip Hom_Aₘ(Mα/λᵐMα,Aₘ) with the transpose action (t·f)(x)=f(tx), and define Bα as its nα-annihilator. Via the delta basis, evaluation is the finite-set summation pairing. Prove that this action agrees with the native function-space convention used in ltxzz Theorem 7.2.8(3), recording the inverse-double-coset involution from SmoothRepresentationsOfLocalGroups §SR.1.2. Then evaluation descends to Aα×Bα.” Add a named target for this comparison and the cyclic three-point negative control; do not silently assume that every Hecke operator is self-adjoint.

4. **F04** (P2) The special-map contract omits the parity of its Cartesian squares

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:155, :157 and :789: “the basic and link Cartesian squares”.

   **Claim:** The supplier contract and the second geometric reciprocity proof use an unspecified Cartesian basic-correspondence square across the standing domain n≥2.

   **Witness:** ltxzz line 2286 assumes even n; line 2297 explicitly says that square fails for odd n≥3. The actual all-parity product square uses Proposition 4.5.5 for even n and Lemma 4.5.2 for odd n (line 2552).

   **Exact repair text:** “Supply the addition-of-line maps and uniformization compatibilities on the native level domains. The square of Proposition 4.5.5 is Cartesian for even n; the ground square of Proposition 5.10.6 is Cartesian for odd n; use the respective even/odd link squares of Lemma 5.10.8(1)/(2). For §6.2 supply the product square displayed in the proof of Theorem 4.6.2 (ltxzz line 2552), using Lemma 4.5.2 in odd rank. Retain the isogeny scaling by ϖ.” Put these hypotheses in both occurrences of gap:unitary-special-compatibility, including its plan entry. Replace §6.2's generic square reference with this product-square locator and add an n=3 control excluding the square of Proposition 4.5.5.

5. **F05** (P2) The standing exceptional set omits ramification of the CM field

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:23, :632 and :767: “Σ⁺min contains the ramification supports of the standing representations”.

   **Claim:** This support condition suffices to form the standing abstract unramified unitary Hecke algebras and the first/second reciprocity data.

   **Witness:** ltxzz line 434 defines Σ⁺bad from rational primes ramified in F; lines 1038–1039 include it in Σ⁺Π; lines 1112–1119 require Σ⁺⊇Σ⁺bad. An unramified representation does not make a ramified unitary group hyperspecial.

   **Exact repair text:** “Let Σ⁺bad consist of every place of F⁺ above a rational prime ramified in F. Let Σ⁺Πα be the union of Σ⁺bad and the finite ramification support of Πα. Fix finite Σ⁺min⊇Σ⁺Π₀∪Σ⁺Π₁. All abstract unitary Hecke algebras and contracted ideals below are taken away from sets containing Σ⁺min.” Retain the separate condition that Σ⁺min avoids ℓ when L2 is required. This also defines the otherwise unexplained Σ⁺Π used in §2.1.

6. **F06** (P3) The second-datum Check cannot detect the extra hypotheses it rejects

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:782: “changing these extra labels cannot change the datum”.

   **Claim:** This checks that the second datum omits the first law's rigidity and intertwining conditions.

   **Witness:** A wrong predicate D′=D∧Rigidity∧Intertwining is also unchanged by replacing proof witnesses or unrelated labels. The Check supplies no datum satisfying D but failing either extra condition, so it does not discriminate D from D′.

   **Exact repair text:** Replace this bullet with: “Second polynomial domain: over 𝔽₁₉ at q=3, take even roots {3,13,18,18} and odd roots {1,2,10,4,5}. The respective derivatives at 3 and 1 are 11 and 13; the tensor root 3 is simple, with derivative 4. Thus the polynomial clauses PII4 and PII7 hold, but P₀(−1)=0 violates the first law's even intertwining clause. This tests polynomial clauses only, not existence of a global automorphic datum.” Keep the separate multiplicity and positive-depth Checks.

7. **F07** (P3) Distinct Layer 3 theorems share undifferentiated dependency lists

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:445–449 and :457–463: “Under cohomological genericity”; “Under A6.1.4 alone”.

   **Claim:** Each subsection's single Needs line describes several conclusions with different hypotheses and proof inputs.

   **Witness:** In §3.1 boundary comparison uses residual irreducibility, the intertwiner uses P5, and concentration uses cohomological genericity. In §3.2 surjectivity needs neither A6.1.4 nor H(N), but its shared list includes automorphic-multiplicity. Compare ltxzz lines 5221, 5255 and 5304.

   **Exact repair text:** Split §3.1 into named boundary-comparison, localized-intertwiner and integral-concentration targets, each with its present hypothesis sentence and its own Needs line. Bind boundary-cohomology only to the first, the local Hecke/rank comparison only to the second, and derived reduction plus cohomological genericity only to the third. Split §3.2 into odd-surjectivity, odd-E₂-concentration and odd-Frobenius-comparison targets; retain respectively Datum 2.1, Datum 2.1+A6.1.4, and Datum 2.1+A6.1.4+A6.1.6+H(N). Attach automorphic-multiplicity and weak-semisimplicity inputs only to the last target. Keep the existing source locators beside the individual claims.

8. **F08** (P1) Contracted integral Hecke kernels do not impose λᵐ over ramified coefficients

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:303 and :500: “contractions ... of the kernels of φΠ modulo λ and λᵐ”; “/nΠ≃(R̄⁽ᵐ⁾,c)^⊕μ”.

   **Claim:** Quotienting an Oλ-module by the ideal contracted in the abstract integral Hecke algebra produces the specified λᵐ-level eigenspecialization, for every allowed strong coefficient field, including ramified extensions. The imported abstract algebra is integral (ltxzz line 1112); the README never extends it before taking these kernels. A totally ramified quadratic coefficient enlargement leaves the raw residual character kernel unchanged, while flat base change doubles the length of a nonzero residual quotient. Thus this issue also persists under the permitted scalar extension of native data.

   **Witness:** Take T=ℤℓ, O=ℤℓ[π]/(π²−ℓ), M=O and m=1. The contracted kernel T→O/(π) is (ℓ). Consequently M/nM=O/(π²), not O/(π); π acts nontrivially on the former.

   **Exact repair text:** “For every away-set Σ, first form the coefficient Hecke algebra T_O^Σ=Oλ⊗ℤT^Σ and the Oλ-algebra character φ_O(a⊗t)=aφΠ(t). Define n_{Π,m}^Σ=ker(T_O^Σ→Oλ/λᵐ) and mΠ^Σ=n_{Π,1}^Σ. Contract only between these coefficient Hecke algebras when changing Σ. Thus n_{Π,m}^Σ contains λᵐ and includes t−φΠ(t); every quotient M/n_{Π,m}^ΣM is the actual coefficient eigenspecialization. Use the analogous Eλ-algebra kernel for rational quotients.” Apply this convention to §§2.1, 3.5–3.6, 4.3–4.5, 5.1, 6.1 and 7.3 and to the finite-support supplier contract. Add the ramified quadratic control; do not exclude ramified coefficient fields. Explain this coefficient extension explicitly when citing ltxzz Notation 6.1.3 (line 5195), whose bare integral-algebra notation cannot serve as the literal definition at this generality.

## Verified sound

Read **9 Lean declarations** (one definition, six theorem signatures, two proved examples), **69 bold README targets** (21 supplier obligations and 48 native API targets), and all **40 numbered target subsections**. Inspected **91 Check bullets**; the five controls for the kept period definition occur in the two proved examples. R06 records a nondiscriminating Check. Read all 970 README lines and all 95 Lean lines.

Verified **142 distinct explicit source-id/line locations** in the six cached works: 123 ltxzz, 5 ltxzz-published, 3 ltxzz-deformation, 4 liu-tian, 4 stacks-blowup and 3 stacks-projective. These counts concern locators and their surrounding statements, not independent proofs of the cited theorems; R04 identifies a dropped source restriction, and R03/R08 require conventions beyond literal transcription of the source notation. The published intersection definition of reflexive closure, the two projective-bundle conventions, the exceptional normal signs, the two weaker conclusions of Remark 7.2.6, and the factors in both reciprocity laws were checked explicitly.

Checked **24 named roadmap supplier blocks**, with section/name searches and domain reads, and all **21 declared gap slugs and owners** against the plan. R01 records the exact-heading mismatch; R04 concerns the precision of an existing contract, not its absence. The residual integral nearby complex remains a declared gap; the last repair's F01 is not re-raised. Inspected the six specifically supplied sibling checkouts for ownership overlap. General coefficient algebra, continuous cohomology, Satake formulas, finite-condition predicates and blowups keep their existing owners. No ownership move to a later roadmap is required by these findings.

Read the cited declarations and surrounding instances in **10 pinned library files**, at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: polynomial evaluation, derivative and reflection; PID torsion and freeness; continuous cohomology and functoriality; low-degree cohomology; Rees algebra and affine blowup charts. The finite-period signatures have explicit binders and agree with their README generality. No admitted data, admitted example, `set_option`, `lemma`, extra import, process narrative or computational algorithm was found in Suggested.lean. The native geometric headlines are not replaced by these finite-sum identities.

The committed diff is confined to the package. The requested dependency gate returned:

```text
depcheck: 7 roadmaps, 63 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Direct checking also places every named supplier in the permitted earlier/main domain. The gate's seven-roadmap graph does not certify every semantic prerequisite.

The declaration table records all contexts; none relies on a section variable surviving a `sorry`.

| Location / declaration | Layer and complete variable/instance context | Instances tried | Result |
|---|---|---|---|
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:23 — `definiteDiagonalPeriod` | Layer 5; S:Type u, Fintype S; X:Type v; Y:Type w; R:Type z, AddCommMonoid R; no section variables | Empty S; zero monoid; double fibre | Finite sum is defined; no finite X/Y required |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:28 — `definiteDiagonalPeriod_add` | Layer 5; Same as definition; f,g:X×Y→R; no section variables | Torsion coefficients; empty S | Additivity uses only AddCommMonoid |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:36 — `definiteDiagonalPeriod_smul` | Layer 5; Fintype S; X,Y arbitrary; R:Type z, Semiring R; c:R; no section variables | Zero semiring; noncommutative semiring | Left distributivity suffices; no commutativity missing |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:43 — `definiteDiagonalPeriod_map` | Layer 5; Definition context plus T:Type t, AddCommMonoid T; h:R→+T; no section variables | Reduction ℤ→ZMod 2; zero map | Additive map commutes with finite sum |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:50 — `definiteDiagonalPeriod_reindex` | Layer 5; Definition context; S':Type t, Fintype S'; e:S'≃S; no section variables | Boolean swap; empty equivalence | Transported legs preserve every source multiplicity |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:59 — `definiteDiagonalPeriod_fiber` | Layer 5; Fintype S,X,Y; AddCommMonoid R; universes u,v,w,z; no section variables | Two coincident source points; empty fibre | Nat.card gives multiplicity 2 or 0; fibre partition proves identity |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:68 — `definiteDiagonalPeriod_exists_ne_zero` | Layer 5; Definition context; h:period≠0; no section variables | Empty S; ±1 cancellation; zero monoid | Only forward implication; no cancellation/domain premise required |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:77 — `example 1` | Layer 5; Closed; PUnit, Bool, Fin 0; coefficients ℤ; no section variables | Singleton, double, empty | Computed values 1,2,0; proof inspected, not elaborated |
| packages/SelmerIwasawaCohomologyPartII/Suggested.lean:88 — `example 2` | Layer 5; Closed; Bool, PUnit; coefficients ℤ and ZMod 2; no section variables | Signed values; two equal values mod 2 | Computed values 0,0; proof inspected, not elaborated |

The following table covers every numbered target block and its definitions, identities and named API assertions. “None” means no additional defect found in these tests; statements using supplier gaps remain conditional on those contracts. The individual bold-target ledger follows the subsection tests.

| Statement block, including all its API targets | Instances tried | Result | Change |
|---|---|---|---|
| Standing domains | n=0,1,2; m=0,1; zero ring; equal characteristic; inseparable extension; nonseparated scheme | Native hypotheses exclude n<2, m=0 and non-number-field coefficient domains. The period permits zero coefficients. Native geometry is separated and finite type; no inseparable number-field extension enters. | R02, R05, R08 |
| Frobenius, twists and groupoid trace | Arithmetic/geometric p=3; (I,−1)c squared; rank-(2,3); sign action; free two-point orbit over 𝔽₂ | Scalars 9 and 1/9; square −I; tensor twist 2; coboundary −2; orbit trace 1. No averaging by 2 is justified. | R02 |
| §1.5 | ℚ(i), p=2,3,5; local degree 2; identity transport | Only 3 passes; residue cardinality 9. Published intersection convention agrees with M0.26. | None |
| §1.6 | n=2; ℓ=2,3; ξ=±1; conjugation and homothety | L1 rejects small primes; L5 excludes identity witnesses. Tensor twist 2 and rank 6 agree. | R05 standing support |
| §2.1 | m=0,1,2; empty/infinite raising support; ramified quadratic coefficient extension | Finite support and positive m are essential. Literal integral Hecke contraction does not give λ-level specialization. | R05, R08 |
| §2.2 | N=2,3; empty indexing scheme; residue extension | Fibre dimensions 0,1 and codimension 1 agree with Theorem 4.3.5. Uniformization remains native. | None |
| §2.3 | xy=p; p=3 quartic; invert p; reverse normal | Reduced branches and opposite normal degrees 16,−16 agree. Generic chart smooth. | None |
| §2.4 | Projective fibre dimension 0; ℓ dividing p+1; free C₂ orbit in characteristic 2 | Degree inversion is restricted; orbit trace is 1 although total trace is 0. | None |
| §2.5 | N=2,3; both incidence matrices; F=4 on ℤ₃; nonproper punctured affine line | Alternating signs, zero-link case, twist −1 and invariants/coinvariants distinction hold. Nonproper abutment is nearby cohomology. | R02 normalizations |
| §2.6 | Blow up (x,u) in xy=uv=p; centre itself; quartic normal; empty centre | Charts xtv=p and usy=p have three branches. Bundle is generally nontrivial; section square −16 and Chern relation agree. Cartier lifting is only sufficient. | R04 supplier precision |
| §3.1 | Bad Satake constituent before localization; residual concentration; adjacent integral torsion | Localization and derived reduction are needed; three conclusions have different hypotheses. | R07 |
| §3.2 | N=3; absent H(N); absent concentration; nonsemisimple eigenvalue 1 | Surjectivity has the weaker domain; Frobenius comparison requires the additional premises. | R07 |
| §3.3 | N=2; zero localized support; transferable level outside S_FL domain | Nonzero support and rigid deformation hypotheses are retained; wider transfer domain is an explicit gap. | R02, R08 inherited conventions |
| §3.4 | Distinguished pair p,p⁻¹; residual eigenvalues 1,p² | Exclusion removes these two values on the specified ground term, not on every cohomology group. | R08 coefficient convention |
| §3.5 | Integral versus finite coefficients; F−1 with nonunit determinant | Singular comparison has its even-rank/unit premises; quotient must be the coefficient specialization. | R08 |
| §3.6 | Multiplicity 1,2; lattice homothety; π²=ℓ | No canonical summand is claimed. Literal nΠ quotient can have length 2 when the claimed residual realization has length 1. | R08 |
| §3.7 | Empty auxiliary set; two rational supports; missing intertwining genericity | Identity case and finite-place iteration agree with Lemma 8.1.7; genericity is not silently omitted. | R02 normalization |
| §4.1 | n=2; incompatible levels; identity; source-only degree-2 refinement | Dimensions 1,2,3; compatible refinement need not be Cartesian. | R05 standing support |
| §4.2 | Zero cycle; degree-2 source cover; point graph | Pushforward multiplier is the source degree; positive Gysin class is 1. | None |
| §4.3 | n=2; degree-one point on ℙ¹; nonproper boundary; rational versus integral quotient | Edge coefficient degree is 3 with twist 2. Concentration is indispensable; rational and integral boundary contracts differ. | R01, R08 |
| §4.4 | Weight −1; ramification in F versus in Eλ; bad finite place | The two invariant vanishings and finite-condition premises are retained. Ramified coefficients are allowed. | R05 standing support |
| §4.5 | Multiplicity 2; reducible Galois factor; nonzero vector with one zero coordinate | H(N) needs Galois irreducibility; coordinate choice is existential and conjugation remains present. | R08 |
| §4.6 | Degree-2 cover; non-Cartesian square; identity; coefficient extension | Trace multiplier and whole inverse-image cycle are distinguished from a selected graph. | R08 coefficient convention |
| §5.1 | 𝔽₁₁ tensor with repeated root; cyclic permutation over 𝔽₇; empty/double source; π²=ℓ | PI7 is independent; finite period counts multiplicity. Quotient pairing needs transpose action and coefficient kernels. | R03, R05, R08 |
| §5.2 | p=3; odd/even n; one graph fibre; exchanged factor order | Three numerical identities match Theorem 5.11.5. Proof diagrams require their distinct parity domains. | R02, R04 |
| §5.3 | A7.2.3 alone; A7.1.1 alone; n=2; empty triple-excess stratum | Weak targets retain separate Needs lines. Full E₂ and Frobenius claims retain stronger assumptions. | R08 inherited quotient convention |
| §5.4 | Four component projections; zero cycle; differential π²; unipotent F on 𝔽₃² | J domains distinguish components. Class of π has exponent 1; invariants-to-coinvariants map can be zero. | R08 |
| §5.5 | p=3; zero test function; quotient relation P−2 | Numerical factor matches the source; its pairing needs the action specified in R03. | R02, R03, R08 |
| §5.6 | Unit multiplier; multiplier π; zero class | Unit factors preserve exponent; a nonunit can lower it. Literal quotient convention must first be repaired. | R08 |
| §6.1 | Double fibre; m=0; changing proof labels; explicit 𝔽₁₉ reciprocal root lists | Multiplicity and positive exponent controls discriminate. Changing labels does not distinguish the wrong stronger predicate. | R05, R06, R08 |
| §6.2 | n=2,3; zero cycle; two correspondence legs | Degree 2r₀ and twist r₀ match the source. The all-parity product square is not the square of Proposition 4.5.5. | R02, R04 |
| §6.3 | Odd rank 3; unipotent eigenvalue 1; missing A7.3.2 | Coinvariant comparison retains weak semisimplicity, concentration and H(n₁). | R08 |
| §6.4 | O/π²→O/π; zero class; absolute versus singular class | Exponent may drop from 2 to 1; only the asserted inequality follows. | R08 |
| §7.1 | m=1,2; ξ²=1; simple versus repeated fixed eigenvalue | Residual exclusions and prime-to-ℓ image hypothesis are essential; source lifting domain matches. | None |
| §7.2 | Zero actual span; c=0; c≥k; triangular D; primitive kernel vector | DC=CD=π²I in the control. Positive loss gives no basis; the primitive kernel construction preserves the stated bound. | No additional finding; arithmetic realization conditional on suppliers |
| §7.3 | Perfect/nonperfect rank-one pairings; ℚ₁₁ uniformizer class; doubled Satake pair; other place over p₁ | Pairing exponent is max(0,a+b−m). Both coefficient-place classes must be finite. Simple arithmetic pair and two losses c are accounted for. | R02–R05, R08 propagate |
| §7.4 | CM/isogenous elliptic factors; absent supercuspidality; F⁺=ℚ | Only the two specified families are claimed; neither supplies the extra uniform span premise automatically. | None |
| §8.1 | Hypothetical rank-one lattice; large m; ramified coefficient field | Contradiction uses uniform m₀,c,mper,mlat,mdif. Its construction depends on the repaired eigenspecialization and pairing. | R02–R05, R08 propagate |
| §8.2 | Nonzero regulator; hypothetical rank-two lattice; positive c | Primitive-kernel pairing yields the 2c bound without asserting a diagonalizing basis. | R02–R05, R08 propagate |
| §8.3 | N≤3; F⁺≠ℚ; larger rank over ℚ | Multiplicity removal stays conditional on its declared supplier theorem and does not remove the span premise. | None |
| §8.4 | Ranks 2,3; ℓ=2,3; F⁺=ℚ | L1–L7 remain; the unpublished L6/L7-free refinement is not claimed. | R08 propagates |
| §8.5 | g=1,3; even g; omitted LIInd or residual dimension equality | Odd degree and exact Liu–Tian assumptions remain. The comparison is unramified rather than the unitary singular theorem. | None |

Complete bold-target inventory (each native target also uses the test row for its subsection):

| Location | Section / supplier | Target | Result / change |
|---|---|---|---|
| packages/SelmerIwasawaCohomologyPartII/README.md:91 | TauCetiRoadmap.SchemeAndStackFoundations | Adic arithmetic Hochschild–Serre edge identification. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:111 | TauCetiRoadmap.ArithmeticGaloisDuality | All-place purity and finite regulator theorem. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:119 | TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII | Exact cohomological multiplicity H(N). | Declared residual contract; R01 fixes adjacent heading locator |
| packages/SelmerIwasawaCohomologyPartII/README.md:123 | TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII | Rational cuspidal concentration on the native diagonal product. | Declared residual contract; R01 fixes adjacent heading locator |
| packages/SelmerIwasawaCohomologyPartII/README.md:131 | TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison | Transfer dimension comparison in even rank. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:135 | TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison | Local unitary constituents and cohomological decomposition. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:151 | TauCetiRoadmap.ShimuraVarieties | Native unitary Shimura schemes and integral models. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:155 | TauCetiRoadmap.ShimuraVarieties | Special homomorphism under basic uniformizations. | R04: parity of Cartesian diagrams missing |
| packages/SelmerIwasawaCohomologyPartII/README.md:163 | TauCetiRoadmap.LefschetzPencilsAndVanishingCycles | Integral filtered nearby complex and stratum spectral sequence. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:167 | TauCetiRoadmap.LefschetzPencilsAndVanishingCycles | Integral nearby cycles, weight sequence and monodromy. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:171 | TauCetiRoadmap.LefschetzPencilsAndVanishingCycles | Singular cohomology and the potential boundary cokernel. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:179 | TauCetiRoadmap.MotivesAndAlgebraicCycles | Chow cycles and the arithmetic étale regulator. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:187 | TauCetiRoadmap.GlobalGaloisDeformations | Rigid R=T, complete intersections and Hecke freeness. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:191 | TauCetiRoadmap.GlobalGaloisDeformations | Eventual rigidity in the two specified families. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:197 | TauCetiRoadmap.ArithmeticGaloisRepresentations | Congruence image lifting for polarized tensors. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:201 | TauCetiRoadmap.ArithmeticGaloisRepresentations | Independent elliptic images and Steinberg tensor criterion. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:211 | TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants | Finite Hecke-support contraction at chosen Frobenius. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:217 | TauCetiRoadmap.ShimuraCompactifications | Boundary localization at irreducible residual systems. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:223 | TauCetiRoadmap.ReductiveGroupsPartII | Hermitian Frobenius incidence varieties and their cohomology. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:229 | TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves | Hilbert modular level raising comparison. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:237 | TauCetiRoadmap.AdelicAlgebraicGroups | Global hermitian spaces with prescribed invariants. | Declared supplier contract; checked domain and locator; no absence finding |
| packages/SelmerIwasawaCohomologyPartII/README.md:253 | 1.5 | Very special inert is special. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:254 | 1.5 | Very special inert of reflexive. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:255 | 1.5 | Special inert residue. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:256 | 1.5 | Special inert transport. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:274 | 1.6 | Admissible iff clauses. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:275 | 1.6 | Admissible change basis. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:276 | 1.6 | Admissible polarized tensor. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:277 | 1.6 | Admissible not small prime. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:307 | 2.1 | Level datum ext. | R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:308 | 2.1 | Level datum reduce. | R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:309 | 2.1 | Level datum ideal maps. | R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:310 | 2.1 | Level datum change level. | R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:329 | 2.2 | Basic correspondence representable. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:330 | 2.2 | Basic correspondence base change. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:331 | 2.2 | Basic correspondence uniformize. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:349 | 2.3 | Semistable strata local equation. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:350 | 2.3 | Semistable strata base change. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:351 | 2.3 | Semistable strata generic fiber. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:385 | 2.5 | Weight complex incidence matrix. | R02 normalizations |
| packages/SelmerIwasawaCohomologyPartII/README.md:386 | 2.5 | Weight complex singular sequence. | R02 normalizations |
| packages/SelmerIwasawaCohomologyPartII/README.md:387 | 2.5 | Weight complex functorial. | R02 normalizations |
| packages/SelmerIwasawaCohomologyPartII/README.md:413 | 2.6 | Product resolution ext. | R04 supplier precision |
| packages/SelmerIwasawaCohomologyPartII/README.md:414 | 2.6 | Product resolution cycle. | R04 supplier precision |
| packages/SelmerIwasawaCohomologyPartII/README.md:415 | 2.6 | Product resolution coefficient. | R04 supplier precision |
| packages/SelmerIwasawaCohomologyPartII/README.md:416 | 2.6 | Product resolution components. | R04 supplier precision |
| packages/SelmerIwasawaCohomologyPartII/README.md:417 | 2.6 | Product resolution exceptional products. | R04 supplier precision |
| packages/SelmerIwasawaCohomologyPartII/README.md:532 | 4.1 | Diagonal datum ext. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:533 | 4.1 | Diagonal datum refine. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:534 | 4.1 | Diagonal datum product. | R05 standing support |
| packages/SelmerIwasawaCohomologyPartII/README.md:553 | 4.2 | Diagonal graph cycle support. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:554 | 4.2 | Diagonal graph cycle pushforward. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:555 | 4.2 | Diagonal graph cycle class. | None |
| packages/SelmerIwasawaCohomologyPartII/README.md:573 | 4.3 | Projected aj add. | R01, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:574 | 4.3 | Projected aj edge. | R01, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:575 | 4.3 | Projected aj reduce. | R01, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:636 | 5.1 | First datum to level datum. | R03, R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:637 | 5.1 | First datum ext. | R03, R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:638 | 5.1 | First datum test module. | R03, R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:639 | 5.1 | First datum reduce. | R03, R05, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:715 | 5.4 | Cycle boundary presentation. | R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:716 | 5.4 | Cycle boundary compare cycle. | R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:717 | 5.4 | Cycle boundary naturality. | R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:771 | 6.1 | Second datum ext. | R05, R06, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:772 | 6.1 | Second datum graph function. | R05, R06, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:773 | 6.1 | Second datum reduce. | R05, R06, R08 |
| packages/SelmerIwasawaCohomologyPartII/README.md:864 | 7.3 | One place annihilator. | R02–R05, R08 propagate |
| packages/SelmerIwasawaCohomologyPartII/README.md:865 | 7.3 | Two place annihilator. | R02–R05, R08 propagate |
| packages/SelmerIwasawaCohomologyPartII/README.md:866 | 7.3 | Rigidity from level-raising specialness. | R02–R05, R08 propagate |

## Not verifiable

- **Lean elaboration:** no build, elaboration command or generated `#check` was run, as required. The two proof scripts and all signatures were inspected statically; no successful elaboration is claimed.
- **Future supplier implementations:** all 21 gaps remain contracts. This review does not certify their eventual proofs or implementations, and does not count their present absence as a finding.
- **Strengthened simultaneous prime realization in §7.2:** the scaled-inverse and primitive-kernel assertions were checked directly. A complete independent proof that the actual Frobenius-span input simultaneously yields the very-special-place, CM-type and fixed-Hecke-quotient requirements was not reconstructed; it depends on the named realization and finite-support contracts. No counterexample to that strengthened arithmetic assertion is claimed.
- **Complete machine-checkable ownership coverage:** the dependency gate scans only seven roadmaps. Direct supplier and object searches supplement it; neither an exhaustive theorem-equivalence search of both pinned libraries nor formal proof of every geometric assertion was performed.

All six cited works were legally readable. No missing-source request was needed. Only this report and scratch notes were written; the roadmap, Lean file, manifests, suppliers and merge order were not changed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "aac044513d90996ef86a7290447878cbf6093220", "job": "RT-SelmerIwasawaCohomologyPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
