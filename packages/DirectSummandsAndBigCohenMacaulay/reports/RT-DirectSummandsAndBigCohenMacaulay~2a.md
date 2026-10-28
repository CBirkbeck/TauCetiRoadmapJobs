<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1452#issuecomment-6449587546 -->
Red team round 2 pass a (codex) of fef1736

Verdict: needs_changes

1. **F01** (P1) The annular vanishing statement quantifies over an unrelated morphism

   **Location:** packages/DirectSummandsAndBigCohenMacaulay/README.md:647: “In the setting of §3.4 … hence the image of α∞/pᵐ … is almost zero”.

   **Claim:** The arbitrary perfect complex Q₀ and arbitrary α₀:Q₀→A₀[1] of §3.4 become almost zero on the annuli whenever a separately specified finite algebra B₀ has étale generic fibre.

   **Witness:** Take A₀=B₀=ℤ₂, g=1, Q₀=A₀[1], α₀=id, m=3. The annulus is constant; α reduces to 1. Evaluating the g-roots at 1 in O_K gives 2^(1/2)≠0 modulo 8, since 1/2<3.

   **Exact repair text:** “In the setting of §3.4, let A₀→B₀ be finite and injective with B₀[1/(pg)] finite étale over A₀[1/(pg)]. In this section take Q₀=cone(A₀→B₀) and let α₀:Q₀→A₀[1] be its connecting morphism as in §0.7.” Retain the almost-splitting and annular-vanishing conclusions with this additional identification. Add a Check: “For B₀=A₀ the cone and obstruction are zero. An unrelated identity A₀[1]→A₀[1] reduces to 1 and is not almost zero modulo p³.”

   **Retest:** The repaired identity-algebra instance has Q₀=0 and α₀=0, so every root annihilates it. The counterexample with Q₀=A₀[1] is excluded. BHATT18 lines 568–572 explicitly define Q₀ and α₀ from the algebra unit; the restriction is part of the source, not a loss of generality.


2. **F02** (P2) Three independent deep theorems remain absent from the acceptance test

   Re-raised: a.F02.

   **Location:** packages/DirectSummandsAndBigCohenMacaulay/README.md:294, 314, 449; packages/DirectSummandsAndBigCohenMacaulay/Suggested.lean:11. “The target completion_balanced is specified here in prose.”

   **Claim:** The acceptance test contains the statable deep results that this roadmap develops.

   **Witness:** Mathlib/RingTheory/AdicCompletion/Basic.lean:171 supplies the completion. The package already defines BalancedBigCM, PureAlgebra and SplitAlgebra. Its ten theorems include neither completion balancing, faithful flatness for arbitrary balanced modules, nor pure splitting for arbitrary algebras.

   **Why the repair reason fails:** Their position as inputs in Layers 0–1 does not make them API padding. Each is a substantial independent theorem about arbitrary modules or infinite algebras. None follows from the finite direct-summand or algebra-existence headlines, a definition, or one pinned theorem. The binding acceptance-test rule includes deep results, not only last-layer endpoints. The previous deletion is not evidence that these statements are padding.

   **Exact repair text:** Add the following three signatures, each with a mathematical docstring, in README layer order, and backtick their names in the corresponding README sections.

   ```lean
   theorem completion_balanced (R : Type u) (M : Type v)
       [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
       [AddCommGroup M] [Module R M] (xs : List R)
       (hx : ParameterSystem R xs)
       (hreg : RingTheory.Sequence.IsRegular M xs) :
       BalancedBigCM R (AdicCompletion (IsLocalRing.maximalIdeal R) M) := by
     sorry

   theorem balanced_faithfullyFlat (R : Type u) (M : Type v)
       [CommRing R] [IsRegularLocalRing R]
       [AddCommGroup M] [Module R M] (h : BalancedBigCM R M) :
       Module.FaithfullyFlat R M := by
     sorry

   theorem complete_pure_split (R : Type u) (S : Type v)
       [CommRing R] [CommRing S] [Algebra R S]
       [IsLocalRing R] [IsNoetherianRing R]
       [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
       (h : PureAlgebra R S) : SplitAlgebra R S := by
     sorry
   ```

   **Retest:** For R=k[X]_(X), M=R and xs=[X], completion is k⟦X⟧ with quotient k. Over a DVR, Frac(R)/πFrac(R)=0 excludes the flat but unfaithful module. For complete R=k[ε]/ε² and S=R[t], coefficient evaluation gives the third conclusion. These signatures use existing carriers and real definitions; they were inspected, not elaborated in this read-only pass.

3. **F03** (P2) The descent endpoint still excludes inseparable residue extensions

   Re-raised: a.F04.

   **Location:** packages/DirectSummandsAndBigCohenMacaulay/README.md:13, 1159; packages/DirectSummandsAndBigCohenMacaulay/Suggested.lean:167. “without residue separability … belong to a Part II”.

   **Claim:** The Cohen–Macaulay descent endpoint may retain residue separability because removing it needs another proof route.

   **Witness:** HEITMANNMA18 line 544, Corollary 4.3, p.13, has no residue-separability hypothesis. Lines 549–555 prove Cohen–Macaulayness using Theorem 4.1. A split inclusion of mixed-characteristic DVRs can have purely inseparable residue degree two.

   **Why the repair reason fails:** The quoted reason explicitly makes the generality of this same descent endpoint depend on the cost of its proof. That conflicts with the binding general-library rule and its prohibition of route-specific restrictions. The existing André square can retain separability; it does not limit the separately stated pure-subring endpoint. A Part II label does not repair this narrowing.

   **Exact repair text:** “Every pure local map B→B′ of Noetherian local rings with B′ regular of mixed characteristic has Cohen–Macaulay source B, with no restriction on the residue extension (HEITMANNMA18, Corollary 4.3, p.13). The separable case also follows from the square in §§6.1–6.3.” Delete `hsep` from `pureSubring_cohenMacaulay`, retaining it on `weakFunctoriality_regularTarget`. Own the needed height-one quotient square and Tor-vanishing route with full statements from HEITMANNMA18 Theorems 3.1 and 4.1, or import an actual earlier owner; the ownership search found none. Remove the scope exclusion for these inputs to this endpoint.

   **Retest:** Let B be the 2-adic completion of ℤ₂[t]_(2), and B′=B[s]/(s²−t). They are complete DVRs with uniformizer 2; B′ is free with basis (1,s), so coefficient projection splits the inclusion. Residues satisfy t=s², giving inseparable degree two. The revised theorem includes this case: multiplication by 2 is injective and B/2B=𝔽₂(t)≠0. The unchanged square theorem correctly does not promise its separable construction here.

