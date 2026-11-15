<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6888958912 -->
Red team round 2 pass a (codex) of cdb927a

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) Cofilteredness needs an existence hypothesis

   **Location:** packages/HigherHidaAndColemanTheory/README.md:407: “the strict dynamical and the compact dynamical compactifications of a correspondence each form a cofiltered category”.

   **Claim:** Those categories are cofiltered for every correspondence over the allowed base.

   **Witness:** The identity correspondence of A¹ over F₂ has no strict dynamical compactification. Mathlib/CategoryTheory/Filtered/Basic.lean:589 requires a cofiltered category to be nonempty. BP-Hida line 486 proves common refinements, not existence.

   Indeed normalize the closure of the identity graph in any proposed compactification. Its two maps to the separated ambient scheme coincide; its normalization is P¹. At infinity at least one pulled-back boundary ideal has positive order k. Strictness would require (u^(ka))⊆(u^(kb)) with a<b, which is false. Alternatively §2.4 would make the identity-ordinary object F₂[t] finite over F₂. This defect was introduced by the repair of pass-a F02.

   **Exact repair text:** “Each of the three categories of dynamical compactifications is cofiltered or empty. If a compactification of the specified kind exists, its category is cofiltered. Common refinements use unions of the pulled-back boundaries; parallel maps are equalized after taking the closure of the common open correspondence.” Use `IsCofilteredOrEmpty` until existence has been supplied, and `IsCofiltered` only afterwards. In the Tau Ceti supplier contract at README:56, describe Cofiltered.lean:50 as cofilteredness-or-emptiness and :54 as cofilteredness conditional on nonemptiness.

   **Repair test:** For the identity of A¹ the strict category is empty and satisfies the repaired assertion. For a proper point it has the identity compactification, so the stronger cofiltered assertion applies. The strict Siegel existence theorem §3.3 still supplies the needed nonemptiness to its consumers.

2. **F02** (P2) The Klingen calculation mixes normalized and unnormalized Jacquet actions

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1611: “r_(P_Kli)(i_Bχ) has a filtration” followed by “these scalars times δ_(P_Kli)(a)⁻¹”.

   **Claim:** Multiply the central-a eigenvalues on the normalized Jacquet constituents by δ_P(a)⁻¹ to obtain the Klingen operator.

   **Witness:** TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2103 defines r_P=δ_P^(−1/2)⊗V_N; :2213 applies δ_P⁻¹ to the unnormalized π_N. Here a scales the three radical directions by p,p,p², so δ_P(a)=p⁻⁴.

   The first use of π_N in the route is correct. The subsequent geometric-lemma filtration is of r_P, and its central scalars differ from those of π_N by p². The route does not insert that conversion before its second δ_P⁻¹ multiplication. This is a new error in the repair of pass-b F05, not a refutation of the displayed characteristic polynomial.

   **Exact repair text:** “Write π_N for the unnormalized Jacquet action and r_P(a)=δ_P(a)^(−1/2)π_N(a). The Klingen operator corresponds to δ_P(a)⁻¹π_N(a)=δ_P(a)^(−1/2)r_P(a). Since δ_P(a)=p⁻⁴, multiply the central-a scalars of the normalized geometric-lemma constituents by p². With the twisted Satake parameters of §SR.4.5 those scalars are p⁻³αβ, p⁻³αγ, p⁻³βδ, p⁻³γδ, giving the required p⁻¹ products.”

   **Repair test:** At p=3 and parameters (1,1,9,9), the normalized scalars are (1/27,1/3,1/3,3). Multiplication by 9 gives (1/3,3,3,27); multiplication by 81 gives (3,27,27,243), contrary to the target's Check.

3. **F03** (P3) The analytic Cousin target still cites the scheme completion filtration

   **Location:** packages/HigherHidaAndColemanTheory/README.md:1002: “AutomorphicBundlesPartII §3.10; AutomorphicBundlesPartII §3.12”.

   **Claim:** These sections provide the support filtration used by the analytic Bruhat Cousin target §5.7.

   **Witness:** TauCetiRoadmap/AutomorphicBundlesPartII/README.md:724 uses the completion triangle j!j*F→F→î_*î*F and explicitly distinguishes ordinary local cohomology. AdicSpacesPartIV README:5034–5054 supplies analytic closed-support localization triangles instead.

   The category and the support construction both differ. This leftover edge survives the pass-b F03 repair, although the scheme partial-support gap was removed from this target. On an affine line, completion at t=0 has H⁰=k[[t]], whereas ordinary closed-support cohomology has H⁰=0 and H¹=k[t,t⁻¹]/k[t]; the two filtered constructions cannot be substituted.

   **Exact repair text:** Replace these two Needs entries in §5.7 by “AdicSpacesPartIV §F1.10 (de-rham-cohomology-with-supports, its coherent-coefficient closed-support localization triangles); AdicSpacesPartIII §R3.8”. In its route write: “Apply the analytic closed-support localization triangles to consecutive members of the finite Bruhat filtration and form their exact couple. Construct Hecke equivariance from pull–identify–trace and support restriction. The resulting analytic filtration is this target's construction.” Remove the two scheme-filtration entries from Layer 5's Dependencies, since no remaining Layer 5 target consumes them.

   **Repair test:** At the affine-line closed set t=0 the graded closed-support term is (0,k[t,t⁻¹]/k[t]), not the degree-zero completion. On an empty support its term is zero. The integral completion filtration in §3.6 continues to use its original supplier.

