<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/37#issuecomment-6304047624 -->
Review (codex) of eb84d22

Verdict: needs_changes

1. **F01** (P1) The imported natural integral has no producing section

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:7`, `:47`, `:75`; `packages/ColemanIntegrationPartII/design/plan.json:2031`. The import is labelled “§7.7 (requested, text unavailable)”.

   **Claim:** ColemanIntegration already owns the all-prime, arbitrary-reduction natural integral, so this extension need only import it. That is not its actual boundary. Absence from the local checkout was mistaken for unavailability of the supplier; its open head is readable and adds a new roadmap folder.

   **Witness:** `TauCetiRoadmap/ColemanIntegration/README.md:16` and `:1092`, at `acaaf506f3822fc5c8211345cb48f6b1cb00656c`, own good-reduction Coleman integration. Its layers are L0–L3; there is no §7.7 or natural arbitrary-reduction integration target.

   **Exact repair:** Rewrite the introduction and contracts against that actual base. Import its good-reduction theory by L0/L1 section and declaration. Make the natural single-integration theorem, its construction prerequisites, universal affine values and scalar-extension comparison named targets of this Part II before their first use. Retain the all-prime and arbitrary-reduction scope justified by Colmez. Delete the nonexistent §7.7 and §§7.10–7.11 bindings and update every `gap:base-single` dependency in both design files. Do not add these targets retroactively to the existing base.

2. **F02** (P1) Essential comparisons and reciprocity remain unowned

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:72`, `:81`, `:83`, `:85`, `:87`, `:89`; `packages/ColemanIntegrationPartII/design/plan.json:2059`. The text says “neither is used as a roadmap prerequisite”.

   **Claim:** Describing an unbound interface supplies a usable build boundary. In fact, the curve comparison, Tate differential comparison, Coleman-form relations and index reciprocity are necessary proof inputs. The assertion at line 72 conflicts with the actual `*Needs:*` lines. In addition, the base-reciprocity contract asks an earlier roadmap to prove theorems about indices this extension claims to define, producing a backwards ownership requirement. Its analytic-exact and rational-core conclusions already contain major conclusions of §3.1.

   **Witness:** `packages/ColemanIntegrationPartII/design/README.md:242` consumes `gap:curve-comparison`; `:578` consumes `gap:coleman-form-relations`; `:715` consumes `gap:tate-differential`. The corresponding plan entries either name supplier `none` or provide no existing section.

   **Exact repair:** Resolve the contracts individually, as detailed in the supplier table below. Import the actual base annulus/Coleman outputs, retaining their coefficient and strict-neighbourhood hypotheses. Import the abelian logarithm from AnabelianGeometryAndNonabelianChabauty §5.8, rather than assigning it to ColemanIntegration. Give every additional comparison, relation and reciprocity result an explicit producing target before its consumers. For the local-index reciprocity and §3.1 properties, place the proof after the local index in this extension; do not make the earlier base depend on Part II's indices. For curve and Tate comparisons, cite an existing allowed producer only after reading its exact export; otherwise own the additional comparison targets here. Replace every unresolved `gap:` premise and remove the process narrative about a future binding. A proposed extension with no section or merge position is not a supplier.