4. **F04** (P3) The replacement trace lemma has no source locator

   **Location:** packages/DirectSummandsAndBigCohenMacaulay/README.md:1337. “This section owns the following trace lemma.”

   **Claim:** The general lci trace extension and its degree normalization are a sourced target replacing the faulty Kovács comparison.

   **Witness:** The citations at README:1333 concern the final characteristic-zero theorem. The new trace lemma and Jacobian construction at README:1337–1339 have no locator. STACKS, Duality for Schemes, Lemma 48.29.2, lines 3650–3684, supplies the local construction.

   **Exact repair text:** Append: “The local fundamental-class construction is STACKS, Duality for Schemes, Lemmas 48.15.6–48.15.7 and 48.29.2 (tag 0E9Z), pp.77–78 for the latter; the counit normalization is §48.7, Example 48.7.3 (tag 0B6L), p.21. Apply 48.29.2 locally using an immersion into projective space, which is smooth and proper over the base. This target additionally proves compatibility with the finite étale trace and gluing by equality at the generic point.” Record this chapter in the existing STACKS manifest entry, retaining its existing key. Do not cite 48.29.2 as an unconditional global-factorization theorem: its immersion/proper-smooth factorization hypothesis is explicit.

   **Retest:** For y²=x, the local section 2y·c has values (2,0) on (1,y); the counit evaluates it on 1, giving 2. For a blow-up of a regular surface the line is O(E), and the local Jacobian vanishes once. Thus the added locator addresses the construction and its convention, while the owned gluing argument retains the stated generality. This is a locator defect; no counterexample to the replacement trace lemma was found.

5. **F05** (P3) Four remaining Checks only describe proof routes or references

   **Location:** packages/DirectSummandsAndBigCohenMacaulay/README.md:530, 549–550, 738. “André also notes that W(k)⟦T⟧ → W(k)⟦T⟧⁺ splits; this is §5.4.”

   **Claim:** These bullets provide discriminating Checks for §§2.2, 2.3 and 4.1.

   **Witness:** README:530 names an alternative proof; 549 names another supplier proof; 550 points to §5.4; 738 says the later construction satisfies this definition. None computes an independent test instance or excludes a wrong model.

   **Exact repair text:** Move README:530 into §2.2's proof discussion, 549 into §2.3's proof discussion, 550 into a cross-reference after that discussion, and 738 into the description of §4.8's application. Keep the mathematical claims. For §2.3 add: “For A=ℤ₂ and B=ℤ₂[√2], the coefficient functional a+b√2↦a sends 1 to 1; half-trace gives the same functional even though 2 is a nonunit.”

   **Retest:** The new quadratic test gives values 1 on 1 and 0 on √2; the zero functional fails. Section 4.1 retains five other Checks, including the non-CM colon class Y≠0 and the zero-algebra survival failure. No artificial minimum number of Checks is imposed on theorem-only sections.

