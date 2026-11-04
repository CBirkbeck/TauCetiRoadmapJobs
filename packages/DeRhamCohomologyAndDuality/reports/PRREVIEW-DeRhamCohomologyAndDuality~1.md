# Review of DeRhamCohomologyAndDuality (pull request #1768 at 101fd8f)

**Verdict:** rejected

🤖 Independent AI review. Nine findings: four P1, three P2, two P3. The rejection is for re-planning existing roadmaps, not for unavailable books. No pull-request file was changed.

## R01 (P1) — The proposed ownership duplicates DifferentialGeometry on main

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:25`, especially lines 27–42 and 585–590. Claim: this roadmap owns the de Rham complex, comparison, duality, degree and hairy ball theorem.

**Witness:** `TauCetiRoadmap/DifferentialGeometry/README.md:782` on main already assigns these objects to layers 6–11; lines 852–909 contain the de Rham, duality, degree and hairy-ball milestones. `TauCetiRoadmap/AlgebraicTopology/README.md:79` explicitly recognizes that ownership.

The open DifferentialGeometry revision removes these targets, but a revision of an existing roadmap cannot supply this proposed ownership transfer under this review's contract. The present PR makes no accompanying change outside its folder. Renaming the namespace does not remove the duplicate mathematical ownership.

**Exact repair:** replace this proposal with a **DifferentialGeometry Part II** extension that imports DifferentialGeometry §§6–11 by section and contains only genuinely additional results, identifying precisely where the base stops. Do not reassign the existing end theorems. Recheck the concrete witness: de Rham comparison must have one owner, DifferentialGeometry §8.5; hairy ball must have one owner, §11. The changed scope requires a new design, rather than acceptance of this folder as submitted.

## R02 (P1) — Sharp Sard is already owned by HeegaardFloer

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:464` and `:608`; `TauCetiRoadmap/DeRhamCohomologyAndDuality/Suggested.lean:135`. Claim: DR.5.2 owns sharp finite-dimensional Sard and supplies it to HeegaardFloer.

**Witness:** `TauCetiRoadmap/HeegaardFloer/README.md:1185` (main), §2.1/F0.S, states the same open-set Haar-null theorem and chart transfer. Its `Suggested.lean:69`, `sharp_sard`, has the same dimensions, regularity threshold and critical-value set.

**Exact repair:** delete the duplicate sharp theorem and target here, cite HeegaardFloer §2.1/F0.S as supplier, and correct the consumer paragraph. Keep any genuinely new application separately. On the witness constant map ℝ³→ℝ at k=3, the supplier already proves measure({0})=0 under 2<3; no second target is needed. Do not import another roadmap's Lean module.

## R03 (P1) — The supplied build gate fails on the module-system warning

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/Suggested.lean:1`.

**Claim:** the acceptance file must pass the gate with only `sorry` warnings.

**Witness:** the worker records `build=1 FAIL`; `lake build TauCetiRoadmap.DeRhamCohomologyAndDuality.Suggested` reproduces the warning that importing Mathlib requires opting into the module system. Lake exits successfully, but the review's warning gate does not pass.

**Exact repair:** add `module` before the imports and use the module system's public/exposed declarations as needed for the exported interfaces. A scratch copy with the `module` prefix elaborated successfully, with exactly the twelve `sorry` warnings and no additional warning. Rerun the targeted gate after applying the repair. P1 follows the brief's classification of a failing build gate; this is not a claim that Lean rejected the theorem types.

## R04 (P1) — The sphere cohomology Check is false at n=0

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:237`. Quote: “ℝ in degrees `0` and `n`, zero otherwise.”

**Claim:** that formula describes Hᵏ_dR(Sⁿ), without a positive-dimension hypothesis.

**Witness:** S⁰ consists of two points. Every function is closed and no degree-zero form is exact, so H⁰_dR(S⁰)=ℝ², dimension 2, whereas the stated answer has dimension 1.

**Exact repair:** state the displayed answer for n≥1 and separately compute H⁰_dR(S⁰)=ℝ² and Hᵏ_dR(S⁰)=0 for k>0. Equivalently give the all-degree dimension formula δ(k,0)+δ(k,n). At (n,k)=(0,0), this gives 2; at (1,0),(1,1),(1,2), it gives 1,1,0. Keep these as README Checks.

## R05 (P2) — The degree action is not always an endomorphism of ℝ

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:516`, especially line 520. Quote: “its identification with the action of `f^*` on `H^n_dR ≅ ℝ`.”

**Claim:** compact oriented M and connected oriented N suffice for this identification; M need not be connected and N need not be compact.

**Witness:** for constant f:S¹→ℝ, H¹_dR(ℝ)=0, not ℝ. For f:S¹⊔S¹→S¹ equal to the identity on each component, f* sends a↦(a,a), while deg(f)=2.

**Exact repair:** keep the general degree theorem, but state its cohomological characterization by the integration functionals, using compactly supported top forms on N and ordinary top forms on compact M. State the one-dimensional scalar description separately when both manifolds are connected and compact. On S¹⊔S¹→S¹ the integration functional sums (a,a) to 2a; on S¹→ℝ the degree and the pullback integral are both zero. Do not impose connectedness on M merely to avoid the general case.

## R06 (P2) — Complementary degrees need a bound or integer grading

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:393` and `:399`, against the natural-number grading at line 71.

**Claim:** Hᵏ_dR(M) is dual to Hⁿ⁻ᵏ_c(M), without specifying k≤n or a negative-degree convention for compactly supported cohomology.

**Witness:** take M=S¹, n=1, k=2. With the declared ℕ grading, 1−2=0: the left space is 0, but the proposed right space is (H⁰_c(S¹))*=ℝ.

**Exact repair:** state the pairing and duality for k,l∈ℕ with k+l=dim M; state vanishing above the dimension separately. Alternatively extend both complexes to ℤ and explicitly set negative-degree cohomology to zero. The integer formulation gives H²(S¹)=0=(H⁻¹_c(S¹))*; the natural formulation excludes (k,l)=(2,0), since 2+0≠1.

## R07 (P2) — State the hypotheses of the manifold Poincaré theorem

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:188`. Quote: “every point `x` has an open neighbourhood `U` and a smooth form `ψ` … with `dψ = φ|_U`.”

**Claim:** the prose gives the manifold primitive conclusion without quantifying φ, imposing closedness, or requiring positive form degree. These conditions are present in the flat Lean theorem, but that does not supply the separate manifold statement's hypotheses.

**Witness:** φ=x dy on ℝ² has dφ=dx∧dy≠0 and cannot locally equal dψ. The closed degree-zero form 1 on a point also has no primitive in the natural-number de Rham complex.

**Exact repair:** quantify a smooth, closed, F-valued (k+1)-form, with k∈ℕ and F complete, before asserting the local primitive on U. Keep degree zero as the locally-constant-function theorem. The corrected statement excludes both counterexamples and includes dx=d(x), including within a half-line chart. Add the two failures as discriminating Checks; no change to the flat theorem's correct closedness binder is needed.

## R08 (P3) — Definitions lack their required Checks and layer structure

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:170`, representative definitions at `:204`, `:278`, `:453` and `:473`.

**Claim:** every definition must have a usable API and at least three discriminating Checks, and every layer must end with Examples and Dependencies.

