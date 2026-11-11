<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13130#issuecomment-6788211368 -->
Red team round 1 pass a (codex) of 3489b8d

Verdict: needs_changes

1. **F01** (P3) Acceptance file contains definitional API padding

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean:309`, also lines 151, 192, 419, 457. “The underlying tuple of `b • s`.”

   **Claim:** These separately named theorems belong in the acceptance test.

   **Witness:** `HurwitzFibre.smul_tuple` and `unmarked_smul_mk` are proved by `rfl`; `hurwitzAction_sigma` and `unmarkedGlueSum_smul` each already have a single `simp` proof. `shiftHom_sigma` is the pinned `natAdd_sigma` for positive lengths; length zero has no index. None is a headline theorem.

   **Exact repair:** Delete these five theorem declarations from `Suggested.lean`. Keep their mathematical assertions as prose API bullets or Checks in README §§0.3, 0.4 and 0.7. Inline the definitional equalities or generator/sum simplifications at the supporting definitions that need them; remove the deleted backticked own names from the README. Do not replace them with admitted examples.

   **Repair test:** For the transposition tuple `((12),(23))`, both the tuple action and its generator formula give `((13),(12))`; on conjugacy classes both quotient-action expressions give the same class. For prefix length1 the native index0 becomes1, exactly as natAdd_sigma already states. Deletion changes neither construction nor headline signature.

2. **F02** (P1) The earlier owner still owns the duplicated EVW development

   Re-raised: REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII/F01, discussed in `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/reports/FIX-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~2.md:19`.

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:98–106`, and §§0.4–0.8, 1.1–1.19, 2.2–2.6, 3.1–3.5, 4.1–4.3, 5.1, 5.3. “The two statements have a single owner in the build order”.

   **Claim:** This package can independently plan these targets while ArithmeticStatisticsPartVIII also owns them.

   **Witness:** `merge-order/ORDER.txt:146,224` puts ArithmeticStatisticsPartVIII first. `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md:847–1029`, §5.16, explicitly owns the component ring, K-complex, arc spectral sequence, marked/full stability, cell bounds and general étale bound.

   **Exact repair:** Replace the overlapping targets by imports from “ArithmeticStatisticsPartVIII §5.16”, naming its individual subheadings: “Nonsplitting pairs and the component ring”, “Stability of the component ring”, “The K-complex and its homology bound”, “The arc spectral sequence”, “Homological stability for Hurwitz spaces”, “Finite cell models and the fixed-degree Betti bound”, “Uniform field Betti bound”, “Tor spectral sequences over graded algebras”, and “Uniform Betti numbers of Hurwitz schemes”. Retain only extensions absent there, including non-centreless unmarked stability, with those imports as prerequisites. Replace the ownership paragraph by: “ArithmeticStatisticsPartVIII §5.16 owns the common EVW development. This roadmap imports it and extends the quotient statements to arbitrary finite groups.” Alternatively, an actual ownership transfer requires changing the other owner's targets and merge order before this package is accepted; the present paragraph alone does not transfer ownership.

   **Why re-raised:** The earlier repair says that no edit of this package can settle ownership. The current order already selects an earlier owner, and replacing duplicate targets by citations is an available package-local repair. Its §5.16 “Tor spectral sequences over graded algebras” (lines 890–906) also supplies balance, change of rings and hyperhomology already requested again in gap:dga-graded-tor-spectral-sequences; import those and restrict any remaining gap to the genuinely absent native-functor comparison or long exact sequences. Merely making a future move possible does not perform it. This is an ownership defect even though depcheck reports no graph defect.

   **Repair test:** At `(G,c) = (S₃, transpositions)`, both developments give `dim R₂ = 5`, `U₁ = Σ_t r_t²`, and the same K-differential. The supplier's stability theorem already quantifies over all nonsplitting pairs, with a uniform block length, and its étale theorem already quantifies over all centreless groups, not only generalized dihedral ones. For `G = C₂`, the new unmarked extension remains a genuine extension of its centreless quotient theorem.

3. **F03** (P2) “No single map” contradicts the singleton-class examples

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:148–149`, also 1439–1440. “no single map of spaces ... induces it”.

   **Claim:** The stabilization operator cannot be induced by a single map of spaces, including on the quotient spaces.

   **Witness:** For `G = 1`, `c = {1}`, `U_D = t^D`: its defining sum has one summand, the gluing map `Conf_n → Conf_(n+D)`. Conjugation is trivial. README 641–642 already states this.

   **Exact repair:** Replace the convention by: “In general, U is a k-linear sum of gluing maps, rather than a map of spaces; for a singleton class it is the single gluing map. No algebraic or Frobenius-equivariant stabilization is supplied here.” Replace the §4.5 Check by: “The proof takes coinvariants of the k[G]-linear operator U. Individual gluing summands need not descend to unmarked spaces, although they do when conjugation is trivial.”

   **Repair test:** For `G = C₂`, `c = {s}`, the sum is the one map adding `2D` strands on `Conf_n`, and it descends unchanged to the conjugation quotient. For `S₃`, conjugation permutes the three summands, so it is their sum that descends.

4. **F04** (P2) The realization gap asks for an existing pinned construction

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:305–308`; `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/design/plan.json`, gap `algtop-semisimplicial-realization`. “the thick geometric realization of a semisimplicial space”.

   **Claim:** AlgebraicTopology must supply this construction as missing infrastructure.

   **Witness:** `TauCeti/AlgebraicTopology/FatRealization.lean:89` defines `TauCeti.fatRealization` for every semisimplicial topological space. Lines 95, 151, 167, 193, 204 supply characteristic maps, descent, functoriality and augmentation.

   **Exact repair:** Add the existing `TauCeti.fatRealization`, `TauCeti.fatRealizationFunctor` and `TauCeti.fatRealization.augment` to the pinned supplier contracts. In both gap entries replace the needs sentence by: “For the pinned thick realization TauCeti.fatRealization of a semisimplicial space, provide its skeletal filtration and the natural first-quadrant spectral sequence E¹_(q,p) = H_p(X_q; k) ⇒ H_(p+q)(‖X‖; k), with differential the alternating face sum and convergence on finite diagonals.” Keep the same slug and supplier.

   **Repair test:** If only degree zero is nonempty, the pinned quotient is X₀; for an empty semisimplicial space it is empty. The new contract extends precisely this carrier, and still supplies the spectral sequence needed in §3.4.

