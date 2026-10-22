<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/180#issuecomment-6330467564 -->
Red team round 1 pass a (codex) of 4eab8bc

Verdict: needs_changes

1. **F01** (P1) ArithmeticDynamics is an earlier owner, not the asserted downstream consumer

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:7, 13, 534, 724, 749, 765, 1880, 1972, 2190; “ArithmeticDynamics DY.2 consumes these local results”.

   **Claim:** This package owns the analytic line, its point/tree theory, line potential theory and hybrid topology, and ArithmeticDynamics imports them.

   **Witness:** TauCetiRoadmap/ArithmeticDynamics/README.md:2281–2305, 2330–2340, 8140–8146 already owns these objects and names `analyticLine`, `gaussPoint`, `berkovichLaplacian`, `localMutualEnergy`, `hybridProjectiveLine`. ArithmeticDynamics is earlier in merge-order/ORDER.txt:146. It has no DY.2 section.

   **Exact repair text:** “Import ArithmeticDynamics §§2.2–2.3 (`analyticLine`, `gaussPoint`, `berkovichLaplacian`), §2.5 (`localMutualEnergy`) and §6.1 (`hybridProjectiveLine`). This roadmap constructs their comparisons with general affinoid/curve geometry and the extension to general projective meromorphic families. Its `ddc` equals the supplier's `berkovichLaplacian`; its graph `Δ` has the opposite sign.” Replace the duplicated construction instructions by these adapters, import the existing continuous-potential energy theorem, and delete the reverse supply claims and obsolete DY.2 references. General mixed model measures remain new only beyond the already owned pure-power measures in ArithmeticDynamics §2.5(7).

2. **F02** (P1) General-field toric geometry has no actual supplier

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:11, 80, 1527, 1634, 1715, 1741; “the general-K toric extension belongs to AnalyticToricGeometry, Part II”.

   **Claim:** SF.0 and an unnamed Part II provide general-field toric varieties, embeddings, dominating maps and initial-degeneration scheme interfaces.

   **Witness:** TauCetiRoadmap/AnalyticToricGeometry/README.md:21 and 216 restrict its toric schemes to complex regular-fan geometry. SchemeAndStackFoundations has no toric target; the cited Part II and a matching declared gap are absent.

   **Exact repair text:** “Import AnalyticToricGeometry Layer 0's lattice, cone and fan interfaces. Before §4.1 construct the general-field toric-scheme extension: for any field K and rational fan Δ, glue Spec K[σ∨∩M] along face localizations; construct the dense torus, toric morphisms, orbit charts and equivariant product maps, and prove the closed-graph domination construction used in §§5.3–5.6. State the extended tropicalization on all toric orbit charts and its compatibility with toric maps.” Give this extension its own named targets and legal locators, or replace it with precise registered `gap:` contracts naming an existing earlier owner. Remove the assertion that SF.0 currently supplies it.

3. **F03** (P1) Rank-one intersection extension is neither supplied nor declared

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:81, 1815, 1833, 1837; “using the SF.5 specialization, vertical Cartier intersection and projection formulas over the actual rank-one valuation ring”.

   **Claim:** The model measure construction can consume the stated arbitrary-rank-one intersection extension as SF.5 input.

   **Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:6701 supplies `Chow.c1`; :7129–7161 covers fields or Dedekind bases and regular surfaces. No general nonnoetherian rank-one model contract or matching plan gap exists.

   **Exact repair text:** “Use SchemeAndStackFoundations §5.3 (`Chow.c1`, `proper_pushforward`) and §5.2 for residue-field intersections. The arbitrary-rank-one model specialization and modification comparison are prerequisites to §6.2 and are registered separately.” Register a precise named-supplier gap for each missing specialization/projection interface, with identical slugs in the plan and Exact supplier contracts; alternatively make these named earlier targets here. Replace the nonexistent `SF.5/first-chern`, `SF.5/chern-projection`, `SF.5/degree` and `SF.5/arithmetic-surface-comparison` identifiers by the current section/declaration names. Do not restrict model measures to DVRs.

4. **F04** (P2) The idempotent/clopen headline has an easy signature but is omitted

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:584; packages/TropicalAndBerkovichArithmetic/Suggested.lean:77–79.

   **Claim:** The Lean file contains the milestones that are easy to state on its retained carriers.

   **Witness:** §0.25 uses only `Spectrum A`, the existing topology, multiplication, `IsClopen` and evaluation. All are already available in the file; no new analytic carrier is needed.

   **Exact repair text:** Add a README-named representative theorem with a mathematical docstring:

   ```lean
   theorem existsUnique_idempotent_of_isClopen [CompleteSpace A]
       (h_one : ‖(1 : A)‖ ≤ 1) (U : Set (Spectrum A)) (hU : IsClopen U) :
       ∃! e : A, e * e = e ∧ ∀ x : Spectrum A, x ∈ U ↔ x.eval e = 1 := sorry
   ```

   Keep any imported spectrum carrier adjustments required by R23. This is a missing easy headline; the existing file contains no forced heavy headline.

5. **F05** (P3) Statable discriminating Checks are missing from Lean

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:119–122, 157–160, 244–247, 271–273; packages/TropicalAndBerkovichArithmetic/Suggested.lean:81–105.

   **Claim:** The retained definitions have discriminating proved examples matching their statable README Checks.

   **Witness:** Lean has four examples: zero-ring emptiness, constructor projection by reflexivity, induced continuity, and the reciprocal value. It has no product-projection point, nonmultiplicative-product counterexample, separating evaluation or integer-path topology test.

   **Exact repair text:** Replace the reflexive constructor example by a proved example constructing the two projection points of `Spectrum (ℝ × ℝ)`, computing their evaluations at `(2,3)` as 2 and 3, and proving them unequal. Add a proved topology example separating those points by an evaluation-open set. Bundle the existing norm-point checks at 0, 2 and 1/2 into one proved example. Supply proved mirrors of the statable integer-path Checks, or turn any boundary statement whose proof is not yet available into an explicitly named theorem target in both files. Keep at most two proved examples per retained definition; do not use admitted examples.

6. **F06** (P3) The entire bibliography lacks the required source manifest

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:2194–2234; package file inventory.

   **Claim:** The package supplies source provenance and exact version/locator records for its cited works.

   **Witness:** The package contains README.md, Suggested.lean, metadata.toml and review.json, but no sources.toml. Thirty-seven bibliography entries therefore have no package source-status or version records.

   **Exact repair text:** Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, one entry per cited version, recording authors, title, year, locator scheme, locators and consuming sections, plus the source service's provenance/hash/licence/status fields. Preserve uncertified paywalled statuses and distinguish the actually fetched Poineau–Turchetti version. Do not place cache paths or source text in the package.

7. **F07** (P3) Forbidden declaration catalogue and review-status prose

   **Location:** packages/TropicalAndBerkovichArithmetic/Suggested.lean:109–128; packages/TropicalAndBerkovichArithmetic/README.md:1010; “This is an unresolved proof input”.

   **Claim:** The signature file contains only declarations and mathematical section comments, and the roadmap is timeless.

   **Witness:** Suggested.lean ends with a twenty-line catalogue of absent declarations. README §2.8 labels a proof obligation by its unresolved status rather than stating the required theorem.

   **Exact repair text:** Delete the catalogue at Suggested.lean:109–128; the module docstring already explains the README-only carriers. Replace the quoted sentence with “Prove continuity at vertices using the star-neighborhood argument below; continuity on the complementary components alone is insufficient.”

8. **F08** (P1) Formal-model supplier targets moved from Part II to Part III

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:68–69, 1040, 1056, 1168, 1805.

   **Claim:** AdicSpacesPartII R2 provides `admissible-formal-scheme` and `raynaud-generic-fibre`.

   **Witness:** TauCetiRoadmap/AdicSpacesPartIII/README.md:4356–4359 and 4878 owns those exact targets over arbitrary complete rank-one bases. AdicSpacesPartII now has R0 and R1, not R2.

   **Exact repair text:** Replace every supplier occurrence of “AdicSpacesPartII R2 (`admissible-formal-scheme`)” by “AdicSpacesPartIII §R2.2 (`admissible-formal-scheme`)”, and every “AdicSpacesPartII R2 (`raynaud-generic-fibre`)” by “AdicSpacesPartIII §R2.3 (`raynaud-generic-fibre`)”. Update the supplier inventory and layer dependency summaries consistently. Retain Part II §R1.3 for adic analytification.

9. **F09** (P1) Weighted Tate algebras and the Tate gauge are replanned

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:393–413, 623, 632.

   **Claim:** This package constructs weighted restricted series, their Gauss norm/completeness/evaluation and the general Tate gauge norm.

   **Witness:** TauCetiRoadmap/RestrictedPowerSeries/README.md:193, 247, 306 owns the weighted-series algebra, completeness and universal evaluation. PadicFunctionalAnalysis §0.4 owns Tate gauges; AdicSpacesPartII's spectral-seminorm contract explicitly imports it.

   **Exact repair text:** “Import RestrictedPowerSeries §§0.1, 1.1 and 2.1 for arbitrary positive polyradii, Gauss norms, completeness and contractive evaluation. Section 0.17 adds affinoid quotients, strictification and Berkovich comparisons. Import PadicFunctionalAnalysis §0.4's Tate gauge; §0.27 proves its uniform-unit and spectral-normalization comparison.” Replace the duplicated construction instructions and add the precise supplier dependencies.

