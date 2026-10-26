<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1098#issuecomment-6427520146 -->
Red team round 1 pass a (codex) of 2fad3dd

Verdict: needs_changes

1. **F01** (P2) Finite-residue failure needs positive dimension

   **Location:** packages/AdicSpacesPartIIPartII/README.md:624: “If L̃ is finite the conclusion fails.”

   **Claim:** The Gauss-point closure conclusion fails for finite residue fields, with n still arbitrary.

   **Witness:** Take L = ℚ₂ and n = 0. D⁰(L) = {η}, so η ∈ closure {η}. README:636 computes this same exception. Residue cardinality is 2, yet the closure conclusion is true.

   **Exact repair text:** “If L̃ is finite and n ≥ 1, the conclusion fails: the rational neighbourhood {1 ≤ |T₁^q − T₁|}, where q = #L̃, contains η and no L-rational point. In dimension zero it holds over every L.”

   **Retest:** At n = 0 the repaired exception gives {η} = closure {η}; at n = 1 and q = 2, η(T²−T) = 1 while |a²−a| ≤ 1/2 for a ∈ ℤ₂.

2. **F02** (P3) The Hodge-exceptional Check confuses closed and Zariski closed

   **Location:** packages/AdicSpacesPartIIPartII/README.md:793: “a countable union of proper Zariski closed Hodge loci”.

   **Claim:** HK2 supplies a countable decomposition into individual proper coherent Zariski Hodge loci.

   **Witness:** HK2 line 2663 gives countably many topologically closed subsets; lines 2691–2707 group potentially uncountably many Hodge loci using compact subsets of ℙ(V_k)(ℚ_p). They do not assert those grouped images are coherent Zariski closed.

   **Exact repair text:** “In HK2, Lemma 9.3.5, each individual proper Hodge locus is Zariski closed and misses every weakly Shilov point. Their union therefore misses all weakly Shilov points, regardless of cardinality. Proposition 9.3.4 separately expresses the exceptional locus as a countable union of topologically closed subsets.”

   **Retest:** For dim V_k = 2, the line parameters [1:a], a ∈ ℤ_p, form an uncountable compact set. Grouping these parameters gives one closed image, not one Hodge locus. Avoidance still holds point by point for the entire union.

3. **F03** (P1) Faithfully flat descent of regular ring maps is not supplied

   **Location:** packages/AdicSpacesPartIIPartII/README.md:244: “faithful flatness of B_n → B̂_n descends regularity of A_m → B_n”; supplier contract at :111 and Needs at :246.

   **Claim:** SchemeAndStackFoundations §0.21 supplies descent of regularity of A → B along a faithfully flat target extension B → C.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:1398–1408 lists the regular-map predicate, its flat/fibre/field interfaces, preservation of reducedness/normality and G-ring completion regularity. It does not state target descent. Pinned Mathlib's RegularLocalRing files contain no such theorem.

   **Exact repair text:** Add under Exact supplier contracts: “What SchemeAndStackFoundations must provide (gap:regular-map-target-descent): For composable homomorphisms A → B → C of noetherian commutative rings, if B → C is faithfully flat and A → C is regular, then A → B is regular.” Add the same slug, supplier, section 0.21 and needs sentence to plan.json's gaps, and cite it in §0.5's Needs. Replace the implicit supplier assertion for this step by this contract.

   **Retest:** Put A = K⟨T⟩, B = K⟨U⟩ with T ↦ πU, m = (T), n = (U), and C = K[[U]]. A_m → C is the regular completion map after the parameter change T = πU; B_n → C is faithfully flat. The new contract supplies exactly the formerly unowned implication A_m → B_n regular.

4. **F04** (P1) André's localization input has no implementation owner

   **Location:** packages/AdicSpacesPartIIPartII/README.md:244: “André’s localization theorem over the excellent source turns this into regularity of the ring map”.

   **Claim:** The smooth-affinoid proof can pass from maximal-adic formal smoothness of completed local maps to regularity using the listed suppliers.

   **Witness:** TEMKIN12 lines 734–737 explicitly require André localization and the local formal-smoothness criterion. Neither is a target in the cited SchemeAndStackFoundations §0.21. Mathlib/RingTheory/Smooth/Basic.lean:64 supplies algebraic formal smoothness, not this maximal-adic criterion.

   **Exact repair text:** Add: “What SchemeAndStackFoundations must provide (gap:adic-formal-smoothness-regularity): For a local homomorphism A → B of noetherian local rings with A quasi-excellent, formal smoothness for the maximal-ideal-adic topologies implies that A → B is a regular ring map.” Register this precise contract under section 0.21 with the same slug in plan.json, and include it in §0.5's Needs. Retain ANDRE74 as the settled uncertified source and TEMKIN12 lines 734–737 as the readable supporting locator.

   **Retest:** For A = K and B = K[[T]], the required lifting topology is (T)-adic and the geometric fibres are regular. For B = K[ε]/(ε²), formal smoothness fails: lifting ε to K[t]/(t³) would require an element congruent to t modulo t² with square zero, but its square is t² ≠ 0. The new contract distinguishes these cases and does not substitute discrete algebraic formal smoothness.