3. **F03** (P2) The analytic logarithmic algebra is planned twice

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:168`, `:172`, `:174`, `:422`; corresponding plan targets 2.1 and 5.1. The definition starts “On an open annulus … use its analytic Laurent functions”.

   **Claim:** The analytic polynomial-logarithm carrier, its change of parameter, primitive existence and constant kernel are new constructions of this extension. They already have a base owner. Merely listing an unresolved annulus contract does not remove these duplicate constructions.

   **Witness:** `TauCetiRoadmap/ColemanIntegration/README.md:577`–`:640`, at `acaaf506f3822fc5c8211345cb48f6b1cb00656c`, specifies `AnnulusLogRing`, `AnnulusLogRing.changeParam`, `exists_logLaurent_primitive` and `logLaurent_derivative_eq_zero_iff` in L0.20–L0.22.

   **Exact repair:** Import L0.A1–L0.A2, L0.11–L0.12 and L0.20–L0.23 with their actual names and hypotheses. Keep the formal characteristic-zero Laurent-series extension and the new degree-one subspace/index data, stating precisely how these differ. In §5.1 use the supplied analytic primitive theorem to construct compatible labelled entries; retain only the additional formal argument and the new choice-data API. If the general analytic coefficient scope exceeds the base export, register that extension separately rather than reconstructing the already-owned special case.

4. **F04** (P2) The graph audit misses existing cohomology and its opposite sign

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:41`, `:99`, `:103`, `:124`; plan targets 1.1–1.2. The Tau Ceti contract lists only the restricted-series foundation.

   **Claim:** Native graph incidence and the simple-graph Laplacian exhaust the relevant pinned graph floor. Tau Ceti already provides simple-graph cochains, coboundaries, first cohomology, coefficient maps and relabelling. The proposed generalization has no comparison to those objects, and its differential has the opposite convention.

   **Witness:** At Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`, `:79`, `:99` define `SimpleGraph.oneCochains`, `SimpleGraph.coboundary`, `SimpleGraph.FirstCohomology`. Coboundary evaluates as target divided by source.

   **Exact repair:** Add these exact imports, together with `oneCochainsMap_coboundary` in `Cohomology/Map.lean:97` and `oneCochainsRelabel_coboundary` in `Cohomology/Relabel.lean:123`. Keep the rational-length multigraph extension, but add a named simple-graph comparison through `Multiplicative k`, including the module/cohomology comparison. Under the identity on cochain values, the proposed differential is the negative of the additive translation of the pinned coboundary. Test the single edge with values 2 and 5: this roadmap gives −3, while the pinned convention gives +3. Import existing simple-graph quotient and functoriality results through that bridge rather than developing a disconnected second API.

5. **F05** (P2) Component restriction omits the smooth-residue-domain qualification

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:81`, `:358`; `packages/ColemanIntegrationPartII/design/plan.json:2067`. The contract requires “restriction of a natural single primitive on a component to a Coleman primitive”.

   **Claim:** This holds on the entire component wide open before harmonic identification. As written it includes the connecting annuli, where it is false. The main statement in §4.2 correctly restricts to smooth residue domains, but its supplier premise does not.

   **Witness:** For `q=p³`, `log(p)=1`, the Tate primitive is `F(z)=log(z)−ν_p(z)`. On one connecting annulus its difference from `log(z)+C` varies with valuation. See besser-zerbes2017 line 95 and line 108.

   **Exact repair:** Remove whole-component restriction from the base contract. Prove the comparison on smooth residue domains in §4.2 from natural integration, reciprocity and the Jacobian argument; do not assume the comparison as an upstream premise. State annular values only through §4.3's valuation term. Add a negative control using points of valuations 1/3 and 2/3: the differences from the same Coleman primitive are −1/3 and −2/3. Update the corresponding proof sketch and gap description.

6. **F06** (P2) The supply order cannot certify this roadmap

   **Location:** `packages/ColemanIntegrationPartII/design/plan.json:2` and its supplier list; `packages/ColemanIntegrationPartII/design/README.md:33`.

   **Claim:** The design can be checked as a consumer after its suppliers. There is no entry for this roadmap in the supplied merge order, and the prescribed package-level input does not exist. Absence of an UPWARD/CYCLE diagnostic in that situation is not a successful dependency check.

   **Witness:** Against the design README the checker reports: `NOT IN ORDER: ColemanIntegrationPartII (insert it after its last supplier)` and `depcheck: 3 roadmaps, 7 edges, 1 problem(s)`.

   **Exact repair:** Have the merge-order owner register this extension after every resolved supplier, including any newly bound comparison supplier. The review/fix worker must not edit `merge-order/ORDER.txt`. Use the design README for the design-stage check; after package generation, rerun the prescribed package-README check. Require a successful check and manually inspect unresolved/unnamed edges, which the present tool run does not certify. The substantive outputs of both runs are recorded below.

7. **F07** (P3) The ArithmeticDynamics consumer section is wrong

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:733`; `packages/ColemanIntegrationPartII/design/plan.json:2012`. The citation is “§§3.58 and 3.60”.

   **Claim:** Both sections consume ED.4 Chabauty–Coleman point results at the open head.

   **Witness:** At `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, `TauCetiRoadmap/ArithmeticDynamics/README.md:4899` is the five-cycle theorem; `:4927` is the Möbius-product polynomial theorem. The latter does not consume ED.4.

   **Exact repair:** Cite ArithmeticDynamics §3.58, “No rational 5-cycles”, and, if the other applications are intended, §3.72, “No rational 6-cycles, conditionally”, or §3.80, “Points of type (3, 2)”. Preserve their rank hypotheses. Use section titles/target names alongside numbers because the board package and open head have different numbering. Keep these as consumer descriptions, not supplier edges.

