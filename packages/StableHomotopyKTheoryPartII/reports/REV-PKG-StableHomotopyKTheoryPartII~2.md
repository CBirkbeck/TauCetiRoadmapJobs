<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1597#issuecomment-6400890493 -->
Review (codex) of e5cae53

Verdict: accepted
Conditional on the announced gaps: `finite-field-witt-etale-frobenius`

1. **F01** (P3) IV.1.14 is a Remark

   **Location:** `packages/StableHomotopyKTheoryPartII/README.md:867`, repeated at line 875: “Remark IV.1.13 and Example IV.1.14”.

   **Claim:** The cited discussion of the KU Frobenius and Adams operation is labelled Example IV.1.14.

   **Witness:** ns18 line 5067 labels IV.1.14 as a Remark, on printed p.331. Proposition IV.1.12 and the surrounding remarks support the mathematical statement.

   **Exact repair:** Replace “Example IV.1.14” by “Remark IV.1.14” at both occurrences, leaving the theorem number, page range and mathematical assertion intact. Tested against the source heading and against the Bott computation: on S², (1+β)^p=1+pβ because β²=0. The corrected locator still reaches the required localized Adams discussion.

One P3 locator finding; no P1 or P2 findings. Acceptance is conditional on the declared supplier contract `finite-field-witt-etale-frobenius`. The four previous findings are repaired. The package inputs were not edited.

## Verified sound

Read the four package inputs, the previous review and repair report, the declared gap in the design, all 37 numbered targets in eight layers, all 122 target Check bullets, all ten construction API lists, conventions, supplier contracts, proof routes and layer dependencies. There are 139 Check bullets including supplier Checks. All definitions have an API and at least three Checks. The README has the requested upstream shape; GeneralizedCohomology, BordismFormalGroups and EnhancedDerivedSheaves on main were used as comparisons.

The Part II starts after the existing stable foundations. It retains all primes, arbitrary small vector-space dimension, individually bounded-below tower stages without a uniform lower bound, arbitrary spaces where claimed, and integer virtual ranks. No route-specific restriction, computational algorithm, copied source passage, sorry'd data, `set_option`, foreign roadmap import or empty predicate substitute was found. The sphere counterexample now has one owner. No new ownership or dependency defect was found.

### Previous findings, checked first

The previous repair report marks all four findings repaired; none was dismissed as not actionable. Each repaired mathematical passage and its uses elsewhere were reread. The following quotations are from the package, not from sources.

| Previous finding | Repaired passage and location | Independent test and status |
|---|---|---|
| F01: odd-primary signs and normalization | README §1.1, line 133: “t=u⁻¹ and e=b·u⁻¹”; §6.2, line 763: “(−1)^iP^i and (−1)^(n+i)βP^i”; §6.3, line 785: “θ_i=(−1)^iβ_LP^i”. | **Repaired.** βe=1 fixes the odd normalization. At p=3 the Euler quotient is v−v³t²; on two odd classes the product is xz+(yz−xw)e. The left-suspension convention makes the degree-dependent odd coefficient stable. Checked conventions, §§1.1,6.1–6.3, layer examples, worked examples and Lean docstring for the old pattern. |
| F02: duplicated sphere counterexample | README line 14: “its §2.3 owns the Tate fixpoint lemma together with its sphere counterexample”; line 101 consumes that result. Suggested.lean line 42 names only “The periodic-KU orbit and unbounded tensor-diagonal counterexamples”. | **Repaired.** RefinedTraceMethods §2.3 still owns the same result. Layer 7 applies it, with π₀=ℤ₂ and ℤ₃ at p=2,3. The local owned target is gone; subsequent numbering and the §3.4 negative-control reference agree. |
| F03: missing rank factor p | README line 643: “gives π_pR on each side”; lines 644–645 give the two suspended-Hℤ tests. | **Repaired.** At p=2, R=ΣHℤ gives π₂R=0; R=Σ²Hℤ gives π₂R=ℤ. The separate rank −1 bundle in §5.1 still correctly gives π₁R. |
| F04: Theorem 5.9 page range | README lines 289 and 295: “Theorem 5.9 and proof, pp.902–903”. | **Repaired.** lnr12 line 1964 starts the theorem on printed p.902; line 1973 begins the next page and its proof. Both occurrences now cover statement and proof. |

