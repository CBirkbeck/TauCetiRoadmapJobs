# Human-review replies: HabiroRings

Commit: `74e3c94107f86980e26d697a95f58640a1086117`.

## H01 (CBirkbeck) — applied

The three completion/descent/coefficient “gap” assumptions are now direct imports of HabiroCohomologyFoundations §§0.1–0.3 in `TauCetiRoadmap/HabiroRings/README.md:82` and `TauCetiRoadmap/HabiroRings/README.md:114`, with all consumer citations bound to those sections and the factorial-sign transport made explicit at line 122. Those sections construct the required interfaces independently (supplier README lines 274, 315 and 363; Q line 524, Q line 647, Q line 3545), and the supplied merge order already places that supplier before HabiroRings; the dependency check below finds no reverse edge.

## H02 (CBirkbeck) — applied differently

The four arithmetic prerequisites are now distinguished from the supplied completion and spectral interfaces at `TauCetiRoadmap/HabiroRings/README.md:82`, with the required ring, global lines, integral evaluator and field naturality retained individually at lines 88–94; HabiroNumberFields is absent from main and the indexed open roadmaps, so this approval blocker remains unresolved, since creating another roadmap or dropping these deliverables exceeds the authorized scope. SolidAnalyticRings §§1.1–6.3 does supply the spectral contract, so line 65 imports its actual sections with their size, splitting and boundedness hypotheses instead of retaining a false missing-specification label; §5.2 also owns the general profile theorem, whose duplicate was deleted from Suggested.lean while the Habiro application remains in README §2.11, and the two additional QWittVectors/HabiroCyclotomicCompletions extensions remain explicit.

## H03 (CBirkbeck) — applied differently

`TauCetiRoadmap/HabiroRings/README.md:16` now states the division explicitly: HabiroCyclotomicCompletions supplies ordinary topology/module completion and the integral intersections/comaximal splitting consumed by HabiroCohomologyFoundations §§0.2–0.3; the latter owns the enhanced reflection, and HabiroRings §§2.1/2.4 own the Laurent and ordinary/derived comparisons. The contradictory supplier text remains at `TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:67` and its consumer row at line 83: replace its assignment of enhanced completion to HabiroRings by HabiroCohomologyFoundations §0.1 and replace its Taylor-input row by the actual §§4.1/5.2 inputs; that file is outside the permitted edits, so supplier-side reconciliation is still outstanding.

# Verification and evidence

Ownership was searched by object across main, the indexed open roadmap heads and the board packages, including the supplied sibling checkouts. HabiroCohomologyFoundations owns the specialized completion, finite descent and coefficient lifts; SolidAnalyticRings owns the general spectral and profile theory; neither acquires an input from HabiroRings' generalizations. The remaining ordinary presentation, Laurent comparison and arithmetic transport are this roadmap's existing direction. No construction was moved from a later supplier and no other roadmap was edited.

The arithmetic distinction is supported by G line 273 (Frobenius gluing), G line 415 (global line definition), G line 443 (tensor multiplication) and G line 471 (integral root values); its proof at G line 2213 does not itself specify the effective global descent, integral preimage and field-map interface required here. At order one a surjective integral evaluator on the actual invertible fiber is enough for the existing power-series theorem; local p-adic rank alone supplies no such evaluator. Q line 821 identifies the number-field ring through the full Taylor presentation. The solid imports were checked against SolidAnalyticRings §§1.1–2.4, 3.1–3.4, 4.1–4.2, 5.1–5.4 and 6.1–6.3, including the profile-only generality of §5.2; Q line 3666 and MW line 1748 supply the stated spectral context, without substituting the abelian p-adic model for those supplier theorems. All sources used were already in the certified source inventory; no additional text was needed.

Cross-roadmap locators were resolved against the main copies or the supplied/open new-roadmap heads: in particular SchemeAndStackFoundations §0.23a, DerivedModuleAlgebra §§1.1–1.5, DerivedDeRhamCohomology §1.12, EnhancedDerivedSheaves E0/E1/E2:towers/E3/E5, BordismFormalGroups §F6.5, GeneralizedCohomology G2.1–G2.7, QWittVectors §§1–6, HabiroCyclotomicCompletions Layers 1–5, ArithmeticStatisticsPartIV §3.2, QSeriesPartitionsAndMockModularForms §3.1 and VStackSheavesAndLisseCategories §VS2.1. The unresolved arithmetic owner is identified above rather than treated as a resolved section citation. The initial citation leads for the local declarations are declared here; the DerivedDeRham names are supplier targets in the cited roadmaps rather than claimed pinned-library implementations.