10. **F10** (P2) The native-to-Banach-category adapter lacks its unit bound

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:297, 306; “For a native NormedCommRing the dominated seminorm subtype is this spectrum”.

   **Claim:** Every native normed commutative ring embeds in the category defined by `‖1‖≤1` while retaining its specified norm.

   **Witness:** On ℝ set ‖x‖′=2|x|. This is a complete submultiplicative normed commutative ring, but ‖1‖′=2. Separation/completion does not make it an object of the stated normalized category.

   **Exact repair text:** “For a native NormedCommRing A with `‖(1 : A)‖ ≤ 1`, separation and completion preserve the specified norm and identify its dominated-seminorm spectrum with the normalized Banach-category spectrum.” Preserve §0.1 for arbitrary native norms, and explicitly construct a separate normalization comparison if it is needed; do not silently change the norm data.

11. **F11** (P1) The star codimension estimate fails at valence zero

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:2128, 2140; “on an open star of valence d, forms with zero correction have codimension at most d−1”.

   **Claim:** The estimate applies to every open star, including a point skeleton.

   **Witness:** A good-reduction curve has a one-point skeleton, d=0 and zero correction. Its agreement subspace has codimension 0, whereas d−1=−1. `krzb-uniform` lines 1192–1199 explicitly requires at least one end.

   **Exact repair text:** “Let v be a type-II vertex, V an open star with d≥1 ends, U=τ⁻¹(V), and let H be the subspace of global regular differentials on X for which BC and abelian integrals agree on U. Then codim H≤d−1. For a zero-dimensional skeleton the correction is zero and codim H=0.” Add the good-reduction isolated-vertex negative control. Keep the global-regular-differential and basic-wide-open hypotheses in the annulus and star statements.

12. **F12** (P1) Two interface items create internal dependency cycles

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1396, 1420, 1850, 1863; “Principal divisors specialize to the graph principal divisors specified by the slope formula”.

   **Claim:** §3.6 supplies its principal-divisor interface before §3.7, and §6.3 supplies integrable-metric measures before §6.4.

   **Witness:** §3.7 consumes §3.6 while §3.6.principal invokes §3.7. Section 6.3's extension to integrable metrics invokes the uniform limits constructed in §6.4, whose Needs includes §6.3.

   **Exact repair text:** “Section 3.6 constructs point/degree/effectivity/refinement specialization. Section 3.7 proves its principal-divisor compatibility as a consequence of the slope formula. Section 6.3 proves model-metric curvature and intersection identities; §6.4 first constructs semipositive limits, then extends the §6.3 identities to differences of semipositive metrics.” Move the two interface items accordingly and give their individual Needs lines; do not leave the former whole-section dependencies.

13. **F13** (P2) Rational-point multiplicity hypotheses miss isolated irrational points

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1682–1686; “m_Trop(w)=1 for all value-group-rational w∈Γ′”.

   **Claim:** This hypothesis implies a unique multiplicity-one lift for every point of a compact Γ′, including an isolated irrational point.

   **Witness:** Over ℂₚ, p≠2, take y²=1+x in Gₘ² and Γ′={(α,0)}, α>0 outside log|ℂₚ×|. The rational-point condition is empty; the initial degeneration y²−1 has two components and two Shilov lifts.

   **Exact repair text:** “Assume m_Trop(w)=1 for every w∈Γ′, using valued extension to define multiplicity also at isolated points outside the value group. On nondegenerate segments, constancy permits checking rational points; at every isolated point multiplicity one is an explicit hypothesis.” Add the displayed two-branch singleton as a negative control. The interval argument in `bpr-metrics` lines 1315–1329 does not justify dropping this isolated-point hypothesis.

14. **F14** (P1) The stated Laplacian domain need not produce a finite measure

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1315–1317; “continuous functions that are C² along finitely many edge pieces”.

   **Claim:** Continuity, interior C² regularity and finite one-sided endpoint derivatives suffice to define the asserted finite signed Laplacian measure.

   **Witness:** On [0,1], f(t)=∫₀ᵗu sin(1/u²)du has f′(0)=0, but f″(t)=sin(1/t²)−2t⁻²cos(1/t²) is not absolutely integrable. Thus −f″ds is not a finite signed measure.

   **Exact repair text:** “For the elementary density formula require f to be C² up to the endpoints of each piece, or explicitly require f″∈L¹ and absolutely continuous f′ on each closed piece. Include the endpoint flux atoms. The larger potential-theoretic domain consists of continuous functions whose weak first derivatives have bounded variation on edges, with finite total Laplacian variation.” Add the oscillatory function as a negative control and use the larger domain for §6.6 as required by R20.