**Witness:** DR.5.1 defines two predicates but has no Check list. DR.1.3's local-potentials predicate also has none. None of the six layers ends in the required Examples and Dependencies subsections; no target has a `*Needs:*` line.

**Exact repair:** use the prescribed prose subsections and supplier contracts; retain the useful API descriptions, add three numerical or negative-control Checks per definition, and assign each result its actual dependencies. For regular values use x² at −1 (true, empty fibre), 0 (false, derivative 0), and 1 (true, derivatives ±2). For local potentials use dx (true), x dy (false), and angular form on the punctured plane (locally true, nonzero period). These separate the intended predicates from the always-true predicate and from a global-exactness predicate. Do not put the Checks in Suggested.lean. Also name the unstated DR.4.4 fundamental-class integration headline explicitly in the module docstring (`Suggested.lean:13`), as required by the acceptance-file form.

## R09 (P3) — Exact source locators are missing for substantial targets

**Location:** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:278` (DR.3.4), `:357` (DR.3.8), `:404` (DR.4.4) and `:471` (DR.5.3).

**Claim:** the new constructions and theorems have verifiable locators, including the generality actually planned.

**Witness:** DR.3.4's arbitrary-convex-model inward-flow construction has no attached source locator. DR.3.8's cone comparison and DR.4.4's fundamental-class integration theorem likewise have none. The layer-level Lee chapter citation supplies neither a theorem nor a page for these extensions.

**Exact repair:** attach precise theorem/section and printed-page locators for each new target and each imported proof input. Where this is an extension of a source, identify its extra hypotheses and separate the new argument from the cited theorem. Name the supplier of the smooth proper exhaustion used in DR.3.4, or make its existence a target. A locator to a half-space theorem cannot alone certify the claimed arbitrary convex model. The half-line flow and relative interval sign computations below are regression tests, not substitutes for these citations. Unavailable text itself is not a finding: the four paywalled books are recorded below as uncertified.

## Verified sound

This section records successful checks and the limits of those checks; it does not override the findings. Read the root README's standing checklist and CONTRIBUTING, and inspected the complete main versions of the relevant DifferentialGeometry, AlgebraicTopology and MorseTheory portions as shape and ownership references. The worktree head is `101fd8ffb6fd27d40f98db3dc50af786397badc6`; main is `929496d4221b974c60787257a3cdc28b600fc49c`. The diff outside the reviewed folder is empty, and the worktree stayed clean.

**Coverage and principles.** Read all 659 README lines and all 233 Lean lines: 27 numbered target blocks, 18 Lean declarations (6 definitions, 12 theorems). No `set_option`, admitted data, admitted examples, free opaque condition, algorithmic deliverable, route-specific good-case shortcut, or duplicate fully qualified Lean name was found in this folder. The namespaces differ from DifferentialGeometry; the mathematical duplication remains R01. The Picard-iteration paragraph describes a proof of an ODE existence theorem, not a computational algorithm. The major ownership failures are R01–R02. No borrowed source passage was detected in the material that could be compared; inaccessible books prevent certifying originality against their text.

**Gate and dependency output.** All supplied scanner counters were zero except build. The exact supplied summary, with no machine paths, is:

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=1 FAIL
```

Ran the requested dependency command against the candidate merge order and main:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There was no UPWARD, CYCLE, or moved line. There are no declared gaps. Read every supplier-table row and the Ordering paragraph; there are no `*Needs:*` lines to inspect. The mechanism does not detect that two roadmaps claim the same theorem. DR.3.8's absolute-to-relative comparison is explicitly sequenced after DR.3.9, and DR.4.5 after the interior formula; those local dependencies do not form a circular proof. AlgebraicTopology's degree comparison is downstream of its independent class construction, so consuming Stage 6.3 does not require its Stage 6.5 degree comparison.

**Lean checks and headlines.** Direct `lake env lean` on the original file exited 0 with exactly 12 `sorry` warnings. The targeted Lake build exited 0 but reproduced R03's additional warning. Independently appended `#check @...` for all 18 declarations on a scratch copy and elaborated it once. All signatures agree with the worker's dump. `incidenceEquation` drops the section's normed-space structures because its body is just F(x,p)−j(y); no analytic hypothesis is needed for this ordinary function. Completeness is retained explicitly in the flat Poincaré theorem, and the sphere dimension Fact is retained in all three hairy-ball statements. The planar local-potential theorem does not assume completeness, although the paragraph at README line 201 does: continuation uses finite potential differences, so this stronger signature does not inherit the incomplete-space obstruction to constructing local primitives from closedness. Clarify that distinction in the prose; completeness remains relevant to Bochner-integral comparisons. No signature was edited.

Each of the 12 sorried theorems was tried with the single tactic `simp` on a scratch copy. All 12 failed to close. Definition and pinned-library inspection did not identify a one-library-lemma proof of a kept general signature. In particular, the existing Sard theorem has threshold m²+1, whereas the proposed sharp statement has threshold max(m−n,0)+1; its exact duplicate is a roadmap target (R02), not a proved pinned-library theorem. The avoidance result still needs an incidence derivative rank argument. No P3 padding finding is asserted merely because a theorem is an intermediate result.

The five explicitly named headline theorems are:

| Headline | Acceptance-file treatment at the pins |
| --- | --- |
| DR.3.9 de Rham comparison | Not stated; module docstring identifies missing manifold forms/exterior derivative and de Rham carrier. It separately states the reusable induction principle. |
| DR.4.3 Poincaré duality | Not stated; missing de Rham/compact-support carriers and geometric integration pairing are identified in the docstring. |
| DR.4.4 fundamental-class integration comparison | Covered by the docstring's collective reference to orientations/integration-dependent targets, but not individually named there. Explicitly name it in the rewritten docstring. |
| DR.5.4 integral degree formula | Not stated; geometric integration and mapping degree are identified as unavailable carriers. Finite regular fibres is a separate substantive target. |
| DR.6.1 hairy ball | Stated on the native unit sphere, with continuity, tangency, even n and finrank E=n+1; section and parity formulations also present. |

No absent theorem among these five was found expressible using only a few simple definitions at these pins. The generic manifold differential-form, integration and cohomology constructions are substantial work, not acceptable scratch encodings. The native pointwise, path-potential, Sard and transversality signatures do not replace those missing cohomology theorems with arbitrary Prop fields.

**Pinned objects opened.** Checked actual package commits: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Paths in the following table are relative to the named library's repository. These are representative declarations actually opened, rather than name-only search hits.