4. **F04** (P3) Three definition Checks merely repeat their stated properties

   **Location:** packages/HigherHidaAndColemanTheory/README.md:748,1379,1600: “Replacing the initial torus tower by its tail gives the same object”; “When D=∅ the interior image is all local cohomology”; “Treating each height-one transition as a finite étale cover contradicts its behavior”.

   **Claim:** These count toward the three discriminating Checks required for the definitions in §§4.3, 7.3 and 9.4.

   **Witness:** README:732 already asserts independence of the initial cofinal tower; :1374 already gives the D=∅ identity; :1584 already says the height-one maps are not finite. Each section has only three Checks, including this repetition.

   **Exact repair text:** Replace the respective bullets by the following concrete tests:

   - §4.3: “For the constant-function sub-tower Z/p^m with reduction transitions, the limit is Z_p and its derived reduction modulo p is F_p in degree zero. Stopping at the first coefficient level instead gives F_p, whose derived tensor with F_p over Z_p has F_p in degrees −1 and zero. Thus a single finite coefficient level cannot replace the prescribed completion.”
   - §7.3: “Take A=F⟨t⟩ and a finite slope chart modeled by N=Ae₁⊕Ae₂ with εe₁=0, εe₂=e₁, the faithful ambient Hecke algebra is A[ε]/(ε²). Let the cuspidal image be Ae₁. Its annihilator is (ε), so its faithful image algebra is A; the ambient annihilator is zero. The interior support must therefore have this smaller scheme structure, even though its underlying point set equals the ambient support.”
   - §9.4: “At p=3, a trivialized height-one Igusa torsor of level 3^n has fiber (Z/3^n)×, of cardinality 2,6,18 for n=1,2,3. Each of these two successive reduction maps has fibers of size 3; the inverse-limit fiber is Z₃× and is infinite. This tests the Igusa-level completion separately from the height-one tower transitions.”

   **Repair test:** The first test distinguishes cohomological dimensions (0,1) from (1,1) in degrees −1,0. The second distinguishes algebras of A-rank 1 and 2 despite identical point sets. The third distinguishes the cardinalities 2,6,18 from a fixed finite fiber. None just repeats the section's existing general assertion. These are README Checks, not additions to Suggested.lean.

## Earlier findings, verified individually

| Earlier finding | Status and repaired passage | Witness at this head |
|---|---|---|
| Pass a F01, non-Cartier twists | Repaired. README:34: “an invertible sheaf L_D and a map s_D:L_D→O whose image is I”; :515: “two natural maps of the presentations”. | README:43,525 has O(D)=O of ranks (1,1,1), pulled-back section (1,1,0), and T(0,1,0)=(0,0,1). BP-Hida lines 369–373 support the convention. |
| Pass a F02, extension refinement | Partly repaired. README:406: “For a finite locally free F on X, every strict dynamical compactification receives a strict map”. The missing input is now AdicCoefficientsAndComparisons L2/vector-bundle-extension-cofinal. | Supplier README:1207 states extension over every noetherian affine base. A=Z/4, X=P¹, F=O uses the identity. New unconditional cofilteredness in :407 is S01. |
| Pass a F03, integral model Checks | Repaired differently, correctly. README:1460: “RΓ_Ẑ(Y,O) has H⁰=0 and H¹=B[t⁻¹]/B”. | B=F₃[t]: support is (0,B[t⁻¹]/B); completion is (F₃[[t]],0); Ext¹(B/t^k,B)=B/t^k has dimension k. The prior review's proposed replacement confused completion with supported cohomology. README:1459,1461 supply two other discriminating tests. |
| Pass b F01, BGG ownership and route | Repaired. README:1144: “Algebraic BGG resolution”; :1149: “the image of each differential is closed”. | Jones-BGG lines 890–907 give weightwise approximation and closed images; lines 927–942 give the exact sequence. SL₂ κ=1 uses M(−3)→M(1), generator f²v₁; d²(z²)=2, also nonzero over Q₂. |
| Pass b F02, Verma supplier | Repaired. README:56: “applied to the derived subalgebra, the centre acting through the weight”. | The pinned Verma carrier requires IsKilling. For GL₂ κ=(3,1), the two dot weights (3,1),(0,4) both restrict to central weight 4 and have derived weights 2,−4. The former LieHighestWeight Layer 3 edge is gone. |
| Pass b F03, analytic correspondence Needs | Partly repaired; the specifically listed gap edges were removed, but §5.7 retains the incompatible scheme-filtration supplier (S03). README:928,945,1050,1221,1293,1642 use AdicSpacesPartIII §R3.8; :1661 uses AutomorphicBundlesPartII §3.2. | The ten listed analytic Needs no longer consume gap:coherent-correspondences. That gap remains on the integral partial-support targets. The unchanged design neededBy entries are bookkeeping noted by the repair report, not a new supplier gap. |
| Pass b F04, rational torus convention | Repaired. README:660: “through the unnormalized operators t_naive”. | At p=3,k=2, ν(t)=1/3; twist by −ν gives 3·(U_naive/3)=U_naive. Eigenvalue 3 becomes normalized 1; eigenvalue 1 becomes 1/3. |
| Pass b F05, Klingen proof route | Partly repaired. README:1611: “B(ℚ_p)\GSp₄(ℚ_p)/Kli(p) has ... 8/2=4 elements”. | Dimension and a direct Jacquet route replace the circular quotation, but the normalized/unnormalized conversion is S02. Pilloni-Singular lines 949,959,967 still contain the unidentifiable [24] citation; no invented primary locator is supplied. |

## Verified sound

Read all 1,741 README lines and all 41 Suggested.lean lines. The README has 69 numbered target/import subsections, including the explicitly imported §5.1, hence 68 locally owned target subsections. There are no bold target headings; the numbered headings identify the targets. There are 41 Checks blocks overall: five convention Checks and 160 Check bullets in 40 blocks within the nine layers. The computations below include additional negative controls; a matching example is not a proof of a general theorem.

The eight earlier findings were assessed individually above. There are four findings in this round. The ten declared gap slugs occur in both design/plan.json and the README's named supplier contracts. Their absence from a supplier's present implementation was not treated as a defect. No unowned gap, duplicated implemented prerequisite, good-prime restriction replacing an all-prime target, or new gap was found.

### Acceptance-test inventory

| Suggested.lean item | Section, variables, instances | Result |
|---|---|---|
| `import Mathlib` | File scope; no Tau Ceti imports | One permitted import. |
| Module docstring | Lines 3–37 | Names the ten headlines below and the unavailable geometric carriers. |
| Namespace | `TauCetiRoadmap.HigherHidaAndColemanTheory`; lines 39–41 | Empty; zero theorems, definitions, instances, opaque declarations, examples or section variables. |

There are consequently zero elaborated signatures to compare and zero one-tactic padding candidates. No Lean command was run: the requested per-declaration `#check` inventory is empty, and the read-only/no-build restriction was respected.

