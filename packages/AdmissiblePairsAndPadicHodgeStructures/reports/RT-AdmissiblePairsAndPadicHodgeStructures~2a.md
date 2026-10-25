<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1092#issuecomment-6394527847 -->
Red team round 2 pass a (codex) of 85772b7

Verdict: needs_changes

1. **F01** (P3) Finite rank-one monodromy need not be quadratic

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:2065`: “A nontrivial finite étale rank-one character has de Rham weight zero and monodromy −1”.

   **Claim:** Every nontrivial finite rank-one Q_p-character has sign monodromy.

   **Witness:** For p=7, choose ζ₃∈Q₇ and the unramified character Gal(Q₇-bar/Q₇)→μ₃ sending arithmetic Frobenius to ζ₃. Its image has order 3, whereas {±1} has order 2. It is de Rham of weight zero.

   **Exact repair text:** “A nontrivial quadratic finite étale rank-one character has de Rham weight zero and monodromy image {1,−1}, whereas the neutral unit has image {1}. Equal geometric unit fibres do not identify these two families. Finite rank-one characters of other orders are also allowed: at p=7 the unramified cubic character has image μ₃.”

   **Repair test:** The cubic example now has its actual three-element image. The quadratic example retains the intended two-element comparison with the unit.

2. **F02** (P2) Seminormal full faithfulness loses the Q_p base hypothesis

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:804` and `:813`: “Fix a complete nonarchimedean field L” and “Morphisms between represented seminormal rigid diamonds … are the unique corresponding rigid morphisms.”

   **Claim:** Diamondification is fully faithful on seminormal rigid varieties over every complete nonarchimedean field.

   **Witness:** Over L=F₂((u)), the smooth disc map T↦T² induces a diamond isomorphism. Its inverse is not rigid analytic: f(T)²=T would require 2·ord_T(f)=1. HKII line 691 and DiamondsAndVStacks §D6.9 require L/Q_p.

   **Exact repair text:** Replace the first sentence of §4.1 by “Fix a complete nonarchimedean extension L/Q_p, with its nontrivial rank-one valuation.” Add a Check: “Over F₂((u)), T↦T² on the seminormal closed disc becomes an isomorphism after diamondification, although its inverse is not rigid analytic. Thus the mixed-characteristic base hypothesis is essential to this full-faithfulness assertion.”

   **Repair test:** The characteristic-two disc is excluded from the theorem and retained as a negative control. The existing Q_p-disc and characteristic-zero cusp Checks remain in scope. The supplier's exact statement is `TauCetiRoadmap/DiamondsAndVStacks/README.md:9977` (fixed complete K/Q_p, seminormal source); the rigid-point supplier has the same restriction in `packages/AdicSpacesPartIIPartII/design/README.md:879`.

3. **F03** (P2) The Igusa gap requests an already-owned ordinary tower

   **Location:** `packages/AdmissiblePairsAndPadicHodgeStructures/README.md:196–200`; `packages/AdmissiblePairsAndPadicHodgeStructures/design/plan.json:5321`: “The ordinary elliptic formal/generic tower and its full monodromy require the extension below.”

   **Claim:** The declared gap must supply construction of the ordinary elliptic formal tower and generic fibre, as well as the additional crystalline comparison.

   **Witness:** HodgeTateAndCanonicalSubgroups §5.1 already supplies the ordinary inverse tower with finite étale formal models; F=Q is the elliptic case. AlgebraicModularFormsAndSerreWeights R15.3 already owns full unit monodromy. Both precede this package.

   **Exact repair text:** Replace the sentence at line 196 by “Import the ordinary elliptic tower and its finite étale formal models from HodgeTateAndCanonicalSubgroups §5.1, and the full finite-level unit monodromy from AlgebraicModularFormsAndSerreWeights R15.3, The Igusa interpretation (anchor target-igusa-interpretation-of-hasse-and-theta). The remaining extension compares these supplied objects with crystalline frames.” Replace the gap's `needs` sentence, identically in README and plan.json, by “Compare the supplied ordinary elliptic Igusa tower and its full unit monodromy with the integral frame reduction of the rational crystalline-frame torsor, preserving the unit-root crystalline trivialization, Tate normalization and special/generic-fibre transition.” Add those two supplier citations to the exact contracts and the needs of §§12.2–12.3. Retain the existing gap slug, supplier and section for this remaining comparison.

   **Repair test:** Specializing F=Q in `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:1540`–`:1543` gives the required (Z/p^m)× torsors, transition maps and Z_p× inverse tower. At p=2, m=1,2,3 the finite degrees are 1,2,4, and the existing construction includes all three. `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeights/README.md:818` explicitly retains the full unit monodromy and small primes. The repair imports those constructions and leaves the new crystalline-frame identification as the gap.

## Round-one finding verification

All 18 earlier findings were marked applied, rather than not actionable, in the repair report. References r1a/Fxx and r1b/Fxx distinguish their reused identifiers. Locations below are in `packages/AdmissiblePairsAndPadicHodgeStructures/README.md` unless otherwise stated. Quoted text is the present package, not source prose.