The unchanged statements were read for consistency with these repairs. For unchanged supporting targets §§2.3,2.5,3.1–3.2,4.2–4.3,4.5–4.7,5.3–5.4 and 7.1, the earlier review's computed rows remain applicable. These are numerical/algebraic rows, not unsupported “sound” summaries: examples include Singer lower bounds (1,0,−1)/(1,−1,−3), finite-system image sizes 0,1,2, the nonsplit ℤ/4 extension, transfer indices, and the virtual class −1 with cyclic character −1. No earlier uncomputed summary was used to certify a sampled target or a changed passage.

### Adversarial computations

Hᶜ means the specified continuous cohomology. A lower degree is the lowest potentially nonzero homotopy degree. Excluded inputs are negative controls. Each row records values, rather than treating elaboration as a truth test. The table covers the seeded sample, the headline groups, the repairs and R01; related clauses and their exact hypotheses were also checked against the sources and supplier interfaces below.

| Statement | Instances tried | Values on both sides or competing models | Result/change |
|---|---|---|---|
| Conventions and extended powers | k=0,1; G=S₃; suspensions 1,2 | D₀(0)=S, whereas D_k(0)=0 for k>0; D₁(S)=S. π₀D_(S₃)(S)=ℤ=π₀Σ∞₊BS₃. Swaps have degrees −1 and +1. | Correct; empty tensor and nonabelian controls retained. |
| §1.1 cyclic normalization | p=3, a=−1; b replaced by 2b | Weights of (t,t²,e) are (−1,1,1). βe=1, while e replaced by −e gives −1. Rescaling b changes t to 2t but leaves e and t² unchanged. | Repaired F01 fixes the ambiguity; no denominator is zero. |
| §2.1 continuous cohomology | Constant H𝔽₂; zero; Singer sphere tower | Hᶜ=A₂=H*(H𝔽₂); zero gives 0=0. Singer sphere has Hᶜ in degree −1 equal to 𝔽₂, whereas H⁻¹(S₂^∧;𝔽₂)=0. | Correct; the construction depends on the tower, not just its limit. |
| §2.2 inverse-limit Adams | Constant H𝔽_p; zero; Singer stages n=0,1,2 | Ext is 𝔽_p in (0,0), zero elsewhere, matching π_*H𝔽_p; zero gives 0=0. Singer lower degrees at p=2 are 1,0,−1. Differential (r,r−1) changes stem by −1. | Correct; individual bounds suffice, no uniform bound inserted. |
| §2.4 Singer Tor-equivalence | M=0,𝔽_p; N=𝔽_p,Σ⁻¹𝔽_p | Zero gives zero Tor on both sides. Degree-zero Hom dimensions for M=N=𝔽_p are 1=1, with augmentation value 1. Suspending N shifts the scalar class by −1 on both sides. | Correct distinction between unrestricted Tor statement and restricted Ext comparison. |
| §2.6 continuous Singer comparison | B=0,S; p=2,3 | Zero gives 0=0. Σx⁻¹ and Σxy⁻¹ have degree 0 and augment to 1; without the suspension the degree would be −1. | Correct; F04 repaired locator confirmed. |
| §2.7 finite-type Segal | B=S,H𝔽_p,Hℚ; p=2,3 | Target π₀ is respectively ℤ_p,𝔽_p,0, equal to completed-source π₀. Uncompleted Hℚ instead has π₀=ℚ. | Correct completion statement, not an uncompleted equivalence. |
| §3.3 arbitrary-dimensional case | Vector-space dimensions 0,1,2,κ, including uncountable κ | Source/target π₀ dimensions are 0=0,1=1,2=2,κ=κ. For two summands, p=2 gives one free mixed orbit, p=3 gives two; each contributes zero Tate. A constant-one function on infinite J is in the product but not the direct sum. | Correct; no finite-type or hidden product substitution. |
| §3.4 bounded-below Segal | Σ⁻¹H𝔽_p; unbounded KU at 2 | The suspended example has π₋₁=𝔽_p on both sides. KU₂^∧/2 has π₋₂=𝔽₂, while T₂(KU)/2 has π₋₂=0. | Correct generality and genuine boundedness obstruction. |
| §4.1 Weyl refinement | p=2,3; sphere unit; S[ℕ] | W has orders 1,2 and 2⁻¹=2 in 𝔽₃. Unit maps 1→1. At p=2 a monoid generator maps z→z², whereas the identity gives z. | Correct normalization and invertible averaging factor. |
| §4.4 degree-zero power | Hℤ,p=2; H𝔽₃; zero ring | P₂(2)=4, while P₂(1)+P₂(1)=2; transfer defect 2. Over 𝔽₃, 2³=2. The zero ring has the sole value 0=1. | Correct operation of sets, multiplicative and unital, not additive. |
| §4.5 transfer ideal | Hℤ,p=5 | Mixed-summand indices 5,10,10,5 generate (5). Defect 2⁵−2=30 is zero mod 5 but nonzero mod 120. | Package is correct; source Remark IV.1.11 needs the larger transfer ideal. |
| §4.8 spherical Witt lift | d=1; k=𝔽₄=𝔽₂[a]/(a²+a+1) | Ranks are 1 and 2. Frobenius is identity for d=1; in 𝔽₄, a→a+1→a, and the Teichmüller lift maps [a]→[a]². | Correct marked lift; conditional integral supplier contract is essential. |
| §5.1 virtual representation twists | V=0,−1 at a point; Möbius line; ρ₂ and 2ρ₂ | V=0 gives R⁰; rank −1 gives π₁R. Integral Möbius cochains have differential 2 and H¹=ℤ/2, versus differential 0 and H¹=ℤ for the trivial line. Swaps on ρ₂ and 2ρ₂ have determinant −1 and +1. | Correct; rank alone cannot replace the bundle. |
| §5.2 Thom adjunction | n=−1,p=2,R=ΣHℤ or Σ²Hℤ; n=0 | Restriction gives π₂R=0 or ℤ on both sides. Wrong π₁R would give ℤ or 0. At n=0 both sides are ordinary Borel cohomology. | Repaired F03 passes both separating controls. |
| §5.5 extended-power/Thom comparison | X=*, V=0,1,−1; p=2 | V=0 gives D_pS=Σ∞₊BΣ_p. For V=1 the negative permutation bundle has rank −2 and determinant −1; a trivial rank −2 bundle has determinant +1. For V=−1 its rank is +p. | Correct virtual signs and coherent permutation action. |
| §5.6 all-degree comparison | n=0,Hℤ,p=2,class 2; n=1,H𝔽₂; n=−1 | Degree zero sends 2 to 4 mod 2=0 by both routes. Degree one gives u+u²s, each term of total degree 1. At n=−1 the +ρ twist cancels the −ρ suspension, net rank 0. | Correct integer range; no replacement of ρ by a dimension-only action. |
| §6.1 coefficient splitting | p=3; integral/mod-2 comparison | First suspension degrees are 0,1,4,5, not 0,1,2,3. In each degree at most one displayed factor contributes. Hℤ Tate π₁=0, while H𝔽₂ Tate π₁=𝔽₂. | Correct factor 2 and integral odd-component exclusion. |
| §6.2 even signs | p=3,v in degree 2; p=5,m=2 | v(v+u)(v+2u)=v³−vu²; dividing by −u² gives v−v³t². At p=5, (2!)²=4=−1 supplies the same negative first reduced-power coefficient. | Repaired F01 agrees with the Euler expansion, including a second odd prime. |
| §6.2 odd multiplicativity | p=3, x,z in degree 1; y=βx,w=βz | (x−ye)(z−we)=xz+(yz−xw)e=F(xz). Unsigned factors give coefficient −1 on yze, whereas the unsigned F(xz) gives +1. | Repaired F01 passes; Koszul interchange is necessary. |
| §6.3 stable components | p=3, x,xz,v; left suspension ι×x; mod-2 unit | θ₀x=−y; θ₀(xz)=yz−xw; even component on v is −v³. On suspension the odd sign is (−1)^(n+1+i)(−1)=(−1)^(n+i), agreeing with ι×θ_i(x). Unit component is 1, higher unit components 0. | Stable left-suspension convention and coordinate formula agree. |
| §7.2 KU Tate coefficients | p=2,C₂,C₄; p=3,C₃; x=0 | Even ℚ₂-dimensions are 1 and 3; odd dimensions 0. ℚ₃(ζ₃) has degree 2 and W-invariants degree 1. Correct p-series at 0 is 0; the erroneous odd-prime series gives −2. | Correct fields, normalizer action and coordinate. |
| §7.3 KU Frobenius/Adams | S²; β and β⁻¹; p=2 | (1+β)^p=1+pβ. Images pβ and β⁻¹/p multiply to 1; omitting division gives p. At p=2 Frobenius gives 2β, constant map β. | Mathematics correct; R01 only changes the locator label. |
| §7.4 orbit counterexample | p=2,3; rational zero control | Source/target even dimensions are 3→1 at 2 and 8→2 at 3; odd dimensions 0. Hℚ Tate gives 0→0. | Correct non-equivalence with coherent residual action. |
| §7.5 tensor counterexample | KU at 2; imported sphere control | KU₂^∧/2 has 𝔽₂ in degrees −2,0,2, while rational tensor-Tate has zero mod 2. Imported sphere π₀ is ℤ₂ or ℤ₃, with mod-p quotient 𝔽_p. | Correct; sphere result is consumed, not rebuilt. |
| §8.1 free-loop totalization | Y=S²; arbitrary wedge of S²; S¹ negative control; point | Fiber lower degrees for the two terms are n,n+2: at n=1,2 these are (1,3),(2,4). The wedge has the same bounds regardless of cardinality. For S¹ both bounds are 0; for a point the comparison is S=S. | Correct simply connected generality; finite type is unnecessary. |
| §8.2 controlled Tate/limit interchange | Zero fibers; increasingly connective fibers; trivial group and finite S₃ | Zero fibers give 0=0. An n-connective fiber has orbit π_i=0 for i<n, so fixed i eventually gives 0 on both fiber-limit sides. For the trivial group norm=id and both Tate objects are 0. | Correct use of orbits for connectivity; no false boundedness assertion for homotopy fixed points. |
| §8.3 free-loop Segal | Y=*; n=0,1,2; S² and arbitrary wedge of S² | At a point φ has target π₀=ℤ_p. Genuine C_p sphere fixed points have π₀=ℤ², versus ℤ⊕ℤ_p for homotopy fixed points; both p-complete to ℤ_p². n=0 is identity; n=1,2 use one/two cyclic comparison steps. S² and its wedge retain the bounds in §8.1. | Correct p-adic comparison, not an integral fixed-point equivalence. |

