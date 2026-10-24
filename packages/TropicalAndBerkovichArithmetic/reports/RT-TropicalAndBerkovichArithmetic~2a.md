<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/180#issuecomment-6378703854 -->
Red team round 2 pass a (codex) of 2dd8ca6

Verdict: needs_changes

1. **F01** (P1) The Tate rank-one quotient already belongs to DiamondsAndVStacks

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:7, 59, 689–697: “Layer 0 adds uniqueness and maximality, normalization by a uniform unit”.

   **Claim:** The normalization, unique maximal generization and maximal Hausdorff quotient are constructed here; DiamondsAndVStacks owns only the small-v-sheaf extension.

   **Witness:** TauCetiRoadmap/DiamondsAndVStacks/README.md:8183–8259, §D5.13, already owns the Tate normalization, unique rank-one generization, quotient and noncontinuous section. Its merge position is 16; this roadmap’s is 205.

   **Exact repair text:** “Import DiamondsAndVStacks §D5.13’s normalized Berkovich spectrum, unique rank-one generization, set-theoretic section and maximal Hausdorff quotient of Spa. For the specified uniform-unit Banach norm, construct only the comparison with that normalized spectrum, preserving evaluations after the unique exponent rescaling. Transport the quotient through this comparison.” Update the scope and supplier inventory and remove the duplicated construction instructions.

   **Repair test:** On ℚ₃, the supplier’s p-normalized value is 1/2 and the present value is 1/3; raising to log(3)/log(2) gives 1/3. The rank-two specialization and its rank-one generization still have the same image. This retains the norm-sensitive extension without rebuilding the quotient.

2. **F02** (P1) Strict analytic gluing and adic equivalence have an earlier owner

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:727–739: “Establish *global adic comparison*.”

   **Claim:** This package constructs the Hausdorff strict analytic category, its taut-adic equivalence and boundary/étale/smooth comparisons.

   **Witness:** TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:1138–1158, §3.1, already constructs StrictAnalyticSpace, u, s₀, u_max and the same morphism comparisons with identical hypotheses. Its merge position is 65.

   **Exact repair text:** “Import ClassicalAdicEtaleCohomology §3.1’s Hausdorff strict analytic category, taut-adic equivalence and morphism comparisons. Identify its strict affinoid atlases with the strict Hausdorff specialization of §0.21; transport the supplied equivalence through that identification. The nonstrict, trivially valued and non-Hausdorff analytic extensions remain in §0.21.” Cite this owner in §0.30, the scope, supplier inventory and §0.22’s strict GAGA route; delete the duplicated global-equivalence proof plan.

   **Repair test:** Spa(K⟨T⟩,K°⟨T⟩) still realizes as the closed Berkovich disc; its structure map remains quasi-smooth with Gauss boundary. The supplied partial-properness upgrade applies only to boundaryless maps.

3. **F03** (P3) Skeleton and retraction definitions lack three discriminating Checks

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:978–982, 1053–1057: “No annulus components implies Σ=V”; “τ_V(v)=v for a vertex”.

   **Claim:** The displayed lists supply the required three Checks for each definition.

   **Witness:** The first two §2.2 Checks just repeat the defining union; all three §2.7 Checks repeat its identity/constant-on-balls clauses. No graph, radius or attachment is instantiated. Repetition after each citation adds no distinct test.

   **Exact repair text:** Replace §2.2’s list with: “For P¹ with its Gauss vertex, Σ is a singleton. For P¹ minus {0,∞}, the Gauss vertex and two puncture rays form ℝ; completion adds two endpoints. For a split Tate curve, one vertex and one annular component form a circle of length −log|q|, not an interval.” Replace §2.7’s list with: “On P¹ with only its Gauss vertex, 0 and 1 retract to that same vertex despite lying in different residue balls. In A(r,R), a point a with r<|a|<R retracts to ζ(0,|a|), of coordinate −log|a|. If w=ζ(0,r), r∈|K×| and 0<r<1, is added to the P¹ vertex set, the fine retraction fixes w while the coarse retraction sends w to ζ(0,1).” Keep the generic laws in the interface, without adding Lean declarations.

   **Repair test:** The examples yield respectively one vertex, two unbounded edges, a loop of length L; and equal images of distinct residue balls, an interior radius, and two different retractions of w. They distinguish the union from its vertex set and retraction from vertex rounding.

4. **F04** (P3) Two manifest entries still lack actual locator fields

   **Location:** packages/TropicalAndBerkovichArithmetic/sources.toml:202, 212, 328, 337: “locator = "arXiv:0704.3471 PDF; physical pages"”; “cited_for = ["References and the numbered sections citing this work"]”.

   **Claim:** The manifest records exact locators and consuming sections for each cited work.

   **Witness:** These are document identifiers and a generic destination, not locators or section identifiers. README:1663,1738 supplies the missing Sturmfels–Tevelev locators; README:603,1991 supplies the DKY locators. The DKY version note only partly compensates.

   **Exact repair text:** For sturmfels-tevelev, set locator to “Definition 3.1, Lemma 3.2, Corollaries 3.4 and 3.8, pp. 7–8; formula (1.2), pp. 1–2”, and cited_for to [“4.4”, “4.8”]. For dky set locator to “arXiv v2 §2.7, pp. 11–12; §4, pp. 18–22; published §2.7, pp. 960–961”, and cited_for to [“0.23”, “6.5”]. Retain the existing work keys, version notes and fetch metadata.

   **Repair test:** The multiplicity and energy citations resolve directly to sturmfels-tevelev lines 312–378 and dky lines 468–491; the hybrid application resolves to dky line 881. No second key or source fetch is needed.

Findings were saved incrementally. The audit below includes the previous-finding ledger, declaration contexts, computed instances, dependency output and source limitations.

## Verification of the preceding reviews

Identifiers in this table belong to the preceding reports, not to this review. Line numbers and quotations are from the current packages/TropicalAndBerkovichArithmetic/README.md unless another file is named. “Repaired, conditional” accepts a declared supplier contract; it does not assert that its implementation exists. None of S01–S04 re-raises a finding marked not actionable by the repair report.