Mathlib and Tau Ceti match the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native `Algebra.Etale` includes formal étaleness and finite presentation (`Mathlib/RingTheory/Etale/Basic.lean:205`); native `IsAdicComplete` includes Hausdorffness and precompleteness (`Mathlib/RingTheory/AdicCompletion/Basic.lean:56`) and contains no enhanced categorical data. `Module.Invertible` uses bijectivity of the dual evaluation map (`Mathlib/RingTheory/PicardGroup.lean:77`), and the surjective-map result at line 276 retains invertibility of both modules; `Mathlib/RingTheory/PowerSeries/Basic.lean:521` and `Mathlib/RingTheory/PowerSeries/Inverse.lean:109` fix the constant-coefficient action. The all-conjugates maps exist at `TauCeti/RingTheory/Cyclotomic/Lift.lean:225` and line 385 with the prime and primitive-root hypotheses retained. The searched pins supply no relative Habiro or indexed arithmetic-line carrier.

All 16 retained declarations, including `completedLineCoeffAlgebra`, were checked using `#check @name` from one scratch list, elaborated together through the permitted target build, and compared with their README statements; the temporary checks were then removed and the final file rebuilt. No binder repair was needed: arbitrary I remains allowed in `EtaleDeformation.exists_lift`; I.FG, étaleness of E and completeness of C remain explicit in `CompletedEtaleLift.mapUnique`; positivity remains in Laurent regularity; all vertex and inclusion hypotheses remain in height one; nonzero Δ and the discriminant-support condition remain in localized étaleness; and commutativity, invertibility and the actual quotient equivalence remain in `completedRegulatorTriviality`. The only mathematical signature change is deletion of the profile theorem owned by SolidAnalyticRings §5.2.

# Adversarial mathematics record