| README headline | Explicitly named in Lean docstring | Missing native carrier, not a replacement predicate |
|---|---|---|
| §4.6 derived arithmetic Hida control | Lines 10–15 | Supported Siegel ordinary complex and its universal Iwasawa complex. |
| §4.8 integral Iwasawa Serre duality | Lines 10–15 | Same complexes with geometric duality. |
| §4.9 integral amplitude, genera 1 and 2 | Lines 16–18 | Universal supported Siegel complexes. |
| §8.4 rational amplitude, all genera | Lines 16–18 | Those complexes and analytic-family comparison. |
| §5.8 geometric classicality, regular and singular | Lines 19–21 | Abelian-type Shimura spaces, period tubes and supported coherent cohomology. |
| §7.1 cohomological eigenvariety | Lines 22–24 | Analytic weight and coefficient spaces with their family cohomology. |
| §7.5 interior dimension and deformation | Lines 22–24 | The eigenvariety's interior cohomology sheaf. |
| §7.6 sharp interior bounds | Lines 25–27 | Finite-slope supported Shimura cohomology. |
| §8.5 sharp Siegel bounds | Lines 25–27 | Integral supported overconvergent model. |
| §9.8 two-term Klingen control | Lines 28–31 | Klingen threefold, height-one tower and partial-ordinary complex. |

### Computed adversarial ledger

Each row retains the section's standing datum: Artinian noetherian coefficients and separated finite-type schemes in Layer 2; the integral Siegel datum in Layers 3–4 and 8; the characteristic-zero Coleman datum in Layers 5–7; and the separately specified local or geometric datum in Layer 9. Characteristic-p fields are not admissible substitutes for the characteristic-zero analytic coefficient field. A torus is included in the general root datum; genus zero is excluded by the explicit g≥1 Siegel hypotheses. Empty support and zero coefficient are allowed and give zero cohomology. No natural-number subtraction or division-by-zero total-function convention is hidden in a Lean declaration, since there are none.