For the general odd-class product, writing the even part as A(x), the odd part is (−1)^nβA(x)e. The Leibniz sign and moving e past a class of degree m give exactly (−1)^(n+m)β(A(x)A(z))e. Thus the repaired two-class witness reflects the general multiplicativity law. All degree shifts and normalization changes were followed into the supplied Steenrod, Thom and Bott conventions.

### Source sample and locators

All 15 seeded targets were checked against text at their locators. There are no author-flagged unverified entries. All 11 cited works have certified, distinct manifest entries; no new fetch or manifest mutation was needed. The crucial scanned BMMS formula was also inspected visually. Published page numbers and scan/preprint page numbers were distinguished.

| Target | Text read | Hypotheses and support checked |
|---|---|---|
| 2.1 | lnr12 line 400, Definition 2.3, printed p.870, within the cited pp.869–870 | Filtered colimit of stage cohomology and its contravariant direction. General tower definition is distinguished from subsequent convergence hypotheses. |
| 2.2 | lnr12 line 267 through line 391, Proposition 2.2, pp.867–869 | Countable stages individually bounded below and degreewise mod-p finite; compact inverse-limit and complete-convergence argument, without a common lower bound. |
| 2.7 | lnr12 line 2109, Theorem 5.13 and proof, pp.905–906; ns18 line 3271, Theorem III.1.7 | Finite-type bounded-below spectrum, p-adic equivalence, and the separately imported p-completeness criterion. The package does not identify the uncompleted source with the target. |
| 3.3 | ns18 line 3305 through line 3348, proof of Theorem III.1.7, pp.288–290 | Arbitrary-dimensional H𝔽_p modules; finite pro-constant truncated towers provide a dimension-independent stabilization. The proof does not replace direct sums by products. |
| 4.4 | ns18 line 4920 through line 4971, Lemma IV.1.7 and Corollaries IV.1.8–10, pp.327–328 | E∞ ring, arbitrary space, degree-zero operation of sets; multiplicativity is distinct from additivity. |
| 4.8 | ns18 line 4833 through line 4865, Definition IV.1.1 and Example IV.1.2(ii), pp.324–325 | Finite-field spherical étale lift and Frobenius. Integral finite étale classification is the declared supplier gap; the package avoids the source's incorrect compactness argument. |
| 5.1 | ns18 line 5251 through line 5316, Lemma IV.1.19 and proof, pp.336–338; line 5370, p.339 | Parametrized spheres, tensor inverses and virtual Thom objects; no orientation or globally chosen finite complement required. |
| 5.2 | ns18 line 5256, Lemma IV.1.19 and adjunction proof, pp.336–338 | Negative Thom object and homotopy fixed points of S^(nρ)⊗R; n is an integer and ρ has rank p. |
| 5.5 | ns18 line 5338 through line 5382, Lemma IV.1.20 and proof, pp.338–339 | Extended power as a Thom colimit, diagonal pullback and the virtual-bundle extension. |
| 5.6 | ns18 line 5383 through line 5402, Theorem IV.1.21, pp.339–340, with the two preceding lemmas | All integer degrees, actual representation twists, Tate suspension and multiplicative comparison. The pre-Tate operation is not made additive. |
| 6.3 | ns18 line 5132, Theorem IV.1.15, pp.332–333; line 5412, proof on p.340; bmms86 line 4481 and line 4501, VIII.2, printed pp.259–260 | Full spectral operations and integral reduction; factor-2 degree errors corrected. BMMS Euler expansion, rather than the unsigned NS display, supports the repaired coefficients. |
| 7.2 | ns18 line 648, Example I.2.3(iii), p.220; line 4990, equation (11), p.329 | Cyclic p and p² coefficients, Euler inversion, cyclotomic fields and Weyl invariants; the coordinate-series misprint is corrected. |
| 7.3 | ns18 line 5002 through line 5075, Proposition IV.1.12 and Remarks IV.1.13–14, pp.329–331 | Compact object means finite CW retract; Bott image pβ; stable target inverts p. R01 records the heading-label error. |
| 8.2 | ns18 line 5978 through line 6007, proof of Theorem IV.3.7, pp.354–355 | Controlled connective fibers, orbit-limit interchange and the norm cofiber. Connectivity is applied to orbits, while fixed points commute with limits independently. |
| 8.3 | ns18 line 5978, Theorem IV.3.7, pp.354–355; line 2357, Corollary II.4.9, p.265; line 5699, Proposition IV.3.2, p.347; line 5848, Corollary IV.3.3, p.351 | Simply connected space, spherical group ring/free-loop model, p-completion and genuine cyclic p-adic comparisons. No finite-type hypothesis added. |