5. **F05** (P3) Five Check bullets contain no discriminating test

   **Location:** packages/AdicSpacesPartIIPartII/README.md:174, :236, :343, :407 and :423; the last says “No claim that X becomes connected or normal after extending K is used.”

   **Claim:** These are Checks of the respective definitions or theorems.

   **Witness:** Lines 174, 236, 343 and 407 restate the general conclusion under the same assumptions. Line 423 reports an unused assertion; it has neither a mathematical instance nor an expected value.

   **Exact repair text:** Replace the five bullets, respectively, by:

   - “For A = K⟨T⟩ and I = (T(T−1)), A/I ≅ K × K; V(I) has the two classical points 0 and 1 and excludes the Gauss point.”
   - “Over K = 𝔽_p((t)), the closed immersion Spa(K(t^(1/p))) → D defined by T^p−t has image V(T^p−t), one classical point of residue degree p. Both spaces are normal; proper-image closedness needs no separability.”
   - “For A = K⟨X,Y⟩/(XY), Spec A and Spa(A,A°) each have one connected component and two irreducible components. Their idempotents are exactly 0 and 1.”
   - “For M = D ⊔ D and Y the first disc, dim_y Y = dim_y M = 1. Y is one connected component and is not all of M.”
   - “Let K = ℚ₃ and L = K(√2). Spa L is normal and connected, while its scalar extension to L has coordinate algebra L ⊗_K L ≅ L × L and two connected components. The extension theorem works over K.”

   **Retest:** These give, in order, point counts 2 versus 0 Gauss points; residue degree p versus degree 1 for a rational point; connected/irreducible counts 1/2; component counts 1/2; and connected-component counts 1 before versus 2 after field extension.

6. **F06** (P1) The Shilov proof imports an unowned reconstruction from models

   **Location:** packages/AdicSpacesPartIIPartII/README.md:682: “describe Spa(A, A°) as the limit of the special fibres … with O⁺ the t-completed colimit of structure sheaves”; Needs at :684.

   **Claim:** The listed formal-model suppliers provide the topological inverse-limit description and integral structure-sheaf reconstruction used in the singleton-fibre/completed-local-ring equivalence.

   **Witness:** BH22 lines 253–263 use both results. TauCetiRoadmap/AdicSpacesPartIII/README.md:4986–5713 supplies specialization, admissible blow-ups and categorical Raynaud localization, but neither reconstruction. A category localized at blow-ups is not an inverse-limit theorem for spaces and sheaves.

   **Exact repair text:** Add two precise contracts under AdicSpacesPartIII, with matching plan.json gap entries and §4.2 Needs:

   - “What AdicSpacesPartIII must provide (gap:adic-model-limit-topology): Let K be a complete nontrivially valued rank-one field, A a K-affinoid algebra, t a pseudo-uniformizer, and A₀ an open bounded topologically finitely presented K°-subalgebra whose integral closure in A is A°. Over the cofiltered category of K°-flat proper schemes Xᵢ → Spec A₀ that become isomorphisms after inverting t, the center maps identify Spa(A,A°) homeomorphically with limᵢ |Xᵢ × Spec(A₀/t)|.”
   - “What AdicSpacesPartIII must provide (gap:adic-model-integral-sheaf): Under gap:adic-model-limit-topology, with projections pᵢ, the integral structure sheaf O⁺ of Spa(A,A°) is canonically the sheafwise t-adic completion of colimᵢ pᵢ⁻¹O_{Xᵢ}.”

   Use section R2.4–R2.5 for both contracts. These are inputs to the existing Shilov target, not another formal-model construction in this roadmap.

   **Retest:** For A₀ = ℤ_p⟨T⟩, the points T = 0 and T = p have the same center in Spec 𝔽_p[T]. In the blow-up chart T = pU their centers are U = 0 and U = 1. The full model system separates them and supplies U = T/p locally; the original special fibre alone does neither.

7. **F07** (P1) Local-ring regularity transfer is not supplied

   **Location:** packages/AdicSpacesPartIIPartII/README.md:469: “regularity ascends along regular maps and descends along faithfully flat local maps”; the same proof also uses invariance under completion.

   **Claim:** The named suppliers supply the local-ring regularity transfers needed to identify and glue singular loci, including their smooth-pullback API at line 465.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:1398–1408 supplies preservation of reducedness/normality and regularity of G-ring completion maps, not these local-ring criteria. Mathlib/RingTheory/RegularLocalRing/Defs.lean and Polynomial.lean contain no flat-local transfer or completion equivalence. A regular map is not the same assertion as regular source/target rings.

   **Exact repair text:** Add under Exact supplier contracts: “What SchemeAndStackFoundations must provide (gap:regular-local-flat-fibre-criterion): For a flat local homomorphism A → B of noetherian local rings whose closed fibre B/m_A B is a regular ring, B is regular if and only if A is regular.” Register the same slug, supplier, section 0.21 and needs sentence in plan.json and add it to §2.1's Needs. Explain that regular local maps have regular closed fibre, and that the maximal-adic completion map is flat local with closed fibre κ(A), so this contract also supplies the completion criterion used in that proof. R03 concerns descent of a *map's* regularity and does not replace this ring criterion.

   **Retest:** For K[t]_(t) → K[[t]], the closed fibre is K and both rings have dimension and embedding dimension 1. For the flat local map K → K[ε]/(ε²), the source is regular but the target has dimension 0 and embedding dimension 1; its closed fibre is not regular, so the repaired criterion excludes it. For A=K[ε]/(ε²) → A[[u]], the closed fibre K[[u]] is regular, while source and target have (dimension, embedding dimension) equal to (0,1) and (1,2); both sides of the iff are false.

## Verified sound

Read all 1,055 README lines and all 108 Suggested.lean lines: 39 numbered targets, the scalar-extension target within §0.5, the hypersequence definition within §5.2, and all four Lean declarations. The tables below record computed instances, rather than treating elaboration as truth verification. All 164 README Check bullets were examined; six are covered by R02/R05. Representative computed outcomes are retained below; the exhaustive per-target and per-Check ledgers are omitted for the comment length limit. No additional false headline was found. Source verification covered eight readable works, with 33 locator groups recorded below; two works remain settled uncertified. Supplier verification covered eight named roadmap owners and five declared gap contracts. Ownership searches covered main, Completed, board packages, and the 55 supplied open-checkout directories; four relevant open-roadmap interfaces are detailed below.