5. **F05** (P2) The arc gap repeats an existing cutting target

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:340–342`; `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/design/plan.json`, gap `geomtop-arc-isotopy-extension`. “and cutting a surface along such a system”.

   **Claim:** Cutting compact surfaces along proper arcs must be added to the supplier.

   **Witness:** `TauCetiRoadmap/GeometricTopology/README.md:1252–1260`, §1.7.2, already owns cutting along proper arcs, the cut-surface topology and restriction of diffeomorphisms. Iterating disjoint cuts supplies a finite system.

   **Exact repair:** Cite “GeometricTopology §1.7.2, Cutting” for cutting and its compatibility with diffeomorphisms. Remove the cutting clause from the README and plan gap entries; retain the request for relative isotopy extension for finite arc systems with its existing hypotheses.

   **Repair test:** Cutting the annulus along a spanning proper arc changes χ from 0 to 1 and gives a disc; a further disjoint proper cut is an iteration of the same existing target. No additional cutting carrier is requested.

6. **F06** (P1) The connectivity induction uses arc complexes outside its stated domain

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:1188–1195`. “arc complexes of the cut surfaces ... by induction”.

   **Claim:** Induction on §2.6, stated only for a disc with one boundary starting point, supplies the connectivity of every factor after cutting a bad simplex.

   **Witness:** HW10 lines 1659–1663 uses A(Sᵢ; Δᵢ, Λᵢ), with multiple copies of boundary starting points after cutting. §2.2 defines only A(D; {∗}, P); no local target or declared supplier covers the larger family.

   **Exact repair:** Before the disc specialization, add named targets defining F(S; Δ, Λ) and A(S; Δ, Λ) for a connected surface with a boundary circle, a nonempty finite Δ on that circle and a finite interior set Λ. State F contractible for |Λ| ≥ 1 and A Cohen–Macaulay of dimension |Λ|−1, including the empty-set convention, citing HW10 Lemma 7.1 and Proposition 7.2. Run the bad-simplex induction in that family, explicitly verifying the cut-surface hypotheses. Then obtain §2.6 by S = D and Δ = {∗}. Import these targets instead if the earlier owner of R02 supplies them.

   **Repair test:** Cutting along a boundary-to-interior arc separates its two boundary sides and produces distinct copies of ∗ on the new boundary. The original one-start-point definition excludes this input; the enlarged finite-Δ family includes it. With one remaining endpoint and two starting points, A has at least two vertices and is nonempty, which is exactly the induction's −1-connectivity requirement.

7. **F07** (P1) The finite-quotient supplier drops its free-action hypothesis

   **Location:** `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md:299–302`. “homology of a quotient by a finite group with coinvariants”.

   **Claim:** AlgebraicTopology Stage 5, item 3 supplies this comparison for the nonfree actions used here.

   **Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:1959–1965` requires a surjective regular covering and a deck action simply transitive on fibres. The S₃ action on the constant transposition tuple has stabilizer C₂, so fails that input contract.

   **Exact repair:** Replace that supplier clause by: “For a surjective regular covering with a free finite deck-group action, the Cartan–Leray spectral sequence and, when the group order is invertible, the homology coinvariant comparison (AlgebraicTopology Stage 5, item 3). The nonfree Hurwitz quotient comparison is proved in §4.4 using its permutation-module argument.” Keep §4.4's explicit nonfree comparison as an owned extension rather than pretending it is this supplier's theorem.

   **Repair test:** For S₃, c the transpositions and n = 2, the supplier's free-action theorem remains inapplicable, while the actual permutation-module calculation gives dimensions 5 for marked H₀ and 2 for both its G-coinvariants and quotient H₀. For a genuinely free regular two-sheet cover the supplier applies unchanged.

## Verified sound

Read all 1651 lines of README and all 533 lines of Suggested.lean. There are **40 actual declarations**, including **2 admitted headline theorems**, and **46 numbered README sections with 47 target/Check blocks** (two in §2.1). The supplied scanner's count of 41 includes the text “class `c`” inside the HurwitzFibre docstring; it is not a declaration. All 40 real elaborated signatures were compared with the declaration bodies and README. No lost section binder was found. In particular, the finite-group instance, field instance and nonvanishing group-order hypothesis occur in both headline signatures; their constants precede the field quantifier.

Read all **154 Check bullets**. The computed records below cover their mathematical tests; narrative restrictions such as “no degeneracies” and “no flatness” are treated as scope assertions, not counted as independent numerical tests. The existence of a third discriminating Check was audited for each definition-bearing section; no additional count defect was found. The questionable pairwise/simultaneous arc sentence is recorded under Not verifiable, not certified as a negative example.

**Headline audit.** The end results are marked/full/unmarked homological stability, uniform topological Betti bounds, uniform étale Betti bounds, stabilization from low K-homology, and arc-complex connectivity. The first two have the actual braid-group homology signatures, with both Bool values and both fibres. The other three are individually named in the module docstring with their missing constructions. The elementary tuple and quotient definitions use existing carriers and contain no admitted data. No further statable headline omission was established. The five API equalities in R01 are nevertheless padding.

**Pins and imports.** The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The file imports Mathlib once and the existing `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`. It contains no `lemma`, `set_option`, admitted data, arbitrary Prop field, `#eval` or roadmap import. The git diff at the reviewed head lists five files, all inside this package. No Lean command, build, git write or external post was run.

### Declaration ledger

Notation for context: **G*** means `G : Type u` with `[Group G]`; **G₀** means `G : Type` with `[Group G]`; **F** additionally means `[Fintype G]`; **k** means `k : Type` with `[Field k]`. In fibre rows, `c : ConjClasses G`, `full : Bool`, and all lengths are natural numbers. All declarations are in `TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroupsPartII`; section and line numbers refer to Suggested.lean. “Retain” below means no truth/signature defect found in the tested instances, subject to the ownership findings.