| Earlier finding | Status | Current passage, repaired excerpt and independently recomputed witness |
|---|---|---|
| a F01, ArithmeticDynamics ownership | Settled; repair reason correct | Lines 2298–2300 name ArithmeticDynamics as a consumer. The supplied order has this roadmap at 205 and ArithmeticDynamics at 268. Importing the latter would be upward. Its overlapping line/energy/hybrid work must be reconciled there.  “ArithmeticDynamics consumes the line geometry and hybrid analytic space of Layer 0 and the local kernels and self-energy of Layer 6 for its §§2.2–2.5” (README:2300) |
| a F02, toric supply | Repaired, conditional | Line 99: “gap:general-field-toric-schemes”. Same slug in design/plan.json. AnalyticToricGeometry Layer 0 constructs complex toric schemes; the contract requests the missing arbitrary-field charts. Rank-zero lattice gives Spec K, including K=𝔽₂.  “What AnalyticToricGeometry must provide (gap:general-field-toric-schemes): For every field K and rational fan, supply toric schemes glued from Spec K[σ∨∩M], the dense torus, face/orbit charts,” (README:99) |
| a F03, rank-one intersections | Repaired, conditional | Lines 101–103 name “gap:rank-one-model-specialization” and “gap:rank-one-model-projection”; both occur in the plan. For a model of L² with intersection degree 6 the resulting degree is 3; component multiplicity 2 times degree 3 is 6.  “What SchemeAndStackFoundations must provide (gap:rank-one-model-specialization): For proper flat admissible normal models over any complete nontrivially valued rank-one valuation ring, supply specialization of generic intersection” (README:101) |
| a F04, missing idempotent headline | Repaired | Line 631 names “Spectrum.existsUnique_idempotent_of_isClopen”; Suggested.lean:73–76 states it. For ℝ² the four clopens correspond to (0,0),(1,0),(0,1),(1,1), including the empty clopen.  “Prove `Spectrum.existsUnique_idempotent_of_isClopen`. For a separated complete commutative Banach ring A with ‖1‖≤1, e↦{x∈M(A):x(e)=1} is a bijection from idempotents to clopen subsets, carrying 0,1 and” (README:631) |
| a F05, weak Checks | Repaired differently | Line 185 separates the projection evaluations at 5/2. At (2,3), 2<5/2<3. Elementary Lean examples were deleted as required by the present acceptance-test contract.  “- The evaluation-open set {x:x(2,3)<5/2} contains the first projection (value 2) and excludes the second (value 3). Its complement contains the open neighborhood {x:x(2,3)>5/2}” (README:185) |
| a F06, missing sources | Partly repaired; S04 | sources.toml has 34 distinct work keys: 30 certified, three uncertified, one waived. Published/preprint versions share keys. No absent unwaived work was found.  “schema = &quot;tauceti-roadmap-sources/v1&quot;” (sources.toml:1) |
| a F07, process catalogue | Repaired | Line 1077 gives the star-neighborhood continuity argument; Suggested.lean:5–29 lists missing mathematical carriers. At a vertex all sufficiently short initial branches retract into the same star, whereas continuity separately on open edges would say nothing there.  “At a vertex there may be infinitely many residue-ball directions. Given a neighborhood in the skeleton, cut the finitely many incident annuli inside that” (README:1077) |
| a F08, formal-model supplier | Repaired | Formal models now cite “AdicSpacesPartIII §§R2.2–R2.3” (lines 70–71). The supplied sections include admissible formal models and generic fibers; the old Part II R2 citation is absent.  “- AdicSpacesPartIII §R2.2 (`admissible-formal-scheme`): Flat, topologically finitely presented admissible formal K°-schemes, allowing a nonnoetherian valuation ring.” (README:70) |
| a F09, weighted series/gauge duplication | Repaired | Line 448 imports “RestrictedPowerSeries §§0.1, 1.1, 2.1”; line 670 imports the chosen gauge from “PadicFunctionalAnalysis §0.4”. The consumed weighted series and gauge are present there.  “Import the weighted-series algebra, Gauss norm, completeness and universal evaluation from RestrictedPowerSeries §§0.1, 1.1 and 2.1. Construct the affinoid quotients, separate quotient norms, compare” (README:448) |
| a F10, unit normalization | Repaired | Lines 332–336 require “‖1‖≤1”. On ℝ with 2 abs, the unit norm is 2 and the adapter is inapplicable; completion still has unit norm 2.  “**Check.** On ℝ with the complete submultiplicative norm ‖x‖′=2&#124;x&#124;, ‖1‖′=2. This native normed ring is allowed in §0.1 but does not satisfy the normalized-category” (README:336) |
| a F11, zero-ended star | Repaired | Line 2238 specifies “d≥1”; line 2250 treats the isolated vertex separately. Bounds for d=0,1,2 are respectively 0,0,1, not −1,0,1.  “v and an open star V with d≥1 ends, put U=τ⁻¹(V), a basic wide open, and let H be the subspace of global regular” (README:2238) |
| a F12, local forward dependencies | Repaired | Line 1486 places principal-divisor compatibility after the slope formula; line 1924 defers continuous measures to §6.4. For P,Q in one residue ball, point specialization gives v−v=0 before any slope theorem is used.  “As a consequence of the slope formula, prove *principal-divisor compatibility of specialization*: τ_*div(f)=Δ(−log&#124;f&#124;&#124;Γ)=divPL(log&#124;f&#124;&#124;Γ). This supplies the induced Picard specialization, after the point, degree and” (README:1486) |
| a F13, irrational multiplicity-one point | Repaired | Line 1756 requires multiplicity one “at every requested point”. At irrational (α,0), y²=1+x has initial equation y²−1 and two branches for p≠2; the new hypothesis rejects multiplicity 2.  “Require m_Trop(w)=1 for every w∈Γ′, including isolated points outside the value group, using valued extension to define their multiplicities. On nondegenerate segments local constancy” (README:1756) |
| a F14, Laplacian regularity | Repaired | Lines 1376–1378 specify closed-piece C² or absolutely continuous derivative with L¹ second derivative, then a weak BV domain. For F(s)=s²/2, ΔF=−ds+Lδ_L; the oscillatory example has infinite derivative variation and is excluded.  “For the density formula, require C² on each closed piece (or absolutely continuous f′ with f″∈L¹ there). The larger domain consists of continuous functions” (README:1378) |
| a F15, library pins | Repaired | Line 29 displays the manifest revisions 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. No library revision changed.  “The headline signatures use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native interfaces supply the spectrum construction:” (README:29) |
| a F16, noncomplete nonemptiness | Repaired | Suggested.lean:62 retains NormedCommRing and NormOneClass, with no CompleteSpace. ℚ with its usual norm is noncomplete and its spectrum contains abs; the zero ring fails NormOneClass.  “theorem nonempty (A : Type*) [NormedCommRing A] [NormOneClass A] :” (Suggested.lean:62) |
| a F17, amalgamation/tensor supply | Repaired, conditional | Lines 105–107 declare the isometric amalgamation and trivial-base tensor gaps; both are in the plan. For trivially valued K, K⊗K has 1⊗1 of norm 1, not 0. For ℝ→ℂ the absolute value must be retained, not merely its equivalence class.  “What AdicSpacesPartIII must provide (gap:absolute-valued-field-amalgamation): For isometric embeddings of complete real absolute-valued fields F into K and L, supply a common complete absolute-valued field” (README:105) |
| a F18, analytic residues/logarithm | Repaired | Lines 72–79 import ColemanIntegrationPartII “§3.1” and “§4.0”. The provided head has analytic wide-open residue at §3.1 and arbitrary-ℂ_p abelian logarithms at §4.0. The residue of p dt/t is p although its reduction is 0.  “- ColemanIntegrationPartII §4.0: The unique locally analytic additive logarithm with identity differential for every abelian variety over ℂ_p, including those without a finite p-adic” (README:78) |
| a F19, Raynaud supply | Repaired, conditional | Lines 109–113 declare three Raynaud gaps; the plan has all three. The cited existing §§3.13–3.14 and §§4.3–4.4 have the DVR statements, not the new arbitrary-rank-one statements. Tate toric rank is 1; good-reduction toric rank is 0.  “What NeronModelsAndSemistableAbelianVarieties must provide (gap:rank-one-raynaud-uniformization): For an abelian variety with split semistable reduction over any complete nontrivially valued rank-one field, supply the analytic Raynaud” (README:109) |
| a F20, arbitrary Radon Poisson | Repaired | Line 2018 names the “Radon Poisson theorem” on the weak domain. Integrating the Cantor distribution gives ΔF=δ₁−μ_C, total mass 0, outside the finite-piece density domain.  “First prove the *Radon Poisson theorem*: every finite signed Radon measure ν of mass zero on a connected compact metric graph has a continuous” (README:2018) |
| a F21, metric scaling | Repaired | Line 2062 separates unit and natural kernels; line 2074 computes the loop example. With c=L=2, the corrected midpoint ratio is exp(1/4), not exp(1/2).  “metric on the dualizing bundle, c₁(ω,&#124;&#124;·&#124;&#124;_Ar)=i_*δ_KΓ. Write g_nat(s,t)=c·g_unit(s/c,t/c) and a_nat=c·a_unit, with a=−g_μ(KΓ,x)−g_μ(x,x), independent of x. Its admissible correction in natural-log coordinates is exp(−a_nat−g_nat(KΓ,τ(x)))=exp(g_nat(τ(x),τ(x))); equivalently,” (README:2062) |
| a F22, rank-one model approximation | Repaired | Lines 2046–2052 add rank-one approximation and curvature, retaining lengths 1 and √2. On length √2 with endpoint difference 1, slopes 1/2 and 1 with first-piece length 2√2−2 integrate to 1. No rationalization of √2 is used.  “For the approximation proof, use successively finer partitions in the divisible value group and vertex values there whose errors are o(h²), h the minimum” (README:2050) |
| a F23, complete spectrum duplication | Repaired for the reported objects | Lines 80–84 import AdicSpacesPartIII §R3.9 and PerfectoidSpaces §P1.12; the complete spectral-maximum/pullback Lean targets are gone. ℚ→ℝ supplies the distinct noncomplete completion extension. Other quotient/equivalence overlaps are S01–S02.  “- AdicSpacesPartIII §R3.9 (`Huber.GelfandSpectrum`, `GelfandSpectrum.compactSpace_nonempty`, `GelfandSpectrum.smoothingFun_eq_sSup`): The complete bounded-seminorm spectrum, pointwise topology, compactness, nonemptiness, bounded pullback and spectral maximum.” (README:80) |
| a F24, separated triangulations | Repaired | Lines 1190 and 1198 require “separated”; line 1219 excludes the doubled-origin disc. Two distinct origins cannot form an open disc or annulus.  “- A separated quasi-smooth analytic curve over a complete nonarchimedean field has a closed discrete triangulation containing a prescribed closed discrete type-II/III set, with” (README:1198) |
| a F25, inseparable cycle multiplicity | Repaired | Lines 1669 and 1696–1698 retain generic lengths. Tᵖ=a acquires generic length p and geometric degree 1; geometrically reduced T↦Tᵖ instead has length 1 and map degree p. Both give p, never 1 or p².  “- For trivially valued K=𝔽_p(a) and X={Tᵖ=a}⊂G_m, algebraic closure gives (T−a^(1/p))ᵖ=0: cycle length p times reduction degree 1 gives m_rel=m_Trop=p.” (README:1696) |
| a F26, missing analytic bridges | Repaired for the reported gaps | Lines 569–577 name proper coherent GAGA; 1952–1956 name model density and arbitrary-base Radon limits; 1993 names general-field energy descent. A constant metric change c on degree d changes the local height by cd. Strict analytic ownership still needs S02.  “Prove *uniform density of model functions*: for a proper variety X over any complete nontrivially valued rank-one K, rational model functions are uniformly dense” (README:1952) |
| a F27, non-discriminating virtual/initial tests | Repaired | Lines 919–920 give the nonsquare quadratic and end-swap tests; line 1615 realizes the irrational weight. Quadratic radius gives length log(R/r)/2; swapped annulus gives (0,ℓ/2]; initial G_m at √2 is still G_m.  “- For odd p, a nonsquare unit u∈ℚ_p and 0<r<R<1, the domain r<&#124;T²−u&#124;<R splits over the unramified quadratic extension into annuli about ±√u. Since” (README:919) |
| a F28, locator labels | Repaired | Line 489 uses “Fact 3.2.3.2, Exercise 3.2.3.3 and Fact 3.2.3.4”; line 1621 uses “Proposition 4.17 and §4.18”. These labels occur at temkin lines 700–719 and bpr-metrics lines 793–812.  “Michael Temkin, Introduction to Berkovich analytic spaces, Definitions 3.2.2.1 and 3.2.3.1; Fact 3.2.3.2, Exercise 3.2.3.3 and Fact 3.2.3.4, pp. 14–16. Distinguishes rational inequalities from” (README:489) |
| a F29, virtual connectedness | Repaired | Line 904 requires “nonempty connected”. Disjoint annuli with lengths 1,2 would produce inconsistent divided lengths 1/2,1; this example now fails the hypothesis.  “Define *virtual annuli descent*. A virtual disc or annulus is a nonempty connected analytic domain in A¹ᵃⁿ_K whose base change to a completed algebraic” (README:904) |
| a F30, general Banach rational domains | Repaired | Lines 701–711 name the general Banach rational-domain comparison with separated quotient norms. In ℤ_p((T)), (g,f)=(T,1) gives empty trace and zero algebra; (1,T) gives the full trace and A.  “Construct the *general Banach rational-domain comparison*. For a complete nonarchimedean Banach ring A with a uniform unit z, A⁺⊂A° as in §0.28, and a” (README:701) |
| a F31, Tate field unit | Repaired | Line 2106 excludes “|q|=1”. The field unit q=p has |q|=p⁻¹ and positive length log p; q=0 and |q|=1 fail the quotient hypotheses.  “- The condition &#124;q&#124;<1 is essential; a parameter q with &#124;q&#124;=1, equivalently a unit of K°, does not supply this contracting annular quotient; q=p” (README:2106) |
| b F01, proper-name capitalization | Repaired | Title and lines 651,1839 use “Berkovich”, “Ostrowski”, “Riemann–Roch”.  “# Roadmap: Berkovich spaces, tropical curves and nonarchimedean arithmetic” (README:1) |
| b F02, Hausdorff padding | Repaired differently | Suggested.lean has no Spectrum.t2Space; README:255–259 retains the imported one-lemma route. Product projection values 2 and 3 separate the two points.  “The native presentation M(A) is Hausdorff.” (README:255) |
| b F03, acyclicity owner | Repaired | Lines 68,512 cite “RigidAnalyticGeometry Layer 5”. Its main README:434–455 states exactness for every algebraic module, not only finite modules.  “*Needs:* 0.19 Rational and affinoid domains; RigidAnalyticGeometry Layer 5; AdicSpacesPartII §R0.18; gap:trivial-base-completed-tensor-injectivity.” (README:512) |
| b F04, eight supplier labels | Repaired | Lines 72–79,91 use current integration and Raynaud section names. Finite-model logarithms remain in AnabelianGeometryAndNonabelianChabauty §5.8; arbitrary ℂ_p coefficients use ColemanIntegrationPartII §4.0. The d=0 correction is 0 in either range.  “- ColemanIntegrationPartII §3.1: The zero sum of oriented analytic end residues on a connected Coleman wide open, for forms extending to its specified strict” (README:79) |
| b F05, affine tropical locator | Repaired | Line 1595 cites Gubler “§2.1, p. 3”; that affine seminorm construction begins at gubler line 136. The later torus definitions are separately located on p. 7.  “Walter Gubler, A guide to tropicalizations, §2.1, p. 3; Definition 3.2 and Propositions 3.6–3.7, p. 7. Seminorm tropicalization, field-extension invariance and classical-point closure after” (README:1595) |

## Computed adversarial audit

Each numbered README target has a row. Definitions and theorem bundles share a row only when the same instances exercise their defining laws and conclusions; additional headlines and conventions have separate rows. Values below were recomputed for this pass, not inferred from elaboration. “Retain” means the displayed test found no mathematical counterexample; it does not remove the ownership findings. Commutativity excludes S₃ and Q₈ as ring inputs; a fan, graph or pointed curve cannot be replaced by the empty object when its stated connectedness/nonemptiness assumptions exclude it.

### Lean declaration and context table

The nine supplied elaborated signatures were compared with the actual bodies and README. Every declaration is in TauCetiRoadmap.TropicalAndBerkovichArithmetic; all have a single Type universe u. There are no implicit standing field, finiteness or completeness assumptions beyond the binders listed here. The completion equivalence has Homeomorph type in the actual source even though the signature pretty-printer abbreviates its existential type.

| Declaration; source line; README | Retained context | Instances and computed values | Result/change |
|---|---|---|---|
| Spectrum; 36; §0.1 | A : Type u, NormedCommRing A | Zero ring would require p(0)=0=1, impossible. On ℝ², projection seminorms give 2 and 3 at (2,3). | Native nonempty field and empty ring cases distinguished; retain. |
| Spectrum.eval; 42; §0.1 | A : Type u, NormedCommRing A, x : Spectrum A | For real abs, eval(−2)=2 and eval(0)=0; definition returns the identical native seminorm value. | No added normalization; retain as necessary definition. |
| Spectrum.topology; 45; §0.3 | A : Type u, NormedCommRing A | Projection values 2,3 lie on opposite sides of 5/2. On ℤ, coordinate p_t(2)=2^t is continuous; sup_n(n−n^t)=∞ for t<1. | Product topology, not uniform topology; retain. |
| Spectrum.completion_comparison; 50; §0.7 | NormedCommRing A; no CompleteSpace | ℚ→ℝ: both evaluations of 3/2 equal 3/2. Zero ring: equivalence ∅≃∅ and coordinate condition empty. | Correct noncomplete generality; retain. |
| Spectrum.compactSpace; 57; §0.7 | NormedCommRing A | ℝ² gives a two-point compact spectrum; zero ring gives ∅, also compact. | No norm-multiplicativity requirement; retain. |
| Spectrum.nonempty; 62; §0.13 | NormedCommRing A, NormOneClass A | ℚ has abs with p(1)=1; trivially normed 𝔽₂ has one point; zero ring has norm(1)=0 and fails the hypothesis. | Completeness correctly absent; retain. |
| Spectrum.isUnit_iff; 67; §0.14 | NormedCommRing A, CompleteSpace A, norm(1)≤1 | ℝ²: (2,3) unit and evaluations 2,3 positive; (1,0) nonunit and one evaluation 0. Zero ring: both IsUnit(0) and the empty universal proposition are true. | Both directions survive; retain. |
| Spectrum.existsUnique_idempotent_of_isClopen; 73; §0.25 | Same ring/completeness/unit binders; U : Set Spectrum A, IsClopen U | U={first projection} in ℝ² selects (1,0), squares to itself and has values (1,0). U=∅ selects (0,0). Zero ring has exactly one idempotent and one clopen. | Value-one convention and uniqueness correct; retain. |
| archimedean_field_classification; 82; §0.26 | NormedField K, CompleteSpace K, 1<norm(2) | ℝ with abs^1/2 has norm(2)=√2 and unique α=1/2; ℂ with usual norm has α=1. ℚ₂ has norm(2)=1/2; trivial 𝔽₃ has norm(2)=1, both excluded. | α recovered as log(norm(2))/log(2); retain. |

### README statement table

| Target | Instances tried; computed sides/values | Result; change |
|---|---|---|
| 0.1 spectrum | ℝ²: max norm of (1,0),(0,1) is 1, but their product norm is 0≠1·1. Zero map has p(1)=0≠1. | Excludes wrong seminorm and zero point; retain. |
| 0.2 bounded iff dominated | abs on ℝ: C=2 gives abs(x)≤2abs(x), and abs(x)≤abs(x). Power trick bound becomes 2^(1/n)→1. At x=1/4, abs(x)^1/2=1/2>1/4. | Both directions and wrong exponent distinguished; retain adapter only. |
| 0.3 pointwise topology | Integer path at t=0 gives p(2)=p(3)=1, at t=1 gives 2,3; each coordinate varies continuously, while the sup difference is infinite for t<1. | Retain. |
| 0.4 evaluation embedding | Two ℝ² projections differ at (2,3): 2≠3; equal values on every element mean the same seminorm function. | Injection and induced topology agree; retain README only. |
| 0.5 image equations | Zero function violates value 1; maximum on ℝ² violates p((1,0)(0,1))=p(1,0)p(0,1), giving 0≠1. | Defining equations exclude both wrong models; retain. |
| 0.6 image closed | Projection values on an idempotent are constrained by z²=z, hence z=0 or 1, a closed set; point with kernel is allowed to have z=0. | Strict positivity would discard a valid point; retain. |
| 0.7 compactness/completion | M(ℚ) and M(ℝ) both contain precisely abs; eval(2) agrees at 2. Empty spectrum compact. | Retain noncomplete extension. |
| 0.8 Hausdorffness | Evaluating (2,3) separates the two projection points by (<5/2) and (>5/2). | Imported one-lemma result correctly absent from Lean. |
| 0.9 contravariant pullback | ℝ²→ℝ projection followed by identity gives value 2 at (2,3) along either pullback route; identity pullback fixes 2. | Direction correct; retain. |
| 0.10 norm point | Over ℚ₂, values at 0,2,1/2 are 0,1/2,2; multiplication gives (1/2)·2=1. | Includes archimedean/trivial cases; retain. |
| 0.11 field singleton | Domination at 2 and 1/2 over ℝ gives p(2)≤2 and 1/p(2)≤1/2, hence p(2)=2. | Inverse inequality forces uniqueness; retain. |
| 0.12 normalized category | 2 abs on ℝ has norm(1)=2 and is excluded from adapter; ordinary ℤ has norm(n)=abs(n), whereas trivial norm gives 1 at n≠0. | Specified norm retained; retain. |
| 0.13 existence | Incomplete ℚ has its abs point; trivial 𝔽₂ has p(1)=1; zero ring has norm(1)=0. | Noncomplete theorem valid; retain. |
| 0.14 units/radius | Dual number ε has ε²=0 and spectral value/radius 0. In ℝ², (2,3) radius 3, and (1,0) has one zero spectral value. | Nilpotent and product checks agree; import complete core. |
| 0.15 residue field | At rational point T=a the kernel is (T−a), fraction/completion field K. At a Gauss point residue field is κ(T), not κ. | Kernel quotient and completed field distinguished; retain. |
| 0.16 colimits | ℂ⊗_ℝℂ≃ℂ×ℂ has two spectral points over one pair; trivial norm on ℤ would send 2 of norm 1 to real 2 of norm 2. | Surjectivity, not injectivity; ordinary ℤ initial; retain with gap. |
| 0.17 weighted affinoids | Radius r algebra: norm(T)=r; quotient by T gives constants with norm abs(a). Rank-zero polydisc gives K. | Imports weighted series; retain quotient extension. |
| 0.18 scalar extension | Identity extension gives identity spectrum map; ℝ→ℂ has one point over one point; purely inseparable Tᵖ=a gives one underlying geometric point with length p. | Set/topology statement does not assert reducedness; retain with gaps. |
| 0.19 domains | Datum (g,f)=(1,T) gives abs(T)≤r; invalid (0,0) gives tautological 0≤0 but a free-variable algebra. | Unit-ideal condition essential; retain. |
| 0.20 analytic sheaf | Cover U by U,U: equalizer is pairs (a,a), difference map (a,b)↦b−a. Empty overlap contributes 0. | Čech orientation and zero module agree; retain named descent. |
| 0.21 atlases | One affinoid chart recovers its spectrum; doubled-origin disc has two distinct origins with inseparable neighborhoods, so Hausdorffness is false although local charts exist. | General atlas range retained; strict overlap S02. |
| 0.22 analytification | A¹ has a Gauss point with abs(T)=1 and kernel 0, unlike a K-point kernel (T−a). On proper connected X, H⁰(O)=K on both sides. | Analytification/GAGA distinction retained; S02 for strict route. |
| 0.23 hybrid | For f=t², abs(f(z))^(log r/log abs(z))=r²; central valuation also gives r². For t, inverse convention gives r⁻¹>r. | Correct central sign; retain. |
| 0.24 uniform Gelfand | ε in dual numbers maps to 0 everywhere; in product ℝ^ℕ bounded tuples (1,1,…) have sup norm 1, tuple (1,2,…) has infinite sup. | Kernel and bounded-product restriction correct; retain. |
| 0.25 idempotents | Four idempotents of ℝ² match four subsets of its two-point spectrum, with e=(1,0) selecting first point by value 1. | Retain headline. |
| 0.26 archimedean fields | abs^1/2 on ℝ gives α=1/2; α=2 would give norm(2)=4>norm(1)+norm(1)=2 and fails triangle. | Exponent interval/uniqueness correct; retain. |
| 0.27 uniform unit | Weighted Laurent norm norm(z^n)=r^n(1+abs(n)) gives norm(z)norm(z⁻¹)=4, but spectral product r·r⁻¹=1; norm(z²)=3r²≠4r². | Separates the spectral uniform-unit condition from a power-multiplicative ambient norm; retain imported gauge. |
| 0.28 adic quotient | ℚ₃ normalized at 1/2 versus 1/3 requires exponent log(3)/log(2); rank-two specialization and maximal generization coincide in quotient. | Mathematics compatible; replace duplicate ownership under S01. |
| 0.29 rational traces | In ℤ_p((T)), (g,f)=(T,1) requires 1≤abs(T)<1, so trace ∅ and localization 0; (1,T) gives full trace and A. | General Banach comparison avoids field-only substitute; retain. |
| 0.30 strict equivalence | Closed disc has Gauss boundary, hence structure map quasi-smooth but not boundaryless; partial properness is absent. | Boundary qualifier correct; import owner under S02. |
| 0.31 real quotient | One affinoid chart has its compact Hausdorff rank-one realization; doubled-disc gluing has two nonseparable origins. | Local quotient does not imply global Hausdorffness; retain tautness qualifier. |
| 0.32 fiber detection | Finite map A→A×A gives H(x)×H(x)≠0 at each x and is surjective on spectra; A→0 gives zero fiber and empty source. | Faithfulness/nonzero fibers essential; retain. |
| 1.1 Gauss points | For f=1+T, ζ(0,r)(f)=max(1,r); at r=0 it is 1, while ζ(0,0)(T)=0. Product T·T has value r². | Radius-zero specialization and multiplicativity agree; retain. |
| 1.2 point types | Radius 0 gives type I; r in abs(K×) positive gives II; r outside gives III. Nested empty discs of limiting radius r>0 give IV; constant i must remain in the Hahn extension. | Retain corrected coefficients. |
| 1.3 metric/tangents | Nested radii 1,4 give log4. Centers 0,a with abs(a)=2 and radii 1,1 give 2log2, not log2. Type III has 2 directions; Gauss point has κ∪{∞}. | Formula correct; additional source error recorded below. |
| 1.4 connectedness | Proper geometric connected curve has only idempotents 0,1; disjoint union of two curves has four. Removing finitely many classical ends of a connected analytic curve does not cut its nonclassical arcs. | Proper GAGA and endpoint hypotheses used; retain. |
| 1.5 annulus | A(r,R) length log(R/r); T↦a/T sends radii to abs(a)/R, abs(a)/r and preserves that length. | Coefficient a₋₁, not a₁; retain. |
| 1.6 slopes | T³ gives F(s)=3s and slope 3; T−a gives min(s,v(a)) with slopes 1 then 0. A unit on an open ball has slope 0. | Negative-log/min convention consistent; retain. |
| 1.7 virtual annuli | Quadratic nonsquare annulus has two geometric components and length log(R/r)/2; end-swap quotient is (0,ℓ/2]. Disconnected lengths 1,2 would give conflicting 1/2,1. | Connectedness excludes conflict; retain. |
| 2.1 semistable vertices | On P¹ one Gauss vertex gives residue balls; empty V leaves all P¹, neither an open disc nor annulus. Two punctures in one residue ball require refinement. | Nonvacuous decomposition; retain. |
| 2.2 skeleton | One Gauss vertex on P¹ yields one point; P¹ minus {0,∞} with that vertex has two rays and one vertex, a line. | Correct union; replace the Checks under S03. |
| 2.3 boundaries | Residue ball has one boundary vertex; a loop annulus has both limiting ends equal to the same vertex; punctured ball adds its puncture as the second end. | Set boundary need not have cardinality 2; retain. |
| 2.4 complement balls | On an annulus, each off-skeleton residue ball retracts to its one Gauss boundary; no ball contains an interior skeleton interval. | Retain. |
| 2.5 closure/compactness | Unpunctured P¹ skeleton {v} compact; punctured ray [0,∞) noncompact, closure adds one classical endpoint. | Both directions of iff agree; retain. |
| 2.6 disc criterion | Gauss vertex v cannot have a neighborhood disjoint from V; point inside an off-skeleton ball has a smaller closed-disc neighborhood disjoint from V. | Both inclusion directions agree; retain. |
| 2.7 retraction | On A(r,R), point of abs(T)=ρ maps to skeleton coordinate −logρ; all points of an attached ball give its boundary coordinate. | Retraction differs from rounding to endpoints; replace generic Checks under S03. |
| 2.8 continuity | Sequence of skeleton points s_n=1/n approaches vertex 0 and has τ(s_n)=1/n→0; attached-ball points retract to the same attachment. | Vertex star argument present; retain. |
| 2.9 connectedness | Tate circle connected; good-reduction skeleton singleton connected. A putative two-point discrete skeleton is not a retraction image of connected X. | Retain. |
| 2.10 semistable reduction | Good reduction needs no extension; split node uv=π² has annular length 2v(π). Arbitrary rank-one proof does not assume value group ℤ. | Retain general theorem with explicit local proof route. |
| 2.11 metric dual graph | Node uv=π² gives length 2v(π); self-node gives a loop with two flags; two nodes between components give two edges. | Simple graph is insufficient; retain. |
| 2.12 genus | Good reduction genus 2: b₁=0, Σg_v=2, total 2. Tate curve: 1+0=1. Subdivision adds one edge and vertex, so b₁ unchanged. | Correct weighting; retain descent. |
| 2.13 refinement/base change | Split length L into a,L−a: sum L. Fine retraction then coarse sends a new attached-tree point to old vertex, as direct coarse retraction does. | Identity/isometric extension compatible; retain. |
| 2.14 existence | P¹ chooses a Gauss point; inserting a second type-II point gives one annulus plus residue balls. | Existence survives genus 0; retain. |
| 2.15 marked rays | At 0 of G_m, T gives ray coordinate s→∞; puncture belongs only to completed skeleton. Two punctures contribute two distinct rays. | Finite versus infinite endpoints distinguished; retain. |
| 2.16 triangulations | A separated disc admits triangulation with Gauss vertex; Tate circle has no intrinsic node but needs a chosen triangulation vertex; doubled-origin disc fails separatedness. | Minimality exception and repair agree; retain. |
| 2.17 automorphisms | Identity fixes all component points; T↦a/T exchanges annulus endpoints but preserves the set. Normal flatness alone gives no nodal local equation. | Semistability correctly separate; retain. |
| 2.18 deformation | For skeleton point x, H(x,t)=x for every t; attached ball point ends at its boundary, not at an arbitrary vertex. | Strong retraction condition retained. |
| 2.19 contractions | Two distinct bridge edges of lengths a,b become one of length a+b. A single loop has two flags but only one edge; two puncture rays cannot be removed by the asserted rule. | Exceptions correctly retained. |
| 2.20 minimal skeleton | Tate χ=0 gives intrinsic circle; P¹ χ=2 is excluded. | Nonhyperbolic boundary handled; retain. |
| 2.21 stable vertices | Good-reduction genus 2 vertex has valence 0 but g_v=2 and remains; rational trivalent vertex has 2g_v−2+val=1>0. | Genus/valency alternative essential; retain. |
| 2.22 minimal uniqueness | Two one-vertex models of Tate curve have distinct vertex sets but the identical circle of length L. | Statement asserts skeleton uniqueness only; retain. |
| 2.23 stable uniqueness | Genus-2 good reduction χ=−2 has unique genus-2 vertex; Tate χ=0 lies outside the stable-uniqueness hypothesis. | Strict inequality essential; retain. |
| 3.1 graphs | One loop: E=V=1, b₁=1 and valence 2. Two parallel edges: E=2,V=2,b₁=1. | Loops/multiple edges retained. |
| 3.2 divisors/rank | On a tree r(2P)=2; on a circle r(P)=0. PL coordinate on interval has div=δ₀−δ_L of degree 0. | All-point rank and outgoing sign distinguished; retain. |
| 3.3 Laplacian | Δs=δ_L−δ₀; Δ(s²/2)=−ds+Lδ_L, mass 0; ∫s Δs=L=∫1²ds. Cantor primitive gives δ₁−μ_C. | Classical and weak domains consistent; retain. |
| 3.4 Jacobian | Tree H₁=0 gives trivial Jac; circle length L gives ℝ/Lℤ; a bridge maps constantly under Abel–Jacobi. | Length lattice, not unit lattice; retain. |
| 3.5 graph RR | Tree,D=0: 0−(−1)=1=0+1−0. Circle,D=P: 0−(−1)=1=1+1−1. | Rank −1 and genus signs correct; retain. |
| 3.6 specialization | P,Q in same ball give τ_*(P−Q)=v−v=0; a degree-d closed point contributes total geometric degree d. | Degree/effectivity before principal comparison; retain. |
| 3.7 slope formula | On punctured line f=T has slopes +1 toward 0 and −1 toward ∞; adding compact endpoints gives ΔF=δ₀−δ_∞. | Matches τ_*div(T); retain. |
| 3.8 metrized complexes | One elliptic residue component without edges has genus 1 and r(P)=0; forgetting residue curve gives point graph r(P)=1. | Residue curves cannot be replaced by weights; retain. |
| 3.9 rank-determining | Genus-0 residue component needs one chosen point, genus-1 needs two; loopless graph model requires subdividing a self-loop into two edges. | Cardinalities and loopless condition matter; retain. |
| 3.10 complex RR | One elliptic component,D=0 gives r(0)−r(K)=0−0=0; rational component gives 0−(−1)=1. | Formula with total genus holds; retain. |
| 3.11 rank inequality | Good-reduction elliptic curve,D=P: r_X=0, r_complex=0, r_graph=1. | 0≤0≤1 verifies direction and non-equality; retain. |
| 4.1 trop | χ=T² gives trop=2w; equation T=a forces w=v(a). Rank-zero torus gives a point; empty subscheme gives empty tropicalization. | Sign and empty case correct; retain with toric gap. |
| 4.2 initial schemes | (T−a)² has initial generic length 2; T−a has length 1; G_m over trivial base at realized weight √2 has initial κ[U,U⁻¹]. | Nilpotents and irrational weights retained. |
| 4.3 fundamental theorem | Trivially valued G_m has analytic tropicalization ℝ, while classical K-points give {0}. Double point has same support as reduced point. | Initial nonemptiness sees support, not weights; retain. |
| 4.4 balancing | Primitive normals (1,0),(0,1),(−1,−1) sum 0; doubling all weights gives 0, doubling only third gives (−1,−1)≠0. | Multiplicity and primitive normalization matter; retain. |
| 4.5 relative multiplicity | In char p, Tᵖ=a gives length p×degree1=p; reduced torus map T↦Tᵖ gives length1×degree p=p. | No double counting; retain repair. |
| 4.6 multiplicity formula | Two preimage annuli of expansion 2 and 3 give tropical multiplicity 5, not 2; contracted annulus contributes 0. | Weighted count correct; retain. |
| 4.7 expansion | Slopes (−2,4) give gcd2; (0,0) gives expansion0; (2,1) gives1. | Zero and signs handled; retain. |
| 4.8 pushforward | T↦T²: δm=2·1=2 and source weight×index=1·[ℤ:2ℤ]=2. Char-p Tᵖ gives p=p. | Full degree/index direction correct; retain. |
| 5.1 multiplicity-one lift | Irrational point on y²=1+x yields initial y²−1 and multiplicity2; G_m multiplicity1 has one Shilov lift but many arbitrary singleton lifts. | All-point and distinguished-lift qualifications essential; retain. |
| 5.2 faithfulness | Coordinate T² doubles length, expansion2; two edges mapping to same interval can each have expansion1 but violate injection. | Both conditions needed; retain. |
| 5.3 separating functions | Adding T to T² changes slope vector from (2) to (2,1), gcd2→1. Two coincident images still require a separating function. | Local slope versus global separation distinguished; retain. |
| 5.4 faithful finite graph | Interval with coordinates (T,T²) maps s↦(s,2s), injectively with primitive lattice direction (1,2), hence expansion1. | Intrinsic lattice length retained. |
| 5.5 domination | Composite expansion1 with positive integer factors e₁,e₂ gives 1=e₁e₂, so each is1; closed graph into X×P¹ keeps projection to X. | Toric domination gap sufficient; retain. |
| 5.6 marked rays | Pole orders 4,5 have gcd1; 4,6 have gcd2. Large coprime orders give one unit of lattice length per source length. | Retain. |
| 6.1 model metrics | Model of L² with local squared-frame norm1/9 gives L-norm1/3; tensor square returns1/9. | Denominator cannot be dropped; retain. |
| 6.2 model measures | Degree6 on L² normalizes to3; special component multiplicity2 and degree3 contributes6. Dimension0 point with residue degree d has mass d. | Tensor/residue/nonreduced factors retained; conditional on gaps. |
| 6.3 positivity/integrability | Component degrees −1,2 have positive total1 but fail semipositivity; difference of positive masses1 and2 has mass−1. | Positivity is componentwise, integrable need not be positive; retain. |
| 6.4 limits/heights | Constant potential c on degree d yields height change cd; uniform n⁻¹sin(n²s) tends0 while curvature size grows n³. | Semipositive hypotheses exclude arbitrary signed convergence; retain. |
| 6.5 energy | x=ζ(0,1),y=ζ(0,1/4): E(δ_x−δ_y)=log4; pairing with its negative gives −log4. | Self-energy positivity only; retain general-field extension. |
| 6.6 Green/admissible | Point graph of genus g>0: μ=δ_v. Circle L: μ=ds/L. Unit-edge theta graph genus2: each density1/3, total1. | Genus0 division excluded; bridges have resistance∞ and zero density; retain. |
| 6.7 approximation | Affine F=s has Δ=δ_L−δ₀; quadratic F=s²/2 has total variation2L. On length√2, endpoint difference1 has irrational secant1/√2. | Rational two-slope construction, not secant interpolation; retain. |
| 6.8 curvature/correction | One genus-1 vertex on loop gives total genus2,K=2v; corrected curvature δ_v+ds/L=2μ_a. For L=c=2 midpoint ratio exp(1/4). | Correct single scale factor; retain. |
| 7.1 Tate quotient | q=p gives length log p>0; q=0 lacks inverse; abs(q)=1 gives length0. | Field unit q=p remains allowed; retain. |
| 7.2 Tate calibration | g=s²/(2L)−s/2+L/12 has integral0 and derivative jump−1; Δg=δ₀−ds/L, hence δ₀+ddc g=ds/L. | Sign/mass/constant consistent; retain. |
| 7.3 Schottky | diag(q,1) has determinant abs(q)<1=abs(1+q)². Identity and unipotent have equal eigenvalue norms1 and are not loxodromic, including char2. | Trace test sound without dividing by2; retain. |
| 7.4 Mumford | Rank1 hull quotient is a circle of b₁=1; rank0 limit hull is ∅ although P¹ can have a chosen point skeleton. | Rank0 handled separately; split condition retained. |
| 7.5 Jacobian periods | Tate: period generator q tropicalizes to L and pairing is L, giving ℝ/Lℤ; good-reduction genus2 has toric rank0 but Jac dimension2. | Tropical lattice is not the analytic logarithm image; retain gaps. |
| 7.6 BC integration | Constant path/zero form integrate0; exact d(T²) integrates Q²−P²; Tate loop integrates Log(q), which may be nonzero. | Homotopy dependence cannot be erased; retain. |
| 7.7 residues/monodromy | dt/t has residue1, p dt/t has residue p although reduction0; t↦a/t gives −1. Loop ends sum1−1=0. | Analytic coefficient and orientation correct; retain imports. |
| 7.8 BC−Ab | Replacing Tate lift z by qz adds Log(q) to BC and adds (Log(q)/v(q))v(q)=Log(q) to correction. Stars d=0,1,2 give bounds0,0,1. | Descent/branch cancellation and zero-ended exception hold; retain. |

### Additional named targets, operations and conventions

| Statement | Instances tried; computed sides/values | Result/change |
|---|---|---|
| Unit/category convention; §0.12 adapter | norm=2 abs gives norm(1)=2>1; zero ring gives norm(1)=0≤1. | Adapter excludes the first, includes the second; no lost binder. |
| Natural versus arithmetic length | Over ℚ₂, v₂(2)=1 and −log abs(2)=log2. Node uv=2³ has length3log2, not3. | Same factor used in §§2.11,6.8,7.5,7.8. |
| Quotient/frame conventions | In K{T}/(T), scalar a still has abs(a); if s²=fσ and abs(f)=1/9, norm(s)=1/3. | No changed scalar norm or tensor exponent. |
| Proper coherent GAGA, §0.22 | Spec K: H⁰=K,Hⁱ=0 for i>0; P¹: H⁰(O)=K,H¹(O)=0. On A¹/ℚ_p, p^(n²)T^n has nth-root coefficient norm p^(−n)→0, giving a nonpolynomial entire function. | Properness discriminates equality of algebraic/analytic sections. |
| Banach analytic realization, §0.23 | t^m with m=−1,0,2 has central norms r⁻¹,1,r² and identical rescaled complex limits. | Negative Laurent powers allowed; denominator log abs(t) nonzero for 0<abs(t)≤r<1. |
| General Banach rational comparison, §0.28 | ℤ_p((T)): p is a nonunit; in localization with TU=1 and norm(U)≤1, 1 has norm≤r^n for every n, so separated quotient is0. | General Banach input is not replaced by a field affinoid. |
| Rank-one genus descent, §2.12 | Resolving uv=π³ subdivides one edge into three, adding two genus0 vertices: E−V+1 unchanged. | Neither residue characteristic2 nor ramification changes genus formula. |
| Reduced divisor existence/uniqueness, §3.9 | On an elliptic residue component a degree2 class has distinct effective representatives, but one component linear-equivalence class. | Uniqueness is at class level, not representative level. |
| Reduced-divisor continuity, §3.9 | Tree divisor of degree1 has P-reduced graph part P; moving P=s gives the same point s in Sym¹Γ, continuously. | No continuous choice of residue-curve representatives is asserted. |
| Gröbner/local-star construction, §§4.2–4.4 | At a tropical-line vertex the normals sum (1,0)+(0,1)+(−1,−1)=0; at an edge-interior point they sum u−u=0. | Finite-type hypothesis retained. |
| Formal residue lifting, §5.3 | Equal residue constants1 on two components glue at their node; constants0 and1 do not agree there. | Matching-node hypothesis excludes the wrong lift. |
| Annular Runge input, §5.3 | For inner radius abs(a), norm(f−T)<abs(a)≤abs(T) preserves leading T. Bound merely<1 permits f=T+c with abs(a)<abs(c)<1 and zero at −c. | README's “closely enough” accommodates the stronger bound; source proof issue below. |
| Model-function density, §6.4 | On Spec K, rational multiples of γ=v(π)>0 approximate √2γ; truncated radial functions distinguish radii1 and exp(−γ) by values0 andγ. | Constants and point separation available; trivial valuations excluded here. |
| Arbitrary-base Radon limit, §6.4 | Positive model measures of mass d evaluate constant1 to d at every stage; limit functional also has value d. | Net/Riesz construction avoids unjustified sequential compactness. |
| General-field energy, §6.5 | Radial segment length log4 gives E(ρ,ρ)=log4 and E(ρ,−ρ)=−log4 in every base realizing the radii. | Explicit local target owns extension beyond ℂ_p. |
| Radon Poisson, §6.6 | ν=δ₁−μ_C has mass0; F(t)=∫₀ᵗC(u)du has F(0)=0,F(1)=1/2 and ΔF=ν. ν=δ₁ has mass1 and cannot be a Laplacian. | Weak domain and solvability obstruction correct. |
| Rank-one approximation, §6.7 | On [0,√2], slopes1/2 then1 with breakpoint2√2−2 integrate to1; breakpoint belongs to ℚ+ℚ√2. | No rational edge ratio assumed. |
| Rank-one curvature, §6.7 | Subdivision of affine potential has internal flux1−1=0; endpoint curvature isδ₀−δ_L=−ΔF. | Both intersection gaps used with correct sign. |
| Primitive sheaf/path continuation, §7.6 | Local primitives of dT differ by a constant; continuation of dT/T around a Tate loop gives Log(q), whereas d(T²) has loop integral0. | Closed-form primitive torsor, not arbitrary functions. |
| Branch change, §§7.7–7.8 | Log′−Log=c v_p changes integral dt/t from1 to p by c. Reversing coordinate changes residue and valuation difference both by−1. Tate correction changes by the same cΔv. | Local and global conventions agree. |
| Degree/index boundaries | T↦T⁻² has degree2 and index2; T↦1 has lower-dimensional image and is excluded from generically finite formula. Char2 map T↦T² retains degree2. | No division by zero generic degree. |
| Empty fan/nonabelian action | Empty fan gives empty toric scheme/tropicalization; zero cone in rank0 gives Spec K. An S₃-normal extension identifies six conjugates in an orbit quotient without assuming the Galois group abelian. | Degenerate and nonabelian cases compatible. |

## Supply, ownership and acceptance-test audit

The requested mechanical dependency command was run read-only against the current README, name and supplied order, with --movable. It exited 0:

~~~text
depcheck: 29 roadmaps, 259 edges, 0 problem(s)
~~~

There was no UPWARD, CYCLE or moved line. This checks recorded edges, not missing ownership edges; S01–S02 remain defects. Both proposed owners precede this package. No target is moved to ArithmeticDynamics: its later position supports the repair report's settled reason.

The eight gaps have identical slugs in README:99–113 and design/plan.json. Their named suppliers are present and earlier. The toric gap is a compatible arbitrary-field chart/functor interface; the two intersection gaps separate specialization from projection; amalgamation requires isometries; tensor injectivity explicitly adds trivial bases; the three Raynaud gaps separate uniformization, valuation and polarization. None asks this package to reconstruct an earlier supplied object. Their future implementation is accepted conditionally.

| Supplier citation checked | Current supplied scope and boundary |
|---|---|
| AdicSpaces Layer 2; §0.4/Layer 3 | Spa, rational topology/localizations; separated-ring invariance does not supply a real point-space quotient. |
| AdicSpacesPartII §R0.7 | Valuation-class amalgamation; isometric extension is the declared gap. |
| AdicSpacesPartII §R0.18 | Nontrivially valued completed tensor exactness; trivial bases are the gap. |
| AdicSpacesPartII §R1.3 | Finite-type adic analytification, not full Berkovich analytification. |
| AdicSpacesPartIII §§R2.2–R2.3 | Admissible flat formal models/generic fibers over possibly nonnoetherian valuation rings. |
| AdicSpacesPartIII §R3.7 | Strict coherent GAGA; the general-valued extension remains a named target. |
| AdicSpacesPartIII §R3.9 | Huber.GelfandSpectrum, compactSpace_nonempty, smoothingFun_eq_sSup and bounded pullback, in the complete range. |
| PerfectoidSpaces §P1.12 | gelfandSpectrum_isUnit_iff in the nonarchimedean range. |
| RestrictedPowerSeries §§0.1,1.1,2.1 | Weighted positive-polyradius series, Gauss norms, completeness/evaluation; affinoid quotients remain here. |
| PadicFunctionalAnalysis §0.4 | Chosen Tate gauge, not arbitrary-norm invariance. |
| RigidAnalyticGeometry Layer 5 | Strict nontrivial-base Tate acyclicity, including arbitrary algebraic modules. |
| SchemeAndStackFoundations §3.3 | cohomologyDim_zero_structureModule under proper smooth geometric connectedness. |
| SchemeAndStackFoundations §4.12 | Chow modification for proper-to-projective reduction. |
| SchemeAndStackFoundations §§5.2–5.3,5.9 | Chow.c1, proper_pushforward and stated intersection ranges; arbitrary rank-one models need gaps. |
| AnalyticToricGeometry Layer 0 | Lattices/cones/fans and complex toric constructions; arbitrary fields are explicitly a gap. |
| AlgebraicCurves Layer 4 | Algebraic Riemann–Roch/prescribed poles, not graph/complex Riemann–Roch. |
| EllipticCurves Layer 4 | Algebraic Tate curve/q-parametrization; analytic quotient comparison remains new. |
| StableReduction Layers 1,2,7 | Multigraph/genus, locally noetherian proper-flat genus invariance, DVR semistable reduction. |
| ColemanIntegration §§L0.11,L0.22,L0.23,L1.20 | Oriented Laurent residue, primitive, branch change, good-reduction Frobenius integration. |
| ColemanIntegrationPartII §§3.1,4.0 | Analytic wide-open residue and arbitrary-ℂ_p logarithm, at the provided head. |
| AnabelianGeometryAndNonabelianChabauty §5.8 | abelianLog.cp, derivative, functorial for finite p-adic field models. |
| EffectiveDiophantineMethods §4.3 | Endpoint integrals from abelian logarithms in the finite-model setting. |
| NeronModelsAndSemistableAbelianVarieties §§3.13–3.14,4.3–4.4 | SemiabelianExtensionClassification, RigidUniformisation, RaynaudOneMotive and graph monodromy over DVRs. |
| DiamondsAndVStacks §D5.13 | Existing Tate-normalized rank-one quotient; S01. |
| ClassicalAdicEtaleCohomology §3.1 | Existing strict analytic gluing/taut-adic equivalence; S02. |

Ownership searches used roadmap grep/show, main and Completed, board packages, and all 28 supplied sibling folders at their specified heads. Searches covered the objects: seminorm spectrum, rank-one quotient, strict analytic spaces, weighted series, metric multigraph, metrized complex, tropical weights, model metrics/measures, Hsia energy, Schottky and integration. The substantive later overlap is ArithmeticDynamics. No earlier owner was located for arbitrary-real-length graph/complex Riemann–Roch, faithful tropicalization, weak graph potentials or the Jacobian-skeleton comparison. No declaration with this package's fully qualified namespace was found in those other files. The S01–S02 suppliers were read through the configured current-head roadmap service; neither substitutes an existing main-folder revision for main.

Mathlib/Analysis/Normed/Unbundled/RingSeminorm.lean:61 defines MulRingSeminorm by extending AddGroupSeminorm and MonoidWithZeroHom. Zero/one, multiplication, nonnegativity, triangle and negation are already laws; topology, ambient domination, completeness and nonemptiness are not. The subtype adds exactly domination. The 24 Mathlib inventory names resolve at the pin. The six cited Tau Ceti interfaces resolve at TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean:101, TauCeti/AlgebraicGeometry/AdicSpace/Spa/Analytic.lean:165, TauCeti/AlgebraicGeometry/AdicSpace/Spa/SeparationQuotient.lean:96, TauCeti/RingTheory/PowerSeries/GaussNorm.lean:433, TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean:412 and TauCeti/Analysis/Convex/Polyhedron.lean:56. Analytic coarsening supplies existence; separation quotient supplies separated-ring invariance; algebraic Riemann–Roch does not supply graph Riemann–Roch.

Headline inventory: completion comparison, noncomplete spectral compactness/nonemptiness, general Banach unit detection, clopen/idempotent classification and complete archimedean-field classification are the six acceptance theorems. Further deep headlines are uniform Gelfand representation/spectral colimits; analytification/GAGA/hybrid/adic comparison; semistable reduction/skeleta; graph and metrized-complex Riemann–Roch/specialization; tropical multiplicities/pushforward/faithful domination; model measures/energy/admissible curvature; Tate/Schottky uniformization, Jacobian skeleta and BC–abelian integration. The module docstring names these families and the unavailable analytic, graph, divisor, initial-degeneration, measure, quotient or integration carriers.

The one-tactic probe found no padding among the six retained theorems. The pinned real-algebra classification assumes NormedAlgebra ℝ, absent from the absolute-valued-field headline. Prime-spectrum clopen/idempotent results concern a different space. Elementary Hausdorff and complete spectral-core duplicates have been removed. All three definitions have real bodies and support these headlines. There is one import Mathlib and six theorem bodies with sorry, with no admitted data, examples, lemma declarations, set_option or computational algorithms.

The git diff against origin/main contains only this package: README.md, Suggested.lean, design/plan.json, metadata.toml, the preceding repair report, review.json and sources.toml. This review adds only this report; scratch notes remain outside the package. No git mutation, Lean build or external write was performed.

## Source locator audit

The following 218 anchor locations were read in the supplied legal cached texts. Each anchor identifies a definition, statement or proof passage; repeated uses by different README targets count once. This count is not a claim to have certified the proofs of the cited papers. The source-error qualifications below apply. For published-only wording, the manifest version notes distinguish preprint numbering; the four settled inaccessible works are excluded from this count.

| Source | Resolved text anchors |
|---|---|
| temkin | temkin line 178; temkin line 272; temkin line 290; temkin line 293; temkin line 311; temkin line 469; temkin line 573; temkin line 638; temkin line 694; temkin line 700; temkin line 719; temkin line 739; temkin line 809; temkin line 995; temkin line 1017; temkin line 1539; temkin line 1552; temkin line 1563; temkin line 1566 |
| bpr-structure | bpr-structure line 225; bpr-structure line 228; bpr-structure line 299; bpr-structure line 348; bpr-structure line 369; bpr-structure line 383; bpr-structure line 388; bpr-structure line 402; bpr-structure line 412; bpr-structure line 415; bpr-structure line 422; bpr-structure line 455; bpr-structure line 533; bpr-structure line 563; bpr-structure line 594; bpr-structure line 614; bpr-structure line 748; bpr-structure line 759; bpr-structure line 765; bpr-structure line 882; bpr-structure line 1014 |
| bpr-metrics | bpr-metrics line 734; bpr-metrics line 772; bpr-metrics line 793; bpr-metrics line 812; bpr-metrics line 857; bpr-metrics line 876; bpr-metrics line 895; bpr-metrics line 1059; bpr-metrics line 1074; bpr-metrics line 1078; bpr-metrics line 1093; bpr-metrics line 1113; bpr-metrics line 1181; bpr-metrics line 1197; bpr-metrics line 1204; bpr-metrics line 1214; bpr-metrics line 1222; bpr-metrics line 1245; bpr-metrics line 1255; bpr-metrics line 1281; bpr-metrics line 1292; bpr-metrics line 1315; bpr-metrics line 1340; bpr-metrics line 1643; bpr-metrics line 1694 |
| scholze | scholze line 410; scholze line 413; scholze line 423; scholze line 433; scholze line 450; scholze line 468; scholze line 500; scholze line 505; scholze line 513 |
| poineau-turchetti | poineau-turchetti line 438; poineau-turchetti line 455; poineau-turchetti line 790; poineau-turchetti line 811; poineau-turchetti line 1087; poineau-turchetti line 1091; poineau-turchetti line 1096; poineau-turchetti line 1120; poineau-turchetti line 1134; poineau-turchetti line 1138; poineau-turchetti line 1148; poineau-turchetti line 1221; poineau-turchetti line 1249; poineau-turchetti line 1251; poineau-turchetti line 1266; poineau-turchetti line 1592; poineau-turchetti line 1595; poineau-turchetti line 1615; poineau-turchetti line 1859; poineau-turchetti line 1903; poineau-turchetti line 1934; poineau-turchetti line 1986; poineau-turchetti line 2133; poineau-turchetti line 2223; poineau-turchetti line 2228; poineau-turchetti line 2247; poineau-turchetti line 2268; poineau-turchetti line 2511; poineau-turchetti line 2699 |
| gathmann-kerber | gathmann-kerber line 328; gathmann-kerber line 388; gathmann-kerber line 434; gathmann-kerber line 454; gathmann-kerber line 467 |
| baker-specialization | baker-specialization line 374; baker-specialization line 406; baker-specialization line 408 |
| amini-baker | amini-baker line 673; amini-baker line 741; amini-baker line 987; amini-baker line 1147; amini-baker line 2086 |
| baker-faber | baker-faber line 831; baker-faber line 904 |
| gubler | gubler line 136; gubler line 300; gubler line 305; gubler line 322; gubler line 328; gubler line 487; gubler line 494; gubler line 497; gubler line 506; gubler line 511; gubler line 519; gubler line 1499; gubler line 1515; gubler line 2019; gubler line 2032; gubler line 2086; gubler line 2095; gubler line 2100; gubler line 2181; gubler line 2198 |
| sturmfels-tevelev | sturmfels-tevelev line 312; sturmfels-tevelev line 316; sturmfels-tevelev line 356; sturmfels-tevelev line 376 |
| chambert-loir | chambert-loir line 143; chambert-loir line 160; chambert-loir line 182; chambert-loir line 193; chambert-loir line 207; chambert-loir line 254; chambert-loir line 685 |
| favre-rivera | favre-rivera line 1093; favre-rivera line 1110; favre-rivera line 1146; favre-rivera line 1196; favre-rivera line 1204; favre-rivera line 1221 |
| yuan | yuan line 3880; yuan line 3920; yuan line 3956; yuan line 3975 |
| zavyalov | zavyalov line 4033; zavyalov line 4038; zavyalov line 4087 |
| kedlaya-liu | kedlaya-liu line 1376; kedlaya-liu line 1391; kedlaya-liu line 1425; kedlaya-liu line 1432; kedlaya-liu line 1436; kedlaya-liu line 1484; kedlaya-liu line 1538; kedlaya-liu line 1563; kedlaya-liu line 1577; kedlaya-liu line 1620; kedlaya-liu line 1635; kedlaya-liu line 1679; kedlaya-liu line 2400; kedlaya-liu line 6314; kedlaya-liu line 6328; kedlaya-liu line 6338; kedlaya-liu line 6344 |
| colmez-dospinescu-niziol | colmez-dospinescu-niziol line 2013; colmez-dospinescu-niziol line 2039; colmez-dospinescu-niziol line 2048 |
| dky | dky line 468; dky line 483; dky line 881 |
| boucksom-jonsson | boucksom-jonsson line 1232; boucksom-jonsson line 1321; boucksom-jonsson line 2258; boucksom-jonsson line 2287 |
| krzb-survey | krzb-survey line 1342 |
| krzb-uniform | krzb-uniform line 945; krzb-uniform line 1018; krzb-uniform line 1057; krzb-uniform line 1192; krzb-uniform line 1231 |
| baker-rabinoff | baker-rabinoff line 256; baker-rabinoff line 538; baker-rabinoff line 762; baker-rabinoff line 861 |
| favre-corrigendum | favre-corrigendum line 9 |
| kedlaya-liu-ii | kedlaya-liu-ii line 7266 |
| baker-norine | baker-norine line 283; baker-norine line 317; baker-norine line 618 |
| berkovich-integration | berkovich-integration line 810; berkovich-integration line 4720 |
| bosch-lutkebohmert | bosch-lutkebohmert line 715; bosch-lutkebohmert line 1016; bosch-lutkebohmert line 1097 |
| ducros | ducros line 8020; ducros line 12338; ducros line 13253; ducros line 13312; ducros line 13323; ducros line 14456; ducros line 15968 |
| coleman | coleman line 655 |
| de-shalit | de-shalit line 115 |

## Verified sound

- Read all 2,344 README lines and all 88 Suggested.lean lines: nine declarations, six admitted headline theorems, 103 numbered targets, and the additional named targets/operations recorded in 22 further table rows. All 131 labeled Check blocks were read and evaluated against their sections; the deficient blocks are S03. The tables record actual values, including zero-ring, rank-zero, characteristic 2/3, inseparable, nonreduced, irrational-length, trivial-valuation, nonproper, nonseparated and identity-map controls.
- Reconciled all 31 pass-a and five pass-b findings. The earlier missing-manifest finding is partly repaired (S04); the disputed upward-ownership claim has a correct settled reason. Accepted all eight precisely declared supplier gaps conditionally.
- Resolved 25 supplier-citation groups in the supply table, including the two newly identified owners; searched all 28 supplied sibling heads. The 24 Mathlib inventory references and six Tau Ceti interfaces resolve at the displayed pins. No fully qualified declaration collision was found.
- Compared all nine worker-elaborated signatures with the README and actual Lean source. No section binder was lost. No new Lean elaboration or build was run under this read-only brief; the supplied elaboration output, not an unperformed command, is the signature evidence.
- The dependency check exits 0 with no UPWARD or CYCLE line. The current git diff is confined to the package. Source text was not copied into the report or repository; no source fetch, credential access, message or external write was needed.

Source-locator count: 218 distinct anchors across 30 cached works, with four additional settled works cited without text certification.

## Not verifiable

- berkovich-spectral remains waived; fresnel-matignon, huber-1994 and huber-1996 remain uncertified. Their stated theorem/page locators were retained without requesting them again. The Runge and Huber-primary-source proof details cannot be independently certified from these unavailable texts.
- coleman Proposition 4.3 is located at coleman line 655, but the extraction omits its displayed formula. The surrounding proof and de-shalit line 115 independently support the residue-zero-sum input; the missing displayed glyphs themselves are not certified.
- The eight declared supplier extensions are contracts, not implemented APIs. In particular, general-field toric charts, rank-one intersections, isometric amalgamation, trivial-base tensor injectivity and the three rank-one Raynaud interfaces remain conditional.
- The supplied signatures establish elaboration/binder retention only. They do not prove any theorem admitted with sorry. No Lean builds were run and no claim of a new build result is made.

## Source issues

- **Misprint** in temkin at Definition 2.2.3.1, p. 7 (temkin line 311): the source says topology tests elements of the base ring; it should be elements of the algebra whose spectrum is constructed; affects a stated result.
- **Misprint** in poineau-turchetti at Example I.2.20, p. 11 (poineau-turchetti line 455): the source says Hahn coefficients are rational; it should be complex coefficients with rational exponents; affects a stated result.
- **Misprint** in poineau-turchetti at Proposition I.4.14, p. 19 (poineau-turchetti line 790): the source says the reversing map uses the positive-degree coefficient and mixes radius variables; it should be the coefficient of T⁻¹ and one consistent quantified radius; affects a stated result.
- **Misprint** in poineau-turchetti at Example I.8.11, p. 31 (poineau-turchetti line 1266): the source says the exponential length for |α|>1 is |α|/r; it should be |α|²/r, accounting for both segments through their joining disc; affects a stated result.
- **Misprint** in bpr-structure at proof of Lemma 3.2, p. 8 / printed p. 102 (bpr-structure line 377): the source says the logarithmic radius approaches one and writes a point-image interval containment; it should be radius approaching zero and the norm-coordinate image lying in the chosen value interval; affects the proof.
- **Error** in bpr-structure at §5.3, p. 18 / printed p. 115 (bpr-structure line 882): the source says an old edge is contained in one refined edge; it should be an old edge is the union of refined subedges, with lengths adding; affects the proof.
- **Gap** in bpr-metrics at proof of Lemma 5.19, p. 26 (bpr-metrics line 1252): the source says approximation error below one makes the approximant an annular parameter; it should be error below the inner radius, or pointwise below the coordinate norm; affects the proof.
- **Error** in bpr-metrics at Theorem 5.24 and proof, p. 27 (bpr-metrics line 1315): the source says value-group-point multiplicity tests give a unique unrestricted closed lift; it should be multiplicity one at all requested points and uniqueness of the positive-relative-multiplicity lift, treating isolated points separately; affects a stated result.
- **Misprint** in gubler at §13.16, p. 46 (gubler line 2191): the source says the weight uses a source-to-target lattice index; it should be the index of the image source lattice inside the target lattice; affects a stated result.
- **Misprint** in favre-rivera at §4.2, pp. 24–25 (favre-rivera line 1129): the source says negative interior second derivative accompanies positive outgoing derivative atoms; it should be positive interior second derivative with those atoms, agreeing with equation (20); affects a stated result.
- **Error** in favre-rivera at quantitative estimates, Theorems 3,5,7 and proof inequalities (32)–(33), printed p. 352 (favre-corrigendum line 9): the source says the energy bound lacks square roots; it should be the Cauchy–Schwarz square-root bound; affects nothing; corrected in print at favre-corrigendum, corrected Theorem 7 and equation (1), p. 1.
- **Error** in dky at §2.7, preprint p. 12 / printed p. 961 (dky line 483): the source says arbitrary mass-zero cross-energy is nonnegative with equality exactly when the measures coincide; it should be self-energy is nonnegative and vanishes exactly for the zero difference measure; affects a stated result.
- **Error** in dky at §2.7, equation (2.14), preprint p. 12 / printed p. 961 (dky line 478): the source says every nonarchimedean diagonal contribution is removed; it should be finite nonclassical diagonal contributions are retained in continuous-potential energy; affects a stated result.
- **Misprint** in boucksom-jonsson at proof of Proposition A.4, preprint p. 45 (boucksom-jonsson line 2306): the source says the central norm has negative order exponent; it should be r to the positive order, as in the proposition and Appendix A.6; affects the proof.
- **Misprint** in krzb-uniform at proof of Proposition 3.28, p. 26 (krzb-uniform line 1225): the source says the annihilator has dimension less than the valence; it should be its codimension is less than the valence; affects the proof.
- **Error** in kedlaya-liu at Remark 2.3.9, p. 35 (kedlaya-liu line 1391): the source says a uniform unit in characteristic p supplies a bounded analytic-field scalar map for the specified norm; it should be this converse requires integral-power norm control, for example equivalence with the spectral norm; affects a stated result.
- **Misprint** in baker-norine at §2, condition (E2), p. 8 (baker-norine line 332): the source says equivalent pairs imply equivalence of the two same-pair sums; it should be adding the two left representatives is equivalent to adding the two right representatives; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2dd8ca66ab6de8a1f49c497a1d8587f6e8dfdadc", "job": "RT-TropicalAndBerkovichArithmetic~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