There are three admitted headline theorems and one real predicate definition in Suggested.lean. No padding, sorry'd data, free predicate stand-in, missing section binder, duplicate fully qualified declaration, extra import, `lemma`, or `set_option` was found. All four own Lean names occur in the README. The supplied elaborated signatures were compared with every explicit binder; no fresh Lean command was run in this read-only pass.

### Computed declaration table

Here D denotes the native closed unit polydisc; π has 0 < |π| < 1. Model spaces Fⁿ use `Fin n`, so there are no out-of-range natural-number coordinates. Each `Type*` field or manifold retains its own universe; no universe-changing morphism encoding occurs.

| Declaration; location | Complete variable and instance context | Instances and computed values | Result/change |
|---|---|---|---|
| IsUnitGaussPoint; Suggested.lean:37, §3.4 | K : Type u; NontriviallyNormedField K, IsUltrametricDist K, NonarchimedeanRing K; n : ℕ; η : closedPolydisc n K. No completeness or infinitude is needed to define the predicate. | At η, (f,g)=(1,T) gives 1 ≤ 1 on both sides; at evaluation 0 the valuation comparison is 1 ≤ 0, false, excluding that wrong point. For (π+T,1), both Gauss norms are 1. For (0,1), 0 ≤ 1. At n=0 the norm is the coefficient norm on K. | Real body fixes the valuation class through every pairwise comparison. No sorry'd object; retain. |
| gaussPoint_mem_closure_rationalPoints; :51, §3.4 | Previous three K instances plus CompleteSpace K and Infinite(K°/K°°); n : ℕ; x : Spa(K,K°). No omitted hypotheses; x is the unique base valuation class. | n=0: range={η}, closure={η}. Over completed maximal unramified ℚ_p, choose a prime-to-p root ζ with residue distinct from 0,1: ∣ζ∣=∣ζ−1∣=1, meeting the two displayed inequalities. For ℚ₂,n=1, η(T²−T)=1 but every rational evaluation ≤1/2; infinitude excludes this case. | True at tested boundaries; R01 corrects only the README's finite-residue aside. The native Gauss valuation does not already prove this closure theorem. |
| analytic_constantRank; :68, §6.1 | F nontrivially normed, complete, characteristic zero; m,n,k : ℕ; k≤m, k≤n; M : Type v,N : Type w with topologies, ChartedSpace Fᵐ/Fⁿ, analytic IsManifold instances; f:M→N,a:M; ContMDiffAt ω f a; neighbourhood rank exactly k. | f(x,y)=(x,x²): derivative columns (1,2x),(0,0), rank 1. φ=id, ψ(u,v)=(u,v−u²) give ψf=(x,0). m=n=k=0: unique coordinate vector, both sides (). Constant f: centred coordinates give 0=0. x² has ranks 0 at 0 and 1 away, so fails hrank at 0. In characteristic p, Tᵖ has rank 0 but πⁿ↦πⁿᵖ≠0; CharZero excludes it. | Local analyticity suffices; no Hausdorffness or countability is needed for local charts. Rank is finite because the model is Fᵐ. No junk value of finrank or index subtraction. Retain. |
| analytic_germ_eq_zero_of_subfield; :100, §6.6 | E,C in independent universes, each NontriviallyNormedField, CompleteSpace, CharZero; NormedAlgebra E C; m : ℕ; f:Cᵐ→C; AnalyticAt C f 0; vanishing on an E-neighbourhood via algebraMap. | E=ℝ,C=ℂ: mixed derivative ∂^αf(0)=α!c_α; vanishing on the real neighbourhood gives c_α=0 since α!≠0. E=ℚ_p,C=ℂ_p,m=1: values at πⁿ→0 force every Taylor coefficient 0. m=0: both neighbourhood assertions are f(0)=0. z(z−a),a∉E: f(0)=0 but f(e)≠0 for every e∈E×, so the hypothesis fails. | NormedAlgebra fixes an isometric embedding: norm_algebraMap' gives ‖algebraMap e‖=‖e‖. Neither density nor finite extension is assumed. Retain. |

### Sampled adversarial computations

Representative rows from the completed target and Check review are retained below. All four Lean declaration rows above are retained. README line numbers refer to packages/AdicSpacesPartIIPartII/README.md. K has the standing complete, nontrivial, rank-one nonarchimedean valuation; D is the unit disc, C=Spa(K⟨X,Y⟩/(XY)) is the crossing, and Q=Spa(K⟨u²,u³⟩) is the cusp. These computations test statements; they do not constitute proofs.