| Earlier finding | Status | Repaired passage and verifiable witness |
| --- | --- | --- |
| r1a/F01 invariant lattices | Repaired | Lines 319–325: “For every nonzero integer m assume C(chi^m)^Gamma=0”. In the old example γ(u)/χ(γ)=2u/2=u≠0, so it is excluded; the first nonzero difference of two lifts is now a forbidden twisted invariant. |
| r1a/F02 ordinary diagonal | Repaired | Lines 1990, 1998–2000: “b=diag(1,p) and mu(z)=diag(1,z^-1)”. The upper root has Newton slope −1 and cocharacter weight +1; Hodge/HT flag dimensions are 1/0. At x=0 and 1 the Hodge flags differ and HT flags coincide. |
| r1a/F03 exact structures | Repaired | Lines 234, 263, 871: “both R-lattice complexes are exact” and “exactness at every filtration step”. Multiplication by t has K-image K but lattice image tR≠R; it fails strictness. |
| r1a/F04 BunG owner | Repaired | Lines 104–112: “§VS4.0's reductive BunGeometry, BunNewtonGeometry and BunAutomorphisms” and “BG1 §1.13 / sigma-centralizer-J-b”. These are the actual targets in the current suppliers; basic automorphisms are constant, nonbasic ones retain their kernel. |
| r1a/F05 analytic-closure Checks | Repaired | Lines 1896–1898: “the quotient is a discrete union of rigid points over L”. With U_n=1+p^nZ_p, intersections of containers are {1}, {1,p}, and U_m respectively. These are actual rigid levels; the calculations also hold at p=2. |
| r1a/F06 Corollary C page | Repaired | Line 768 and `sources.toml:13`: “Theorem B, p. 5, and Corollary C, p. 8”. HKI line 204 lies on page 5; HKI line 347 lies on page 8. |
| r1a/F07 rank zero | Repaired | Line 253: “At rank zero both the jump set and the elementary-divisor list are empty”. Ranks 0,1,2 give jump sets ∅,{0},{0} and exponent lists [],[0],[0,0]. |
| r1b/F01 filtered splitting owner | Repaired | Lines 86, 289, 313, 906, 1014 name “HodgeTateAndCanonicalSubgroups §2.14”; line 1014 also names “AdicSpacesPartII R1.3 / analytification-functor”. Current §2.14 supplies splitting for finite-type affine groups and G/P; root weight −1 gives P=T and G/P=A¹. |
| r1b/F02 CM converse | Repaired | Line 770: “Zariski density from §3.3 makes MG commutative” followed by exclusion of the vector factor. G_a is commutative but its parameter t^-1 mod R is nonzero, so the analytic-extension step excludes it. HKI lines 586, 2174, 2424 support the route. |
| r1b/F03 level-space duplication | Repaired | Line 1640: “Apply DiamondsAndVStacks D3.10 (locally-profinite-torsors)”. The supplier explicitly supplies separated étale level spaces and their limit on perfectoid charts; line 1651 applies descent. Q_p×/Z_p×=Z is the discrete test fibre. |
| r1b/F04 quaternion invariants | Repaired | Lines 2124, 2144: “ramified at exactly the same finite places as D away from p”. Ram(D)={p,ℓ} gives Ram(B)={∞,ℓ}; adding q,r no longer satisfies the premise. |
| r1b/F05 Grassmannian bases | Repaired | Line 991: “G/L a connected linear group” and “over that reflex base”; line 1060: “S over L([mu])”. For G_m, the cell changes from Spd L to Spd L′ under scalar extension. |
| r1b/F06 completed closure | Repaired | Line 321: “C the completed algebraic closure of K0”. The fixed-field calculation is C^Γ=K0; no action on an unspecified larger C is used. Lines 658 and 1064 carry this correction to applications. |
| r1b/F07 consumer pointers | Repaired | Lines 248, 276, 547, 574 point to §§4.4, 0.4, 5.1/6.4, 7.1, 6.1; line 2142 names “gap:ordinary-katz-igusa-monodromy”. All destinations exist. |
| r1b/F08 duplicated needs | Repaired | Lines 750, 762, 1239, 2120 and the corresponding dependency blocks contain each formerly repeated exact entry once. Exact-entry scan: 0 repeats. |
| r1b/F09 canonical-reduction ownership | Repaired | Line 13: “canonical reduction … is requested from MotivesAndAlgebraicCycles”; line 627: “Import its canonical reduction”. The same named gap remains in the contract and plan. |
| r1b/F10 gap consumption | Repaired | Lines 369, 758, 1934, 1982 explicitly name the adjoint/orbit or strict-field openness gap. No supplied strict-field openness theorem is claimed. |
| r1b/F11 cubic generality | Repaired | Line 1712: “For any cubic extension E/Q_p”. Totally ramified and unramified cases both have weights {0,1,−2} and coinvariant sum 1+1−2=0. |

No new error was found in these repaired passages. The new findings concern other passages.

## Verified sound

Read all 2,177 README lines and all 43 Suggested.lean lines, together with the repository rules and all three round-one reports. Inventory: **78 numbered targets** (24 definitions, 10 constructions, 37 theorems, 6 applications and 1 comparison); **134 Check bullets in 43 blocks**; **0 Lean declarations**. The README has no separate bold mathematical target labels: its bold labels are Summary, Checks and Acceptance. Every numbered target is included below. The two failed mathematical tests are S01 and S02; the ownership/minimality failure is S03.

Checked **168 distinct source-line locators in 5 cached works**: 42 HKI, 119 HKII, 1 Scholze, 3 LiuZhu and 3 BhattHansen. This count is of distinct line locators, not independent theorems. Field restrictions, both directions of the stated equivalences, period signs, and the identified source corrections were compared with the target statements. Each of the 24 definition targets has at least three Check bullets. All 134 Check bullets were read and evaluated; repeated checks of a shared object are consolidated in the target table. All 24 named roadmap supplier contracts were resolved and inspected, with the field mismatch recorded in S02. Two additional ownership contracts were inspected for S03. The earlier RZ design was inspected at its board package because the roadmap service has no main/open copy of it.

The head is 85772b714a718b3bfcb106f8606bf5eb43585215. Main was bfaaff10c2db6fea1ff2d1500673df510534799f; the supplied library pins agree with the README's Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The diff contains eight files, all under `packages/AdmissiblePairsAndPadicHodgeStructures/`. The plan changes are confined to its gaps list. No README/docstring process narrative, computational algorithm, `set_option`, `lemma`, admitted data or placeholder target was found.

The dependency command, run read-only against the supplied order, returned exit status 0:

```text
depcheck: 49 roadmaps, 574 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The explicit internal Needs references also have no forward target edge. The citation resolver reported no unresolved cross-roadmap citations or Lean names; its notice that it could not inspect pinned packages was addressed by reading the supplied pinned library files directly. Its successful resolution is not used as a substitute for the supplier-content checks.

**Scope and convention controls.** Abstract bilattices admit R=F₂[[t]], with t neither zero nor a unit; a field, zero ring and square-zero ring do not satisfy that DVR setup. Group targets require connected characteristic-zero linear groups: constant S₃ and Q₈ are disconnected and do not satisfy it. Noncommutative GL₂ matrices test the action order instead. On the native subgroup theorem, nonreduced value algebras remain permitted: 1+ε in Q_p[ε]/ε² is a nonidentity G_m-point, so restricting to field-valued points would lose data. Empty bases are excluded only where faithful geometric fibres are asserted; empty loci, empty index families and rank zero retain their specified values. No target uses an unguarded natural-number quotient, out-of-range index or zero-polynomial degree. Coefficients p=2 and 3 remain covered; the S02 field issue is not excused by these scope conventions.

The Tate normalization was recomputed for n=−1,0,1: Frobenius exponents 1,0,−1; isocrystal slopes 1,0,−1; unmodified bundle slopes −1,0,1; étale lattice exponents −1,0,1; de Rham exponents 1,0,−1; Hodge weights 2,0,−2; modified slopes 0,0,0. These values agree with the inspected period, bundle and filtered-connection suppliers. The upper-Borel and noncommuting-matrix computations below fix the two flag directions and inner-twist order.

The following computations use the hypotheses of each numbered README target. “Pass” records these tests, not a formal proof. Source-dependent theorems retain the nine declared supplier obligations. S01 and S02 identify the two failed tests.

| Target | Instances and computed values on both sides | Result / change |
| --- | --- | --- |
| 0.1 Lattices and bilattices | R=F₂[[t]], L₂=t^aR: trace is k for i+a≤0, 0 for i+a>0. Rank 0: jumps ∅, exponents []; rank 2 unit: jumps {0}, exponents [0,0]. Ramification e=2 sends a=1 to 2. The unipotent matrix has minimum valuation −1, determinant valuation 0, hence exponents [−1,1]; both subquotients have exponent 0. Multiplication t has lattice image tR≠R. | Pass |
| 0.2 Good G-bilattices | GL₂ diagonal (2,0): exponents [2,0]. Split torus: ordered cocharacters (2,0), without a Weyl permutation. G_a has only cocharacter 0, but its t⁻¹-extension has exponents [−1,1] and trace image 0≠k on the quotient. Quaternion torsor over Q_p[[t]]: Brauer invariant 1/2, becoming 0 after algebraic closure. Root weight −1 gives stabilizer T and flag A¹; inverse gives G and a point. | Pass |
| 0.3 Specialization dominance | Unipotent extension: sorted ambient exponents [1,−1], associated graded [0,0]; first partial sums 1≥0, total sums 0=0. Rank 0 gives equal empty sums; direct split rank 2 gives equality termwise. | Pass |
| 0.4 Exactness criterion | At filtration step 0, the unipotent rank-two trace is ke₁, its image in the quotient is 0, and the quotient trace is k. Thus not exact and not good. A diagonal split sequence gives k→k²→k exact; its associated graded is the same split sequence. | Pass |
| 0.5 Recovery | Type (2,0): lattices ⟨t²e₁,e₂+ct e₁⟩ have the same trace flag Ce₂ but c=0,1 give different lattices. Type (1,0) leaves zero lifting parameters. In the old fixed-lattice example γ(u)/χ(γ)=2u/2=u≠0, violating twisted vanishing. For Tate t^aR the trace jump is −a on both constructions, including p=2,3. | Pass |
| 1.1 G-isocrystals/basicness | Unit has all slopes 0. Every torus Newton map is central. Upper Borel b=diag(p,1) gives root slope 1≠0, hence fails B-basicness although its Levi is basic. | Pass |
| 1.2 Levi invariance | B(G_a) and B(1) each have one element. Upper Borel b=diag(p,1) maps to the same diagonal class in its Levi, while basicness changes false→true. Thus bijection does not identify basic subsets. | Pass |
| 1.3 Sigma-centralizer | b=1 gives G₁=G. Simple GL₂ slope 1/2 gives division-algebra units of dimension 4. diag(p,1) gives G_m² of dimension 2, not an inner form of dimension-4 GL₂. | Pass |
| 1.4 Connected-linear bundles | G=1 gives a terminal stack. Reductive specialization uses exactly the imported stack. For a negative Borel root bundle O(−1), H¹ can be nonzero, unlike the single class of B(G_a); this distinguishes general bundles from isocrystal bundles. | Pass |
| 1.5 Basic stratum | Basic unipotent root O has H⁰=Q_p and pro-étale H¹-sheaf 0; its automorphisms are constant Q_p. A positive root bundle has a positive-dimensional Banach–Colmez H⁰, so its full automorphism group is larger than the constant subgroup. | Pass |
| 1.6 Twisting | G_m: input slope 3, b slope 1 gives 2, inverse gives 3. For b=[[1,1],[0,1]], x=diag(2,1), σ_b(x)=[[2,−1],[0,1]]; b⁻¹σ_b(x)=σ(x)b⁻¹=[[2,−2],[0,1]]. Opposite conjugation gives upper entry +1. b=1 gives σ. | Pass |
| 2.1 Point Hodge structures | Tate n=−1,0,1: weights 2,0,−2 and lattice exponents 1,0,−1; bundle slopes −1,0,1 equal −weight/2. Zero rank gives the zero object. O(1)⊕O(−1) has degree 0 but slopes unequal, hence is not pure of weight 0. | Pass |
| 2.2 Admissible pairs | Unit: both lattices R, modified slope 0. Tate n has original bundle slope n and étale exponent n, giving modified slope n−n=0; transported de Rham exponent is −n. Mixed slopes ±1 have total degree 0 but fail admissibility. | Pass |
| 2.3 Point Tannakian theory | End(unit)=Q_p; unit tensor group 1, nonzero Tate tensor group G_m. Nonzero unit self-extension has G_a, a connected nonreductive group; neutrality alone would also allow finite groups and cannot prove connectedness. | Pass |
| 2.4 Basic equivalence | Unit maps to weight 0. Isocrystal slopes 0,−1 map to Hodge weights 0,−2. A lattice mixing these distinct summands fails grading compatibility, so the inverse equivalence does not apply to it. | Pass |
| 2.5 MT/MG groups | Unit sums give 1; a nonzero Tate generator gives G_m. A nonzero unit extension gives G_a: [[1,u],[0,1]] preserves e₁ for all u and fixes e₂ exactly at u=0. | Pass |
| 2.6 Invariants/existence | Rank-one b slope −1 and lattice type 1 give bundle modification degree 1−1=0. Replacing the type by 0 gives degree 1 and an empty admissible locus. Trivial group has one compatible invariant. | Pass |
| 2.7 BKF comparison | Unit modification is (O,O,id,id), with both realizations rank 1. A two-slope object has two retained graded summands; deleting its splitting β identifies different rigidifications and is not the stated category. Rank 0 gives zero realizations on both sides. | Pass, conditional on declared BKF gap |
| 3.1 Analytic lattices | Tate n has filtration jump −n and canonical étale exponent n. Unit self-extensions are parametrized by B_dR/R: class 0 is analytic, class t⁻¹ is nonzero and is not C₀-bar-analytic. A filtration-defined non-CM pair need not have its opposite lattice rational. | Pass |
| 3.2 Crystalline realization | Unit has crystalline rank 1, φ=σ, jump 0. Tate n=1 at p=2 has rank 1, φ=2⁻¹σ, jump −1; at p=3 replace 2 by 3. These agree with the covariant supplier normalization. | Pass |
| 3.3 Open image | Unit image {1} is open in its actual group {1}. Tate cyclotomic image is an open subgroup of G_m(Q_p), including p=2. Strict-field inertia is the whole Galois group of that strict base; openness is retained as a supplier obligation. | Pass, conditional on openness gap |
| 3.4 CM criterion | Unit group 1 is a rank-zero torus; Tate group G_m is rank one. G_a has central zero cocharacter and is commutative, but the extension class t⁻¹ mod R≠0 violates analyticity. Thus commutativity alone does not imply toricity. | Pass |
| 4.1 Rigid subdiamonds | Q_p-disc origin has residue degree 1; a transcendental C-coordinate has infinite residue degree and is not an L-rigid point. Cusp ring lacks u while its seminormalization contains u. Over F₂((u)), T↦T² becomes a diamond isomorphism; an analytic inverse would give 2 ord_T(f)=1. | Fails: S02 |
| 4.2 Local systems | Ranks 0,1 give frame groups 1 and Λ×. Sign character has monodromy {±1} rather than {1}, despite equal geometric ranks. A line bundle descends étale locally; O(1) over a p-adic point has no nonzero untwisted invariant section after any finite extension, so cannot descend as an analytic line. | Pass in the intended period base setting |
| 4.3 Integrality | Coordinate ξ⁻¹ has valuation −1 and fails integrality; 0 has valuation +∞ and passes; ξ has valuation 1 and passes. Empty/unit ideals give whole/empty zero loci. Lifting successive defining ideals through the surjective quotient produces the same combined vanishing locus. | Pass |
| 4.4 Relative bilattices | Rank-one exponent a gives trace jumps −a,a. For the lifted disc extension, z=0 gives exponents [0,0], z=1 gives [−1,1]; determinant valuations remain 0. In degree i, changing ξ to uξ multiplies the trivialization by u^i, so the twist cannot be discarded. | Pass |
| 4.5 Relative goodness | G_a disc extension: at z=1, ambient type [−1,1] versus graded type [0,0], so exactness fails; at z=0 both are [0,0]. Constant diagonal cocharacter families have matching trace ranks and split exact sequences. | Pass |
| 4.6 Trivial-filtration functor | Filtration jump a=−1,0,1 gives lattice exponents 1,0,−1. At a point this equals the canonical lattice; the unit gives R on both sides. The proposed opposite sign disagrees already at a=1. | Pass |
| 4.7 Filtered flat comparison | On a disc, F¹=F²=span(e₁+ze₂) has ∇(e₁+ze₂)=e₂ dz∉F¹⊗Ω, violating transversality. With only F¹ and F⁰=V, the same derivative lies in F⁰⊗Ω and passes. Unit comparison has rank 1 and identity horizontal map. | Pass |
| 5.1 Grassmannians | G_m/L has one type-a cell Spd L; base change gives Spd L′. G_a has nonzero ξ⁻¹ mod R in Gr, but its sole good cocharacter cell is 0. Reductive specialization is the supplied Grassmannian. | Pass |
| 5.2 Subgroup immersion | Character χ=2, compensating factor χ⁻¹=1/2: product 1 fixes the chosen vector; using 2 twice gives 4≠1. Identity embedding has quotient a point. G′/G, not G/G′, is the representable quotient used. | Pass, observable refinement declared |
| 5.3 Schubert geometry | G_m cell has dimension 0. GL₂(1,0) gives proper P¹. For (2,0), the boundary (1,1) has total 2=2 and largest part 1<2; thus the cell is not closed although its bound is. | Pass |
| 5.4 Faithful cutout | Faithful G_a representation detects exponents [1,−1] outside bound [0,0]. The trivial representation sends both objects to exponent 0 and cannot detect the failure. Hence the faithful condition is essential. | Pass |
| 5.5 Rigid-source BB | G_a has only the zero rigid-source point under BB, while Gr has geometric ξ⁻¹ mod R≠0. Rank-one type a has one point on each side over its reflex base. A two-step varying line fails the transversality calculation of 4.7. | Pass |
| 5.6 Adjoint bound | Mirabolic cubic weights {0,1,−2} have maximum 1 and pass the upper bound; inverse weights {0,−1,2} have maximum 2 and fail it. For GL₂(1,0), weights {−1,0,1} meet both bounds. | Pass |
| 6.1 Neutral families | At a point, rank and lattices equal the point category. On two points a fixed map a restricts to (a,a); the pair (0,1) is not such a map. Genuine isocrystal monodromy is nontrivial whereas the neutral datum has trivial global monodromy. | Pass |
| 6.2 Family Tannakian | Unit endomorphisms remain the diagonal Q_p even on two components, not Q_p×Q_p. A nonzero fixed linear map remains nonzero at a geometric fibre, proving the tested faithfulness. Empty base has no such fibre and is explicitly excluded. | Pass |
| 6.3 Canonical reduction | Constant unit/Tate groups are 1/G_m. For a quadratic norm-one torus, Q_p×/N(E×) has order 2 while H¹(Q_p,SL₂)=1: the kernel has two classes. Thus one neutral component cannot neutralize the other. | Pass, canonical-reduction gap declared |
| 6.4 Rigid-base type | Constant Tate exponent n stays n under pullback and has constant rank 1. The z/ξ jumping example has types [0,0] and [−1,1] over C_p; C_p is not discretely valued and fails this theorem's base hypothesis. | Pass, arbitrary-field criterion declared |
| 6.5 Admissible locus | b=1 and standard lattice give modified slope 0. Torus original bundle slope 1 with exponent 1 gives 0; exponent 0 gives 1 and is excluded. Distinct frame scalars 1,p give distinct rigidifications before quotient. | Pass |
| 6.6 Nonemptiness/points | Matching torus b,type gives a rational point over the reflex field; wrong slope/type gives no points. The trivial group has one point over the ground field. The integral Kottwitz test is stronger than equality of rational images. | Pass |
| 6.7 Connected products | Two point diamonds give one-point product and H⁰=F_ℓ⊗F_ℓ=F_ℓ, dimension 1. A disjoint two-point factor gives dimension 2 and two product components, failing connectedness. Empty factor gives H⁰=0 and is excluded. | Pass |
| 6.8 Connected admissible loci | Matching torus cell has one geometric component; incompatible datum has zero components and violates nonemptiness. G_a over its unique good type has a singleton cell. | Pass |
| 7.1 Neutral Hodge families | Unit weight 0/lattice R; Tate n weight −2n/lattice Fil⁻ⁿ. Sign variation has monodromy −1 rather than 1, so has no global rational frame. A nontrivial isocrystal frame torsor has no section although each fibre does. | Pass |
| 7.2 Hodge Tannakian | Fixed unit endomorphisms are Q_p; unit/Tate groups are 1/G_m. Zero object has rank 0, and kernels in a split rank-two unit sequence have rank 1 on every fibre. Finite nontrivial monodromy lies outside the neutral datum. | Pass |
| 7.3 Hodge domain | Matching torus type gives one point; upper-Borel inverse invariant (1,0) has root slope 1≠0 and admits no B-basic datum. Tate Newton slope −n gives weight −2n, not −n. | Pass |
| 7.4 Hodge–Tate lines | Filⁿ⊂Filᵃ iff n≥a: (n,a)=(1,0) true, (−1,0) false, (0,0) equality. The matching Tate line has equality and whole-base locus. A single integral line imposes no integrality on a complementary nonintegral line. | Pass |
| 7.5 Rigid closedness | In a rank-two flag [a:c], incidence with the fixed e₁-line is c=0; [1:0] passes, [1:1] fails. The ideal (c) gives the represented closed locus and remains closed under scalar extension. | Pass |
| 7.6 Special Hodge domains | Torus has no roots and dimension 0. A root weight −2 violates ≥−1 although it satisfies ≤1. Identity inclusion with bound ≥−1 gives the full domain; its dimension equals the ambient dimension. | Pass |
| 8.1 Hodge lines | Tate φ=p⁻ⁿ, L_et=Filⁿ gives equality. At n=−1, Fil⁻¹⊂R is false whereas R⊂R is true. Moving b but not its line changes the condition; moving both preserves its transported inclusion. | Pass |
| 8.2 Functoriality | Identity data send L to L. Take b_H=1 and σ(g)≠g: required b_G=gσ(g)⁻¹ differs from ordinary conjugate g1g⁻¹=1. Composing (f₁,g₁),(f₂,g₂) gives g₂f₂(g₁), with the same σ-relation. | Pass |
| 8.3 Subgroup loci | In the upper-Borel negative-control, ambient point [1:1] is admissible while the e₁ subobject has modified slope −1, not 0. Norm-one-torus kernel has two H¹ classes, so the full line locus requires a neutral-piece selection. | Pass |
| 8.4 Special admissible spaces | Matching torus datum gives one point and vacuous root bounds; incompatible slope gives ∅. Root weight 2 violates the upper bound 1 and is excluded from rigid Hodge-specialness. | Pass |
| 8.5 LT special points | Matching torus slope −a/type a gives one point; mismatch gives ∅. Quadratic F⊂D: dimensions dim D×−dim F×=4−2=2=dim_Qp P¹(F). Ramified/unramified F, p=2, have the same degrees and dimensions. | Pass |
| 8.6 Borel/parabolic tests | Opposite Borel data have Hodge/HT dimensions 0/1 versus 1/0. The GL₃ example has entry/minor valuations −1,−1 and determinant valuation 0, hence constant type [1,0,−1]; its Levi type changes from zero at z=0 to [1,−1;0] at z=1. | Pass |
| 9.1 Infinite-level moduli | G=1 gives one point. G_m frames 1,p are distinct; Q_p×/Z_p×=Z via valuation, so their level coordinates are 0 and 1. Thus fixing the lattice alone does not fix the moduli point. | Pass |
| 9.2 Period maps | Tate exponents are n and −n in the opposite frames; diagonal tuples change to their negatives. Nonbasic diag(p,1) centralizer dimension 2 differs from GL₂ dimension 4, precluding the basic torsor identification. GL₂ minuscule flags are P¹ on both sides. | Pass |
| 9.3 Infinite-level functoriality | Identity datum sends every frame to itself. Torus period dimension is 0 but frame fibre Q_p× is nontrivial. A σ-frame change acts through the twisted centralizer equation, not ordinary conjugation. | Pass |
| 9.4 Special notions | Torus satisfies both bounds. Cubic mirabolic weights 0,1,−2 satisfy ≤1 but not ≥−1; sum 1+1−2=0 in coinvariants for both ramification possibilities. GL₄(1,1,0,0) restricts to a nonreductive parabolic with weights in {−1,0,1}. | Pass |
| 9.5 Minuscule agreement | For GL₄ type (1,1,0,0), all differences are −1,0,1, hence any subgroup's retained adjoint weights satisfy both bounds. Cubic mirabolic minimum −2 fails minuscule and distinguishes the three notions. | Pass |
| 9.6 Basic duality | Torus exponent n becomes −n and then n. For the noncommuting matrices in 1.6, b⁻¹σ_b(x)=σ(x)b⁻¹ has upper entry −2 on both sides; untwisted inversion would give a different frame. | Pass |
| 9.7 Domain connectedness | A torus domain and its inverse admissible cell each have one geometric component. For G=1 both are the base point. Incompatible data produce ∅ and are outside the asserted nonempty setup. | Pass |
| 10.1 Generic loci | Constant family relative to its actual group has exceptional set ∅. Two CM points can have groups T₁,T₂ proper in GL₂ but generated group GL₂; neither point is generic. One-point family gives equality of its group with the ambient group iff it is generic. | Pass |
| 10.2 Countable closedness | Unit has exceptional set ∅. Laurent monomials x^(−i),…,x^i span dimension 2i+1; exterior degree 0 is a unit line. P¹(Q_p) is compact and uncountable, unlike discrete N; image {pⁿ:n≥1} misses its limit 0 and is not closed. | Pass |
| 10.3 Dense classical genericity | Infinite residue: a nonzero reduced denominator polynomial is nonzero at some residue point, giving an L-point in every rational Gauss neighbourhood. Finite residue q: |x^q−x|≤|π| at all integral L-points, but Gauss norm is 1; |π|≤|x^q−x|² separates the Gauss point. | Pass |
| 11.1 Analytic closures | In the G_m tower U_n=1+p^nZ_p, n≥2, ∩U_n={1}; ∩(U_n∪pU_n)={1,p}; closure U_m=U_m. Empty subset has closure ∅; empty container-index family gives all M. All calculations persist at p=2. | Pass |
| 11.2 Special closedness | A torus special component is a point, cut out at all congruence levels by the corresponding coset. The cubic mirabolic upper-bound-only component is Hodge-special, so opposite specialness is not silently inferred. Inner-form levels use H_b, not H. | Pass |
| 11.3 Component intersection | Compatible torus cosets through 1 have intersection {1}; their selected connected components are exactly those same points. With no qualifying target the index is empty and the intersection is M, outside this nonempty-index assertion. | Pass |
| 11.4 Submersion | GL₂ one-step flag has dimension 1: full differential rank is 1; rank 0 would yield a transverse nonzero local coordinate vanishing on an open rational group orbit. Torus flag has dimension/rank 0/0 and no transverse coordinate. | Pass, declared orbit/openness/de Rham inputs |
| 11.5 Ax–Lindemann | Inverse cubic weights 0,−1,2 satisfy the lower bound but not the upper; its HT closure can be itself without becoming special. GL₂ minuscule weights ±1,0 satisfy both. Empty index gives every component of M, not one selected component. | Pass, conditional as stated |
| 11.6 Minuscule theorem | Point [1:c], c∈L\E, is cut out by X₁−cX₀ over L and lacks an E-model as that embedded point. GL₄ parabolic has weights −1,0,1, so reductivity is unnecessary. Torus flag dimension 0 gives the CM case. | Pass, conditional as stated |
| 11.7 Period density | Relative to the actual torus group, flag dimension and image dimension are both 0. Artificial enlargement to GL₂ introduces flag dimension 1 and is not the theorem's actual-group input. Basicness is not used in this flag-only argument. | Pass, conditional as stated |
| 11.8 Ordinary boundary | b=diag(1,p), μ=(0,−1): Newton root −1, adjoint weight +1, Hodge/HT flag dimensions 1/0. x=0,1 yield distinct flags [0:1],[1:1] and identical HT point. Opposite diagonals instead give Hodge dimension 0. | Pass |
| 12.1 Variations | Unit monodromy 1, weight 0; Tate weight −2n. At p=7 an unramified cubic character has image μ₃ of size 3, not {±1} of size 2; the intended quadratic example has image {±1}. | Fails: S01 |
| 12.2 Frame cover | Trivial basic line has rational fibre Q_p×. Integral reduction has Z_p× and valuation image {0}; full rational cover has valuation image Z. Nonbasic data retain a nonconstant automorphism kernel and fail the basic frame hypothesis. | Pass, Igusa extension declared |
| 12.3 Igusa obstruction | Z₂× and Z₃× are infinite nondiscrete profinite groups; their infinite frame fibres cannot be discrete zero-dimensional rigid étale fibres. Trivial-monodromy one-point reduction has a rigid fibre and is not a counterexample. | Pass, monodromy gap declared |
| 12.4 Hodge-type application | Arithmetic action identifies (x,y) with (γx,γy); omitting Γ distinguishes points that should coincide. For Γ=1 the expression reduces to the local moduli space. The stated result retains the completed reflex base and the uniformization hypothesis. | Pass, uniformization gap declared |
| 12.5 Shimura products | Ram(D)={p,ℓ} gives Ram(B)={∞,ℓ}; local invariants at (p,∞) swap (1/2,0)→(0,1/2). Extra ramification {q,r} fails two equalities. Products n=0,1,2 have dimensions 0,1,2; product Γ gives the product of the two quotient factors. | Pass |



**Suggested.lean declaration/context inventory.** There are no declarations, section variables, instances, local definitions or theorem binders. The declaration table therefore has zero rows. The sole import is `Mathlib`, and the namespace is `TauCetiRoadmap.AdmissiblePairsAndPadicHodgeStructures`. There is no declaration to submit to a one-tactic padding probe or to `#check @name`; no Lean process was run. This is an empty acceptance file justified by its missing-carrier inventory, not an elaboration certificate.

