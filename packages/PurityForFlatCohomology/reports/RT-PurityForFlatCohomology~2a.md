<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2153#issuecomment-6486226235 -->
Red team round 2 pass a (codex) of cfdb8a6

Verdict: needs_changes

1. **F01** (P2) The support formalism and continuity have a circular build order

   **Location:** `packages/PurityForFlatCohomology/README.md:469`, “by §0.3”; `:503`, “*Needs:* … §0.2”.

   **Claim:** Every target of §0.2 precedes §0.3, while the stalk comparison in §0.2 already uses §0.3.

   **Witness:** The explicit edges are §0.2 (geometric stalk formula) → §0.3 (continuity) → §0.2 (support triangle). This is an internal cycle, invisible to the roadmap-level dependency check.

   **Exact repair:** “In §0.2 construct the support triangle and the local-to-global spectral sequence. In §0.3 first prove absolute continuity, deduce supported continuity from that triangle, and then prove the geometric-stalk identification for finitely presented group schemes and quasi-coherent coefficients when the open complement is quasi-compact.” Move the stalk-formula target and its neighbourhood Check from §0.2 to the end of §0.3; update its uses accordingly. The order becomes triangle → continuity → stalk formula. For a separable closure of a field, the colimit of Kummer H¹ groups and the resulting stalk are both zero.

2. **F02** (P3) The empty punctured spectrum is assigned dimension zero

   **Location:** `packages/PurityForFlatCohomology/README.md:433`, “puncturedSpectrum K is empty; its dimension is 0”.

   **Claim:** The empty scheme has Krull dimension zero.

   **Witness:** For K = 𝔽₂, U_K = ∅, whose prime-specialization poset is empty. `Mathlib/Order/KrullDimension.lean:600` gives dimension ⊥ for an empty poset; Spec K has dimension 0.

   **Exact repair:** “For a field K, puncturedSpectrum K is empty and has dimension ⊥; ringKrullDim K = 0.” This distinguishes the two computed dimensions, ⊥ and 0, and agrees with the zero-ring Check.

3. **F03** (P2) The Brauer comparison is applied to unrestricted punctured spectra

   **Location:** `packages/PurityForFlatCohomology/README.md:1870`, “in particular for every quasi-affine X such as Spec R and puncturedSpectrum R”.

   **Claim:** The punctured spectrum defined for every commutative ring is automatically a quasi-compact quasi-affine scheme to which the ample-bundle theorem applies.

   **Witness:** Let R = k[x₁,x₂,…] localized at (x₁,x₂,…). Its punctured spectrum is ⋃ᵢD(xᵢ), with no finite subcover: (x₁,…,xₙ) is a nonmaximal prime missed by the first n opens.

   **Exact repair:** “In particular this applies to every quasi-compact open subscheme of an affine scheme, including Spec R for any R and puncturedSpectrum R when R is Noetherian, or more generally when that open is quasi-compact.” Retain the ample-bundle theorem at full generality. The displayed infinite-variable example is excluded from this application; k⟦x,y⟧ has U = D(x) ∪ D(y) and remains included. The hypotheses are explicit in dJ02 lines 8–11 and `Mathlib/AlgebraicGeometry/QuasiAffine.lean:34` includes `CompactSpace`.

