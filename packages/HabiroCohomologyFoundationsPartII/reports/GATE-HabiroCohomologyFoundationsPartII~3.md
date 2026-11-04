# Human review repairs

## H01 (CBirkbeck) — applied differently

The shared trace construction targets became exact imports from RefinedTraceMethods §§6.1–6.14 and §7.6 in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:88`, preserving the finite-coefficient bridge, prime-two resolution agreement, all pair clauses, multiplicative refinements and both solid gaps; `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean:9` now lists only Part II's nine headline targets, while tracePair assembles the supplied comparison functorially. The marked completed-relative lifts and spherical-perfection construction remain at `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:139`: RefinedTraceMethods at the supplied head `9dd269156a1d8aca466344cade6302740ae326dc`, §6.1, states ordinary étale lifting and structured spherical inputs/gluing, but does not state these completed-relative and perfection-map extensions (KU line 3715; KU line 3902), so replacing them with that section alone would lose the strengthened lifting obligations.

## H02 (CBirkbeck) — applied

The unlabeled equivalence and Frobenius-colimit wording became the canonical equivalence can and the p-completed sequential colimit of can⁻¹ ∘ φ at `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:146`, as distinguished in KU line 3907 and KU line 3919. The new Check at line 160 computes that modulo 2 or 3 Frobenius misses x, while the colimit relation is [x,n+1]^p = [x,n], and tests the unit and zero bases.

**Ownership and citation verification.** The shared constructions are owned by RefinedTraceMethods; Part II retains the input category, functorial assembly, algebraic-pair comparisons and arithmetic exports. Ownership was checked by object against main, the board packages and the supplied open-roadmap checkouts, with the indexed roadmap search used to locate additional supplier text; EnhancedDerivedSheaves on main, E5:presentability.4, owns the symmetric trace-class predicate, and RefinedTraceMethods supplies its ordered E₁/solid extension. The general marked completed lifting and toric spherical-perfection map have no second construction target in the inspected owners; the spherical Witt examples in StableHomotopyKTheoryPartII concern the finite/dualizable coefficient cases rather than this general map. The algebraic and solid downstream contracts agree at HabiroCohomologyFoundations §§4.28, 5.26 and SolidAnalyticRings' Downstream consumers. RefinedTraceMethods' consumed sections have no prerequisite on these Part II application theorems.

The citation audit resolved 112 numbered supplier-section locators using the provided heads for HabiroCohomologyFoundations, HabiroRings, HabiroNumberFields, QWittVectors, SolidAnalyticRings and RefinedTraceMethods, main for EnhancedDerivedSheaves, and indexed new-roadmap heads for the remaining suppliers. The three resolver leads for Prismatic.Trace.gradedTCMinus, gradedTP and gradedTC refer to planned API in PrismaticCohomologyPartIII §7.0, specifically `TauCetiRoadmap/PrismaticCohomologyPartIII/README.md:879`, and are not claims of pinned library declarations. The source checks use the supplied legal extractions: the Tate-map distinction is KU line 3902 and KU line 3921; ordinary lifting is HA line 52724; Postnikov obstruction theory is HA line 51577; the relative lifting assertion is KU line 3715; local prime restrictions and multiplicativity are KU line 1598 and KU line 1796; the finite-coefficient bridge is TC line 1304 and its completed result TC line 1370; the framed and number-field results are KU line 3726, KU line 3873 and KU line 3880; the perfected-lift theorem and completed base change are QH line 2860 and QH line 2983; the quotient range is Bu line 57 and Bu line 474. No new cited work or missing-reference request was introduced.

Only the two authorized roadmap files changed, in commit `729dbcb`; pull-request text, other roadmaps, metadata and the merge-order file were not edited. The README's supplier order and Dependencies now name RefinedTraceMethods before Part II; the mechanical direction check below confirms that no order-file repair is needed.

**Pinned acceptance-test audit.** Mathlib is at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The arithmetic and ordinary algebra APIs were checked at their recorded files and lines, including Mathlib/RingTheory/Etale/Basic.lean:46 and :205 and Mathlib/RingTheory/Smooth/Basic.lean:539: formally étale uses two cotangent groups, while étale and smooth add algebra finite presentation, without module finiteness. Object and module searches at those pins supply no enhanced q-Hodge pair, spherical E∞-ring or relative TC⁻ carrier; the nine retained headlines therefore remain explicitly not statable, rather than being replaced by weaker arithmetic statements. The declaration inventory of `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` is mechanically empty, with no definitions, instances, theorems, section variables or include commands: the requested list of `#check @name` commands is empty, and the module elaborated once in the targeted build. No retained declaration can silently drop a hypothesis; the Lean change removes the four supplier-owned headlines and updates tracePair's description.

