<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1482#issuecomment-6432122616 -->
Red team round 1 pass a (codex) of edad780

Verdict: needs_changes

1. **F01** (P2) The algebraic-point quotient is not a ring

   **Location:** packages/DiamondsAndVStacksPartII/README.md:274: “prime ideals of B/B°°”.

   **Claim:** This describes algebraic olivine points for every Huber pair admitted in D7.7.

   **Witness:** B = ℚ_p has B°° = pℤ_p; p belongs but p⁻¹p = 1 does not. Thus B°° is not a B-ideal and B/B°° is not a quotient ring.

   **Exact repair text:** “Algebraic points correspond to the prime ideals of B/(B·B°°), equivalently to the open prime ideals of B.” Use this generated-ideal convention consistently with D7.9 and D8.6. For ℚ_p the generated ideal is (1), the quotient is zero, and both the algebraic locus and its spectrum are empty. For discrete 𝔽_p[[u]], the quotient is unchanged and its two prime ideals give the two algebraic points.

2. **F02** (P3) A nontrivial finite étale map can be an open immersion

   **Location:** packages/DiamondsAndVStacksPartII/README.md:1002: “A nontrivial finite étale V → F^red … is étale but not an open immersion.”

   **Claim:** Every nonidentity finite étale reduction map produces a non-open formal neighbourhood.

   **Witness:** Take F = Spd(ℤ_p×ℤ_p) and V = Spec 𝔽_p, the first component of F^red. The finite étale map is nonidentity; its formal neighbourhood is the open-and-closed first Spd ℤ_p component.

   **Exact repair text:** “For F = Spd ℤ_p and V = Spec 𝔽_(p²), the finite étale formal neighbourhood Spd W(𝔽_(p²)) → Spd ℤ_p is not an open immersion: its geometric generic fibre has two points. A component inclusion over Spd(ℤ_p×ℤ_p), by contrast, is finite étale and open.” Both calculations hold for p = 2 and p = 3.

3. **F03** (P3) The negative facet Check has no structure map to its stated base

   **Location:** packages/DiamondsAndVStacksPartII/README.md:1558: “Spd(C, C⁺) with C⁺ of rank two does not have enough facets”.

   **Claim:** This is a negative example in the category over Spa(C,O_C) fixed in D11.10.

   **Witness:** For C⁺ ⊊ O_C the identity C→C does not map O_C into C⁺. Consequently Spa(C,C⁺) has no C-linear structure map to Spa(C,O_C); the Check is outside the definition's category.

   **Exact repair text:** “Let L be the completed perfection of C(T) for the Gauss norm, and let L⁺ be the inverse image of the T-adic valuation ring of k_C(T)^(perf) in O_L. Then O_C ⊂ L⁺, so Spd(L,L⁺) is over Spa(C,O_C). Its rank-two closed point is patch-open and is not rank one; therefore it is not cJ and does not have enough facets.” This replacement has two valuation points, with one rank-one point; the patch-open singleton of the other point has zero rank-one points.

4. **F04** (P1) The formal étale lifting supplier is narrower than the corollary

   **Location:** packages/DiamondsAndVStacksPartII/README.md:1016: “the étale site of a formal scheme is that of its reduction (AdicSpacesPartIII R2.9)”.

   **Claim:** The named supplier proves the formal-scheme realization in D9.14 throughout D9.7's nonnoetherian finite-ideal category.

   **Witness:** TauCetiRoadmap/AdicSpacesPartIII/README.md:7966 restricts formal-etale-site-invariance to locally topologically finitely presented formal O_K-schemes or adic noetherian formal schemes. D9.7 allows arbitrary complete finite-ideal rings; neither condition follows.

   **Exact repair text:** Add to D9.14: “For a complete separated I-adic ring A with I finitely generated and containing p, first transport the qc separated étale reduction datum through perfection by SchemeAndStackFoundations §0.24, then lift it from (A/I)_red through all A/Iⁿ by §0.23a, and effectivize the compatible system using AdicSpacesPartIII F0.3's adic-systems-equivalence-finite-ideal-type. This proves the finite-ideal formal étale realization here; R2.9 supplies its noetherian restriction.” Add §§0.23a–0.24 and the named F0.3 target to Needs. For A = ℤ_p⟨T₁,T₂,…⟩ completed p-adically, the identity and the two-copy étale reduction lift to Spf A and Spf(A×A); A is not noetherian or locally topologically finitely presented over the fixed base. The repair keeps this example in scope instead of narrowing D9.14.

5. **F05** (P2) The cutoff proof reverses scheme limits

   **Location:** packages/DiamondsAndVStacksPartII/README.md:382: “v-covers are filtered colimits of κ-small v-covers”.

   **Claim:** The scheme morphisms in the cutoff argument are recovered by filtered colimits.

   **Witness:** GLE line 1165 displays an inverse limit. For X₂ = Spec 𝔽_p[x,y]^(perf) → X₁ = Spec 𝔽_p[x]^(perf), the two-object diagram has limit X₂ and colimit X₁; their 𝔽_p-points number p² and p.

   **Exact repair text:** “Given S → T with T κ-small, choose S → T′ → T with T′ κ-small and S → T′ a v-cover. Every v-cover is a cofiltered inverse limit of κ-small v-covers; equivalently its coordinate-ring map is a filtered colimit of κ-small ring maps. The extension formula on sheaf values is a filtered colimit.” For the displayed diagram the corrected scheme limit has p² points (4 for p=2, 9 for p=3); the sheaf evaluation remains contravariant. GLE lines 1158–1165 contain the same verbal slip but the correct displayed formula.

6. **F06** (P3) Two Checks supply no discriminating instance

   **Location:** packages/DiamondsAndVStacksPartII/README.md:515: “For perfect X, reducedness of X is SW20 Proposition 18.3.1”; README.md:1517: “The predicate satisfied everywhere is constructibly dense.”

   **Claim:** These bullets count as Checks of reduced scheme-theoretic v-sheaves and constructibly Jacobson diamonds.

   **Witness:** The first repeats D8.5's general assertion without an instance. The second says the whole space is dense, true for every topology; it cannot distinguish the patch topology from the original topology.

   **Exact repair text:** Replace the first bullet by “For X = Spec(𝔽_p×𝔽_p), the unit evaluated on Spec 𝔽_p is the bijection between two component choices; collapsing X to the terminal object would give one.” Delete the second bullet; D11.8 already has five other Checks, including the two-point Sierpiński negative control. The replacement computes 2=2, while the wrong reduced object computes 2≠1, for p=2 and p=3.