| Target; README line | Context, instances and computed values on the claimed sides | Result/change |
|---|---|---|
| §0.5; 240 | All characteristics, affinoid domain or smooth map. K⟨T⟩→K⟨T,T⁻¹⟩ has regular fibres; evaluation T=0 has Tor₁(K,K)=K, so is not flat. K→K(a^(1/p)) is flat but its geometric fibre is L[ε]/εᵖ, not regular. A smooth disc may have inseparable classical residue. | Mathematical assertion survives; R03/R04 supply missing proof inputs. |
| §1.4; 346 | Components are images of connected components of normalization. C has two; annulus XY=c has one. The global integral nodal cubic has one component, while its node has two analytic local minimal primes and normalization preimages t=±1. ∅ has zero. | Distinguishes global components from local branches; does not copy CONRAD99's erroneous local/global iff. |
| §1.7; 410 | Normal X, nowhere dense Z, locally bounded analytic functions. On punctured D, ∣1/T(πⁿ)∣=∣π∣⁻ⁿ→∞, so the nonextension violates boundedness. On punctured Q, u=Y/X is bounded by 1 but u∉K⟨u²,u³⟩, violating normality. For idempotents, values are 0 or 1 and extension remains idempotent. | Correct ordinary normality, without geometric normality. R05 replaces the non-test at line 423. |
| §2.1; 453 | Regular classical local rings and coherent closed singular locus. Disc has empty singular set; cusp and crossing each have only the origin. Dual point has local dimension 0 and embedding dimension 1, so its singular locus is the whole point. | Nowhere density requires reducedness; the package retains it. R07 supplies the missing regularity transfer criterion. |
| §2.4; 524 | Reduced finite-dimensional X over perfect K; iterate reduced singular loci. Cusp has dimensions 1→0→⊥, two strata. Plane∪line meeting at a point gives 2→0→⊥. Reduced dimension-zero nonempty X gives 0→⊥, one stratum; ∅ gives none. | Finite dimension supplies the termination bound; unreduced dual point would persist without reduction. |
| §3.4; 622 | Infinite residue field, arbitrary finite n. A normalized nonzero reduced polynomial has a nonzero value over the infinite residue field, giving the required Gauss comparison. At n=0 rational range and Gauss point coincide for every residue field; finite residue and n≥1 give T₁^q−T₁ as obstruction. | Headline and Lean sound; R01 corrects the unqualified finite-residue failure. |
| §4.2; 674 | K-affinoid A, rank-one x, four equivalences. Disc η: generic prime, singleton fibre, completed localized ring K_η°, boundary membership all hold. Rational 0: nongeneric prime, residue-disc fibre, local completion K°[[T]], no boundary membership. Dual numbers: ∣ε∣=0 for every spectral seminorm and π-adic completion kills Kε; zero algebra has no x and empty boundary. | Explicitly excludes perfectoid/general Tate counterexamples; R06 supplies two proof inputs. |
| §4.6; 760 | Rank-one point on arbitrary rigid X. Type 2 in D: 1=1 and weakly Shilov; type 3: 0≠1 and not. On point⊔D the isolated point satisfies 0=0 although global dimension is 1. Open restriction keeps both residue field and local dimension. | Both directions use local dimension; no equidimensional shortcut. |
| §5.1; 806 | Coherent ideal, relative Proj, flat base change. Unit ideal gives Proj A[t]=X; zero ideal gives Proj A=∅. Principal nonzero Cartier ideal (T) gives X with a nonempty marked centre. Bidisc origin gives exceptional ℙ¹ and isomorphism off origin. | Universal property excludes incorrect zero-ideal and Cartier-centre models. |
| §5.2 hypersequences; 849 | Countable totally ordered labels, locally finite stabilization, not a mandatory ℕ enumeration. On the disjoint curves y²=x^(2n+1), each step lowers exponent by 2; n-th component needs n steps. A quasi-compact open meets finitely many components, hence bound max n there; no global finite bound. | Local finiteness is additional to countability; accepted synchronization gap supplies labels. |
| §5.3; 863 | Characteristic zero, generically reduced rigid X; all regular locus preserved. Smooth X: zero stages. Cusp: one stage to disc. K⟨x,y⟩/(y²,xy): regular away from 0; blowing up (x,y) gives x-chart K⟨x⟩ and empty y-chart. Generically nonreduced dual point has no dense regular open and is excluded. | Reduced/generically reduced and quasi-compact/non-quasi-compact cases use the two distinct accepted gaps. |
| §6.4; 964 | Smooth finite-type algebraic groups over complete normed characteristic-zero fields; local field-compatible charts. G_m: w=z−1, inverse 1+w; inversion −w/(1+w), derivative −1. GL₂: det(I+H)=1+h₁₁+h₂₂+h₁₁h₂₂−h₁₂h₂₁, perturbation <9/32 when entries <1/8. μ₃ over ℝ has 1 real and 3 complex points, but both identity charts have dimension 0 and one point. | The nonabelian GL₂ example fixes signs and chart dimension; local compatibility does not assert global equality of point sets. |

The Check sample includes all six defective bullets covered by R02/R05, together with boundary cases, negative controls and sign conventions. A failed hypothesis in a negative control is the expected outcome.

