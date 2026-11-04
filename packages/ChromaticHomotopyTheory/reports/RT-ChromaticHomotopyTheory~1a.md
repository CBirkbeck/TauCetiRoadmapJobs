<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/986#issuecomment-6397866246 -->
Red team round 1 pass a (codex) of f29de2d

Verdict: needs_changes

1. **F01** (P1) The cited supplier does not construct associative telescope localization

   **Location:** packages/ChromaticHomotopyTheory/README.md:313,325; “Choose the resulting E₁ telescope model” and “GeneralizedCohomology G2 (associative telescope localization …)”.

   **Claim:** G2 supplies localization of the associative endomorphism ring at the homotopy-central periodic class.

   **Witness:** TauCetiRoadmap/GeneralizedCohomology/README.md:460 constructs localization of commutative spectral rings at even classes. End(V) need not be commutative. TauCetiRoadmap/BordismFormalGroups/README.md:1193 supplies the finite-source telescope comparison instead.

   **Exact repair text:** Replace that proof input with: “Put W=D V⊗V. The smashing finite localization L_n^fW=(L_n^fS)⊗W is an E₁ ring. BordismFormalGroups F6.3's finite-source telescope comparison identifies its underlying spectrum with the telescope of a v_n self-map of W, hence gives Bousfield class ⟨T(n)⟩. Use this E₁ model in the unit-nilpotence argument.” Cite F6.3 for this comparison, and remove the assertion that G2 supplies associative telescope localization from the Needs and Dependencies lines.

   **Repair test:** For V=U∨U with U a nonzero finite type-n spectrum, End(V) has matrix multiplication: e₁₂e₂₁=e₁₁ and e₂₁e₁₂=e₂₂. The commutative supplier cannot apply. Smashing with the commutative algebra L_n^fS preserves its E₁ multiplication and supplies the required telescope model.

2. **F02** (P1) The sharp connectivity proof uses an unowned categorical-height theorem

   **Location:** packages/ChromaticHomotopyTheory/README.md:595,607; “using the categorical-height criterion and the telescope’s unital-ring model”.

   **Claim:** The sharp bound follows from a categorical-height criterion available before §6.3.

   **Witness:** csy line 4036 states the nonzero p-local weak-ring equivalence involving finite type-(n+1) spectra, Σ∞B^(n+1)C_p and Morava support. Neither §6.3 nor its suppliers state that criterion; the three declared gaps do not request it.

   **Exact repair text:** Add a named target before its use: “Weak-ring Eilenberg–Mac Lane criterion. For a nonzero p-local spectrum R with homotopy-unital multiplication and n≥0, the following are equivalent: F(n+1)⊗R=0 for a finite spectrum of type n+1; Σ∞K(C_p,n+1)⊗R=0; K(j)⊗R=0 for all j>n, including j=∞. Construct the finite-space norm and ambidexterity inputs required for the first implication, and prove the criterion and its finite-Postnikov extension.” Give csy Theorem 5.4.4 and Remark 5.4.5, pp.83–84, as locators, assign the required proof constructions before this target, and cite this target in §6.3's Needs. If following the CSY proof, place the required Tate/ambidexterity results before the sharp bound, and then place §6.4 after it. If these inputs are delegated, register an exact named supplier gap instead of treating the source citation as supply. The research note at packages/ChromaticHomotopyTheory/design/README.md:1825 does not state this theorem or constitute a declared supplier gap.

   **Repair test:** For R=H𝔽_p, every finite-height K(j)-smash is zero, but H𝔽_p⊗R≠0 and H̃_(n+1)(K(C_p,n+1);𝔽_p)≠0. The explicit infinity endpoint excludes this false version. For a unital type-n telescope, the support is {n}, so the repaired criterion gives exactly the vanishing used in §6.3.