| Library, file and line | Declaration / contract verified |
| --- | --- |
| Mathlib `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:164` | `ModelWithCorners` has real convex range, nonempty interior and continuous forward/inverse maps; it does not impose Hausdorffness or σ-compactness on a charted manifold. |
| Mathlib `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:396` | `ModelWithCorners.isClosed_range`; the continuous inverse gives closed embedding. DR.3.4's closed-range assertion is valid at this pin. |
| Mathlib `Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean:72` and `:87` | `extDeriv`, `extDerivWithin` are actual alternating derivatives on native continuous alternating maps. |
| Mathlib `Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean:221` and `:239` | `extDerivWithin_extDerivWithin_eqOn`, `extDerivWithin_pullback` require unique differentiability and closure-of-interior conditions, not arbitrary subsets. Model ranges have the relevant closure-of-interior property. |
| Mathlib `Mathlib/Geometry/Manifold/SmoothApprox.lean:81` and `:123` | `Continuous.exists_contMDiff_approx_and_eqOn`, `Continuous.exists_contDiff_approx_and_eqOn`: finite-dimensional source, Hausdorff σ-compact manifold, closed fixed set, smoothness on a neighbourhood and strictly positive continuous tolerance. |
| Mathlib `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:526` | `exists_contMDiffMap_one_nhds_of_subset_interior`: closed s, s⊆interior(t), Hausdorff/normal/σ-compact hypotheses; conclusion is one near s, zero outside t and values in [0,1]. |
| Mathlib `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:592` | `exists_contMDiffSection_forall_mem_convex_of_local`: genuinely local smooth sections taking values in fibrewise convex sets are required. Naming a nonempty cone alone would not suffice. |
| Mathlib `Mathlib/Analysis/Calculus/BumpFunction/FiniteDimension.lean:79` | `IsOpen.exists_contDiff_support_eq` gives function support equal to the specified open set, not compact topological support. |
| Mathlib `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40` and `:76` | `SimplyConnectedSpace`, `paths_homotopic`; the native class implies nonemptiness and path connectedness. The empty planar domain is a separate trivial case, not an instance of this class. |
| Mathlib `Mathlib/CategoryTheory/Abelian/Ext.lean:56` | `ChainComplex.linearYonedaObj` is the cochain complex of linear morphisms into an object; available for smooth-chain dualization. |
| Mathlib `Mathlib/Algebra/Homology/HomotopyCategory/MappingCocone.lean:33` | `CochainComplex.mappingCocone` is the mapping cone shifted by −1; its projections/inclusions carry signs. The proposed relative differential squares to zero and the sign change to shifted-cone coordinates is algebraically consistent. |
| Tau Ceti `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:61` and `:94` | `TopCat.singularCochainComplex`, `TopCat.singularCohomology`; existing native cochains/homology, with induced maps at line 100. |
| Tau Ceti `TauCeti/AlgebraicTopology/Cohomology/Relative.lean:66` | `TopPair.singularCochainComplex`, dual of relative singular chains. |
| Tau Ceti `TauCeti/AlgebraicTopology/Singular/Subdivision/Homotopy.lean:239` | `TauCeti.singularSubdivisionHomotopy` goes from identity to subdivision. |
| Tau Ceti `TauCeti/AlgebraicTopology/Singular/Subdivision/Small/Equiv.lean:422` | `TauCeti.smallSingularChainHomotopyEquiv` has small-chain inclusion as hom and the supplied retraction as inv; the induced isomorphism is natural although that chosen inverse need not be. |
| Tau Ceti `TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:345` | `TauCeti.addHaar_image_criticalPoints_eq_zero`: pointwise smoothness on U and bound (finrank E)²+1; no relation between source and target dimensions required. |
| Tau Ceti `TauCeti/Analysis/Calculus/Sard/LowDimension.lean:98` | `TauCeti.not_surjective_fderiv_of_finrank_lt_finrank`: strict dimension inequality forbids surjectivity even for junk derivatives. |
| Tau Ceti `TauCeti/Analysis/Fredholm/LevelSet/GlobalParametric.lean:63` and `:83` | `TauCeti.IsRegularParameter` uses only the source direction, and `isMeagre_setOf_not_isRegularParameter` separately assumes total surjectivity and Fredholm/regularity hypotheses. Residual is not itself a Haar-null conclusion. |
| Tau Ceti `TauCeti/Geometry/Manifold/LocalDiffeomorph.lean:283` | `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` explicitly needs an interior source point and a continuous linear equivalence, not merely surjectivity in unequal dimensions. |
| Tau Ceti `TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean:458` | `IsLocallyCollared.isCollared`: compact collar domain, Hausdorff ambient space, injective locally collared map. Applies to the compact boundary case used here. |
| Tau Ceti `TauCeti/AlgebraicTopology/UniversalCover/Circle/FundamentalGroup.lean:293` and `:388` | `Circle.fundamentalGroupMulEquiv` and its positive exponential-loop normalization. |
| Tau Ceti `TauCeti/Analysis/Contour/Primitive.lean:180` | `TauCeti.Contour.isExactOn_of_forall_closed_integral_eq_zero` concerns complex primitives and piecewise-C¹ contour integrals. It does not already give arbitrary real-linear covector fields or integrals along continuous paths. |

Searched both pins by objects (forms, exterior derivative, cochains, local primitives, regular fibres, Sard, parameter derivatives, mapping cocones and sphere fields), not just the proposed theorem names. No completed native manifold de Rham or hairy-ball theorem was found. The flat and cochain substrate exists as claimed; no import of a root TauCeti module or another roadmap is used.

**Resolved roadmap boundaries.** Used `roadmaps grep` and `roadmaps show`, supplemented by reading the supplied checkout files and main. Also searched the available board package READMEs/design READMEs by these objects and checked the supplied board index. Unrelated arithmetic “de Rham” hits are not ownership of smooth real de Rham theory. Main owns the base results, so no missing-owner claim relies on an exhaustive negative search of remote packages.