| Check line | Computation / expected values | Outcome |
|---|---|---|
| 50 | g=T−T²+2T³ gives g+g²=T+0T²+0T³+O(T⁴); inverse coefficients are integral Catalan numbers up to sign, hence converge for ∣T∣<1, including p=2. | Matches. |
| 51 | d(Tᵖ)_0=0; derivative of an analytic inverse would require 0·g′(0)=1. | Correct obstruction. |
| 105 | For b∈K°°, choose n with ∣bⁿ∣≤∣ϖ∣; thus b mod ϖ is nilpotent. For b a unit, no power is 0 mod ϖ. Both spectra have the same primes. | Works for nondiscrete valuations. |
| 106 | Model reduction contains ε≠0 with ε²=0; canonical reduction kills ε. Each spectrum has 1 point although the rings differ. | Matches. |
| 133 | Invert x: xy=0 forces y=0. At origin m/m² has basis x,y but dimension is 1. Blow-up x-chart kills y and gives K⟨x⟩; y-chart is empty. | Generically reduced extension needed. |
| 174 | Original repeats the arbitrary-I interface. Replacement I=T(T−1) gives K×K, 2 classical points and excludes η because ∣T(T−1)(η)∣=1. | R05. |
| 236 | Original merely specializes proper-image closedness to seminormal spaces. Replacement Tᵖ−t over 𝔽_p((t)) has one image point of residue degree p. | R05. |
| 251 | Identity fibre at p is κ(p), regular. L⊗_K L=L[ε]/εᵖ for purely inseparable degree p. | Flatness insufficient. |
| 343 | Original repeats the general comparison. Replacement crossing has connected count 1, irreducible count 2, idempotents 0,1 on both sides. | R05. |
| 372 | Integral global cubic: 1 global component. Locally y²−x²(1+x)=(y−x√(1+x))(y+x√(1+x)): 2 minimal primes, preimages t=±1. | Refutes the source's global/local iff, not this target. |
| 407 | Original is another invocation of the target. Replacement Y=first component of D⊔D: dimensions 1=1, but Y≠M. | R05. |
| 423 | Original has no asserted test value. Replacement ℚ₃(√2) has one connected component, but L⊗_{ℚ₃}L=L×L has two. | R05. |
| 494 | K over itself: dimension and cotangent rank 0. Purely inseparable L/K: dimension 0, cotangent rank 1. | Regular≠smooth in imperfect characteristic. |
| 554 | det of 0×0 matrix=1; no nonzero oversized minor exists. | Rank≥0 whole; oversized locus empty. |
| 586 | Cyclic degree 2 gives 2 representatives/1 class; S₃ degree 6 gives 6 representatives/1 class. | Automorphism count does not count points. |
| 636 | n=0: closure={η} even for 𝔽₂ residue; n≥1: T₁^q−T₁ obstruction above. | Correct Check; it refutes line 624 as written. |
| 669 | XY=c reduces to XY=0; boundary norms (1,∣c∣) and (∣c∣,1) give primes (Y),(X). | Exactly two generics. |
| 693 | A°=K°⊕Kε; πⁿKε=Kε for every n, so separated completion kills Kε and leaves K°. Reduction instead has π=0. | Correct localization/completion ring. |
| 778 | Classical disc point: 0≠1; isolated product point: 0=0 while global dimension remains 1. | Local dimension required. |
| 793 | Lines [1:a] for a∈ℤ_p form an uncountable compact family; its grouped closed image is not asserted to be one proper coherent Hodge locus. Individual proper loci each avoid weakly Shilov points. | R02. |
| 830 | Rees(unit)=A[t], Proj=X; Rees(0)=A in degree 0, Proj=∅. | Both ideal extremes. |
| 860 | Cartier centre remains nonempty although its morphism is identity; contraction length remains 1. | Composite-only model excluded. |
| 918 | In char p, derivative of Tᵖ is identically 0; πⁿ maps to nonzero πⁿᵖ arbitrarily near 0. | False in characteristic p. |
| 981 | Chart inverse 1+w; coordinate inversion 1/(1+w)−1=−w/(1+w), derivative −1. Real trace is (−1/2,1/2). | Sign and field trace correct. |
| 982 | Determinant expansion has minus h₁₂h₂₁; bound 2/8+2/64=9/32<1; chart derivative determinant 1. | Nonabelian example correct. |
| 998 | For ∞=[1:0], g·∞=[a:c]; local coordinate c/a has differential δc at I. | Surjective tangent map. |
| 1013 | If c_r is first nonzero coefficient, for sufficiently small pⁿ the r-th term dominates higher terms; value cannot be 0. Therefore every c_r=0. | Germ vanishes. |

### Headline coverage and padding probe

The README's deep results are: proper-image closedness and the nowhere-density criterion; finite normalization and global components; Riemann extension and connected complements; regular/smooth loci and finite smooth stratification; Gauss-point closure; Shilov characterizations, the maximal residue-transcendence criterion and avoidance; functorial rigid resolution and connected irreducible resolution; polydisc neighbourhoods, rational-point manifolds and submersions; algebraic-point atlases compatible with field extension; analytic constant rank; and coordinate/group subfield detection.

Gauss closure, analytic constant rank, and coordinate subfield detection are stated on native carriers. The other headlines are named in Suggested.lean:10–21 with their missing rigid-space/coherent-ideal/analytic-morphism or canonical point-manifold carriers. Tau Ceti's existing adic-space structures and native polydisc do not supply those full shared interfaces. In particular the group form needs a canonical analytic atlas on G(C), not an arbitrary manifold instance on an unrelated type. No weakened substitute is present.

The one-tactic probe finds no declaration to delete: IsUnitGaussPoint has a real, needed body; native one-variable Gauss construction and multiplicativity do not give closure; native inverse-function theorems do not already give the constant-rank normal form; ordinary analytic uniqueness does not already give the mixed-field germ statement. None of the three conclusions follows by simply unpacking its hypotheses. The negative controls in the declaration table show why the infinitude, neighbourhood-rank and subfield-neighbourhood assertions have content.

### Native contracts and supplier resolution

Library text was checked at Mathlib revision 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti revision a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 from lake-manifest.json. The supplied elaborations correspond to this file; the static comparison found zero dropped binders among four declarations.