8. **F08** (P3) The graph-definition page range starts one page too late

   **Location:** `packages/ColemanIntegrationPartII/design/README.md:99`, `:741`; plan target 1.1's locator. The claim cites “Definitions 4.1–4.3, p. 12”.

   **Claim:** All three definitions occur on printed page 12 of the cited version.

   **Witness:** besser2017 line 528 begins Definition 4.1 before the page-12 marker at line 533. Definitions 4.2–4.3 and Theorem 4.4 follow on page 12.

   **Exact repair:** Cite Definitions 4.1–4.3, printed pp. 11–12, retaining line 528; keep Theorem 4.4 on p. 12. Update the README reference description and plan locator consistently. No source-manifest entry was rewritten by this reviewer.

Independent review by `independent-review-REV-DESIGN-ColemanIntegrationPartII`, 2026-10-20. Eight findings, six blocking. There was no previous review to reconcile. The extension is repairable: its index and harmonic-realization programme is substantive, but its claimed base boundary is incorrect and several indispensable outputs have no producer. This is not a recommendation to rewrite the base roadmap.

## Verified sound

Read all three designated inputs. The plan has **31 targets, 84 named API entries, 11 definition targets and 99 Checks**. All 31 have hypotheses, a locator, prerequisites, API, Checks and a proof sketch. Every definition has at least three Checks. All named API entries appear in the README. Its seven layers each end with Examples and Dependencies. The supplied main checkout is `0e8b058a97cc4f9401d2679313e0e937761c1024`; StableReduction, RigidAnalyticGeometry and JacobianChallenge were read for shape and contracts, and EllipticCurves for the Tate boundary.

The all-prime scope is explicit; the final arbitrary-reduction statement is not replaced by a good-reduction-only result. Formal coefficients have characteristic zero, geometric coefficients are finite p-adic fields, and rational graph lengths are positive. Thus zero rings, characteristic-p formal coefficients and inseparable finite p-adic extensions are excluded by actual hypotheses. Small residue characteristics 2 and 3 remain included. No executable algorithm, copied source passage or suspicious embedded instruction was found in the reviewed design. The general formal index theory and the 30 other target sections are not a wholesale re-plan of the base; R03 identifies a localized overlap that can be removed.

### Source sample and locator checks

All five recorded mathematical texts were readable from their supplied extractions. The theorem/section numbers were checked in the stated versions, using printed page numbers rather than PDF page indices. No additional mathematical source was fetched, and `sources.toml` was left unchanged.

| Sample or source block | Text examined | Result |
| --- | --- | --- |
| Seed: imported headline `gap:base-single` | colmez1998 line 2957, line 2982–2997, line 229–258, line 3950–3955 | Definition II.1.3 and Theorem II.1.4, printed p. 74, support natural single integration and affine `K + K Log(p)` values. Exact/logarithmic evaluation, Chasles, algebraic pullback, local analyticity and uniqueness are present. Remark 2 supports good-reduction comparison and Galois descent. R01 concerns the roadmap owner, not the truth of this source theorem. |
| Seed: PadicHodgeRegulators | README line 733; plan consumer entry; searches of main, Completed, packages and open roadmap titles | It is only an intended consumer with no section. No readable consumer roadmap was located; its asserted ownership cannot be verified. It is not consumed by any target. |
| Vologodsky comparison | vologodsky2001 line 51, line 187–195, line 1800–1809 | Theorem B(4), p. 5, gives finite-extension compatibility; Proposition 52, p. 42, identifies single integrals with Colmez. The standing `p>2` assumption is correctly retained for this comparison, not used to exclude p=2 from the Colmez headline. |
| Local double and graph theory | besser2017 line 402–430, line 492–558 | Double-index residue order, orientation reversal, global constant cancellation and harmonic/exact decomposition agree. The page defect is R08. |
| Corrected pairing and harmonic realization | besser2017 line 586–689, line 700–808; besser-zerbes2017 line 74–124, line 130–244 | The correction is `c Res η − d Res ω`; the proper cup order is correct. The proof direction avoids the source's incidental references to later comparison results. Restriction on annuli needs R05. |
| Triple data, choice laws and simple poles | besser-dejeu2012 line 2232–2365, line 2413–2473 | Proposition 7.3, Lemma 7.4 and Proposition 7.8 support the stated labelled data, negative constant-change signs and simple-pole formula. No false local choice-independence is claimed. |
| Global triple and one-form pairing | besser-dejeu2012 line 2524–2617, line 2769–2789 | Lemmas 8.1–8.3, Proposition 8.4 and Proposition 9.2 support the degree law, global cancellation, constant-slot laws, reciprocal-eigenvalue argument and descent to actual forms. The relation theorem remains an unowned prerequisite under R02. |
| Branch, trace and descent consequences | colmez1998 line 3145–3159, line 3213–3214, line 3950–3986; besser-dejeu2012 line 250–252; besser-zerbes2017 line 95–113, line 142–150, line 245–278 | Branch normalization and proper abelian logarithms agree. Trace/divisor consequences are identified as derivations, not falsely numbered source theorems. The source's n≥3 Tate presentation is explicitly extended by graph refinement, not silently applied to n=1,2. |