| Statement | Instances and computed values on the compared sides | Result / change |
|---|---|---|
| Grading, duality and slope conventions | C=A[0]: H⁻¹(C[1])=A, H¹(C[1])=0. Pairing into A[−2] has total degree 2, not −2. At p=3, 9·3⁻³=1/3 and v=−1=2−3. | Consistent. |
| Presentation twists and support conventions | Three reduced F₂-points with D={b,c}: O(D) has ranks (1,1,1), I_D ranks (1,0,0). On F₃[t], completion gives (H⁰,H¹)=(F₃[[t]],0); closed support gives (0,F₃[t,t⁻¹]/F₃[t]). | Distinguishes the two traps repaired in round 1. |
| §1.1 weight dictionary | C₂, ν=(0,−2): κ=(5,3),(5,1),(2,−2),(0,−2); inverse formula returns (0,−2) in all four cases. Dual κ↦−w0Mκ−2ρ_nc pairs (5,3) with (0,−2), (5,1) with (2,−2). GL₂ k=1 has two chambers, k=2 and k=0 one each. | Correct integer and singular conventions. |
| §1.2 relative slope regions | GL₂ k=2: geometric threshold 2 translates to standard U threshold 1. In the positive quadrant, (−1,10) is neither ≥(0,0) nor ≤(0,0). A rootless torus has no competing chamber. | “Not ≥” is not replaced by componentwise “<”. |
| §2.1 solid operations | Smooth affine plane: q!A=Ω²[2], rank 1 in degree −2; Ω¹ has rank 2 and is wrong. Point: q!A=A. Over Z/4, F₂ has a periodic multiplication-by-2 resolution and unbounded Tor, whereas a flat coefficient A has Tor_i=0 for i>0. | Smoothness, flatness and finite-type restrictions do work. |
| §2.2 dynamics and refinements | Frobenius on the affine-line boundary has pullback multiplicities p and 1, giving strict ratio 1/p; identity gives equal multiplicities 1 and 1, so requires a≥b, contradicting a<b. Proper point has empty boundary and a compactification; A¹ identity has no strict one. | S01. Nonreduced-base extension itself is repaired. |
| §2.3 ordinary localization | On A, T=1 gives A; T=0 gives 0. On Z/p², T=p has T²=0 and ordinary part 0; after replacing the coefficient by Q_p, multiplication by p is invertible and localization gives Q_p. | Separates solid ordinary localization from an indiscriminate rational slope condition. |
| §2.4 strict finiteness | Proper point with T=1 gives rank 1; identity on A¹ gives F₂[t], with basis 1,t,t²,… and infinite rank. The latter has no strict compactification. | The theorem's strictness is essential; also witnesses S01. |
| §2.5 derived coefficient change | Point F=A=Z/9, M=F₃: A⊗^L_A M=M in degree 0. Replacing the flat F by F₃ gives nonzero higher Tor; ordinary tensor would lose it. | Correct derived rather than ordinary base change. |
| §2.6 equivariant perfectness | Γ=C_p, A=F_p: regular A[Γ] is free rank 1 over A[Γ], and augmentation base change is A. The trivial A[Γ]-module A has nonzero higher group homology and is not perfect. | No division by p or semisimplicity assumed. |
| §2.7 ordinary Serre duality | P¹/F₂: RΓ(O)=F₂[0]; H¹(Ω¹)=F₂, so RΓ(Ω¹[1])=F₂[0]. T=0 gives zero on both ordinary sides. | Degree and transpose agree. |
| §2.8(a) finite rank | Proper point with identity: ordinary rank 1, scalar zero: rank 0. Nonproper identity on A¹ would have infinite rank. | Required compactness/factorization retained. |
| §2.8(b) compact support change | Two points with identity and support ranks 2 versus 1 give ordinary ranks 2 and 1; compactness of the individual pairs does not make their support-change arrow invertible. | Cross-support conditions cannot be dropped. |
| §2.8(c) bridge | Three-point map σ=(a,a,b): T² has image the constants, rank 1. The proposed section (1,1,0) is nonzero on b, while T(0,1,0)=(0,0,1) is nonzero on c; the required improving factorization fails. | Corrected presentations exclude the old counterexample. |
| §3.1 degree strata | g=1 at level n=1 gives the two ordinary degree endpoints 0,1; at n=0 both are 0, explaining n≥1. For larger genus the intermediate strata are present, not erased by keeping only endpoints. | No level-zero collision asserted. |
| §3.2 normalized Hecke maps | GL₂ k=2,p=3: at diag(2,3), normalization values 1/6 and 1/9 have ratio 3/2; at diag(2,6), 1/12 and 1/36 have ratio 3. Both ratios have valuation 1, but only the latter equals 3. | Unit factor in E12 correctly retained. |
| §3.3 strict Siegel dynamics | On reduction modulo p^s, a coefficient factor p^n is zero for n≥s; this is nilpotence, whereas multiplication by a unit remains nonzero through every iterate. p=2 uses the declared cofinal tower contract. | All-prime target retained, conditional on the gap. |
| §3.4 supported fixed weight | Restriction to a disjoint support sends a section to 0; identity support sends 1 to 1. A finite-order character −1 contributes −1, not its omitted value 1. | Both support and finite character are carried. |
| §3.5 integral perfectness | [Z_p —p→ Z_p] in degrees 0,1 is perfect, H⁰=0 and H¹=F_p. Its cohomology is not a free Z_p-module. | Does not confuse a perfect complex with projective cohomology. |
| §3.6 integral Cousin sequence | GL₂ weight 1 retains lengths 0 and 1; a scalar 3 on Z/9 is nilpotent since 3²=0. A scalar 1 survives every iterate. | Singular columns remain; incompatible nilpotent columns die ordinarily. |
| §3.7 global ordinary control | k=2,p=3: ν(t)=1/3; the −ν twist multiplies by 3. A naive eigenvalue 3 has normalized value 1, while naive value 1 has normalized value 1/3. | Correct after pass-b F04 repair. |
| §3.8 away-p Hecke action | GL₂ residue cardinality 3: degree equation 16=12+4. E₁₂E₂₁=E₁₁ whereas E₂₁E₁₂=E₂₂, so arbitrary level actions are not commutative. Iwahori products give diag(1,ℓ) versus diag(ℓ,1). | Hyperspecial commutativity and integral convolution distinguished. |
| §4.1 finite group-ring perfectness | F_p[C_p] has dimension p over F_p and rank 1 over itself; 1/p does not exist in F_p. | Uses descent/perfectness, not averaging. |
| §4.2 unipotent-level independence | Unit operator 2 on F₃ has inverse 2 and localizing retains F₃; nilpotent zero operator leaves 0. | Ordinary invertibility is the operative condition, not arbitrary level equivalence. |
| §4.3 universal Igusa complex | Continuous f:Z_p→Z_p, f(z)=z, has infinite image; a locally constant function on compact Z_p has finite image. Completed finite-level functions include f, their uncompleted union does not. | Completion and full continuous coefficients necessary; replace the repeated tail Check (S04). |
| §4.4 admissible perfect dual | Dual of the regular continuous-function representation is Λ of rank 1; dual of the zero representation is 0. A noncompact discrete infinite group has neither this compact-function model nor the same completed group algebra. | Compact-group/admissibility hypotheses retained. |
| §4.5 universal coefficient complex | At u=4,k=1, arithmetic specialization is 1/4, not 4. For Λ in degree i, double dual returns degree i, not −i. | Character inversion and grading correct. |
| §4.6 derived Hida control | [Λ —X→ Λ] specialized at X=0 has H⁰=F,H¹=F; before specialization H⁰=0. Ordinary tensor of H⁰ would predict 0 instead of F. | Derived formulation necessary. |
| §4.7 ordinary Hecke image | Λ[N]/(N²) is finite of rank 2 and nonreduced. A finite-coefficient action modulo p does not determine the action modulo p²: multiplication by 0 and p coincide modulo p but differ modulo p². | Finiteness does not imply reducedness or omit compatible levels. |
| §4.8 Iwasawa duality | At d=3,r=1 the complementary degree is 2 and r+(d−r)=3. C₂ weights pair (5,3)↔(0,−2), (5,1)↔(2,−2). | Inverse/longest-Weyl adjoint and shift retained. |
| §4.9 low-genus amplitude | g=1,d=1: canonical [0,1] or [1,1], cusp [0,0] or [0,1]. At g=2,d=3,r=1, canonical [1,3], cusp [0,1]; dual partner r=2 has cusp [0,2]. | Does not assert integral sharp amplitude for g≥3. |
| §5.1 imported finite-level Bruhat geometry | Rootless torus: one chamber of length 0 and its tube is the whole space. Empty preimage has zero cohomology. | Supplier import, no duplicated local target. |
| §5.2 allowed supports | GL₂ p=3,C=2, depth 1: z=3 is outside the required U while z=9 is inside; the relative intersection removes the excluded point. For the open-disc sequence at n=4,8,12, norms change from 1 on radius 3⁻¹ᐟ² to 3,9,27 on radius 3⁻¹ᐟ⁴. Rootless case sets min=max=C=1 and U=Z=X. | Relative inclusion and positive power prevent E13/E14/E18. |
| §5.3 analytic continuation | U(f)(z)=f(pz) has monomial slopes 0,1,2,…; U² has 0,2,4,…, and cutoff 2 corresponds to cutoff 4. Identity on an infinite Banach space has slope 0 everywhere and is not compact. | Requires an actually contracting positive power. |
| §5.4 level/character control | Averaging on a two-element group uses 1/2 in Q₂, where it exists; it is unavailable in Z₂. | Characteristic-zero finite-level invariants are exact; no integral inference. |
| §5.4a algebraic finite-slope duality | d=2 pairs H⁰ with H_c² and not H_c⁴. An adjoint eigenvalue p² at t corresponds to p² at t⁻¹, hence inverse character p⁻² at t. | Direction and total degree agree. |
| §5.5 geometric bounds | C₂ example gives the two necessary lower bounds 0 and 3 at t₂; slope 2 passes the former and fails the latter. For a torus ρ=0, both root corrections vanish. | Both inequalities needed, no conjectural sharpening used. |
| §5.6 local degree ranges | d=1,ℓ+=0: cusp [0,0], canonical [0,1]; ℓ+=1: cusp [0,1], canonical [1,1]. Dualizing [0,1−ℓ+] gives [ℓ+,1]. | Opposite-sign lengths required. |
| §5.7 Cousin/interior construction | Image of 0:F→F is 0; image of id is F. Image(t:A→A) has a one-dimensional fiber at t=0 although the specialized map has image 0. Completion/local support on A¹ give (k[[t]],0) versus (0,k[t,t⁻¹]/k[t]). | S03 supplier mismatch; no false image/base-change equality in target. |
| §5.8 geometric classicality | Regular GL₂ k=2 has a singleton chamber; singular k=1 has lengths 0,1 and interval [0,1]. | Singular result is an interval, not single-degree concentration. |
| §6.1 analytic normalization | Multiplying an eigenvalue p² by p⁻³ gives p⁻¹ with slope −1; multiplying by a unit u changes the eigencharacter but not the slope. | Full character, not valuation alone, specifies action. |
| §6.1a abelian descent | ±1 on A² in characteristic zero gives generic quotient degree 2, while the fiber over the vertex has basis 1,x,y and dimension 3. Thus finite quotient is not automatically flat. Averaging by 1/2 works over Q₂ and not Z₂. | The regular-target/flatness step and characteristic zero matter. |
| §6.2 supported analytic families | At radius n=1, U lies in B(1,1); a point outside B(1,1) cannot be admitted merely by changing the support depth. Empty support yields 0 in both coefficient models. | Coefficient radius and geometric depth kept independent. |
| §6.3 finite perfect slope blocks | [A —t→ A] is finite perfect but H¹=A/(t) is torsion and not projective; at t invertible it is acyclic. | Correct complex-level perfectness. |
| §6.4 specialization spectral sequence | At t=0 the same complex has two one-dimensional cohomology groups; at t=a≠0 both are zero. | Tor contribution retained. |
| §6.5 algebraic and analytic BGG | SL₂ κ=1: dot-reflected weight −3, not linear-reflected −1; M(−3) maps by f² to M(1). d²(z²)=2≠0 over Q₂. A torus has one term and no BGG differential. | Corrected ownership/closed-image proof; no density-only exactness argument. |
| §6.6 automorphic BGG | C₂ w₁, κ=(5,3;−8): ν=(0,−2;8); Levi reflection gives ν_v=(−3,1;8), hence κ_w(ν_v)=(2,6;−8), outside M-dominance. | Intermediate analytic terms are not incorrectly made algebraic automorphic bundles. |
| §6.6a analytic duality | Split two-point trace pairing is diag(1,1). On P¹,D={∞}, H¹(ω)=1, H¹(ω(D))=0, H⁰(O(−D))=0 and H¹(ω(−D))=2 (dimensions). | Boundary twist must switch sides; duality is over fields. |
| §6.6b analytic slope estimates | C₂ at t₂ gives direct lower bound −3 and a second bound 0; twisting by +3 yields 0 and 3. A slope −1/2 satisfies a −1 direct bound but fails 0. | Corrected transpose bound retains the extra ρ; general continuous weights are not replaced by only algebraic points. |
| §6.7 BGG exclusion | C₂ thresholds 0 and 3 exclude a nonidentity term at λ<3 but not λ=3. In the torus there are no nonidentity terms and the exclusion is vacuous, correctly. | Sufficient region, not an unsupported iff. |
| §6.8 analytic coefficient control | With one surviving BGG term, E₁ has that term and all other entries 0; its abutment is that term. With two terms linked by identity, both cohomology groups become 0 instead. | Exclusion rather than formal specialization proves control. |
| §6.9 family vanishing and torsion freeness | In a domain A=k[x,y], ideal (x,y) is torsion-free of rank 1 but not free at (x,y). | Bottom torsion freeness is not promoted to local freeness. |
| §6.10 family Hecke algebra | Unit double coset sends 1→1, zero map sends 1→0. Matrix generators E₁₂,E₂₁ do not commute. A point support moved by a correspondence is not invariant unless its full inverse-image/support condition is imposed. | Spherical and support hypotheses retained. |
| §7.1 cohomological eigenvariety | All family groups zero gives empty support/eigenvariety. A family only in H¹ still contributes its support; using H⁰ alone would give empty. Replacing negative t-action by inverse recovers the same paired character. | All degrees and the negative-action inversion are required. |
| §7.2 classical points and converse | A one-chamber rootless datum has no BGG obstruction; a nontrivial BGG lift at ν_v≠ν changes the weight coordinate rather than retaining ν. | Full-Weyl lift and sufficient-only converse correctly distinguished. |
| §7.3 interior family support | At t=0, (t)⊗_A k≅k while Im(k —0→ k)=0. | Image is formed before support; no arbitrary base-change claim. Repeated empty-boundary Check: S04. |
| §7.4 interior specialization | The natural map k→0 is surjective and not injective; the map 0→k is injective and not surjective. | The source's one-sided comparison directions are not converted into isomorphisms. |
| §7.5 dimension and deformation | A=k[x], M=A², faithful algebra A[ε]/ε² acting by a Jordan block is finite, nonreduced and has dimension 1=dim A. Zero M gives empty support instead. | Nonempty condition and no reducedness/flatness overclaim. |
| §7.6 sharp interior bounds | GL₂ k=2 has standard threshold 1 and equality 1 is excluded; k=1 has two chambers despite id belonging to Cκ+. C₂ weight (k+2,2) is likewise singular. | Singleton hypothesis is stronger than membership and is kept. |
| §8.1 integral supported model | In R=Z_p[x,y]/(xy−p), y/x∉R but is a unit after inverting p. On (Z/9)[x], factorization through O(V(x)) requires T∈(x): x qualifies, 1 and 3 do not. Closed support of V(t) and V(t²) is identical, whereas Ext¹(B/t^k,B) has dimension k. | All three repaired Checks discriminate. |
| §8.2 ordinary/Coleman comparison | Eigenvalue 1 has slope 0 and lies in the ordinary block; eigenvalue p has slope 1 and is finite-slope but not integral ordinary. | No identification of all finite slopes with ordinary cohomology. |
| §8.3 family comparison | u=1+p,k=1 gives (1+p)⁻¹, not 1+p; k=0 gives 1 on both maps. | Inversion is explicit before specialization. |
| §8.4 rational amplitude | g=3,d=6,r=2: canonical [2,6], cusp [0,2]; dual range reverses about 6. | Rational assertion only, no new integral all-genus theorem. |
| §8.5 sharp Siegel bounds | At κ=(5,3), raw t₂ lower bounds (3,4,4,8) minus the standard normalization 3 give (0,1,1,5). | Exact endpoints agree with §9.3. |
| §9.1 four weights | ν=(0,−2) gives (5,3),(5,1),(2,−2),(0,−2). ν=(1,1−k) gives κ₀=κ₁=(k+2,2). | Singular collision permitted; Fin 4 has no out-of-range case. |
| §9.2 modular curve | k=2 standard threshold 1; k=0 complementary integral threshold 1; k=1 is singular and provides no automatic positive threshold. | Correctly includes both chambers and exact-sequence effects. |
| §9.3 C₂ normalization | At p=3, t₁=diag(p⁻¹,p⁻²,1,p⁻¹) has equal symplectic products p⁻²; changing last entry to p gives products 1 and 1/9. Pairings in the stated four weights are t₁:(6,6,11,11), t₂:(3,4,4,8). | Matrix and multiplier test detects the wrong model. |
| §9.4 height-one ordinary family | Ω(k,2) has highest weight (k+2,2), hence ν=(1,1−k). Λ₁ has one continuous variable; full Borel weights have two derived variables. | Height-one and full-torus families are not identified. Repeated nonfiniteness Check: S04. |
| §9.5 Klingen refinement | p=3,(α,β,γ,δ)=(1,1,9,9): products (1,9,9,81), eigenvalues (1/3,3,3,27). Isolated-root projector uses (X−3)²(X−27) divided by its nonzero value at 1/3; it kills a length-two Jordan block at 3. All parameters 1 give no isolated root. | Characteristic polynomial/primary projection sound; proof normalization has S02. |
| §9.6 analytic Klingen family and BGG | (k+1)-st derivative of f(pz) gives p^(k+1)f^(k+1)(pz). k=0 yields thresholds (−2,1); k=3 gives (1,4). For R/(y²), localization keeps dimension 2 while residue specialization has dimension 1 and Tor₁=k. At p=2, f=Σ2^m z^(2^m−1) has convergent coefficients but a primitive's corresponding coefficients are 1, so radius loss is real. | Correct factor, generalized eigenspace and derived weight fiber. |
| §9.7 extension range | r=2,k=0 gives H⁰ extension bound 1; combining all-degree bounds instead gives min(1,−2)=−2. At r=0,k=0 the extension bound is −3. | Degree-zero and all-degree ranges not confused. |
| §9.8 Klingen control | At p=2,k=0 rational control is asserted, but the torsion range k>3 starts at k=4. For p=3, values 20,2,10,10,18 have valuations 0,0,0,0,2; units give valuation 0, disproving the source's strict positivity wording. | Nonnegative integrality and the k-dependent torsion restriction retained. |
| §9.9 split unitary weights | n=2,ν=(4,2,0) gives κ=(−3,−5,2),(0,−5,−1),(0,−2,−4). n=1 has two representatives, not three; splitness excludes replacing this with the nonsplit unitary datum. | Indexed weight dictionary agrees. |