The arbitrary-space totalization input was separately checked in malkiewich17 line 609 through line 626, Proposition 2.22, preprint pp.14–15. Its two fiber terms have the growing bounds computed above. kuhn04 line 596 through line 629, Theorems 6.2 and 6.6, preprint pp.15–16, gives the finite-complex comparison; that narrower result alone would not justify the stated scope. The ns19-correction text was read and does not repair the sign, grading, compactness or transfer-ideal issues listed below.

### Pinned declarations and ownership

The library revisions match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used the objects—spectra, Tate norms, EM spectra, Steenrod operations, Singer modules, extended powers, virtual Thom objects, KU, Witt Frobenius and finite inverse systems—not just candidate names.

| Pinned declaration opened | File and line | Actual content and limits |
|---|---|---|
| CategoryTheory.Functor.sections | `Mathlib/CategoryTheory/Types/Basic.lean:222` | Body is `{ u ∣ ∀ {j j'} (f : j ⟶ j'), F.map f (u j) = u j' }`; it includes neither finiteness nor nonemptiness. |
| nonempty_sections_of_finite_cofiltered_system | `Mathlib/CategoryTheory/CofilteredSystem.lean:79` | Requires cofilteredness and finite nonempty stages; it cannot be applied blindly to an empty eventual image. |
| eventualRange; isMittagLeffler_of_exists_finite_range | `Mathlib/CategoryTheory/CofilteredSystem.lean:125`, line 230 | Intersection of transition ranges and finite-range stabilization. For {a,b}←{a}, the eventual image is {a}. |
| toEventualRangesSectionsEquiv; surjective_toEventualRanges | `Mathlib/CategoryTheory/CofilteredSystem.lean:255`, line 262 | Compatible-section equivalence and the Mittag–Leffler surjectivity theorem; original transition maps need not be surjective. |
| eval_section_surjective_of_surjective; eventually_injective | `Mathlib/CategoryTheory/CofilteredSystem.lean:312`, line 323 | Finite nonempty stages and the explicitly retained transition-surjectivity binder; eventual injectivity also needs nonempty index category and finite sections. |
| frobenius | `Mathlib/Algebra/CharP/Lemmas.lean:321` | x↦x^p as a homomorphism on a commutative semiring of exponential characteristic p. |
| WittVector.frobenius | `Mathlib/RingTheory/WittVector/Frobenius.lean:218` | Genuine polynomial Witt map for prime p over a commutative ring. |
| coeff_frobenius_charP; frobenius_zmodp | `Mathlib/RingTheory/WittVector/Frobenius.lean:255`, line 275 | Coefficientwise pth power requires CharP; identity is the ZMod p specialization, not every finite field. |
| tateCohomologyFunctor | `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:140` | Algebraic functor `Rep R G ⥤ ModuleCat R`, not spectral Tate or a tensor Tate diagonal. |
| TopPair.HomologyPretheory | `Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36` | Ordinary homology functors and boundary maps, not a stable spectrum or Steenrod-operation algebra. |
| HasPairSequence; IsAdditive; HasDimensionAxiom | `TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:65`, lines 85 and 94 | Axioms on ordinary homology; no spectral KU, representation spheres or cyclotomic carrier. |