| Declaration; section; line | Actual variable/instance context | Instances and computed values on both sides | Result / change |
|---|---|---|---|
| IsNonsplitting; Layer 0; 49 | G*, c; no finite instance | G=1: closure={1}=top, intersection={1}; S₃ transpositions: intersections have sizes 3,0,1,0; C₆ involution: generated order 2≠6; S₄ commuting-transposition subgroup: two distinct singleton conjugacy classes | Correct positive/negative predicate; ownership R02 |
| hurwitzMoveFun; BraidAction; 62 | G*, n, i:Fin(n−1), tuple | n=2, ((12),(23))↦((13),(12)); product (123)=(123); plain swap product (132)≠(123); n=0,1: Fin(n−1) empty | Retain |
| hurwitzMoveInvFun; BraidAction; 67 | Same | ((12),(23))↦((23),(13)); positive after inverse gives ((12),(23)); inverse after positive gives ((12),(23)) | Retain |
| hurwitzMove; BraidAction; 74 | Same | At n=2 both compositions of its forward/inverse maps are identity on all nine S₃ transposition pairs; a constant pair is fixed | Retain |
| hurwitzMove_comm; BraidAction; 95 | G*, n; i,j and gap≥2 | n=4, tuple (a,b,a,b), a=(12),b=(23): moves 0 and 2 in either order give ((13),(12),(13),(12)); adjacent 0,1 are excluded | Retain |
| hurwitzMove_braid; BraidAction; 124 | G*, n; i+1=j | n=3, (a,b,a): 010 and 101 both give ((23),(13),(12)); n<3 admits no adjacent-generator pair | Retain |
| hurwitzAction; BraidAction; 144 | G*, n; native B_n | Generator on (a,b) gives ((13),(12)); identity braid gives (a,b); B₀ and B₁ act trivially | Retain |
| hurwitzAction_sigma; BraidAction; 151 | G*, n,i,tuple | Both expressions give ((13),(12)); the file's proof is one simp | Delete, R01 |
| hurwitzAction_iff; BraidAction; 156 | G*, predicate P; generator iff hypothesis | P=“generates S₃”: on (a,b) both true, on (a,a) both false; a generator-invariant false predicate gives false↔false; n=0 gives P(∅)↔P(∅) | Retain supporting proof |
| hurwitzAction_comm; BraidAction; 169 | G*, n,m, φ, braid hom f; generator compatibility | φ=id,f=id gives (13,12)=(13,12); prefix one a and shifted generator gives (a,13,12) on both sides | Retain supporting proof |
| shiftHom; BraidAction; 187 | m,n only | m=1,n=2: native σ₀↦σ₁; m=0: σ_i↦σ_i; n=0: unique map 1→B_m | Retain |
| shiftHom_sigma; BraidAction; 192 | m,n,i:Fin(n−1) | m=1,n=2,i=0 gives σ₁=σ₁; n=0 has no i; native natAdd_sigma covers the positive-length branch | Delete native-lemma adapter from acceptance file, R01 |
| hurwitzAction_shift; BraidAction; 199 | G*, prefix t, braid b, tail s | t=(a),s=(a,b),b=σ: shifted action gives (a,13,12)=append(a,(13,12)); empty prefix gives ordinary action; empty tail is unchanged | Retain |
| hurwitzMoveFun_mem_iff; Layer 0; 225 | G₀,c,n,i,tuple | Transposition pair: true↔true; (1,a): false↔false, with image (a,1); both directions exclude an identity entry | Retain |
| closure_range_hurwitzMoveFun; Layer 0; 250 | G₀,n,i,tuple | (a,b) and (13,a) generate S₃ of order6; (a,a) and its image generate C₂ of order2 | Retain |
| HurwitzFibre; Layer 0; 280 | G₀,c,full,n | S₃,n=2: false fibre9, true fibre6; n=0: false fibre1,true fibre0; G=1,n=0: both1; no product-one restriction | Retain |
| hurwitzFibre_prop_iff; Layer 0; 289 | G₀,c,full,b,tuple | At (a,b) full condition true on both sides; at (a,a), full=true false on both sides and full=false true on both sides | Retain |
| HurwitzFibre.instMulAction; Layer 0; 299 | G₀,c,full,n | σ³ fixes each of nine n=2 transposition pairs; σ fixes three constant pairs; identity action returns each tuple | Retain |
| HurwitzFibre.smul_tuple; Layer 0; 309 | G₀,c,full,b,fibre point | Both tuple projections are (13,a) for σ•(a,b); proof rfl | Delete, R01 |
| glue; Layer 0; 313 | G₀,c,full,m,g∈c,point | m=2,g=a,s=(a,b): result(a,a,a,b), still generates6; m=0 returns s; n=0,false gives constant block; empty true fibre for nontrivial G prevents illicit full input | Retain |
| glue_smul; Layer 0; 324 | G₀,c,full,m,g,b,s | m=1,g=a,s=(a,b): both sides(a,13,a); shifted generator has native index1, not0 | Retain |
| glueRepHom; Layer 0; 336 | G₀,k,c,full,m,n,g | Basis δ_(a,b)↦δ_(a,a,b) for m=1; action then map and map then shifted action both δ_(a,13,a); 0↦0 | Retain |
| markedStabilizer; Layer 0; 347 | G₀,F,k,c,full,m,n | S₃,m=2,n=0: δ_empty↦δ_(a,a)+δ_(b,b)+δ_(13,13); m=0 acts by scalar3; C₂ gives one basis image | Retain; degree/order constraint belongs to headline, not definition |
| conj_mem_carrier; Layer 0; 356 | G₀,c,x∈c,h | h=(123) cycles a↦b↦(13)↦a, all in c; identity class remains {1}; no finite hypothesis needed | Retain supporting proof |
| conjFibre; Layer 0; 363 | G₀,c,full,n,h,s | h=(123),s=(a,b): image(b,13), still generates6; h=1 returns s; constant pairs stay constant | Retain |
| hurwitzMoveFun_conj; Layer 0; 375 | G₀,h,n,i,tuple | h=(123),s=(a,b): move(conj s)=(a,b)=conj(move s); for h=1 both (13,a) | Retain |
| smul_conjFibre; Layer 0; 382 | G₀,c,full,h,b,s | Same generator instance gives (a,b)=(a,b); inverse gives (13,a)=(13,a); empty tuple fixed by both | Retain |
| conjSetoid; Layer 0; 390 | G₀,c,full,n | Constant pairs (a,a),(b,b) equivalent; (a,a),(a,b) inequivalent (generated orders2,6); identity, inverse and composed conjugators witness reflexivity/symmetry/transitivity | Retain |
| UnmarkedFibre; Layer 0; 399 | G₀,c,full,n | S₃,n=2: false quotient2,true quotient1; C₂: quotient1=original1; n=0 false1,true0 for S₃ | Retain |
| UnmarkedFibre.instMulAction; Layer 0; 403 | G₀,c,full,n | At S₃,n=2, σ fixes both quotient points although it has two nontrivial 3-cycles upstairs; identity fixes them | Retain |
| UnmarkedFibre.mk; Layer 0; 414 | G₀,c,full,n,s | Six nonconstant S₃ pairs map to one full class; three constant pairs map to the other false-fibre class; no identification between these two | Retain; supplied same-name search hit was unrelated Function.Fiber.mk |
| unmarked_smul_mk; Layer 0; 419 | G₀,c,full,b,s | Both expressions give the nonconstant class for s=(a,b); proof rfl | Delete, R01 |
| glue_conjFibre; Layer 0; 423 | G₀,c,full,m,g,h,s | h=(123),g=a,m=1,s=(a,b): both sides(a,b,13); right prefix before conjugation is h⁻¹ah=(13), not a | Retain |
| unmarkedGlueSum; Layer 0; 435 | G₀,F,k,c,full,m,s | S₃,m=2,s=empty: three equal quotient classes give 3δ_constant; in F₃ this is0 (definition allowed, headline excludes F₃); C₂ gives δ_constant | Retain |
| unmarkedGlueSum_conj; Layer 0; 441 | Same plus h | h=(123) reindexes the three summands cyclically: coefficients (1,1,1) remain(1,1,1); for empty tuple both3δ_constant | Retain |
| unmarkedGlueSum_smul; Layer 0; 457 | Same plus b | m=0,S₃,n=2: both3δ_[s], and σ fixes [s]; general formula follows by the one simp proof | Delete, R01 |
| unmarkedGlueSum_eq_of_mk_eq; Layer 0; 467 | Same plus s,t and equal quotient classes | s=(a,a),t=(b,b),m=0: both3δ_constant; unequal classes are excluded by the hypothesis | Retain supporting descent proof |
| unmarkedStabilizer; Layer 0; 476 | G₀,F,k,c,full,m,n | S₃,m=2,n=0: δ_empty↦3δ_constant; C₂:m=2 gives δ_sⁿ↦δ_sⁿ⁺²; arbitrary representative has same conjugation-reindexed sum | Retain |
| hurwitz_homological_stability; Layer 4; 506 | G₀,F,c,hc; ∃m>0 with g^m=1,∃A,B before ∀k; cardG≠0; full,p,n | S₃,p=0,n=3,5: marked6=6,full3=3,unmarked2=2,full-unmarked1=1; n=4,6:6=6,3=3,3=3,2=2. Shift2 respects parity; shift1 would give unmarked2≠3. F₂,F₃ excluded (6=0). G=1,p=0 gives k→k identity | No counterexample; constants/quantifiers correct; R02 ownership |
| uniform_betti_bound; Layer 5; 523 | G₀,F,c,hc; ∃C before ∀k,full,i,n; cardG≠0 | S₃ n=0…6 H₀ dimensions marked1,3,5,6,6,6,6 and quotient1,1,2,2,3,2,3; full0,0,2,3,3,3,3. C≥6 covers these. G=1,n=2: ranks(H₀,H₁,H₂)=(1,1,0), bounded by(C,C²,C³). C=0 impossible at n=i=0,false | No counterexample; finite cardinal bound is not a vacuous finrank of an infinite space |

### README target and Check ledger