3. **F03** (P1) The BHLS proof imports the purity and redshift theory excluded from its inputs

   **Location:** packages/ChromaticHomotopyTheory/README.md:751,753,763,1309; “the non-hyperdescent construction and its all-prime, all-height argument are part of this target”.

   **Claim:** The stated BHLS K-theory witness can be proved from the listed spectral/trace carriers and the subsection's unnamed non-hyperdescent argument, while purity and redshift remain downstream consumers.

   **Witness:** bhls line 3203 invokes Corollary 6.3; bhls line 2904 uses LMMT purity. bhls line 3219 and line 3225 additionally require Hahn–Wilson's BP Lichtenbaum–Quillen theorem and nonzero T(n+1)-localized TC.

   **Exact repair text:** Separate the higher-height BHLS witness from the preceding height-one equality and place it in a later ChromaticHomotopyTheory Part II, after the purity and BP redshift/Lichtenbaum–Quillen development. State its dependencies explicitly: the purity/trace equivalences of bhls Theorem 6.1 and Corollary 6.3, the height-n Lichtenbaum–Quillen property and T(n+1)⊗TC(BP⟨n⟩)≠0, and the cyclotomic completion/coassembly theorem. Keep height-one equality here. The current roadmap's scope and Suggested.lean docstring should identify the higher-height separation theorem as belonging to that extension, rather than promise its proof from carriers alone. If retaining the witness here, move the prerequisite ownership here first and make the existing purity consumer import those targets; merely adding a reverse supplier citation does not close the proof.

   **Repair test:** At p=2, n=2, k=0 the witness uses BP⟨1⟩^(hℤ), with π₋₁=H¹(ℤ;ℤ₂)=ℤ₂ because the Adams action fixes π₀. A connective trace theorem alone does not give Corollary 6.3. The explicit purity/truncating comparison and nonzero T(2)⊗TC(BP⟨1⟩) supply the two missing steps; setting that last object to zero would make the proposed separation argument prove nothing. The mechanical checker does not detect these omitted edges. The board design confirms the ownership: packages/GeneralAlgebraicKTheoryPartII/design/README.md:1110 states purity, and its lines 1005 and 1114 consume this roadmap. Thus importing that proof here without splitting ownership would also close a mathematical dependency cycle.

4. **F04** (P2) Homotopy-ring hypotheses do not supply the module category used in §8.1

   **Location:** packages/ChromaticHomotopyTheory/README.md:717,719,731; “oriented homotopy commutative ring” and “Reconstruct every R-module by the finite Čech limit”.

   **Claim:** The module adjunctions and derived module-category reconstruction supplied by G2 apply to this R.

   **Witness:** TauCetiRoadmap/BordismFormalGroups/README.md:337–343 explicitly requires a coherent associative ring for the supplied module category. A commutative associative algebra object in the homotopy category supplies multiplication identities, not the higher coherences of G2's module carrier.

   **Exact repair text:** “For a homotopy-unital R-action on M, by which we mean a map a:R⊗M→M with a∘(η⊗id)=id_M, the same height bound makes M L_n-local. First prove ⟨R⟩≤⟨E(n)⟩ using the invariant-ideal/BP comparisons. Apply BordismFormalGroups F6.3's pairing locality criterion to R⊗M and use the unit-action retraction M→R⊗M→M. Coherent R-modules are an application when R has a specified E₁ refinement.” Replace the module-category/Čech proof step and its G2 dependency with this argument; do not narrow the homotopy-ring statement to E∞ rings.

   **Repair test:** For the homotopy R-action on M=R, the composite is id_R; for M=0 it is id_0=0. For nonzero M with zero proposed action the composite is 0≠id_M, so it is excluded. The retract proof needs exactly the displayed homotopy identity, whereas a relative tensor functor Mod_R cannot be constructed from that identity alone.

5. **F05** (P2) The integral James-filtered family is unnecessarily restricted to p=2

   **Location:** packages/ChromaticHomotopyTheory/README.md:1229,1257; “At p=2 and m≥1 define z(m)” and “At p=2, z(m) is K(i)-acyclic”.

   **Claim:** Only the prime-two integral family and its positive-height acyclicity are developed, despite the all-prime Thom-family scope.

   **Witness:** lmmt line 867–869 explicitly identifies odd-prime integral versions and says they are left unwritten there. Restricting the roadmap to that source's worked prime leaves its general-library contract incomplete.

   **Exact repair text:** “For every prime p and m≥1, let z_p(m) be the p-complete Thom E₁ ring of the restriction along Ω fib(J_(p^m−1)S²→K(ℤ,2)). Construct compatible maps z_p(m)→y(m), prove π₀z_p(m)=ℤ_p and colim_m z_p(m)=Hℤ_p in p-complete spectra, and prove K(i)⊗z_p(m)=T(i)⊗z_p(m)=0 for 1≤i<m. Its rational π₀ is ℚ_p, so height zero remains excluded.” Extend the odd-prime comodule/Adams vanishing-line development already owned by §13.4 to this integral family. Cite lmmt Remark 4.17 and the paragraph before Corollary 4.18, p.21, for the extension, retaining akq Proposition 2.22 for the prime-two calculation. Add the odd-prime instance below as a Check.

   **Repair test:** At p=3,m=1 the index is 3¹−1=2, π₀z₃(1)=ℤ₃ rather than π₀y(1)=𝔽₃, rational π₀ is ℚ₃≠0, and the range 1≤i<1 is empty. At p=3,m=2 the index is 8 and the required positive-height range is exactly {1}. At p=2 these formulas recover the existing targets.