### Ownership, pins and dependency direction

The supplier audit located and compared 124 section/target entries: 103 numbered heading matches in the supplier-contract inventory, 17 alphanumeric sections, the three L2 compactification targets, and SR.2.3. All 25 named roadmap supplier blocks were inspected. The incompatible §5.7 edge is S03. The three L2 targets genuinely exist in AdicCoefficientsAndComparisons; the repaired Verma input genuinely exists at the Tau Ceti pin. The Igusa, Banach, abelian-descent and solid-localization strengthenings remain explicitly declared gaps, rather than claims about narrower existing supplier theorems.

| Object searched | Ownership result |
|---|---|
| Generic solid operations, partial supports, completion | SolidAnalyticRings and AutomorphicBundlesPartII, plus the named gaps. This roadmap owns dynamical ordinary finiteness/control, not a second generic six-operation package. |
| Analytic coefficients and normalized torsor maps | OverconvergentAutomorphicForms §§0.4, 8.6–8.7. Higher supported cohomology and the cohomological BGG comparison are the present targets. |
| Compact complexes and spectral/eigenmodule machinery | LocallyAnalyticDistributions §§4.16–4.17 and PadicFamilies §§2a.15–2a.17. The all-degree, all-chamber cohomological eigenvariety here is not the single-module construction. |
| Ordinary towers and Iwasawa duality | CompletedCohomologyPartII §§3.11–3.12 and PadicMeasuresIwasawaAlgebras §§1.1, 1.7 own the generic carriers. This roadmap applies them to the supported Igusa objects. |
| Algebraic versus analytic BGG | Pinned Verma modules are imported; AutomorphicBundles §9.1 owns the relative type-C₂ algebraic construction. The full algebraic Levi BGG resolution and locally analytic exactness needed here are not supplied by that narrower target. |
| Nearest open work | PadicFamiliesPartII imports the present general theory and adds Hilbert–Siegel, category-O and completed-cohomology extensions. GSp4NonregularModularityLifting owns arithmetic lifting/refinement applications, not these supported higher-Hida/Coleman complexes. |
| Klingen local and geometric inputs | SmoothRepresentationsOfLocalGroups owns induction, Jacquet functors and Satake parameters; the isolated-refinement computation belongs here. AlgebraicModularFormsAndSerreWeightsPartII owns the spherical integrality/Hartogs inputs used by §9.8. |