4. **F04** (P3) The recorded library pins are not the review pins

   **Location:** `packages/PurityForFlatCohomology/README.md:181,218`, “Pinned at” followed by `6b7abb3c…` and `a91d3aaf…`.

   **Claim:** Those hashes identify the Mathlib and Tau Ceti used for the acceptance test.

   **Witness:** `lake-manifest.json:8,18` records Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` and Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; both supplied library checkouts have exactly those HEADs.

   **Exact repair:** Replace the two recorded hashes by Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Revalidate the acceptance file against those pins when compiled artifacts are available. This review's source checks used the supplied checkouts, whose HEADs agree with the manifest, rather than the stale hashes.

## Earlier findings: verification at this head

The two earlier reviews reuse F01–F06; A and B below identify the review. Quotations are from this head, not from the repair report. The disputed B-F03 was independently checked and is settled: its original premise was wrong.

| Earlier ID | Status | Repaired passage and location | Recomputed witness |
|---|---|---|---|
| A-F01 | repaired | README §1.4(c): “if R is strictly henselian” | F₂, ℓ=3: H¹=ℤ/3, dual stalk H⁻¹=0; excluded. Over F̄₂ both vanish. |
| A-F02 | repaired | README §3.2: “RΓ_Z(A, G) → RΓ(A, G) → RΓ(U_A, G)” | A=k⊕k[1], Z=∅: fib(id)=0; replacing U_A by Spec k gives k[1]. |
| A-F03 | repaired | README §7.3: “Hom(𝒪_G, 𝒪_Y) ≅ Hom(𝒪_Y, 𝒪_Y)” | Constant C₂ torsor: 4=4; old source 8. Constant S₃ torsor: 36=36; old source 216. |
| A-F04 | repaired | README §7.6: “Pic(X) ≅ Pic(Y)” and “outside Y” | Four-dimensional hypersurface: 0≅0; 0↪ℤ cannot suffice. SGA2 lines 3830–3852 give the additional hypotheses. |
| A-F05 | repaired | README §7.3: “𝒪_Y is finite locally free, hence coherent reflexive” | Punctured-line module k[y,y⁻¹] is not reflexive; excluded. Supplier §0.6:715–729 supplies the asserted coherent reflexive pushforward. |
| A-F06 | repaired | README §2.2: “étale sheafification … is 0” | At F_p the quotient presheaf is F_p, its sheafification 0; at F̄_p both 0. |
| A-F07 | repaired | README §5.7: “a a nonzerodivisor (every component a_i ≠ 0)” | Over 𝒪_C, a=p: both groups μ_p(C); a=0: both groups 0. |
| A-F08 | repaired | Suggested.lean:54: “the grading … exists” | Zero ideal and (xw−yz) have quotient gradings; neither supplies the distinguished twisting bundle. Pinned Quotient.lean:88 defines the grading. |
| A-F09 | repaired | Suggested.lean:156,173,183 add the fixed-basis, endomorphism-freeness and factoriality statements | Rank 0: empty basis/free zero module; F=cφ in rank 1: λ^(p−1)=c⁻¹; End(Rⁿ) and n copies of Rⁿ both rank n²; fields/DVRs are UFDs. |
| A-F10 | repaired | README §7.16: “injectivity in degree 1 from §0.5(b)” | Three-dimensional node: depth 3, Pic(U)=ℤ; Hartogs applies without parafactoriality. |
| A-F11 | repaired | README §7.9: “A smooth plane cubic” | Smooth cubic has infinite prime-to-characteristic torsion; complex cusp gives torsion ℤ/3. |
| A-F12 | repaired | README §5.4: “R_i = 𝔽₂ for every i” | Direct sum misses (1,1,…); all-zero factors give 0→0; one nonzero factor gives identity. |
| A-F13 | repaired | README §2.3: “Spec 0 → Spec ℤ … not a pro-fppf cover” | Flat/finitely presented: yes; image ∅; faithfully flat: no. |
| A-F14 | repaired | README §1.7: “Situation 0EHC with 𝔞 = 𝔪” | dim 4,d=1: 4>3; dim 3: 3>3 false. The removed locus is now bound. |
| A-F15 | repaired | README §3.6: “For a perfectoid A … termwise p-adically completed Čech nerve” | Identity cover: completed tensors A. Over ℤ_p the old uncompleted tensor has finite-rank coefficient matrices, whereas diag(p,p²,…) has infinite rank. The repair does not assert its completed tensor is perfectoid. |
| A-F16 | repaired | README Mathlib contract and Suggested.lean:28: “output universe w′ is a separate parameter” | Pinned cohomologyPresheaf takes coefficient universe v and outputs w′; v=w′ and v<w′ both match the description. |
| A-F17 | repaired | Suggested.lean:32–39 explicitly lists crystalline formula, deformation, continuity, excision and descent | Missing animated and Dieudonné carriers are named; no replacement by arbitrary predicates. |
| B-F01 | repaired | README §3.1: “Theorem 5.1.13, p. 52” | CS24 line 2171 follows page-52 marker 2143. |
| B-F02 | repaired | README §3.5: “Corollary 5.4.5, p. 68” | CS24 line 2832 follows page-68 marker 2830. |
| B-F03 | repaired (original allegation refuted) | README supplier contract retains “§0.4 Algebra.CotangentComplex” | Main DerivedModuleAlgebra README:818 defines that very object; :825–828 gives its signature. The repair report's reason is correct. |
| B-F04 | repaired | README Scope: “Lean restatement IsCompleteIntersection” | Added equivalence uses ℚ in residue characteristic 0, ℤ_(p) otherwise; regular rings give regular Cohen factors; (x,y)² needs three relations and is not CI. |
| B-F05 | repaired | README Scope and Downstream consumers: “is to import” | Wording records intended ownership moves rather than asserting completed imports. Claims about virtual dimension and the three-generated counterexample were removed from the deformation roadmap's allocation. |
| B-F06 | repaired | README Layer 0 Examples: “together with injectivity of H²(R,μ_p) → H²(U_R,μ_p)” | For ℝ⟦x,y⟧, p=2, H²(R,μ₂)=ℤ/2; surjectivity on H¹ alone only embeds the supported H² into that group. |


## Verified sound

Read all 2,495 README lines and all 205 Lean lines. The inventory is 77 numbered sections, 250 Check bullets evaluated, 58 subsidiary API bullets, nine conventions, five final worked examples, and 12 Lean declarations (five constructions and seven admitted theorems). The tables below record computed tests rather than treating successful elaboration as evidence of truth. Findings S01–S04 are exceptions to the otherwise consistent statements. All 23 earlier findings have a disposition above; none is silently carried forward.

### Lean declaration and context table

All names below are in `TauCetiRoadmap.PurityForFlatCohomology`. There are no section-level mathematical variables: the universe variables are `u v`; every required ring/module/field hypothesis is explicit in the declaration. A `CohenPresentation` also introduces structure projections and two instance attributes; these project real fields, not admitted data. The table covers the five constructions and seven theorem declarations, not automatically generated recursors.

| Declaration; README section | Actual variable/instance context | Computed positive and negative controls | Result/change |
|---|---|---|---|
| puncturedSpectrum; 0.1 | R : Type u; CommRing R; no semilocal instance | Field: ∅; DVR: Spec Frac(R); k×k: ∅; zero ring: ∅. For k[x], J=0 and U=∅, so it cannot mean removing just the closed points outside the stated semilocal use. | Body correct; S02 corrects a Check. |
| CohenPresentation; 1.1 | R : Type u; CommRing, IsLocalRing; regular local ring B : Type u; surjection B→completion R | R=k[[x]]: identity has kernel 0; k[[x,y]]→R has kernel (y). A singular identity presentation fails the regular-ring field. | Correct data, same universe. |
| IsCompleteIntersection; 1.1 | CommRing R, IsLocalRing R; ∃presentation and finite list | k[[x,y]]/(xy): weakly regular one-element list, proper kernel; k[x,y]/(x,y)²: three generators, height two, fails. Empty list gives regular R. | Weak regularity suffices since surjection onto nonzero local completion forces a proper ideal. Non-Noetherian values expressly unused. |
| virtualDimension; 1.1 | Same R context; integer infimum | k[[x]]: 1−0=2−1=1; node: 4−1=3; k[x,y]/(x,y)²: 2−3=−1. Thus no natural-subtraction truncation. | For Noetherian R the defining set is nonempty and a singleton; no empty-infimum shortcut in theorems. |
| finiteEtalePullback; 1.8 | X,Y : Scheme u; f:Y→X; finite∩étale morphism property | Identity preserves every cover and arrow; pullback of two points to ∅ identifies distinct arrows. | Real restriction functor, correct direction X-covers→Y-covers; no false universal faithfulness. |
| zariskiNagata_full_faithful_connected; 1.8(a) | CommRing, IsLocalRing, IsNoetherianRing R; 2≤vdim | k[[x,y]]: vdim2, U connected, Hom sets unchanged. k[[x,y]]/(xy): vdim1, two components, excluded. Field: vdim0, U empty, excluded. | Correct range; deep theorem, not a one-lemma restatement at pins. |
| zariskiNagata_isEquivalence; 1.8(b) | Same instances; 3≤vdim | Three-dimensional node: 3≥3; finite étale covers extend. Complex A₁ surface: vdim2, puncture has a nontrivial double cover, excluded. | Correct strict boundary and no excellence assumption. |
| frobeniusSemilinear_exists_fixed_basis; 5.6 | p prime; K field, CharP p, IsAlgClosed; M AddCommGroup, Module, FiniteDimensional; bijective F semilinear for Frobenius | Rank0: empty basis. Rank1 F=cφ: λ^(p−1)=c⁻¹; p2 gives λ=c⁻¹. Over perfect closure of F₃(t), F=tφ would require valuation −1/2∉ℤ[1/3]; algebraic closure is essential. | Correct, both universes retained. |
| free_of_endomorphisms_iso_pi; 7.2 | R regular local; M finite reflexive R-module; r:ℕ; nonempty linear equivalence End(M)≃Mʳ | M=Rⁿ: n²=rn forces r=n if n>0; M=0 permits every r and is free. Singular A₁ rank-one reflexive ideal has End(M)=R≄M and is excluded twice. | Correct criterion, no bare arbitrary endomorphism assumption. |
| isRegularLocalRing_uniqueFactorizationMonoid; 7.4 | CommRing, IsRegularLocalRing R | Field/DVR: factorial; regular dimension2: height-one primes principal; k[[x,y,z]]/(xz−y²) has xz=y² with nonassociate factors, is not regular. | Native domain instance supplies meaningful UFD conclusion. No duplicate at supplied pins found. |
| localPicard_torsion_eq_one; 7.7 | CommRing, IsLocalRing, IsNoetherianRing; CI; dim≥3; x in native line-bundle class group; IsOfFinOrder x | Three-node Pic=ℤ, finite-order subgroup 0; A₁ surface Pic=ℤ/2, excluded by dimension; identity bundle has order1 and equals1. | Correct multiplicative identity and torsion predicate. |
| localPicard_subsingleton; 7.6–7.7 | Same instances; (CI∧dim≥4)∨regular | Field and DVR punctures Pic0; regular surface Pic0; four-dimensional ordinary hypersurface Pic0. Three-node Picℤ is excluded. | Correct disjunction, including regular dimensions0 and1. |

The seven theorem declarations survive the one-tactic probe: none computes a boundary case, merely unfolds a definition, or follows from a located pinned theorem. No padding deletion is requested. The deep end results and inputs represented are Zariski–Nagata purity, Frobenius fixed bases, Auslander's criterion, factoriality, and local Picard purity. The module docstring explicitly excludes, with missing carriers, flat/étale supported purity, crystalline and perfectoid formulas, animated deformation/continuity/excision/descent, torsors and gerbes, Brauer purity and residues, multiplicative-type purity, global complete-intersection Picard groups, and the fundamental-group formulations. No replacement `Prop` or admitted carrier is introduced.

### README target and adversarial-instance table

Each row covers the bold mathematical target(s) in the numbered section, including its clauses. Within a row, semicolons separate independent controls; “0” denotes the zero cohomology group, and “identity” specifies both sides of a comparison. Conditions expressly excluded by the statement are tested as negative controls rather than counted as counterexamples. The five real definitions also have their three-or-more discriminating Checks recorded here and in the Lean table. Purely organizational bold labels and reference labels are not mathematical targets.

| Section / target | Instances and computed values on both sides | Result / change |
|---|---|---|
| 0.1 punctured spectrum | Field: U=∅, dim U=⊥ versus claimed0; DVR: Γ(U)=K≠R; k[[x,y]]: D(x)∪D(y), Γ=R but U≠Spec R; k×k and zero ring: U=∅, ring dimensions0 and⊥ respectively. | S02. |
| 0.2 supported cohomology | Z=∅ gives fib(id)=0; Z=X gives fib(H→0)=H; DVR,Gm: H¹_Z=K×/R×=ℤ; A¹,Ga: H¹_{0}=k[t,t⁻¹]/k[t]; H⁰_Z=0 although Ga(Z)=k. | Mathematics correct; construction order S01. |
| 0.3 continuity | Filtered separable extensions kill every Kummer class: colim H¹(−,μ_n)=0=H¹(kˢ,μ_n); full supports recover absolute continuity; empty supports give colim0=0. | Correct under stated finiteness/quasi-compactness; reorder S01. |
| 0.4 regular-sequence vanishing | Coordinate origin in dimension d: H^i=0 for i<d, top class (x₁⋯x_d)⁻¹ nonzero; d=0 imposes no vanishing; ξ and d parameter lifts in A_inf give length d+1. | Sharp lower bound; zero module gives0 in every degree. |
| 0.5 Hartogs | k[[x,y]]→Γ(U,O) is identity; DVR→K is not onto; affine targets inherit the identity on coordinates. Doubled origin admits distinct extensions equal off the origin when separatedness is dropped. | Correct separate hypotheses for functions and morphisms. |
| 1.1 Cohen/CI/vdim | Regular d: d−0=d; extra smooth variable: (d+1)−1=d; node4−1=3; (x,y)²:2−3=−1 while dim0; three-generated example4−3=1 while dim2. A nondiscrete valuation ring with m=m² can have field completion: unused non-Noetherian value0. | Correct integer invariant and genuine regular presentations. |
| 1.2 flat additivity | Identity adds fibre0; k[[x]]→k[[x,y]]/(y²):1+0=1; fibre k[y,z]/(y,z)² contributes−1 rather than dimension0. | Correct; accepted defect-additivity gap. |
| 1.3 depth versus vdim | Twisted-cubic cone: depth2, vdim1; CI: depth=dim=vdim; three-generated depth-zero example: depth0<vdim1. | Neither inequality holds in general. |
| 1.4 local duality | Strict henselian regular d: supported constant coefficient in degree2d is ℤ/ℓ(−d), lower groups0; d0 reduces to vector-space duality; F₂ with ℓ3 has H¹=ℤ/3, so non-strict version would fail. | Repaired strict-henselian clause and twists agree. |
| 1.5 local Lefschetz | Strict henselian DVR cut by uniformizer: degree0 map0→ℤ/ℓ is injective; regular surface cut by x: degree2 map0→ℤ/ℓ(−1) is not onto, whereas degrees≤1 are0→0. Unit cut has empty fibre and is outside hypotheses. | Direction and degrees correct. |
| 1.6 étale depth | Node xy: vdim1, H⁰ support0 but next group sees two components; regular d has stronger2d bound; depth-zero three-generator ring has étale H⁰0 despite Ga H⁰≠0. | Does not confuse coherent depth with étale depth. |
| 1.7 algebraization | a=m, dim4,d1:4>1+2; dim3 gives3>3 false; formal empty open contributes0. Transition poles of order n² cannot satisfy a single linear bound cn. | Correct uniformity and repaired removed locus. |
| 1.8 Zariski–Nagata | Regular surface full/faithful; node xy disconnected at vdim1; A₁ surface has π₁(U)=ℤ/2 versus trivial strict-local π₁; three-node vdim3 gives equivalence; field restriction to∅ is not faithful. | Correct ≥2/≥3 separation. |
| 2.1 crystalline module | Constant ℤ/pⁿ: W_n with F=pφ,V=φ⁻¹; μ_pⁿ: F=φ,V=pφ⁻¹; α_p: F=V=0; product base gives product modules. In each case FV=VF=p, including p2. | Covariant normalization correct. |
| 2.2 low-degree Ext | Artin–Schreier at F_p: section cokernel F_p, sheaf cokernel0; at F̄_p both cokernels0; μ_p: V−1=−1 on its characteristic-p module, hence no fixed sections. | Sheaf versus section quotient repaired. |
| 2.3 pro-fppf | AS on F̄_p is onto, on F_p has zero image; adjoining roots kills any AS obstruction; Spec0→Specℤ has empty image and is not a cover. | Faithful flatness retained. |
| 2.4 perfect key formula | Constant ℤ/p: H⁰=ker(φ⁻¹−1), H¹=coker, higher0; μ_p and α_p over perfect affines have zero positive flat cohomology, agreeing with the two-term formula. | Correct equalizer/fibre convention. |
| 3.1 animated points | Square-zero Gm kernel1+M≃M; Ga fibre M, boundary into M[1]; μ_p has two cotangent terms in degrees−1,0, unlike a smooth group. | Correct shift and smoothness distinction. |
| 3.2 animated cohomology | Discrete A agrees with ordinary cohomology; A=k⊕k[1], empty Z gives fib(id)=0, truncating open incorrectly gives k[1]; μ_p duality pairs ζ with (ζ^i), for n2 (1,ζ). | Repaired open carrier; evaluation rather than inverse convention. |
| 3.3 deformation | F_p[ε]/ε²: α_p sections εF_p and H¹=εF_p versus0 over F_p; Gm infinitesimal kernel1+εF_p; split extension has zero connecting class. | No false nilpotent invariance for non-smooth groups. |
| 3.4 p-continuity | Units of ℤ_p equal lim(ℤ/pⁿ)×, including−1 at p2; flat μ_p cohomology over F_p(s) has higher-degree restrictions unlike an étale replacement; ℤ and ℤ_p differ in H¹(μ_p), so completion hypothesis matters. | Correct derived hypotheses. |
| 3.5 excision | Identity gives identity; unit support yields0; ℤ_(p) and ℤ_p have supported Kummer degree2 ℤ/p; replacing by ℚ makes support empty and loses that group. | Completion comparison is necessary. |
| 3.6 hyperdescent | Identity Čech nerve totals to A; completed tensors over a perfectoid base remain in supplier's class; ℤ_(p)→ℤ_p is mod-p identity. An ordinary infinite-rank tensor lacks diag(p,p²,…), so ordinary/completed tensors cannot be interchanged. | Correct repaired completed-nerve Check. |
| 4.1 characteristic-p depth | Regular dimension2: Ga/α_p/ℤ/p support in degrees0,1 is0; dual numbers have α_p section ε≠0; three-generated ring has nonzero supported xy. | Depth hypothesis does work. |
| 4.2 root extraction | Zero ideal gives identity; roots of x of order pʲ have degree pʲ; k[[x,y]]/(x²,xy) has (x)≃k, not free over k[[y]], excluding a fake regular-sequence step. | Correct regularity requirement. |
| 4.3 finite flat reduction | Identity cover is unchanged; adjoining t^(1/p) to regular one-variable base has zero-dimensional CI fibre; k[x,y]/(x,y)² has three relations in codimension2 and fails fibre-CI. | Correct use of accepted flat-CI gap. |
| 4.4 equal-characteristic purity | Regular dimension2: supported H⁰,H¹=0; CI node has bound below its dimension; non-CI three-generator example has α_p supported xy≠0. | No restriction to good primes. |
| 5.1 prismatic module | Zero G gives zero module; over perfect field ξ=p, μ and constant modules reduce exactly to §2.1; FV=φ(ξ), VF=ξ for both displayed semilinear pairs. | Composition order and covariance agree. |
| 5.2 low-degree prismatic comparison | AS returns ker/coker of Frobenius−1; over algebraically closed valuation ring finite torsors split and H¹=0; μ_p sections in mixed characteristic are μ_p(C), not0. | Correct characteristic distinction. |
| 5.3 descent reductions | Identity maps give equality; valuation-cover equalizer recovers base sections; multiplication p on a p-torsion-free module is injective but on F_p is zero. | No unjustified cancellation of p. |
| 5.4 products of modules | Infinite F₂ product contains (1,1,…), direct sum does not; singleton gives identity; zero factors give zero. Quotient modulo pⁿ is componentwise. | Correct product, not sum. |
| 5.5 products of Dieudonné modules | Singleton identity; μ_pⁿ gives product(A_inf(A_i)/pⁿ); empty product has zero ring and zero module; componentwise F,V preserve the normalization. | Correct scope of finite-presentation assertion. |
| 5.6 fixed vectors | Rank0 empty; cφ on rank1 gives λ^(p−1)=c⁻¹; p2 and3 work over algebraic closure. Perfect closure F₃(t) lacks valuation−1/2 needed for tφ. | Algebraic closure cannot be weakened to perfection. |
| 5.7 valuation products | Nonzero a in O_C: G(O_C)=G(C); a=0 would instead give G(0)=0; p-inverted μ_p over mixed characteristic has p elements, over characteristic p only identity; infinitely many factors have ultrafilter primes. | Repaired nonzerodivisor, no false finite-product spectrum. |
| 5.8 arc descent | Identity cover totals identically; O_C is acyclic in positive finite-flat degrees; ℤ_p⟨t⟩ mod p is F_p[t], whose Frobenius misses t, so it is not a perfectoid control. | Correct domain. |
| 5.9 perfectoid key formula | Perfect base recovers §2.4; constant ℤ/p gives AS; mixed-characteristic O_C has absolute μ_p sections ℤ/p but supported sections at its closed point0. | Keeps supports on both sides. |
| 5.10 perfectoid purity | d regular parameters give vanishing below d; d0 imposes no H⁰ vanishing (constant F_p gives F_p); full zero-group coefficient gives0 throughout. | No accidental field vanishing. |
| 6.1 completion exactness | Noetherian quotients have bounded torsion; ℤ_p⟨x⟩/(x)=ℤ_p; classical p-completion of ℚ_p/ℤ_p is0 while derived completion is ℤ_p[1]. | Distinguishes classical and derived completion. |
| 6.2 CI purity | k[[x,y]]: H^i=0 for i<2; ramified ℤ_p[[x,y]]/(p−xy), dim2: same bound at p2 or3; Veronese CM examples have nonzero H² in dimension≥3. | CI cannot be weakened to CM. |
| 6.3 general étale bound | Three-generator ring vdim1 has étale H⁰0; CI gives vdim=dim; Artinian square-maximal-ideal quotient has U=∅ and H⁰(constant)=ℤ/p, but vdim−1 gives no positive bound. | Correct negative boundary. |
| 6.4 α_p counterexample | xy≠0, x·xy=y·xy=z·xy=t·xy=0 and (xy)^p=0; dim2, vdim1, depth0. Thus H⁰(α_p)≠0 whereas H⁰(ℤ/p)=0. | Counterexample really separates flat and étale. |
| 6.5 regular purity | DVR: supported H⁰,H¹=0, H²(μ_p)=ℤ/p; dimension2 α_p kernel on top local cohomology0 since Frobenius sends negative exponents to p-multiples injectively; field H⁰(constant)≠0 is excluded. | Correct ≤dim range. |
| 7.1 global purity | Regular codimension2 with d3: isomorphism through degree1, injection in degree2; two disjoint fields with one removed gives (ℤ/2)²→ℤ/2 noninjective and is excluded; divisor removal can add a Kummer class. | Correct repaired max(d−1,1). |
| 7.2 Auslander | Free rank n gives End rank n² and Mⁿ rank n²; M0 works for all r; reflexive rank-one ideal on singular A₁ has End=R≄M. | General criterion retained, no rank assumption needed. |
| 7.3 torsors/gerbes | Trivial C₂ torsor: Hom(O_G,O_Y) and End(O_Y) both rank4; S₃ both36; α₂ rank2 likewise4. A₁ punctured double cover fails extension outside regular case. | Noncommutative controls and repaired linear algebra. |
| 7.4 factoriality | Fields, DVRs and ℤ_p[[x]] have principal height-one primes; singular xz=y² supplies two inequivalent factorizations. | Regularity essential. |
| 7.5 parafactoriality | Regular surface: depth2, Pic0; DVR: Pic0 but Γ(U)=K≠R; A₁: Picℤ/2; three-node: Picℤ. | Pic0 alone does not define parafactoriality. |
| 7.6 local Lefschetz | Regular dimension4: Pic0; three-node Picℤ shows dimension3 insufficient; dimension4 quadric puncture Pic0. The intermediate comparison must be an isomorphism: injection0→ℤ would not suffice. | Repaired theorem/SGA2 condition. |
| 7.7 local Picard | Three-node Picℤ has torsion0; field and DVR Pic0; smooth elliptic-cone dimension2 has nonzero torsion. | Dimension3 torsion-free versus dimension4 vanishing separated. |
| 7.8 CM failure | n-variable quadratic Veronese has punctured Picℤ/2; for n≥3 its supported μ₂ H² is nonzero despite CM depth n; n2 is a CI surface and violates no i<2 bound. | Correct threshold. |
| 7.9 global Picard | Smooth dimension3 CI Picℤ generated by O(1); quadric surface Picℤ²/ℤ(1,1)=ℤ; smooth plane cubic quotient has infinite torsion; cuspidal cubic over ℂ only ℤ/3 torsion. | Repaired smoothness Check. |
| 7.10 Gm torsion/injectivity | Field H¹=0 and higher groups torsion; regular DVR H² embeds in fraction field; affine regular surface has torsion H². Segre-cone non-torsion example lacks geometric factoriality. | Correct degree≥2 and factorial-strict-local condition. |
| 7.11 Brauer comparison | Field central simple algebras give Br=H²; affine and quasi-compact punctured opens admit the ample application; non-torsion H² on the Segre example is not Azumaya. Infinite-variable local U is not quasi-compact. | S03. |
| 7.12 regular surface bundles | Reflexive modules in dimension2 are free; dimension3 second syzygy can be nonfree; singular A₁ puncture has nontrivial line bundle. | Surface and regular assumptions retained. |
| 7.13 local Brauer | W(k)[[x,y,z]] and dimension≥4 CI give Br(U)=Br(R); strict henselian regular surface both0; dimension3 CI suspension can have infinite punctured Br. | Correct sharp regular/CI alternatives. |
| 7.14 sharpness | Smooth elliptic cone S dim2, suspension R dim3: Br(R)=0 but Br(U_R) infinite; Segre S dim3, suspension dim4: surviving non-torsion H² does not contradict torsion Brauer purity. | Distinguishes Br from all H². |
| 7.15 multiplicative type | D(ℤ)=Gm, D(ℤ/n)=μ_n; norm-one real torus has sign-character lattice; α_p has Cartier dual α_p, not an étale character lattice, and Ga is not reconstructed from its zero character group. | Correct local system and contravariance. |
| 7.16 low-degree multiplicative purity | Regular surface: Pic0 and unchanged Br; μ_p Kummer classes extend; A₁ Pic0→ℤ/2 is not onto, outside hypotheses. Hartogs works on three-node despite Picℤ. | Repaired H¹ injectivity route. |
| 7.17 higher multiplicative purity | Regular codimension2, d3: iso through1, inj at2; μ_n recovers finite-flat comparison; three-node Pic0→ℤ is not surjective and is excluded by factoriality conditions. | Correct degree boundary. |
| 8.1 strict-local Brauer | Strict regular surface H²(U,Gm)=0; W(F̄_p)[[x,y,z]] p-primary group0; strict CI dim3 may have infinite Br(U). | Not generalized from regular to arbitrary CI. |
| 8.2 finite étale descent | Identity has zero kernel; finite fields, C((t)), and maximal unramified p-adic fields have required small dimension; ℝ has H²(Gm)=ℤ/2 and fails that hypothesis. Finite étale semilocal regular base has Pic0. | Repaired commutative domain in descent. |
| 8.3 henselian tori | Strict-local split torus gives H¹=H²=0 on puncture; ℤ_p[[x]] has Br0; norm-one real torus H¹=ℤ/2 supplies excluded residue-field control. | Correct small-residue-field condition. |
| 8.4 coniveau | Point support localizes to its local scheme; Dedekind case has only codimensions0,1; codimension-one points on A¹ are dense but not a closed subset, so the filtration uses closed supports. | Direct sums and localization distinguished. |
| 8.5 torus support vanishing | Strict regular dimension2: degrees≤3 zero; Cartier divisor Gm has H¹ supportℤ and is excluded; degree4 is not asserted zero. | Correct codimension/degree. |
| 8.6 torus purity | Pic restriction is iso; A²_C puncture has Br0=Br(A²_C); regular codimension2 gives H² isomorphism, stronger than generic degree2 injection from d3. | No contradiction with weaker bounds. |
| 8.7 global Brauer purity | Remove origin from regular surface: Br unchanged; remove divisor from A²−other axis: cyclic algebra acquires nonzero residue; CI threefold counterexample excluded. | Correct closed codimension≥2. |
| 8.8 generic H² injection | Split torus gives Brʳ injection; field map identity; real norm torus on P¹ has nonzero generic kernel, excluded by local-base condition; Weil restriction gives corresponding finite-étale Br injection. | Correct local hypothesis. |
| 8.9 codimension-one intersection | Dedekind semilocal base: unramified classes equal intersection; field has empty intersection interpreted as whole H²(K,T); global real norm example fails injectivity but is outside local base. | No empty-index-set trap. |
| 8.10 Brauer intersection | Field intersection is Br(K); Specℤ unramified intersection0; cyclic (x,y)_n has residue [y] at x and is excluded from intersection. | Correct embedding/ambient group. |
| 8.11 flasque tori | Trivial/permutation lattices have Ext¹(−,ℤ)=0 for all subgroups; sign C₂ lattice has Ext¹=ℤ/2; testing only regular permutation lattice would miss the obstruction. | Correct universal subgroup condition. |
| 8.12 norm-one counterexample | Real norm torus: positive real numbers are norms, −1 is not; gluing its nontrivial class gives nonzero H² on P¹ but generic restriction0. After extension to ℂ the torus splits. | Correct failure of global generic injectivity. |
| 8.13 unramified descent | Perfect residue maximal-unramified field Br0; imperfect separably closed k can have Br(k((t)))[p]≠0; completion need not inject Br(ℚ)→Br(ℚ_p), so only the extension criterion is used. | Essential p-primary caveat. |
| 8.14 DVR residue | ℤ_p: invariant/residue ℚ/ℤ; C[[t]] target0; imperfect separably closed residue: target0 with nonzero p-primary Br, explaining removal of that part; unramified class residue0. | Correct qualification. |
| 8.15 residue sequence | ℤ_p:0→ℚ/ℤ→ℚ/ℤ; ℝ[[t]]:ℤ/2→(ℤ/2)²→ℤ/2; arithmetic Frobenius has value1/n, inverse −1/n (different at n3, same at n2, both0 at n1). | Sign and splitting calibrated. |
| 8.16 global residues | Specℤ: finite residues determine real invariant by reciprocity, giving injection Brℚ→⊕_pℚ/ℤ; characteristic-zero residue has no excluded primary part; characteristic-p imperfect residues require the stated omission. | Direct sum finite support, not unrestricted product. |
| 8.17 imperfect residues | At (p) of ℤ_p[[x]], residue field F_p((x)) has valuation groupℤ and x has no pth root; at (x), residue Q_p has characteristic0; dimension1 has no height≥2 point. | Correct characteristic/p-height distinction. |
| 8.18 divisor removal | uv=ζvu gives order-n residue represented by y, with χ(σ)=1/n for σ(y^(1/n))=ζy^(1/n), at x; opposite commutation reverses the class; n1 class0, n2 sign agrees, n3 distinguishes; removing only origin leaves the divisor residue obstruction. | Nonzero residue establishes the claimed failure. |

### Conventions and worked examples

| Convention/example | Computation and exclusion of the wrong model |
|---|---|
| Closed support versus the closed subscheme | A¹,Ga: kernel(k[t]→k[t,t⁻¹])=0 but Ga({0})=k. The fibre construction excludes evaluating on Z. |
| Cohomological shifts | For a two-term map A→B in degrees0,1, H⁰=ker and H¹=coker; a square-zero fibre M is M[0], its boundary has target M[1]. |
| Nonnegative indices and order1 | μ₁ and ℤ/1 are trivial; Kummer uses n≥1; p prime excludes p0,1. No division by0 or use of truncated natural subtraction. |
| Covariant crystalline operators | μ: (φ,pφ⁻¹), constant: (pφ,φ⁻¹), each FV=VF=p; α_p both0. Swapping μ and constant would change fixed sections. |
| Prismatic operators | μ: (φ,ξφ⁻¹) gives FV=φ(ξ), VF=ξ; constant: (φ(ξ)φ,φ⁻¹) gives the same composites. A scalar rescaling without modifying both operators fails these equations. |
| Cartier duality/evaluation | μ_n paired with ℤ/n sends (ζ,i) to ζ^i; for i0 value1, i1 valueζ, i2 valueζ². Inversion differs at n3. |
| Residue normalization | Uniformizer valuation1, unit valuation0; arithmetic Frob on unramified cyclic generator has character1/n. Inverting it produces−1/n. |
| Brauer terminology | Br is torsion Azumaya/cohomological subgroup under comparison, not arbitrary H²; the Segre construction's non-torsion classes stay outside Br. |
| Puncture/semilocal convention | k×k removes both points, giving∅; deleting just one would give Spec k. |
| Worked example1: three-node | dim=vdim=3, Pic=ℤ, Pic torsion0, supported finite-flat groups below3 zero; dimension≥4 Brauer clause does not apply. |
| Worked example2: three relations | dim2, vdim1, depth0, α_p sectionxy≠0, étale constant supported sections0. |
| Worked example3: regular surface | dim2, supported finite-flat groups through2 zero, Pic0, Br(U)=Br(R); strict-local version gives Br0. |
| Worked example4: valuation ring | Generic and integral finite-group points agree by properness; higher groups vanish for algebraically closed fraction field; therefore supported complex0. |
| Worked example5: ℤ | Hamilton quaternion residues:1/2 at2,0 at all odd primes; real invariant1/2 makes total0 modℤ. |
### Subsidiary API targets

The numbering after each section is the order of its API bullets. These remain README targets, not candidates for padding `Suggested.lean`.

| API target | Computed witness; result |
|---|---|
| 0.1.1 membership | DVR: generic prime omits m, closed prime contains m; exactly generic point retained. |
| 0.1.2 quasi-compactness | k[[x,y]] has the two-open cover D(x),D(y); infinite-variable counterexample in S03 has no finite subcover. |
| 0.1.3 emptiness iff dimension0 | k×k: both true; DVR: both false; zero ring: empty but dimension⊥, expressly excluded. |
| 0.1.4 finite base change | R→R×R: inverse image is U⊔U and equals the two punctures; R→R/m: inverse image∅ equals puncture of the field. |
| 0.1.5 completion/henselization | DVR gives generic point on both sides; field gives∅ on both; closed fibre remains dimension0. |
| 0.1.6 Hartogs | Regular surface Γ(U)=R; DVR Γ(U)=K≠R is excluded. |
| 0.2.1 localization | DVR,Gm: R×→K×→ℤ, kernel of valuation R×, cokernel0. |
| 0.2.2 excision | A¹ at0 versus D(t−1) at0: principal parts both k[t,t⁻¹]/k[t]; identity étale neighborhood gives identity. |
| 0.2.3 triple | Z′=Z gives H_Z→H_Z→0; Z′=∅ gives0→H_Z→H_Z. |
| 0.2.4 spectral sequence/stalks | At separably closed field only degree-zero stalk survives; colimit of Kummer H¹ is0. Reorder as S01. |
| 0.2.5 Mayer–Vietoris | U=V=Spec k: 0→k→k²→k→0, diagonal followed by difference; composition0. |
| 0.2.6 finite flat descent | Split degree-two cover R×R: degree s has 2^(s+1) factors, split augmented Čech complex contracts to R. |
| 0.2.7 comparison | DVR,Gm supported H¹=ℤ on fppf and étale sides; A¹,Ga principal parts identical on fppf and Zariski sides. |
| 0.2.8 nested supports | Z=∅ gives0∘RΓ_W=0; Z=W gives idempotent support; coordinate point in a divisor recovers the same point support. |
| 1.1.1 existence | Equicharacteristic R=k[[x]] uses itself; ramified ℤ_p[[x]]/(p−x²) uses unramified ℤ_p[[x]]. |
| 1.1.2 independence | k[[x]]:1−0=2−1=1 after adjoining y and killing y. |
| 1.1.3 inequality/CI iff | Node:3=3 and CI; square-maximal-ideal quotient:−1<0 and not CI. |
| 1.1.4 invariant under completions | k[x]_(x) and k[[x]] both vdim1; separable coefficient-field extension adds fibre dimension0. |
| 1.1.5 r equations | Quotient regular surface by x:1=2−1; by zero:2≥2−1, so inequality cannot be equality for arbitrary equations. |
| 1.1.6 regular/hypersurface | Regular dim2 has vdim2; quotient by x² has dim=vdim1 despite nilpotents. |
| 1.1.7 relative/absolute CI | Regular residue-characteristic-zero example over ℚ and characteristic-p example over ℤ_(p) both have regular Cohen factors; square-maximal-ideal quotient fails both CI criteria. |
| 1.1.8 CM and stability | Hypersurface x² has depth=dim1 before/after completion; non-CI Artinian ring remains non-CI under strict henselization. |
| 1.8.1 identity/composition | Pullback along two identities returns the same finite cover and arrows; the canonical comparison is identity. |
| 1.8.2 PurityHolds | Strict regular surface covers extend; A₁ punctured double cover is absent from the essential image. |
| 1.8.3 coproducts | Two trivial sheets pull back to two sheets; zero sheets remain∅. |
| 2.1.1 exactness | 0→μ_p→μ_p²→μ_p→0 gives0→W₁→W₂→W₁→0 with injection p and quotient mod p. |
| 2.1.2 base change | F_p→F̄_p sends W_n(F_p) to W_n(F̄_p), retaining the same displayed F,V. |
| 2.1.3 annihilator | μ_pⁿ module W_n is killed by pⁿ; n1 gives W₁=R; n0 gives trivial group/module0. |
| 2.3.1 composition/base change | Identity stays identity; filtered p-power root extensions remain flat after base change; zero algebra projection is flat but not faithful. |
| 2.3.2 topology comparison | Polynomial faithful-flat cover remains fpqc; Spec0→Specℤ fails all covering notions despite flatness. |
| 2.3.3 perfection | Perfect base's identity unchanged; perfection kills nilpotent thickness, preserving the faithfully flat perfect-base cover. |
| 3.2.1 animated open/support | Empty open gives0; full open gives RΓ(A,G); empty support fibre(id)=0 even for A=k⊕k[1]. |
| 3.2.2 étale truncation | Square-zero thickening and residue field have the same finite étale algebras; ramified μ_p does not qualify. |
| 3.2.3 convergence/comparison | Discrete A gives constant Postnikov tower; for smooth Ga and k⊕k[1], both cohomologies retain the k[1] term. |
| 3.2.4 Bégueri resolution | Trivial G gives0; μ_n embeds by ζ↦(ζ^i) into units on its dual; i0 coordinate1 and i1 coordinateζ show injectivity. |
| 5.1.1 fibre LES | Perfect-base μ_p: V−1=−1, kernel/cokernel0; constant ℤ/p over F_p: V−1=0, kernel=cokernel=F_p. |
| 5.1.2 functoriality/support direction | Identity leaves D unchanged; ∅⊂Z gives0→D_Z, not a map forcing D_Z=0. |
| 5.1.3 exact coefficients | Split G′×G″ yields D=D′⊕D″ and split distinguished triangle. |
| 5.1.4 principal-open supports | Z=V(t): A→A[1/t] has H⁰ fibre t-power torsion, H¹ fibre A[1/t]/A. For t unit both0. |
| 7.5.1 criterion | DVR: Pic0 but depth1 and not parafactorial; regular surface: Pic0/depth2/parafactorial. |
| 7.5.2 dimension | Field dim0 and DVR dim1 fail; regular surface dim2 succeeds. |
| 7.5.3 factorial implication | Regular surface and its strict henselization have depth2 and Pic0; factorial DVR fails stated dimension condition. |
| 7.5.4 descent | k[x,y]_(x,y) and completion both have Pic-puncture0; zero-dimensional closed fibre adds no removed generic points. |
| 7.5.5 local criterion | Empty Y imposes no condition and restriction is identity; divisor generic stalk is DVR, hence fails. |
| 7.15.1 operations | Kernel of n:Gm→Gm is μ_n; quotient Gm/μ_n=Gm; dual character map is multiplication n on ℤ. |
| 7.15.2 torus resolution | μ_n=ker(Gm→Gm); Gm embeds into Gm² as first factor with quotient Gm. |
| 7.15.3 multiplication factorization | T=μ_n×Gm, m=n: S=Gm, kernel μ_n×μ_n=T[n]; composite sends (ζ,t)↦(1,tⁿ). |
| 7.15.4 smooth comparison | Gm fppf H¹=Pic=étale H¹; μ_p in characteristic p is not a torus and cannot use smooth comparison. |
| 8.8.1 restriction to open | Field identity unchanged; injectivity on every nonempty open is explicitly part of the local-base result. |
| 8.8.2 Gm | Regular DVR unramified Br injects into Br(K); ℤ_p source0. |
| 8.8.3 flasque | Split torus gives products of those injections; real sign lattice has Ext¹=ℤ/2 and is excluded. |
| 8.8.4 products iff | Kernel for T₁×T₂ equals ker₁⊕ker₂; zero iff both zero, including trivial T₂. |
| 8.11.1 quasitrivial | Permutation module ℤ[Γ/H] has Ext¹ intoℤ equal H¹(H,ℤ)=0; direct summands retain0. |
| 8.11.2 splitting independence | Inflating a trivial lattice still gives H¹(finite subgroup,ℤ)=0; the sign obstruction persists after a dominating cover. |
| 8.11.3 generic injection | Split torus Brʳ embeds generically; counterexample norm torus is not flasque. |
| 8.14.1 completions | ℤ_(p),ℤ_p have v(p)=1 and residue character1/n for the same unramified cyclic extension. |
| 8.14.2 unramified base change | Residue of an unramified class is0 before/after; degree-f residue extension restricts finite-field character1/n to f/n. |
| 8.14.3 cyclic normalization | σ(y^(1/n))=ζy^(1/n), uⁿ=x, uv=ζvu: residue χ(σ)=1/n. For n3 inverse convention gives2/3. |
### Ownership, suppliers, pins and dependency direction

The supplier audit covers the 16 named roadmap contracts in README:239–384, the ten resolver leads, the five declared gaps, and the actual pinned carriers. It used the content checkout for existing roadmaps, the supplied open-head files for new roadmaps, and the board design for PerfectoidQuotientsPartII. A missing library implementation of a named roadmap target is not treated as a missing supplier.

| Supplier / citation | Resolution and hypothesis comparison |
|---|---|
| SchemeAndStackFoundations §§0.4,0.6 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:685–729` supplies Hartogs and reflexive extension; the latter assumes depth≥2 on the complement, not merely coherence of an arbitrary sheaf. Target §7.3 now supplies reflexivity. |
| SchemeAndStackFoundations remaining cited sections | The named henselization, depth/CM, perfection, torsor/gerbe, site-cohomology, comparison, Kummer/AS, formal-module and Brauer targets occur in §§0.12–0.14,0.17,0.24,1.15,1.18,2.1–2.3,2.7,2.9–2.11,2.15,2.22,3.4,4.7–4.10. In particular `Ring.IsCohenMacaulay` occurs at :1139 and `SchemeBrauerGroup.toCohomologicalBrauer` at :4405. The latter factors into torsion for quasi-compact or connected schemes; the roadmap's clopen torsion convention handles its general formulation. |
| LocalPurity §§1.1,1.3,2.1,2.2 | `TauCetiRoadmap/LocalPurity/README.md:177,218,259,302`: local puncture and PurityHolds, completion criterion, regular-ring purity and extension; current package adds the semilocal puncture and vdim generalization, not a second proof plan for regular étale purity. |
| ModularCurves Layer4D | `TauCetiRoadmap/ModularCurves/README.md:1165–1188`: strict henselizations, completions, preservation of regularity and dimension. Fields and regular surfaces retain dimensions0 and2. |
| EtaleCohomologyFoundations F.0.2,F.5 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:203,1179`: finite-étale Galois category and duality. The supplier's trait domain is not silently used as arbitrary-dimensional duality: §1.4 owns the extension. |
| LefschetzPencilsAndVanishingCycles §0.10 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:700,854`: regular Noetherian ambient/closed schemes, pure codimension, invertible coefficient. Applied at closed point codimension d, shift−2d and twist−d agree. |
| PurityOfBranchLocus §0.3 | `TauCetiRoadmap/PurityOfBranchLocus/README.md:180,185,197`: CM-freeness over regular local rings, Auslander–Buchsbaum, regular localizations. No claimed all-module freeness; finite/reflexive hypotheses remain in §7.2. |
| DerivedDeRhamCohomology §§0.19,0.21,1.10 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:346–380,413–425,538–552`: the three resolver names are planned there. Complete-flatness criterion requires Noetherian base, nonzerodivisor and classical completeness; it is not arbitrary complete flatness. |
| DerivedModuleAlgebra §§0.K.1,0.4,0.25,1.5,1.7 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516,818,1303,1808,1973`: regular Koszul resolution, genuine cotangent complex, square-zero obstructions, bounded-torsion completion and complete flatness. This resolves B-F03 without a new gap. |
| EnhancedDerivedSheaves E5:animation.1–4 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1900,1949,1978,1994`: animated rings/Frobenius and modules. No claim that these exist in Mathlib today. |
| PerfectoidSpaces cited P1/P3/P4/P7 targets | `TauCetiRoadmap/PerfectoidSpaces/README.md:4525,4611,4652,5049,5101,8424,11053,11144,17400,17417,17489`: θ, primitive generator, integral perfectoid comparison, algebraically closed tilt, perfect prism, André cover and regular towers. The additional explicit tilt presentation is a declared gap, not silently supplied here. |
| PerfectoidQuotients §§0.1,0.2,0.6 | `TauCetiRoadmap/PerfectoidQuotients/README.md:910–980` includes products and completed tensors over a perfectoid base, root quotients and completed étale constructions. Thus the repaired §3.6 uses the correct base hypothesis. |
| PerfectoidQuotientsPartII Q5.2,Q5.4,Q6.3–7,Q7.1,Q7.3,Q10.1 | `packages/PerfectoidQuotientsPartII/design/README.md:109,141,249–332` and its Q7/Q10 headings supply these targets. Resolver's “no roadmap” lead is a board-index limitation, not a missing dependency. Valuation-ring results allow higher rank; mixed-characteristic localization at the zero prime is expressly excluded. |
| PrismaticCohomology §2.0; PrismaticCohomologyPartII Layer4 | `TauCetiRoadmap/PrismaticCohomology/README.md:2657–2710` explicitly includes FormalArc.PerfectoidBasis, coverByValuations, henselian completion comparison and structure-sheaf acyclicity. The finite-group Dieudonné equivalence is separately declared as a gap; no inference from absent current Layer4 implementation. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.40–41,R07.2.8 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:2616,2643,3306`: local abelian embedding, complete-flat descent and perfect-field classification. Its Dieudonné functor is contravariant: constant group's F is invertible. Composing with Cartier duality gives this package's covariant normalization, with μ's F invertible instead. |
| ArithmeticGaloisDuality R02.2.4 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1523–1550`: complete DVR, perfect residue for full Brauer sequence; equal-characteristic finite coefficients invertible. Package uses exactness only and fixes its own compatible crossed-product sign. |

All five slugs occur both in `packages/PurityForFlatCohomology/design/plan.json` and under “Exact supplier contracts”: prismatic-dieudonne-perfectoid (PrismaticCohomologyPartII Layer4); complete-intersection-presentations, flat-local-complete-intersection, ci-defect-additivity (DerivedDeRhamCohomology §§0.19/0.21); regular-tower-tilt (PerfectoidQuotientsPartII Q10.1). Their rings, finiteness, flatness and normalization hypotheses are explicit. They name owners and ask for missing extensions of those suppliers, not an implementation already located at the pins. The classification's exactness/base-change/normalization clauses describe one equivalence, not unrelated tasks. Acceptance remains conditional on these contracts; their current absence is not a finding.

Object searches used `roadmaps grep` for supported flat cohomology, virtual dimension, parafactoriality/local Picard, multiplicative-type groups, Dieudonné modules, regular factoriality, torus/Brauer residues and animated deformation, then the supplied local main, board-package and sibling files. The main overlap owners are already imported: LocalPurity for the local puncture and regular étale extension; SchemeAndStackFoundations for general sheaf/Brauer carriers; DerivedDeRhamCohomology for relative CI; the perfectoid/prismatic suppliers for their carriers. The package owns the new supported-flat purity results and the stated generalizations. Later-roadmap overlaps are recorded as intended imports in README:116–134 and its downstream section, not upward dependencies. No fully qualified collision with a kept Lean declaration was located. Open pull requests lacking supplied files were not independently inspected for ownership, even where the index search mentioned them.

The read-only requested dependency command returned:

```text
depcheck: 188 roadmaps, 1239 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This roadmap-level check does not resolve S01's internal section cycle.