15. **F15** (P3) The stated library pins are stale

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:29; the Mathlib and Tau Ceti commit identifiers.

   **Claim:** The inventory and signatures are against the commits displayed in the README.

   **Witness:** The input lake-manifest.json pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, different from the displayed identifiers.

   **Exact repair text:** Replace the displayed Mathlib and Tau Ceti hashes by `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, respectively. Keep only declaration/path claims verified at these pins.

16. **F16** (P2) Nonemptiness is unnecessarily restricted to complete rings

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:324–326; packages/TropicalAndBerkovichArithmetic/Suggested.lean:59–61; `[CompleteSpace A]`.

   **Claim:** The nonemptiness milestone is stated only after completion, despite the defined spectrum admitting arbitrary native normed rings.

   **Witness:** `scholze` lines 433–436, Theorem 2.14, proves nonemptiness for any seminormed ring with norm of 1 equal to 1, using invariance under completion. Completeness is not a hypothesis of the theorem.

   **Exact repair text:** “For any seminormed commutative ring A with ‖1‖=1, M(A) is nonempty.” State the full seminormed-ring target in the README and remove `[CompleteSpace A]` from the native `Spectrum.nonempty` signature and its docstring. Keep completeness where it is needed for the unit criterion and other Banach results.

17. **F17** (P1) Amalgamation and completed-tensor injectivity have no usable dependency contract

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:383, 423, 448; “using the tensor-product injectivity input”.

   **Claim:** The Needs lists supply the amalgamation and tensor-injectivity inputs for arbitrary complete valued fields, including trivial valuations and the archimedean Banach category.

   **Witness:** AdicSpacesPartII §R0.7 supplies valuation-class amalgamation; its completed-tensor exactness target at :7265 requires a nontrivial nonarchimedean base. `temkin` lines 703–709 explicitly invokes the additional completed-tensor injectivity theorem.

   **Exact repair text:** “Import AdicSpacesPartII §R0.7 `ValuationSpectrum.exists_amalgamation` and §R0.18 `banach-completed-tensor-field-exactness` in their stated ranges. Before their use, prove named absolute-value-preserving complete-field amalgamation and scalar-extension injectivity interfaces in the remaining ranges, including trivially valued fields; prove the archimedean amalgamation needed by §0.16 separately.” State the isometric, rather than valuation-equivalence-only, conclusion and add these targets to the individual Needs lists of §§0.16, 0.18 and 0.19. Do not replan the supplied nontrivially valued tensor theorem.

18. **F18** (P1) The earlier integration extension already owns two required inputs

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:74–75, 2112, 2120, 2134; “the semistable residue gluing needs its own proof input”.

   **Claim:** This package must prove the characteristic-zero wide-open residue theorem and obtain the all-ℂₚ abelian logarithm from EffectiveDiophantineMethods ED.4.

   **Witness:** TauCetiRoadmap/ColemanIntegrationPartII/README.md:401–409 owns `wideOpen_residue_sum_zero`; :545–553 owns `NaturalIntegration.abelianLogCp` on all ℂₚ-points, its uniqueness and functoriality. ColemanIntegrationPartII is an allowed earlier supplier.

   **Exact repair text:** “Import ColemanIntegrationPartII §3.1 `wideOpen_residue_sum_zero` for the analytic wide-open residue identity, and §4.0 `NaturalIntegration.abelianLogCp` with its uniqueness and functoriality for the all-ℂₚ group logarithm. Section 7.7 constructs the oriented skeletal harmonic-cochain adapter and its BC-period interpretation; §7.8 uses the imported logarithm.” Remove instructions to reprove the supplied residue theorem and replace the ED.4 logarithm dependency wherever its full ℂₚ generality is required.

19. **F19** (P1) The required arbitrary-rank-one Raynaud extension is not declared

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:82, 2064, 2074; “the stated arbitrary-rank-one analytic extension”.

   **Claim:** NeronModelsAndSemistableAbelianVarieties R11.3 supplies the full analytic Raynaud cross, lattice and pairing over the arbitrary complete rank-one fields used here.

   **Witness:** The supplier table itself says the cited target is over a complete DVR and requests an extension. No readable plan with a matching gap or named local extension target exists.

   **Exact repair text:** Register named-supplier contracts, with identical `gap:` slugs in the plan and README, for the precise missing extensions: the split semistable analytic Raynaud uniformization over complete rank-one fields; the valuation map with its kernel and full period lattice; and the polarization/monodromy pairing with scalar-extension descent. Each contract must state its hypotheses and consuming target. Alternatively own these extension theorems here before §7.5, importing the existing DVR construction. Delete wording that treats the missing extension as already supplied; preserve the arbitrary-rank-one headline.

20. **F20** (P1) Arbitrary Green measures exceed the available Laplacian domain

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1911, 1917, 1930; “let μ be a probability measure”.

   **Claim:** The finite-piece C² Laplacian of §3.3 supplies a Green kernel for every probability measure on the graph.

   **Witness:** On a polarized interval of positive genus take μ to be Cantor probability measure. A finite-piece C² potential has only an absolutely continuous Laplacian plus finitely many atoms, never δₓ−μ.

   **Exact repair text:** “Extend Δ to continuous graph potentials with distributional second derivatives that are finite signed Radon measures. Prove existence and uniqueness modulo constants for every mass-zero finite signed Radon measure, then impose the μ-mean-zero normalization to define g_μ for any Radon probability μ.” Keep the quadratic-network argument for the special admissible measure only. Cite a source for this larger-domain extension or state its proof explicitly; Yuan's unit-edge admissible density does not supply the arbitrary-measure assertion. Add a singular-continuous probability as a domain test.

21. **F21** (P2) The admissible metric formula mixes unit and natural-log Green kernels

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1913, 1954; “Its admissible correction is e_K^(−a−g_μ(KΓ,τ(x)))”.

   **Claim:** The displayed correction uses the natural-log Green kernel defined in §6.6 while retaining Yuan's base-e_K exponent.

   **Witness:** `yuan` lines 3887, 3934, 3946 use unit edges and e_K. Scaling lengths by c scales g and a by c. Applying e_K to that already scaled kernel inserts a second factor c.

   **Exact repair text:** “Write g_nat(s,t)=c·g_unit(s/c,t/c) and a_nat=c·a_unit. The natural-log correction is exp(−a_nat−g_nat(KΓ,τ(x)))=exp(g_nat(τ(x),τ(x))). Equivalently, in unit coordinates it is e_K^(−a_unit−g_unit(KΓ,τ(x))).” Use distinct names consistently. Check a loop with one genus-one vertex: KΓ=2v and μ_a=(δ_v+ds/L)/2, so the curvature correction is nonzero and detects an erroneous extra factor when c≠1.

22. **F22** (P1) DVR approximation does not prove the arbitrary-rank-one metric theorem

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1940, 1946, 1954, 1958; “Apply model PL approximation”.

   **Claim:** The rational-length, discrete-valuation theorem in §6.7 proves the §6.8 curvature extension for every split semistable proper curve over a complete rank-one field.

   **Witness:** A split Mumford curve over a complete algebraically closed dense-value-group field can have two independent skeletal lengths 1 and √2. No common rescaling or finite extension makes both rational DVR lengths.

   **Exact repair text:** Add a named model-function approximation theorem for split semistable curves over arbitrary complete nontrivially valued rank-one fields: realize value-group-rational subdivisions and vertical model potentials, approximate edgewise C² potentials and their outgoing derivatives, and prove weak Laplacian convergence with bounded total variation. Prove the model curvature identity over the same rank-one bases using the corrected intersection contract of R03. Retain §6.7 as the DVR calibration and make the general theorem the actual prerequisite to §6.8.

23. **F23** (P1) A prior roadmap already owns the Banach spectrum core

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:7, 98–285, 324, 338, 2188; the claim that this package supplies the Banach spectrum to the adic roadmaps.

   **Claim:** The complete normed-ring spectrum, compact Hausdorff topology, nonemptiness, comap and spectral maximum are new ownership here.

   **Witness:** TauCetiRoadmap/AdicSpacesPartIII/README.md:12470–12500, §R3.9, already owns `Huber.GelfandSpectrum`, `GelfandSpectrum.compactSpace_nonempty` and `smoothingFun_eq_sSup`, including bounded-map pullback and the pointwise topology.

   **Exact repair text:** “Import AdicSpacesPartIII §R3.9's complete normed-ring Gelfand/Berkovich spectrum, compact Hausdorff topology, nonemptiness, bounded comap and spectral maximum, and PerfectoidSpaces §P1.12 `gelfandSpectrum_isUnit_iff` in the nonarchimedean range. This roadmap adds the explicitly identified extensions and comparisons.” Replace duplicate construction plans with adapters. If retaining the native noncomplete dominated-seminorm carrier, state its canonical comparison with the supplier's bounded-seminorm carrier after separated completion and make that extension the target. Retain the unit criterion's general archimedean extension. Delete reverse supplier claims and obsolete references locating R3 in Part II; adapt Suggested.lean and its README names consistently.

24. **F24** (P2) Triangulation existence omits the source's separatedness hypothesis

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1131, 1139; “For quasi-smooth analytic curves”.

   **Claim:** The triangulation theorem applies to the potentially non-Hausdorff analytic spaces admitted in §0.21.

   **Witness:** `ducros` lines 8020–8022 defines an analytic curve to be separated. The doubled-origin disc is quasi-smooth and nonseparated; deleting a locally finite type-II/III vertex set cannot separate its two origins into disc/annulus components.

   **Exact repair text:** “For separated quasi-smooth analytic curves over the stated complete nonarchimedean field, a locally finite triangulation exists with the specified virtual-disc/virtual-annulus complement.” Include separatedness in the carrier, all existence interfaces and the source comparison. Retain general nonseparated analytic atlases in §0.21 and add the doubled-origin disc as a negative control.

25. **F25** (P1) Relative multiplicity drops geometric lengths under inseparable extension

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1603, 1605, 1610–1612; “retain the scheme-length factors separately in m_Trop”.

   **Claim:** Reduced X over any complete field has base-extension-summed generic-degree relative multiplicities satisfying m_Trop(w)=Σm_rel(x), without geometric length weights.

   **Witness:** Let K=𝔽ₚ(a) with trivial norm and X={Tᵖ−a=0}⊂Gₘ. At w=0 the original canonical-reduction degree is 1; after algebraic closure the sole branch has generic length p. Thus m_rel=1 but m_Trop=p.

   **Exact repair text:** “After an algebraically closed complete valued extension realizing w, retain the generic lengths of the base-changed algebraic cycle and weight each branch's reduction degree by that length. Define m_rel over the original field by summing these weighted geometric branches over each original point, and prove independence among such extensions and the tropical-sum identity.” State any unweighted geometric-branch formula only under geometric reducedness, while retaining the general cycle theorem. Add this inseparable closed point and its product with Gₘ as negative controls. Keep the already correct inseparable annular degree calculation for T↦Tᵖ.

26. **F26** (P1) Promised comparison and approximation inputs have no named targets

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:526, 1837, 1870, 1905; “This latter extension is a further theorem target”.

   **Claim:** Proper coherent GAGA, higher-dimensional density of model functions and arbitrary-base Radon limits are supplied before their downstream uses.

   **Witness:** §0.22's interface lists only point/map/charts/baseChange. Section 6.4 assumes countable density and invokes uniform model-function density; §6.2's non-countable extension and §6.5's general-field extension have no declaration names or precise dependency contracts.

   **Exact repair text:** Add `analytification.proper_coherent_gaga` for proper finite-type K-schemes, stating the coherent-sheaf equivalence and cohomology comparison used by §1.4. Add `model_functions_uniformly_dense` for proper varieties over complete nontrivially valued rank-one K and `model_measure_limits_arbitrary_base`, specifying uniform semipositive approximation, positivity, fixed mass, approximation independence and the mixed/integrable extension. Place the latter after semipositivity and before its consumers. Import ArithmeticDynamics's already supplied projective C_v density/pure-power measures and general-field line potential theory in their exact ranges instead of declaring those supplied cases again.

27. **F27** (P3) Several definition Checks do not test a distinct case

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:860–862, 1550; “the chosen descended length is geometric length/m”.

   **Claim:** Each definition has at least three discriminating Checks.

   **Witness:** The virtual-annulus checks repeat the split/modulus definitions and mention an unspecified end-swapping form. Initial-degeneration check3 merely repeats the extension procedure without an example or computed degeneration.

   **Exact repair text:** Retain the split-annulus calibration and add a concrete nonsplit computation: for odd p and a nonsquare unit u∈ℚₚ, the domain r<|T²−u|<R with 0<r<R<1 splits over the unramified quadratic extension into two annuli of length log(R/r), so its chosen descended length is log(R/r)/2. Give an explicit end-swapping descent datum and compute the quotient skeleton. For initial degeneration take trivially valued K, X=Gₘ and w=√2; realize w in a complete valued extension, translate, and compute in_w(X)=Gₘ over its residue field. These supplement, rather than paraphrase, the definitions.

28. **F28** (P3) Two source locator labels identify the wrong kind of result

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:452, 1555; “Facts 3.2.3.2–3.2.3.4”; “Propositions 4.17–4.18”.

   **Claim:** All the cited labels designate numbered facts or propositions with those numbers.

   **Witness:** `temkin` line 702 labels 3.2.3.3 an Exercise. `bpr-metrics` line 812 begins subsection 4.18, not Proposition 4.18; Proposition 4.17 occurs at line 793.

   **Exact repair text:** Replace “Facts 3.2.3.2–3.2.3.4” by “Fact 3.2.3.2, Exercise 3.2.3.3 and Fact 3.2.3.4”. Replace “Propositions 4.17–4.18” by “Proposition 4.17 and §4.18”. Retain the specified versions in the source manifest.

29. **F29** (P2) Virtual annuli need connectedness for the modulus to be defined

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:845, 851, 853; “becomes a finite disjoint union of ordinary discs or annuli”.

   **Claim:** The stated definition implies that geometric annular components are conjugate and have a common modulus.

   **Witness:** Over algebraically closed K, the disjoint union of two annuli of different moduli satisfies the displayed definition but gives two different values for Mod(component)^(1/2). `poineau-turchetti` line 1087 explicitly requires a connected subset.

   **Exact repair text:** “A virtual disc or annulus is a nonempty connected analytic domain in A¹ᵃⁿ_K whose geometric base change is a disjoint union of ordinary discs or annuli of the specified open/closed kind. In the finite-component annular case the geometric components form one Galois orbit, so the displayed modulus is independent of the chosen component.” Require connectedness also for abstract annulus forms and add a disconnected unequal-modulus union as a negative control.

30. **F30** (P1) General Banach rational localizations cannot use the field-affinoid carrier

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:656, 662; “Under the uniform-unit hypotheses, rational subsets of Spa have closed affinoid traces in M(A)”.

   **Claim:** §0.19 supplies the affinoid algebras and restriction maps needed for §0.29's arbitrary nonarchimedean Banach ring A.

   **Witness:** A=ℤₚ((T)), with discrete coefficient norm and norm r^ord_T, is complete and has uniform unit T. It admits no unital field scalar map, since p is not invertible. Section 0.19 requires a K-affinoid algebra.

   **Exact repair text:** “Import AdicSpaces §0.4 and Layer 3 for completed rational localizations of general Tate Huber rings. Construct their specified quotient Banach norms and the bounded spectrum comparison identifying each rational trace with M(A⟨f/g⟩). Use these general Banach rational domains in the Hausdorff-localization colimit; recover §0.19's K-affinoid domain only in the field-affinoid specialization.” Add this comparison as a named target before §0.29, with its norm-sensitive hypotheses; do not restrict §0.29 to algebras over fields.

31. **F31** (P3) The Tate negative-control Check confuses field units with norm-one units

   **Location:** packages/TropicalAndBerkovichArithmetic/README.md:1996; “a unit q does not supply this contracting annular quotient”.

   **Claim:** Being a unit excludes the contracting Tate parameter.

   **Witness:** q=p is a unit of ℚₚ and satisfies 0<|q|ₚ<1, so it is a valid Tate parameter. Every permitted nonzero parameter is a field unit; the excluded case is |q|=1.

   **Exact repair text:** “The condition 0<|q|<1 is essential. A parameter q with |q|=1, equivalently a unit of the valuation ring K°, does not give this contracting annular quotient. The positive example q=p is a unit of the field ℚₚ; q=0 is excluded.”

## Verified sound

**Coverage.** Read all 2,234 README lines and all 130 Suggested.lean lines, plus both repository rule files. Audited 17 Lean declarations/examples: 3 definitions, 2 abbreviations, 1 instance, 7 theorem signatures and 4 proved examples. Read 103 numbered target sections, inventoried 437 distinct qualified names including subinterfaces and named Checks, and tested the 119 Check blocks against the stated carriers and boundary cases. The ten bold supplier contracts are accounted for below. Checked 222 locator groups in readable legal source versions; located one additional Coleman proposition whose displayed formula is missing from the extraction. Inspected source-service records for all 37 bibliography entries: 33 fetched versions, 3 settled uncertified works, 1 failed retrieval. Searched all 7 supplied sibling heads; checked the 6 relevant section contracts in ArithmeticDynamics §§2.2, 2.3, 2.5, 6.1 and ColemanIntegrationPartII §§3.1, 4.0. Main-roadmap and pinned-library checks are separate from that sibling count.

**Successful mathematical tests.** The seven Lean theorem types are mathematically true with their displayed binders; R16 concerns excessive restriction, not a false theorem. Inverse bounds prove the normed-field singleton without completeness; zero-ring emptiness is consistent with the unit criterion; the spectral limit uses n+1. The graph sign calibration gives Δ(t)=δ_L−δ_0 and Δ(t²/2)=−ds+Lδ_L. Tree/circle Riemann–Roch, loop valency two, genus b₁+Σg_v, the gcd expansion examples (−2,4)↦2 and zero vector↦0, the target/image lattice index, and inseparable annular degree p survive the tests. The genus-one circle kernel has Δg=δ_0−ds/L. The hybrid monomial exponent is positive ord, the nonclassical energy diagonal is retained, and cross-energy positivity is correctly rejected. The Tate BC-minus-abelian sign cancels when a lift is multiplied by q. No forced heavy Lean headline was found.

**Pinned interfaces and policy.** The 22 named Mathlib entries in the supplier inventory exist at their stated files. The Tau Ceti coarsening, separated-ring Spa comparison, restricted Gauss multiplicativity, algebraic Riemann–Roch and convex-polyhedron declarations were found at the pins. No sorry-valued data, admitted examples, `set_option`, `lemma` declaration, `True` placeholder or hypothesis containing its conclusion occurs in Suggested.lean. Its only import is `import Mathlib`, and its length is below 5,000 lines. No computational algorithm or out-of-package tracked change was found. Static checking is distinguished from elaboration below.

**Mechanical dependency output.** The requested depcheck exited 1 and printed:

```text
NOT IN ORDER: TropicalAndBerkovichArithmetic (insert it after its last supplier)
depcheck: 8 roadmaps, 53 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. Absence from the order is recorded without a finding. The tool's eight-roadmap graph does not certify missing supplier declarations or the two internal cycles in R12. No ownership was moved during this read-only review. R01, R09, R18 and R23 repoint to earlier owners; R02, R03, R17, R19, R22, R26 and R30 require local extensions or properly registered earlier-supplier contracts, never a new upward edge.