All author-flagged unavailable section bindings were investigated. They are reconciled in the supplier audit below; none was treated as a verified import just because its mathematical statement has a source.

### Adversarial mathematics pass

Each row covers the named target and every API entry attached to it in `plan.json`; shortened API suffixes identify those entries. “Sound conditional” means the equation or mathematical argument survived the indicated tests, while its supplier prerequisites still require the cited repairs. It does not claim a formal proof or a completed library construction.

| Statement and API | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 1.1 `LengthCochains`; mk, ext, div_d_adjoint, map, simple_laplacian | Empty graph; isolated vertices; one edge with values 2,5; loop; length 1/2 | `d f=−3`; loop divergence 0; pairing of 2,3 is 12; divergence of 2 is ±4. Adjoint identity has no missing factor 2. | R04: compare the pinned cochain quotient and opposite differential. |
| 1.2 decomposition; harmonicProjection, changePotential, rationalLaplacian_rank | Triangle `(3,0,0)`; disconnected graph; tree; coefficients ℚ₂, ℚ₃ and 𝔽₃ | Harmonic part `(1,1,1)`; exact part `(2,−1,−1)`. In 𝔽₃, vertex values `(0,2,1)` give an exact nonzero harmonic cycle. Positive rational minors remain nonzero in every characteristic-zero field. | Keep CharZero and componentwise constant ambiguity; R04 bridge. |
| 1.3 subdivision; comp, residue | Jump 6 split in proportions 1/3,2/3; m=1; attached tree; zero length | Jumps 2,4 have the same current; weighted pairing and jump-residue sum are preserved. Zero length/m=0 are excluded. | None to equations. |
| 2.1 logarithmic functions; mk, ext, residue_zero_iff, changeParameter | Constants; L; L²; formal `u=az(1+h)`; characteristic p | `Res d(f+aL)=a`; `d(L²)` is not an ordinary Laurent differential. Primitive division has nonzero integer denominators. Open-annulus convergence uses an interior radius margin. | R03: import analytic construction and keep the formal extension. |
| 2.2 doubleIndex; ext, add_left, reverse, add_constants | `(1,L)`, `(L,1)`, `(z,z⁻¹)`, `(L,L)`; two constant shifts | Values 1,−1,−1,0; shift is `A Res dG−B Res dF`. Antisymmetry follows from residue of an exact Laurent differential. | None to formula; resolve residue ownership. |
| 2.3 pullback; scalarExtension, shrink | Identity; `z=t²`; reversed `z=t⁻¹`; degree-zero map | Degree factor 2 and reversal sign −1 agree; positive-order formal substitution excludes a constant map. Full scalar trace is linear coefficient extraction. | None to formula. |
| 3.1 doublePairing; eq_sum, constant_independent, restrict | Rational core; zero form; positive-genus cup value 1; additional regular disc | Residue cancellation kills global constants; rational core gives zero; positive genus distinguishes the zero pairing. No proper H¹ class is represented by a holomorphic form by fiat. | R02: own the missing reciprocity/cohomology proofs. |
| 3.2 HarmonicPrimitiveData; mk, ext_mod_constant, linear, jump_change, jump_class | Bridge jump 2; triangle cycle; one component; self-node refinement | Adding the solving potential changes `c` to `c−d a`. A cyclic jump cannot be removed. Loop cases require actual refined Coleman domains and comparison, not `F_v−F_v`. | R02: bind geometric component/refinement interfaces explicitly. |
| 3.3 auxiliary formula; edgeReverse, changeConstants | `(c,d,rη,rω)=(2,3,5,7)`; reversal; one component shift | Correction −11, preserved on reversal. Both point and edge sums change together under component constants. | None to equation. |
| 3.4 correctedDoublePairing; eq_aux, cup, refinement, ext | ℙ¹; Z empty; second-kind representatives with cup 1; rational tail | Ordered cup and graph signs agree. Harmonic representatives annihilate exact graph changes. Čech representatives are correctly retained for proper cohomology. | R02: supply χ, N and all comparison maps. |
| 3.5 phi_N; phi_iterate | `φ=diag(1,q)`, `N(e₂)=e₁`; N=0; identity φ at q≥2 | Scaling q and cancellation `1−1=0` hold. Identity φ fails scaling on a nonzero symplectic pairing; construction-linked operator hypotheses exclude it. | R02: actual operator producer. |
| 4.1 dlog_residue_is_exact; orthogonal_harmonic | Node `xy=π`, f=x; constant f; f=0 | Orders 0,1 give residue 1 and `−d(ord)`. The zero function is excluded. Weighted orthogonality uses the scaled exact cochain. | None to sign. |
| 4.2 harmonicPrimitive_eq_singleIntegral; divisor_eq, goodReduction | Tree; cycle; exact/log forms; compact Jacobian versus arbitrary noncompact group | The divisor argument uses local constancy and compactness: finite image in the torsion-free additive field is zero. It cannot use mere equality of derivatives on a disconnected point set. | R01/R02/R05: supply natural integration and reciprocity without assuming whole-component comparison. |
| 4.3 singleIntegral_on_annulus; reverse, baseChange | Tail value 2, jump 6, t=1/3; quadratic ramification; c=0 | Both orientations give 4; refinement jumps 3,3. The normalized valuation changes by the ramification factor. | None to equation; add R05 negative control. |
| 4.4 globalDoublePairing_eq_pointSum; exact, constants | Z empty; exact form; second-kind cup 1; global primitive shifts | Empty sum is consistent with the isotropic holomorphic subspace. Global residues cancel constant shifts. General proper H¹ uses §3.4. | R01/R02 prerequisites. |
| 5.1 TripleIndexData; mk, ext, changeConstant, pullback, linearCombination | All L with half-squares; zero functions; pair `(1,0)` versus `(1,−1)` | Half-square derivatives are valid over ℚ₂. Opposite shifts preserve integration by parts; equal function values do not identify distinct labels. | R03: reuse analytic integration. |
| 5.2 tripleIndex; unique, symm, threeTerm, meromorphic | `(1,1;L)`, `(z,z;z⁻²)`, `(z,z⁻¹;L)`; all L with half-squares | Values 1,−2,1,0; three equal summands imply zero even over ℚ₃. Reduction requires the indicated Laurent slot. | None to characterization. |
| 5.3 changeConstant; changeBoth | `(L,0;L)` with pair constants 0 or 1; residues 0 or 1 | Values 0 or −1; shift by 2 gives −2; the F,G pair is unused. A bare zero function does not erase auxiliary data. | None. |
| 5.4 simplePoles; zeroConstantPrimitives | `(2+L,3;L)`; all L; `u=az` | Formula gives 6; all half-squares give 0. Constant coefficient changes by `−δ`, while transported index remains invariant. Higher poles are excluded. | None. |
| 5.5 pullback; comp | Degree 1,2; orientation reversal; shifting one pulled-back auxiliary entry | Index scales by degree; changing a primitive after pullback adds the residue correction. Transport of functions alone is insufficient. | None. |
| 6.1 global triple; eq_endSum, globalChoices, congr | Zero functions; rational core; `T(F,1;H)` with double value 1 | Global value is 1 in the last case; it cannot factor through `[dG]`. Independence requires the next proof, not a field in the data. | R02: bind actual global Coleman algebra and coefficient scope. |
| 6.2 laws; add_const_second, const_third, restrict | Add 2 to G; common auxiliary shift; residues +1,−1 with a shift at only one end | Changes are 2,0,−1 respectively. Third-slot constants vanish; arbitrary local shifts do not cancel. Shrinking retains extension hypotheses. | R02: global residue/reciprocity ownership. |
| 6.3 Frobenius vanishing; iterate | q=2; zero eigenclasses; G=1 and F outside the q-eigenspace | Reciprocal eigenvalue is 1/2, not 2. The counterexample with double value 1 is excluded by the actual q-eigenclass condition. | R02: spectrum and radical producer. |
| 6.4 colemanFormPairing; unique, relation, restrict | `1 dH`; `G dC`; two presentations of `d(GH)` | Values B and 0 agree. Generator trilinearity alone does not kill form relations; the proof explicitly needs the relation theorem. | R02: give that theorem an owner before this target. |
| 7.1 branchTransport; comp, exact | λ′=λ; u=p; ramified uniformizer of index 2; exact form | Changes 0,2,1 for branch increment 2 in the indicated cases; exact forms have zero universal coefficient. Constant-shift formula is not applied to varying valuation functions. | R01 natural theorem; R03 import existing logarithm branch law. |
| 7.2 properHolomorphic; universalCoefficient_zero | ℙ¹; elliptic curve; nonproper G_m; endpoints over finite extensions | Proper holomorphic integral is the abelian logarithm; G_m gives λ and excludes dropping properness. Temporary basepoints cancel. | R02: import §5.8 abelianLog and own the arbitrary-reduction natural comparison. |
| 7.3 coefficientTrace; tower, galois, galois_average | L=K; K-defined form; ramified quadratic at p=2; α²=π | K-defined scalar traces to n times itself; `Tr α=0`, `Tr α²=2π`. Division by the Galois group order is valid in characteristic zero. | R01; trace carrier and tower requirements are correct. |
| 7.4 divisorSingleIntegral; split, ext, add, baseChange | `[t²−π]−2[0]`, ω=t dt; zero divisor; a degree-two point minus one rational point | Integral π; zero divisor 0. The last divisor has degree 1 and basepoint dependence. Multiplicities use residue degrees. | R01; no formula change. |
| 7.5 tracedLocalIndexSum; split, tower, congr, bilinear, tracedEndIndexSum | Quadratic point; rational point; empty Z; full scalar versus product of traces | Local scalar 1 traces to 2, infinity contributes −2; tower traces agree. The product-of-traces substitute fails. Triple auxiliary independence is not asserted. | R01/R02; no trace normalization change. |
| 7.6 realization descent; commonExtension, divisor, wideOpenIndex_galoisDescent | Good reduction; ramified splitting; common refinement; quadratic constant field | Comparison through a common field and intrinsic integral is sound conditional. Quadratic constant-field scalar 1 traces to 2. No arbitrary whole-curve triple pairing is inferred. | R01/R02; explicitly supply every comparison used. |
| 7.7 Tate normalization; q_periodic, branch | q=p³ and log(p)=1; n=1,2; q=1; p=2 | Jump −1; `F(qz)−F(z)=0`; branch terms cancel using `v_p=ν_π/e`. q=1 is excluded by n>0. | R02 Tate differential/chart producer; R05 domain control. |