The 23 headline groups in the module docstring were matched to the README. The missing carriers are substantial constructions, rather than a few native predicates or elementary structures. The table records the acceptance-test disposition; the source mathematics is tested in the numbered-target table above.

| README headline | Suggested.lean line | Required carrier absent from the pins / disposition |
| --- | --- | --- |
| §0.4 exactness criterion | 10 | Exact tensor category of G-bilattices and trace functors; named as not statable. |
| §§0.5,5.6 BB recovery and weight criterion | 11 | Good G-cells and BB morphism; named as not statable. |
| §1.2 Levi invariance | 12 | Connected-linear G-isocrystals and B(G); named as not statable. |
| §§1.5–1.6 basic strata/twisting | 13 | Relative bundle v-stack, strata and inner twist; named as not statable. |
| §2.3 pointwise Tannakian theory | 14 | Admissible-pair/Hodge categories and realizations; named as not statable. |
| §2.4 basic-pair equivalence | 15 | Both period-latticed categories; named as not statable. |
| §2.7 rational rigidified BKF comparison | 16 | Rigidified BKF category and modification realization; named as not statable. |
| §§3.2–3.3 crystalline realization/openness | 17 | Good-reduction pairs and their motivic group; named as not statable. |
| §3.4 two-lattice CM theorem | 18 | Period-latticed pairs, rational lattice structures and CM condition; named as not statable. |
| §§4.5,4.7 relative goodness/comparison | 19 | Bilatticed period local systems; named as not statable. |
| §§5.3–5.5 Grassmannian geometry/transversality | 20 | Connected-linear de Rham Grassmannian and BB map; named as not statable. |
| §§6.2–6.4 family theory/reduction/type | 21 | Neutral families and tensor realizations; named as not statable and conditional on the criterion. |
| §§6.5–6.8 admissible loci/existence/connectedness | 22 | Admissible diamond and modification map; named as not statable. |
| §6.7 connected products | 23 | Diamonds, cohomological smoothness and fibre products; named as not statable. |
| §§7.2–7.6,8.1–8.4 domains and closed loci | 24 | Neutral Hodge families and period-line/subgroup loci; named as not statable. |
| §§9.2,9.6–9.7 two torsors/duality/connectedness | 25 | Infinite-level modifications with both frames; named as not statable. |
| §9.5 minuscule specialness | 26 | Special subgroup images in the two structures; named as not statable. |
| §§10.2–10.3 exceptional locus/density | 27 | Hodge loci and motivic rigid families; named as not statable. |
| §11.4 period submersion | 28 | Actual period map and canonical motivic reduction; named as not statable. |
| §11.5 general Ax–Lindemann | 29 | Moduli diamond, analytic levels and special subvarieties; named as not statable. |
| §11.6 minuscule Ax–Lindemann | 30 | Both rigid period towers; named as not statable. |
| §11.7 nonbasic period-image density | 31 | Frame torsor and flag morphism; named as not statable. |
| §§12.2–12.5 frame cover/applications | 32 | Variations and compatible local/global period towers; named as not statable. |