**Package boundary.** The requested comparison against origin/main contained only:

```text
packages/TropicalAndBerkovichArithmetic/README.md       | 2234 +
packages/TropicalAndBerkovichArithmetic/Suggested.lean  |  130 +
packages/TropicalAndBerkovichArithmetic/metadata.toml   |    1 +
packages/TropicalAndBerkovichArithmetic/review.json     |    8 +
4 files changed, 2373 insertions(+)
```

**Bold supplier-contract audit.**

| Contract and README line | Current witness / result |
|---|---|
| SchemeAndStackFoundations SF.3 / 79 | §3.3, TauCetiRoadmap/SchemeAndStackFoundations/README.md:4738, `cohomologyDim_zero_structureModule` supplies proper geometrically integral global constants; AlgebraicCurves §§12C–12E supplies the smooth proper model dictionary. No missing-H⁰ finding. |
| SchemeAndStackFoundations SF.0 / 80 | General-field toric extension missing, R02. |
| SchemeAndStackFoundations SF.5 / 81 | Current §5.3 and §5.9 differ from the requested rank-one contract, R03. |
| NeronModelsAndSemistableAbelianVarieties R11.3 / 82 | The package explicitly requests an undeclared extension, R19; current supplier text unavailable. |
| AdicSpaces Layer 2 / 83 | TauCetiRoadmap/AdicSpaces/README.md:358–448 supplies Spa, rational topology, analytic points and comparisons; rank-one existence is also pinned. General rational algebra localization is Layer 3, R30. |
| AlgebraicCurves Layer 4 / 84 | TauCetiRoadmap/AlgebraicCurves/README.md:527–570 supplies function-field Riemann–Roch; algebraic-to-scheme use has the Layer 12 comparison. |
| EllipticCurves Layer 4 / 85 | TauCetiRoadmap/EllipticCurves/README.md:885–903 explicitly supplies point-level Galois-equivariant Tate uniformization for complete rank-one K, including residue characteristics 2 and 3; analytic-space quotient remains new. |
| StableReduction Layer 1 / 86 | TauCetiRoadmap/StableReduction/README.md:344–348 retains loops, normalization genera and the graph genus formula. |
| StableReduction Layer 2 / 87 | TauCetiRoadmap/StableReduction/README.md:354–372 retains locally Noetherian, proper and flat hypotheses. |
| StableReduction Layer 7 / 88 | The DVR compatibility contract does not claim rank-one existence; this roadmap separately states the rank-one theorem. |

**Source locator ledger.** Counts treat a listed section/page range as one locator group, not one group per page. The ledger certifies the passages in the retrieved versions; it does not silently certify unavailable editions or every intermediate theorem in a cited proof. Coleman is excluded from the 222 substantive checks.