At the actual manifest pins, `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50` defines the class as the skeleton of invertible sheaves; `TauCeti/RingTheory/RegularLocalRing/Basic.lean:124` supplies the domain instance; `TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean:88` supplies the quotient grading. Mathlib's `CategoryTheory/Sites/SheafCohomology/Basic.lean:45–90` separates the coefficient and Ext-output universes and still does not supply the missing big-site restriction interface. Its `AlgebraicGeometry/QuasiAffine.lean:34` includes compactness in quasi-affineness, and `Order/KrullDimension.lean:600` assigns ⊥ to an empty poset. None of these native definitions silently supplies the missing twisting bundle, supported group-scheme cohomology, animated carriers, or scheme Brauer group.

Policy inspection: the git diff against origin/main is confined to `packages/PurityForFlatCohomology/`; the Lean file has one `import Mathlib` and exactly the two used Tau Ceti modules. No `set_option`, `lemma` declaration, admitted data, arbitrary condition field, algorithm, PR number or process narrative was found in its mathematical README/docstrings. No Lean or package mutation was performed during this review; only this report and scratch notes were written.
### Source locator audit

The following are **100 individually identified locator checks**, grouped by work. “Verified” means the cited statement and its relevant hypotheses were read, not that every proof in that work was independently reconstructed. Printed-page conventions follow the cited preprint/edition; page markers in extractions are not substituted for printed pages. The five Stacks chapter supplements were fetched through the sources service under the existing STACKS key; no source text was copied into the repository.