**Pinned-library checks.** Fourteen explicitly cited declarations were located and their hypotheses read. These are imported inputs, not duplicate acceptance targets.

| Pinned declarations | File/line and context actually checked | Computation or limit |
| --- | --- | --- |
| `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv` | `Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, `:132`, `:138`; characteristic-p perfect field, modules over the Witt fraction field, semilinear automorphism | The class has no finite-rank field; rank one is an additional classification hypothesis. |
| `WittVector.StandardOneDimIsocrystal`, `.frobenius_apply`, `WittVector.isocrystal_classification` | Same file `:157`, `:172`, `:180`; classification assumes algebraic closure and finrank=1 | Standard exponent m gives p^mσ; m=−1 at p=2 gives 2⁻¹σ. Rank 2 fails the classification theorem's rank hypothesis. |
| `dense_iInter_of_isOpen`, `nonempty_interior_of_iUnion_of_closed` | `Mathlib/Topology/Baire/Lemmas.lean:141`, `:256`; Baire space, countable index, plus nonempty closed cover for the second | Empty space does not satisfy the second theorem's Nonempty instance. A one-point closed cover has one member with nonempty interior. |
| `BaireSpace.of_completelyPseudoMetrizable` | `Mathlib/Topology/Baire/CompleteMetrizable.lean:25`; topological space with completely pseudometrizable structure | No local compactness assumption; complete p-adic field discs meet the used metric hypothesis. |
| `BDeRhamPlus` | `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`; commutative ring, prime p, p nonunit, p-adic completeness | Characteristic-p input has p=0; p-localization is zero. Thus this is not an unconditional geometric DVR theorem. |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138`; field, commutative Hopf algebra, explicit `GrpCat.uliftFunctor` | Reconstructs a given Hopf algebra's points, not the new neutral category. Scalar automorphism a maps a Tate line by a, its inverse line by a⁻¹. |
| `TauCeti.Subcomodule.exists_finite_subcomodule_mem`, `.iUnion_finiteSubcomodules_eq_univ` | `TauCeti/Algebra/Coalgebra/Subcomodule/Finite.lean:144`, `:292`; commutative semiring and free coalgebra module | Every single element is contained in a finite subcomodule; countability of the regular exhaustion uses finite algebra generation separately. |
| `TauCeti.HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer` | `TauCeti/Algebra/AlgebraicGroup/Representation/ExteriorStabilizer/Character.lean:101`; field, commutative Hopf algebra, FG defining ideal, every commutative value algebra | Retains the unique subgroup character and nonreduced test algebras. Exterior degree zero gives the unit line with full stabilizer. |

`TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Quotient.lean:54` defines a topological orbit quotient, with its topology at line 60; it does not construct the sheafed curve or the period categories. Native Hodge modules are the classical complex Hodge theory under `TauCeti/Geometry/Hodge/`, not the two-lattice p-adic objects. Searches by object and construction, as well as by the candidate names, found no native replacement for the missing headline carriers. There are no local Lean names to collide with sibling declarations.

**Supplier content and ownership.** The following table records the inspected contracts. Paths with a `TauCetiRoadmap/` prefix refer to the current main or current new-roadmap head selected by the service, not an old repair report. The supplied sibling checkouts and board packages were also searched by period-lattice, admissible-family, frame-torsor, Tannakian, Grassmannian and Igusa objects. Matches for “admissible pairs” in K3BlochGroups, HabiroCohomologyFoundations and GrossZagierAndArithmeticHeights concern different objects. The core two-lattice categories and bi-analytic closure theorem have no competing owner in those inputs.

| Supplier | Resolved content / hypothesis comparison |
| --- | --- |
| RelativeFarguesFontaine | §§4.10–4.12 give degree-one completions and intrinsic Cartier powers; §§6.6–6.9 give meromorphic finite-projective gluing, exactness and base change; §§7.2,7.4 give tensor transfer. §7.6's reductive scope is explicitly retained. The localized-period descent extension remains declared. |
| ReductiveGroups | Layers 1–3,5,6A,7 give representations, subgroup/quotient machinery and characteristic-zero Levi/vector layers. Layer 6A item 1 explicitly retains the central torus action and does not require a reductive ambient group. The two additional refinements remain declared gaps. |
| HodgeTateAndCanonicalSubgroups | §2.14 supplies exact-filtered-functor splitting for finite-type affine groups, stabilizers and flags. Its generality includes the G_a semidirect example; §5.1 separately supplies S03's existing ordinary tower. |
| AdicSpacesPartII | R1.3 / analytification-functor supplies locally finite-type schemes over complete nontrivially valued rank-one fields and base change; the finite-type flag schemes meet those conditions. |
| PadicPeriodRings | §2 includes arbitrary perfect residue field, completed algebraic closure, invariants and all nonzero twists; §§4.1,4.3 give the cyclotomic uniformizer and fixed coefficient embedding. The required action is on that completion. |
| VStackSheavesAndLisseCategories | §VS4.0 names BunGeometry, BunNewtonGeometry and BunAutomorphisms; the basic/nonbasic automorphism distinction is preserved. |
| BunGAndNewtonStrata | BG0, BG1 §1.13 and BG2/BG3 expose the stated reductive interfaces, sigma-centralizer and full automorphism group. The centralizer satisfies g b=b σ(g); it is an inner form only in the basic case. |
| VectorBundlesAndIsocrystals | VB0/VB1 supply finite isocrystals and sign-reversing bundle realization; VB2 supplies fixed-slope abelianness, classification and Hom/Ext; VB4 supplies pro-étale constant-slope splitting and slope-zero local systems. Fibrewise triviality is not global triviality. |
| ReductiveGroupsPartII | RG2.0 point topology, congruence basis and smooth openness; RG2.1 Steinberg theorem has algebraically closed residue field. Q_p-breve and its strict finite extensions meet the latter requirement. |
| MotivesAndAlgebraicCycles | §§6.1–6.3 distinguish finite from finite-type generation and use characteristic zero for connectedness recognition; §6.8 gives affine tensor-Isom torsors with commuting actions and scalar extension. A rational section is not supplied automatically. |
| DiamondsAndVStacks | D1/D2/D4–D6 supply the specified sites, descent, spaces and comparisons. D3.10 supplies level spaces after perfectoid pullback; D5.10 supplies profinite products in the stated universe. D6.9's Q_p base restriction is lost in the target: S02. |
| HeckeStacksAndLocalShtukas | HS2.12 retains integral Kottwitz equality in admissible/weakly-admissible comparison; HS2.15 supplies reductive arbitrary-type nonemptiness, finite-extension points and connectedness. The nonreductive extension remains local work. |
| AInfCohomology | AI.2.2–AI.2.3 supply valid BKF operations, crystalline rigidification and finite-free classification. No abelianness is imported for the unrigidified finitely presented category; rational rigidified modifications are the stated extension. |
| PadicHodgeTheory | §5.5 gives arbitrary-perfect-residue crystalline functors and tensor torsors; §§7.1,7.4 give associated lattices, uniqueness and coefficient comparison. Tate jump −1 gives tR and φ=p⁻¹. The additional arbitrary-field criterion and strict-field openness are explicitly gaps. |
| AdicSpacesPartIIPartII | The named RZ.0–RZ.6 targets occur in `packages/AdicSpacesPartIIPartII/design/README.md`, including finite-dimensional stratification, infinite-residue Gauss closure, reduced resolution, constant rank and subfield identity. RZ.3 rigid points require L/Q_p, confirming S02. |
| PerfectoidSpaces | P4.15.6 supplies a surjective universal perfectoid quotient and its integral plus model; P6.11 supplies strong closedness. The zero and unit ideals give whole and empty loci. |
| GeometricSatakeAndFusion | GS0's Grassmannian, Schubert bounds, smooth truncated loops and action truncation occur at the named anchors. Split computations descend; the stabilizer uses weights ≤0, agreeing with the target's inverse-type first flag. |
| DiamondSixOperations | S2.4 gives lower-shriek base change/projection formula; S3.2 and S4.2–S4.3 give duality and smooth pullback. The target retains separatedness, compactifiability, local finite target dimension and ℓ≠p. |
| EndoscopicTransferAndUnitaryTraceComparison | §§12.5,12.11 give the actual two period maps and basic EL duality; inverse transpose remains in the LT/Drinfeld action convention. |
| IgusaVarietiesAndTorsionConcentration | IG.1 supplies perfect Igusa moduli/actions. It does not itself make the added crystalline-frame comparison; the gap should reuse the earlier ordinary tower and monodromy, S03. |
| PerfectoidShimuraVarieties | §2.2 gives the open Hodge-type tower over C with small tame level; §§3.1,3.5 keep the right-action convention and its conversion by inversion. Completed-unramified basic uniformization is an additional declared contract. |
| HilbertModularVarietiesAndShimuraCurves | R18.5.7,15,20,21 retain the exchanged quaternion invariants, arithmetic component stabilizers, actual module/level comparison and full central-twisted descent. The package now retains the away-p invariants. |
| AdicSpaces | Layer 6 constructs the sheafed curve from its period charts; the native topological quotient alone is not substituted for it. |
| AlgebraicVectorBundles | L0A–L0C and L2A–L2B provide finite-locally-free tensor, dual, exterior and geometric bundle comparisons; this is distinct from the relative period descent extension. |
| AlgebraicModularFormsAndSerreWeights (S03 owner) | R15.3 / The Igusa interpretation owns the full unit monodromy and small-prime construction. It precedes this package, as does HodgeTateAndCanonicalSubgroups. |