The overlap input reports no second copy, shared modification, dropped cited identifier or identifier defined only by an open revision. Object searches were run through `roadmaps grep` over open heads and main, then the relevant source sections were read. There is no fully-qualified Lean declaration here that can duplicate another roadmap's declaration. PadicFamiliesPartII still describes an earlier sign in this roadmap's §9.6; that stale description is in the later consumer, while the present target has the corrected positive factor.

Pinned checks included Mathlib/Algebra/Module/LinearMap/End.lean:33; Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402; Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,87; Mathlib/Condensed/Module.lean:41; Mathlib/Condensed/Solid.lean:74–85; and the cited Hecke carriers. `CondensedMod` is a sheaf category on CompHaus, not an analytic coefficient category. `CondensedMod.IsSolid` itself warns that the direct predicate is not the general-ring definition. TauCeti/Algebra/Lie/HighestWeight/Verma.lean:140–146 requires characteristic zero, finite dimension, `IsKilling` and a splitting Cartan; its quotient at :195 is not a reductive-centre construction. The present derived-algebra-plus-central-character repair respects this.

The Hecke ring multiplication and anti-involution criterion were checked in TauCeti/NumberTheory/HeckeRing/Associativity.lean:484 and Commutativity.lean:459. They do not themselves supply the missing spherical anti-involution for an arbitrary reductive group; the README correctly imports Satake commutativity instead. Compactification/Basic.lean:54 requires an open immersion, quasi-compactness and properness, but not density. Compactification/Cofiltered.lean:50 supplies `IsCofilteredOrEmpty`; :54 requires `Nonempty` for `IsCofiltered`. This also confirms S01 independently of the mathematical counterexample. The blow-up properness declaration requires a finite-type ideal, as the README says.