These are computed witnesses and negative controls, not proofs of the general targets. The source and ownership checks determine the imported generality; the rows below include the changed imports, their applications, every retained Lean declaration and the remaining mathematical targets. Arithmetic rows retain their explicit supplier hypotheses.

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Commutative unital coefficients, zero ring permitted | ℤ, 𝔽₂, 0 | 1+1=2, 0, 0 respectively; in 0 the identity map is the unique map | Consistent | None |
| Λ-Adams conventions on torsion-free bases | Toric ℤ[t], exponent 2 and composition 2·3 | ψ²(t)=t²; ψ²ψ³(t)=t⁶=ψ⁶(t); ψ²(2)=2 | Consistent | None |
| Λ-data with torsion | 𝔽₂, endomorphism id | ψ²(1)−1²=0, but this congruence contains no Witt-coaction data | Endomorphisms alone insufficient | Preserve coalgebra requirement |
| Perfect coverage differs from perfectness | Toric ℤ[t], ψ² | Image contains t² and omits t; ℤ[t] is free of rank 2 over ℤ[t²] | Coverage does not require surjectivity | None |
| Right-factor twist R^(m) | R=A=ℤ[t], m=2 | t⊗1=1⊗t² maps to t²; 1⊗t maps to t | Right-hand A-action preserved | None |
| Positive cyclotomic/factorial indices | n=0,1,2; q=1 | P₀=1; P₁=1−q; P₂=1−q−q²+q³; values 1,0,0 at q=1 | No zero factor admitted | None |
| Derived quotient convention | M=ℤ or 𝔽₂, scalar 0 | π₀= M and π₁=M, versus ordinary quotient π₀=M and π₁=0 | Tor retained | None |
| Witt coordinate/truncation convention | Two coordinates (a₁,a₂)=(1,1), n=2 | gh₁=1, gh₂=1²+2=3; p-typical orders {1,p} have 2 coordinates | Matches indexing | None |
| Exterior λ sign | a=2 in ℤ, Witt series (1−t)⁻² | c₁=2,c₂=−1 gives gh₂=4−2=2 and λ²=1=−c₂ | Sign fixed | None |
| Spherical rather than integer coefficients | Sphere, Hℤ, degrees 0 and 1 | π₀=ℤ for both; π₁=ℤ/2 versus 0 | Higher homotopy distinguishes carriers | Retained in solid Checks |
| Homological boundedness | Σᵇ𝕊; shifts Σ^(−n)𝕊 | First nonzero group π_b=ℤ; π_(−n)=ℤ has no common lower bound | Uniformity required | New supplier Check |
| Enhanced reflection RHom(C,−), HCF §0.1 | M=0 and S⁻¹B | L_H(0)=0; L_H(S⁻¹B)=0 although S⁻¹ℤ[q]≠0 | Completion differs from inversion | Gap replaced by import |
| Both completion tower formulas, HCF §0.1 | A=ℤ; M=ℤ with q=1 | L_H(M)=ℤ; M/(q−1)=ℤ⊕Σℤ; f₂(−1)=0 while f₃(−1)=−2 | Divisibility and derived quotients required | Import retained with its direction |
| Factorial signs across suppliers | N=1,2 | f₁=q−1=−P₁; f₁f₂=P₂; q(1+q−q²)−1=−P₂ | Same ideals, cofibers transported by sign units | Explicit sign transport and Check |
| Cyclotomic zero/equivalence detection, HCF §0.1 | Complete 0; incomplete R_r | All reductions of 0 are 0; all reductions of nonzero R_r are also 0 | Completeness essential | Gap replaced by import |
| Degreewise detection/staticity, HCF §0.1 | ℤ with q=1 | π₁ℤ=0 but π₁(ℤ/(q−1))=ℤ | Converse staticity assertion excluded | Gap replaced by import |
| Completed tensor, HCF §0.1 | Unit U=L_HB and zero | U⊗̂U=U; 0⊗̂U=0 | Unit and zero preserved | Gap replaced by import |
| Finite cyclotomic reconstruction, HCF §0.2 | m=1,2; A=ℚ or ℤ | m=1 has 1 piece, 0 edges; over ℚ, m=2 gives two series factors; integral constants (1,0) disagree mod 2 | Coherent overlaps essential | Gap replaced by import |
| Descent mapping spaces, HCF §0.2 | m=1, prime, 6 | Edge-path counts 0,1,4 respectively; empty edge product is a point | Homotopy equalizer retained | Import by section |
| Arithmetic fracture, HCF §0.2 | m=12,p=2, n=3 | p-completion has 2 factors indexed by 1,3, at any one level i=0,1,2; not 6 independent factors | Prime-chain levels identified | Import by section |
| Rational fracture must be completed | E=ℤ[q]^∧_(q²−1), t=q²−1 | Series coefficients 1,1/2,1/4,… have no uniform denominator 2ᴺ; all finite truncations lie in E[1/2] | E[1/2] differs from its t-completion | Preserved |
| Divisor restriction, HCF §0.2 | 1 divides 2 divides 6 | Unit maps 1↦1↦1 equal direct 1↦1; size relation 2<3 gives no f₂-divisibility into f₃ | Restriction direction fixed | Import by section |
| Coefficient naturality, HCF §0.2 | Identity, zero coefficient target | Reconstruction and coefficient change give id and 0 on both paths | No reverse dependency | Import by section |
| Marked finite coefficient lifts, HCF §0.3 | m=1; R=ℤ[1/2], 0 | E₁=ℤ[1/2][[h]], contains Σhⁿ/2ⁿ; for R=0 all terms 0 | Completion and zero cases preserved | Gap replaced by import |
| Marked uniqueness, HCF §0.3 | R=A×A with A≠0 | Identity sends (1,0) to (1,0); swap sends it to (0,1) | Marking distinguishes lifts/maps | Import by section |
| Ghost overlap Frobenius, HCF §0.3 | R=ℤ[i][1/2], p=3,5 | φ₃(i)=−i; φ₅(i)=i | Completed Frobenius retained | Import by section |
| Coefficient transition and static limit, HCF §0.3 | Self-pair ℤ, m=2→1 | Reduction of q is q at stage 2 and 1 at stage 1; E₁=ℤ[[h]]; R=0 gives limit 0 | Frobenius transitions retained | Import by section |
| Regularity from static derived reduction | E_m(A/A), A=ℤ; false model A[q]/f_m | Lift has π₁(E_m/f_m)=0; false model has π₁=A[q]/f_m≠0 | Ordinary quotient cannot replace lift | Preserved |
| Discrete spectral adjunction, SAR §§1.1–2.4 | δ𝕊, zero spectrum | (δ𝕊)(*)=𝕊, π₀=ℤ; (δ0)(*)=0 | Unit preserved | Gap replaced by exact imports |
| Null/shift solidity convention, SAR §1.3 | Finite support e₁ | (1−σ*)e₁=e₁−e₀; (1−σ*)(e₁+e₀)=e₁ | Correct shift and inverse | New two-term Check |
| Solid reflection/generator, SAR §§2.2–2.4 | Countable sphere product, its zero map | π₀ at point is ℤ^ℕ; e₀ has first coordinate 1 while zero map gives 0 | Generator not replaced by zero | Import by section |
| Countable product tensor, SAR §3.1 | Sizes 2,3 and empty | 2·3=6 sphere summands; 0·3=0 | Unit/empty cases respected | New Check |
| Split finite free towers, SAR §§3.2–3.3 | Habiro quotients n=1,2; rank-one constant tower | Ranks 1,3 and limit rank 1 in constant case; multiplication by 2 has no section since 2b≠1 in ℤ | Splittings are sphere-linear | Explicit hypotheses |
| Balanced scalar change, SAR §3.4 | A=𝕊[t], X=Y=A | Absolute π₀=ℤ[t₁,t₂], balanced π₀=ℤ[t]; both t₁,t₂ map to t | Relative tensor distinguished | Explicit hypotheses |
| Scalar extension cannot cross arbitrary products | ℤ→ℚ, family 2^(−n) | 2ᴺ/2^(N+1)=1/2 remains nonintegral for every N | No uniform denominator | Explicit restriction |
| Countable-limit interchange, SAR §4.1 | F(n,k)=Hℤ if k<n, else 0 | Left π₀=⊕ℕℤ, right π₀=∏ℕℤ; all-one vector only on right | Ordinary filteredness fails | New Check, size hypotheses retained |
| Independent support bounds, SAR §4.2 | Subgroups (1/n!)ℤ of ℚ, coordinate j | 1/(j+1)! admitted by independent bounds; any fixed denominator fails for unbounded j | Independent indices needed | Exact import |
| Complete split coefficient datum, SAR §5.1 | A=S_H, r=0,1,2 | a₀=1, B₀=0, J₀=A; quotient ranks 1,3 for positive stages | Fibers are marked maps | Exact import |
| General proper-profile comparison, SAR §5.2 | h=m+n; h=max(m,n); h=0 | f=m,g=n give equality; at (3,5), floor(3/2)+floor(5/2)=3≤5; zero h fails k=1 | Owned by supplier, no spectral hypothesis needed | Duplicate Lean headline deleted |
| Profile order/filtering | f_k(n)=max(n−k,0) | f_n(n)=0 forces any common target g(n)=0 for all n; min(n,2n)=n is proper | Filtered, not ω₁-filtered | Supplier ownership explicit |
| Spectral null-family formula, SAR §§5.3–5.4 | Singleton/empty blocks; weight P_n | All empty: both sides 0; one block: both A; mod P_r only n<r survive; constants 1 survive infinitely often | Decay is in block index | Exact import |
| Every homotopy degree in null families | Spherical degree-one generator η | π₁𝕊=ℤ/2; η and ηP₁ survive at first two occupied stages, while Hℤ would give 0 | Sphere homotopy retained | Exact import |
| Uniform resolutions/realization, SAR §§6.1–6.3 | Constant Σᵇ𝕊, normalized term in degree 1, Σ^(−n)𝕊 | Realization Σᵇ𝕊; degree-one layer starts at b+1; unbounded family has π_(−n)=ℤ | Bound necessary | New Check |
| Additional completed Frobenius naturality | Gaussian coefficients, conjugation g, p=3 | gφ₃(i)=i=φ₃g(i) | Witness does not establish arbitrary changing-base contract | Explicit QW extension retained |
| Additional cyclotomic prime ideal | m=1,2,6 | Empty ideal 0≠(q−1); m=2 generator 1+q; m=6, (1+q²+q⁴)−q(1+q³)=q²−q+1 | Boundary m>1 essential | Explicit HC extension retained |
| Number-field ring contract | ℚ,Δ=1; ℚ(i),Δ=2 | Coefficients ℤ and ℤ[i][1/2]; latter Φ₄ algebra R×R, φ₃(i)=−i | Full factors/twists required | Missing owner remains explicit |
| Number-field global-line/tensor contract | ξ=0 and η=−ξ | M₀=H; M_ξ⊗M_(−ξ)=H; a tuple of local ranks (1,1,…) names no global pairing | Local rank does not supply contract | Unresolved contract retained |
| Integral order-one contract | R=ℤ, evaluator id, −id, 0 | 1↦1, 1↦−1, 1↦0; preimages of 1 are 1,−1,none | Global inverse pairing/integral condition needed | Unresolved contract retained |
| Arithmetic-line naturality contract | Identity embedding; Gaussian field and Δ=12 | Pullback H⊗_H M=M; 6 divides 12 and −4 divides 12; no R-action on H follows | Identity case does not construct field naturality | Unresolved contract retained |
| §0.1 marked deformation and reduced maps | Split E=B²; source marking id, target swap | reduce(id)(1,0)=(0,1); with same markings (1,0)↦(1,0); swap²=id | Marking has mathematical content | None |
| §0.1 split étale model | B[x]/(x²−x), char 0 and 2 | (2x−1)²=4(x²−x)+1=1; char 2 gives 1 | Includes smallest characteristic | None |
| §0.1 unit/localization examples | a=0,1,2 in ℤ | Localizations 0,ℤ,ℤ[1/2]; ℚ⊗ℤ[1/2]=ℚ of rank 1 | Étale does not imply finite module | None |
| §0.2 exists_lift | I=0, unit ideal, (2) in ℤ | Lift E=D for 0; reduction 0 for unit ideal; x²+x+1 has discr −3, inverted 3 reduces to 1 mod 2 | Arbitrary I consistent | Same Lean signature |
| §0.3 locally nilpotent rigidity | ℤ/4,(2); infinitely many square-zero x_i | One marked unit self-map; x₁⋯x_N≠0 for every N while x_i²=0 | No uniform exponent assumed | None |
| §0.4 ordinary completed lift | I=0, nilpotent I, I=B, ℤ[t],E=ℤ[t,1/2] | Completions E,E,0,ℤ[1/2][[t]] respectively; coefficient of tⁿ is 2^(−n) | Finite-generation/general-base retained | None |
| §0.5 mapUnique | E=B; C=𝔽₂, W=ℤ₂ | Unique structural map; mod-2 map sends 2 to 0 and is not injective | Equivalence only between completed lifts | Same explicit FG and completeness binders |
| §0.5 completeness negative control | C=ℤ, I=(2), E=ℤ | 3 is a unit in ℤ₂, no integer b has 3b=1 | Complete-target hypothesis needed | None |
| §0.6 regular-principal derived universality | f=2,D=𝔽₂; f unit; f=0 on ℤ | Model ℤ₂ has π₁ of derived reduction 0; false model 𝔽₂ has π₁=𝔽₂; unit case 0; zero scalar has kernel ℤ | Marked derived condition required | None |
| §1.1 category of pairs | Toric f(t)=t+1; self-pairs; conjugation | fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; on self-pairs g=f; conjugation²=id | Λ-map condition excludes wrong arrow | None |
| §2.1 Laurent comparison | Second factorial quotient; Laurent/polynomial cofiber | q(1+q−q²)=1 mod P₂; q·[q⁻¹]=[1]=0 in cofiber; (q−1)(−q⁻¹)=[q⁻¹] | q invertible after reflection | Supplier import renamed |
| §2.1 restriction of scalars | A=𝔽₂,M=𝔽₂,q=1 | Derived quotient π₀=π₁=𝔽₂ over either coefficient convention | Scalar restriction retains quotient | Supplier import renamed |
| §2.1 localization kernel criterion | R_r and ℤ[[q−1]] | L_H(R_r)=0, RHom(R_r,R_r) contains id≠0; L_H(ℤ[[q−1]])=ℤ[[q−1]] | Both directions have witnesses | None |
| §2.1 one-root completion versus Habiro | Reduce at q+1 | ℤ[[t]]/(t+2)=ℤ₂ versus Habiro quotient ℤ | Distinct completions | None |
| LaurentLocalization.Coeff | q⁻¹, polynomial subring | Coefficient at −1 is 1 versus 0; qq⁻¹=1 | Native Laurent carrier | Unchanged |
| LaurentLocalization.factor | i=0,1,2; q=2 | Factors 1−q,1−q²,1−q³; values −1,−3,−7 | No index-zero denominator | Unchanged |
| LaurentLocalization.denominators | Empty product, repeated factor | 1 included; (1−q)² included; 0 excluded; at q=1 generators all 0 but identity 1 | Multiplicative closure essential | Unchanged |
| LaurentLocalization.factorial | n=0,1,2,3; q=2 | Values 1,−1,3,−21 | Recurrence and empty product fixed | Unchanged |
| LaurentLocalization.augmentation | 0,e₀,e₁,e₂; q=2 | Values 0,1,−1,1/3; P_i·aug(e_i)=1 | Inverse-factorial convention | Unchanged |
| LaurentLocalization.differential | e₀,e₁,e₂; q=2 | e₀+e₁, e₁+3e₂, e₂+7e₃ | Adjacent factor and forward shift | Unchanged |
| §2.2 free_resolution, exactness | q=2, d(e_i), i=0,1,2 | Augmentations 1−1=0, −1+3/3=0, 1/3−7/21=0; smallest occupied coefficient of d(2e₁+3e₂) is 2 | Wrong plus sign gives 2 at e₀ | Unchanged |
| §2.2 surjectivity/cofinal denominators | (1−q)² | P₂/(1−q)²=1+q; at q=2, (1+q)/P₂=3/3=1=1/(1−q)² | Repeated denominator covered | Unchanged |
| §2.3 Hom/Ext homotopy criterion | Static complete ℤ with q=1; R_r | RHom(R_r,ℤ)=0; Hom(R_r,R_r) contains 1 | Both Hom and Ext retained in criterion | Import names replaced |
| §2.4 laurent_regular | m=1,2 over 𝔽₂; m=0 | Products of 1 are q−1, q²−1≠0; m=0 gives 0·1=0 | Positivity and Laurent polynomial input essential | Unchanged |
| §2.4 ordinary/derived comparison | M=0,𝔽₂; n=0,1,2 | Quotient ranks 0,1,3 copies of M; inverse tower surjective; derived reduction of q=1 module has extra π₁=𝔽₂ | Arbitrary coefficient-module torsion allowed | Import names replaced |
| §2.5 completed coefficient change | ℤ→ℤ[t] flat; identity; zero target | ΣP_n(q)tⁿ has unbounded t-degree versus finite degree in H[t]; identity gives M, zero gives 0 | Completion retained under flatness | Import names replaced |
| §2.5 tensor Tor | Quotients q²−1,q³−1 over ℤ | π₀=ℤ; π₁=ℤ·(1+q), since (q−1)(1+q)=0 in first quotient | Derived tensor π₁ not discarded | None |
| §2.6 spectral localization | Quotient by any positive factor | T⊗ℛ/(qᵐ−1)=0; π₀T=R_r; first fiber-tower transition is 1−q² | Localization and fiber direction fixed | None |
| §2.7 spectral completion/unit | 0,T,ℛ/(q−1),Hℤ[q±1] | Images 0,0,ℛ/(q−1),H(H) respectively | Sphere/EM comparison is relative | Import names replaced |
| §2.8 completed discrete embedding | S_H, zero, one-root-torsion object | Quotient ranks 1,3 at stages 1,2; evaluation returns same object; zero remains 0 | Ordinary discrete infinite sum not declared complete | Solid imports specified |
| §2.9 solid idempotence | n=1,2 and balanced variables | Quotient ranks 1,3; multiplication sends q₁,q₂ both to q; unspecialized absolute ring has two variables | Tower sections only sphere-linear | Solid imports specified |
| §2.10 C_I and J_r | Empty blocks, one singleton, constant family, P_n family | C=0,A respectively; J₀=A; infinitely many 1 survive mod P₁, while only n<r survive for P_n mod P_r | Decay and boundary fixed | Solid imports specified |
| §2.10 block map identities/composition | Identity, zero, two duplications | Supports {j},∅,{4j,4j+1,4j+2,4j+3}; sizes 1,0,4 | Finite outputs retained | None |
| §2.11 factorial divisibility/application | a=b=1; a=0; q=−1,1 | P₂=P₁²(1+q); at −1,0=4·0; at 1 Gaussian quotient 2, or 0 in 𝔽₂; a=0 quotient 1 | Divisibility direction correct without cancellation | General profiles imported |
| §2.12 bounded-below solid tensor closure | Complete unit and zero; negative shifts | e(S_H)⊗e(0)=0; e(S_H)⊗e(M)=e(M); π_(−n)(Σ^(−n)𝕊)=ℤ | Both factors bounded below | Resolution/import hypotheses retained |
| §3.1 cyclotomic intersections | {1,2}, {1,6}, 𝔽₂[ε]/ε² | Quotients 𝔽₂,0; nilpotent base gives ideal (q−1), radical (ε,q−1) | Radical equality required | None |
| CyclotomicIndex.primeChain | (4,1,2),(1,3,2),(0,1,2),(4,0,2),(4,3,0) | {1,2,4},{3},{1},{0},{3} | Total-function junk values recorded | Unchanged |
| CyclotomicIndex.vertices | m=0,1,2,4,6,12 | Cardinalities 0,1,3,4,8,11; {1,4} absent for m=4 | Distinct subsets/maximal chains | Unchanged |
| §3.2 vertex order | {1},{2} at m=2 | Neither subset inclusion holds, although 1 divides 2 | Order is subset inclusion | None |
| §3.3 height_one | m=0,1,2,4,6,12, enumerate triples | Strict composable inclusion counts 0 in all cases; at m=6 undirected cycle remains | Height does not imply contractibility | Unchanged |
| §3.4 unique consecutive chain | m=12,(p,d)=(2,3),(3,2) | Chains {3,6,12} and {2,6}; second does not contain 18 | Maximal exponents differ by prime | None |
| §3.5 finite monoidal descent | Identity, disjoint summands, empty cover, false overlaps | Limits D,D₁×₀D₂=D₁×D₂,0 respectively; false-overlap diagonal misses (x,0) | Conservativity alone insufficient | None |
| §3.6 homotopy equalizer | m=1,2,6 | 0,1,4 edge paths; m=1 recovers Map(E₁,F₁); m=6 has no composable pair of strict arrows | Paths retained despite height one | Supplier labels replaced |
| §4.1 stage functor on pairs | Self-pair, zero, Gaussian conjugation, m=4 | E_m(ℤ/ℤ)=ℤ[q]^∧_f_m; zero maps to zero; e=(1−iq)/2 goes to 1−e | Maps use g as well as base map | Supplier labels replaced |
| §4.1 transition in localized split case | R=ℤ[1/2],m=2 | 2-completed overlaps 0; two factors R[[q−1]]×R[[q+1]] | No invented prime-2 gluing | None |
| §5.1 ordinary relative inverse limit | R=0, self-pair ℤ, m=1 | Rings 0,H; H/(q−1)=ℤ; f_m regular while q−1 nonunit since its evaluation is 0 | Static input essential | Supplier labels replaced |
| §5.2 compatible root convention | Orders 3,6 | Compatible difference 2ζ₃ has positive 2-adic valuation; conventional exponential-root difference −1 has valuation 0 | Re-expansion requires compatible roots | None |
| §5.2 maps can,φ,τ | p=2,m=1; q and q² | φ(q+1)=X+2; can(X)=X; τ₁(q)=1+X; τ₁(q²)=1+2X+X² | Shift sign and domains fixed | None |
| §5.2 full coefficients and root action | R=ℤ[i][1/2],m=4 | e=(1⊗1−i⊗i)/2 has projections 1 and 0, and e²=e; conjugation swaps them | One embedding loses factor | None |
| §5.2 evaluation versus Taylor | 1−q³ at ζ₃ | Constant 0; linear term −3ζ₃²X≠0, quadratic −3ζ₃X², cubic −X³ | Root values alone insufficient | None |
| §5.3 prime-adic/rational Taylor comparison | m=5,ℓ=11; m=1 | Φ₅ roots 3,4,5,9; full mod-11 algebra 𝔽₁₁⁴; m=1 gives ℤ_ℓ[[X]] | Irreducibility not assumed over finite field | None |
| §5.4 Taylor equalizer | Self-pair ℤ, zero coefficients, Gaussian constants | Polynomial q yields X+1 on both prime-edge paths; zero equalizer 0; i versus φ₃(i)=−i fails | Twisted full diagram retained | Supplier labels replaced |
| §5.5 untwisting sufficient condition | R=A; ℤ[1/2]; localized cubic | Right twist t⊗1↦t^m; self-pair overlap becomes id; cubic completed Frobenius not global | No global operations inferred on general R | Supplier labels replaced |
| §5.6 completed base change | Identity, zero, ℤ→toric ℤ[t] | Same ring,0,ΣP_n tⁿ respectively; latter absent from H[t] | Derived/flat distinction retained | Supplier labels replaced |
| §5.7 classical comparison | A=R=ℤ | ψ^m(3)=3 for all m; overlaps are ordinary coefficient extension/re-expansion | No duplicate classical construction | None |
| §5.8 étale discriminant localization | ℚ,Δ=1; ℚ(i),Δ=2 or 1 | Discriminant supports ∅,{2}; Δ=2 removes ramification despite −4 not dividing 2; Δ=1 leaves double root x²+1=(x+1)² mod 2 | Radical support formulation correct | Same Lean signature |
| §5.9 GSWZ ring comparison | ℚ,Δ=1,2; ℚ(i),Δ=2 | Classical H; at Δ=2 prime-2 terms 0; Gaussian order-four algebra R×R | Ring needs discriminant support, not 6 | Arithmetic supplier requirement clarified |
| §6.1 completed module pullback | Identity, finite rank n=0,1,2; ℤ→ℤ[1/2] | Pullback ranks 0,1,2; level-2 quotient ℤ[1/2][q]/(q²−1)=ℤ[1/2]² | Perfect modules need no extra completion | Supplier labels replaced |
| §6.1 arbitrary sums need completion | ΣP_n e_n | Mod P_r only n<r nonzero, but full vector has infinitely many nonzero coordinates | Infinite algebraic direct sum insufficient | None |
| §6.2 transported Picard character | ξ=0; ξ+(−ξ); F=ℚ(i),Δ=12 | Classes 0 and 0; 6 divides 12 and −4 divides 12 although 24 does not | Global module and tensor contract retained | Explicit unresolved prerequisite |
| §6.3 q−1 completion map | ℤ; ℤ[1/2] valuation-one idempotent | Classical map injective; nonzero e₁ goes to 0 after inversion | Relative Taylor injectivity fails in general | None |
| §6.4 order-one evaluator | R=M=ℤ, evaluators id,−id,0 | t(3)=3,−3; zero evaluator cannot hit 1 | Integral evaluator determines normalization | Missing integral contract retained |
| §6.4 inverse/evaluator laws | Evaluator −id over ℤ | t⁻¹(1)=−1, e(−1)=1, e(3)·(−1)=3 | Sign and inverse laws agree | None |
| completedLineCoeffAlgebra | R=ℤ, scalar X,2,1+X acting on 3 | Values 0,6,3 respectively | Constant coefficient action, not X=1 | Explicit binders verified |
| §6.5 completedRegulatorTriviality | P=B=R[[X]], R=ℤ,ℤ×ℤ,0 | Quotient P/XP=R; lifts 1 and 1+X both units, different for ℤ; zero case unique equivalence | No locality or Noetherianity needed | Same Lean signature |
| §6.6 completed Picard vanishing | ξ=0; general supplied trivial first fiber | Class of B⊗_H H is 0; any supplied rank-one basis identifies completed line with B and class 0 | Does not infer precompletion class nonzero | Missing contracts retained |
| §6.7 supported field pullback | Identity embedding, successive embeddings | H⊗_H M=M; (H″⊗_H′H′)⊗_H M=H″⊗_H M | Only imported actual equivalences give arithmetic naturality | Missing contract retained |
| §7.1 four conjugate lifts | 2786,7825,1963,2066 mod 11⁴ | Residues 3,4,5,9; Φ₅ at each is 0 modulo 14641 | All four factors retained | None |
| §7.2 prime-inversion components | p=2, valuations 0,1,2 | Edges at 2 impose 0=0; idempotents e_a²=e_a; c(e₀)=1,c(e₁)=c(e₂)=0 | Product not domain | None |
| §7.3 cubic Frobenius obstruction | x³−2 mod 5 | (x−3)(x²+3x+4); quadratic values at 0,1,2,3,4 are 4,3,4,2,2; Frobenius x⁵=2x²=4x+2 on quadratic factor | Nontrivial quadratic Frobenius cannot be global identity | None |
| §7.4 finite-stage obstruction/corollary | R=ℤ; cubic at p=5; m=1 | φ_p(3)=3 for ℤ; cubic quadratic component 4x+2 differs from x; m=1 has no prime divisor | Marked ℤ[q]-algebra formulation retained | None |

# Final validation

`lake build TauCetiRoadmap.HabiroRings.Suggested` exited 0 with seven expected “declaration uses `sorry`” warnings and no errors. Exact completion line:

```text
Build completed successfully (8976 jobs).
```

Dependency-direction output (exit 0; no UPWARD, CYCLE or moved line):

```text
depcheck: 28 roadmaps, 253 edges, 0 problem(s)
```

The full gate exited 0 after the repair commit; the earlier run found only the two uncommitted repair files, and all its content counters were already zero. The worktree is clean and nothing was pushed.

gate HabiroRings: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