**Adversarial mathematics record.** Values below are boundary calculations, not proofs of the enhanced comparison theorems; imported results retain the supplier's hypotheses. Each row records a statement or defining law, its witnesses and the competing value excluded.

| Statement | Instances tried | Values computed on the two sides or competing models | Result and change |
| --- | --- | --- | --- |
| Universe and small-diagram convention | Empty diagram; one object with identity | Index cardinalities 0 and 1; identity composite has one identity arrow | Small limits remain in the stipulated universes; unchanged |
| Coefficient convention | ℤ₂, ℤ₃, 𝔽₂ and zero ring | 2·1 = 2, 3·1 = 3, 2·1 = 0 and 1 = 0 respectively | No torsion-freeness implicit for arbitrary coefficients; unchanged |
| q-numbers and positive monomial degree | r = 0,1,2; q = 1 | [r]_q = 0,1,1+q; specializations 0,1,2 | Constant derivative is 0; no x⁻¹ at r = 0 |
| Descending filtration and negative indices | Unit, i = −1,0,1,2 | F^i = A[[h]], A[[h]], hA[[h]], h²A[[h]] | Inclusion direction F^(i+1) → F^i; unchanged |
| Rees normalization βt = h | Unit, β = 0; β inverted | βt = 0 forces h = 0; ββ⁻¹ = 1 leaves a nonzero h = 0 quotient | Bott inversion does not invert h; retained |
| Filtered β-quotient | Unit, i = 0 and 1 | F/β = A and 0; degreewise h-quotient would give A and A | Shifted cofiber retained |
| Chosen-pair clauses and completion | A = ℤ, R = 0 | F⁰ = ℚ[[h]], F/β = ℚ, F̂ = 0 and qHdg = 0 | Uncompleted pair retains its rational corner |
| Ordinary étale convention | A = ℤ[x], A → A[1/x]; polynomial source → itself | Relative differentials 0 for localization and identity; module rank of localization need not be finite | Finite algebra presentation does not assert module finiteness; supplier import |
| p-complete formal étaleness and staticity | Root tower A₀, C = ℤ_p, A₀′ = A₀/(t) | Completed L = 0, but C⊗ᴸA₀′ has π₀ = ℤ_p and π₁ = ℤ_p | Ordinary-output qualification retained |
| Relative semiperfectness | 𝔽_p[t^(1/p^∞)]; 𝔽_p[x] over 𝔽_p | t^r has Frobenius preimage t^(r/p); x has none in 𝔽_p[x] | Surjectivity tested in both example and nonexample |
| Global cotangent-amplitude requirement | ℚ[u,v]/(u²,uv,v²) | Every p-completion = 0; defining ideal has height 2 but 3 minimal generators | Local zero data do not establish global quasi-lci |
| Symmetric trace-class predicate | id on ℚ^0, ℚ; id on ⊕ℕℚ | Classifiers 0 and 1∨⊗1 evaluate to 0 and id; any tensor classifier on ⊕ℕℚ has finite rank, while id has infinite rank | Reuse EnhancedDerivedSheaves; no new symmetric predicate |
| Ordered E₁ classifier | Left M₂(ℚ)-module R; E₁ dual | Dual is a right R-module; R⊗_R R ≅ R; e₁₂e₂₁ = e₁₁ but e₂₁e₁₂ = e₂₂ | Right-left order retained in trace supplier |
| Nuclearity | Ordinary ℚ-modules of ranks 0,1,∞ | Map from finite rank r has rank at most r; infinite-dimensional identity has infinite rank | Nuclearity does not assert every identity is trace-class |
| Double-speed even filtration | Hℤ and Σ²Hℤ at i = 0,1,2 | (Hℤ,0,0) and (Σ²Hℤ,Σ²Hℤ,0); Σ⁻²Σ²Hℤ = Hℤ | Computed witness retained in §1.2 after removing duplicate foundations |
| Completed solid unit | p = 2 | π₀ = ℤ₂, π₁ = ℤ/2; integer-linear Hℤ₂ has π₁ = 0 | Both inherited solid gaps and completed unit retained |
| Local trace comparison | R = ℤ₂⟨x⟩, i = 1 | Completed step = (hR[[h]] → R[[h]]dx); ∇q(x²) = (1+q)x dx → 2x dx | Import E₁ branch at 2, with its torsion-free cover |
| Identity-cover comparison | R = ℤ_p; R = ℤ/9 at p = 3 | Unit step 1 is hℤ_p[[h]]; on ℤ/9, 3·3 = 0 with 3 ≠ 0 | Ordinary-preimage theorem excludes torsion coefficients |
| Framed trace comparison | d = 0,1,2 | i = 1 coefficients by form degree: (h), (h,1), (h,1,1); d = 2,i = 3: (h³,h²,h) | Every dimension and prime retained in supplier contract |
| Full diagonal completion | S = ℚ×ℚ over ℚ, empty frame | S⊗S = ℚ⁴; full diagonal completion = ℚ²; coordinate-difference completion would leave ℚ⁴ | Supplier's full-diagonal condition retained |
| q-PD diagonal and Jackson signs | r = 0,1,2; x = 3,y = 1,q = 2 | δ = 1,2,2/3; D_xδ² = 2 and D_yδ² = −1, matching x−y and −(x−qy) | Supplier normalization retained; ordinary division at q = −1 excluded |
| q-PD versus q-Pochhammer normalization | r = 1, x = 3,y = 1,q = 2 | (x−y)/(q−1) = 2 but (x−y)/(1−q) = −2 | Sign correction in source remark retained with new owner |
| Framed multiplication | x·x | ∇q(x²) = (1+q)x dx; ordinary Leibniz gives 2x dx; q-Leibniz gives qx dx+x dx | Enhanced multiplicative refinement imported, no strict DGA product |
| Prime-two resolution agreement | ℤ[x], i = 1 and 2 | Both resolutions give coefficients (h,1) and (h²,h); β-quotient in step 1 is ℤ[x]dx[−1] | All clause coherences and gluing retained in supplier contract |
| Cyclonic genuine versus geometric operations | Weight-one representation sphere | ΦC₁ gives S²; ΦC₂ gives S⁰ | No identification of distinct geometric-fixed-point terms |
| Cyclonic positive-divisibility coherence | Constant 1; paths 6→2→1 and 6→3→1 | Both paths send 1 to 1; C₁ has order 1, C₀ would have order 0 | Higher coherences imported; index 0 excluded |
| Cyclonic (A₂) and KU comparison | R = ℤ[1/2] versus ℤ | 2·(1/2) = 1 in first ring; no such inverse in ℤ | 2-invertibility and coherent (A₂) remain separate assumptions |
| Finite-coefficient bridge | p = 2,α = 4; p = 3,α = 2 | x⁴ ↦ 16 and x² ↦ 9; ℤ/16 has 2·8 = 0; C/x⁴ has injective multiplication by 2 | Import torsion-free bridge, completions and specified towers |
| Completed finite-coefficient comparison | m = 1,9,16 | m = 1 gives TC⁻ = F̂ = qHdg = 0 but F = ℚ[[h]]; (β,t)-reductions at 9,16 give ℤ/9,ℤ/16 | Completed-only assertion retained under supplier ownership |
| Perfect δ-ring lift | B = ℤ₂,ℤ₃,0 | Lifts S₂,S₃,0; π₀ respectively ℤ₂,ℤ₃,0 | General perfect lift retained in §0.1 |
| sphericalPerfection: can and φ | Toric A modulo 2 and 3 | Frobenius monomial degrees are 0,2,4,… and 0,3,6,…; degree 1 absent in both; can is an equivalence | Label can and iterate can⁻¹∘φ |
| sphericalPerfection: colimit direction | Stage maps x↦x^p | [x,n+1]^p = [x^p,n+1] = [x,n]; ℤ_p has identity transition; zero has zero transition | Root direction, unit and zero cases added |
| sphericalPerfection: finite-presentation boundary | Roots through level N | Exponents generated are in p^(−N)ℕ; p^(−N−1) is absent | Étale finite-presentation theorem not used for perfection |
| Completed ordinary étale lifting | ℤ[x]→ℤ[x,x⁻¹], p = 2,3 | Reductions 𝔽_p[x]→𝔽_p[x,x⁻¹] have L = 0; π₀ of lift = ℤ_p⟨x,x⁻¹⟩ | Ordinary lift first, then completion retained |
| Completed localization is not ordinary localization | f = Σp^(n²)x^(−n), radius |p|^(2m) | Term exponent n²−2mn minimized at n = m, giving −m²; a degree-d leading term has exponent c+2mN−dm² | Unbounded negative powers distinguish completed lift |
| relativeFormalEtaleLift: identity and zero | C = A₀ and C = 0 | U_C = T and 0; reduction gives A₀ and 0; completed L = 0 in both | Marked completed contract retained |
| relativeFormalEtaleLift: mapping spaces | C = A₀² | Unmarked automorphisms: 2 components (identity,swap); marking-preserving: 1 | Markings preserved; uniqueness is not unmarked rigidity |
| relativeFormalEtaleLift: completed base change | T = S[x]^∧_p, x↦0, C = A₀² | Lift base change = S_p²; reduction = ℤ_p²; each composite evaluation sends x to 0 | Coherent base-change law retained |
| relativeFormalEtaleLift: relative root tower | A = ℤ[x], adjoin all roots of t | d(t^r) ↦ p(t^(r/p))^(p−1)d(t^(r/p)) = 0 mod p; x still has no p-th root | Relative perfection differs from absolute perfection |
| relativeFormalEtaleLift: effectivity route | Split square-zero extension with L = 0 | Obstruction and choice groups Hom(0,M[k]) = 0 for all k; marked fibre has one point | Postnikov/effectivity remain construction obligations |
| Perfect-lift specialization marking | x↦p and x↦0, quotient x² | Cofibers S_p/p² versus S_p⊕ΣS_p; reductions of x differ by nonzero p | Zero specialization excluded |
| TraceInput category | Identity and composite of marked inputs | Ring element x maps x→x→x; a change E₂→E₁ has no branch-preserving identity morphism | Structured morphisms retained |
| TraceInput.forget | Unit and zero inputs | Underlying rings A and 0; identity maps send 1→1 and 0→0 | Forgetful functor unchanged |
| TraceInput.lifts | Polynomial mixed input | At p = 3 branch E₂; at p = 2 branch E₁ with root cover; reductions x→x | Imported data, no unmarked substitute |
| TraceInput.ofSpherical | ℤ[1/2][x] and ℤ[x] | First has 2-completion 0; second has 2-completion ℤ₂⟨x⟩ ≠ 0 | Invert-two constructor boundary retained |
| TraceInput.ofEtale | Identity, zero, localization | Completed reductions Â_p,0,ℤ_p⟨x,x⁻¹⟩; relative Frobenius is identity after relative twist | Constructor uses imported ordinary lifting plus §0.1 |
| TraceInput.ofFramed | d = 0,1 | Empty frame gives identity cover; line gives x = (x^(1/2))² in its 2-primary cover | Separate branch at 2 retained |
| TraceInput.ofIdentityCover | Relative root tower quotient t⁴ | Every t^r mod p is p-th power of t^(r/p); torsion-free ℤ-basis indexed by 0≤r<4 | Global amplitude and torsion-freeness retained |
| TraceInput.unit | R = A, identity cover | L_(A/A) = 0; relative Frobenius on twisted tensor is identity | Unit input unchanged |
| tracePair definition and assembly | Unit; zero input | F^1 = hℤ[[h]]; zero input F^1 = ℚ[[h]], while F̂^1 = 0 | Import existence; prove functorial assembly |
| tracePair_map | Polynomial identity x↦x | 1↦1, x↦x, dx↦dx in every applicable comparison | Diagram-level map required |
| tracePair_map_id | Unit and polynomial | id(1) = 1, id(dx) = dx; zero comparison would send dx→0 | Identity law retained |
| tracePair_map_comp | Compatible renamings x→y→z | Composite x→z, dx→dz on both paths | Composition law retained |
| tracePair_completion | R = ℚ(i), step 1 | Uncompleted H⁰ = hℚ[[h]], H¹ = ℚ(i)/ℚ; completed step hℚ(i)[[h]] is static | Completion distinction retained |
| tracePair_modBeta | Unit and line, step 1 | Unit quotient 0; line quotient ℤ[x]dx[−1] | Hodge clause retained |
| tracePair_rational | Rational unit | Step i = h^max(i,0)ℚ[[h]]; at i = 1 gives hℚ[[h]] on both sides | Combined rational clause retained |
| tracePair_pRational | ℤ_p unit, complete then invert p | Step 1 becomes hℚ_p[[h]]; inverting p before p-completion instead gives 0 | Order of operations retained |
| tracePair_multiplicative | n = 2,3,∞ | Output operadic levels 1,2,∞; no E∞ conclusion at n = 2 | Import supplier refinement without strengthening |
| tracePair_etale | A = ℚ, R = ℚ(i), step k≥1 | Pullback has H⁰ = h^kℚ[[h]], H¹ = (R/ℚ)[[h]]/h^k; static h-adic candidate has H¹ = 0 | Derived pullback retained |
| traceHabiro definition | Unit and zero pair | H(unit) = Habiro ring; H(constant ℚ[[h]]) = 0 | Algebraic descent applied once |
| traceHabiro_map | Unit identity | 1→1→1 under pair map and H; zero object map = 0 | Functorial descent retained |
| traceHabiro_hCompletion | Polynomial, monomial x² | Differential coefficient q²−1, versus qΩ coefficient 1+q; at q = 1 values 0 and 2 | qHdg rather than qΩ |
| traceHabiro_partialCompletion | n = 1 dividing m = 2 | Both completed routes give h-completion R[[h]] on étale inputs; 1→1 | Coherent transitions imported |
| traceHabiro_qWittGraded | m = 1, line | Grades 0 and 1 give ℤ[x] and ℤ[x]dx[−1]; higher forms vanish | Associated graded, not unfiltered identification |
| traceHabiro_smooth | m = 1, line, x² | Reduction differential 0; Bockstein x² ↦ 2x dx | Bockstein normalization retained |
| traceHabiro_multiplicative | n = 2,∞ | Descended structures E₁,E∞ respectively; unit product 1·1 = 1 | No gain of operadic level |
| traceHabiro_pairEquiv | Identity pair equivalence | Maps 1→1, dx→dx and their inverses compose to id | Specified pair equivalence, not arbitrary map |
| traceHabiro_periodic | β-localized unit | ββ⁻¹ = 1; quotient by h remains ℤ[β±¹] | β-periodization differs from h-localization |
| traceHabiro_cyclonic | R = ℤ[1/2], m = 1 | C₁-fixed term = THH^(hS¹); βt = h; both module comparisons carry 1 to 1 | Import KU theorem; no generic ring enhancement |
| Habiro completion with nonflat coefficients | M = 𝔽₂; factorial stages 1,2 | Quotient dimensions 1,3; monic multipliers have kernel 0 on Laurent polynomials | Nonflat coefficient case retained |
| E1QuotientExponent | p = 2; α = 0,…,7 | False,false,false,false,true,false,true,false | Evenness and bound both needed |
| E2QuotientExponent | p = 2; α = 0,…,7 | False,false,false,false,false,false,true,false | E₂ bound distinct from E₁ |
| Exponent predicates at odd and junk p | p = 0,1,3,4; α = 0,1,2,3 | E₁: F,F,T,T; E₂: F,F,F,T | Arithmetic predicates total; spectral applications require prime p |
| E₂ exponent implies E₁ | p = 2,α = 6; p = 3,α = 3 | (E₂,E₁) = (true,true) twice; α = 4 at 2 gives (false,true) | Implication has no converse |
| quotientLift | Empty sequence; y = 0 and y = 1 | Empty tensor = T; T/0^α = T⊕ΣT; T/1^α = 0 for admitted positive α | No regularity falsely imposed on spectral quotient theorem |
| quotientLift_framed | ℤ[x]/x⁴ and ℤ/9 | First torsion-free over ℤ; second has 3·3 = 0 | E₁ cover application retains torsion-freeness |
| quotientLift_identityCover | B = ℤ[x,t^(1/n)], R = B/(t⁴) | Monomials x^a t^r, 0≤r<4, form ℤ-basis; relative Frobenius preimage t^(r/p) | Relative lift over original base retained |
| quotientLift_perfected | B = ℤ₃, x = 3, α = 2 | Quotient ℤ/9 has spherical E₁ lift but 3·3 = 0 | Lift existence does not imply p-torsion-freeness |
| Supplied Moore tower compatibility | p = 3,α = 2; p = 2,α = 4,6 | Quotients S/9,S/16,S/64; specialization sends x^α to p^α | v-compatible specified towers, not arbitrary uniqueness |
| Supplied high-powered predicate | m = 0,1,8,9,12,16,32,64 | F,T,F,T,F,T,F,T | Predicate imported from RefinedTraceMethods §7.6 |
| perfectedLiftNaive | Identity base ℤ_p; toric x−1 at n = 2 | Unit filtered quotient in step 1 = 0; δ²_q(x,1) = (x−1)(x−q)/(1+q), specializing to (x−1)²/2 | General criterion and q-PD interpretation retained |
| perfectedLiftNaive: exponent-one negative control | Free δ-generator, p = 2, α = 1 | Obstructing coefficient h·δ(x)/2 is nonintegral; for α = 2, δ(x²) = 2x²δ(x)+2δ(x)² makes the correction integral | Spherical criterion cannot accept arbitrary ku-lifts |
| perfectedLiftNaive_qReg | Rational R; all completions | Local factors = 0; rational corner remains (dR⊗ℚ)[[h]] | No reconstruction from local zero factors alone |
| perfectedLiftNaive_higherPowers | p = 3,α = 2; p = 2,α = 2,4 | Spherical sufficient condition true,false,true; algebraic square theorem still applies at 2 | Spherical route does not narrow algebraic theorem |
| tracePair_quasiRegular: membership | Unit ℤ_p; root-tower t⁴ quotient | Perfect-base scalar extension of unit = ℤ_p; quotient retains t⁴ = 0 and all p-power roots | Perfection-map hypothesis retained |
| tracePair_quasiRegular: pair equivalence | Identity cover on unit; rational zero ring | Both filtrations step 1 = hℤ_p[[h]]; global zero-ring pair step 1 = ℚ[[h]] | Compare uncompleted pairs, retaining corners |
| tracePair_quasiRegular: Habiro comparison | Unit; R = 0 | Descents Habiro ring and 0 on both sides | Induced descent equivalence retained |
| canonicalFramedTrace | d = 0,1,2; n = max(d,1) | n = 1,1,2; required primes none,none,{2}; line step 1 = (h,1) | Full common canonical domain retained |
| canonicalFramedTrace_pair | Line and empty frame | Mod-β map sends dx→dx, and empty-frame step 1 = 0 modulo β | Specified algebraic map and supplied framed map |
| canonicalFramedTrace_habiro | Polynomial line, reduction by h | H⁰(M/^Lh) = ℤ[x], H⁰(M)/h = ℤ; Bockstein x^r = r x^(r−1)dx | Derived reduction retained |
| canonicalFramedTrace_einfty | Line x²; tensor square | ∇q(x²) = (1+q)x dx; two-variable canonical bound needs 2⁻¹ | Transported E∞ structure, no tensor closure claimed |
| Canonical comparison on Laurent example | ℚ[x±¹] | qdR H¹ = 0; qΩ H¹ = ℚ·dx/x | Pullback to uncompleted qdR retained |
| TraceInversion | F = ℚ, Δ = 0,−6,1,6 | False,false,false,true; disc ℚ = 1 | Positivity and factor 6 independent |
| TraceInversion: discriminant dependence | F = ℚ(i), Δ = 6,12 | −4 does not divide 6 but divides 12; both localizations = ℤ[i][1/6] | Predicate is on chosen Δ, not intrinsic ring property |
| TraceInversion.isUnit_two_three | ℚ, Δ = 6 | 2·(1/2) = 1, 3·(1/3) = 1; at Δ = 1 neither inverse is integral | Unit consequence retained |
| TraceInversion.finiteEtale | ℚ and ℚ(i), Δ = 12 | Ranks 1 and 2; Gaussian discriminant −4 is a unit; at 2 without inversion Ω has generator di ≠ 0 | Finite étale over localized scalar ring |
| Imported ε_R and P_R | ℚ,Δ = 6; separate zero algebra | ε(1) = 1; ε(1·1) = 1·1; zero algebra gives P_0 = 0 | Ring comparison imported, not reproved |
| numberFieldTraceExports | m = 1, R = ℤ[1/6] | ρ₁(1) = 1, τ₁(1) = 1, τ₁(h) = h | Transport through specified ε⁻¹ |
| numberFieldTraceExports_cyclotomic | m = 1,2; scalar 1 | Reduction of 1 = 1 at each order; completed divisor paths also send 1→1 | Coherent maps imported from relative ring |
| numberFieldTraceExports_taylor | m = 1 and 4, Gaussian field | ζ₁ = 1; tensor coefficient at 4 = R×R; idempotent evaluates to (1,0) | Full coefficient algebra retained |
| numberFieldTraceExports_transition | Gaussian field p = 7; order-three field p = 11 | φ₇(i) = −i, φ₇(−i) = i; 4² mod 7 = 2, 4³ mod 7 = 1; φ₁₁(a²) = a but φ₁₁(a⁴) = a² | Inverse-Frobenius convention retained |
| numberFieldTraceExports_equalizer | ℚ,Δ = 6; family f₁ = 1 and f_m = 0 for m>1 | At edge p = 5,m = 1 values are 1 and 0 | Independent Taylor products excluded |
| numberFieldTraceExports_hCompletion | ℤ[1/6], m = 1 | Completion ℤ[1/6][[h]], residue R; an idempotent on the order-2 component maps to 0 under τ₁ but is nonzero | Completion does not assert injectivity |
| numberFieldTraceExports_naturality | Identity and conjugation of ℚ(i), Δ = 12 | Identity i↦i; conjugation i↦−i; two conjugations i↦i; ρ₁,τ₁ send 1→1 on both routes | Naturality remains Part II target |
| Base-convention change | R = ℤ[1/6] | Constant family 1/6 gives 6·(1/6) = 1; p = 2,3 overlaps = 0 | Completed base change kept |
| Taylor re-expansion sign | p = 2,m = 1 before localization | q+1 = (q−1)+2; at q = 1 both sides = 2; reversed sign gives −2 | Root-difference convention retained |
| Nonabelian-field coefficient check | ℚ(∛2), p = 5 | x³−2 = (x−3)(x²+3x+4) mod 5; quadratic values at 0,…,4 are 4,3,4,2,2, all nonzero | Local Frobenius moves quadratic component; no global coefficient twist |

**Dependency check.** Exit status 0; no UPWARD, CYCLE or moved line:

```text
depcheck: 46 roadmaps, 507 edges, 0 problem(s)
```

**Build outcome.** `lake build TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested (4.0s)
Build completed successfully (8976 jobs).
```

**Gate outcome.** The final gate against origin/main exited 0:

```text
gate HabiroCohomologyFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