Relative singular cohomology in `TauCeti/AlgebraicTopology/Cohomology/Relative.lean` likewise does not supply the missing stable operation objects. The existing finite-system and Witt declarations are imported rather than restated. The finite-tower pro-isomorphism assembles the empty and nonsurjective cases beyond the individual native statements. There are no local Lean declarations and hence no fully qualified name collisions.

### Suppliers and direction of supply

All ten supplier roadmaps and their cited sections were resolved anew. The supplied main checkout is `8555e8c2f4969a2f8b006714d4e7ed862eed0ccb`; the four main supplier files below agree with the copies returned by the roadmap tools. New-roadmap dependencies were checked at their indexed open heads. Main versions, not open progress revisions, were used for existing roadmaps.

| Supplier | Resolved location | Ownership and contract checked |
|---|---|---|
| StableHomotopyKTheory, head 00bfbf7 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1835`, Layer 5; line 2333, §7.9; line 2401, §§7.14–7.19; line 2474, §§7.21–7.26 | Spectra, smash, connectivity, EM comparison, Milnor, completion/rationalization and complete convergence. This Part II begins beyond those constructions. |
| GeneralizedCohomology, main | `TauCetiRoadmap/GeneralizedCohomology/README.md:432`, G2.8; lines 785,878,1214,1536,1559 | G3.8–G3.9 limits/completion, G4.2 and G5.3 Thom objects, G5.4 ku/KU. Local Singer and twist comparisons do not redefine these carriers. |
| TangentialBordism, head bf9da30 | `TauCetiRoadmap/TangentialBordism/README.md:537`, B4; items at lines 564,628,652 | Complete Steenrod operations at all primes, graded coproduct and mod-p Adams machinery. The package's explicit left-suspension coefficient convention is compatible with the derivation sign. |
| BordismFormalGroups, main | `TauCetiRoadmap/BordismFormalGroups/README.md:555`, F6.1; lines 1002,1064, F6.3; line 1526, F6.5; line 2508, finite-height descent | Localization, finite Hopf pieces/freeness, norms/Tate/transfer, Kan and induced vanishing. Height-one raw Tate is E(0)-local; the counterexample does not infer rationality merely from K(1)-acyclicity. |
| KTheoryFiniteLocalFields, head afe02e8 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:604`, §4.0; line 666, §4.4; line 705, §4.5 | Genuine cyclic models, comparison, EM Tate and cyclic resolution. Integral differential alternates 0,p; mod-p differential is zero. Its boundary-map sign is distinguished from the Bockstein normalization. |
| AInfCohomology, head b47987b | `TauCetiRoadmap/AInfCohomology/README.md:3817`, line 3849, AI.7.2 | Circle/Tate orbit and unit-normalized exact lax monoidal Tate diagonal. No sphere Segal equivalence is used as an input to its own local proof. |
| RefinedTraceMethods, head 9dd2691 | `TauCetiRoadmap/RefinedTraceMethods/README.md:484`, §2.1; line 553, §2.3; lines 579,599,638,826,870,910,990,1034,1218 | §§2.4–2.6,2.8,2.10–2.13,2.16 supply parametrized spectra, cyclic realization, E∞ Frobenius, free-loop model and genuine/restriction interfaces. The sphere counterexample at line 575 is now imported. |
| RefinedTraceMethods, same head | `TauCetiRoadmap/RefinedTraceMethods/README.md:2372`, §5.1; line 2450, §5.3; line 2478, §6.1 | Localized stable Adams, orientation and spectral étale lifting; the cyclic KU coefficient-field computation remains additional work here. The missing integral finite-field input is explicitly a gap. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1117`, E3; line 1436, E5:abstract | Coherent Kan/adjoints and stable monoidal formalism; its absolute Kan foundations come from BordismFormalGroups F6.5. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:946`, Stage 6 | Ordinary cochains, cup products and relative comparison; no spectral Steenrod construction is attributed to ordinary cochains alone. |
| TopologicalKTheory, head 7575afa | `TauCetiRoadmap/TopologicalKTheory/README.md:702`, T2.5; line 816, T4; line 886, T5 | Bundle Adams operations, Bott and splitting on finite CW inputs; β=[H]−1 gives the same pβ normalization. |