Rows enumerate every numbered target, splitting §2.1's definition and comparison. They also record the API identities and boundary tests of that target's Check block. Here a=(12), b=(23), z=(13) in S₃; “polynomial case” means G=1, c={1}, R=k[t], U=t, a=1, A1=1, A2=2, A0=7. Zero support is −∞. The computations test statements, not proofs of their general forms. R02 applies to the common development even when the test result is correct.

| Target / statement | Instances tried and values computed | Result / required change |
|---|---|---|
| §0.1: nonsplitting, generation, conjugacy in subgroups | G=1 gives true; S₃ subgroup intersections have sizes 3,0,1,0 and are single classes or empty. S₄: H=〈(12),(34)〉 has c∩H={a,(34)} with two H-classes. C₆: closure of involution has order2, not6. A₄ class {(123),(134),(142),(243)} generates12 and meets each C₃ once, V₄ zero times | Predicate discriminates all five Checks; R02 ownership |
| §0.2: unique involution class for order2s, s odd, and nonsplitting when generating | S₃: s=3, involution class size3, generating order6. D₂ₛ: reflections form one class for odd s; conjugating changes reflection exponent by2, a unit mod s. C₆: unique involution generates2≠6. S₄: order24 has s=12 even; involution class sizes6 and3 | Hypotheses necessary in the stated uses |
| §0.3: braid action, fibres, products and generation | Nine S₃ pairs split into orbit sizes1,1,1,3,3; six generate S₃. Product of (a,b) and (z,a) is(123); plain swap product(132). Quotient fibres have sizes2 and1. Empty tuple generates1, hence full fibre empty for nontrivial G. C₂ singleton class gives one tuple in every degree and trivial braid action | Action/inverse signs and full Bool agree with Lean; “both tuples” in Check1 is read as original tuple and Hurwitz image, not the displayed wrong swap |
| §0.4: shifted inclusion and gluing, including associativity | Empty prefix: append(∅,s)=s and shift0 sends σ_i→σ_i. Prefix length1 sends native σ₀ of B₂→σ₁ of B₃. n=0: map1→B_m unique; gluing gives g^m as a tuple. For H=〈a〉, appending b changes generated order2→6. Three prefixes concatenate to the same ordered tuple under either association | Correct source/target; gluing is not exact-image preserving |
| §0.5: homology of a cover equals braid-group homology of its fibre module, naturality | G=1,n=2: both H₀,H₁ equal k, H₂=0. S₃,n=2: both H₀ dimensions5. X=B_n: induced regular module has H₀=k,H_p=0 for p>0, matching contractible universal cover. Empty fibre gives0 on both sides | Valid coefficient object is the discrete fibre, not all points of the total space |
| §0.6: component ring, monoid presentation, grading, central boundary-one orbits | R₀=k even when full degree0 is0. r_a r_b has product123, r_b r_a product132, so unequal. Polynomial case gives one basis vector tⁿ in each degree. S₃ dimR₂=5, not the commutative-polynomial value6. Single nonidentity entry has degree1 and nonidentity product. Boundary-one block a² commutes with all orbit words | Ring differs from full-monodromy summand and from a commutative polynomial ring |
| §0.7: central U_D and representation operators | C₂: U_D=t^(2D), degree2D. S₃: U₁=r_a²+r_b²+r_z², degree2 versus degree6 for their product. In U₁² the cross terms generate S₃; U₂ has only C₂-image constant blocks, so they differ in permitted characteristic. G=1: U_D=t^D. Dd is the degree, with no \|c\| factor | No divided normalization; singleton map contradicts prose R03 |
| §0.8: field-uniform component stability, common exponents over subgroups | Polynomial case D=1,N=0: t maps basis tⁿ→tⁿ⁺¹ bijectively, cokernel k in degree0, kernel0. S₃ H=C₂: diagonal coefficient \|c∩H\|=1, full H=S₃: coefficient3, a unit in each permitted field. S₄ commuting tuples have invariant multiplicities i=0…n and hence ≥n+1 distinct orbits | Finite-set proof chooses D,N before k; S₄ and characteristic3 controls distinguish hypotheses |
| §1.1: support degree, shift, exactness, separate chain index | deg0=−∞; k[2] supported in degree2; k[1]₀=0≠k₀; degk[t]=+∞. Exact 0→k[1]→k⊕k[1]→k→0 gives1=max(1,0). Shift by2 gives degrees3,3,2; empty direct sum remains0 | Internal shift has no chain sign and no natural-subtraction junk |
| §1.2: torsion/cokernel support and δ | Polynomial case M=R: torsion0,cokernel k, A=0, δ=0. M=k: torsion k,cokernel k,A=0; Tor₀=k,Tor₁=k[1],δ=1. Shift M byq gives A=q and δ=q+1 for M=k. Multiplication t on R injective but cokernel k≠0 | Kernel is measured in source degree; cokernel in target degree |
| §1.3: change-of-rings spectral sequence and low exact segment | R→k,M=R: only E²₀₀=k, all positive totals0. M=k: Tor^R₀(k,k)=k,Tor^R₁(k,k)=k[1], all higher0; since R̄=k these survive at (0,0),(0,1). Low segment is0→k[1]→k[1]. Total degree0 is k⊗_R M | Correct right/left variance; shared ownership/gap R02 |
| §1.4: balanced tensor support estimate | N=k,M=k[q]: tensor k[q], degreeq=0+q. N=k over k[t] is not flat (tensoring multiplication t gives0:k→k), but bound still q≤q. Zero factor gives0; finite-support premise avoids an unjustified top-degree filtration of unbounded N | Flatness not needed |
| §1.5: Tor over R̄ | R̄=k: Tor₀(k,V)=V, higher0; degrees degV≤degV and −∞≤degV. R̄=k[t]/(t²), V=k: resolution alternates multiplication t with shifts, Tor_i=k[i], so i=i·1+0 | Bound works in characteristic2 as well as3; no commutative-ring substitution in general proof |
| §1.6: A(M)≤δ(M)+A1; homogeneous torsion exact sequence | Polynomial case M=k: R[U]⊗M=0, M[U]=k degree0, Tor₁^R(k,k)=k[1]; second arrow has degree1 and is an isomorphism, not degree0. A=0≤1+1=2. For M=R, A=0≤0+1 | Corrects source factor order and shift |
| §1.7: higher quotient Tor bound | Polynomial case M=k: Tor_i degrees0,1,−∞ for i=0,1,≥2, bounded byδ+i=1+i. Multiplication t sends R[1]₁=k to R₁=k in degree0; without [1], R₀→R₁ raises degree1 | Shifted splice is essential; i=0,1 are initial data |
| §1.8: graded Nakayama with support | R̄=k[t]/t² has deg1; V=R̄ has degree1=degcoinv0+1; V=k[q] givesq≤q+1. Its augmentation ideal squares to0. Over R=k[t], V=k[t,t⁻¹] has coinvariants0 but V≠0, showing why the nonnegative hypothesis is needed for the R-version | Distinguishes finite-degree R̄ from unbounded R |
| §1.9: low augmentation Tor bounds δ | Polynomial M=k: h_aug,0=0,h_aug,1=1,δ=1≤1+4=5. M=R: h_aug,0=0,h_aug,1=−∞,δ=degR̄=0≤4. Zero M has all degrees−∞ | Constants and zero case consistent |
| §1.10: general Tor estimate | Polynomial N=M=k: Tor₁ degree1≤0+max(0,1)+1+4=6; i≥2 gives0 module, degree−∞. N=k[2],M=k: Tor₁=k[3], bound3≤2+1+1+4=8. Noncommutativity is allowed by the right/left ordered tensor | No finite-global-dimension assumption used generally |
| §1.11: K-complex and d²=0 | d(g;m)=r_gm. For(a,b;1), d=(b;r_z)−(a;r_b); d²=r_b r_z−r_a r_b=0 because both products123 and same braid orbit. For A₄ g=123,h=134, correct products both234; wrong conjugation yields132 versus234. For M=k, all d=0 and H_q=k[c^q][q]; n<q piece0 | Positive action and inverse face convention match; characteristic2 cancels two equal terms as 1+1=0 |
| §1.12: right linearity and tensor comparison | d((g);1)=r_g, and after right multiplication bys both sides r_gs. Polynomial case K(R)_q⊗_R k=R[q]⊗_R k=k[q]=K(k)_q, differential t⊗1=0. A generator homotopy's conjugate prefix changes withs, so this right-linearity is not claimed for S_g | Correct differential/tensor comparison |
| §1.13: generator null-homotopy | S_g(∅;1)=(g;1), dS_g=(∅;r_g). With s=r_b,g=a, prefix b a b⁻¹=z and r_z r_b=r_b r_a. Constant prefixa would give r_a r_b (product123) instead of r_b r_a (product132). Polynomial case: in alternating degrees dS+Sd=t+0 or0+t=t | Nonlinear-in-right-action homotopy nevertheless gives the right-multiplication identity |
| §1.14: R_+ annihilates regular K-homology | Polynomial case H₀=k, t acts0 on H₀ but sends1→t≠0 on K₀=R. H₂=k[2] also killed by t. Since r_g actions vanish on homology, a positive word acts0 there | Does not assert zero chain maps |
| §1.15: deg H_qK(R)≤A2+q | Polynomial differentials d₁=t,d₂=0,d₃=t,d₄=0. H₀=k[0],H₁=0,H₂=k[2],H₃=0. Degrees0,−∞,2,−∞ satisfy bounds2,3,4,5. K_q=R[q] exists for allq, so the complex is unbounded | Check's formula degH_q=q applies to its even-q clause; odd-q value is−∞ |
| §1.16: universal coefficients and K-homology bound | M=R: higher Tor vanishes; abutment H_jK(R). M=k: even q supplied by Tor₀(k[q],k)=k[q], odd q by Tor₁(k[q−1],k)=k[q]; thus H_q=k[q]. Bound q≤1+q+4+2=q+7. Old A1=0,A2=1 would give3≤2 atq=3, false | Correct enlarged slope; R02 common spectral-sequence ownership |
| §1.17: low K-homology/augmentation comparison | M=k: H₀K=k=Tor₀; H₁K=k[c][1] surjects to Tor₁. Polynomial case both H₁ and Tor₁=k[1]; at degree2 H₂K=k[2] but Tor₂=0, so all-degree identification is false | Correct restriction to degrees0,1 |
| §1.18: higher K-support from two degrees | Polynomial M=k: (h₀,h₁,h₂,h₃)=(0,1,2,3), and q≤1+7q forq>1. If h₀=−∞, nonnegative graded Nakayama gives M=0, and allh_q=−∞. q=0,1 are inputs | No circular use of the high-degree bound |
| §1.19: stabilization from low K-homology | Polynomial M=R: b=0, t:R_n→R_n+1 sends tⁿ→tⁿ⁺¹ and is iso for alln, including n=0; advertised n≥7 is weaker. M=k: b=1, t:k₀→k₁=0 not iso at source0; at alln≥8 it is0→0, an iso | Source degree used correctly, A≤b+5A1<b+A0 |
| §2.1 definition: Mod(D,P), pure kernel, Alexander trick, action on arc classes | n=0,1 groups1; n=2 Mod≅Z, restriction toS₂ is mod2 and kernel2Z. Boundary Dehn twist=2, not0; allowing boundary rotation kills2 and makes half twist order2. Coning for f=id has every time slice id, and for boundary-fixed f fixes every boundary point at every time | Boundary and marking conditions discriminate wrong models; coning construction is also native Homeomorph.alexanderIsotopyClosedBall |
| §2.1 comparison: π₀Diff≅Mod≅B_n≅π₁Conf_n | n=0,1 all groups1; n=2 allZ, half twist1, full twist2; pure subgroup2Z. Annulus has a core twist of infinite order in π₀Diff, so boundary map from one-point configuration is not surjective. Collar twist φ(1−1/j)=e^(−j²)>0, while its cutoff is0 there; derivative errors O(j^(l−N))→0, proving the claimed nonclosedness | Smale pointwise form remains a declared gap, not the collar-fixed source theorem; PAL/ALEX access limitations below |
| §2.2: based arc complex | n=0 vertices0 and realizationempty; n=1 vertices1, edges0; two arcs to one endpoint give no edge. n=2 coset model has vertices indexed byZ, so vertices are not just the two punctures. Distinct-endpoint condition excludes the larger F-complex | R06 needs the larger finite-boundary-marking family; pairwise/simultaneous Check not independently certified |
| §2.3: truncated cosets, shifted-tail subgroup and inclusion | n=0 all terms∅; n=1 A₀=1,A₁=∅ whereas untruncated B₁/1=1. n=3,q=0 tail=〈σ₂〉; q=2 tail1 and A₂=B₃. n=2,q=0,1 tail1, giving A₀=A₁=Z; inclusions from B₀,B₁ injective since both trivial | Truncation and native index q+1 are correct |
| §2.4: faces, representative independence and semisimplicial identities | q=1 faces ofb are bσ₁ andb. q=2,i=0,j=1: one composite bσ₂σ₁L₀; other bσ₁σ₂σ₁L₀=bσ₂σ₁σ₂L₀=bσ₂σ₁L₀. i=0,j=2: bσ₁L₀=bσ₁σ₂L₀; i=1,j=2: bL₀=bσ₂L₀. Vertices b,bσ₁,bσ₂σ₁ | All three two-face tests work; degeneracies are not part of the carrier |
| §2.5: transitivity, stabilizers, equivariant coset identification | n=2 edgesZ with translation byB₂=Z, stabilizer0; n=3,q=0 stabilizer〈σ₂〉≅B₂; maximal simplex tailB₀=1. Right face multiplication commutes with left action: a·(b s L)=(ab)sL, whereas s(ab)L need not equal a(sb)L | Algebraic convention correct; geometric isotopy input conditional on declared contracts |
| §2.6: connectivity | n=1 realizationpoint, hence nonempty (−1-connected); n=2 edges k→k+1 formR, contractible and0-connected; n=0 empty excluded. Larger repeated-endpoint complex has higher simplices and is not the truncated A | Disc statement passes; induction repair R06 |
| §3.1: graded homology modules and ring/conjugation action | At branch degree0, M₀=k,M_p=0 forp>0. Full-monodromy degree0 is0 forS₃. S₃ degree2 M₀ has dimension5=R₂; conjugation cycles the three constant generators. In polynomial case M₁ overQ starts at internal degree2 although homological degree is1 | Chain/internal degrees are distinct |
| §3.2: Borel resolution and comparison range | n=1 fibre\|A\|=point, augmentation an equivalence; claimed t<−1 range is empty. n=0 sourceempty,targetHur₀point; H₀ values0 andk, so no equivalence. q≥n levels are∅. n=3 range t<1 includes onlyH₀ | Correct conservative range; realization gap minimized in R04 |
| §3.3: row identification and faces | q=0 gives k[c]⊗H_p(Hur_n−1), notH_p(Hur_n). S₃,n=2,p=0 dimensions3·3=9 versus5. q=1, first inverse face(a,b)↦(b;z); second↦(a;b); alternating product difference r_b r_z−r_a r_b=0. Positive face instead gives(z;a), a different term | Direction and suffix conjugation verified |
| §3.4: spectral sequence and unaugmented edge column | Polynomial case n=1: E¹₀₀=k, E²₀₀=coker(0→k)=k; H₁K(R)₁=ker(k→k)/0=0, so the two are not interchangeable. q≥n has0; d² has bidegree(−2,+1), e.g (2,0)→(0,1) | Zeroth-column correction is correct; no abutment claim at total degree n−2 |
| §3.5: edge short exact sequence | Polynomial M₀=R,n=1 gives0→0→k→k→0→0. n=0 gives0→0→0→k→k→0, so edge need not surject. For the generic K-algebra sequence with M=k,n=1, edge k→0 has kernelk, so injectivity is not formal from the chain construction | Correct placement of H₁K as kernel and H₀K as cokernel |
| §4.1: inductive support bound | Polynomial p=0: q=0,1,2 give true degrees0,−∞,2 bounded by2,9,16. Incoming j=2 gives A2+A0(3P+0); j=3 gives A2+A0(3P−2); other diagonal j=1 gives A2+A0(3P−1). For P=1, threshold A2+3A0P=23 ensures P<n−2 | Differential directions and strict inequalities consistent |
| §4.2: marked stability | Polynomial constants A=21,B=11,a=1 give permitted range n>21p+11; atp=1,n=33, rational H₁ bothk, map sends braid exponent1→1. S₃ p=0,n=3,5 marked dimensions6=6. OverF₃ the full-stratum coefficient3 is0, so excluded; no integral theorem asserted | True tested range; R02 ownership |
| §4.3: full-monodromy stability | G=1 full=all, including empty tuple. S₃ fulln=0 empty with allhomology0; fulln=2 has two components, fulln=3 has three. On exactH=〈a〉 only g=a survives, so coefficient1, not3. Common a=2 compares3→5 and4→6, each full dimension3→3 | Correct triangular coefficient and subgroup-uniform exponent |
| §4.4: nonfree quotient homology | C₂ conjugation trivial, X/G=X. S₃(a,a) has stabilizer〈a〉 of order2, notfree; H₀ dimensions5→2 and coinvariantsdim2. Full case2→1. AntipodalS² in characteristic2: H₁(S²)_C₂=0, H₁(RP²)=F₂. G=1,n=1 fibre-module dimension1, total-space permutation-module dimensionuncountable | Permutation-module proof handles nonfree action; supplier wording R07 |
| §4.5: unmarked stability and Lean theorem | S₃ quotient p=0,n=3,5 dimensions2=2, n=4,6 dimensions3=3; full quotients1=1 and2=2. C₂ singleton stabilization adds2D points as one map, contradicting “does not exist” | R03, with otherwise matching Lean signature |
| §5.1: Salvetti finite cell models, covers and radial transport | n=0,1 modelpoint; n=2 cell counts(1,1),total2; n=3 counts(1,2,1),total4=2². Nine-sheet S₃ Hur₂ cover lifts the base to9 vertices+9 edges; full6-sheet cover to6+6. Empty CHur₀ gives0cells. Radial map0→0,1→1/√2,2→2/√5; inverse1/√2→1. TypeA₂ W=S₃; I₂(5) Cartan product(3+√5)/2 nonintegral | Cell bounds survive disconnected/empty covers; general Salvetti gap not silently bypassed |
| §5.2: uniform Betti bound | Polynomial constants give C=2^(21+11+1+1)=2³⁴. At i=0, H₀=1≤2³⁴; i=1,n=33, H₁dim1≤2⁶⁸. For a=2, thresholdT=10,n=15, descend15→13→11, stopping aboveT; do not descend to10 or change parity. S₃ H₀≤6 in computed degrees; S₄ has≥n+1 and cannot have fixedC | Correct residue descent and exponent bound; wider four-space extension distinguished from earlier owner's centreless connected quotient |
| §5.3: uniform étale/rational Betti bound | S₃,q=5,n=10: ℓ=11 exceeds6,5,10, but notn+a=12; cross-degree comparison would needℓ≥13. Exact-branch G=1,n=1 schemeempty has H⁰dim0; topological Conf₁ hasdim1. n=0 exact-branch trivial cover givespoint,dim1. A₄ chosen3-cycle class containsg but notg², so is not rational; topological statement still applies. RP²: rationalH¹dim0 versus mod2dim1. Nongenerating inertia yieldsno connected G-cover | Identity exception, rationality and fixed-n comparison are correctly separated; no Frobenius-equivariant stabilization claimed |