`roadmaps resolve` found no cross-roadmap citation or internal Lean name absent from its index. Its warning that it did not inspect pinned Lake packages was not treated as verification of external Lean names; those were inspected directly above.

The prescribed dependency command returned:

```text
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The read-only `git diff --stat origin/main...HEAD` listed 20 changed files, all under packages/HigherHidaAndColemanTheory, with 1,747 insertions and 209 deletions. README and Lean contain no pull-request numbers, process directions, `set_option`, computational algorithm targets or `lemma` declarations. Reports/design files are inside the permitted package folder.

### Sources and expression audit

At least 157 distinct numbered source locators were inspected: 59 in BP-Hida, 62 in BP-Coleman, 31 in Pilloni-Singular (distinguishing a theorem, lemma and corollary sharing a number), three in BP-GL2 and two in Jones-BGG. Broad section references, remarks, proof passages and the extra errata checks are additional, not inflated into that count. These are locator/statement checks, not independent proofs of all cited research theorems.

| Locator group | Evidence read and comparison |
|---|---|
| BP-Hida §2.1 and §§2.4–2.7 | Lines 361–496, 889–1142, 1157–1222: presentations, refinements, ordinary localization, discrete coefficient change, Artinian/equivariant perfectness and transpose duality. S01 is the exception to support for the repaired assertions. |
| BP-Hida §§2.10–2.11 | Lines 1480–1695: proper supported finite rank, nested support maps and bridge hypotheses; the cross-containment reversal is acknowledged in the package. |
| BP-Hida §§4–5 | Lines 2185, 2473–2558, 2582–2689, 2750–2802, 2845, 2876–2989: strict Siegel compactifications, normalization, ordinary Cousin/control and Iwasawa duality. |
| BP-Hida §6 | Lines 3064, 3114, 3150–3306: degree/Bruhat cores, integral support triangle, lattice projection, family comparison and rational amplitude. |
| BP-Coleman support/analytic machinery | Lines 1064, 1271, 1456–1502, 2102, 2282, 2450, 4153, 4427–4561, 4669, 4963–5274: the finite quasi-Stein and compactness assumptions are present. The package explicitly corrects the support-depth and zero-power problems. |
| BP-Coleman geometric conclusions | Lines 5296–5592, 5694, 5784, 6022, 6210, 6247–6275: Cousin, both boundary ranges, duality and regular/singular classicality; no conjectural all-noncompact sharp bound is asserted. |
| BP-Coleman family conclusions | Lines 6691, 6796–6820, 6974–7016, 7194–7343, 7362–7416, 7510–7706, 7771–7986: family slope blocks, BGG, descent, duality, eigenvariety and interior conclusions. |
| Pilloni-Singular | Lines 933–977, 3247–3293, 3655, 3951–4017, 4043–4179, 4533–4833: operator normalization, integral weight range, radius-changing BGG, small-slope extension and Klingen comparison. The source's four-distinct-root lemma does not by itself prove the package's isolated-root extension; the package correctly makes that extension a target with its own proof obligation. |
| BP-GL2 | Lines 80–106 and 114–141: modular Hida/Coleman statements and pull–trace orientation. |
| Jones-BGG | Lines 890–942: closed images plus weightwise approximation, and the locally analytic exact sequence. The algebraic resolution is separately cited, not asserted to follow from density alone. |

For wording, 24 selected definition/theorem passages were compared at README lines 34, 407, 457, 493, 660, 769, 823, 880, 941, 996, 1023, 1130, 1149, 1191, 1217, 1324, 1388, 1400, 1444, 1481, 1557, 1607, 1671 and 1673. Five further proof-route passages were compared at lines 409, 495, 771, 1000 and 1471. No copied or clause-by-clause paraphrased explanatory passage was found. Consecutive word matches were short mathematical phrases or formula fragments (at most seven tokens under the alphabetic-token comparison); the longest ordinary phrase was the standard five-word properness description. No source table, figure, exercise list or numerical dataset is reproduced. The empty Lean file contains no adaptation of an external formalization.

For arrangement, source-bearing parenthetical citation blocks in the nine layers count BP-Coleman 64, BP-Hida 48, Pilloni-Singular 22, Jones-BGG 4, BP-GL2 1 and Humphreys-BGG 1, total 140. This counts a source once in each citation block and excludes the bibliography and errata list. The largest source's contents were read at BP-Coleman lines 17–77. In particular, roadmap §§5.4a, 5.5, 5.6, 5.7 map to source §§5.7, 5.9, 5.6, 5.5, not a same-order run; §6.1a draws on source §6.6.4 before the BGG material from source §6.2. Layer 7 splits cohomological support/deformation from family construction, and Layer 8 brings in BP-Hida comparison to prove sharper bounds. The Needs chain §5.4a→§5.6→§5.7→§5.8 and §6.6a→§6.6b→§6.7→§6.8 explains those choices. BP-Hida's contents at lines 9–49 were also compared: generic solid/scheme inputs are imported, while finite-rank/bridge results are grouped by the comparison they supply. No one-to-one same-scope contents reproduction was found.

Counts for the audit: 0 Lean declarations; 68 owned numbered target subsections plus 1 imported subsection; 165 stated Checks read and evaluated, including the five convention Checks; at least 157 distinct numbered source locators inspected; 124 cross-roadmap section/target entries audited. S04 records three Checks that do not meet the discrimination requirement. The computations recorded above are witnesses for the conclusions, not a claim to instantiate every possible arithmetic object.

## Not verifiable

- Humphreys-BGG §§6.1–6.3, pp. 108–111 remains the settled uncertified source. Its wording and those page locators were not certified; no renewed request was made. Jones-BGG independently exposes the algebraic input and analytic exactness used by the package.
- The precise intended reference behind Pilloni-Singular's `[24]` in §5.1.5 remains unresolved. The cited local propositions were read; the repaired roadmap's direct local computation must stand on its stated suppliers and proof, with S02 corrected.
- No complete Lean elaboration or proof build was performed. There are no named signatures in Suggested.lean to elaborate. Generic grep hits for Shimura's Hecke-ring references and Coleman's Banach-space combinatorics do not provide the missing Shimura/Igusa/cohomology carriers.
- The ten declared supplier gaps remain contracts, not implemented results. This review does not certify their eventual proofs or the full proofs of the research-level targets. No additional missing reference was identified.

## Source issues

- **Gap** in BP-Hida at Lemma 2.1.32, p. 10 (BP-Hida line 486): the source says the dynamical compactification categories are cofiltered without an existence condition; it should be cofiltered or empty, and cofiltered when nonempty; affects a stated result.
- **Misprint** in BP-Hida at Introduction §1.1, p. 2 (BP-Hida line 62): the source says M_μ is the unipotent radical; it should be the Levi subgroup; affects nothing.
- **Misprint** in BP-Hida at Proposition 4.3.11, p. 48 (BP-Hida line 2494): the source says the paired boundary has index 2g+i−1; it should be 2g+1−i, consistently with the preceding correspondence domain; affects a stated result.
- **Misprint** in BP-Hida at Proposition 4.3.17, p. 49 (BP-Hida line 2551): the source says the finite-character normalization with an unmatched parenthesis and displaced ρ; it should be the character −w⁻¹w0M(κ+ρ)−ρ, retaining χ separately; affects a stated result.
- **Error** in BP-Hida at Remark 4.3.12, p. 48 (BP-Hida line 2502): the source says a pure p-power compares normalized stratum operators; it should be the full character ratio, including its value on the unit part of t; affects a stated result.
- **Misprint** in BP-Hida at §2.11 standing assumptions, p. 31 (BP-Hida line 1651): the source says the two cross-containments with first and second projections reversed; it should be p₂*D′+⊆p₁*D″+ and p₁*D′−⊆p₂*D″−; affects the proof.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, pp. 57,64 (BP-Hida lines 2953,3287): the source says specialization at −ν, then writes family base change without specifying its character map; it should be labeled [u]↦ν(u)⁻¹ in the stated diagonal convention; affects the proof.
- **Misprint** in BP-Hida at §6.2.8, p. 62 (BP-Hida line 3182): the source says U_(≥w+ε) in the final definition of the integral object; it should be U_(≥w−ε), as in the preceding triangle and following theorem; affects nothing.
- **Misprint** in BP-Hida at Proposition 6.2.13, p. 63 (BP-Hida line 3261): the source says base change modulo p^n for a complex reduced modulo p^r; it should be modulo p^r, as its proof states; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, pp. 134,168 (BP-Coleman lines 6210,7706): the source says its printed coefficient inequalities give BGG exclusion directly; it should be justified by substituting every BGG twist into the proved bounds, with corrected shifts; affects the proof.
- **Misprint** in BP-Coleman at Theorem 6.4.3 proof, p. 157 (BP-Coleman line 7277): the source says an unresolved lemma reference supplies compactness; it should be a specified geometric contraction argument combined with Lemma 6.3.10 and Theorem 5.4.3; affects the proof.
- **Misprint** in BP-Coleman at Definition 6.4.7, p. 158 (BP-Coleman line 7317): the source says n in the first negative geometric lower bound; it should be l, leaving n for the separate analyticity-radius condition; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), p. 173 (BP-Coleman line 7961): the source says strongly small slopes in the theorem header; it should be geometric small slopes, as proved using the sharp interior bounds; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, p. 32 (BP-Coleman lines 1491–1501): the source says an extra [−d] shift and Ω¹ in its supported top-degree expressions; it should be no second shift and Ω^d; affects a stated result.
- **Error** in BP-Coleman at Definition 5.4.10 and Example 5.4.11, pp. 111–112 (BP-Coleman lines 5217,5230): the source says the absolute lower tube lies inside Z∩U for all standard pairs; it should be the lower tube intersected with U, as the continuation argument requires; affects a stated result.
- **Gap** in BP-Coleman at §3.4, p. 45 (BP-Coleman line 2177): the source says to take extrema over positive roots for every datum; it should be accompanied by a separate rootless-torus convention; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), p. 167 (BP-Coleman line 7694): the source says the second negative upper bound without the +ρ term; it should be −w⁻¹ρ+ρ+w⁻¹2ρ_nc; affects a stated result.
- **Error** in BP-Coleman at Theorem 5.4.12, p. 112 (BP-Coleman lines 5216,5240): the source says the s-th power is potent compact while allowing s=0; it should be a sufficiently improving positive power, retaining the same permitted support pairs; affects a stated result.
- **Misprint** in Pilloni-Singular at §5.1.5, p. 22 (Pilloni-Singular line 951): the source says the two adjacent Satake products coincide in its Klingen paragraph; it should be αδ=βγ in the spherical labeling retained there; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, p. 90 (Pilloni-Singular line 4140): the source says p^(−k−1)U on the target of the BGG differential; it should be p^(k+1)U for the contraction and subsequent thresholds used there; affects the proof.
- **Gap** in Pilloni-Singular at §13.4, p. 91 (Pilloni-Singular line 4172): the source says a spectral-point pullback computes an eigenspace without specifying the pullback or generalized part; it should be derived weight specialization followed by localization preserving the full primary component; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 14.9.1, p. 102 (Pilloni-Singular line 4682): the source says the relevant eigenvalues have strictly positive valuation; it should be nonnegative valuation, the conclusion proved by excluding negative valuations; affects a stated result.
- **Misprint** in BP-GL2 at §2.1.1, p. 4 (BP-GL2 lines 122,126): the source says the coefficient F lies on X in the displayed f*-formula and writes f!O_X in the Gorenstein criterion; it should be F on Y and f!O_Y; affects a stated result.

Source independence: 29 passages compared with 5 readable sources; no expression reuse found. Largest share BP-Coleman, 64 of 140 source-bearing citation blocks in the layers; contents compared with BP-Coleman and BP-Hida: independent. Humphreys-BGG wording remains uncertified.

## For the human reviewers

- Humphreys-BGG is the already-settled uncertified text at packages/HigherHidaAndColemanTheory/README.md:1144; this pass did not inspect its expression or page numbering. No new access or licence request is made.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cdb927a0ad2a4af0561931fc9dbd735c2c4a504f", "job": "RT-HigherHidaAndColemanTheory~2a", "model": "gpt-6-astra", "worker": "chris-9"} -->