| Source | Count | Verified locators and extraction anchors |
|---|---:|---|
| CS24 | 40 | Lemma3.2.3 line1356; Theorems3.2.4 line1381,3.3.1 line1418; Lemmas4.1.3 line1500,4.1.6 line1547, Theorem4.1.8 line1567, Lemmas4.1.11 line1605,4.1.12 line1636; Lemma4.2.3 line1698, Proposition4.2.4 line1701, Lemma4.2.6 line1717, Proposition4.2.7 line1735, Lemma4.2.8 line1764, Propositions4.2.9 line1768,4.2.10 line1778; Theorem5.1.13 line2171, Proposition5.2.4 line2256, Theorems5.2.6 line2318,5.2.8 line2356, Corollary5.2.9 line2366, Theorems5.3.5 line2444,5.4.4 line2816, Corollary5.4.5 line2832, Theorems5.5.1 line2849,5.5.2 line2893, Corollary5.5.3 line2939; Theorems6.1.1 line3430,6.1.2 line3459,6.2.3 line3491,6.2.4 line3540, Remark6.2.6 line3562, Theorem6.2.7 line3566; Theorems7.1.2 line3630,7.1.3 line3664,7.2.1 line3707, Remark7.2.2 line3727, Theorem7.2.5 line3765, Remark7.2.6 line3780, Theorems7.2.8 line3828,7.2.9 line3871. |
| C19 | 14 | Theorems1.1–1.4 lines30,45,48,87; Lemma2.1 line111; Propositions2.2–2.3 lines130,147; Corollary2.4 line172; Lemma3.2 line248; Theorems5.3,6.1,6.2 lines464,493,520; LemmaA.2 and TheoremA.3 lines574,581. The noncommutative limitation of Proposition2.2 is recorded below. |
| SGA2 | 7 | X3.4 line3390; XI3.13 line3754; XI3.17 lines3830–3852; XII3.7 line4319; XIV5.2 line7398,5.4 line7458,5.5 line7466. |
| SGA1 | 2 | V6.9 line4650 and V6.10 line4659; full faithfulness corresponds to surjectivity on π₁, equivalence to isomorphism. |
| ILO14 | 4 | XV1.2.4 line10362; XVI3.1.1 line11520; XVII0.9 line12220 (arXiv numbering); XVIII-A2.2 line16269. |
| EGA44 | 3 | 21.13.7 line13005;21.13.8 line13007;21.13.9 line13020; parafactoriality includes extension of functions, not Pic0 alone. |
| BC22 | 1 | Lemma2.3.2 line1126, supported local-to-global spectral sequence for an abelian fppf sheaf. |
| ALB23 | 1 | arXiv-v4 Theorem5.1.4 line3145: exact antiequivalence; dualizing G produces the covariant formulation. The p≥3 restriction is explicitly removed at line3154. |
| BS22 | 2 | Theorem7.14 line2391 and Proposition8.10 line2619; perfectoid base and formal arc basis are retained. |
| Kat73 | 1 | Proposition4.1.1 line2310, fixed-basis argument lines2328–2336; specialize n=1 and algebraically closed base field. |
| Lau13 | 1 | Corollary6.5 line1310; covariant equivalence, with exact construction through p-divisible resolutions. |
| Ces15 | 1 | LemmaB.14 line1330; smooth commutative group and square-zero immersion, flat test spaces. |
| Beg80 | 1 | Proposition2.2.1 line746, standard smooth resolution. OCR obscures some displayed symbols; CS24's use fixes the intended dual and groups. |
| CTS87 | 3 | Definition1.2 line378, Theorem2.2 line505, Lemma2.4 line605. In the last, the displayed formula is partly lost by extraction; the proof identifies polynomial invariance, not a broader base-change statement. |
| Gro66 | 2 | Proposition1.4 line129, Corollary1.8 line161; strict-local factoriality and Noetherian hypotheses retained. |
| Poo17 | 2 | §6.8 residue construction lines8105–8123 and Warning6.8.2 line8125; the imperfect-residue p-primary exclusion is explicit. |
| Koh72 | 1 | TheoremA line28, three-generated ideals with prescribed projective dimension; no CI claim. |
| EGA2 | 1 | 7.1.7 line5519, dominating DVR requires nonfield local domain and finitely generated fraction-field extension. |
| EGA42 | 2 | 5.10.5 line4597;6.1.2 line5471, coherent depth and flat dimension formula, respectively. |
| dJ02 | 1 | Theorem1.1 lines8–11, quasi-compact separated scheme with ample invertible sheaf; S03 corrects the unqualified application. |
| STACKS | 10 | 07DV line7566 and07C3 line14640 in Algebra;0913 line3484 in More on Algebra;09Q1 line941 and09Q7 line1042 in Divided Power Algebra;0DX9 line224 in Local Cohomology;0DXR line1678,0EHC line2258,0EJP line3399 in Algebraization;023M line305 in Descent. The codimension inequality in0EJP was also compared with §1.7. |