7. **F07** (P2) The Tate specialization theorem is statable but absent

   **Location:** packages/DiamondsAndVStacksPartII/README.md:681; packages/DiamondsAndVStacksPartII/Suggested.lean:8–13.

   **Claim:** The acceptance test supplies no statement, citing missing v-sheaf and formal-scheme carriers. It omits D9.1's general specialization theorem, the geometric input to the uniqueness, spectral-specialization and flat-kimberlite results.

   **Witness:** D9.1's spectral closed surjection uses only native Spa and prime spectra. TauCeti/RingTheory/Huber/Pair.lean:138, TauCeti/RingTheory/Huber/Basic.lean:192 and TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101 supply its pair, Tate predicate and domain. No v-sheaf occurs.

   **Exact repair text:** Add D9.1 to the headline list and state its specialization theorem with `sorry`. Define the special-fibre carrier as the native subspace of `PrimeSpectrum P.plus` consisting of primes containing every topologically nilpotent element of `P.plus`. State existence of a function from `TauCeti.ValuationSpectrum.spa P.plus` to this subspace, characterized for every point x and a ∈ P.plus by `a ∈ sp(x) ↔ x.valuation a < 1`, that is surjective, spectral and closed. This characterizes the actual specialization map; it is not a free topological stand-in. Carry the commutative topological ring, Huber/Tate and continuous plus-preserving ℤ_p-algebra hypotheses explicitly in the theorem signature. Use only native `TauCeti.*` imports needed by this statement, alongside `import Mathlib`; give the subspace definition a real body. This target has source and target sizes 1→1 for (ℚ_p,ℤ_p), 2→2 for a rank-two valued field pair, and 0→0 for the zero pair. Strict inequality sends p to the specialization ideal and excludes 1, for p=2,3. Keep the strictly totally disconnected homeomorphism clause in the docstring as requiring the absent perfectoid carrier. No Lean elaboration was run in this read-only pass.

8. **F08** (P3) The introduction has no Remark 5.2

   **Location:** packages/DiamondsAndVStacksPartII/README.md:1755: “the paragraph after Remark 5.2 of the introduction (p. 6)”.

   **Claim:** This is an exact locator for the formal-scheme connected-components observation.

   **Witness:** GLE lines 267–270 contain the observation in an unnumbered introductory paragraph on p. 6. Remark 5.2 instead occurs at GLE line 1901 in §5 on p. 38.

   **Exact repair text:** “GLE Introduction, unnumbered paragraph on normal formal schemes and connected components, p. 6, GLE lines 267–270; §4.6, motivation before Example 4.43, p. 36, GLE lines 1773–1782.” These locations contain the indicated observation and specialization-fibre motivation, respectively.

9. **F09** (P3) Classical patch density points to the wrong supplier section

   **Location:** packages/DiamondsAndVStacksPartII/README.md:1524: “AdicSpacesPartII R0.9”.

   **Claim:** The listed dependencies supply the classical-point patch density used in the preceding proof.

   **Witness:** TauCetiRoadmap/AdicSpacesPartII/README.md:10632 places classical-points-constructible-density in R1.9 and imports it from TauCetiRoadmap/RigidAnalyticGeometry/README.md:720, §8.2. R0.9 describes the affinoid carrier and Jacobson theory, not this stronger density theorem.

   **Exact repair text:** Add “AdicSpacesPartII R1.9, classical-points-constructible-density (from RigidAnalyticGeometry §8.2)” to D11.8's Needs and supplier contract. Retain R0.9 only for its affinoid carrier. The supplied theorem applies to K⟨T⟩ and puts a classical point in every nonempty patch-open; the rank-two field pair with a smaller plus ring remains outside its A⁺=A° hypothesis and is not accidentally made cJ.

## Verified sound

Read all 1,837 README lines and all 47 Suggested.lean lines. The inventory contains **75 bold targets** in 73 numbered sections (including the general residue-field prerequisite and both D11.14 statements), **0 Lean declarations**, and **165 labelled Check bullets**. The tables below record the computations, including the failed and nondiscriminating Checks. Examined all **73 section-ending locator blocks** against the eight cached works; R08 corrects one locator. Two additional proof inputs were retrieved legally through the sources service: HEU21, Heuer, *Line bundles on perfectoid covers: case of good reduction*, arXiv:2105.05230v2, Lemma 5.2, lines 882–913; and BHA17, Bhatt's 2017 perfectoid lecture notes, Theorem 8.1.2, lines 3381–3412. These confirm the sheafification qualification and the inverse-limit route, respectively.

Compared the **12 named roadmap supplier contracts**, plus the HeckeStacksAndLocalShtukas consumer citation, with the available main or current supplier texts. R04 and R09 record the substantive mismatches. All **10 gap slugs** occur in both the plan and the README with the named supplier and matching needs. The missing general residue/stalk, formal reduction and weak-normality results are declared contracts, not findings for their present absence. The contract requirements keep arbitrary rank, the chosen valuation subring, nonnoetherian finite-ideal formal schemes and the characteristic-zero restrictions where needed.

The prescribed dependency check returned:

```text
depcheck: 56 roadmaps, 652 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Internal order also follows the proof routes: D7.7–D7.10 precede D7.6; D11.16–D11.17 precede D11.15. The diff from origin/main changes only files under packages/DiamondsAndVStacksPartII. No Lean build, elaboration, git mutation, external post or package repair was performed.

### Lean declaration/context ledger and headline inventory

| File/section | Declarations and captured context | Native-carrier test and result |
|---|---|---|
| Suggested.lean:1–47 | 0 definitions, 0 theorems, 0 instances, 0 section variables; empty TauCetiRoadmap.DiamondsAndVStacksPartII namespace | 0 signatures to check; no dropped binders, sorry'd data, duplicate fully qualified names or padding. A `#check @name` file would contain 0 checks, so no elaboration was run. |
| D7.3, D7.6, D7.8, D7.10, D7.11 | No Lean binders | 5 headline targets require small v-sheaves/diamondification; native Spa alone supplies 0 of those functors. Each is named in the docstring. |
| D8.3–D8.6 | No Lean binders | 4 targets require the two v-topoi and reduction adjunction; generic Mathlib Adjunction supplies the abstract interface, not either concrete category. All 4 are named. |
| D9.7, D9.14 | No Lean binders | 2 targets need formal schemes, prekimberlites or their étale neighbourhoods; 0 native carriers for these at the pins. Both are named. |
| D10.2, D10.4, D10.10–D10.15 | No Lean binders | 8 targets need generic fibres, formal schemes, v-closures or diamondification. Native Scheme and IsIntegrallyClosed do not construct those objects. All 8 are named. |
| D11.1, D11.4, D11.6, D11.13–D11.15, D11.18, D11.20 | No Lean binders | 8 targets need kimberlites and actual specialization/tube maps. A free continuous map with an assumed connected-fibre property would supply none of this geometry. All 8 are named. |
| D9.1 | Missing headline; explicit Tate/Huber, topological-ring and base-map hypotheses needed | Domain Spa and special-fibre prime-spectrum subspace both exist; 1 missing statable headline, R07. |