Used `roadmaps list`, `roadmaps grep` by object and `roadmaps show`, including main and the available open heads. Read the board index before drawing absence conclusions. All 19 indexed board heads were searched: four package READMEs and fifteen design READMEs at those same heads where the package README was absent. No relevant competing construction was found there. The local single-branch board checkout was not treated as an exhaustive list of open work.

The broader open-work search found no earlier owner for the Singer comparisons, arbitrary-cardinality Segal extension or free-loop Segal conclusion. `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:145`, §0.1, concerns a later general spherical-lift construction. It is later in the merge order, and is not imported here; the finite étale specialization remains the earlier owned case. `TauCetiRoadmap/CrystallineCohomology/README.md:5865` supplies finite-length Witt étale base change, not the complete integral finite-field rank and endomorphism contract below. Ordinary Thom, Bott and Steenrod results stay with the listed suppliers; the local virtual power, coefficient-field and Frobenius comparisons add distinct results.

Every Needs line, supplier citation and layer dependency was read. The internal route is acyclic: Singer algebra and continuous cohomology precede finite-type Segal; pro-constancy and truncation precede the arbitrary-dimensional theorem; virtual powers precede component extraction; connectivity precedes Tate/totalization interchange. References to later results inside negative-control Checks are not proof inputs.

The prescribed mechanical dependency check, with `--movable`, exited 0. Its complete output was:

    depcheck: 56 roadmaps, 635 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` returned no unresolved roadmap citation or backticked Lean name. Its external-library caveat was handled by opening the pinned declarations listed above.

**Declared gap.** `finite-field-witt-etale-frobenius` agrees between `packages/StableHomotopyKTheoryPartII/design/plan.json` and README line 105: supplier RefinedTraceMethods §6.1, every prime p, finite field degree d≥1, W(k) finite étale and free of rank d over ℤ_p, with reduction identifying endomorphisms and preserving Frobenius. These are one coherent lifting contract with exact hypotheses. Native Witt Frobenius and the inspected finite-length base-change theorem do not already provide it. The contract is precise, minimal and owned; absence from the supplier today is not a finding. Acceptance is conditional on its fulfillment.

### Headline signatures, elaboration and padding

All 14 headline groups from the README are named in the module docstring. Each requires an absent native spectral carrier; no headline that can be stated faithfully using a few simple definitions on pinned carriers was omitted.

| README headline | Suggested.lean docstring line | Missing carrier |
|---|---|---|
| §2.4 Singer augmentation Tor-equivalence | 10 | Stable Steenrod algebra, graded modules, twisted Singer functor |
| §2.2 inverse-limit Adams | 13 | Spectra, Adams tower, continuous spectral cohomology |
| §2.6 continuous Singer comparison | 16 | Cyclic spectral extended powers and Singer module |
| §2.7 finite-type Segal | 19 | Coherent tensor action, spectral Tate and completion |
| §3.4 bounded-below Segal without finite type | 22 | Same carriers and connectivity/completion predicates |
| §4.1 unique Weyl refinement | 25 | Lax monoidal spectral diagonal and coherent actions |
| §5.6 all-integer-degree power comparison | 27 | E∞ spectra and represented virtual-twisted cohomology |
| §4.8 spherical Witt Frobenius | 30 | Connective sphere algebra and spectral étale lifting |
| §6.3 total Steenrod Frobenius | 34 | EM spectra, spectral Tate and stable operations |
| §7.3 KU Frobenius/Adams | 39 | KU spectrum and localized stable Adams map |
| §§7.4–7.5 KU boundedness counterexamples | 42 | Spectral Tate, coherent residual action, KU/localization |
| §8.1 free-loop totalization | 45 | Suspension spectra and derived spectral totalization |
| §8.2 controlled Tate/limit interchange | 48 | Coherent-action spectra, norm and connectivity |
| §8.3 free-loop Segal/genuine comparisons | 51 | THH, genuine cyclic spectra and spectral completion |

Ran `lake env lean` on the actual package Suggested.lean from the prescribed content checkout: exit 0, no output and no warnings. The file has 62 lines, one `import Mathlib`, one explanatory module docstring and the correct namespace. No TauCeti object needed building.

There are zero named declarations, zero lost section binders to check with `#check @name`, and zero sorried theorems eligible for the one-tactic probe. Those checks are empty, not omitted or represented as successful proof attempts. There is no padding. Finite-set and ordinary Witt supporting results stay in the README; they would not be faithful replacements for the spectral headlines. The absence of signatures is justified by the carrier audit, not by proof difficulty.