The conventions were checked separately against these two-term witnesses: tail-minus-head differential −3; jump change `c−d a`; node order difference +1; cup correction −11 and its swapped value +11; annulus value 4 in both orientations; triple auxiliary change −1; ramified branch increment `2/e`; quadratic trace factor 2. Denominators are positive lengths, positive subdivision counts, nonzero integers in characteristic zero, positive Tate valuation n, or a nonzero finite Galois-group order. No denominator-zero instance is admitted by their stated hypotheses. Conventions involving χ, monodromy and geometric cup products remain conditional on R02's missing comparison output.

### Duplication audit by object

GitHub code search located candidate declarations; their files were then read at the manifest pins. Both pinned recursive trees were inspected: 10,680 Mathlib entries and 13,144 Tau Ceti entries, neither truncated. This is an object/path audit plus reading of relevant modules, not a claim to have read every library source line.

| Object | Pinned or roadmap producer checked | Audit result |
| --- | --- | --- |
| p-adic coefficient field | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:531`, `:798`, `:1024` | `Padic`, normed-field and completeness foundations correctly cited with prime hypothesis. |
| Graph incidence and Laplacian | `Mathlib/Combinatorics/Graph/Basic.lean:90`, `:260`, `:356`, `:499`; `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:80`, `:125` | Existing carrier and unit-weight simple-graph operator are correctly imported. Weighted multigraph harmonic theory is a real extension. |
| Graph cochains and H¹ | `TauCeti/Combinatorics/SimpleGraph/Cohomology/{Basic,Map,Relabel}.lean` | Omitted owner and sign bridge: R04. The coefficient group can be `Multiplicative k`; multiplicative notation does not make this an unrelated object. |
| Formal Laurent differentiation | `Mathlib/RingTheory/LaurentSeries.lean:132`, `:176`, `:184` | Hasse coefficient formula, linear derivative and coefficient-map compatibility exist at the pin. No replacement Laurent carrier is needed. |
| Scalar trace | `Mathlib/RingTheory/Trace/Defs.lean:70`, `:110`, `:137`; `Mathlib/RingTheory/Trace/Basic.lean:249` | Free/finite tower conditions, scalar degree factor, separability and algebraically closed embedding target match the design. |
| Restricted-series norm | `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:88`, `:151` | Exact namespace is `MvPowerSeries`; positive polyradii and complete coefficients are correctly described. |
| Analytic logarithmic carrier and primitives | ColemanIntegration L0.11–L0.23 at the head recorded in R01 | Existing planned work must be imported: R03. |
| Coleman functions and integration | ColemanIntegration L1.2, L1.17–L1.19, L1.43 | Exact producer exists, but it does not supply the claimed natural arbitrary-reduction theory. Its algebraic coefficient extension into the full ℂ_p Coleman algebra is not asserted to be an equality. |
| Abelian logarithm | AnabelianGeometryAndNonabelianChabauty §5.8, at `59d989dd138cd28b4a4643ab233c04ad6d62aa34` | `abelianLog` is already planned for arbitrary reduction. Its `colemanAbelian.integral` comparison carries good reduction. Import the former; keep the additional natural arbitrary-reduction comparison here. |
| Curves, models and Jacobians | StableReduction Layers 0–2, 4–5, 7, 9; JacobianChallenge Layers D–F; EllipticCurves Layer 4 | No need to recreate algebraic models, Jacobians or point-level Tate uniformization. The missing analytic comparisons are genuine additional interfaces. |
| Index constructions | Main/Completed/package object searches; both library trees; base head | No existing local double/triple index or weighted multigraph harmonic producer was located. Coleman spectral transforms in CompactOperators and Coleman norm/measure terminology are different objects. |
| Open consumer heads | ArithmeticDynamics `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`; ErdosProgressionPowers `e101259371172a32b3dd13e926676ae33b6af5cd` | Neither supplies the index theory. The latter imports curve rational-point finiteness. ArithmeticDynamics section drift is R07. |

### Supplier-order and missing-interface audit

All **31 `*Needs:*` lines**, all five named roadmap supplier contracts, all eight gap contracts and all four plan consumer entries were read. All **59 explicit `target:` edges** in the plan point to earlier targets. This does not cure implicit prerequisites or the backwards index ownership in R02.

| Contract | Verified producer or precise missing output | Required disposition |
| --- | --- | --- |
| `base-single` | No such export in the actual ColemanIntegration head | New natural-integration targets here, R01. |
| `base-annuli` | ColemanIntegration L0.A1–L0.A2, L0.11–L0.12, L0.15–L0.23 supply carriers, residue, branches, logarithmic primitives and part of parameter transport | Bind those exact sections. Register any additional degree, trace and closed-point germ comparison not exported there as a target, rather than demanding a new base section. |
| `base-coleman` | ColemanIntegration L1.2, L1.17, L1.17a, L1.18, L1.19, L1.43 | Bind actual function/form algebra, constant kernel, integration and pullback. Explicitly handle the difference between dagger/algebraically extended coefficients and arbitrary full ℂ_p analytic data; do not assert a missing equality of carriers. |
| `base-reciprocity` | No double-index reciprocity export in the base; Part II owns B and B_U | Move the required index reciprocity/compact-cup results here after B is defined. Remove whole-component natural restriction, R05. This breaks the proposed base → Part II → base ownership loop. |
| `curve-comparison` | Supplier `none`; required χ, graph exact sequence, metric N, ordered cup, refinement maps and Frobenius spectrum | Bind real earlier exports individually; own each remaining comparison before Layer 3/§6.3. A placeholder comparison package is insufficient. |
| `coleman-form-relations` | Base L1.17 supplies actual Coleman forms, but the Lemma 9.1 symbol/relation theorem is not located there | Import the carrier and own the additional relation theorem before §6.4, unless an actual earlier named export is identified. |
| `base-jacobian` | AnabelianGeometryAndNonabelianChabauty §5.8, `abelianLog.add`, `.derivative`, `.unique`, `.baseChange`; its curve comparison is only good reduction | Repoint existing abelian-logarithm ownership. Add the natural integration comparison and needed divisor/topology bridge here, using JacobianChallenge's algebraic inputs. |
| `tate-differential` | EllipticCurves Layer 4 explicitly exports point-level uniformization only | Own the pullback-of-invariant-differential and annular-chart comparison before §7.7, or bind an actual allowed earlier target; do not schedule an unnamed future extension as a premise. |

RigidAnalyticGeometry §§1.3, 2.3, 6.2 and 8.1 exist and have the stated field-extension/reduction/space/analytification scope. Quasi-separatedness is explicitly retained. StableReduction's Layer 7 covers genera 0, 1 and ≥2; Layer 9's section-separation construction precedes its stable-range theorem. Its Layers 0–1 and 4–5 provide the cited extension, branch and model-resolution framework. JacobianChallenge uses pointed Abel–Jacobi; the design correctly obtains a temporary point after finite extension. EllipticCurves' parameter is a unit of the field, not necessarily a valuation-ring unit.

ColemanIntegration occupies line 101 of `merge-order/ORDER.txt`. The proposed abelian-logarithm producer is also in the user-authorized earlier supplier list. No later roadmap was added as a supplier. Moving new index reciprocity and the genuinely missing comparisons into this Part II is the requested ownership correction; it does not move existing upstream targets or re-plan those roadmaps.

The prescribed package-path dependency invocation failed with exit status 1. Its final diagnostic, with file paths rendered repository-relative and interpreter traceback frames omitted, was:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/ColemanIntegrationPartII/README.md'
```