## Not verifiable

- **Lean elaboration:** no Lean command was run, as required by the read-only brief. The supplied signature run exited1 because `TauCeti/AlgebraicGeometry/LineBundle/Class.olean` was unavailable and printed no signatures. The declaration table is a manual binder/instance audit; it is not a claim that `#check @name` succeeded. No changes to signatures resulted from this audit.
- **Settled inaccessible primary sources:** DF84 Remark3; Avr77 Proposition3.6; Aus62 Theorem1.3; Gro68 Brauer references; MB85 Lemma2; Bou78 IV5.1,V4.9; Gab04b Conjectures2–3; BH Definition2.3.1; SGA3 IX–X; SGA4 V,VII,XVIII; SGA5 I(4.2.2). All eleven works retain their existing uncertified status. No new request was made for them. Where CS24 or C19 supplies an independently readable statement, that comparison was checked without pretending to certify the unavailable original proof.
- **Version and extraction limits:** ALB23 published Theorem5.4 was compared through the explicitly identified arXiv-v4 Theorem5.1.4, not a second inspection of the typeset publication. Likewise ILO14 published XVII0.2 was checked as arXiv XVII0.9. Lost displayed formulas in Gro66, CTS87 and Beg80 cannot be certified symbol-for-symbol from the extraction; their surrounding assertions and CS24/C19 uses are readable. Supplemental bibliographic locators not individually enumerated in the source table, notably EGA2 4.5.3 and EGA44 21.13.6/21.13.10/21.13.12.1, are not included in the certified count.
- **Open work:** object searches covered the available main, board and supplied sibling material. Ownership against open pull requests for which the brief supplied no files was not checked by fetching additional heads. No missing-source request remains: the one failed guessed Stacks chapter URL was resolved through the canonical tag URL. The five declared supplier gaps remain contractual conditions, not defects.