6. **F06** (P3) Several Checks only repeat scope or the target

   **Location:** packages/ChromaticHomotopyTheory/README.md:253,417,511,601,619,757,759,795,997,999,1061,1075,1077; for example, “The equality at height one is not described as an open conjecture.”

   **Claim:** These bullets function as discriminating mathematical Checks.

   **Witness:** At line 757 no spectrum, map or computed value is supplied. Lines 511 and 619 repeat the hypothesis/conclusion wording; they would remain unchanged if the asserted implication were false.

   **Exact repair text:** Delete these thirteen bullets from their Checks blocks, retaining any necessary scope qualification in the surrounding statements. Retain the adjacent explicit calculations at lines 515,603,621,761,1001,1063,1079. Replace line 417, if a separate hypothesis Check is wanted, with a fully specified pair of localizations and a map for which failure of preservation changes the pullback; do not count the sentence “the condition is required” as that example.

   **Repair test:** The retained line 515 distinguishes T(n)⊗Hℤ=0 from T(n)⊗Σ∞ℤ≠0; line 1001 distinguishes T(1)⊗KU_p^∧≠0 from T(2)⊗KU_p^∧=0. The deleted bullets make neither calculation and impose no additional test. No Lean declaration is added in their place.

7. **F07** (P2) The auxiliary q in the Moore-spectrum Checks is not declared prime

   **Location:** packages/ChromaticHomotopyTheory/README.md:119,141,1313; “multiplication by any q different from p is invertible”. The conventions declare p prime but impose no general condition on q.

   **Claim:** Inequality q≠p suffices for the asserted invertibility and p-inversion formulas.

   **Witness:** With p=2,q=4, multiplication by q on π₀(S/p)=ℤ/2 is zero, not invertible. Also S[1/2]⊗S/4=0, while π₀(S/4)=ℤ/4≠0.

   **Exact repair text:** Add to the conventions: “The auxiliary letter q always denotes a prime; require q≠p wherever that inequality is displayed. The relative-fiber Checks explicitly also allow q=p.” Alternatively state gcd(p,q)=1 for each integer-Moore-spectrum comparison. Change “any q different from p” to “any prime q different from p” at line 119.

   **Repair test:** For p=2,q=3, multiplication by 3 on ℤ/2 is the identity, and (ℤ/3)[1/2]=ℤ/3. The counterexample q=4 is excluded because it is not prime and gcd(2,4)=2. The separate q=p relative-fiber Check remains allowed and still gives (ℤ/p)[1/p]=0.

## Verified sound

The complete 1348-line README and 46-line Suggested.lean were read, together with the repository README and CONTRIBUTING rules. The inventory contains 40 numbered target subsections, 25 headline groups in the Lean module docstring, and 219 README Check bullets. There are no separately bold mathematical target labels. All 219 bullets were evaluated or diagnosed; thirteen merely repeat scope (R06). Representative computations are retained below. Counts refer to the text at f29de2d, not proposed replacements. The tables certify the displayed computations and source comparisons, not completed proofs of the roadmap's future theorems.

There are **0 Lean declarations**, **0 section variables**, **0 instances**, **0 admitted data definitions**, and **0 padding declarations**. Consequently the requested elaborated-signature inventory is empty; no Lean command or build was run. The namespace and sole import are compliant. The 25 unavailable-headline groups name their missing carriers; none can be recovered merely by defining a simple predicate on a pinned spectral carrier, because those carriers are absent. The ordinary formal-group examples are supplier comparisons, not omitted chromatic headline signatures.

| Suggested.lean location | Declaration/section context | Variables and instances | Values/probe | Result/change |
| --- | --- | --- | --- | --- |
| 1 | import Mathlib | none | imports=1 | conforms |
| 3–42 | module docstring, 25 headline groups | none | declarations supplied by the comment=0 | missing carriers listed, including all 40 targets grouped by topic |
| 44–46 | TauCetiRoadmap.ChromaticHomotopyTheory | none | theorem/def/instance count=0 | no signature to elaborate or duplicate |

The library check used the manifest pins, confirmed against the checked-out library HEADs: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Ten named pinned declarations were resolved. Their relevant contexts are:

| Pinned declaration | File:line | Actual context / distinguishing value |
| --- | --- | --- |
| FormalGroup; FormalGroup.IsComm | Mathlib/RingTheory/FormalGroup/Basic.lean:56,74 | commutative coefficient ring; constant coefficient 0, linear coefficients 1, associativity; commutativity separately asserted |
| FormalGroup.Point | Mathlib/RingTheory/FormalGroup/Basic.lean:126 | power series satisfying HasSubst; constant 1 over ℤ fails nilpotent-constant substitution, constant 0 passes |
| FormalGroup.𝔾ₐ; FormalGroup.𝔾ₘ | Mathlib/RingTheory/FormalGroup/Basic.lean:145,161 | laws X+Y and X+Y+XY; at characteristic 2 their 2-series are 0 and X² |
| FormalGroup.map | Mathlib/RingTheory/FormalGroup/Basic.lean:184 | ring homomorphism on coefficients; ℤ→𝔽₂ sends 2X+X² to X² |
| CategoryTheory.ObjectProperty.isLocal | Mathlib/CategoryTheory/Localization/Bousfield.lean:55 | morphism predicate, precomposition bijective; identity passes for every object property, no reflector constructed |
| IsLocalization.flat | Mathlib/RingTheory/Flat/Localization.lean:37 | actually works over commutative semirings; ℤ[1/2]⊗ℤ/2=0, ℤ[1/2]⊗ℤ/3=ℤ/3 |
| Module.Flat.lTensor_exact | Mathlib/RingTheory/Flat/Basic.lean:323 | Flat R M, additive groups and R-linear maps; tensoring ℤ —2→ℤ→ℤ/2 yields an isomorphism followed by zero over ℤ[1/2] |
| WeierstrassCurve.formalGroup | TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58 | arbitrary WeierstrassCurve over CommRing R; reindexes addition into Fin 2, imposes no smoothness by itself |

Object searches at the pins found algebraic/analytic spectra and spectral objects of homological complexes, not the category of spectra used here. Mathlib/AlgebraicTopology/EilenbergSteenrod.lean:36,144 provides HomologyPretheory and homotopy invariance; TauCeti/AlgebraicTopology/EilenbergSteenrod.lean:65,85,94 adds pair sequences, additivity and dimension. Neither file supplies excision or weak-equivalence invariance. Mathlib's Algebra/Homology/HomotopyFiber.lean concerns complexes, not homotopy fibers of spaces. No native Morava, Bousfield–Kuhn, ring-spectrum, spectral Thom or spectral-module carrier was found. Thus no stand-in is warranted in Suggested.lean.

The three gap slugs match design/plan.json and README lines 59,71,85, with named suppliers and the same hypotheses. The compact p-local specialization, spectral quasicoherent-module enhancement, and connected stable James splitting are treated as declared contracts, not missing-supplier findings. In particular the last excludes W=S⁰, where π₀ of the James monoid is ℕ and π₀ΩS¹ is ℤ.

### Supplier and ownership inventory

Ten named roadmap suppliers were checked by current section, including the supplied RefinedTraceMethods head; main copies were used where available. The other named suppliers absent from main were read through the roadmap service. Repeated citations were consolidated into the following ten rows. Their fine-grained contracts, rather than merely the names, were compared with the target. R01 is the one false explicit supply attribution found; R02–R04 concern additional proof inputs/carriers.