The nine slugs in the README are present with matching `needs` sentences and named suppliers in the plan. None has supplier `none`. Eight requests isolate missing interfaces rather than replacing a supplier theorem; the ordinary Igusa request needs S03's minimality repair. The contracts for BKF modifications, canonical reduction, strict-field openness, orbit differentials, observability, localized-period descent, arbitrary-field de Rham comparison and basic uniformization are not reported as missing merely because their suppliers have not implemented them. The specific mathematical hypotheses of the de Rham criterion and the retention of the arithmetic quotient are explicit.

## Not verifiable

- No Lean build or elaboration was run, as required. There is no named local declaration, so the requested elaborated-signature audit has an empty domain; there is no inferred-binder result to claim.
- The declared supplier extensions remain mathematical obligations. This review verifies their registration and the use of their hypotheses, not their truth or implementation. The Igusa registration additionally needs S03's ownership repair.
- AdicSpacesPartIIPartII is available here as an earlier board design, not as a main/open roadmap returned by the service. Its cited targets were checked in that design; no nonexistent main-file witness is asserted.
- No missing primary text was encountered among the five manifest works. References cited only inside those works were not independently certified as separate sources; in particular, the prior claim about the sufficiency of Scholze–Weinstein Corollary 17.1.9 for localized B_dR descent is not reasserted as a source error without checking that text. The package already declares the relevant supplier obligation.