### Conventions and exclusions

| Convention / boundary class | Computation | Result |
|---|---|---|
| Left action versus right-to-left permutation composition | (12)(23)=(123), (23)(12)=(132); σ(a,b)=(z,a), σ⁻¹(a,b)=(b,z) | Used consistently in the action, ring and inverse-face tests |
| Suffix exponent g^h=h⁻¹gh | A₄: h·(h⁻¹gh)=gh=(234), while h·(hgh⁻¹)=(132) | Separating example uses order3, unlike involutions |
| Source versus target stabilization degree | M=k,U=t: kernel lives in degree0, Tor comparison image in degree1; C₂,U=t²: source n goes to n+2 | No dropped shift found |
| Empty indexing and subtraction | Fin(0−1)=Fin(1−1)=∅; k[1]₀=0; A(0)_q=∅, A(1)₁=∅; K(k)_q has degreeq for everyq | No out-of-range generator or fake simplex |
| Characteristic2 and3 | For S₃,6=0 in both fields, so headline excludes them; for G=1,1≠0 in both, and K(k) has zero differential in both. Alternating cancellation remains valid in characteristic2 | No sign division by2; group-order restriction is explicit |
| Zero modules / empty covers | Tor(0,M)=0; K(0)=0; empty full fibre for G≠1,n=0 gives rank0 and cell count0 | No forced base point |
| Zero ring, DVR, inseparable extensions | Zero ring and a nonfield DVR have no Field instance, so are not accepted coefficient inputs. Over a field such as F₂(t), algebraic calculations remain defined; no perfectness assumption or extension choice enters the topological statements | These cases do not refute a field theorem |
| q=1 and small finite fields | q in §5.3 is a prime power, hence q≥2. For S₃, residue characteristics2 and3 fail coprimality; q=5 is admitted | No q=1 denominator or good-prime-only shortcut beyond stated tame hypotheses |
| Arbitrary topology, nonreduced test schemes, smoothness | Acceptance carriers are discrete group representations and algebraic quotient sets, not arbitrary topological spaces/schemes. §5.3 fixes the parent's particular tame Hurwitz scheme; it does not quantify over square-zero thickenings or all proper schemes | No hidden unrestricted-topology or smoothness omission in the Lean statements |
| Universe | Headline G,k are both Type0, matching the pinned groupHomology universe; finiteG may be transported to this universe. Initial action lemmas are universe-polymorphic | README explicitly uses this same small-carrier convention |
| Constants | Polynomial case(a,A1,A2,A0)=(1,1,2,7); old(1,0,1,1) would force h₃K(k)=3≤2 | Positive-slope correction verified |