| Citation | Resolution and conclusion |
| --- | --- |
| DifferentialGeometry §§0.1, 0.3–0.4, 1.1–1.4 | Main's forms, wedge, pullback and manifold exterior-calculus targets exist. Its conventions at lines 38–44 give chart-sign orientation and shuffle-normalized wedge. |
| DifferentialGeometry §§2.1–2.2, 2.4 | Main's orientation and orientation-cover targets, including descent, exist; §2.4 starts at line 362. |
| DifferentialGeometry §3.3 | Main line 388 supplies completeness/homogeneity; boundaryless hypotheses matter. |
| DifferentialGeometry §§5.1–5.4 | Main lines 507–527 supply boundary orientation, chart integration, Stokes and the cochain homotopy formula. |
| DifferentialGeometry open revision | Its README expressly delegates the new folder's scope, e.g. lines 17 and 262. This is a revision of existing work, so it cannot displace main as the supplier/owner used in R01. |
| AlgebraicTopology Stages 2–3, Stage 6.1 | Main supplies singular chains, small-chain/excision/Mayer–Vietoris, cochains and evaluation; smooth-chain integration remains DifferentialGeometry's ownership. |
| AlgebraicTopology §6.3 | Main lines 1316–1344 name the chosen local section, `RelativeTwistedClassDatum`, support-class factory, support enlargement and signed zero-dimensional normalization. Those cited contracts exist. |
| AlgebraicTopology §6.5 | Main ownership paragraph lines 86–89 points to DG10 for the smooth degree comparison, not DR.5; that attempted reassignment is included in R01. |
| UniversalCovers | `Completed/UniversalCovers/README.md:139`, Stage 4 item 12, supplies π₁(S¹); also implemented at the pin. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177`, Layer 1, supplies boundary/collars; the specific compact Brown theorem is also native. |
| ComplexKahlerGeometry K5a/K6 | Main and the supplied revision retain complex-coefficient comparison and punctured-plane normalization on DifferentialGeometry's carrier; the supplied revision's lines 1379 onward compute smooth closed forms. The assertion here about a continuous-planar extension should not silently replace that smooth contract. It is a downstream boundary, not an input to this proof. |
| HeegaardFloer F0 | Main §2.1 already owns sharp finite-dimensional Sard, not just its Fredholm extension: R02. |
| DG and A∞ | `TauCetiRoadmap/DGAInfinity/README.md`, Scope boundary and ground-ring conventions: uncurved integer-graded DG/A∞ packaging. No second generic DGA construction is proposed here. |
| Lie-group/root-system applications | Described as downstream applications, with their own codimension/jet hypotheses. They are not used as suppliers. |

**Source sample.** The brief reports that its heading-based seed found no targets and supplies no list of fifteen identifiers. I did not invent a claim to have checked that missing list. I read all 27 numbered targets and generated a reproducible supplemental sample of 15 using the full head string as seed. The sample is DR.1.2, 1.4, 3.1, 3.2, 3.4, 3.6, 3.8, 4.2, 4.3, 4.5, 5.3, 5.4, 5.5, 6.1, 6.2. Every one has computed rows below. Additionally catalogued and attempted verification of all explicit theorem-number citations, including DR.5.2's readable primary source; no locator is explicitly labelled unverified in the README.

| Sample / additional cited target | Locator and certification result |
| --- | --- |
| DR.1.2 | Lee 17.14; text unavailable, no theorem/page/hypothesis certification. Flat Banach/within generality is not certified by naming a finite-dimensional textbook theorem. |
| DR.1.4 | Lee 17.27–17.28; unavailable. |
| DR.3.1 | AlgebraicTopology Stage 6; roadmap contract resolved, not a textbook citation. |
| DR.3.2 | Lee 18.4, 18.6 unavailable; actual subdivision and small-chain declarations opened at the pin. |
| DR.3.4 | No precise locator for the arbitrary-convex-model theorem: R09. |
| DR.3.6 | Native approximation declarations verified; the ambient filling/collar construction has no exact external locator. |
| DR.3.8 | Mapping-cocone definition verified at the pin; geometric relative comparison has no exact external locator. |
| DR.4.2 | Lee 17.34; unavailable. |
| DR.4.3 | Bott–Tu §5 and Lee Problems 18-6–18-8; unavailable. |
| DR.4.5 | No precise locator for its formula; independently recomputed the stated interval sign. |
| DR.5.3 | Native residual theorem verified; Haar-null refinement requires its separate incidence/Sard proof, not the residual theorem alone. No exact external locator is attached. |
| DR.5.4 | Lee 17.35; unavailable. Generality defect independently witnessed in R05. |
| DR.5.5 | Lee Ch.17 only; no theorem/page for the full calculus. Degree examples recomputed below. |
| DR.6.1–6.2 | Lee Problem 16-6; unavailable. Sphere-field and degree examples recomputed below. |
| DR.1.3, 2.1–2.2, 3.3, 3.7, 3.9 | Lee 17.17, 17.42, 17.21, 18.7, 18.12, 18.13, 18.14; all unavailable. They were attempted through the same book request, not treated as verified by familiarity. |
| DR.5.2 | `azagra` line 94: Theorem 1.1, pp.2–3, n≥m≥1, k=n−m+1, local Taylor-growth condition; lines 103–112 explicitly use outer measure and allow an open source. `azagra` line 133: Corollary 1.3, p.3, implies the classical Cᵏ case. The proof's §4 appears at line 752, pp.17–18. Supports the positive-dimensional n≥m claim; zero target and lower-dimensional source require separate arguments, as the README says. Hirsch/Federer unavailable. |

The primary source read was [Azagra–Ferrera–Gómez-Gil, arXiv:1511.05822v5](https://arxiv.org/pdf/1511.05822v5), dated 21 January 2018, 27 pages. References above use that version's printed numbering. No published-edition numbering comparison was asserted.

**Adversarial computations.** The table is grouped by target but separates the essential constructions, identities, conventions and signatures. “Pass on instances” is not a proof of the full theorem. Changes are recommendations only. Angular form means (−y dx+x dy)/(x²+y²) with positive counterclockwise orientation. Top-support classes use the outward-first convention.

| Statement | Instances tried | Values computed on each side / wrong model | Result; change |
| --- | --- | --- | --- |
| Conventions: normalized wedge | dx,dy on ℝ² | (dx∧dy)(e₁,e₂)=1; (dy∧dx)(e₁,e₂)=−1; unnormalized full alternation divided incorrectly by 2 would give 1/2. | Pass on instances; include this inherited normalization Check. |
| Conventions: natural cochain grading | point, degrees 0,1; relative degree 0 | Ω⁰=ℝ, Ω¹=0, d=0; after ℤ-extension Ω⁻¹=0, so the relative degree-zero term has no W summand. | Pass; complementary-degree bound is separately R06. |
| Conventions: completeness and coefficients | F=0; a real constant covector on ℝ | For F=0, φ=η=dη=0. For φ=dx, η=x and dη=dx. Both satisfy the actual CompleteSpace binder. | Pass; do not drop completeness in radial integration. |
| DR.1.1: closed and exact forms | point and ℝ, degrees 0,1 | On a point ker d=ℝ, exact⁰=0, quotient=ℝ; on ℝ, dx=d(x), so [dx]=0. Constant 1 is closed but not exact in degree zero. | Pass; rejects exact⁰=ker d. |
| DR.1.1: d² and class-map kernel | f(x,y)=xy; α=x dy | df=y dx+x dy; d(df)=−dx∧dy+dx∧dy=0. dα=dx∧dy≠0. Kernel of closed-form class map contains dx, excludes a nonzero S¹ angular class. | Pass; matches pinned derivative convention. |
| DR.1.1: pullback identity/composition | f(x)=2x, g(x)=3x, ω=dx | id*ω=dx; f*(g*ω)=6dx=(g∘f)*ω. | Pass; contravariant composition direction retained. |
| DR.1.1: wedge on cohomology | T² with coordinate classes a,b | a∧b evaluates to 1 on the positively oriented unit torus; b∧a evaluates to −1; a∧a=0. | Pass; module action on compact supports uses compactness of support, not compactness of M. |
| DR.1.2: H⁰ and locally constant functions | point, two points, connected interval | H⁰ dimensions are 1,2,1 respectively; locally constant function spaces are ℝ,ℝ²,ℝ. | Pass; also refutes the S⁰ Check in R04. |
| DR.1.2: flat primitive signature | s=∅; half-line with φ=dx; ℝ² with φ=dx∧dy | Empty EqOn conditions are true, η=0 works; on the half-line η=x has within derivative dx; on ℝ² η=x dy has dη=dx∧dy. | Pass on instances; UniqueDiffOn and positive degree are explicit. |
| DR.1.2: closedness cannot be omitted | φ=x dy on every disc about (0,0) | If dψ=φ then 0=d²ψ=dφ=dx∧dy, which evaluates to 1 at (e₁,e₂). | Fail for unqualified prose; R07. |
| DR.1.2: degree zero cannot have primitive | point, φ=1 | Closed value is 1; image from Ω⁻¹=0 is {0}; 1≠0. | Fail for unqualified prose; R07. |
| DR.1.3: cohomological homotopy invariance | ℝ contracted by H(x,t)=(1−t)x | In degree 0, both endpoint pullbacks take constant a to a; in positive degree both act on the zero cohomology space. | Pass on instances; interval order agrees with supplier. |
| DR.1.3: smooth loop exactness criterion | dx on ℝ; angular form on S¹ | Closed-loop integrals of dx are b−a=0; angular period is 2π≠0, hence its class is not exact. | Pass; both directions distinguished. |
| DR.1.3: HasLocalPotentials definition | dx, x dy, and angular form on punctured plane | Potentials are x for dx; x dy has exterior derivative evaluating to 1 so fails; angular form has a local branch of angle and hence satisfies the predicate, despite global period 2π. | Pass; local potential is not global exactness. |
| DR.1.3: potential uniqueness/subdivision | ω=dx, paths 0→1→3; potentials x and x+7 | Increments are 1+2=3=(3−0); using x+7 gives (8−7)+(10−8)=3. | Pass; rejects dependence on arbitrary additive constants. |
| DR.1.3: reversal and homotopy of continuous paths | ω=dx; any continuous paths from 0 to 3 | Forward integral=3, reversal=−3; endpoint-fixed homotopy keeps 3. A constant path has integral 0. | Pass; no path differentiability needed in the potential construction. |
| DR.1.3: curveIntegral agreement and naturality | γ(t)=t² on [0,1]; pullback by h(z)=2z | Endpoint increment is 1; ∫₀¹2t dt=1. Pullback of dx is 2dx, giving 2 times the original period/increment. | Pass on instances. |
| DR.1.3: simply-connected exactness signature | Ω=ℂ, φ=d Re; Ω=∅; Ω=ℂ∖{0} | g=Re gives derivative φ; on ∅, g=0 meets the conclusion separately; angular form on punctured plane has period 2π and does not meet SimplyConnectedSpace. | Pass; componentwise application still needs zero periods, not merely connected components. |
| DR.1.4: compact-support functoriality | ℝ→point and open inclusion (−1,1)→ℝ | Pullback of 1 is constant 1 with support ℝ, not compact; a bump supported in [−1/2,1/2] extends smoothly by zero with the same support. | Pass; properness/open-inclusion direction matters. |
| DR.1.4: Euclidean compact-support cohomology | ℝ⁰, ℝ, ℝ² | Nonzero Hᵏ_c occurs in k=0,1,2 respectively and is ℝ there; for n>0, H⁰_c(ℝⁿ)=0. Normalized top bump integrates to 1. | Pass on instances. |
| DR.2.1: restriction difference | U=V=M; pair of constants (2,5) | First arrow sends 3↦(3,3); second sends (2,5)↦−3; composite on 3 is 0. Kernel of subtraction is the diagonal; subtraction is onto. | Pass; replacing subtraction by addition gives 6 on the diagonal and fails. |
| DR.2.1: connecting map | two arcs of S¹, intersection with two components | H⁰(U)⊕H⁰(V)→H⁰(U∩V) has image the diagonal in ℝ²; cokernel dimension=1=dim H¹(S¹). | Pass on dimensions; actual connecting normalization needs a README Check. |
| DR.2.2: compact-support exact sequence | U=V=M, compactly supported η | Use η↦(η,−η) followed by addition; composite=0, while two unsigned extension arrows give 2η. | Requires explicit signed arrows in rewrite; current phrase “arrows given by extension by zero” does not pin the sign. |
| DR.2.2: sphere cohomology Check | S⁰, S¹, S² | Betti lists are (2), (1,1), (1,0,1); submitted formula gives (1) for S⁰. | Fail; R04. |
| DR.3.1: native singular cohomology and evaluation | point, empty space, S¹ over ℝ | H⁰ is ℝ,0,ℝ; H¹(S¹)=ℝ. Evaluation Hom(H₀(point),ℝ) is Hom(ℝ,ℝ)=ℝ and sends constant a to multiplication by a. | Pass on instances; consume existing construction. |
| DR.3.2: subdivision and small chains | oriented interval σ from 0 to 1 | Subdivision is [0,1/2]+[1/2,1]; boundary is [1]−[0], since middle coefficients +1 and −1 cancel. | Pass; inclusion/retraction homotopy is native. |
| DR.3.3: full-dimensional simplex and affine identification | p=0,1,2 | Δ⁰ is one point; Δ¹=[0,1] with barycentric coordinates (1−t,t); Δ² has area 1/2 whereas its barycentric copy in ℝ³ has 3-dimensional volume 0. | Pass; rejects integrating in the wrong ambient dimension. |
| DR.3.3: face signs and boundary square | ordered triangle [v₀v₁v₂] | Boundary=[v₁v₂]−[v₀v₂]+[v₀v₁]; second boundary gives each vertex coefficient 0. | Pass; orientation convention pinned by values. |
| DR.3.3: smooth pushforward, degeneracies and open restrictions | identity and affine maps of an interval; constant degenerate simplex | Identity preserves σ; composing 2x then 3x yields 6σ in coordinates; a constant 1-simplex has boundary [a]−[a]=0; a simplex lying in an open has the same face values there. | Pass on instances; general naturality needs proof. |
| DR.3.3: relative boundaryless smoothing | linear interval into ℝ; boundary values 0 and 1 | The map t↦t is already smooth; smoothing can keep both values 0 and 1 and the constant homotopy fixes endpoints. | Pass only on the test case; general theorem locator uncertified. |
| DR.3.3: strict extension fails for a boundary target | the prescribed quadratic faces in a 3-simplex | Face values (y−z)² etc are ≥0; forced Hessian has diagonal 2 and off-diagonal −2; Q(t,t,t)=−3t²<0. | Pass as negative control; excludes strict face-fixing into the half-line. |
| DR.3.4: strict inward cone | C=[0,∞), x=0 and x=1 | At 0, precisely v>0 work: v=1 admits ε=1/2, while v=0 and −1 fail. At interior point 1, v=0 works for small δ; in dimension zero the unique vector 0 works. | Pass; a definition excluding interior zero vectors would be wrong. |
| DR.3.4: cone convexity and chart transport | half-line x=0; positive vectors 1 and 3; chart y=2x | Midpoint vector=2>0; positive scaling sends 1↦4>0; derivative of chart sends v=1↦2. The inverse sign −1 fails to map the half-line chart to itself. | Pass on instances; uniform openness remains a theorem to prove. |
| DR.3.4: convex gluing | positive local half-line fields 1,3; weights 1/4,3/4 | Weighted field=1/4+9/4=5/2>0. An unnormalized signed weight (2,−1) would give −1 and violate inwardness. | Pass on instances; supplied partition theorem uses nonnegative weights. |
| DR.3.4: flow, rescaling and inward homotopy | half-line, X=1; Φ(t,x)=x+t | r(x)=x+1>0; H(0,x)=x+1=j r(x), H(1,x)=x; H(t,x)=x+(1−t)²≥0, including t outside [0,1]. Rescaled X=1/2 gives Xf=1/2 for f=x. | Pass on instances; existence of the general smooth proper exhaustion needs a named input, R09. |
| DR.3.4: arbitrary-model interior | quadrant C=[0,∞)², field (1,1) | Φ(t,(a,b))=(a+t,b+t) has both coordinates >0 for t>0; at t=0 the corner has two boundary faces, not one boundary-manifold chart. | Pass; semiflow does not assert a smooth collar of the corner boundary. |
| DR.3.5: transfer and prisms | N=(0,∞), M=[0,∞), r(x)=x+1 | On a point chain [x], j r sends it to [x+1]; prism boundary=[x]−[x+1] for homotopy from j r to id. H₀ maps both to coefficient 1. | Pass on instances; the j r homotopy is sufficient in the chain-transfer algebra. |
| DR.3.5: independence of inverses | chain equivalence i with two inverses s,t | s ≃ s i t ≃ t; when i=id, both composites induce the identity scalar 1 on H₀. | Pass algebraically; no equality of arbitrary chosen chain inverses is asserted. |
| DR.3.5: relative and empty pairs | (X,W)=(point,point), (point,∅) | Relative complexes are respectively 0 and the point complex; H₀ is 0 and ℝ; both smooth-to-continuous comparison maps induce identity on these answers. | Pass; no global inward homotopy preserving every open is required. |
| DR.3.5: stated corner Checks | half-line, quadrant, square | Each has H₀=ℝ and positive-degree homology 0; every point cycle has coefficient 1; de Rham class 1 evaluates to 1. | Pass; these test the degree-zero normalization, not all smoothing assertions. |
| DR.3.6: continuous retractions and denominator | t=−1,1/2,2; v=(2,0) | Interval outputs 0,1/2,1; square retracts (−1,2) to (0,1); ball retraction sends (2,0) to (1,0). Denominator max(1,‖v‖)≥1, including v=0. | Pass; these maps are continuous, not claimed smooth at their break loci. |
| DR.3.6: relative smoothing and reserve | already smooth constant filling v=0 in unit ball; tolerance 1/2 | Approximation error <1/2 gives norm <1/2<1; straight-line homotopy has the same bound. On the fixed collar the error is 0. | Pass on instances; continuous nonsmooth boundary trace is correctly excluded. |
| DR.3.7: Stokes for simplices | [0,1], f=x; triangle Δ², η=x dy | ∫₀¹df=1=f(1)−f(0); ∫Δ²dx∧dy=1/2=∫∂Δ²x dy. | Pass; no manifold-with-corners Stokes is needed for this direct simplex calculation. |
| DR.3.7: zero-simplex and linear chain integration | 0-form value 3; chain 2[x]−[y] with values 3,5 | Point integral=3; chain integral=2·3−5=1. For vector values (3,4), point integral is (3,4). | Pass; excludes zero map and arbitrary rescaling. |
| DR.3.7: naturality and de Rham map characterization | f(x)=2x on interval, ω=dx | ∫f_*σ dx=2=∫σ f*dx. On point classes, H(res) and H(∫) both send constant 1 to evaluator 1, forcing ℐ(1)=1. | Pass; no arbitrary isomorphism is enough. |
| DR.3.8: relative differential | restriction r commuting with d; arbitrary (α,β) | d_rel²(α,β)=(0,r(dα)−d(rα)+d²β)=(0,0). Reversing just one sign would give a nonzero 2r(dα) term. | Pass; differentials have the asserted source and target. |
| DR.3.8: shifted-cone coordinate sign | T(α,β)=(α,−β) | d_cone T(α,β)=(dα,−rα+dβ)=T(dα,rα−dβ). Degree 0 second term is 0. | Pass algebraically against the shift convention. |
| DR.3.8: connecting map and extension | closed b=r b̃ | δ[b]=[(0,−b)]; (db̃,0)−(0,−b)=(db̃,b)=d_rel(b̃,0), so the two classes agree. | Pass; no claim that every form on W extends. |
| DR.3.8: kernel comparison versus forms | X=ℝ, W=(0,1), function 1/x on W | 1/x has no smooth extension across 0, so restriction of forms is not onto. A singular cochain on simplices in W extends by coefficient 0 on all other simplices. | Pass; cone must not be replaced by the form kernel. |
| DR.3.8: relative integration | interval with collar W and β values 3 at +1,1 at −1; α=0 | Relative evaluation is 0−(3−1)=−2; for δ[b]=−(0,b), evaluation is +2, agreeing with b on the outward boundary. | Pass; same sign as DR.4.5. |
| DR.3.9: de Rham comparison | point, ℝ, S¹, empty manifold | Degree-zero answers ℝ,ℝ,ℝ,0 agree on both sides; degree-one answers 0,0,ℝ,0 agree. Angular class evaluates on positive loop to 2π. | Pass on instances; ownership R01. |
| DR.3.9: multiplicative comparison | T² with periods-one coordinate forms | ∫T²dx∧dy=1; cup product of the two period-one singular classes evaluates to 1; reversing order gives −1 on both sides. | Pass on instances; no second cup-product owner. |
| DR.3.9: Mayer–Vietoris induction signature | X=ℕ discrete, basis singletons plus ∅, P(U): U is countable | P holds for ∅, singleton, binary unions/intersections and countable disjoint unions; X has countably many points. If P is changed to “finite,” each singleton passes but the disjoint union has cardinal ℵ₀, so hdisjoint fails. | Pass as a discrimination of the countable-union premise; not a proof of the general induction theorem. |
| DR.4.1: pairing and boundary exclusion | ℝ with normalized compact bump ρ; [0,1] with dx | On ℝ, pairing ([1],[ρ dx])=1. On [0,1], [dx]=0 but ∫dx=1, so a boundaryless premise is essential. | Pass on intended inputs; negative control agrees with README. |
| DR.4.2: top cohomology and orientation cover | ℝ; S¹; ℝP² | H¹_c(ℝ)=ℝ, H¹(S¹)=ℝ, H²(ℝP²;ℝ)=0. Deck antipodal acts by −1 on H²(S²), so invariant top classes satisfy a=−a and hence a=0. | Pass on instances. |
| DR.4.3: compact and noncompact duality | ℝ, k=0,1; S¹, k=0,1 | For ℝ: H⁰=ℝ=(H¹_c)*, H¹=0=(H⁰_c)*. For S¹: both complementary dimensions are 1, pairing angular form with 1 is 2π. | Pass in the stated degree range; R06 outside it. |
| DR.4.3: infinite disjoint union | countably many oriented circles, k=0 | H⁰=∏ℕℝ; H¹_c=⊕ℕℝ; its algebraic dual is ∏ℕℝ. Finite-dimensionality would be false here. | Pass; compactness retained for finite-dimensionality corollary. |
| DR.4.3: out-of-range degree | S¹, n=1,k=2 | Natural subtraction gives n−k=0; dim H²=0 while dim (H⁰_c)*=1. Integer extension gives H⁻¹_c=0. | Fail as indexed in the README; R06. |
| DR.4.4: compact fundamental-class comparison | positively oriented circle; reversed orientation | ∫dθ=2π and evaluation ℐ[dθ]([S¹])=2π; reversal gives −2π on both sides. | Pass; zero/rescaled fundamental classes are excluded. |
| DR.4.4: compact-support localization and enlargement | ρ dx supported in [−1/2,1/2]⊂[−1,1]⊂ℝ, integral 1 | Both support classes have local generator +1 on the support; evaluation is 1 before and after support enlargement. With two disjoint normalized bumps it is 1+1=2. | Pass; direction (M,M∖K)→(M,M∖S) for S⊆K is correct. |
| DR.4.4: signed dimension-zero formula | two points of signs +1,−1, values 3,5; empty support | Class=[p]−[q]; integral=3−5=−2=evaluation. Empty support has sum 0. Normalized Haar mass on ℝ⁰ is 1. | Pass; orientation sign is not encoded by a negatively oriented empty ordered basis. |
| DR.4.4: open-embedding invariance | f(x)=2x on ℝ; normalized top bump ω=ρ(y)dy | Pullback is 2ρ(2x)dx; its integral=1=∫ω. For f(x)=−x, oriented integral becomes −1 and is excluded by orientation preservation. | Pass; compact support must lie in the range for a proper open submanifold. |
| DR.4.5: relative boundary formula | D¹=[−1,1], α=0, β endpoint values (3,1) | Outward boundary is [+1]−[−1]; ∫∂β=2; both relative pairing and ∫α−∫∂β equal −2. | Pass; agrees with DR.3.8. |
| DR.4.5: cutoff change | two cutoffs giving γ₁,γ₂ with the same boundary values | Difference in corrected top integrals is −∫d(γ₁−γ₂)=−∫∂(γ₁−γ₂)=0; endpoint values cancel to (0−0)=0. | Pass on instance; collar shrink/relative naturality must be used when β−γ only vanishes on a smaller collar. |
| DR.5.1: IsRegularPoint and IsRegularValue | f(x)=x² at 0,±1; values −1,0,1 | Derivatives 0,±2 give point predicates false,true,true; value predicates true (empty fibre), false, true. | Pass; supplies the missing discriminating Checks in R08. |
| DR.5.1: total derivative and zero target | f(x)=abs(x) at 0; any map to ℝ⁰ | Junk fderiv at 0 is 0 and is not onto ℝ; unique map to 0 is onto, so every value of a zero-dimensional target is regular. | Pass; definition has no hidden differentiability premise. |
| DR.5.1: inverse function theorem premise | projection ℝ²→ℝ; identity [0,1]→ℝ at 0 | Projection derivative has rank 1, is onto, but not injective; boundary identity derivative=1 but image near 0 is one-sided. Neither meets the native local-diffeomorphism hypotheses. | Pass; the README correctly warns about unequal dimensions and interior points. |
| DR.5.2: smooth Sard and density | x²:ℝ→ℝ; constant map ℝ→ℝ; map to a point | Critical images are {0},{0},∅; Haar measures are 0,0,0. Regular-value sets are ℝ∖{0},ℝ∖{0},all of the point. | Pass on instances. |
| DR.5.2: sharp threshold | constant ℝ³→ℝ at k=3; t↦(t,0) at k=1 | 3−1=2<3, critical image {0} has measure 0; 1−2=0<1, rank 1<2 everywhere, image line has area 0. | Pass mathematically; exact duplicate owner R02. |
| DR.5.2: zero dimensions and empty source | ℝ⁰→ℝ⁰; ℝ⁰→ℝ; U=∅ | First critical image ∅ (not a point of positive Haar mass); second critical image is a single null point; third image ∅. All measured values=0. | Pass; natural subtraction in the threshold correctly imposes k≥1. |
| DR.5.3: incidenceEquation | F(x,p)=x+p, j(y)=2y, at (x,y,p)=(1,2,3) | F−j=1+3−4=0; derivative (u,v,q)↦u−2v+q; source derivative (u,v)↦u−2v has rank 1. | Pass; minus sign and parameter order match TauCeti.IsRegularParameter. |
| DR.5.3: fixed-source versus total regularity | E=W=0, V=P=ℝ, F(p)=p, j=0 | Total derivative dp is 1 (onto); at p=0 fixed-source derivative is 0 (not onto). Bad parameters={0}, Haar measure=0, not the empty set. | Pass; rejects confusing the two surjectivities. |
| DR.5.3: necessity of universal transversality | E=W=0, P=V=ℝ, F=0, j=0 | Total derivative=0, fixed derivative=0; every p is bad, bad set ℝ has measure ∞. | Pass as a negative control; htotal excludes it. |
| DR.5.3: empty incidence and target dimension zero | F=1,j=0 with V=ℝ; V=0 | First zero locus=∅ and every p regular; second derivatives all map onto 0, again every p regular. Bad measure=0 in both cases. | Pass; no denominator or positive-dimension exception is hidden. |
| DR.5.3: avoidance inequality | E=W=0,V=ℝ, F(p)=p,j=0 | At p=1, incidence is empty, regularity true, and 1≠0. At p=0, incidence is nonempty and regularity false. Rank 0 cannot be onto dimension 1. | Pass; arbitrary data are tied to incidence by the regularity hypothesis. |
| DR.5.3: relativeTranslate and derivative | f(x)=x, β=x², p=2 at x=0,1 | Values are 0,3; d_x=1+4x gives 1,5; parameter derivative β gives 0,1. On C={0}, f_p=f=0 and dβ=0. | Pass; fixes C and retains the derivative cross-term. |
| DR.5.3: small perturbations, C=∅ | f=0, β=1, j=0 point, r>0 | Choose p=r/2: norm=r/2<r, F_p=p≠0, incidence empty, regularity true; EqOn on C is true. | Pass; zero parameter alone would fail regularity. |
| DR.5.3: C=whole source | f=id on ℝ, β=0, j=0 point | Every parameter gives f_p=x; at the sole zero derivative=1; choose p=0 with norm 0<r. | Pass; arbitrary closed C is not silently required to be proper. |
| DR.5.3: compact Cᵏ bounds and family transport | f=0, β=x² on [−1,1] | For increment x²p: sup norm=abs(p), sup first derivative=2 abs(p), sup second derivative=2 abs(p), all higher derivatives=0. | Pass; constants 1,2,2,0 are independent of p. |
| DR.5.3: countable simultaneous avoidance | point source, obstacles j_q=q for q∈ℚ⊂ℝ | Bad set is ℚ; each singleton has measure 0, union measure 0; irrational p avoids all obstacles. Empty list has no bad parameter. | Pass; no closedness of the union of images is needed. |
| DR.5.4: finite regular fibres | z↦z² on S¹; constant S¹→S¹; identity [0,1]→ℝ | Regular doubling fibre has cardinal 2; constant map has empty regular fibres of cardinal 0, while its nonempty fibre is not regular; endpoint identity fibre has cardinal 1. | Pass; finite-fibre signature does not need the interior-point hypothesis of a local diffeomorphism onto an open target. |
| DR.5.4: degree sign sum and integral formula | z↦z² and conjugation on S¹ | Sign sums 1+1=2 and −1; pullback angular integrals 4π and −2π equal degree times 2π. | Pass; orientation reversal distinguished. |
| DR.5.4: disconnected/noncompact top-cohomology claim | S¹⊔S¹→S¹ and constant S¹→ℝ | First top pullback ℝ→ℝ² is a↦(a,a), integrated sum=2a; second target top cohomology is 0, not ℝ, and degree=0. | Fail for scalar-identification clause; R05. |
| DR.5.5: homotopy, identity, constants and composition | circle rotations, z², z³, constant | Rotation and identity degrees=1; constant degree=0; z³∘z²=z⁶ has degree 6=3·2. | Pass in positive dimension. |
| DR.5.5: antipodal sign and circle π₁ | S¹ and S²; z↦zᵐ | Antipodal degrees (+1,−1) equal (−1)²,(−1)³; on π₁(S¹), positive generator 1 goes to m, matching degree m. | Pass; distinguishes circle antipodal from conjugation (degree −1). |
| DR.5.5: noncompact-domain negative control | inclusion (0,∞)→ℝ | Regular sign sum at y=1 is 1, at y=−1 is 0. Both are regular values; no value-independent degree follows without properness/compact-source restrictions. | Pass as negative control for the planned definition; proper-map degree is not disproved. |
| DR.5.5: extension to disc and no retraction | constant sphere map versus identity S¹ | Constant extends and has degree 0; identity has degree 1, so an extension giving a retraction would force 1=0. | Pass on examples; topological theorem stays with AlgebraicTopology. |
| DR.6.1: hairy ball, low even dimensions | S⁰; S² with w(x)=a−〈a,x〉x, norm a=1 | On S⁰, tangency w(±1)·(±1)=0 forces w=0. On S², dot(w,x)=0 and zeros occur at x=±a. | Pass; actual Fact finrank E=n+1 excludes the empty zero-space sphere. |
| DR.6.1: degree obstruction | hypothetical unit tangent field on S² | Great-circle homotopy gives id≃antipodal, requiring degrees 1=−1, impossible over ℤ. | Pass; the contradiction uses sphere dimension, not ambient parity. |
| DR.6.2: odd field and parity iff | S¹ and S³, standard complex structure J | w(x)=Jx gives norm 1 and inner product 0; no zero exists, and n=1,3 are odd. For n=0, both existence and Odd(0) are false. | Pass in both directions on instances. |
| DR.6.2: tangent-bundle section bridge | S¹ field Jx; zero section on S² | Derivative of sphere inclusion sends tangent vectors injectively to the orthogonal subspace; Jx has norm 1, while zero maps to 0. Thus zeros correspond in the actual bundle, not an arbitrary pointwise identification. | Pass on instances; global continuity must use the tangent bundle topology. |
| Non-Hausdorff de Rham negative control | line with two origins | Global smooth forms are the usual line forms, so H¹_dR=0. Two chart lines have intersection with two components; Mayer–Vietoris yields singular H¹=ℝ. | Pass; Hausdorffness is not an inessential decoration. |
| Non-Hausdorff zero-extension negative control | bump equal to 1 at one origin, zero at the other | Along shared nonzero points tending to the second origin, values tend to 1; prescribed value there is 0. | Pass; extension by zero fails continuity. |
| Non-Hausdorff global-primitive negative control | the stated translated-interval gluing | For each m, a_mn→0_A and corresponding points→2^(−m)_B, forcing f(0_A)=f(2^(−m)_B); as m→∞, f(0_B) equals that value, so difference quotients along 2^(−m) are 0. dy at 0_B has coefficient 1. | Pass at the stated separated-interval construction; cannot infer global extension of a primitive. |
| Incompatible charted-space negative control | cube-root preferred charts on ℝ | Smoothness of cube-root(γ(t)−γ(t₀)) forces γ′(t₀)=0; on an interval γ is constant. Smooth H₀ distinguishes points; continuous H₀=ℝ. | Pass; IsManifold compatibility matters. |
| Incomplete-coefficient negative control | c₀₀ with the sup norm; disjoint positive smooth e_n-valued bumps near 2^(−n), with amplitudes decaying faster than every power of their widths | Each value has finite support and all derivatives tend to 0 at the accumulation point. For every small x>0, the integrals from 0 to x have nonzero n-th coordinate for all sufficiently large n. A primitive difference would have infinite support, impossible in c₀₀. | Pass; completeness cannot simply be deleted from the primitive theorem. |

The table contains **96 computed rows**. It covers all 27 target blocks, all 18 Lean declarations, the five named headlines, the supplemental sample and each mathematical counterexample in the findings. For constructions, the values check the defining maps and reject obvious wrong models; they do not certify the missing general existence proofs. Algebraic positive-characteristic or ramified-coefficient tests are outside this explicitly real smooth-manifold scope, rather than silently assumed away.

## Not verifiable

- **Lee, Introduction to Smooth Manifolds, second edition** (`lee`): requested the cited edition through the sources service, including the numbered Ch.17–18 targets. The service resolved the work only to the paywalled Springer DOI family and returned **uncertified**. Also located the author's official University of Washington book page and publisher metadata in a legal-location search; neither search result supplied the requested theorem text. No textbook page number, local proof step, Banach extension, arbitrary-convex-model extension, or Problem 16-6/18-6–18-8 statement is certified from this book.
- **Bott–Tu, Differential Forms in Algebraic Topology** (`bott-tu`): the sources service returned **uncertified** for [the publisher DOI](https://doi.org/10.1007/978-1-4757-3951-0). §§1–2 and 5 were not read, so no source-level verification of their hypotheses or page numbers is claimed.
- **Hirsch, Differential Topology** (`hirsch`): the sources service returned **uncertified** for [the publisher DOI](https://doi.org/10.1007/978-1-4684-9449-5). Chapter 3, Theorem 1.3, printed p.69 was not inspected. Its correctness as the locator is unverified; the mathematical sharp Sard claim has independent support in `azagra`.
- **Federer, Geometric Measure Theory** (`federer`): the sources service returned **uncertified** for [the publisher DOI](https://doi.org/10.1007/978-3-642-62010-2). §3.4.3 was not inspected. It cannot certify the proof's inputs merely through the citation.
- No readable source manifest or design plan was provided for this folder. The source service returned no unresolved/missing-text request: four mathematical references are uncertified, one mathematical text was fetched, and all three linked provenance pages were fetched. Accordingly no replacement-reference request was created, no manifest was edited, and the review was not parked.
- The exact worker-generated fifteen-target sample was not supplied; the brief says no heading targets were found. The report identifies its own supplemental seed and examines all numbered targets, but does not claim recovery of the worker's random selection.
- The assertion at README lines 566–568 that a locally extendable simplex need not have any single smooth neighbourhood extension into a manifold has no explicit counterexample or precise locator here. I checked the separate boundary-face obstruction, which is a different assertion; it does not certify this global-extension claim. Similarly, the half-line/quadrant flow tests do not certify the complete arbitrary-convex-model ODE construction or its smooth proper-exhaustion prerequisite (R09).
- The three prior-work/provenance pages were fetched through the sources service. `urkud-derham` line 183 identifies the repository topic; `zulip-poincare` lines 31–36 and 66–76 confirm the flat-form discussion and its complete-coefficient scope; `zulip-brouwer` lines 25–27 confirm Murphy’s announcement of a singular-homology proof. This certifies provenance only, not a port or that the repositories establish the roadmap’s general targets. No licence approval or code reuse was certified. Ownership evidence for open work was restricted to the supplied mathematical folders and checked main owners; no unseen open proposal is asserted to be absent.

## Source issues

- **Misprint** in azagra at §4, proof of Theorem 1.1, printed p.18 (azagra line 763): the source says the Taylor remainder condition is imposed at every point of ℝⁿ; it should be imposed at points of U⊆ℝⁱ, the domain just specified; affects the proof.
- **Misprint** in azagra at §5, discussion of De Pascale's theorem, printed p.18 (azagra line 793): the source says g is differentiable almost everywhere in ℝᵐ; it should be almost everywhere in ℝⁿ, its specified source; affects the proof.
- **Misprint** in azagra at §6, proof of Theorem 1.8, printed p.24 (azagra lines 1056–1063): the source says local classes on U use global domains and quantifiers on ℝⁿ; it should use Cˢ⁻¹(U,V) and points of U⊆ℝⁱ; affects the proof.