Pinned carrier checks used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. All 24 cited library file paths exist. In particular, Mathlib/FieldTheory/Perfect.lean:44 makes PerfectRing bijectivity of the specified power map, without supplying characteristic or primality; Mathlib/RingTheory/Valuation/Integers.lean:386 puts ltIdeal on the integer subring; Mathlib/Topology/Defs/Induced.lean:166 includes surjectivity in IsQuotientMap. TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101 permits an arbitrary topological-ring subring before Huber hypotheses are added. The R07 repair therefore requires those hypotheses explicitly. TauCeti/RingTheory/Huber/PowerBounded.lean:494 puts the topologically nilpotent ideal on the power-bounded subring, supporting R01's distinction. The flat_toCompletionLoc signature at TauCeti/RingTheory/Huber/LocalizationTopology/Laurent/Flat.lean:804 retains its denominator-power hypothesis and the complete strongly noetherian Tate context.

### Computed target ledger

Each row is one bold target, not a claim that finitely many examples prove its theorem. Unless specified otherwise, p is prime, examples work for both p=2 and p=3, O=ℤ_p, and all ring maps preserve 1. A field's plus ring is retained explicitly. “1” and “2” in point/component comparisons denote cardinalities; ∅ has cardinality 0. An equality of section sets is evaluated on the stated marked perfectoid test. No target uses factorials, natural subtraction, division by a possibly zero scalar, cosets, induction normalizations or an unbound rank parameter; the relevant boundary parameters are p, n, valuation rank, empty objects and coefficient extensions.