## Not verifiable

- No requested source was inaccessible; all seeded locators and changed source-dependent assertions were read. No missing-reference request is needed.
- The declared finite-field Witt étale/endomorphism contract is future supplier work. Its fulfillment is not asserted; this is the explicit condition of acceptance.
- The native spectral headlines cannot yet be elaborated at the pins, for the specific missing carriers listed above. Successful elaboration of the empty signature file is not evidence of proofs of the README theorems.

## Source issues

- **Misprint** in ns18 at IV.1, decompositions before Theorem IV.1.15, printed p.332 (ns18 line 5120 and line 5126): the source says odd-prime invariant summands have suspension period p−1; it should be 2(p−1), since the Laurent generator has degree −2; affects a stated result.
- **Misprint** in ns18 at Theorem IV.1.15, printed pp.332–333 (ns18 line 5136 and line 5140): the source says reduced-power and Bockstein target shifts are i(p−1) and i(p−1)+1; it should be 2i(p−1) and 2i(p−1)+1; affects a stated result.
- **Error** in ns18 at Proposition IV.1.16 and its proof, printed pp.333,340 (ns18 line 5167 and line 5431): the source says monomial coefficients give an unsigned total reduced-power and Bockstein formula; it should be Euler-normalized with (−1)^i and the degree-dependent right-coefficient Bockstein sign; affects a stated result.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325 (ns18 line 4852): the source says the p-complete sphere exemplifies categorical compactness in p-complete spectra; it should be treated as finite dualizable there, since its p-inversion diagram disproves categorical compactness; affects the proof.
- **Misprint** in ns18 at Example I.2.3(iii), printed p.220 (ns18 line 649 and line 660): the source says the multiplicative p^r-series uses (x−1)^(p^r)−1; it should be (1+x)^(p^r)−1 for x=L−1, with value zero at zero; affects a stated result.
- **Error** in ns18 at the paragraph after Theorem IV.1.21, printed p.340 (ns18 line 5405): the source says the pre-Tate power is a graded-ring map; it should be multiplicative with an additive transfer defect, removed by the appropriate quotient or Tate comparison; affects a stated result.
- **Error** in ns18 at Remark IV.1.11, printed p.328 (ns18 line 4975): the source says transfer from the trivial subgroup suffices to make P_p additive modulo its image; it should be the ideal generated by mixed Young-subgroup transfers; for Hℤ at p=5 these generate (5), not (120); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e5cae53d723ef8212222feb7e9e31657e515e7ee", "job": "REV-PKG-StableHomotopyKTheoryPartII~2", "model": "gpt-6-astra", "worker": "chris-31"} -->