| Source version | Locator groups checked | Evidence |
|---|---|---|
| temkin | 2.1.2.1; 2.2.2.1; 2.2.2.3; 2.2.2.4; 3.1.1.1; 3.1.4.1; 3.2.2.1; 3.2.3.1; 3.2.3.2–3.2.3.4; 3.3.1–3.3.3; 4.1.1.1; 4.1.2.1; 5.1.1.1; 5.1.1.2; 5.1.2.1; 5.1.2.2 | temkin line 178,272,290,293,469,573,638,694,700–719,739–834,995,1017,1539,1552,1563,1566 |
| scholze | 2.1; 2.2; 2.4; 2.12; 2.13; 2.14; 2.15; 2.18; 2.19; 2.20; 2.21; 3.2 | scholze line 286,298,306,410,413,433,450,468,500,505,513,613 |
| bpr-structure | 2.4; 2.5; 2.10; 3.2; 3.4; 3.8; 3.9; 3.13; 4.3; 4.6; 4.10; 4.11; 4.21; 4.22; 4.23; 5.15 | bpr-structure line 225,228,299,348,388,415,422,455,533,563,594,614,748,759,765,1014 |
| bpr-structure-offprint | 3.1; 3.3; 3.5; 3.7; 3.9; 3.13 | bpr-structure-offprint line 483,546,571,580,593,636 |
| bpr-metrics | 4.8; 4.14; 4.17; §4.18; 4.21; 4.23; 4.24; 5.4; 5.6 and (5.6.1); 5.8; 5.9; 5.15; 5.16; 5.17; 5.18; 5.19; 5.20; 5.21; 5.22; 5.24; 5.25; 7.1; 7.3 | bpr-metrics line 734,772,793,812,857,895,902,1059,1078,1093,1113,1181,1204,1214,1222,1245,1255,1281,1292,1315,1340,1643,1694 |
| poineau-turchetti | I.2.1; I.2.5; I.2.9; I.2.11; I.2.12; I.2.20; I.6.12; I.6.14; I.7.1; I.7.6; I.7.7; I.7.8; I.8.6; I.8.8; I.8.9; II.1.9; II.1.10; II.1.11; II.2.26; II.2.28; II.3.1; II.3.6; II.3.18; II.3.21; II.3.22; II.3.24; II.3.26; II.4.3; II.4.7; I.4.14; I.5.1; I.5.5; I.5.6; I.7.2; I.7.4; I.7.5 | poineau-turchetti line 263,313,339,352,364,438,1050,1076,1087,1134,1138,1148,1221,1249,1251,1592,1595,1615,1859,1903,1934,1986,2133,2223,2228,2247,2268,2511,2699,790,811,851,896,1091,1096,1120 |
| gathmann-kerber | 2.1; 2.3; 2.4; 2.5; 3.1 | gathmann-kerber line 328,388,434,454,467 |
| baker-specialization | 2.8; 2.10; 2.11 | baker-specialization line 374,406,408 |
| amini-baker | 3.2; 3.7; 3.13; 4.5; 4.6; A.1; A.3; A.4 | amini-baker line 673,741,987,1147,1183,2086,2102,2128 |
| baker-faber | 3.4; 4.1 | baker-faber line 831,904 |
| gubler | 3.2; 3.3; 3.6; 3.7; 5.1; 5.2; 5.3; 5.4; 5.5; 5.6; 6.7; 10.14; 10.15; 13.4; 13.5; 13.6; 13.7; 13.8; 13.11; 13.16; 13.17 | gubler line 300,305,322,328,487,494,497,506,511,519,581,1499,1515,2019,2032,2086,2095,2100,2137,2181,2198 |
| sturmfels-tevelev | 3.1; 3.2; 3.4; 3.8 | sturmfels-tevelev line 312,316,356,376 |
| chambert-loir | 2.1; 2.2; 2.3; 2.4; 2.5; 2.7; Tate example pp.17–18 | chambert-loir line 143,160,182,193,207,254,685 |
| favre-rivera | 4.3; 4.4; 4.5 | favre-rivera line 1196,1204,1221 |
| favre-corrigendum | corrigendum pp.1–3 | favre-corrigendum line 1 |
| yuan | Appendix A.5; A.4; A.5 | yuan line 3880,3956,3975 |
| zavyalov | A.7; A.8; A.11 | zavyalov line 4033,4038,4087 |
| kedlaya-liu | 2.3.9; 2.3.12; 2.3.14; 2.4.1; 2.4.4; 2.4.6; 2.4.8; 2.4.12; 2.4.17; 8.2.11; 8.2.12; 8.2.13 | kedlaya-liu line 1376,1425,1436,1484,1538,1563,1577,1620,1679,6314,6328,6338 |
| kedlaya-liu-ii | Appendix A pp.189–191 | kedlaya-liu-ii line 7266 |
| colmez-dospinescu-niziol | Appendix A.2 | colmez-dospinescu-niziol line 2000 |
| dky-preprint | 2.7; 4.3 | dky-preprint line 468,881 |
| dky-published | 2.7 | dky-published line 491 |
| boucksom-jonsson | 4.9; 4.12; Appendix A.4–A.6 | boucksom-jonsson line 1232,1321,2258 |
| boucksom-jonsson-published | Appendix A.4; Appendix A.6 | boucksom-jonsson-published line 2314,2354 |
| krzb-survey | 4.2.2 | krzb-survey line 1342 |
| krzb-uniform | 3.1; 3.3; 3.5; 3.4.1; 3.16; 3.18; 3.28; 3.29 | krzb-uniform line 706,777,786,945,1018,1057,1192,1231 |
| baker-rabinoff | 2.9; 4.7; 6.1; 6.6; 6.7 | baker-rabinoff line 256,538,762,861,865 |
| berkovich-integration | 1.6.1; 1.6.2; 9.1.1 | berkovich-integration line 826,837,4747 |
| bosch-lutkebohmert | 3.8; 6.1; 7.1 | bosch-lutkebohmert line 715,1016,1097 |
| ducros | 3.3.1; 4.5.2; 5.1.12; 5.1.13; 5.1.14; 5.4.12; 6.4.1 | ducros line 8020,12338,13253,13312,13323,14456,15968 |
| de-shalit | 0.3, equations (0.11)–(0.13) | de-shalit line 115 |
| baker-norine | 1.12; §2 reduced-divisor criterion; 3.3 | baker-norine line 283,317,618 |

**Lean context and adversarial-instance table.**

All declarations are in packages/TropicalAndBerkovichArithmetic/Suggested.lean, Layer 0, namespace TauCetiRoadmap.TropicalAndBerkovichArithmetic (the last sixteen entries in Spectrum). Type variables have independent inferred universes. No elaborator or Lean build was run; this is a signature, instance-scope and proof-text audit.

| Declaration / line | Retained variables and instances | Instances tried / result / change |
|---|---|---|
| Spectrum / 27 | A : Type u; [NormedCommRing A] | Zero ring, product projections, nilpotents; real body; complete-case ownership R23 |
| toSeminorm / 34 | {A}; [NormedCommRing A]; x : Spectrum A | Forgets bound only; zero-ring carrier empty |
| eval / 37 | {A}; [NormedCommRing A]; x; a : A | Whole-ring evaluation distinguishes product projections |
| ofSeminorm / 40 | {A}; [NormedCommRing A]; p; pointwise hp | Genuine constructor, no sorry data; rfl example not discriminating, R05 |
| topology / 43 | A; [NormedCommRing A] | Induced from A → ℝ; no topology on A used; product separation, R05/R23 |
| normPoint / 47 | K : Type v; [NormedField K] | A and B drop; norm_mul/norm_one provide actual fields; ℚ, ℝ, trivial valuation |
| compactSpace / 53 | A; [NormedCommRing A] | No completeness or nontriviality needed; empty and noncomplete cases valid |
| t2Space / 56 | A; [NormedCommRing A] | Coordinate embedding separates all points, including empty case |
| nonempty / 59 | A; [NormedCommRing A]; explicit [CompleteSpace A] [NormOneClass A] [Nontrivial A] | True as typed; unnecessary completeness, R16; supplier ownership R23 |
| isUnit_iff / 63 | A; [NormedCommRing A]; explicit [CompleteSpace A]; h_one ≤ 1; a | Complete normalization retained; zero ring both sides true; nilpotent/field cases valid |
| spectral_maximum / 67 | A; [NormedCommRing A]; explicit [CompleteSpace A] [NormOneClass A] [Nontrivial A]; a | n+1 prevents zero exponent; a=0, nilpotent and field tested; R23 |
| exists_comap / 73 | A : Type u, B : Type v; both NormedCommRing; f : A →+* B; hf : f.IsBounded | B retained here only; identity/composition and maps to zero ring; power trick gives domination |
| eq_normPoint / 78 | K; [NormedField K]; x : Spectrum K | A/B drop; inverse bound gives equality, no completeness needed |
| example / 82 | A; [NormedCommRing A]; [Subsingleton A] | Contradicts p(0)=0 and p(1)=1; proved and discriminating |
| example / 92 | A; [NormedCommRing A]; p; hp | Two constructor reflexivities; policy defect R05 |
| example / 98 | A; [NormedCommRing A]; Z : Type v; [TopologicalSpace Z]; f | continuous_induced_rng and continuous_pi_iff match the actual topology; proof statically valid |
| example / 103 | No variables; normPoint ℝ | Reciprocal of 2 gives 1/2; proved norm_num text matches the expression |

**README target and adversarial-instance table.** The section-level rows include the subinterfaces inventoried under each target. A dash means that the listed tests produced no additional finding, not that a formal proof was completed.