### Source locator ledger

**46 distinct named locator entries** were verified in the four readable cached works: 38 EVW16 entries listed below, three HW10, three CD95 and two SMA59. Repeated uses and subordinate equations inside those entries are not counted again. This verifies location and scope against the cached version, not the separate published pagination. Statements requiring the corrections listed in Source issues were checked with those corrections, not accepted literally from the source.

| Readable locator entry / entries | Source anchor(s) | Target scope checked |
|---|---|---|
| EVW16 (1.3.2); §1.11 | EVW16 line 102; EVW16 line 337 | Hurwitz sign, suffix conjugation, grading and the defective zero-degree convention |
| EVW16 §2.1; Definition 2.2; §2.4 | EVW16 line 354; EVW16 line 399; EVW16 line 474 | Marked-disc group, four fibres, generated subgroup and boundary product |
| EVW16 Proposition 2.5; §2.6 | EVW16 line 501; EVW16 line 509 | Finite-cell bound and gluing source/target |
| EVW16 Definition 3.1; Lemma 3.2; §3.3 | EVW16 line 537; EVW16 line 544; EVW16 line 561 | Nonsplitting, involutions, ring |
| EVW16 Proposition 3.4; Lemma 3.5 | EVW16 line 574; EVW16 line 623 | Extracting, powers, central sum, component stability, subgroup coefficient |
| EVW16 §4.1; Theorem 4.2 | EVW16 line 726; EVW16 line 741 | K-differential; higher-degree estimate and source-degree stabilization |
| EVW16 (4.3.1); Lemma 4.4; Lemma 4.5 | EVW16 line 782; EVW16 line 785; EVW16 line 800 | Change of rings, ordered balanced tensor, quotient Tor support |
| EVW16 (4.5.1)–(4.5.3); Lemma 4.6; Lemma 4.7 | EVW16 line 815; EVW16 line 828; EVW16 line 866 | Defect constants, degree-a torsion arrow, shifted splice |
| EVW16 Lemma 4.8; Lemma 4.9; Proposition 4.10 | EVW16 line 899; EVW16 line 909; EVW16 line 928 | Nakayama, low and general Tor bounds |
| EVW16 Lemma 4.11; Proposition 4.12; Proposition 4.13; §4.14 | EVW16 line 946; EVW16 line 959; EVW16 line 979; EVW16 line 1007 | Null-homotopy, regular support, universal coefficients, low comparison |
| EVW16 (5.0.2); Proposition 5.1; §5.2; Proposition 5.3 | EVW16 line 1043; EVW16 line 1049; EVW16 line 1062; EVW16 line 1070 | Graded modules, spectral sequence, truncated cosets, face identities |
| EVW16 Lemma 5.4; §5.5; Proposition 5.6 | EVW16 line 1105; EVW16 line 1139; EVW16 line 1160 | Row differential, arcs, stabilizers and coset identification |
| EVW16 Theorem 6.1; Corollary 6.2 | EVW16 line 1256; EVW16 line 1341 | Induction, incoming differentials, exact-image strata, centreless quotient in the source |
| EVW16 Proposition 7.8; Remark 7.9 | EVW16 line 1578; EVW16 line 1606 | Fixed-n comparison, uniform Betti bound, shift correction, nongenerating emptiness |
| HW10 Definition 3.4; Lemma 7.1; Proposition 7.2 | HW10 line 724; HW10 line 1631; HW10 line 1644 | Cohen–Macaulay convention and the larger finite-Δ induction family |
| CD95 Theorem 1.4.1; Lemma 2.2.1; Corollary 2.2.3 | CD95 line 181; CD95 line 324; CD95 line 334 | Equivariant arrangement comparison and cell count by finite parabolics |
| SMA59 Theorem B; Theorem 4 | SMA59 line 15; SMA59 line 124 | Collar-fixed square, not automatically the boundary-pointwise disc carrier |