## Source issues

- **Error** in CS24 at Theorem7.1.2, printed p.87, line3630: the source allows a field in the regular alternative when d=1; it should require regular dimension at least max(d−1,1); affects a stated result.
- **Misprint** in CS24 at proof of Theorem3.3.1(b), printed p.35, line1453: the source attaches an unexplained subscript d to R in the virtual-dimension hypothesis; it should use R; affects nothing.
- **Misprint** in CS24 at proof of Theorem6.2.7, printed p.85, line3578: the source ends the parameter list with x_n although the presentation has d parameters; it should end with x_d; affects nothing.
- **Misprint** in CS24 at proofs of Theorems7.2.1 and7.2.5, printed pp.89–90, lines3726,3774: the source includes n=0 in its Kummer-exponent range; it should require n≥1; affects nothing.
- **Gap** in CS24 at Lemma4.1.12 and proof of Theorem6.2.7, printed pp.40,85, lines1636,3576: the source states n<dim R but later uses n=dim R; it should remove that unused bound from the lemma; affects the proof.
- **Gap** in C19 at Proposition2.2, printed p.4, line130: the source's noncommutative argument treats only the fibre over the trivial torsor; it should assume commutativity or supply a twisting argument for every fibre; affects the proof.
- **Misprint** in SGA2 at XI Lemma3.17(e), printed p.107, lines3830–3852: the source places the added closed-point parafactoriality condition inside Y; it should place it outside Y, where the proof applies it; affects the proof.
- **Misprint** in SGA2 at XIV Proposition5.2 proof, printed p.199, lines7422–7424: the source writes the quotient J/I although J is contained in I; it should write I/J; affects the proof.
- **Misprint** in BC22 at Lemma2.3.2 proof, printed p.27, line1134: the source calls the cohomology functors left derived while using injective resolutions; it should call them right derived; affects nothing.
- **Misprint** in SGA1 at V Proposition6.11, printed p.114, lines4667–4670: the source reverses both inclusions comparing the image and kernel; it should use image contained in kernel for zero composite, and reverse the other inclusion; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cfdb8a6141e0152574ca7d57d4e76c09b0211ff1", "job": "RT-PurityForFlatCohomology~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