6. **F06** (P2) Almost annihilation is promoted to a categorical retraction

   **Location:** packages/DirectSummandsAndBigCohenMacaulay/README.md:1273, 1281. “has a left inverse in the almost derived category”.

   **Claim:** The supplied almost-purity and trace statements yield an actual retraction in the ordinary derived category of almost modules.

   **Witness:** PerfectoidSpaces README:8719 supplies ε-retractions. BHATT14 lines 59,72–78,189–191 distinguishes almost-zero Ext from categorical projectivity. Over V=O_K, the epimorphism (⊕ₙV)ᵃ→Vᵃ, eₙ↦2^(1/2ⁿ), has every ε-section but no section.

   **Verification of the witness:** Use the rooted 2-adic perfectoid field and m=V's maximal ideal. The ordinary image is m, so the map becomes an epimorphism after almostification. For every ε∈m choose n with v(2^(1/2ⁿ))≤v(ε); sending 1 to (ε/2^(1/2ⁿ))eₙ gives composite ε. On the other hand a morphism Vᵃ→(⊕ₙV)ᵃ is a map m→⊕ₙV (BHATT14 line 48). Any such map has finite support: evaluation at one nonzero element determines its support, by torsion-freeness. Each coordinate is multiplication by an element of V, since Hom_V(m,V)=V. Its composite is multiplication by a finite sum of positive-valuation elements, hence lies in m and cannot equal 1. Degree-zero embedding into the derived category does not create a section. This refutes the inference used in the proof; it is not asserted to be a proper-scheme counterexample to the stronger geometric conjecture.

   **Exact repair text:** Replace the first conclusion by: “Writing u:A→RΓ(Y,O_Y), for every ε∈K°° there is r_ε:RΓ(Y,O_Y)→A in D(A) with r_ε∘u=ε·id_A. Equivalently the connecting morphism α of u is annihilated by K°°.” In the proof replace the claimed retraction furnished by the almost finite étale cover by its ε-retractions, composing them and using (K°°)²=K°°. Keep this convention in §§3.5 and 7.8. If the stronger categorical retraction is intended, it requires a separately owned theorem; the cited suppliers and almost-zero obstruction do not supply it.

   **Retest:** The displayed epimorphism satisfies the repaired ε-section conclusion, while its actual section remains impossible. For the identity proper cover take r_ε=ε·id. For Spec(V/2) the equation r_ε∘u=ε forces 2ε=0, impossible for ε≠0, so generic surjectivity still has the intended negative control. The repaired conclusion is exactly what §3.4's detection argument consumes.

   BHATT14 denotes Bhargav Bhatt, *Almost direct summands*, arXiv:1109.0356v1, Definition 1.2, Warning 1.4 and Lemma 1.7, pp.2–3, with the Ext application on p.5. This is the legally fetched preprint of the paper cited as [Bh2] in BHATT18; do not confuse its Lemma 1.7 with the published numbering 2.7. If cited in the repair, add this work once under BHATT14 in sources.toml. [Legal preprint](https://arxiv.org/abs/1109.0356).

## Verification of the preceding findings

The labels below distinguish pass a from pass b. Quotations are from the repaired package, not from the sources. Each preceding finding was re-evaluated at fef1736.

| Earlier finding | Status and repaired passage | Witness at this head |
|---|---|---|
| a.F01, roots over an arbitrary perfectoid field | **Repaired.** README:1273: “almost split with respect to K°°A”. | For K=completed ℚ₃(μ₃∞), ζ₃−1 has valuation 1/2 and is in K°°; a cube root of 3 is absent. The new ideal exists without that root. README:1287 contains this control. |
| a.F02, three omitted deep signatures | **Not repaired; re-raised as S02.** README:294,314: “is specified here in prose”. | The 19 declarations contain none of the three signatures. Completion of k[X]_(X) is k⟦X⟧; arbitrary-module flatness and infinite-algebra splitting are not conclusions of the ten retained theorems. |
| a.F03, root-existence supplier | **Repaired.** README:590: “PerfectoidSpaces §P1.4”. | TauCetiRoadmap/PerfectoidSpaces/README.md:3955–3963 actually supplies a unit multiple with compatible roots. For g²=2u and π=gw, π²=2uw², with uw² a unit. Contract and Needs include P1.4. |
| a.F04, restricted descent endpoint | **Not repaired; re-raised as S03.** README:13: “belong to a Part II”. | HEITMANNMA18 line 544 removes the restriction. The split DVR inclusion in S03 has inseparable residue degree 2. The reason for deferral conflicts with the stated general-library contract. Attribution to Heitmann–Ma is now correct. |
| a.F05, non-discriminating Checks | **Partly repaired.** README:604: “the nonzero class of 2^(1/4) … maps … to the nonzero class of 2^(1/2)”. | Valuations 1/4<1/2 and 1/2<1 distinguish Frobenius from zero. The new ideal-quotient test at README:762 kills t², and the specifically listed scope/reference bullets have moved outside Checks. Four additional reference-only bullets remain (S05). |
| a.F06, internal order | **Repaired.** README:143: “build §4.9 before §4.8”; “build §§5.2–5.3 before … §5.1”. | For ℤ₂⟦X,Y⟧/(2X,2Y), the maximal-dimensional component is characteristic 2, now handled by the earlier §4.9. README:991 separates the two proof routes. |
| a.F07, André locator | **Repaired.** README:541: “ANDRE18B line 551”; README:1107: “ANDRE18B line 575”. | Line 551 begins Corollaire 2.6.1; line 575 begins Remarques 2.6.1(4). Line 564 is item (1), no longer the purported locator. |
| a.F08, incorrect Kovács comparison | **Partly repaired.** README:1337: “τ … whose composite with the unit … is multiplication by e”. | On ℙ¹→ℙ¹ of degree 2, the sheaf ranks are 2 and 1, but trace∘unit=2. The false comparison is removed and the replacement survives this test. Its missing locator is new S04. |
| b.F01, pointed/full modification comparison | **Repaired.** README:745 uses “T[X₁,…,X_k]/(F)”; README:810 uses finite algebra-modification witnesses. | For T=k⟦x⟧[t]/(xt), the k=0 modification is T/tT=k⟦x⟧, killing t². The former T/Rt did not. With δ=2, ℓ=2, C=6; 6/16≤1/2 and 6/8>1/2, as required for the finite denominator bound. |
| b.F02, nonflat Popescu passage | **Repaired.** README:1341: “A₀ complete regular local containing ℚ” and “§7.5 (`qeResolution`)”. | There is no longer a retraction transported from a smooth stage across a nonflat map. Quasi-excellent resolution supplies regular Y directly over A₀; degree e is invertible there. The replacement's locator issue is S04. |
| b.F03, ambiguous Stacks chapter locators | **Repaired.** README:25: “in the commutative-algebra text”; README:1240 identifies the cohomology-of-schemes text. | STACKS line 4671 (algebra) is 030O; lines 290,2350,2413 (cohomology of schemes) are 01XI,02O5,02O6. The additional cached chapters exist in the manifest. The earlier claim that only flattening was cached was incorrect. |
| b.F04, flat-local parameter transport | **Repaired.** README:119: “For a flat local map … with m_R R′ = m_R′”. | The same fourth clause is in design/plan.json, and README:853,860 consumes it. For ℤ₂→completed ℤ₂[t]_(2), both dimensions equal 1 and both parameter ideals have radical (2). |

No repair introduced a new false mathematical claim in the modification or trace computations. S04 is a new locator omission. S01, S05 and S06 are additional defects found on the full pass. S06 concerns the meaning of almost splitting, independently of the repaired root-ideal defect.

## Adversarial table (sampled rows)

Section references below refer to packages/DirectSummandsAndBigCohenMacaulay/README.md. These samples retain computed values from the full pass; the per-target ledgers are omitted for the comment limit. Passing examples are tests, not substitutes for general proofs.

All 19 Lean declarations have explicit binders and belong to `TauCetiRoadmap.DirectSummandsAndBigCohenMacaulay`. The supplied elaborated types were compared with every signature and its README statement; none lost an instance or binder. Local-ring instances include nontriviality, and regular-local instances include Noetherianity.

| Statement | Instances tried and values computed on the two sides | Result/change |
|---|---|---|
| Conventions: regularity, almost ideal, shifts, universes | Zero ring has no local instance; k has dimension0. Triangle of multiplication by2 on ℤ has Ext¹ class1∈ℤ/2, identity triangle class0. Root valuations 1/2ⁿ tend to0; (2) excludes 2¹ᐟ², root ideal includes it. | Retain; no sign, prime2, or empty-list convention mismatch. |
| §0.5 completion balancing | k[X]_(X) completes to k⟦X⟧, kerX=0 and quotient k; zero module completes to0 with quotient0. Finite M gives M̂=M⊗R̂. | Mathematics survives tests; omitted headline S02. Arbitrary-module proof not independently reconstructed. |
| §3.5 annular splitting | A₀=B₀=ℤ₂,g=1,Q₀=A₀[1],α=id: annuli constant, image1 modulo8, 2¹ᐟ²·1≠0. Correct unit cone for B₀=A₀ is0. For 𝔽₄/𝔽₂, Tr1=0, Trω=1. | S01; untwisted divided-degree trace is unnecessary for the almost-purity argument. |
| §4.2 full algebra modifications | T=k⟦x⟧[t]/xt, k=0 relationxt=0: T/tT=R, t²↦0. T=R/(X), relationX·1=0: quotient0, bad. Zero relation overR produces R[U]/xU with x-torsion. For yx=xy, evaluationU=1 respects x(1−U)=0. | Retain repaired ideal quotient; it need not be injective or preserve CM at a finite stage. |
| §4.7 reductions for existence | B=ℤ₂⟦X,Y⟧/(2X,2Y): dim2; quotient by(2) has dim2, quotient by(X,Y) has dim1. Parameters(2+X,Y) give B/(2+X,Y)=ℤ₂/4. Small component gives(2,0), not regular. Flat-local ℤ₂ extension keeps radical(2) and dim1. | Retain same-dimension component and expanded parameter gap. |
| §5.5 contraction/monomial | XY∉(X²,Y²), X²Y²∈(X²,Y²). For empty list, product1 and ideal0 give noncontainment for all exponents; therefore the stated iff needs d≥1. For m=0,n>0, 1∉proper parameter ideal. | Retain noncontainment and positive-dimensional iff qualifications. |
| §6.4 pure-subring endpoint | C₂ acting byX↦−X onℤ₃⟦X⟧ gives invariantsℤ₃⟦X²⟧; Reynolds(1)=1. Atp=2, 1/2 is unavailable. S₃ permutation action overℤ₅ averagesX₁ to(X₁+X₂+X₃)/3, invariant. Inseparable DVR pair has quotient𝔽₂(t) and regular2. | The stated separable version is true; S03 restores the general endpoint. |
| §7.4 perfectoid proper almost splitting | K=completed cyclotomic ℚ₃ has ζ₃−1∈K°°, valuation1/2, but no cube root3. Spec(A/p) has empty generic fibre and εp≠0 inA=K°, so cannot split even almost. Identity has retractionid. | Retain root-free ideal and generically-surjective hypothesis; categorical-strength claim requires S06. |
| §7.7 additional trace lemma | y²=x: 2y·c sends(1,y)↦(2,0). Surface blow-up: L=O(E), Jacobian order1, trace∘unit=1. Degree2 ℙ¹ map: pushforward canonical rank2 versus target rank1, but trace composite2. | No false comparison remains; add exact local-construction locator S04. |

### Additional Check computations

These retain additional sampled Check computations from the full pass. All 168 Check bullets were read; 164 contain mathematical tests or assertions that were evaluated, while the four route/reference bullets are S05.

| Check location | Computed values | Result |
|---|---|---|
| README:213–217 | In a finite ℤ-algebra, n·s=1 modulo torsion would make 1/n integral, so n=±1; the unit is primitive. Dual numbers have socle kε and injective dimension0, yet ε²=0 with ε≠0. Normal ℚ-domains have divided field trace; a nonintegral element in normalization obstructs ideal contraction. | Splinter definition needs reducedness; normality equivalence is only in the stated characteristic-zero domain setting. |
| README:258,355,357 | Unit ideal has radicalR≠m. Cusp quotient k[t]/k[t²,t³] has basis t and dimension1 overk; t² kills it, so Hom_A(k,A)=0 in the domain but Ext obstruction≠0. ℤ[i]/ℤ is free rank1, so Ext¹=0. | Parameter and degree-one-obstruction controls pass. |
| README:440,484–485 | σ on d−1 formal variables has rank q^(d−1); intersection of iterated maximal ideals=(r). At p=2, coefficients (a,b) project to a; at p=3, (a,b,c) project to a. | Retain all small-prime computations. |
| README:603,622 | Over ℤ₂ the cover is torsion-free and mod2 nonzero, hence faithfully flat as a module over the DVR. Its residue module has 2¹ᐟ²·1≠0, so it is not almost zero. | Ordinary faithful flatness in this special case is stronger than the general almost statement. |
| README:737,823 | In dimension0 the list has length0 and no colon tests; survival still requires J⊄mD. In O, h=1 gives v(2¹ᐟ²)=1/2<1, excluding membership in2O. | Boundary and survival tests pass within the standing nonzerodivisor/root hypotheses. |
| README:857,874 | ℤ_p⟦x,y⟧/(xy) modulo(x) is regular ℤ_p⟦y⟧ of dimension2. ℤ_p⟦x,y,z⟧/(xy−pz) is a dimension3 hypersurface with embedding dimension4; it is singular but Cohen–Macaulay, hence itself a balanced algebra. | Both displayed existence examples work; the singular example does not need a nontrivial algebra extension. |
| README:895–896 | For 𝔽_p⟦x,y⟧, parameter quotient of R⁺ is nonzero and Tor₁=0 by §§4.9,0.6. BMPSTWW lines574–580 expressly contrasts characteristic-zero dimension≥3 with the characteristic-p result. | No extension of R⁺ Cohen–Macaulayness to char0 is inferred. |
| README:918–919 | ℚ[ε]/ε²→ℚ has mC=0,d=0. The zero-section fibre of ℤ[1/6][X] at p>3 is 𝔽_p[X]_(X), dim1, radical(X)=m; fibres at2,3 are empty because 6 becomes0 and is invertible. | Specialization must use a maximal ideal of the actual base. |
| README:1005,1028,1048–1049 | A two-factor product of flats is a finite direct sum. A nonzero finite field-algebra has a residue fieldL≠0, giving faithful flatness. Even for imperfectK=𝔽₂(t), a basis of K̄ containing1 gives a functional with value1. | No separability is needed for a vector-space retraction. |
| README:1067,1168,1170–1171 | On the node, x+y has order1 on each branch, so powers satisfy containment iff m≥n. C₂ kills the odd coefficient overℤ₃. Trivial-group average=id at everyp. S₃ overℤ₅ has 6 invertible and formal symmetric invariants ℤ₅⟦e₁,e₂,e₃⟧. | Normalizations and nonabelian control pass. |
| README:1224–1231,1322 | For a field, vector-space complexes split degreewise, giving a left inverse of the unit even with H¹≠0. Empty scheme has all terms0. Identity cone0; diagonal composite a↦a; ℤ→ℤ/2 kills2≠0. 𝔽_p⟦x,y⟧ is regular and its proper units split. | Actual sheaf and unit carriers, rather than only abstract cohomology dimensions, were tested. |

## Verified sound

**Coverage:** 1,414 README lines and 225 Suggested.lean lines read in full; 19 declarations (9 definitions, 10 admitted theorems) compared with the supplied elaborated types; 52 numbered README target sections, the conventions, and the added trace lemma reviewed; sampled computations appear above. All 168 Check bullets were inspected: 164 mathematical Checks were evaluated, and four non-Checks are S05. The nine Lean definitions each have at least three discriminating README examples, allowing the dedicated conventions examples for SeparableResidueMap and the individual sheaf/unit tests in §7.1. No padding theorem was found among the ten retained theorems; S02 concerns three absent independent deep theorems.

**Headline inventory:** the ten currently stated headlines are R⁺ in characteristic p, existence of balanced algebras, the direct summand theorem, flat domination, complete-local R⁺ splitting, monomial noncontainment, the regular-target weak-functoriality square, pure-subring Cohen–Macaulayness, the characteristic-p splinter equivalence, and derived direct summands. Completion balancing, faithful flatness of arbitrary balanced modules, and complete-local pure splitting are also independent deep results developed here (S02). Perfectoid covers/almost flatness, the modification criterion and relative coherent-cohomology killing are named in the module docstring with their missing interfaces. The derived unit itself now uses native carriers; the arbitrary-Prop and sorry-data objections do not apply.

**Sources:** 80 distinct README source locations were inspected: 78 explicit source-key/line locations, plus Stacks tags 02O6 and 0A6A. This includes the corrected line551 and line575 André locators and the chapter-disambiguated Stacks locators. Thirteen of the fourteen works in the existing manifest were read at the relevant passages; HH95 remains settled as uncertified. The additional Stacks duality chapter was legally fetched for S04. BHATT14 was legally fetched for S06, using its preprint numbering. Source errors are separated below from package errors. A source assertion was not treated as proof of a stronger version without its hypotheses.

**Pinned APIs:** the manifest pins match the README: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Every listed native declaration was located in its stated file. In particular:

- Mathlib/RingTheory/LocalRing/Defs.lean:30 makes a local ring nontrivial; Mathlib/RingTheory/RegularLocalRing/Defs.lean:51,92 includes Noetherianity in both regularity classes.
- Mathlib/RingTheory/Regular/RegularSequence.lean:135,146 separates weak regularity from a nonzero final quotient. The former includes the zero module; the latter does not.
- Mathlib/RingTheory/AdicCompletion/Basic.lean:56 includes separation; line171 constructs the compatible quotient limit. Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63 includes flatness and nonzero maximal-ideal quotients.
- Mathlib/Algebra/Homology/LocalCohomology.lean:173 is the Ext-colimit construction, not a built-in Čech comparison. Mathlib/FieldTheory/TranscendentalSeparable.lean:72 tests finitely generated intermediate fields rather than imposing algebraicity.
- The native bounded-below derived functor, its unit, the geometric ringed-space unit and single-complex comparison occur in the files identified at README:48–51. Their order in `derivedUnit` produces O_Y→Rf_*O_X. TauCeti/RingTheory/RegularLocalRing/Basic.lean:124 provides the domain instance actually used by the R⁺ theorem.
- TauCeti/RingTheory/Flat/Pi.lean:62,75 requires a finite index set. Consequently §5.2's arbitrary products are new content. TauCeti/Algebra/Module/Injective/Envelope/Basic.lean:101 includes injectivity and essential range. TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61 supplies abelian-group-valued cohomology, not the module-valued derived unit.

**Supplier audit:** all eleven named roadmap supplier contracts were checked at their specified main/open-head/design copies, with the following witnesses. Main versions were used for existing roadmaps even when an open revision also exists. No new ownership move is required by this pass; S03's additional route has no earlier owner in the searches.

| Supplier | Resolved contract and hypothesis check |
|---|---|
| PerfectoidSpaces | P0.1–P0.17,P0.25 supply basic setups, almost modules, adjoints, trace and descent; P0.12 at README:1832 and P3.12 at8690ff supply the trace pairing and ε-retractions, with faithfulness required. P1.4:3955 gives the unit-multiple root theorem; P1.24:5051 includes completion and Frobenius; P1.25:5103 compares integral and Tate models. P2.8:6798 has almost O⁺ acyclicity; P3.13:8751 assembles almost purity. S06 records the distinction between ε-retractions and categorical sections. |
| PerfectoidSpacesPartII | packages/PerfectoidSpacesPartII/design/plan.json contains RA.0–RA.5: linear almost-pro-zero functors, both Riemann-extension versions, finite-perfect-complex consequences, ramification, Krull detection and Kummer purity. RA.1's annular transitions go from n+1 to n, with root monomials multiplied by t^e. The resolver's RA.5 lead is this available design, not a missing supplier. |
| PerfectoidQuotients | §§0.7,1.3,1.4 at its open head: saturated K°-flat complete models; specified roots; almost faithful flatness modulo t. The stronger universal quotient construction is not substituted. |
| DerivedDeRhamCohomology | §1.10 at its open head, README:522–534: Noetherian source, both rings π-torsion-free and ordinarily complete; flatness modulo π implies ordinary flatness. |
| DerivedModuleAlgebra | §§0.K.1:518,1.T.1:1405,1.1.1:1668,1.E.0:2051,1.M.2:2292 on main. Koszul weak-regular acyclicity, module towers and Milnor theory, unbounded derived Hom, pseudo-coherent/perfect finite models, and arbitrary-residue-field Matlis duality have the consumed scopes. No arbitrary-module biduality is supplied or used. |
| DeformationAndDerivedPatchingAlgebra | §§1.9–1.10,1.13–1.15 at the open head supply the specified coefficient maps, flat completion, algebra factors and finite Hom pro-comparison. §§3.1–3.4,3.7,3.9,4.1,7.3 provide the cited finite homological comparisons, regular-surjection parameters, top local cohomology, finite-self-injective Gorenstein criterion, residual finiteness and finite models. The common compatible Cohen square remains the named gap. |
| DeformationAndDerivedPatchingAlgebraPartII | K0.1 supplies arbitrary-module Čech comparison and filtered colimits; K0.3 supplies secant parameter lists, existence, permutations and powers. The four transport clauses are the declared parameter-systems extension, not an assertion that K0.3 already contains them. |
| EnhancedDerivedSheaves | E1.4:611 provides ringed enhanced pushforward; E1.6:693,706,768 provides regular global dimension with its finite-dimension condition, Kunz and Cohen presentations; E1.8:842,878 provides affine comparison and obstruction transport. Reflection requires injective Hom comparison. |
| SchemeAndStackFoundations | §§0.9:850,0.11:949,0.15:1092,0.17:1140 give limits, absolute closure, Popescu, finite-module depth/CM. §§2.6:3439,2.7:3493,2.18:3970,2.19:4094,2.21:4394 give cohomology, Ext-colimit comparison, DQCoh, proper duality and lci upper shriek. §4.12:5622 is Noetherian modification domination; qcqs extension is explicitly a gap. §4.13 supplies regularity/normality. |
| StableReduction | Layer2, README:360–364 explicitly supplies general coherent proper pushforward over locally Noetherian bases. Its curve-specific degree-one vanishing is not used for arbitrary schemes. |
| ResolutionOfSingularitiesCharacteristicZero | §7.5 at the open head supplies `qeResolution` for reduced Noetherian quasi-excellent ℚ-schemes. The complete regular base in §7.7 is excellent, its finite-type cover is quasi-excellent, and no finite-type-over-a-field condition is inserted. |

**Declared gaps:** the four active named contracts have identical slugs in README and design/plan.json. Ramified simultaneous Kummer bases exceed the unramified tower currently supplied; the common Cohen extension asks for a compatible square, beyond individual extensions; the parameter transports are absent from the current secant-list API; qcqs domination exceeds the Noetherian supplier target. Their absence today is not a finding. The four older supplier-less intake records were compared with the actual routes: the characteristic-zero derived bridges and pointed-modification comparison are no longer used; §§0.5 and 4.10 now expressly own completion balancing and equal-characteristic-zero specialization. Those old records do not create a live unowned Needs edge in this package. Their proof-certification limits are listed below.

**Ownership:** `roadmaps grep` was run by object on main and the indexed open heads, and local searches covered active/completed main roadmaps and board packages. Searches included splinters, big Cohen–Macaulay modules, algebra modifications, absolute integral closure, purity, products of flat modules and generically finite trace. Absolute-integral-closure scheme carriers are already assigned to SchemeAndStackFoundations §0.11; finite products belong to Tau Ceti; parameter lists and almost algebra have the owners above. No other owner of the package's splitting/BCM results or coherent degree-trace lemma was found. The unit/trace statement in EndoscopicTransferAndUnitaryTraceComparison concerns ℓ-adic sheaves, a different object. No duplicate fully qualified namespace or declaration of this package was found in the indexed Lean files. This is an object/citation audit of the sibling work, not a claim to have independently reviewed all of its mathematics.

**Dependency check output:**

```text
depcheck: 149 roadmaps, 1007 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The separate internal ordering issues in the preceding pass have the explicit orders at README:143. The command was run read-only; no merge-order file was changed.

**Policy:** the head diff against origin/main contains nine files, all inside packages/DirectSummandsAndBigCohenMacaulay. Suggested.lean has one `import Mathlib` and the existing, used Tau Ceti regular-local module. Its ten theorem bodies are `sorry`; all nine definitions have real bodies. No `lemma`, `set_option`, admitted example, arbitrary Prop field, process narrative, computational algorithm, or imported roadmap module was found in the target README/Lean. Reports and design metadata in the diff were not mistaken for target docstrings. Only this review report and scratch notes were written during the pass.

## Not verifiable

- HH95's published §1.2(d) and §2.3 remain uncertified under the settled access decision. They were not requested again. In particular, the full equal-characteristic-zero specialization proof in §4.10 was not independently recovered from that source; the roadmap now owns this step and cites its dependence explicitly.
- The arbitrary-module completion statement in §0.5 is asserted by ANDRE18B line659, BMPSTWW line516 and HEITMANNMA18 lines145–146. The cited passages refer onward for its proof. This pass verified the statement, hypotheses, finite/zero controls and ownership, but did not reconstruct the full arbitrary-module change-of-parameters argument from a separate proof text.
- No Lean command was run. The comparison used the worker-provided elaborated signatures for all 19 current declarations. The proposed S02 signatures require the repair worker's normal elaboration check; no unrun check is claimed here.
- The existence of a categorical retraction under the exact geometric hypotheses of §7.4 was not disproved by a proper-scheme counterexample. S06 is the witnessed unsupported promotion from the supplied ε-retractions; its linear counterexample rules out treating that promotion as a general categorical fact.
- The supplied open-head index and checkouts were the ownership boundary. No claim is made about work absent from those inputs. No missing-source request remains: the initially unresolved BHATT14 search was resolved through arXiv under the same key.

## Source issues

The following are source issues independently encountered or rechecked while resolving the locators. They are not additional package findings when the README already avoids them. Source wording is paraphrased.

- **Error** in ANDRE18B at §0.1(4), printed p.72 (ANDRE18B line 41): the source says monomial containment is equivalent to the exponent inequality without a dimension restriction; it should be restricted to positive dimension, since the empty product is 1 and its power ideal is zero; affects a stated result.
- **Misprint** in ANDRE18B at Lemma A.2.1(4), printed p.90 (ANDRE18B line 888): the source says the functional is S-linear with values in R; it should be R-linear, since no S-module structure on R is supplied; affects the proof.
- **Gap** in ANDRE18B at Proposition A.3.1, printed p.91 (ANDRE18B lines 912–914): the source says separatedness permits division of the functional by a power of r; it should justify division using regularity of r, handling r=0 separately; affects the proof.
- **Misprint** in ANDRE18B at Proposition A.3.1, printed p.91 (ANDRE18B line 918): the source says the auxiliary functional is defined on N; it should be defined on the previously selected finite free summand M; affects the proof.
- **Error** in ANDRE18B at Proposition A.3.1 and Applications, printed p.91 (ANDRE18B lines 922–937): the source says purity of an integral extension over the stated regular bases implies splitting without completeness; it should retain completeness or another sufficient hypothesis; the non-F-solid excellent Henselian DVR has no such functional; affects a stated result.
- **Misprint** in ANDRE18B at §4.1, printed p.85 (ANDRE18B line 663): the source says a module-valued relation multiplies polynomials with coefficients in that module; it should use scalar polynomials and explicitly specify the distinguished module coefficient of each variable; affects the proof.
- **Gap** in ANDRE18B at Proposition 4.1.2, printed p.85 (ANDRE18B lines 685–687): the source says the module colimit supplies an algebra and a factorization into D; it should supply an algebra construction and finite-witness comparison, accounting for maps that only land in D[1/π]; affects the proof.
- **Error** in ANDRE18B at §4.3, printed p.87 (ANDRE18B lines 747–753): the source says every normalization component supplies faithful flatness over the regular base; it should select components dominating the base; the R/p factor of R×R/p has p-torsion; affects the proof.
- **Misprint** in ANDRE18B at footnote 7, printed pp.86–87 (ANDRE18B lines 785–787): the source says the final term in the Tor segment is Tor_i(M,C); it should be Tor_i(N,C), which vanishes for the regular-sequence quotient; affects the proof.
- **Gap** in ANDRE18B at footnote 7, printed pp.86–87 (ANDRE18B lines 785–787): the source says the maximal regular sequence in P has length equal to the Tor induction index; it should use h=height(P), independent of that index; affects the proof.
- **Misprint** in ANDRE18B at Proposition 4.4.1, printed p.87 (ANDRE18B line 777): the source says the second almost Cohen–Macaulay algebra is over B; it should be over B′ with its own parameter system; affects a stated result.
- **Misprint** in BHATT18 at Introduction, preprint p.1 (BHATT18 lines 19,29): the source says the trace and rational-singularity arguments apply merely in characteristic zero; it should say the rings contain ℚ, excluding mixed characteristic from those immediate arguments; affects nothing.
- **Gap** in BHATT18 at Proposition 5.2, preprint p.9 (BHATT18 line 498): the source says the chosen f already has constant term zero; it should first divide p−f by a suitable unit; f=p²+X² requires the factor 1−p; affects the proof.
- **Misprint** in BHATT18 at Proposition 5.2, preprint p.9 (BHATT18 lines 521–522): the source says A′ contains the newly adjoined roots and resulting K°-structure; it should name A, the completed extension where those roots were adjoined; affects the proof.
- **Misprint** in BHATT18 at Theorem 5.4, preprint p.10 (BHATT18 line 563): the source says the map to B₀ splits without introducing B₀ in the theorem statement; it should quantify a finite injective extension A₀→B₀; affects a stated result.
- **Error** in BHATT18 at Proposition 6.2, preprint p.11 (BHATT18 line 616): the source says finite étaleness after inverting p suffices; it should also require generic surjectivity; Spec(A/p) has empty finite étale generic fibre and cannot almost retract A; affects a stated result.
- **Misprint** in HOCHSTER02 at §4.1, author-preprint p.8 (HOCHSTER02 line 229): the source says the module relation subtracts scalar multiples of bare indeterminates; it should specify a distinguished module element as their coefficient; affects a stated result.
- **Error** in HOCHSTER02 at §4.1 Note, author-preprint p.8 (HOCHSTER02 line 232): the source says increasing degree bounds at one fixed relation recovers the full algebra modification; it should distinguish scalar-polynomial multiples from the full ideal; T/kt retains t² while T/tT kills it; affects the proof.
- **Gap** in HOCHSTER02 at Theorem 4.2, author-preprint p.9 (HOCHSTER02 line 245): the source says the double full-modification sequence is obtained as a limit of partial ones; it should construct the finite-witness comparison without using the false fixed-relation colimit identification; affects the proof.
- **Misprint** in HEITMANNMA18 at §1.2, preprint p.3 (HEITMANNMA18 lines 105–110): the source says scalar indeterminates appear in an arbitrary-module relation without a module coefficient; it should specify the pointed module and its distinguished coefficient; affects a stated result.
- **Gap** in HEITMANNMA18 at Theorem 1.6, preprint p.4 (HEITMANNMA18 line 143): the source says non-bad partial sequences ensure survival of the full algebra-modification limits; it should justify the full-to-partial finite-witness passage inherited from Hochster; affects the proof.
- **Error** in KOVACS00 at Theorems 3 and 5, printed pp.188,190 (KOVACS00 lines 56,148): the source says the top canonical-sheaf pushforward equals the target canonical sheaf for arbitrary surjective maps; it should account for the Stein factor or connected-fibre condition; a degree-two projective-line map has generic ranks 2 and 1; affects a stated result.
- **Gap** in KOVACS00 at the deduction of Theorem 2, printed p.191 (KOVACS00 line 193): the source says Theorem 5 supplies the needed comparison; it should use a valid degree-sensitive trace argument for disconnected generic fibres; affects the proof.
- **Error** in KOVACS00 at Definitions and notation, printed p.188 (KOVACS00 lines 72–74): the source says arbitrary finite covers preserve log-terminal and canonical singularities; it should restrict the assertion to appropriate quasi-étale covers; z²+x³+y⁶=0 is a non-log-terminal finite cover of the smooth plane; affects a stated result.
- **Misprint** in BHATT12 at Example 1.3, preprint p.3 (BHATT12 line 144): the source says Frobenius multiplies finite length by d; it should be p^d, which exceeds 1 for positive d; affects the proof.
- **Misprint** in BHATT12 at Lemma 2.2, preprint p.6 (BHATT12 line 258): the source says the composite of d successive arrows ends in K_d; it should end in K_(d+1); affects a stated result.
- **Error** in BHATT12 at Proposition 3.2, preprint p.7 (BHATT12 lines 330–331): the source says every Frobenius polynomial is p-semilinear; it should give g(rα)=Σa_i r^(p^i)α^(p^i); the second Frobenius iterate already violates p-semilinearity; affects the proof.
- **Misprint** in BHATT12 at Proposition 3.2, preprint p.8 (BHATT12 line 339): the source says the coboundary solution n′ has Čech degree i; it should have degree i−1 so its differential has degree i; affects the proof.
- **Gap** in BHATT12 at Proposition 3.2, preprint p.8 (BHATT12 line 346): the source says an irreducible component can dominate the arbitrary scheme Y′; it should first treat finitely many integral components separately and take a finite disjoint union of their covers; affects the proof.
- **Gap** in BHATT12 at Theorem 0.4, preprint p.9 (BHATT12 line 384): the source says to iterate dim(X) times over an arbitrary Noetherian base; it should use a finite affine-cover cohomological bound, since Noetherian schemes need not have finite Krull dimension; affects the proof.
- **Misprint** in BHATT12 at Theorem 0.3, preprint p.9 (BHATT12 lines 394–396): the source says both maps are named s before composing with undefined t; it should name the lift t and the splitting s, giving s∘t; affects the proof.
- **Error** in HUNEKELYUBEZNIK at Lemma 2.2, preprint p.4 (HUNEKELYUBEZNIK line 166): the source says annihilation by finite integral extension holds without positive cohomological degree; it should require i>0; in R=𝔽_p, I=0, the class 1∈H⁰ cannot vanish in an injective extension; affects a stated result.
- **Misprint** in HUNEKELYUBEZNIK at Lemma 2.2, preprint p.5 (HUNEKELYUBEZNIK line 186): the source says the Čech terms of M are sums of localizations of R; it should use the corresponding localizations of M; affects nothing.
- **Misprint** in BMPSTWW at Theorem 2.13, preprint p.15 (BMPSTWW lines 687–688): the source says the modification makes the original X regular; it should identify the new source Z as regular; affects nothing.
- **Misprint** in STACKS at Duality for Schemes, Lemma 48.29.1, printed p.77 (STACKS line 3647): the source says the presentation matrix has rank r=r₀−r₁ when its determinant map is invertible; it should have rank r₁; for ranks (r₁,r₀)=(1,3), the required rank is 1, not 2; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fef173649da81183d384ef317d5c9cdae1617236", "job": "RT-DirectSummandsAndBigCohenMacaulay~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