## Source issues

- **Error** in HKI at Proposition 3.1.7(2), printed pp. 22–23 (HKI line 1047): the source says infinite-order uniformizer scaling suffices for invariant-lattice recovery; it should be supplemented by vanishing of all nonzero twisted coefficient invariants, excluding the invariant u/t example; affects a stated result.
- **Misprint** in HKI at Lemma 4.3.1 proof, printed p. 34 (HKI line 1610): the source says the quotient for M₁⊂M₂ is M₁/M₂; it should be M₂/M₁; affects the proof.
- **Misprint** in HKI at Lemma 4.3.2 proof, printed p. 35 (HKI line 1628): the source says the bundle of p-adic weight λ has slope λ/2; it should be slope −λ/2 throughout those inequalities; affects the proof.
- **Misprint** in HKI at §4.4 isocrystalline realization, printed p. 36 (HKI line 1690): the source says weight w uses Hom from O(w/2) and D_(−w/2); it should be Hom from O(−w/2) and D_(w/2), with the corresponding division-algebra tensor; affects a stated result.
- **Misprint** in HKI at §4.4 weight comparison, printed p. 36 (HKI line 1694): the source says weight equals −2 times the isocrystal slope; it should be +2 times that slope, giving weight −2 for the slope −1 Tate object; affects a stated result.
- **Misprint** in HKI at Theorem 5.1.6 proof, printed p. 42 (HKI line 1960): the source says weight w is obtained from the isocrystal summand of slope −w/2; it should be the summand of slope w/2; affects the proof.
- **Misprint** in HKII at §1.1 before Definition 1.1.2, printed p. 5 (HKII line 219): the source says to intersect V with C when checking equations on an affinoid open U; it should be V intersect U; affects nothing.
- **Misprint** in HKII at §2.3 de Rham ring definition, printed p. 16 (HKII line 744): the source says the completed Witt ring is formed from R⁺; it should be formed from R⁺-tilt, consistently with the Fontaine map and the next displayed description; affects a stated result.
- **Misprint** in HKII at §5.1 observable embedding, printed p. 33 (HKII line 1488): the source says the homogeneous quotient for G⊂G′ is G/G′; it should be G′/G; affects the proof.
- **Misprint** in HKII at Proposition 6.2.3 proof, printed p. 37 (HKII line 1686): the source says weight 2ν produces isocrystal slope morphism 2ν; it should be slope morphism ν; affects the proof.
- **Gap** in HKII at Theorem 7.2.3 proof, printed p. 42 (HKII line 1938): the source says Liu–Zhu's de Rham criterion applies over its arbitrary p-adic base; it should be justified by an arbitrary-perfect-residue-field criterion, since LiuZhu line 86 assumes a finite extension of Q_p; affects the proof.
- **Misprint** in HKII at Proposition 7.3.3 statement, printed p. 43 (HKII line 1969): the source says the rigid point proving admissible nonemptiness belongs to the ambient Grassmannian; it should be specified as an admissible point, as supplied by the following comparison argument; affects a stated result.
- **Error** in HKII at Remark 7.5.3, printed p. 47 (HKII line 2137): the source says ambient admissibility pulls back to subgroup admissibility for every closed subgroup; it should be tested on subgroup tensor subquotients and the neutral fibre-functor piece; the upper-Borel example separates these conditions; affects a stated result.
- **Gap** in HKII at Proposition 7.5.2 proof, printed pp. 47–48 (HKII line 2159): the source says reduction on the full line Hodge locus automatically gives a neutral H-object; it should be restricted to the neutral kernel-of-H¹ piece, which is a genuine condition for a quadratic norm-one torus in SL₂; affects the proof.
- **Misprint** in HKII at Definition 8.4.1, printed p. 52 (HKII line 2347): the source says its conjugating parameter belongs to Q_p-breve; it should be an element of G(Q_p-breve); affects a stated result.
- **Error** in HKII at Remarks 7.5.3 and 9.1.4, printed pp. 47 and 56 (HKII lines 2142 and 2503): the source says the upper-Borel data diag(p,1), μ=(−1,0) give the positive-dimensional ordinary family with constant Hodge–Tate flag; it should be diag(1,p), μ=(0,−1) in the matching Tate normalization; affects a stated result.
- **Misprint** in HKII at Theorem 9.1.3 proof, printed p. 57 (HKII line 2573): the source says the Hodge–Tate level is refined using H(Q_p); it should be the conjugated inner-form subgroup H_(b_H)(Q_p) inside G_b(Q_p); affects the proof.
- **Error** in HKII at Lemma 9.3.3, printed p. 59 (HKII line 2652): the source says full restricted motivic group is equivalent to meeting the generic locus for every subdiamond; it should be only the forward implication generally; two exceptional CM points can jointly have full group; affects a stated result.
- **Misprint** in HKII at Lemma 9.3.5, printed p. 60 (HKII line 2713): the source says weakly Shilov points are defined in Bhatt–Hansen Definition 2.4; it should be Definition 2.5, BhattHansen line 314; affects nothing.
- **Misprint** in HKII at Lemma 9.3.5 proof, printed p. 60 (HKII line 2734): the source says the residue field is algebraically closed; it should be infinite, which suffices for the Gauss-point argument and follows from the stated base assumptions; affects nothing.
- **Error** in HKII at §10.1 Katz–Igusa discussion, printed p. 64 (HKII line 2885): the source says the rational crystalline-frame cover equals the integral Igusa tower; it should be the extension of its Z_p× reduction to Q_p×, retaining valuation components indexed by Z; affects a stated result.
- **Misprint** in Scholze at Lemma 7.8 proof diagram, printed p. 45 (Scholze line 2064): the source says the kernel of M₀/Fil²→gr⁰M₀ has Tate twist −1; it should be twist +1, as in the preceding exact sequence at Scholze line 2059; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "85772b714a718b3bfcb106f8606bf5eb43585215", "job": "RT-AdmissiblePairsAndPadicHodgeStructures~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