| Statement (README line) | Context and instances tried | Values computed on the two sides; result/change |
|---|---|---|
| D7.1 (145) | Finite universal homeomorphism, characteristic zero; identity, cusp, quadratic unramified field extension; rank-two residue prolongations | Identity/cusp residue degree 1=1. A quadratic field map gives 1→1 ordinary points but 2→1 geometric points, hence fails universal homeomorphism. t=s(s−1) has residues s=0,1, also in characteristics 2,3; the two localizations differ. No new defect. |
| D7.1 general prerequisite (153) | Arbitrary analytic pre-adic spaces over ℚ_p; identity and proper complete-field extensions | K=K gives residue pair (K,K⁺)=(K,K⁺). Finite quadratic extension separates into 2 points over an algebraic closure; transcendental extensions are not reduced to this computation. Conditional on the declared general gap. |
| D7.2 (170) | Residue-pair-preserving homeomorphism; n=1,2, identity on Spa ℚ_p | Both stalk quotients are ℤ/pℤ and ℤ/p²ℤ, with respectively p and p² elements (2,4 or 3,9). n=0 is excluded. Merely identifying fields without plus rings would not identify these quotients. |
| D7.3 (184) | Analytic universal homeomorphism over ℚ_p; dual numbers and cusp normalization | Every map ℚ_p[ε]/ε²→perfectoid test kills ε, giving the same sections as ℚ_p; cusp parameter t is recovered after normalization in the integrally closed test. Quadratic separable extension gives 2 geometric sections versus 1, outside hypotheses. |
| D7.4 (201) | All 𝔽_p-schemes; affine line, zero ring, dual numbers, Frobenius | Hom(𝔽_p,R⁺) has 1 element; affine-line sections are R⁺, whereas the analytic convention gives R. ϖ belongs to both, ϖ⁻¹ only to R. ε maps to 0; Frobenius on R⁺ is bijective; empty gives 0 sections on nonempty tests. |
| D7.5 (236) | Nonempty qc space mapping to valuation spectrum; field, DVR, empty source | Image {η,s} has largest prime s and {η} has η, each uniquely. Field spectrum gives its sole prime. Empty image has 0 candidates, explaining the explicit nonempty hypothesis. |
| D7.7 (250) | Arbitrary Huber pairs; Tate field, discrete 𝔽_p[[u]], finite field | Tate-field h has one lift per Spa point. Discrete DVR Spa has 3 points, Spo has 4, and the u-adic fibre has 2. Finite-field spectra both have 1. Algebraic quotient on ℚ_p is undefined as written; corrected quotient is 0 and has 0 primes: R01. |
| D7.8 (285) | Complete pair over ℤ_p; formal DVR, Tate field, discrete DVR | Spd ℤ_p and Spo ℤ_p each have 2 points; Spd ℚ_p and Spo ℚ_p each have 1; discrete 𝔽_p[[u]] gives 4=4. No general homeomorphism is inferred from a continuous bijection outside the listed cases. |
| D7.9 (299) | Closed schematic subset; zero/unit ideals and two-component discrete ring | I=0 yields whole spectrum; I=(1) yields ∅. For B=𝔽_p×𝔽_p, the whole two-point subset is V(0); 0 is not prime. The target correctly uses “ideal,” unlike GLE Proposition 2.36. |
| D7.10 (313) | Perfect affine schemes/families; empty family, valuation trait, proper map | ∅→Spec 𝔽_p: cover=false, sheaf-surjection=false; ∅→∅: both true. Spec(K×κ)→Spec V hits 2 scheme points but misses the valuation joining them, so both v-tests fail. Identity/proper surjection pass both; generic inclusion misses closed points on both sides. |
| D7.6 (333) | Arbitrary perfect schemes, including non-qc disjoint union | Hom(Spec 𝔽_p,Spec(𝔽_p×𝔽_p)) has 2 elements on either side. A map from an affine to ⨿ℕ Spec 𝔽_p is a finite-image locally constant label, with identical descended labels under both pullbacks. Nonperfect nilpotents are killed, so the unrestricted converse would fail. |
| D7.11 (350) | Perfect discrete source, pre-adic target; field and perfected affine line | From Spa(𝔽_p,𝔽_p) to Spa(ℤ_p,ℤ_p), both Hom sets have 1 reduction map. Endomorphisms of the perfected affine line include distinct T↦0 and T↦1 on both sides. A dual-number source has ε≠0 before diamondification and ε=0 afterwards, so perfection is essential. |
| D8.1 (378) | Cutoff sites; terminal/initial, nonperfect polynomial ring, inverse diagram | Terminal sections=1, initial sections=0 on nonempty tests. 𝔽_p[t] has no p-th root of t; its restriction is represented by its perfection. For X₂→X₁, limit point count p² differs from colimit count p: R05. |
| D8.2 (407) | Quotient topology on field-valued points; field, perfected line, empty | Field spectrum has 1 class; perfected line has one generic plus its closed primes, exactly the original Zariski spectrum; empty has 0. Splitting a presentation into two identical covers still identifies the duplicated point classes. |
| D8.3 (436) | Colimit/finite-limit extension of formal ⋄ | Terminal maps to terminal (1 section), initial to initial (0). Terminal v-sheaf has reduction Spec 𝔽_p with 1 point, whereas a quasiseparated diamond's reduction has 0; hence terminal is not a diamond. Two-point coproduct remains two-point-valued. |
| D8.4 (465) | Right adjoint, limit preservation | Spd ℤ_p reduces to Spec 𝔽_p (1); Spd ℚ_p reduces to ∅ (0). For perfect X, the unit gives X=X. For O⟨T⟩, reduction is Spec 𝔽_p[T]^(perf), and for ideal (p,T) it is Spec 𝔽_p; the ideal of definition matters. |
| D8.5 (498) | Unit-isomorphism predicate, perfect X | Unit on terminal has 1↔1, on initial 0↔0. On two-component X it is 2↔2. The counit Spd 𝔽_p→Spd ℤ_p has image 1 of 2 points. One printed Check merely repeats the target: R06. |
| D8.6 (528) | General pair over ℤ_p; generated topologically nilpotent ideal | ℤ_p gives ℤ_p/(p), then perfection 𝔽_p; ℚ_p gives ideal (1), quotient 0, empty reduction. For 𝔽_p[ε]/ε² discrete, ε is killed and reduction is 𝔽_p. Both nonanalytic and original reduction agree in these cases. |
| D8.7 (542) | Quasiseparated diamond | Spd ℚ_p has 0 maps from Spec(k)^⋄; empty diamond also has 0. The terminal v-sheaf has 1 such map and is outside the diamond hypothesis. |
| D8.8 (554) | Counit square; identity, (p,T)-adic disc, discrete/norm field | Identity square is Cartesian. O[[T]] over O has reduction Spec 𝔽_p, but its p=0 fibre also has T≠0 analytic points: square not Cartesian. Discrete Laurent field gives adic=true/formally-adic=false; norm-perfect char-p field to its discrete avatar gives adic=false/formally-adic=true. p-adic pairs give both true. |
| D8.9 (586) | Formal pairs and map to ℤ_p; defining ideals | For p-adic O⟨T⟩, I_A=(p) and A·I_B=(p), so both conditions hold. For (p,T)-adic O[[T]], T^m∉(p) for every m≥1 and the formal square fails. On the zero pair both ideals agree and both conditions hold. |
| D8.10 (598) | Formal adicness, closedness and absolute diagonal | Spd ℤ_p's diagonal and empty diagonal satisfy both properties. Spd 𝔽_p→Spd ℤ_p and T=0 in Spd 𝔽_p[[T]] are formally closed. Completion into the discrete affine line is open, but its base-changed reduction is the whole completion whereas its own reduction is the origin: unequal. |
| D8.11 (631) | Formally p-adic structure and diagonal | For Spd ℤ_p the reduction of both square factors is Spec 𝔽_p, and the pullback is Spec 𝔽_p. Identity diagonal over the empty object gives ∅=∅. Thus the absolute and relative diagonal conventions agree. |
| D8.12 (643) | Counit monomorphism and reduced-fibre criterion | F=Spd ℤ_p has an injective counit with 1-point image and formally adic diagonal. Its special section belongs to the counit and formalizes through the discrete reduction; its generic section does neither. For F=∅ both predicates hold with 0 sections. |
| D8.13 (655) | Formally closed subsheaf of formal Spd A | For A=ℤ_p, F=whole gives J=(p), reduction Spec 𝔽_p; F=empty gives J=(1), reduction ∅; F=special point again gives Spec 𝔽_p. The theorem does not claim J is unique. |
| D9.1 (681) | Tate pairs, strict-inequality ideal | For rank-one field, sp is 1→1; for rank-two plus ring, 2→2. On C⟨T⟩, Gauss maps to (0) and T=a with abs(a)<1 maps to (T); infinitely many a map to one prime. Units have value 1 and are excluded; 0 has value 0 and is included. Zero pair gives ∅→∅. Missing Lean headline: R07. |
| D9.2 (717) | Formalizations and local formal presentations | ℤ_p has extensions; ℚ_p would require an invertible p in an integral reduction, so has none. Perfect affine X^⋄ formalizes, and a sheaf colimit formalizes locally. Empty has an empty covering presentation and 0 sections; nonempty ℚ_p has 1 underlying point and fails despite empty reduction. |
| D9.3 (748) | Formally separated target | A bounded coordinate a in R⁺ has exactly 1 extension with that coordinate; ϖ⁻¹ has 0 integral extensions. Thus “at most one” includes both 1 and 0 and does not assert existence. Products of the two identity extensions still have exactly 1. |
| D9.4 (760) | Formal separatedness plus v-local formality | ℤ_p: (true,true); ℚ_p: (true,false); empty and Spec 𝔽_p^⋄: (true,true). The conjunction separates the nonempty diamond from the special-point sheaf. |
| D9.5 (789) | Specializing v-sheaf and formalized point | On Spd ℤ_p, η and s both map to (p). On O⟨T⟩, Gauss maps to generic reduction and a maps to its residue ā; a and a+p have the same image. Empty map has 0 fibres. The closed point, not rank-one generic prime, fixes the direction. |
| D9.6 (819) | Representable reduction plus closed counit | ℤ_p: reduction 1 point, analytic part 1 point; O⟨T⟩: perfected affine-line reduction and closed-disc analytic part. Nonempty qs diamond has empty reduction and fails v-formality; empty has both parts empty and passes. |
| D9.7 (849) | Separated complete finite-ideal formal scheme, no noetherian requirement | O_C with ideal (p) gives Spec k_C and one-point analytic fibre; (p,T)-adic ℤ_p[[T]] gives Spec 𝔽_p and includes a characteristic-p analytic T-point. Empty gives 0=0; doubled origin has two distinct specializations and is excluded by separatedness. |
| D9.8 (871) | Locally closed reduction subset, whole-image condition | Origin in O⟨T⟩ gives Spd O[[T]]; empty gives ∅; whole reduction gives F. For a single perfect coordinate, a=0, a=ϖ and a rank-two infinitesimal of rank-one value 1 distinguish respectively the zero locus, formal neighbourhood and larger point fibre. Completion agrees with the supplied noetherian model. |
| D9.9 (902) | Constructible locally closed S, finite local equations | For S=V(T), the open locus contains T=ϖ and excludes T=1; a higher-rank T with value<1 but no power bounded by ϖ is outside. S=whole gives identity, S=empty gives empty open. Completion at the origin is not formally adic into the original discrete line. |
| D9.10 (914) | Analytic sheafification, arbitrary scheme; perfectness for reduction | Spec 𝔽_p gives 1 section; affine line gives R⁺/R°°, with ϖ↦0 and 1↦1. Two distinct representatives 0,ϖ have equal reduction, excluding formal separatedness in general. Empty gives 0; perfect affine reduction recovers its coordinate ring. |
| D9.11 (944) | Prekimberlite to Heuer sheaf | For O, SP has terminal target. For O⟨T⟩, a↦ā; both 0 and p map to 0, while 1 does not. Its origin fibre is Spd O[[T]], not the singleton origin; empty fibre computation remains empty. |
| D9.12 (973) | qc separated étale perfect-scheme map, completed lift | Degree-two residue extension produces completed unramified degree-two lift and a 2-point geometric generic fibre. Identity produces identity. Ordinary R⁺ and R⁺×R⁺[1/ϖ] have the same reduction, but completion kills the second factor; the target correctly requires completed uniqueness. |
| D9.13 (985) | Formally adic qc étale neighbourhoods | Identity V gives F; Spec 𝔽_(p^r) gives Spd W(𝔽_(p^r)), with geometric degree r; formal-scheme case gives the corresponding étale lift. A component inclusion has degree 1 on one component and 0 on the other and is open, refuting the last Check: R02. |
| D9.14 (1014) | Reduction equivalence, including nonnoetherian formal realization | Identity and two-copy étale data reduce/lift to 1 and 2 copies. For p-complete ℤ_p[T₁,T₂,…], these are Spf A and Spf(A×A), but cited R2.9 excludes A. The étale-equivalence target is supported by GLE; its formal lifting route needs R04. |
| D10.1 (1040) | All O-schemes, marked untilts; comparison | Affine line: formal sections R♯⁺ versus analytic R♯; ϖ belongs to both, ϖ⁻¹ only to the latter. F-algebra formal sections=0 on integral tests. π-completion gives the same maps to complete R♯⁺. Proper projective space gives equal functors; empty gives 0. Infinite-coordinate sequences and countable disjoint union distinguish arbitrary, locally finite-type and qc scopes. |
| D10.2 (1077) | Entire locally formally finite-type FS category | Spf O gives Spa E on both routes; Spf O[[q]] gives the union of discs abs(q)^n≤abs(π), the open disc, on both routes, not the closed disc. Empty formal scheme gives 0 generic points. |
| D10.3 (1091) | Formally normal FS object | O[[q]] gives a normal open disc. Cusp O[[t²,t³]] has t integral but absent and has a nonnormal/nonseminormal generic cusp; it fails the premise. Normality is not inferred from flatness. |
| D10.4 (1105) | Nonzero normal complete local flat FS algebra | O and O[[q]] each give 1 connected component. Unramified O_L gives 1 component over E but [L:E] after algebraic-closure base change. O[[x,y]]/(x(x−π)) gives 2 disjoint discs and fails normality. Zero ring has 0 components and is excluded. |
| D10.5 (1123) | Algebraically closed residue field, classical point | On O⟨T⟩, T=a specializes on both routes to T=ā; a and a+π agree after reduction. The closure meets the special locus in 1 point. Choosing the generic prime instead would give the wrong specialization. |
| D10.6 (1137) | Separated locally noetherian formal scheme | Spf ℤ_p has maximal diamond open Spd ℚ_p and complement Spd 𝔽_p. Over algebraically closed char-p test C, Spec 𝔽_(p²)^⋄ has 2 sections, versus 1 for 𝔽_p, and both have nonempty reduction. Generic residue-point map into a perfect line is mono but not closed. Empty gives empty maximal open. |
| D10.7 (1155) | Flat locally formally finite-type object | In Spd O the generic point closure contains both points; for special-only Spd k the generic locus is ∅ and not dense, and flatness fails. O[[T]] has characteristic-p analytic points, but every nonempty open still meets the generic locus. |
| D10.8 (1169) | Small v-stacks, qc monomorphism and closed embedding | Identity and ∅→X satisfy both sides. Two-point fold has closed image but 2-point fibres, so mono=false and closed-immersion=false. A rank-one open point in a rank-two field space is mono but its image is not closed; neither side holds. |
| D10.9 (1185) | v-closure, weakly generalizing subsets | Closed Y gives Y^cl=Y; ∅ gives ∅. In the disc, the ordinary closure misses Gauss but contains a rank-two specialization, whereas v-closure contains both. The closed singleton in a rank-two field space has empty associated subsheaf. Flat Spd B has generic-fibre v-closure all of Spd B. Torus discs must include nonrational residue discs over nonclosed C; see source issues. |
| D10.10 (1219) | Flat normal FS formal schemes; algebraically closed k | For Spf O, both endomorphism sets over O contain only identity. A map Spf O→Spf O⟨T⟩ corresponds to a∈O and the compatible triple (analytic a, residue ā); mismatched (a,ā+1) gives 0 morphisms on either side. |
| D10.11 (1234) | Flat normal formal schemes; Hom over Spd O | Identity and a↦a+π on the disc induce the same special-fibre map but distinct generic maps; the full v-sheaf retains the distinction. On Spf O there is 1 identity on both sides. Dual numbers give two algebraic maps collapsing to one but fail normality. |
| D10.12 (1253) | Proper flat normal O-schemes | Spec O and P⁰_O give 1 identity on both sides. A chosen automorphism of P¹_O is recovered as that automorphism, not a unique unmarked isomorphism class. Proper special-fibre-only Spec k fails flatness. |
| D10.13 (1267) | Absolute weak normalization and stated finite-type scopes | A=O and A=0 have unchanged v-sheaves and reductions of sizes 1 and 0. Nilpotent thickenings have every nilpotent sent to 0, explaining invariance. For k=𝔽_p(t), Frobenius is not surjective (t has no p-th root); replacing absolute weak normality by ordinary reducedness would lose information. Conditional on the declared formal awn contract. |
| D10.14 (1283) | Proper ambient P, scheme-theoretic flat closure | U=∅ gives closure ∅ on both sides. A generic section in P¹_E closes to Spec O; its generic v-point has v-closure Spd O. U=P_E gives the flat schematic closure, which excludes any extra vertical component of a nonflat ambient model. |
| D10.15 (1300) | Marked v-isomorphism, proper flat normal models, minuscule data | For GL_n with d=0 or n, Grassmannian=Spec O and the lifted map is identity. n=0 admits only d=0 and the same point; d>n is outside the hypothesis. Two marked P¹ automorphisms yield their two distinct lifts. No existence of a normal integral model is inferred from uniqueness. |
| D11.1 (1326) | Partial properness of SP, valuative prekimberlite | O and O⟨T⟩ pass the extension test; empty has 0 tests. The formal G_m-neighbourhood is valuative, but a rank-two boundary with rank-one value T=1 and closed-point value T<1 shows its immersion into the formal line is not partially proper. |
| D11.2 (1355) | Valuative F, open qs locally spatial D, partially proper D→F | (Spd O,Spd E) gives constant 1→1. Full disc and open unit disc pass; smaller closed disc abs(T)≤abs(p) misses a boundary lift and fails. D=∅ gives 0→size(Fred), still smelted. |
| D11.3 (1385) | Smelted analytic part and qc specialization | Spd O has 1-point analytic part over 1 reduction point. Spd O[[T]] has both p- and T-charts. Doubled origin fails separated diagonal, hence fails before the qc test. Empty specialization has inverse image ∅ and is qc. |
| D11.4 (1413) | Complete finite-ideal separated formal schemes | O_C gives 1 analytic point→1 reduction point despite nonnoetherianity. Ideal (p,T) gives 2 chart generators and a nonempty characteristic-p T-chart. Zero ring gives 0 nonempty charts and ∅→∅. Finite chart argument does not apply to arbitrary infinitely generated ideals. |
| D11.5 (1431) | Constructible locally closed subset, interior of fibre | Origin of formal line gives open unit disc. Rank-two field pair has closed-point fibre of size 1 but empty interior/tube of size 0. Whole S gives D; empty S gives ∅. The classical Berthelot tube matches the open-disc calculation. |
| D11.6 (1461) | Smelted spectral specialization, kimberlite closedness | For rank-two field pair the specialization homeomorphism sends a closed singleton to a closed singleton; for Spd O it is 1→1. Empty map is spectral and closed. Local spectrality does not imply a global qc map for a countable disjoint union. |
| D11.7 (1473) | Formally closed/étale permanence | Closed special point inside Spd O yields empty analytic intersection and one reduction point. Empty closed immersion yields empty structure. Degree-two unramified étale lift gives 2 geometric generic points and the matching étale reduction. |
| D11.8 (1497) | Rank-one patch density, specified plus ring | Rank-one field: 1 rank-one point in 1-point patch space. Rank-two pair: patch-open closed singleton contains 0 rank-one points. Perfected characteristic-p disc has same diamond as ordinary disc; empty is vacuously cJ. Sierpiński open singleton has patch closure itself, not both points. One tautology fails as a Check (R06); density supplier locator R09. |
| D11.9 (1530) | cJ smelted pair, constructible S | Closed-disc origin tube has closure equal to the full specialization fibre, including its rank-two boundary. Higher-rank field example has tube ∅ with closure ∅≠singleton fibre, and cJ=false. Empty S gives closure ∅=∅. |
| D11.10 (1542) | Characteristic-p perfectoid base C, finite-type C facets | Point and closed disc have identity facet covers. Proposed same-field rank-two negative example has 0 compatible C-linear base maps; R03 replaces it by an extension L with rank-two plus ring containing O_C, whose non-rank-one patch singleton contains 0 rank-one points. |
| D11.11 (1570) | cJ, locally noetherian reduction, surjective sp | (O,E) gives 1→1 and is rich; flat finite-type formal charts have surjective specialization. (Spec 𝔽_p[T]^⋄,∅) gives 0→nonempty, so not rich. A rank-two open contributes a patch-open with 0 rank-one points, also not rich. Empty gives 0→0 and passes. |
| D11.12 (1603) | Rich pair, connected closed-point tubes | Formal line tubes have 1 component (over the residue point's unramified coefficient extension). x(x−p)=0 gives 2 disjoint components in each tube. (O,E) has its one-point tube. Richness alone accepts the two-branch model; topological normality rejects it. |
| D11.13 (1630) | Rich smelted pair, quotient topology | Spd O gives identity on a one-point quotient; two disjoint copies give identity on a two-point discrete quotient. Empty gives 0→0. Rank-two non-cJ test does not satisfy richness and is not used to infer the theorem. |
| D11.14 unrestricted (1642) | Topologically normal rich pair, no closed-specialization axiom | O gives component bijection 1→1; empty gives 0→0; two-branch model gives 2→1 and fails topological normality. The infinite valuation-chain open has 0 closed points, so the printed closed-point proof cannot be applied merely from local noetherianity. No false theorem inferred from that topological example; unrestricted proof remains uncertified. |
| D11.14 intermediate (1644) | Same plus every point has a closed specialization | O: 1→1; empty: 0→0. Perfected finite-type line has closed specializations of its generic point. Deleted-maximal infinite chain has no closed points and fails the added hypothesis. The source proof works with this extra condition. |
| D11.16 (1680) | π-adic prekimberlite/kimberlite over O | Spd O and π-complete flat finite-type Spd A pass. O[[T]] with (π,T) has analytic points with π=0,T≠0, so Xan≠Xη and fails π-adicness. Discrete perfect k-algebra has both analytic and generic loci empty but passes; empty also passes. |
| D11.17 (1714) | Flat π-adic cover by integral perfectoid pairs | O passes; nonzero discrete perfect k-algebra has generic cardinal 0 and nonempty reduction, so fails flatness; empty passes. For Y²=π²X, z=Y/π is integral, z²=X, and abs(z)²≤1 implies abs(z)≤1, also for p=2. Suitable higher-rank valuation examples have nonempty N(t≪1) disjoint from generic fibre while still flat; density is not a definition. |
| D11.15 (1745) | Separated flat normal topologically finite-type formal scheme | O gives 1→1 components; O×O gives 2→2; unramified O_L has 1→1 before geometric base change. Complete closed-point local rings give the connected tubes of D10.4. x(x−p)=0 gives 2→1 and fails normality. Locator correction R08. |
| D11.18 (1759) | Flat qc separated π-adic 𝒦, dense C-points, pfp reduction, formalizable C-sections | Spd O has unique identity generic map and triple lift. Translation T↦T+π on a proper line differs from identity generically although reductions agree; the triple retains generic information. The nonflat special-only sheaf has empty generic fibre and nonempty reduction, so faithfulness cannot be extended to it. |
| D11.19 (1776) | Proper π-adic prekimberlite with three 𝒦 conditions | Spd O has dense generic point and is flat; special-only Spd k has empty generic part and fails density although it can satisfy the other point conditions vacuously. Empty has empty dense-open generic locus and is flat. |
| D11.20 (1790) | Flat weakly normal domain, normal generic fibre, algebraically closed k | O⟨T⟩ is normal with 1-component tubes. Y²=π²X at a nonzero square residue gives 2 tubes when p≠2 and fails the criterion. A=ℤ_p+pO_L for unramified L≠ℚ_p has normalization O_L≠A and one connected generic point; after residue base change there are [L:ℚ_p]>1 points. Thus the algebraically closed residue hypothesis excludes the source's counterexample. |

### Conventions, supplier-gap and additional negative-control computations

| Context | Instance and computed values | Result |
|---|---|---|
| Opening conventions | Frobenius on 𝔽₂ sends 0,1 to 0,1; on 𝔽₃ sends 0,1,2 to 0,1,2. In dual numbers ε²=0, hence ε^p=0 for p=2,3. | Perfectness rejects the nonzero nilpotent. |
| Direction and units | Formal coordinate ϖ has reduction 0; 1 has reduction 1; ϖ⁻¹ is excluded. In Spd O, η specializes to s, and sp(η)=sp(s)=(π). | Neither reversing specialization nor replacing <1 by ≤1 gives the same map. |
| Empty/zero conventions | Spec 0=∅; both generic and special fibres=∅; number of candidate maximal/minimal image points=0. | No implicit nonempty object is introduced. |
| completed-etale-lifts | R⁺ and R⁺×R⁺[1/ϖ] have the same special fibre, but their ϖ-adic completions are both R⁺. Degree-two unramified completed lift has geometric degree 2. | Completion is necessary; unrestricted scheme étale invariance alone is not effectiveness. |
| mixed-characteristic-weak-normality | For A=ℤ_p+pO_L, reduction field 𝔽_p differs from normalization residue 𝔽_(p^r), r>1. Thus normalization is not universally injective, even though its ordinary closed fibre is a singleton. | The gap does not incorrectly force this weakly normal nonnormal order to be normal. |
| finite-geometric-fibre-radiciality | Spec 𝔽_(p²)→Spec 𝔽_p has 1 ordinary point but 2 geometric points; over algebraically closed k, a nonzero purely inseparable degree-p map has 1 geometric point. | Geometric singleton, not ordinary singleton, is the correct condition. |
| absolute-weak-normality-formal | In 𝔽_p(t), t has no p-th root; in its perfection, t^(1/p) exists. In O normal with characteristic-zero fraction field there is no proper finite birational normalization. | Characteristic-p perfection and mixed-characteristic finite-type normalization are distinguished; formal compatibility remains the declared extension. |
| completed-residue-fields-general-universal-homeomorphisms | Identity degree=1; separable unramified quadratic degree=2 and geometric points=2. For a transcendental complete extension, finite-degree decomposition does not compute the fibres. | General case stays conditional on the stated gap; no finite-only proof accepted for it. |
| finite-residue-and-integral-stalks | For t=s(s−1), the rank-two residual valuation has two primes s=0,1 in the integral closure; selecting either produces one local valuation ring. | Integral closure alone is semilocal; selected-prime localization is essential. |
| analytic-integral-stalks-mod-p | At Spa ℚ_p, n=1 gives p elements and n=2 gives p² on both sides. n=0 is outside the contract. | The non-finite-type extension is not inferred from these finite cases. |
| pseudorigid-jacobson-flatness | O[[t]]⟨π/t⟩[1/t] has t invertible and nonzero characteristic-p quotient k((t)); this is not an affinoid over the fraction field E. | K-affinoid-only Jacobson results do not already fill the gap. |
| noetherian-definition-rational-flatness | Whole-domain localization A→A is flat; empty-domain localization A→0 is flat. Non-Tate O[[t]] and its Tate punctured chart have different ambient hypotheses. | Existing complete strongly noetherian Tate theorem is retained, not requested again. |
| finite-ideal-formal-schemes | In O_C choose a²=p. Radicals of (a) and (p) are both m_C, and both reductions are k_C. For A=0 both reduced quotients are 0. | Independence of defining ideal, nonnoetherian scope and empty scope are tested. |
| Cover convention | D(t)∪D(t−1) covers the perfected affine line since 1=t−(t−1); every closed-point family misses (0). Empty family covers only empty target. | All four cover values agree with valuation lifting. |
| Non-qc perfect schemes | An affine-to-⨿ℕ Spec 𝔽_p map has finite-image labels by quasicompactness; a compatible pair of pullbacks has equal labels on each fibre and descends. | The extension beyond the qcqs supplier is explicitly owned in D7.6. |
| Nonabelian torsor control, D11.8 | For J=C₂ and S₃, the trivial torsor over a rank-one field point has 2 and 6 rank-one points; both quotients have 1 rank-one point. Over a rank-two field pair, totals have 4 and 12 points, with patch-open non-rank-one singletons. | cJ holds in the first two cases and fails in the second two; no commutativity is used. |
| Disc example over nonclosed C | Let C be the completed perfection of 𝔽₂((u)), and α²+α+1=0 in an unramified extension. For every a∈O_C with nonzero residue, abs(α−a)=1, whereas abs(α²+α+1)=0. | α is in no C-centred torus disc but is excluded from the origin disc's v-closure by the open residue disc abs(T²+T+1)<1. Interpret the README's “all residue discs” geometrically; the source's C-valued-centre formulation is too narrow. |

### Ownership and resolved citation leads

| Object/citation | Current text read | Resolution |
|---|---|---|
| Base roadmap and v-site | TauCetiRoadmap/DiamondsAndVStacks/README.md, D0–D6; especially D3.8:5437, D6.5:9297, D6.6:9381, D6.9:9757 | Parent owns the general perfectoid v-site, immersion classes, pre-adic diamondification and seminormal rigid full faithfulness. The package imports these and owns the subsequent integral recovery theory. |
| Scheme v-covers and topology | TauCetiRoadmap/PrismaticCohomology/README.md:2652; TauCetiRoadmap/SchemeKTheoryOperations/README.md:1335 | Arc.VCover, Arc.Cover.ofVCover and PerfectScheme.vTopology are real supplier targets, not missing library declarations. The resolver's three name warnings are not defects. |
| Arc comparison | packages/ArcTopologyAndDescent/README.md at accepted commit 9af1fe1, §§1.5–1.7, 3.10, 7.8 | The current accepted package contains the named subcanonicity, cancellation, valuation-product and perfect-scheme Hom-descent contracts. Its omission from the resolver index is not a missing supplier. |
| Scheme algebra and étale invariance | TauCetiRoadmap/SchemeAndStackFoundations/README.md:1394, 1508, 1565, 1640, 5487 | Regular completion, all-object étale invariance, perfection, characteristic-p weak normality and proper morphism algebraization have the advertised scopes. The broader mixed-characteristic and formal statements are explicit gaps. |
| Formal schemes | TauCetiRoadmap/AdicSpacesPartIII/README.md:1409 and 7966 | General finite-ideal adic-system effectivity exists; formal étale site invariance is narrower. R04 separates these contracts. |
| Adic algebra/topology | TauCetiRoadmap/AdicSpacesPartII/README.md:4071, 7466, 7577, 8542, 10632 | Ordinary affinoid, spectral and relative-analytification interfaces exist. Classical patch density is in R1.9, not R0.9: R09. |
| Perfectoid input | TauCetiRoadmap/PerfectoidSpaces/README.md:4912, 6528, 9976 | Marked untilts, completed residue pairs retaining higher-rank plus rings, and tilting of étale sites exist as supplier targets. |
| Properness and diamond points | TauCetiRoadmap/DiamondEtaleCohomology/README.md, C4.5:1262, C4.7:1296, C4.16:1408, C8.24:2499 (the tool's leading display header is excluded from these locators) | Partially proper maps retain separatedness; proper images and the profinite one-point presentation have the required hypotheses. |
| Two scheme conventions | TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:788 and 882 | Analytic sections use R, formal sections use R⁺; mixed-characteristic supplier is locally finite type. D10.1 owns the arbitrary-scheme extension, not a second copy of L1. |
| Bounded formal functions | TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4071, §R07.2.27 | deJongBoundedFormalFunctions includes O-flat formal normality, FS_O and restriction compatibility. D10.4's complete-local connectedness is a different target. |
| Local-model objects | TauCetiRoadmap/GeometricSatakeAndFusion/README.md:802, 842, 946 | Integral bounded Grassmannians, closed change-of-group maps and v-local models are already owned there. D10.15 uses them for recovery and uniqueness, retaining the GL identification as a hypothesis. |
| Shtuka consumer | TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:1544, HS2.16 | Its specialization criterion explicitly assumes a component comparison. It is a consumer, not an input to D11.14. |

Object searches covered main, Completed, board packages and the supplied sibling folders, including the source conventions in AdmissiblePairsAndPadicHodgeStructures, SolidAnalyticRings and ClassicalAdicEtaleCohomologyPartII. No second owner for olivine spectra, reduction of small v-sheaves, prekimberlites, Heuer specialization or the general rich-kimberlite theorems was found in those eligible texts. The package declares no Lean names that could collide with sibling declarations. No generic site, formal-scheme carrier or Grassmannian construction is assigned anew here. The additional indexed CommRingFactorizationSystems absolute-weak-normality hit was not used to invent an upward supply edge; the declared formal gap remains on SchemeAndStackFoundations.

## Not verifiable

- **D11.14, unrestricted proof:** GLE Lemma 4.55 uses a closed specialization at line 1885. Local noetherianity alone does not supply it; the deleted maximal point of an infinite valuation chain is the explicit topological negative control. The package already identifies and owns this proof obligation, and that space has not been exhibited as a topologically normal rich smelted kimberlite. Consequently this pass certifies the intermediate argument, not an unrestricted proof or a counterexample to the unrestricted statement.
- **Declared general supplier extensions:** the arbitrary non-finite residue separation, unrestricted integral-stalk comparison and nonnoetherian formal/absolute-weak-normality interfaces are contracts for future work. Finite examples above do not certify these general theorems. Their absence at today's supplier is not raised again.
- **GeometricSatakeAndFusionPartII consumer section numbers:** its current package head was not among the supplied sibling folders and was not available in the local checkout. The available design text is insufficient to certify the numbered sections in README:1814. No supplier edge or mathematical finding is based on that consumer list. Ownership against unprovided open-head files was not checked; index-only matches were not treated as current-source proofs.
- **Lean elaboration:** no named declaration exists, so no mechanical signature check can be run. R07 identifies a statement that can be expressed on existing carriers by inspection; this pass did not elaborate a replacement file, as the brief prohibits Lean builds and package edits.
- No cited package source was unavailable legally. The eight cached works and the two supplementary proof texts were readable; no new missing-reference request is necessary.

## Source issues

- **Error** in SW20 at Lemma 18.3.2, printed p. 166 (SW20 line 6461): the source says any quasicompact source has an image with a minimal point; it should be restricted to a nonempty source; affects a stated result.
- **Error** in SW20 at Remark 21.4.2, printed p. 195 (SW20 line 7494): the source says flatness and reduced special fibre imply normality; it should be qualified by normal generic fibre and the local noetherian hypotheses; affects a stated result.
- **Misprint** in GLE at Definition 1.8, printed p. 8 (GLE line 379): the source says the testing pullback has base F; it should be X ×_G F for X → G and F → G; affects a stated result.
- **Error** in GLE at Definition 1.10(1), printed p. 8 (GLE line 389): the source says the compact-open basis conditions define spectral spaces; it should be supplemented by sobriety, including T₀, for the following Hochster equivalence; affects a stated result.
- **Misprint** in GLE at Remark 2.3 and Proposition 2.36, printed pp. 11, 22 (GLE lines 554, 1098): the source says the algebraic quotient is B/B°°; it should be B/(B·B°°), since B°° need not be a B-ideal; affects a stated result.
- **Error** in GLE at Proposition 2.36, printed p. 22 (GLE line 1088): the source says every closed schematic locus is defined by an open prime ideal; it should be an open ideal, not necessarily prime; affects a stated result.
- **Misprint** in GLE at Proposition 3.9 proof, printed p. 23 (GLE lines 1158–1165): the source says the scheme covers are filtered colimits; it should be cofiltered inverse limits, as its displayed formula shows; affects the proof.
- **Misprint** in GLE at Proposition 1.19 and Proposition 3.18 proofs, printed pp. 9, 25 (GLE lines 451, 1271): the source says the nonanalytic pair has plus ring A⁺/(A°°·A⁺), or the ideal A°°·A⁺; it should be the integral closure of the image of A⁺ in A/(A·A°°); affects the proof.
- **Error** in GLE at Proposition 4.8, printed p. 29 (GLE line 1437): the source says quasiseparated diamonds are not v-formalizing; it should be nonempty quasiseparated diamonds, since the empty formal presentation covers the empty sheaf; affects a stated result.
- **Error** in GLE at Lemma 4.25 proof, printed p. 33 (GLE line 1638): the source says an étale reduction has a unique ordinary étale lift over R⁺; it should be a unique completed formally étale lift with specified reduction; affects the proof.
- **Misprint** in GLE at Proposition 4.41 proof, printed p. 36 (GLE lines 1760–1761): the source says the reduced closed subscheme lies in F and writes maps with source F; it should be a closed subscheme of F^red and use source G for its specialization comparison; affects the proof.
- **Misprint** in GLE at Proposition 4.46(3), printed pp. 36–37 (GLE lines 1798–1811): the source says cJ descends from the torsor total space; it should be the ascent statement used to prove the étale case, via patch-openness; affects the proof.
- **Gap** in GLE at Lemma 4.55 proof, printed p. 38 (GLE line 1885): the source says a nonempty intersection of specializing images contains a closed point; it should be justified by additional geometry or a closed-specialization hypothesis; affects the proof.
- **Error** in AGLR at Example 2.5, printed p. 9 (AGLR lines 526–533): the source says removing discs with C-valued torus centres describes v-closure over any perfectoid C; it should be all geometric residue discs, or assume C algebraically closed; affects a stated result.
- **Misprint** in AGLR at §2.1–§2.3, printed pp. 9–18 (AGLR lines 541, 848, 989): the source says Theorem when referring to several numbered lemmas, definitions and propositions; it should be the actual labels, including Lemma 2.4, Proposition 2.22 and Definition 2.36; affects nothing.
- **Error** in AGLR at the discussion following Lemma 2.11, printed p. 11 (AGLR line 650): the source says rigid affine one-space has nonalgebraic automorphisms; it should be nonalgebraic endomorphisms; invertible entire one-variable analytic maps are affine; affects a stated result.
- **Error** in AGLR at Proposition 2.39, printed pp. 18–19 (AGLR line 1044): the source says connected closed-point tubes force normality over a perfect residue field; it should be geometric connectedness, or an algebraically closed residue field; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "edad780e0fbe0bd2c618b0f123f174518c65c094", "job": "RT-DiamondsAndVStacksPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