| Interface | Resolved source and scope |
|---|---|
| Analytic/manifold carriers | Mathlib/Analysis/Analytic/Basic.lean:74, :110, :120; Mathlib/Geometry/Manifold/ChartedSpace.lean:141; Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777. IsManifold has chart-compatibility data, not Hausdorffness or second countability. |
| Local analytic inversion | Mathlib/Analysis/Calculus/FDeriv/Analytic.lean:141; Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:117; Mathlib/Analysis/Analytic/Inverse.lean:656. The inverse theorem requires the invertible continuous linear derivative; the analytic inverse theorem identifies the inverse power series. |
| Coefficient uniqueness | Mathlib/Analysis/Analytic/Uniqueness.lean:92, :106, :123 supplies diagonal multilinear-series uniqueness and one-variable coefficient uniqueness. Repeated coordinate differentiation gives the finite-dimensional coefficient test; it does not erase the CharZero requirement in constant rank. |
| Scalars, rank and derivatives | Mathlib/Analysis/Normed/Module/Basic.lean:271, :300 fixes isometry of algebraMap; Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 is a total natural-valued finrank, used here only on finite-dimensional ranges; Mathlib/Geometry/Manifold/MFDeriv/Defs.lean:336 defines mfderiv. |
| Submersion/immersion predicates | Mathlib/Geometry/Manifold/Submersion.lean:171 and Mathlib/Geometry/Manifold/Immersion.lean:190 supply chart projection/inclusion predicates. Their existence does not supply the derivative-to-normal-form theorem of §6.1. |
| Complete-metric Baire theorem | Mathlib/Topology/Baire/CompleteMetrizable.lean:25, BaireSpace.of_completelyPseudoMetrizable, supplies the complete metric case; no local compactness hypothesis is needed. |
| Spectrum and point carriers | TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101; TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean:72, :148, :156, :182. Evaluation is on the actual weighted restricted-series ring, with power-bounded coordinates and complete Hausdorff coefficients. |
| Gauss normalization | TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:241 proves multiplicativity for restricted series at positive polyradii; TauCeti/RingTheory/Huber/Restricted/GaussNorm.lean:80, :87 gives the ring equivalence preserving the underlying series. The one-variable point is in TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc/GaussPoint.lean. |
| Power-bounded elements and empty dimensions | TauCeti/RingTheory/Huber/PowerBounded.lean:433, :494 permits nilpotents; Mathlib/RingTheory/KrullDimension/Basic.lean:26, :38 makes the zero ring's dimension ⊥. Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45 makes trdeg cardinal-valued; the roadmap explicitly coerces finite dimensions. |
| RigidAnalyticGeometry | TauCetiRoadmap/RigidAnalyticGeometry/README.md:205–260 supplies all-characteristic excellence and completed extension; :355–432 canonical reduction and affinoid restrictions; :617–657 coherent/proper contracts; :690–764 classical points and local/analytification comparisons. The proper contract retains Kiehl-properness and is completed here by the declared gap. |
| AdicSpacesPartII | TauCetiRoadmap/AdicSpacesPartII/README.md:6452–6540 supplies local freeness and the split differential criterion; :8542 supplies relative analytification over a general base ring, hence Spec A; :9575 supplies classical completed-local-ring comparison; R1.9 supplies the normal connected identity principle. No finite-type-over-K substitution is made for Spec A. |
| AdicEtaleGeometry | TauCetiRoadmap/AdicEtaleGeometry/README.md:7401–7451, A2.6, supplies global topological dimension, its pure-dimension criterion and open-cover interface. Local dimension at every adic point remains this package's comparison target. |
| AdicSpacesPartIII | TauCetiRoadmap/AdicSpacesPartIII/README.md:4986–5713 covers formal models, specialization and Raynaud localization; :10948–10973 distinguishes arbitrary-K Kiehl-proper input from the discretely valued comparison; :12470–12500 contains the R3.9 Gel'fand-spectrum targets. The three names reported unresolved in the supplied citation leads are present there as planned targets, not missing pinned declarations. R06 identifies the genuinely absent reconstruction inputs. |
| SchemeAndStackFoundations | TauCetiRoadmap/SchemeAndStackFoundations/README.md:818 supplies étale coordinates; §0.3 and §4.11 supply relative Proj and modifications; §0.20 supplies normalization finiteness; :1394–1454 supplies excellent rings and regular maps. R03/R04/R07 specify the missing regularity transfer steps precisely. |
| StableReduction | TauCetiRoadmap/StableReduction/README.md:468–488, Layer 4, supplies scheme blow-ups of finite-type coherent ideals and their universal property. Rigid analytification and rigid gluing remain §5.1's work. |
| ResolutionOfSingularitiesCharacteristicZero | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md, §§7.1, 7.5–7.8, checked at its current supplied-owner version. Its functor covers reduced noetherian quasi-excellent schemes and regular morphisms. The two explicitly declared extensions supply generically reduced input and countable invariant synchronization. |
| ReductiveGroups | TauCetiRoadmap/ReductiveGroups/README.md:234–243, Layer 3, owns represented fppf quotients. The separately declared smooth-surjective quotient contract is necessary; rational-point surjectivity is not inferred. |

All five declared gaps have exactly the same slug, supplier, section and needs sentence in design/plan.json and the README's Exact supplier contracts. Their hypotheses distinguish the required cases:

| Declared gap | Precision/minimality witness; result |
|---|---|
| adic-proper-kiehl-proper | Arbitrary nondiscrete rank-one K is the missing case; AdicSpacesPartIII:10960 restricts its unconditional comparison to discrete valuations. ℂ_p-projective line gives the inner/outer norm ratio ∣p∣<1. Accept as declared. |
| formal-affinoid-localization | It asks for one specified affinoid W to appear in a global formal model, with a homeomorphism of reduction spectra, not equality of reduction rings. The dual-point test gives different rings and the same singleton spectrum. Accept as declared. |
| generically-reduced-functorial-resolution | K⟨x,y⟩/(y²,xy) is not reduced but becomes reduced after inverting x; preserving all its regular locus is stronger than resolving only its reduction. The supplier's reduced theorem does not cover it. Accept as declared. |
| countable-resolution-invariants | Reduced curves with exponents 2n+1 require unbounded local finite tower lengths; shared countable labels permit gluing without a global finite bound. A countable label set is not supplied by a bare finite local resolution theorem. Accept as declared. |
| represented-smooth-homogeneous-quotient | Representability of G/H alone is distinct from smoothness of G→G/H. In characteristic zero, the closed subgroup is smooth and the quotient torsor is smooth surjective; the contract does not assert surjectivity on F-points. Accept as declared. |

The mechanical dependency check returned:

```text
moved: AdicSpacesPartIIPartII moved in the merge order from #9 to #11, right after its last supplier AdicEtaleGeometry (AdicSpacesPartIII also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 645 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted move is not a finding. Internal target order was checked separately: normalization uses proper images and regular restriction; global components follow normalization; smooth strata follow singular loci; residue-transcendence avoidance follows local dimension; resolution follows regular restriction and blow-ups; the rational atlas follows local inversion. The reference to smooth dimension in §0.2's API is explicitly assigned to Layer 2 and is not used in §0.2's proof, so it does not form a proof cycle.

### Ownership against other open work

Object searches used the roadmap service and the supplied local main, Completed, board-package and open-checkout copies, rather than searching only for declaration names. The exact namespace and the four acceptance declarations occur only in this package among the supplied Lean files.

| Open roadmap interface | Result of resolving it |
|---|---|
| TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md, geometric inputs to §9 | Consumes rigid Zariski/component/resolution/Shilov geometry for Hodge-theoretic conclusions. The general geometry here supplies it; the Hodge conclusion is not planned again. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomologyPartII/README.md:11, :72 and its §4.4–§4.7 references | Imports this package's Zariski and weakly Shilov geometry. Its generic-smoothness and branched-cover requests are distinct future contracts; this package does not promise those excluded theories. No reverse supply edge is introduced. |
| TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md, spectrum-comparison inputs | Its nonarchimedean analytic category and tropical comparison consume the earlier spectral foundations. The affinoid rank-one/Shilov comparison is owned here; Banach Gel'fand spectrum remains AdicSpacesPartIII R3.9. Later diamond/Berkovich interpretations must consume this earlier geometry, not supply it. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1423–1459, B2.10 | Contains real finite-Cᵏ/analytic rank arguments. The present package explicitly assigns the general analytic constant-rank theorem here and offers its F=ℝ specialization to that later consumer. The finite-Cᵏ theorem and its geometric application remain there. This is a recorded ownership move down to the earlier general owner, not a new dependency on the later roadmap. |

No additional duplicate ownership was found in the remaining supplied checkouts. This is an object-search result, not a claim to have reviewed all of those roadmaps in full. Downstream diamond point/resolution comparisons are not imported as proof prerequisites here.

### Locator verification ledger

The following 33 groups were checked against the cached legal text, including the surrounding hypotheses. Multiple references to the same passage are grouped. Statements below describe the support, not copied source passages. Printed pages for author copies mean the source's own printed pagination; arXiv citations use the versions fixed in sources.toml.

| Group | Locator verified | Scope of the support |
|---|---|---|
| 1 | HK2 lines 217–221, §1.1, p. 5 | Coherent analytic Zariski subsets; source has the variable-letter slip recorded below. |
| 2 | HK2 lines 691–706, Definition 2.2.1 and Remark 2.2.2, p. 15 | Finite-extension representatives and their equivalence/classes. |
| 3 | HK2 lines 722–727, proof of Lemma 2.2.3, p. 16 | Proper-image argument in the stated application; no independent general implementation owner supplied by the citation. |
| 4 | HK2 lines 1458–1478, Example 5.0.5, p. 32 | G_a Grassmannian finite-extension points differ from geometric points. |
| 5 | HK2 lines 1591–1615, §5.3, p. 35 | Resolution and proper-cover use; scheme/rigid functorial input comes from TEMKIN12. |
| 6 | HK2 lines 2581–2615, proof of Theorem 9.1.3, pp. 57–58 | Smooth strata, tangent rank, full-dimensional component and subfield/orbit applications. These are uses in that setting, not a proof of every generalized native signature. |
| 7 | HK2 lines 2663–2707, Proposition 9.3.4 and proof, pp. 59–60 | Countable topologically closed decomposition, not the stronger decomposition in Check 793; R02. |
| 8 | HK2 lines 2710–2735, Lemma 9.3.5, p. 60 | Weakly Shilov avoidance, rational polydisc topology and the infinite-residue Gauss closure argument. |
| 9 | CONRAD99 lines 274–323, Lemma 1.1.5, pp. 6–7 | Completed field-extension normality/reducedness arguments; the roadmap separately owns regularity of the extension map. |
| 10 | CONRAD99 lines 329–340, §1.2, p. 7 | Regular/normal loci and affinoid local algebra. |
| 11 | CONRAD99 lines 406–450, Corollary 1.2.3 and Lemma 2.1.1, pp. 9–10 | Flat affinoid restriction, normalization and its local compatibility. |
| 12 | CONRAD99 lines 451–527, Theorem 2.1.2, pp. 10–11 | Nowhere-density characterization and finite-normalization criterion with conditions on both exceptional sets. |
| 13 | CONRAD99 lines 528–597, §2.1, pp. 11–12 | Connected components and normal connected identity arguments; source complement typo recorded below. |
| 14 | CONRAD99 lines 599–657, Lemma 2.2.1 and Definition 2.2.2, pp. 13–14 | Global components via normalization; the incorrect local/global iff is expressly excluded from the roadmap. |
| 15 | CONRAD99 lines 658–714, Lemma 2.2.3 and Theorem 2.2.4, pp. 14–15 | Nonempty irreducibility criterion and global component properties. |
| 16 | CONRAD99 lines 715–733, Corollary 2.2.7, p. 15 | Full local dimension in a normal ambient connected component. |
| 17 | CONRAD99 lines 734–768, Corollaries 2.2.8–2.2.9, pp. 15–16 | Component comparisons and affinoid descriptions. |
| 18 | CONRAD99 lines 801–805, proof of Theorem 2.3.1, p. 17 | Connected-complement argument there has algebraically closed base; the roadmap supplies its ordinary-normal extension through CONRAD10. |
| 19 | CONRAD99 lines 1008–1020, Lemma 3.3.1 proof, pp. 21–22 | Perfect-field regular/smooth comparison. |
| 20 | CONRAD10 lines 149–174, Theorem 2.1.1 and preceding discussion, p. 4 | Locally bounded Riemann extension on normal rigid spaces; geometric normality is not required. |
| 21 | CONRAD10 lines 189–230, Lemma 2.1.3, pp. 4–5 | Local branches and connected-complement argument, respecting nonempty connectedness. |
| 22 | BH22 lines 202–233, Example 2.1, p. 6 | Gauss point/rational-point closure discussion and infinite residue hypothesis. |
| 23 | BH22 lines 235–308, Proposition 2.2 and Remark 2.3, pp. 6–7 | Four Shilov characterizations, model-limit proof inputs and failure for general Tate rings; source notation issue below, R06 for ownership. |
| 24 | BH22 lines 310–328, Definitions 2.4–2.5, Example 2.6 and Lemma 2.8, pp. 7–8 | Shilov and weakly Shilov definitions and density. |
| 25 | BH22 lines 329–365, Proposition 2.9 and Corollary 2.10, p. 8 | Local-dimension residue criterion and nowhere-density avoidance. The source uses, rather than defines, local dimension; README says this. |
| 26 | BH22 lines 563–579, proof of Theorem 2.29, p. 13 | Proper-image support argument; requires coherent proper direct image. |
| 27 | TEMKIN12 lines 99–129, Theorem 1.2.1 and Remark 1.2.2, p. 3 | Generically reduced resolution, full regular-locus preservation, and deletion of components in the general nonreduced extension. |
| 28 | TEMKIN12 lines 424–494, §§2.2.1–2.2.7, pp. 10–11 | Marked blow-up sequences, empty-stage contraction and functoriality. |
| 29 | TEMKIN12 lines 725–746, Lemma 2.4.4 proof, p. 16 | André localization and local formal-smoothness criterion; readable support for R04, not certification of ANDRE74. |
| 30 | TEMKIN12 lines 1504–1590, Theorems 5.2.2 and 5.3.2 and Remark 5.3.1, pp. 33–34 | Rigid resolution, regular restrictions and locally finite hypersequences. |
| 31 | POINEAU13 lines 182–184, Notations p. 271; lines 705–760, Lemma 4.4 p. 284; lines 857–921, Corollaries 4.15–4.18 pp. 287–288 | Abhyankar dimensions and the strict-affinoid Shilov/residue criterion; rational value-group contribution is not confused with residue transcendence. |
| 32 | CONRAD06 lines 1937–1988, Definition 4.1.1 and following properties, pp. 1096–1097 | Rigid blow-up universal property, properness, flat base change and analytification. |
| 33 | STACKS lines 3743–3770, Tag 054L, Lemma 29.37.21, p. 83 | Étale coordinates at a smooth point; the analytic atlas needs the separately pinned inverse theorem. |

The report's computed examples also fix conventions shared across these sources: reduction sends ring maps contravariantly; unit Gauss norms use max of coefficient norms; tangent maps point from source to target; rank-k normal forms keep the first k coordinates; a unit-ideal blow-up is identity while a zero-ideal blow-up is empty; a Cartier centre is retained in a marked sequence. The GL₂ determinant and G_m inverse calculations fix the two signs appearing in the atlas examples. There are no Frobenius, Tate-twist or Haar-normalization conventions in these statements to test.

The pull-request diff contains nine files, all under packages/AdicSpacesPartIIPartII. The README and Lean contain no pull-request-number narrative, computational algorithm, prohibited option or extra roadmap import. The source manifest uses one key per cited work and specifies preprint numbering where applicable. No previously settled non-actionable finding is re-raised.

## Not verifiable

- SCHNEIDER11, §§5–9, Corollary 5.8, Proposition 5.9, Proposition 6.4, Lemma 9.2, Proposition 9.3 and Remark 9.4: settled uncertified publisher text. The locators were retained without claiming to inspect it. Native analytic inversion was inspected independently; the mathematical generalizations were tested as recorded above.
- ANDRE74, pp. 297–307: settled uncertified publisher text. TEMKIN12 lines 734–745 identifies the role of the result, but does not certify the full original proof or its numbering. It was not requested again.
- Fresh elaboration, build and proof checking were not run, as required by the read-only pass. The four supplied elaborated types were inspected and compared with the actual declarations; the three `sorry` proofs remain acceptance targets, not proved theorems.
- Ownership outside the supplied open-checkout list was not independently inspected. The service searches and supplied copies resolve the cited owners; this report makes no exhaustive claim about unrelated open revisions whose files were not supplied.

No newly missing source was required, and no settled reference was reopened. Findings R03, R04, R06 and R07 concern missing implementation ownership despite readable or settled mathematical citations; they are not requests for the source texts.

## Source issues

- **Misprint** in HK2 at §1.1, printed p. 5 (line 219): the source says the local vanishing condition uses an intersection with an unintroduced C; it should be intersection with the affinoid open U; affects nothing.
- **Misprint** in CONRAD99 at Lemma 2.1.4 proof, printed p. 12 (line 564): the source says Z and Z minus X cover X; it should be Z and X minus Z; affects the proof.
- **Error** in CONRAD99 at paragraph following Definition 2.2.2, printed p. 14 (lines 648–649): the source says local-ring irreducibility is equivalent to uniqueness of the global component through the point; it should be uniqueness of the local analytic branch, since an integral nodal cubic has one global component but two branches; affects nothing.
- **Misprint** in BH22 at Proposition 2.2, proof of (1) ⇒ (2), printed p. 6 (lines 266–270): the source says the localized reduction is a rank-one valuation ring with pseudo-uniformizer t; it should be the integral-ring localization at the inverse-image prime, with completion where needed; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2fad3dd6aa712ac3515b400b513752bf5f12aeeb", "job": "RT-AdicSpacesPartIIPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