| Supplier | Sections resolved | Match / boundary tested |
| --- | --- | --- |
| GeneralizedCohomology | G2, G3.4/3.7/3.8/3.9, G4.5, G5.1/5.4 | spectra, modules, finite duality, covers, integer inversion and Bott models; G2's commutative localization does not accept End(U∨U), R01 |
| BordismFormalGroups | F1–F3,F5,F6.1–F6.5 | height, BP, nilpotence including ∞, finite quotients, norm/Tate and Kan extensions; finite-source telescope at line1193 and pairing-locality at line861 give the repairs R01/R04 |
| EnhancedDerivedSheaves | E0.4,E0.5,E5:abstract,E5:presentability.1, stable monoidal E5 | coherent colimits, stable categories, compact/Ind interfaces; spectral ringed sites remain the declared gap |
| StableHomotopyKTheory | 3.18,3.21,7.21–7.27 | Postnikov/twisted coefficients and filtered convergence; 7.24 explicitly permits periodic E and infinite CW base, unlike a cohomological complete tower |
| AlgebraicTopology | Stages4–5,8 | Hausdorff CW models, ordinary twisted Serre and homotopy/Hurewicz/Whitehead comparisons; reflection monodromy gives 2 rather than 0 |
| HomotopySpheres | 3A,3B,4B | convenient suspension/loops, finite stabilization, connected James and real Bott; stable James splitting requested separately |
| TopologicalKTheory | T7 | α²=4β, complexification 2u²/u⁴ and eightfold periodicity; coefficient product gives 4u⁴ on both sides |
| EllipticCohomology | E1,E2.2–E2.3,E3,E4,E6 | marked h=1,2 realization and general obstruction machinery; coherent sheaf, surviving Δ²⁴ and all tame levels; degree +2 generator is inverse of this roadmap's u |
| ModularCurves | 3D,4B,4C,5B,7E,7F | invert N, N≥3 for schemes, right row-vector basis action, supersingular heights and Serre–Tate; N=2 requires stacks, not its scheme claim |
| RefinedTraceMethods | 2.3,2.6,2.9,2.10,4.9,4.11,6.8 | actual THH/TC/K/trace and Segal carriers at supplied head; K(1) completion formula agrees; none of these is BP redshift or purity |

Ownership searches used the roadmap service, main active/completed roadmaps, board packages/designs, and all **50 supplied open-head folders (100 README/Lean files)**. Searches were by objects (periodic telescopes, Morava realization, finite-local Tate, James splitting, Thom R-lines, spectral Galois and homotopy-unital rings), not only proposed names. No duplicate Lean name is possible here because there are no declarations. The native algebraic formal laws, spectra, nilpotence, ordinary finite localization, norms, Bott and elliptic sheaf retain their existing owners. Higher realization beyond h=2, Bousfield–Kuhn, spectral affineness and R-line Thom functoriality are new extensions owned here. StableHomotopyKTheoryPartII's design explicitly consumes the generic R-line Thom construction (packages/StableHomotopyKTheoryPartII/design/README.md:919); it does not independently own that construction. GeneralAlgebraicKTheoryPartII's design owns purity and consumes this roadmap (R03).

The mechanical dependency command was run read-only and returned exactly:

```text
depcheck: 51 roadmaps, 583 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This tests recorded edges only; it does not discharge the unrecorded proof dependencies in R02–R03. The git comparison against origin/main showed eight changed files, all inside packages/ChromaticHomotopyTheory. No package source, plan, manifest, merge-order file or git state was changed during this review. No suspicious instruction in fetched/file content was followed. The latest package repair report marked all its findings applied; none of the findings here re-raises a settled “not actionable” disposition.

### Sampled adversarial computations

The following 15 target rows and 16 Check rows retain representative computed values from the full pass. Line numbers refer to packages/ChromaticHomotopyTheory/README.md. Spectral equalities mean equivalences; p is prime, and R07 records the missing convention on q. A passing instance does not resolve a separate proof-supply finding.

| Target and README line | Variable/instance context | Instances and computed sides | Result / change |
| --- | --- | --- | --- |
| 3.3,311 acyclicity iff | unit and two homotopy unit identities; no associativity | R=0 gives 0 iff0; R=K(n) gives nonzero iff nonzero; rational nonassociative algebra has both smashes0 with (a²)a=0,a(a²)=1 | truth supported; proof supply R01 |
| 4.1,347 finite towers | n≥0, all spectra, bottom chosen explicitly | S gives Hℚ vs S[1/p]; S/3 at p2 gives0 vs S/3; S_(2) gives Hℚ on both sides | R07 for q; no negative-index tower map |
| 5.2,477 Φ_n | n≥1, T(n)-local values and finite-source compatibilities | Ω∞0→0; Ω∞T(n)→L_T(n)T(n)≠0; at n0, Ω∞Σ⁻¹Hℚ=* but L_T(0)Σ⁻¹Hℚ=Σ⁻¹Hℚ | supported; local-valued uniqueness retained |
| 6.1,531 Serre | CW base, arbitrary E, full monodromy | reflection gives ker2=0,coker2=ℤ/2; H₂=0,H₁=ℤ⊕ℤ/2; KU on CP∞ has only even s,t and d_r=0 | supported; strong homological convergence uses actual supplier7.24 |
| 6.3,593–595 sharp vanishing | n≥1,m=n+1, relative bottom and v_i vanishing | n1 gives m2; K(C_p,n) has connectivity n and nonzero K(n)-homology despite periodic homotopy0; K(ℤ/q,2) has π₂[1/p]=ℤ/q for q≠p | sharp theorem supported by csy; ownership R02 |
| 7.1,645 realization | perfect k,char p,finite h≥3; h1,2 imported; marked deformation | h1:0 parameters,ℤ_p; h2:1 parameter; h3:2 parameters; additive law h∞ outside domain; w=u⁻¹ reverses degrees +2/−2 | supported; marking and coordinate choice retained |
| 8.1,717 locality | p-local even-periodic oriented homotopy ring, uniform height bound | multiplicative law at p2: (2,v₁)=(1); additive field law:(0)≠(1); zero ring:(0)=(1),M0 | conclusion supports weak-action version; coherent carrier R04 |
| 8.3,751 equality/separation | p arbitrary,n1 vs n≥2,k≥0; chosen BP model/action | n1 acyclic classes equal; p2,n2,k0 gives π₋₁ of input ℤ₂; BHLS T(2)-local witness has distinct K(2)-localization | theorem true, missing major proof inputs R03 |
| 9.5,875 raw examples | completed KU,trivial C_p action; oriented inverse Thom tower | p2:z=−2,quotientℚ₂; p3:z²+3z+3=0,fieldℚ₃(ζ₃); ζ₃−1 squared=−3ζ₃ | supported, separate completed comparison explicitly owned |
| 10.1,919 relative D_p-E | K(h+1)-local E-module,homotopy algebra,factorization;1≤k<h | zero algebra has0=1; θ′=(1+z)θ gives P′1=1+z; p2,h2,k1: [2]/z⁴=u₂+terms after (2,u₁), not before | supported weaker relative definition; source error recorded separately |
| 10.3,963 ring height | E∞R;infimum in {−1,0,…,∞},T0=S[1/p] | heights0ring/H𝔽_p=−1;Hℚ/H𝔽_q=0; sphere=∞; mapS→H𝔽_p gives−1≤∞ | supported; not geometric height |
| 12.3,1085 Galois | E∞A,B,finite G;N≥1,invertN,all determinant components | N1 group1;N2 group6 and stabilizer−1;N3 group48;N5 group480; C₂ torsor tensor4 factors; S₃ tensor36 factors | supported all levels and action direction |
| 13.2,1211 completed HM | all primes,p-complete monoidal category,unit1−p | p2 unit−1;completed π₃ mapid givesπ₂C=π₃C=0;uncompleted domain givesπ₂=ℤ_p/ℤ;Thomπ₀=𝔽_p/ℤ_p respectively | supported completion convention |
| 13.3,1229 finite Thom family | m≥0 for y;m≥1 for z;completed colimits | p^0−1=0:y0=S_p; p2,m1 index1,yπ₀𝔽₂,zπ₀ℤ₂; p3,m1 integral index2 is omitted | R05 generality |
| 13.5,1275 James consequence | connected pointed CW W,arbitrary E | W*:all positive summands0;WS²:degrees2,4,6,…,no degree0;W=K(C_p,1),E=Hℚ:0=0;WS⁰:ℕ≠ℤ | supported conditional on declared splitting |

| Check line | Instances tried | Computed values on the relevant sides | Result/change |
| --- | --- | --- | --- |
| 37 | ΣS, swap of S¹ factors, id_S and 0→S | π₁ΣS=ℤ; sign=(−1)¹=−1; cofib(id)=0; cofib(0→S)=S | pass |
| 40 | multiplicative law at p=2,3 | 2X+X²→X²; 3X+3X²+X³→X³ | pass |
| 119 | p=2, q=4 negative; q=3 positive | 4 on ℤ/2=0, not iso; 3 on ℤ/2=id | R=07 |
| 253 | uninstantiated universal reminder; compare types0,1 | S_(p)type0, S/p type1; bullet itself supplies no test object | R=06 delete |
| 321 | p=2, H𝔽₃ | T0⊗R=R; K0⊗R=0 | pass |
| 937 | p=2, h=2, k=1 | [2] containsu₁z² before quotient, so not divisible by z⁴; after(2, u₁), leadingu₂z⁴ | pass |
| 939 | R=0; E,θ′=(1+z)θ | R=0 hasP0=0=1; P′1=1+z≠1; restriction at z=0 unchanged | pass |
| 1001 | HQ; KU_p, i=1 | HQ Tate0, positive heights0; KU_p T1Tate0, T2R=0, T1R≠0 | pass |
| 1025 | realBott, complexification | (2b²)²=4b⁴; alternativeβwouldgiveb⁴≠4b⁴ | pass |
| 1105 | A=Hℤ, B0 | B⊗_AA=0 butA≠0; fails faithfulness | pass |
| 1111 | upper/lower unipotents mod 3; diag(−1,1) | gh sendsbasis(2P+Q, P+Q); hg gives(P+Q, P+2Q); det−1 invertsζ | pass rightbases, left action on sections |
| 1115 | S₃, A⁶ | B⊗B=A³⁶=∏_GB; fixed pointsA; M⁶=0⇒M=0 | pass nonabelian |
| 1131 | p=2, p=3 | orders48,24; without residue factor24,12 | pass |
| 1221 | completed and uncompleted S³domain | coker(idℤ_p)=0; coker(ℤ→ℤ_p)=ℤ_p/ℤ inπ₂ | pass |
| 1269 | p=2,3; m=1; v₀ | denominators2,4; v₀ degree 0 never divided by | pass |
| 1301 | W=S⁰ | π₀J∞=ℕ; π₀ΩS¹=ℤ; −1missing from free-word monoid | pass negative connectedness test |

### Source locator ledger

**111 distinct explicit source-line anchors** were resolved in the 18 readable cached works. Repeated uses of the same anchor were checked against their surrounding claim. The table records the relevant theorem ranges and conclusions, including the bibliography's additional named locators; it does not count all pages of a cited paper as verified. No additional source download or manifest write was necessary. The separate ABS locator-only entry retains its settled status.

| Source | Locators inspected | Comparison/result |
| --- | --- | --- |
| lmmt | lines153,239–420,625–648,808–930; Definition2.1, Lemmas2.2–2.8, Proposition2.9/2.11, Remark2.12, Corollaries4.12–4.21 | bottom convention, weak multiplication, sharp-bound citation, Thom and modular applications agree; source's introductory height-zero overclaims recorded below |
| hs | lines89–177,359,548,582,664,790–822; Theorems3,7,9,11, §§1.1–1.4,2.1–2.2, Lemmas3.5–3.6/Corollaries3.7–3.8 | finite/type/centrality examples supported; OCR inequalities were not treated as source errors |
| ravenel | lines379–462; §2 and Theorem2.1(d)–(f) | coefficient degrees, BP/truncation Bousfield classes support imported examples |
| kuhn-guide | lines113,393–433,620–800; Theorem1.1,Lemma3.1,Theorem5.2,Lemmas5.4–5.5,Definition5.6 | positive height, finite-source rigidification and local-valued comparison supported |
| kuhn-tate | lines145–183; Theorem1.5,Corollaries1.6–1.7 | localized Tate vanishing and splitting, not arbitrary raw vanishing |
| cm-tate | lines1–153; Lemma2.1,Definition2.2,Proposition2.3,Lemma2.4,Theorems2.5–2.6,Corollary2.7,Remark2.8 | correct transfer direction, Ω^(∞+1) shift and raw/local distinction |
| hahn | lines19–110,114–223, Bockstein/valuation sections,422–478; Definitions1.2/3.1,Theorems1.3/3.3/4.6,Corollary4.6.1,Proposition4.7 | absolute versus relative data distinguished; source multiplicativity error is not copied; coefficient-field misprint below |
| cmnn | lines97–110,817–877,906–932; Theorem4.6,Lemma4.7,Theorem4.10 proof | Tate converse and finite-local blueshift agree; version numbering follows the cached version |
| csy | lines173–188,3970,4036–4065; TheoremE,Theorem5.4.4,Remark5.4.5 | supports sharp bound, including the infinity endpoint; its proof prerequisites cause R02 |
| bhm | lines30,210–270; §3,Theorem3.1,Lemmas3.2–3.3,3.5 | p-local nullification range and generalized Serre use supported |
| mm | lines1244–1280,1682–1818; Theorems4.6–4.7,Corollary4.8,Theorems7.1–7.2,Definitions7.3–7.4,Example7.5,Theorem7.6 | spectral affineness for both elliptic stacks and faithful level extensions at all positive N; wrong torsion point in source below |
| behrens | lines132–248,455–462,766–778,845–884,1007–1185,1252–1288; §§1.2,1.3,1.5,1.6,Theorem1.7.6 | coordinate sign, degrees, discriminant powers, height and supersingular group orders supported; two local notation misprints below |
| goerss | lines152–175,670–706; Theorem1.2,Definition1.3,Theorem3.6 | sheaf and arbitrary finite-height marked realization stated with correct perfect-field conditions |
| thom | lines394–481,529–602,762–887; Definition3.1,Corollary3.2,Theorem3.5,Corollary3.9,Lemma3.15,Proposition3.16,Theorems5.1/5.7 | R-line colimit, E_n structure and completed mod-p/integral theorems supported; source's older cover notation converted correctly |
| akq | lines132–318,618–665; Construction2.1,Lemma2.2,Convention2.6,Proposition2.22 | p-completed family convention checked; prime-two acyclicity matches; Milnor-primitive degree typo below |
| bhls | lines60–140,2880–2936,3130–3229; TheoremA,Theorem6.1,Corollary6.3,Proposition6.24,Theorem6.25 | all primes/heights witness supported; proof uses purity and BP redshift inputs omitted in R03 |
| greenlees-sadofsky | lines180,327–355,413–425; Corollaries1.4/2.4 and proof | inverse cyclic Thom tower and lower-height rationality supported; completed KU comparison is explicitly a target here |
| hesselholt-ku | lines1650–1695, contribution p.844 | uncompleted KU Euler calculation, not automatic commutation of Tate with completion; package states that distinction |
| abs | Theorem6.9,pp.15–16;Theorem11.5,pp.28–29 | uncertified, not counted among readable texts |

## Not verifiable

- **abs:** settled locator-only, uncertified. Its text was not requested again. The coefficient normalization was independently compared with TopologicalKTheory T7 and GeneralizedCohomology G5.4, but that does not certify these ABS page locators.
- **Elaboration:** no Lean elaboration was performed under the read-only instruction. The declaration inventory is empty, so there is no elaborated signature whose binders remain unchecked.
- **Prerequisite completion:** the declared supplier gaps are future contracts. This review verifies their naming, hypotheses and declaration locations, not their implementation. R02–R03 identify additional prerequisites that are not covered by those contracts.
- **Unavailable final packages:** GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII were available as board designs, not as completed package READMEs at the named main/open sources. Their designs were inspected for ownership; no claim is made that their future supplied APIs are already present.
- **Source extraction limits:** the hs and thom extractions contain OCR damage in mathematical displays. Used conclusions were checked against surrounding prose and parallel readable citations; no damaged symbol alone was used to allege a source error. The complete proofs of all cited deep theorems have not been independently reconstructed by the finite-instance pass.

## Source issues

- **Error** in hahn at introduction, printed p.2 (hahn line 54): the source says the power operation of any relative Dₚ-E-algebra is multiplicative; it should be restricted to a coherent multiplicative factorization, since θ′=(1+z)θ gives non-idempotent P′(1)=1+z; affects a stated result.
- **Misprint** in hahn at Corollary4.5.2 and its proof, printed pp.9–10 (hahn line 398 and line 408): the source says the coefficient quotient is 𝔽_p[[u_h]]; it should be 𝔽_(p^(h+1))[[u_h]] for the Honda theory fixed in §2; affects the proof.
- **Misprint** in mm at Example7.5, printed p.37 (mm line 1780): the source says the second indicated Legendre two-torsion point is (0,1); it should be (1,0), since substituting (0,1) gives 1=0; affects nothing.
- **Misprint** in akq at §1.2, printed p.4 (akq line 156): the source says the Milnor primitive Q_i has degree 2^i−1; it should be 2^(i+1)−1, with Q₀=Sq¹ in degree1; affects nothing.
- **Misprint** in behrens at the supersingular pullback preceding Proposition1.6.12, printed p.31 (behrens line 1145): the source says the formal-group completion is indexed by n; it should be indexed by 2 for this supersingular height-two square; affects nothing.
- **Misprint** in behrens at Remark1.6.13, printed p.31 (behrens line 1165): the source says EO_n is E₂^hG for G≤G_n; it should be E_n^hG; affects nothing.
- **Error** in lmmt at introduction, printed p.4 (lmmt line 167 and line 181): the source says nonzero T(0)-localization implies a map to an even-periodic characteristic-zero field theory; it should be restricted at height zero to nonzero rationalization; H𝔽_q, q≠p, has none; affects the proof.
- **Error** in lmmt at introduction, printed p.4 (lmmt line 175): the source says telescopic and chromatic graded-piece vanishing agree for rings without a height-zero qualification; it should be restricted to positive heights or p-local inputs; H𝔽_q gives nonzero T(0) and zero K(0); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f29de2de3c59a1daef558204776e0c177c7c36f1", "job": "RT-ChromaticHomotopyTheory~1a", "model": "gpt-6-astra", "worker": "chris-16"} -->