| Statement (section and location) | Instances tried | Result | Change |
|---|---|---|---|
| 0.1 Berkovich spectrum (packages/TropicalAndBerkovichArithmetic/README.md:98), `TauCeti.Berkovich.Spectrum` | Zero ring; ℝ×ℝ projections; nilpotents | Carrier excludes zero function; product norm fails multiplication | R05, R23 |
| 0.2 Bounded points are norm dominated (packages/TropicalAndBerkovichArithmetic/README.md:132), `TauCeti.Berkovich.Spectrum.bounded_iff_dominated` | Bound C>1; powers n→∞; zero element | Power trick removes C without completeness | — |
| 0.3 Topology of pointwise convergence (packages/TropicalAndBerkovichArithmetic/README.md:144), `TauCeti.Berkovich.Spectrum.topology` | Two projections switched on ℚ; integer norm path | All coordinates required; pointwise is weaker than uniform | R05, R23 |
| 0.4 The evaluation map is an embedding (packages/TropicalAndBerkovichArithmetic/README.md:170), `TauCeti.Berkovich.Spectrum.isEmbedding_eval` | Distinct product projections; empty spectrum | Evaluation is injective and induces topology | — |
| 0.5 Equations for the evaluation image (packages/TropicalAndBerkovichArithmetic/README.md:182), `TauCeti.Berkovich.Spectrum.range_eval` | Zero function; constant one; product maximum norm | Axioms exclude each incorrect function | — |
| 0.6 Closedness of the evaluation image (packages/TropicalAndBerkovichArithmetic/README.md:194), `TauCeti.Berkovich.Spectrum.isClosed_range_eval` | Zero ring; unbounded product coordinates | Each equation closed; domination coordinatewise closed | — |
| 0.7 Compactness of the Berkovich spectrum (packages/TropicalAndBerkovichArithmetic/README.md:206), `TauCeti.Berkovich.Spectrum.compactSpace` | Empty spectrum; noncomplete normed field | Closed subset of product of compact intervals | R23 |
| 0.8 Hausdorffness of the Berkovich spectrum (packages/TropicalAndBerkovichArithmetic/README.md:218), `TauCeti.Berkovich.Spectrum.t2Space` | Product projections; empty spectrum | Distinct seminorms separated by a coordinate | R23 |
| 0.9 Pullback of Berkovich points (packages/TropicalAndBerkovichArithmetic/README.md:230), `TauCeti.Berkovich.Spectrum.comap` | Identity; composite; map to zero ring | Contravariant order and bounded power argument correct | R23 |
| 0.10 The norm point of a valued field (packages/TropicalAndBerkovichArithmetic/README.md:259), `TauCeti.Berkovich.Spectrum.normPoint` | ℝ at 0,2,1/2; incomplete valued field | Specified norm is multiplicative and dominated | R05 |
| 0.11 The spectrum of a normed field is a singleton (packages/TropicalAndBerkovichArithmetic/README.md:283), `TauCeti.Berkovich.Spectrum.eq_normPoint` | Trivially valued field; ℚ; inverse of nonzero element | Bounds on a and inverse force equality | — |
| 0.12 Seminormed Banach rings (packages/TropicalAndBerkovichArithmetic/README.md:295), `TauCeti.Berkovich.TB0.banach_ring_category` | Zero seminorm; doubled real norm; completion | Native normalized-category adapter needs unit bound | R10 |
| 0.13 Existence of spectral points (packages/TropicalAndBerkovichArithmetic/README.md:322), `TauCeti.Berkovich.Spectrum.nonempty` | Zero ring; ℚ; complete field | Nonzero normalized ring has point before completion | R16, R23 |
| 0.14 Units and spectral maximum (packages/TropicalAndBerkovichArithmetic/README.md:336), `TauCeti.Berkovich.TB0.unit_and_spectral_radius` | Nilpotent; zero ring; field inverse | Unit criterion and n+1 root limit correct; already owned maximum | R23 |
| 0.15 Completed residue fields (packages/TropicalAndBerkovichArithmetic/README.md:352), `TauCeti.Berkovich.TB0.completed_residue_fields` | Kernel at evaluation; Gauss point; field point | Prime kernel, fraction norm and completion consistent | — |
| 0.16 Spectra and contractive colimits (packages/TropicalAndBerkovichArithmetic/README.md:377), `TauCeti.Berkovich.TB0.contractive_colimits` | Identity pushout; zero tensor product; ℤ | Contractive category is essential; empty fibers consistent; amalgamation input unnamed | R17 |
| 0.17 Affinoid algebras over valued fields (packages/TropicalAndBerkovichArithmetic/README.md:391), `TauCeti.Berkovich.TB0.affinoid_algebras` | Radius outside value group; n=0; quotient zero | Weighted-series part belongs to existing owner | R09 |
| 0.18 Valued base change of spectra (packages/TropicalAndBerkovichArithmetic/README.md:417), `TauCeti.Berkovich.TB0.spectral_base_change` | Identity extension; trivially valued base; nonstrict radius | Surjective scalar extension is separate from pointwise products; amalgamation contract missing | R17 |
| 0.19 Rational and affinoid domains (packages/TropicalAndBerkovichArithmetic/README.md:429), `TauCeti.Berkovich.TB0.affinoid_domains` | Whole domain; empty domain; rational denominator | Universal domain statement needs tensor injectivity input | R17, R28 |
| 0.20 Affinoid structure sheaf and acyclicity (packages/TropicalAndBerkovichArithmetic/README.md:454), `TauCeti.Berkovich.TB0.analytic_sheaf` | Two rational pieces; zero module; nonstrict radii | Finite-module acyclicity range explicitly separated from sheaf descent | — |
| 0.21 Analytic atlases and morphisms (packages/TropicalAndBerkovichArithmetic/README.md:481), `TauCeti.Berkovich.TB0.analytic_spaces` | One chart; doubled-origin gluing; non-Hausdorff space | General atlases permit nonseparated spaces | — |
| 0.22 Berkovich analytification (packages/TropicalAndBerkovichArithmetic/README.md:507), `TauCeti.Berkovich.TB0.analytification` | Affine line; proper curve; trivially valued field | Proper GAGA and local affine gluing separated, but GAGA has no named interface | R26 |
| 0.23 Hybrid analytic spaces (packages/TropicalAndBerkovichArithmetic/README.md:532), `TauCeti.Berkovich.TB0.hybrid_analytic_space` | Hybrid endpoints 0,1; monomial t; meromorphic puncture | r^ord sign correct; line case already owned | R01 |
| 0.24 Uniform Gelfand representation (packages/TropicalAndBerkovichArithmetic/README.md:564), `TauCeti.Berkovich.TB0.gelfand_representation` | Dual numbers; empty product; unbounded sequence | Spectral kernel and bounded product correctly specified | — |
| 0.25 Idempotents and clopen subsets (packages/TropicalAndBerkovichArithmetic/README.md:582), `TauCeti.Berkovich.TB0.idempotents_and_clopens` | ℝ×ℝ four idempotents; zero ring; complement | Clopen classification has easy native signature | R04 |
| 0.26 Archimedean Banach fields (packages/TropicalAndBerkovichArithmetic/README.md:598), `TauCeti.Berkovich.TB0.gelfand_mazur` | ℝ with exponent α; ℂ; nonarchimedean field | Archimedean exponent and real alternative needed | — |
| 0.27 Uniform units and trivial spectrum (packages/TropicalAndBerkovichArithmetic/README.md:612), `TauCeti.Berkovich.TB0.uniform_unit_hierarchy` | Discrete ring; weighted Laurent field; Tate gauge | Uniform unit hierarchy correct; gauge already owned | R09 |
| 0.28 Normalized rank-one adic quotient (packages/TropicalAndBerkovichArithmetic/README.md:640), `TauCeti.Berkovich.TB0.adic_rank_one_retraction` | Rank-two point; normalized unit; field | Coarsening existence imported; normalization needs unit | — |
| 0.29 Rational traces and Hausdorff localization (packages/TropicalAndBerkovichArithmetic/README.md:654), `TauCeti.Berkovich.TB0.hausdorff_localizations` | Rational whole set; Henselian localization; ℤₚ((T)) with discrete coefficients | General Banach localization is not the K-affinoid carrier | R30 |
| 0.30 Strict Berkovich–adic equivalence (packages/TropicalAndBerkovichArithmetic/README.md:666), `TauCeti.Berkovich.TB0.global_adic_comparison` | Proper curve; open disc; nonstrict space | Strict and paracompact restrictions retained | — |
| 0.31 Real quotient of analytic preadic spaces (packages/TropicalAndBerkovichArithmetic/README.md:682), `TauCeti.Berkovich.TB0.real_quotient` | Taut affinoid; non-Hausdorff adic space | Real quotient is distinct from separated-ring quotient | — |
| 0.32 Surjectivity detected by residue fields (packages/TropicalAndBerkovichArithmetic/README.md:696), `TauCeti.Berkovich.TB0.residue_field_surjectivity` | Identity; missing fiber; residue-field scalar extension | Field-valued surjectivity test has correct direction | — |
| 1.1 Gauss points, discs and projective line (packages/TropicalAndBerkovichArithmetic/README.md:722), `TauCeti.Berkovich.TB1.gauss_line_and_discs` | Gauss radii 0,1; polynomial T−a | Gauss values correct; line owner duplicated | R01 |
| 1.2 Four types of points (packages/TropicalAndBerkovichArithmetic/README.md:747), `TauCeti.Berkovich.TB1.four_point_types` | Type-I radius zero; type-III radius; empty nested intersection | Four cases distinguish residue and value-group data | R01 |
| 1.3 Paths, tangent directions and hyperbolic metric (packages/TropicalAndBerkovichArithmetic/README.md:763), `TauCeti.Berkovich.TB1.tree_hyperbolic_metric` | Coincident points; nested discs; branch point | Distance log(R/r), infinity and tangents consistent | R01 |
| 1.4 Connected algebraic curves remain connected (packages/TropicalAndBerkovichArithmetic/README.md:789), `TauCeti.Berkovich.TB0.connected_analytification` | Proper connected curve; affine punctures; empty set | Proper global functions plus clopens gives connectedness | — |
| 1.5 Annular skeleton and deformation (packages/TropicalAndBerkovichArithmetic/README.md:801), `TauCeti.Berkovich.TB1.annular_skeleton` | Annulus coordinate inverse; q-length; closed endpoints | Logarithmic interval and strong retraction agree | — |
| 1.6 Integral slopes of analytic units (packages/TropicalAndBerkovichArithmetic/README.md:829), `TauCeti.Berkovich.TB1.annular_integral_slopes` | cT^n; n=0; coordinate inversion | Integral slopes, units and orientation consistent | — |
| 1.7 Virtual annuli and metric descent (packages/TropicalAndBerkovichArithmetic/README.md:843), `TauCeti.Berkovich.TB1.virtual_annuli_descent` | Split annulus; nonsplit branches; ramification | Geometric length distinguished from descended modulus; connectedness missing | R27, R29 |
| 2.1 Semistable vertex set (packages/TropicalAndBerkovichArithmetic/README.md:881), `TauCeti.Berkovich.Curve.semistable_vertex_sets_and_skeleta` | Good-reduction singleton; empty vertex set; punctures | Type-II and finiteness conditions distinguish semistability | — |
| 2.2 Skeleton of a semistable decomposition (packages/TropicalAndBerkovichArithmetic/README.md:906), `TauCeti.Berkovich.Curve.skeleton` | Loop; repeated edge; good-reduction point | Metric realization retains loops and positive thickness | — |
| 2.3 Limit boundaries of semistable components (packages/TropicalAndBerkovichArithmetic/README.md:931), `TauCeti.Berkovich.Curve.component_limit_boundary` | Loop endpoints equal; ball endpoint; puncture | Limit-boundary cases separated | — |
| 2.4 Ball components off the skeleton (packages/TropicalAndBerkovichArithmetic/README.md:945), `TauCeti.Berkovich.Curve.skeleton_complement_balls` | Point in attached ball; point on skeleton | Ball complement characterization consistent | — |
| 2.5 Closure and punctures of the skeleton (packages/TropicalAndBerkovichArithmetic/README.md:957), `TauCeti.Berkovich.Curve.completed_skeleton_boundary` | Punctured annulus; no punctures; proper curve | Classical endpoints belong only to completion | — |
| 2.6 Disc characterization of the skeleton (packages/TropicalAndBerkovichArithmetic/README.md:969), `TauCeti.Berkovich.Curve.skeleton_disc_characterization` | Skeleton point; attached disc point | Maximal-disc characterization has correct direction | — |
| 2.7 Retraction onto the skeleton (packages/TropicalAndBerkovichArithmetic/README.md:981), `TauCeti.Berkovich.Curve.retraction_to_the_skeleton` | Vertex; edge point; ball component | Retraction fixes skeleton and collapses each attached ball | — |
| 2.8 Continuity of skeletal retraction (packages/TropicalAndBerkovichArithmetic/README.md:1006), `TauCeti.Berkovich.Curve.continuous_retraction` | Approaching vertex from ball; edge limit; puncture | Neighborhood test gives continuity, not merely pointwise formula | — |
| 2.9 Connectedness of the skeleton (packages/TropicalAndBerkovichArithmetic/README.md:1020), `TauCeti.Berkovich.Curve.connected_skeleton` | Good-reduction point; circle; connected proper curve | Image of connected curve connected | — |
| 2.10 Rank-one semistable reduction (packages/TropicalAndBerkovichArithmetic/README.md:1032), `TauCeti.Berkovich.TB2.rank_one_semistable_reduction` | Dense valuation; finite extension; good reduction | General rank-one theorem separately owned; formal supplier drift | R08 |
| 2.11 Formal models and metric dual graphs (packages/TropicalAndBerkovichArithmetic/README.md:1048), `TauCeti.Berkovich.TB2.formal_model_skeleton` | uv=a; uv=π^n; self-node | Length v(a) and two flags per loop correct | R08 |
| 2.12 Vertex genera and analytic genus (packages/TropicalAndBerkovichArithmetic/README.md:1062), `TauCeti.Berkovich.TB2.vertex_genus_and_genus_formula` | Tree with positive vertex genera; Tate circle; finite extension | g=b₁+Σg_v; rank-one descent needed and stated | — |
| 2.13 Refinement and valued extension (packages/TropicalAndBerkovichArithmetic/README.md:1076), `TauCeti.Berkovich.TB2.refinement_and_field_extension` | Edge subdivision; isometric extension; renormalized DVR | Geometric length invariant; numerical normalized length rescales | — |
| 2.14 Existence of a semistable vertex set (packages/TropicalAndBerkovichArithmetic/README.md:1090), `TauCeti.Berkovich.Curve.stable_reduction_and_minimal_skeleta` | Genus zero; good reduction; punctured curve | Existence follows stated reduction/refinement route | — |
| 2.15 Marked skeleta and puncture rays (packages/TropicalAndBerkovichArithmetic/README.md:1102), `TauCeti.Berkovich.TB2.marked_extended_skeleton` | One puncture; loop; multiple punctures | Infinite rays and distinct marked ends retained | — |
| 2.16 Locally finite triangulations and analytic nodes (packages/TropicalAndBerkovichArithmetic/README.md:1127), `TauCeti.Berkovich.TB2.noncompact_triangulations` | Tate circle; good-reduction point; doubled-origin disc | Node exception correct; general existence needs separatedness | R24 |
| 2.17 Triangulated curves and formal automorphisms (packages/TropicalAndBerkovichArithmetic/README.md:1160), `TauCeti.Berkovich.TB2.triangulated_formal_automorphisms` | Identity automorphism; node permutation; normal flat model | Extension needs matching formal owner | R08 |
| 2.18 Strong deformation onto a skeleton (packages/TropicalAndBerkovichArithmetic/README.md:1172), `TauCeti.Berkovich.TB2.skeletal_strong_deformation` | Singleton; circle; puncture ray | Strong deformation fixes skeleton throughout | — |
| 2.19 Contractions of genus-zero vertices (packages/TropicalAndBerkovichArithmetic/README.md:1184), `TauCeti.Berkovich.TB2.genus_zero_contractions` | Loop at genus-zero vertex; rational leaf; bridge | Loop excluded from the misleading bridge contraction | — |
| 2.20 Intrinsic minimal skeleton (packages/TropicalAndBerkovichArithmetic/README.md:1200), `TauCeti.Berkovich.Curve.intrinsic_minimal_skeleton` | Good reduction g≥1; genus-zero proper curve | Minimality scope excludes noncanonical genus-zero choices | — |
| 2.21 Stable vertices of a hyperbolic curve (packages/TropicalAndBerkovichArithmetic/README.md:1212), `TauCeti.Berkovich.Curve.stable_vertex_characterization` | Three marked rational points; genus-two component; self-loop | Positive weighted stability, loops counted twice | — |
| 2.22 Uniqueness of the minimal skeleton (packages/TropicalAndBerkovichArithmetic/README.md:1224), `TauCeti.Berkovich.Curve.unique_minimal_skeleton` | Refinement; two candidate skeleta; hyperbolic curve | Intrinsic core determines same subset | — |
| 2.23 Uniqueness of stable vertices (packages/TropicalAndBerkovichArithmetic/README.md:1236), `TauCeti.Berkovich.Curve.unique_stable_vertex_set` | Rational bridge; positive-genus vertex; marked leaf | Stable vertices distinguished from subdivision points | — |
| 3.1 Metric graphs with loops and vertex genus (packages/TropicalAndBerkovichArithmetic/README.md:1260), `TauCeti.Berkovich.TB3.metric_graphs` | Loop; parallel edges; zero-length candidate | Positive lengths and half-edges retained | — |
| 3.2 Divisors and rank on metric graphs (packages/TropicalAndBerkovichArithmetic/README.md:1286), `TauCeti.Berkovich.TB3.graph_divisors` | Degree −1; point graph; interior chip on circle | Rank −1 and all-point divisors correct | — |
| 3.3 Graph Laplacians and potentials (packages/TropicalAndBerkovichArithmetic/README.md:1313), `TauCeti.Berkovich.TB3.graph_laplacian` | F(s)=s; constant; oscillatory endpoint derivative | Signs correct; finite-measure domain needs regularity | R14 |
| 3.4 Metric Jacobian and Abel–Jacobi map (packages/TropicalAndBerkovichArithmetic/README.md:1341), `TauCeti.Berkovich.TB3.graph_jacobian` | Tree; circle length L; bridge | Jacobian ranks 0,1; bridge contracted | — |
| 3.5 Riemann–Roch for metric graphs (packages/TropicalAndBerkovichArithmetic/README.md:1369), `TauCeti.Berkovich.TB3.graph_riemann_roch` | Tree degree d; circle positive degree; K degree 2g−2 | RR identities consistent | — |
| 3.6 Specialization of algebraic divisors (packages/TropicalAndBerkovichArithmetic/README.md:1385), `TauCeti.Berkovich.TB3.divisor_specialization` | Effective point; degree zero; principal divisor | Principal compatibility creates dependency cycle | R12 |
| 3.7 Slope formula for rational functions (packages/TropicalAndBerkovichArithmetic/README.md:1410), `TauCeti.Berkovich.TB3.slope_formula` | T on annulus; inverse; constant | Δ(−log abs f)=specialized divisor; no sign reversal | — |
| 3.8 Metrized complexes and their divisors (packages/TropicalAndBerkovichArithmetic/README.md:1424), `TauCeti.Berkovich.TB3.metrized_complexes` | One curve no edges; self-loop; nonconstant graph function | Component marked slopes and canonical degree correct | — |
| 3.9 Finite rank-determining sets (packages/TropicalAndBerkovichArithmetic/README.md:1450), `TauCeti.Berkovich.TB3.metrized_complex_rank_determining` | Genus-zero component; loop subdivided; nongeneric points | g_v+1 distinct points suffice; reduced uniqueness only by class | — |
| 3.10 Riemann–Roch and rank determination on complexes (packages/TropicalAndBerkovichArithmetic/README.md:1464), `TauCeti.Berkovich.TB3.metrized_complex_riemann_roch` | Single residue curve; all components P¹; zero divisor | Graph and algebraic RR limits agree | — |
| 3.11 Specialization inequality (packages/TropicalAndBerkovichArithmetic/README.md:1480), `TauCeti.Berkovich.TB3.specialization_rank_inequality` | Good-reduction positive genus; principal f; residue-point lifts | r_X≤r_C≤r_Γ and log abs f sign correct | — |
| 4.1 Torus tropicalization (packages/TropicalAndBerkovichArithmetic/README.md:1506), `TauCeti.Berkovich.TB4.torus_tropicalization` | Trivial valuation; exponent n=0,−2,p; point χ=a | All real tropical points and map direction correct | R02 |
| 4.2 Initial degenerations over valued fields (packages/TropicalAndBerkovichArithmetic/README.md:1531), `TauCeti.Berkovich.TB4.initial_degenerations` | Squared equation; non-value-group w; empty fiber | Nilpotents and noncanonical translation retained | R27, R28 |
| 4.3 Fundamental theorem and polyhedrality (packages/TropicalAndBerkovichArithmetic/README.md:1559), `TauCeti.Berkovich.TB4.fundamental_polyhedral_theorem` | Empty X; pure dimension zero; trivial valuation | Support ignores nilpotents; purity hypothesis needed and present | — |
| 4.4 Tropical weights and balancing (packages/TropicalAndBerkovichArithmetic/README.md:1573), `TauCeti.Berkovich.TB4.weighted_tropical_cycles` | Doubled hypersurface; primitive three-ray fan; inseparable cycle | Generic lengths and primitive normals retained | R02 |
| 4.5 Relative point and edge multiplicities (packages/TropicalAndBerkovichArithmetic/README.md:1601), `TauCeti.Berkovich.TB4.relative_tropical_multiplicity` | n=−2,p; contracted edge; inseparable reduced closed point | Field-degree-only extension loses geometric length | R25 |
| 4.6 Tropical multiplicity formula for curves (packages/TropicalAndBerkovichArithmetic/README.md:1628), `TauCeti.Berkovich.Curve.tropical_multiplicity_formula` | Two branches degrees 2,3; contracted branch | Multiplicities add to 5; extension depends on corrected 4.5 | R25 |
| 4.7 Expansion factors from coordinate slopes (packages/TropicalAndBerkovichArithmetic/README.md:1640), `TauCeti.Berkovich.Curve.expansion_factor_gcd` | Slopes (−2,4); all zeros; primitive vector | gcd factors 2,0,1 correct | — |
| 4.8 Sturmfels–Tevelev pushforward (packages/TropicalAndBerkovichArithmetic/README.md:1652), `TauCeti.Berkovich.TB4.cycle_pushforward` | z↦z²; inseparable p-power; contracted cell | Target/image lattice index and δ factor correct | R02, R25 |
| 5.1 Multiplicity-one isometry criterion (packages/TropicalAndBerkovichArithmetic/README.md:1680), `TauCeti.Berkovich.Curve.multiplicity_one_isometry` | Isolated irrational double branch; isolated Gauss lift | Canonical section needs multiplicity one at isolated weights | R13 |
| 5.2 Faithful tropicalization on a graph (packages/TropicalAndBerkovichArithmetic/README.md:1694), `TauCeti.Berkovich.TB5.faithful_embedding_predicate` | Primitive slopes but self-crossing; interval; point | Injectivity separate from unit expansion | R02 |
| 5.3 Functions separating edges and vertices (packages/TropicalAndBerkovichArithmetic/README.md:1719), `TauCeti.Berkovich.TB5.unit_slope_separating_functions` | Single edge; separated vertices; coprime pole orders | Local unit slopes need global function lifting | R02 |
| 5.4 Faithful tropicalization of a finite subgraph (packages/TropicalAndBerkovichArithmetic/README.md:1735), `TauCeti.Berkovich.Curve.faithful_tropicalization_and_expansion_factors` | Empty finite graph; finite loop; fixed toric embedding | Faithful domination requires actual toric supplier | R02 |
| 5.5 Faithfulness under domination (packages/TropicalAndBerkovichArithmetic/README.md:1747), `TauCeti.Berkovich.Curve.faithful_domination` | Extra coordinates; contracted coordinate; identity domination | Unit gcd and injectivity preserved | R02 |
| 5.6 Faithful tropicalization of marked rays (packages/TropicalAndBerkovichArithmetic/README.md:1759), `TauCeti.Berkovich.TB5.puncture_ray_faithfulness` | Pole orders m,m+1; puncture infinity; no punctures | Coprimality gives unit ray slope | R02 |
| 6.1 Formal and model metrics (packages/TropicalAndBerkovichArithmetic/README.md:1783), `TauCeti.Berkovich.TB6.formal_model_metrics` | Trivial line; tensor power e; rescaled norm | Model metric root denominator correct; supplier drift | R03, R08 |
| 6.2 Chambert–Loir model measures (packages/TropicalAndBerkovichArithmetic/README.md:1811), `TauCeti.Berkovich.TB6.model_measures` | Multiplicity two; L² degree six; trivial degree zero | Atomic weights correct; rank-one intersections unowned | R03 |
| 6.3 Semipositive and integrable metrics (packages/TropicalAndBerkovichArithmetic/README.md:1839), `TauCeti.Berkovich.TB6.semipositive_integrable_metrics` | Negative component degree; constant rescaling; signed difference | Nefness and positivity distinguished | R12 |
| 6.4 Limits and local intersection heights (packages/TropicalAndBerkovichArithmetic/README.md:1864), `TauCeti.Berkovich.TB6.measure_limits_and_local_heights` | Constant metric change; signed oscillation; uncountable base | Height sign correct; general extension remains unnamed | R26 |
| 6.5 Hsia kernels and positive energy (packages/TropicalAndBerkovichArithmetic/README.md:1878), `TauCeti.Berkovich.TB6.hsia_potentials_and_energy` | Two nonclassical atoms; opposite signed measure; classical atom | Self-energy positive, cross-energy negative; earlier owner exists | R01, R26 |
| 6.6 Admissible Green functions and measures (packages/TropicalAndBerkovichArithmetic/README.md:1909), `TauCeti.Berkovich.TB6.graph_green_and_admissible_measure` | Genus-zero; bridge; loop; Cantor probability | Admissible formula correct; arbitrary μ lacks Laplacian carrier | R20 |
| 6.7 Model potentials and Laplacian approximation (packages/TropicalAndBerkovichArithmetic/README.md:1938), `TauCeti.Berkovich.TB6.model_pl_approximation` | Affine F; oscillation n⁻¹sin(n²t); endpoint slopes | DVR approximation has needed variation control | — |
| 6.8 Metric–Laplacian and admissible corrections (packages/TropicalAndBerkovichArithmetic/README.md:1952), `TauCeti.Berkovich.TB6.model_metric_laplacian` | Two-term interval; polarized loop; irrational-ratio lengths | Curvature sign right; scale and generality mismatches | R21, R22 |
| 7.1 Tate analytic quotient and skeletal circle (packages/TropicalAndBerkovichArithmetic/README.md:1978), `TauCeti.Berkovich.TB7.tate_analytic_quotient` | q=0,abs q=1 excluded; Tate q; isometric extension | Circle length −log abs q and dz/z correct; unit negative control ambiguous | R31 |
| 7.2 Good-reduction and Tate calibration (packages/TropicalAndBerkovichArithmetic/README.md:2004), `TauCeti.Berkovich.TB6.good_reduction_and_tate_measures` | Good reduction; Tate genus one; degree d | Dirac versus uniform length measure correctly distinguished | — |
| 7.3 Schottky groups and fundamental domains (packages/TropicalAndBerkovichArithmetic/README.md:2018), `TauCeti.Berkovich.TB7.schottky_data` | Rank zero; cyclic group; nonloxodromic element | Empty limit set and Schottky conditions distinguished | — |
| 7.4 Schottky–Mumford uniformization (packages/TropicalAndBerkovichArithmetic/README.md:2046), `TauCeti.Berkovich.TB7.mumford_uniformization` | P¹; Tate curve; potentially split but nonsplit curve | Split converse explicit; rank-zero hull exception correct | — |
| 7.5 Analytic Jacobian periods (packages/TropicalAndBerkovichArithmetic/README.md:2060), `TauCeti.Berkovich.TB7.analytic_jacobian_periods` | Good reduction rank zero; Tate q; nondiscrete valuation | Length pairing correct; analytic cross extension undeclared | R19 |
| 7.6 Berkovich–Coleman path integration (packages/TropicalAndBerkovichArithmetic/README.md:2076), `TauCeti.Berkovich.TB7.berkovich_coleman_path_integral` | Constant/reversed path; exact dF; dT/T; p=2,3 | Branch, homotopy and local primitive requirements retained | — |
| 7.7 Annular integration and residue monodromy (packages/TropicalAndBerkovichArithmetic/README.md:2106), `TauCeti.Berkovich.TB7.annular_residues_and_periods` | p·dt/t; coordinate inversion; two ends of loop | Analytic residues, not reduced residues; earlier owner exists | R18 |
| 7.8 BC–abelian tropical correction (packages/TropicalAndBerkovichArithmetic/README.md:2126), `TauCeti.Berkovich.TB7.bc_abelian_tropical_correction` | N=0; Tate lift multiplied by q; d=0,2 | Correction sign correct; logarithm owner and star scope need repair | R11, R18, R19 |