### Supplier, ownership and dependency ledger

Checked **six cross-roadmap supplier contracts**, their cited section/target headings and relevant hypotheses, plus the competing earlier owner ArithmeticStatisticsPartVIII. The source and ownership searches used the supplied main/head copies, the board packages and the roadmap index; vocabulary matches alone were not treated as ownership. There is no fully qualified acceptance-name collision established with another roadmap. The parent already owns the action and four Hurwitz spaces; the acceptance file's native elementary encoding is presented as their realization rather than a second general moduli construction. The new nonfree-quotient extension can remain here; R02 identifies the common development that cannot.

| Supplier / object | Resolution and witness | Outcome |
|---|---|---|
| InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 | “Branch tuples and Nielsen classes”, “The Hurwitz braid action”, “The braid-orbit monoid”, “Extracting an element of a single class” occur at its supplied current head. Native positive move is(aba⁻¹,a); disc product need not1 | Matches conventions |
| Parent §§IG.5.1–IG.5.3 | Configuration K(B_n,1), four covering fibres, centralizer stabilizers and exact-branch scheme; analytic comparison excludes identity inertia | Package's separate G=1 arithmetic case avoids the empty-scheme versus Conf₁ error |
| Parent §IG.5.5 | “Fixed-degree Hurwitz mod-ℓ comparison” and “Coefficient towers and rational Betti dimensions” retain the fixed-n and coefficient hypotheses | Package compares each n to itself, not a Frobenius-compatible stabilization |
| ReductiveGroups Layers 11A–11B | Main supplies type-A configuration/half-twist interface and crystallographic Salvetti comparison sufficient for fundamental groups. The supplied revision retains these identifiers and explicitly expands the homotopy comparison; neither is used to invent a noncrystallographic supplier | Full cell-count contract remains explicit; no broken heading found |
| ClassifyingSpaces Stage4 items16–17 | Universal-cover chains as free resolution; local-coefficient homology identified naturally with groupHomology | Supports §0.5 with the stated CW approximation |
| AlgebraicTopology Stages2,4,5,8 | Existing numbering maps preserve Stage references. Stage5.1 Künneth; Stage5.3 regular finite covering; Stage5.5 explicitly consumes the Serre package; Stage8 relative homotopy/approximation | Nonfree overclaim R07; realization carrier R04 |
| GeometricTopology Layers1,3; §§1.7.2,3.4 | Collars, cutting, weak Whitney diffeomorphism group, collar-fixed Smale result | Repeated cutting clause R05; pointwise Smale and marked comparison are not mistaken for pinned theorems |
| DGAInfinity Layer5 | Derived tensor infrastructure exists; specific graded-Tor balance/spectral statements also occur in earlier ArithmeticStatisticsPartVIII §5.16 | Gap should not duplicate that earlier ownership, R02 |
| ArithmeticStatisticsPartVIII §5.16 | Ring, component stability, graded Tor, K-complex, arc sequence, marked/full stability, finite cells, centreless connected quotient and étale bound | Duplicate targets R02; arbitrary noncentreless quotient remains an extension |
| TeichmullerGeometry and AlgebraicTopologyPartII | Scope/head comparison: closed-surface Teichmüller/mapping-class developments and configuration/cohomology/real-locus developments | No additional identical Hurwitz headline identified; neither is added as an upward supplier |
| Eight gap slugs | All eight slugs occur in both plan and README with named suppliers | No undeclared/none supplier; redundant portions recorded in R02, R04, R05 |

Pinned declarations were read by object as well as by name. The principal checks are:

| Pinned object | Exact file/declaration anchors | Boundary/variance result |
|---|---|---|
| Braid presentation and block inclusion | `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:168` sigma_induction_on; :206 lift_sigma; :225 strandSucc; :494 natAdd; :499 natAdd_sigma; :504 pureSubgroup | n=0,1 trivial; natAdd has domain B_(m+1); shifted generator index is additive, not fixed |
| Group homology | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:120,226`; `Functoriality.lean:46`, groupHomology.map | Group, ring and representation use the matching universe; maps consume a homomorphism and restricted-representation morphism |
| Conjugacy/subgroups/Sylow | `Mathlib/Algebra/Group/Conj.lean`, ConjClasses.mem_carrier_iff_mk_eq and mk_eq_mk_iff_isConj; `Mathlib/Algebra/Group/Subgroup/Map.lean:262,582`; `Mathlib/GroupTheory/Sylow.lean:200,347,842` | Conjugacy within H differs from conjugacy in G; Sylow2 in order2s has order2 |
| Monoid algebra grading | `Mathlib/Algebra/MonoidAlgebra/Grading.lean:89,156`; `Basic.lean:737`, toAdditiveAlgEquiv | Noncommutative orbit algebra may be length-graded; additive wrapper does not impose commutativity |
| Graded modules | `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean:63,292`; `Free.lean:225` | No finite-dimensional or positivity field is inherent; package imposes nonnegative support separately; shift piece p is old piece p−n |
| Noncommutative balanced tensor | `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:42,55`; `TauCeti/Algebra/Category/GradedModuleCat/BimoduleTensor/Basic.lean:382` | Right A-module first, left A-module second; relation moves action without a Koszul sign |
| Spectral sequences and derivation | `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36`; `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105` | Page structure has no convergence datum; graded Tor must use actual derived functors/identified resolutions |
| Radial homeomorphism | `Mathlib/Analysis/Normed/Module/Ball/Homeomorph.lean`, Homeomorph.unitBall | Values0,1/√2,2/√5; not constant scaling |
| Diffeomorphisms of disc | `TauCeti/Geometry/Diffeomorphism/Disc.lean:65`, TauCeti.DiscDiff | Boundary-pointwise subgroup with weak Whitney topology; no pinned weak contractibility established |
| Alexander isotopy | `TauCeti/Topology/Homotopy/Isotopy/Alexander.lean:132,164,205`, Homeomorph.alexanderIsotopyClosedBall and final/boundary formulas | Existing closed-ball boundary-relative isotopy can be cited for the empty-marking check |
| Thick realization | `TauCeti/AlgebraicTopology/FatRealization.lean:89,193,204` | Carrier/functor/augmentation already exist, R04 |
| Scheme ℓ-adic cohomology | `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:64,76` | Pro-étale Z_ℓ-valued sheaf/cohomology exists; this is not a construction of the Hurwitz scheme or its classical mod-ℓ comparison |

The citation resolver's sole reported name, HurwitzFibre.smul_tuple, exists at Suggested.lean:309; its actual defect is padding, not a missing declaration. The overlap report lists no dropped cited id and no second head changing this package. The manual ownership comparison nevertheless finds R02.

Mechanical dependency-check output (run against the unchanged reviewed README):

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This graph result does not discharge duplicate ownership or the supplier-hypothesis mismatches above.

## Not verifiable

- **PAL60 Theorem A and §3:** the manifest settles this work as uncertified. Its text was not available, so the exact local-cross-section/fibration citation was not independently certified. The finite-point local-disc construction in §2.1 was assessed mathematically; the declared supplier gap is not rejected for lacking the inaccessible text.
- **ALEX23 pp.406–407:** likewise settled uncertified. No new request was made. The boundary-relative Alexander construction is independently present at the pin, as recorded above, but that does not certify the historical source locator.
- **Published-version numbering:** the readable EVW16 text is arXiv v4, HW10 is the stated preprint version, and CD95 is the author's OCR manuscript. Their cached numbered locators were checked; the README's assertion that EVW numbering agrees with the separately published article was not independently checked against a second copy.
- **§2.2, final Check, pairwise versus simultaneous disjointness:** it gives no counterexample or hypotheses distinguishing pairwise compatibility of isotopy classes from independently chosen actual representatives. No separating example was established here. This one Check is not certified; it is not promoted into a false-theorem finding on an ambiguous reading. Of the 154 Check bullets read, 153 were evaluated as computations or scope assertions in the ledger, and this one remains unresolved.
- **Fresh elaboration:** prohibited by the read-only review instruction. The existing signature transcript was used for every real declaration. Its three scanner errors refer to the bogus declaration extracted from a docstring, not an independently reproduced package build. No claim of a fresh successful build is made.
- **Completion of supplier gaps:** the missing spectral-sequence, equivariant homotopy/cell, marked-diffeomorphism and pointwise-Smale results are future supplier contracts, not implemented results certified by this review. Their absence alone is not a finding. Their already-owned portions are the findings stated above.

## Source issues

- **Misprint** in EVW16 at Definition 2.2, manuscript p.9 (EVW16 lines 395–413): the source says the surjection inclusion and the marked/full fibre labels in inconsistent directions; it should be Sur(π,G)⊆Hom(π,G), with generating tuples precisely the connected-cover fibre; affects a stated result.
- **Misprint** in EVW16 at §1.11, manuscript p.8, and §4.3 preamble, p.17 (EVW16 lines 346, 770–772): the source says a module without a maximal nonzero degree has degree +∞, including zero; it should be −∞ for zero and +∞ only for unbounded support; affects the proof.
- **Misprint** in EVW16 at the proof of Lemma 4.6, manuscript p.18 (EVW16 line 852): the source says the torsion tensor has the left module first; it should be R[U]⊗_R M, with the right module first; affects the proof.
- **Gap** in EVW16 at the proof of Lemma 4.7, manuscript p.19 (EVW16 lines 872–885): the source says the unshifted splice is a graded resolution; it should be a homogeneous splice using R[a] and shifted torsion-resolution terms, with a controlled by A1; affects the proof.
- **Error** in EVW16 at Proposition 4.13 and (4.5.3), manuscript pp.18,21 (EVW16 lines 825–827, 979–988): the source says its bound permits slope A1=0 when A(R)=0; it should be enlarged to A1≥max(1,deg U,A(R)); R=k[t],M=k has H₃K(k) in degree3, exceeding the old bound2; affects a stated result.
- **Misprint** in EVW16 at §4.14, manuscript p.22 (EVW16 lines 1028–1029): the source says the two-entry differential is the negative of the differential fixed in (4.1.1); it should be (g₂)⊗r(g₁^g₂)m−(g₁)⊗r(g₂)m; affects nothing.
- **Error** in EVW16 at §5.2, manuscript p.23 (EVW16 lines 1062–1067): the source says A_q=B_n/L_q without truncating q; it should be that quotient for q<n and empty for q≥n; affects a stated result.
- **Misprint** in EVW16 at the proof of Proposition 5.6, manuscript p.26 (EVW16 lines 1191–1195): the source says F′∘F⁻¹ carries the first arc system to the second after both maps shrink to a common system; it should be (F′)⁻¹∘F; affects the proof.
- **Error** in EVW16 at (6.1.6), manuscript p.29 (EVW16 line 1325): the source says the exact-image diagonal is multiplied by |c|/|c∩Q|; it should be U_Q with coefficient one on each surviving summand; affects the proof.
- **Misprint** in EVW16 at (7.8.3), manuscript p.35 (EVW16 line 1599): the source says stabilization changes n to n+D; it should be n+Dd, and any cross-degree comparison needs its prime bound at that target degree; affects the proof.
- **Error** in HW10 at Lemma 7.1 and Proposition 7.2, preprint pp.34–35 (HW10 lines 1625–1644): the source says Δ₀ is merely finite before asserting contractibility for n≥1; it should be nonempty as well: Δ₀=∅ gives an empty arc complex even when n=1; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3489b8da102563021f9af4714033705152ebd81a", "job": "RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