The same checker with `packages/ColemanIntegrationPartII/design/README.md` as its input returned exit status 1 and this complete substantive output:

```text
NOT IN ORDER: ColemanIntegrationPartII (insert it after its last supplier)
depcheck: 3 roadmaps, 7 edges, 1 problem(s)
```

Neither run emitted an UPWARD or CYCLE line. Neither is a successful order certification. The checker saw only three roadmap texts and cannot certify missing gap owners. No tooling or merge-order file was edited.

## Not verifiable

- **Lean elaboration: not available.** No `Suggested.lean` exists in this design package, and the brief supplies no executable Lean elaboration command. No Lean command was run. Consequently imports, elaborated binders, proved Check mirrors and the “sorry only” warning criterion cannot be certified. There is no Lean file here in which to detect sorry'd data or `set_option`; the absence of such a file is not a successful build. The later package must state easy graph/local-algebra headlines on the pinned carriers while leaving genuinely unavailable geometric carriers in the README.
- **PadicHodgeRegulators, the seeded consumer:** no section or declaration is supplied; the local main/Completed/package search and remote main-path lookup did not produce its roadmap. The latter returned 404. Its construction of regulators and symbol relations therefore remains an unverified consumer description. EllipticRegulators likewise has no available consuming section. Neither absence is used to invent a supplier.
- **The eight unverified contracts:** their status is recorded individually above. The ColemanIntegration text itself is now readable, so “text unavailable” is not an acceptable explanation for continuing to leave its section bindings unresolved. The complete curve comparison, extra relation theorem and Tate differential bridge have not been proved or located in an exact producer by this design.
- **Whole-library nonduplication:** pinned tree searches, targeted code searches and the relevant files were checked; no assertion is made that every differently named declaration in the two libraries was exhausted. R04 is a positive duplication/interface witness, not an inference from absence of search hits.
- **Mathematical source access:** no cited mathematical text required for this review was inaccessible. No missing-reference table was needed. Additional primary sources may be necessary when the fix worker turns the unowned comparison and reciprocity contracts into actual theorem targets; their proofs are not certified by the current placeholders.

Only this report and `packages/ColemanIntegrationPartII/design/review.json` are review deliverables. The design README, plan and source manifest were not edited.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "eb84d22c2785f7d16ab7b4dcb089c648655bbd8b", "job": "REV-DESIGN-ColemanIntegrationPartII", "model": "gpt-6-astra", "worker": "chris-1"} -->