## Not verifiable

- **Berkovich's 1990 monograph:** no readable legal text was obtained for Theorem 1.2.1, Corollary 1.2.4, Theorem 1.3.1, Corollary 1.3.2, Proposition 1.3.5 and Corollary 1.3.6. The source service's bibliographic/DOI attempts failed; the final AMS retry timed out. These exact locators remain uncertified even where Scholze or Poineau–Turchetti supports the mathematics. One consolidated missing-text record was saved for the worker; the previous request record was preserved.
- **Settled paywalled texts:** Fresnel–Matignon (DOI 10.1007/BF01790541), Huber 1996 (DOI 10.1007/978-3-663-09991-8) and Huber 1994 (DOI 10.1007/bf02571959) have source-service status `uncertified`. Their exact primary-source locators were not inspected or re-requested. BPR and Zavyalov corroborate the stated uses in their ranges.
- **Poineau–Turchetti edition:** the retrieved legal text is arXiv:2010.09043v1, dated 20 October 2020 (`poineau-turchetti` line 7). The README names an author-copy version dated 18 October 2020. Relevant numbering was checked in the fetched version; identity of the unavailable author copy was not established. R06 requires recording/citing the version actually used.
- **Coleman Proposition 4.3:** the proposition and proof occur at `coleman` line 655, but its displayed formula is absent from the extraction. The residue-sum claim is corroborated by `de-shalit` line 117 and the current ColemanIntegrationPartII contract; the original display itself was not certified.
- **Unavailable supplier snapshots:** the supplied main/Completed tree has no readable current README for NeronModelsAndSemistableAbelianVarieties, EffectiveDiophantineMethods or the base ColemanIntegration roadmap. Their exact old R11.3/ED.4/L0/L1 names and hypotheses were not certified. R19 relies on the package's explicit narrower-scope admission and absent registered gap, not a guessed supplier statement. R18 relies on the supplied current ColemanIntegrationPartII head.
- **Lean elaboration:** no Lean command or build was run, as required. Instance retention and four proof bodies were audited statically against the pinned declarations; there is no claimed compiler result or generated `#check` output.
- **Exhaustiveness limits:** citations to entire proof sections do not certify every unlisted prerequisite in those sources. No assertion of soundness is made for an unnamed extension beyond the checked supplier/source range; the concrete missing contracts found are listed above.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4eab8bcb03d80245a0a11f132ab654c6c2055fc9", "job": "RT-TropicalAndBerkovichArithmetic~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
