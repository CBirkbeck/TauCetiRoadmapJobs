# Review of EllAdicRealization (pull request #196 at 4bd7237)
Folder: `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/`

**Verdict:** rejected

🤖 Independent AI review. Nine findings, four blocking (three P1 and one P2). The central scope re-plans existing main-branch work; this is why the verdict is rejected rather than needs changes. No pull-request file was changed.

## R01 (P1) — The central construction already belongs to existing roadmaps

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:127–144`, especially “The missing reusable library consists of”.

**Claim:** Layers 0–9 undertake new ownership of the tower, realization, comparison, finiteness and continuous-action library.

**Witness:** Main’s `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:959–1106`, §§F.4.1–F.4.6, already assigns those same objects and results. Generic towers and limits belong to `DerivedModuleAlgebra` §1.T.1 and `EnhancedDerivedSheaves` §0.3.

This is object-level duplication, not a similar title: F.4.1 has exactly the coherent derived reductions and uniform bounds of Layer 1; F.4.2 has Layer 2’s primitive realization; F.4.3 identifies the constant realization with Mathlib’s two named objects; F.4.4 explicitly includes small-universe models; F.4.5 rationalizes; F.4.6 constructs continuous actions and operation comparisons. All were read on the supplied main checkout at `2b363a2b5643eed47f0cf2ed7ffcc85141b79af4`. The proposed distinction “compare Mathlib’s existing objects” is therefore already owned too.

**Repair:** Withdraw the duplicate scope and import those sections by name. Any genuinely additional theorem needs a Part II roadmap that says where the existing owner stops. This is a scope replacement, not a local correction to the proposed independent owner. On the constant tower over a geometric point, both specifications construct the same ℤℓ in degree zero; on the roots-of-unity tower, both construct the same Tate object and geometric multiplier q⁻¹. Neither instance distinguishes a new construction here.

## R02 (P1) — Layer 2 applies a finite-coefficient supplier outside its domain

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:200–216`: “with … consumed from `CompactSupport`”.

**Claim:** Apply the supplied compact-support functor to the integral étale realization and then prove its derived-limit comparison.

**Witness:** `TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/README.md:85–87,231–241` supplies finite-torsion coefficients. At a geometric point the constant tower realizes ℤℓ, and ℓⁿ·1≠0 for every n; it is outside that coefficient domain.

`CompactSupport` also explicitly distinguishes its compactification-defined operation from the right derived functor of underived sections with proper support (line 241). Calling the operation the “corresponding derived global-section functor” does not construct an integral extension. Layer 9’s later promise of adic support operations cannot serve as the definition already needed in Layer 2. No supplier gap is declared.

**Repair:** Consume `EtaleCohomologyFoundations` §F.4.2’s adic lower-shriek construction and continuity theorem, including its hypotheses, before this comparison is used. If a legitimate extension retains this material, explicitly construct its normalized finite-level support operation first; do not directly apply the torsion supplier to an integral sheaf. Test the corrected operation on the point (ℤℓ in degree zero) and on 𝔸¹ over a separably closed field with ℓ invertible (ℤℓ(−1) in degree two, reducing to Λₙ(−1)). These are valid adic outputs and have the required finite reductions.

## R03 (P1) — Ordinary finiteness for nonproper schemes has no cited supplier

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:279–285`: “Use finite-level finiteness and derived-limit control”.

**Claim:** Obtain finite generation and perfectness of ordinary and compact-support cohomology for every separated finite-type scheme over a separably closed field.

**Witness:** `TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange/README.md:290–292` supplies ordinary finiteness and constructible direct image only for proper maps. For 𝔾ₘ, ordinary H¹ is Λₙ(−1), while H¹c is Λₙ; compact-support finiteness is a different input.

The general ordinary theorem is mathematically available, but neither the cited proper theorem nor `CompactSupport`’s support theorem supplies it. A reference to a source is not ownership of this missing input. The family excludes a duality development that might otherwise supply a route.

**Repair:** Import the ordinary geometric finiteness clause of `EtaleCohomologyFoundations` §F.3 (lines 692–698), and its integral consequence §F.4.4, by exact target. Retain nonproper schemes. The repaired input covers 𝔾ₘ and gives ordinary integral groups ℤℓ and ℤℓ(−1) in degrees 0 and 1; the support groups remain in degrees 1 and 2. Restricting the theorem to proper schemes would violate the required generality.

## R04 (P2) — The smallness headline is statable but absent

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/Suggested.lean:11–20`: “No compiled targets yet; see README.md.” Compare README lines 281, 287 and 372.

**Claim:** The empty acceptance file postpones statements until normalized systems and comparison functors exist.

**Witness:** A scratch theorem concluding `Small.{u} (X.EllAdicCohomology ell i)` elaborated against the pin with separated finite-type geometric hypotheses. Its `#check` output retains the field, separable-closure, finite-type, separatedness and invertibility binders.

The following is the successful native-carrier signature, with no new definition or option:

```lean
import Mathlib
open CategoryTheory AlgebraicGeometry
universe u
namespace ReviewProbe
/-- Geometric finite-type smallness uses only native pinned carriers. -/
theorem geometricSmallness (k : Type u) [Field k] [IsSepClosed k]
    (X : Scheme.{u}) (f : X ⟶ Spec (.of k))
    [LocallyOfFiniteType f] [QuasiCompact f] [IsSeparated f]
    (ell : ℕ) [Fact ell.Prime] (hInvertible : IsUnit (ell : k)) (i : ℕ) :
    Small.{u} (X.EllAdicCohomology ell i) := by
  sorry
end ReviewProbe
```

**Repair:** Resolve R01 first. If a legitimately retained scope includes this headline, state it on the native carriers; otherwise remove the duplicate promised ownership. Name every genuinely unstatable remaining headline and its missing carrier in the module docstring. On a geometric point the small model is ℤℓ for i=0 and the zero group for i>0; on 𝔾ₘ it is ℤℓ(−1) for i=1. The signature admits all of these without an invented cohomology carrier.

## R05 (P3) — The sampled Summit has no theorem or page locator

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:372`, “**Summit:**”; reference map at lines 48–63.

**Claim:** The composite Summit is supported by chapter/section ranges and two books named without finer locators.

**Witness:** There is no theorem number or page attached to the Summit. `stacks-proetale` line 2670 gives Lemma 61.29.2, p.59, about bounded derived-complete objects; it is not the entire finiteness/Galois Summit.

**Repair:** Attach exact locators separately to finite comparison, coefficient realization, geometric finiteness, rationalization and continuous descent. State the separated finite-type, separably closed-base and descended-coefficient hypotheses where they apply. Record the works in the required source manifest, without copying source text. The source checks below give usable verified locators; Milne remains unread and SGA 4½ uncertified. A geometric point tests the basic comparison, but cannot certify finiteness for general bases: over ℝ with ℓ=2, integral constant cohomology has H^(2r)=ℤ/2 for every r≥1. Thus the geometric hypothesis cannot disappear in the Summit’s wording.

## R06 (P3) — Definitions lack discriminating Checks and layers lack contracts

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:148–370`, the eleven build layers; `Suggested.lean:6–20`.

**Claim:** Lists of operations and seven end-of-document examples specify a complete reusable library.

**Witness:** The normalized-system definition at lines 170–196 has zero attached Checks; the file has zero `*Needs:*` lines and zero layer-ending `Examples`/`Dependencies` subsections. “Truncations” at line 185 has no specified construction.

**Repair:** Use the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layers, Examples, Dependencies and References structure. Give each definition its API and at least three computed positive/negative Checks; specify hypotheses and source/target for each operation. Remove the temporal Lean comment and enumerate unavailable headlines with their missing carriers.

For normalized systems, concrete repairs can be tested immediately: constant Λₙ reduces to Λₙ; ranks 1 and 2 at consecutive levels fail compatibility; for Cₙ=[Λₙ —ℓ→ Λₙ] in degrees −1,0, levelwise τ≥0 gives ℤ/ℓ, which over Λ₂ has nonzero Torᵢ with Λ₁ for every i≥0. Therefore levelwise truncation is not a ctf-preserving API. Specify truncation through the integral realization followed by derived reduction, or its precise domain; its reductions retain the adjacent Tor group. Also pin geometric versus arithmetic Frobenius by q=2, ℓ=3, n=2: the two multipliers are 5 and 2 modulo 9.

## R07 (P3) — Gate failure: LaTeX delimiters

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:1`, including the title’s TeX-delimited ℓ.

**Claim:** Mathematics is written with LaTeX delimiters throughout the README.

**Witness:** The supplied head gate reports `latex=124` and FAIL; line 1 alone reproduces the rule violation.

**Repair:** Replace delimiters by Unicode mathematics or permitted code spans/blocks, and update any heading anchors. For example the title becomes “Roadmap: classical and pro-étale ℓ-adic realization”. Rerun the scanner; the title must contribute zero violations.

## R08 (P3) — Gate failure: TeX-only syntax

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/README.md:80–84`, the normalized-reduction formula.

**Claim:** TeX subscripts, superscripts and control sequences are used outside code spans and blocks.

**Witness:** The supplied head gate reports `tex=56`; the reduction formula is among its listed witnesses.

**Repair:** Convert the formula to Unicode, for example Kₙ₊₁ ⊗ᴸ over Λₙ₊₁ with Λₙ ≃ Kₙ, or put an ASCII formula in a code span. Removing delimiters alone does not repair this independent failure. Preserve the same derived tensor and coefficient rings; test that both syntax counters become zero.

## R09 (P3) — Gate failure: required metadata is absent

**Location:** `TauCetiRoadmap/CohomologicalPointCounting/EllAdicRealization/metadata.toml` (absent).

**Claim:** The folder is a complete roadmap package.

**Witness:** The gate reports `metadata=1`: the required metadata file is missing. The folder contains only README.md and Suggested.lean.

**Repair:** After settling ownership and destination, supply that roadmap’s metadata in the gate’s required schema. Check the same gate rule changes from one failure to zero. No acceptance is possible while the supplied gate fails.

## Verified sound

This section records verified examples and resolved interfaces, not approval of the rejected scope. There was no previous review to recheck. No route-specific shortcut, computational algorithm or copied source passage was identified in the inspected material; the ownership violation is R01.

**Mechanical checks.** Confirmed head `4bd72379658126cbe9be935656396f0c9dac4de0`, a clean worktree, and an empty outside-folder diff using the brief’s exclusions, including its family-index allowance. The original `Suggested.lean` elaborates successfully with `lake env lean` and no diagnostics. The worker’s targeted module build passes. There are zero declarations, zero sorried data objects, zero options and zero padding candidates in the original file; hence no original declaration requires a one-tactic or section-variable probe. The separate smallness signature elaborated with only the expected `sorry` warning; `#check @geometricSmallness` retained every intended binder. A separate `infer_instance` probe for the smallness conclusion failed to synthesize the required smaller-universe instance; it is not automatic from the existing additive-group instance. This intentional scratch failure is not a failure of the submitted Lean file. No Lean process remains running.

The supplied gate is FAIL: `latex=124`, `tex=56`, `metadata=1`; every other reported counter, including build, depcheck, imports, stray-files, outside-folder and sorry-data, is zero. The independent dependency command returned exactly:

```text
depcheck: 163 roadmaps, 1164 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. The five sibling suppliers exist at the reviewed PR head. Their absence as separate names from the order is not a finding; the brief permits placement after suppliers. The mechanical result does not establish the missing domain contracts in R02–R03. There are no declared supplier gaps and no `*Needs:*` lines to resolve.

**Pinned library audit.** The local Mathlib checkout is exactly `9caeba1000ef8f302920981f4a08651d325abc81`. The head’s `lake-manifest.json` contains no Tau Ceti package at all, so there is no pinned Tau Ceti source tree against which to make a library-existence claim. No Tau Ceti declaration is consumed by the Lean file. Searches and direct reads used the pin, not current online Mathlib.

Opened these declarations and their definitions:

| Pinned file and lines | Declaration / verified content | Consequence |
| --- | --- | --- |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:53–56` | Grothendieck-abelian instance for pro-étale abelian sheaves in universe u+1 | The sheaf-category assertion is supported. |
| Same file, 63–67 | `AlgebraicGeometry.Scheme.ellAdicSheaf` | Built from continuous maps to ℤℓ, with a prime binder; not an arbitrary or sorry-defined coefficient. |
| Same file, 75–80 | `AlgebraicGeometry.Scheme.EllAdicCohomology`, additive-group instance | Carrier is Type (u+1); the file does not itself supply a ℤℓ-module structure, finite generation or the general u-smallness theorem. |
| Same file, 71–72 and 83–85 | `isZero_ellAdicSheaf_of_isEmpty`, empty-scheme Subsingleton instance | Empty-space boundary already exists and should not become an admitted acceptance theorem. |
| `Mathlib/AlgebraicGeometry/Sites/ConstantSheaf.lean:44–46` | `continuousMapPresheaf` | Its object value is C(U,T), its map is precomposition. No discreteness of T is imposed. |
| `Mathlib/AlgebraicGeometry/Sites/Proetale.lean:97–99` | `Scheme.ProEt` | Native objects are weakly étale scheme morphisms, rather than an invented restricted carrier. |
| `Mathlib/CategoryTheory/CofilteredSystem.lean:137–138` | `CategoryTheory.Functor.IsMittagLeffler` | Eventual-image condition already has native vocabulary. |
| Same file, 160–162 | `CategoryTheory.Functor.isMittagLeffler_of_surjective` | Surjectivity implies ML already; retain only the genuinely additional derived-limit comparison. |
| `Mathlib/Logic/Small/Defs.lean:37–39` | `Small` | Means existence of an equivalence with a type in the smaller universe, not finite cardinality. |
| `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:44–46` | `IsSeparated` | Closed diagonal; does not assert finite type or properness. |
| `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:43–46` | `LocallyOfFiniteType` | Affine ring-map finite type; the scratch signature separately carries quasi-compactness. |
| `Mathlib/FieldTheory/IsSepClosed.lean:65–67` | `IsSepClosed` | Native separably closed-field condition used explicitly by the probe. |

This is 12 directly inspected declaration groups. Object searches also covered the sites, derived-category/limit vocabulary and both named ℓ-adic objects. The README’s generic assertion about existing derived-limit infrastructure is not an exact declaration contract; R01/R06 identify its proper owners.

**Resolved roadmap citations and ownership.** Read main’s `EtaleCohomologyFoundations`, `EnhancedDerivedSheaves` and `DerivedModuleAlgebra` for both shape and object ownership. The roadmap-service grep searched objects across main and indexed open work; direct inspection resolved the following five claimed sibling supplies at this PR head:

| Citation in reviewed README | Resolved location | Result |
| --- | --- | --- |
| `ConstructibleEtale`, line 118 | `TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale/README.md`, Layers 6–9, especially 329–378 | Finite twists, ctf category and coefficient cohomology exist as targets; finite-group cohomology explicitly requires coefficient equivariance at line 373. |
| `EtaleBaseChange`, line 119 | Sibling README, Layers 4–9, especially 288–292 | Proper/smooth base change and proper finiteness exist; nonproper ordinary finiteness is not supplied (R03). |
| `CompactSupport`, lines 119 and 209 | Sibling README, conventions 85–87 and Layers 5–7, 231–296 | Finite-torsion support operation exists, integral extension is not supplied (R02). |
| `FrobeniusGeometry`, lines 120 and 330 | Sibling README, Layers 4 and 7, 218–241 and 291–301 | Arithmetic power map, geometric inverse and cohomological bridge are named targets; signs agree with this roadmap. |
| `ComplexComparison`, lines 121 and 350 | Sibling README, Layers 6–7 and 10–12, 274–315 and 366–452 | Finite-level sheaf/singular, support and relative comparison are targets; an adic topological realization is not supplied there. |

The family index was read for its scope, coefficients and Frobenius conventions. Its use of geometric cohomology and explicit transport agrees with the computations below. Cross-roadmap names resolve mechanically; whole-roadmap references remain too coarse to replace target-level contracts.

Ownership searches also covered the board package tree and its supplied active-package index, and the supplied open-head neighbors `EllAdicHomotopyTypesAndWeights` and `ClassicalAdicEtaleCohomologyPartII`. The former explicitly imports the finite/adic theory from `EtaleCohomologyFoundations` (README lines 13 and 93–95); the latter concerns analytic adic geometry rather than a new scheme-realization owner. No declaration-name collision is possible in the empty Lean file. No independent audit is claimed for open pull requests whose files were not supplied; search hits there were not used to establish R01. The already-resolved main owner is sufficient.

**Headline inventory.** README Layers 3–10 promise finite étale/pro-étale comparison; continuous coefficient-sheaf identification; the natural derived classical/pro-étale comparison; geometric smallness, integral finiteness, boundedness, perfectness and derived reduction; rational finite dimensionality; continuous Galois/Frobenius actions; adic operation comparisons; and integral/rational Artin comparison. Smallness is statable now (R04). The other full headlines need the specified normalized-system, coefficient-module, support, continuous-action and analytification/comparison interfaces. Neither the README nor module docstring supplies individual native signatures for those full interfaces. The docstring names only a general future derived comparison and does not account for each absent headline. There is no substituted scalar theorem or hidden `Prop` carrier.

**Seeded source sample: Summit.** The README marks no locator as unverified. Its only sampled target is the Summit at line 372; it supplies no theorem number or printed page. Consequently exact-locator certification fails (R05), even though substantial ingredients were verified against legally obtained text:

| Source / inspected locator | Text location | What it actually supports |
| --- | --- | --- |
| Bhatt–Scholze, arXiv:1309.1198v2, Corollary 5.1.6, printed p.35 | `bhatt-scholze` line 1635 | Bounded-below étale complexes recover under derived pushforward after pullback; gives finite-level cohomology comparison. |
| Same version, Example 5.2.2, p.36 | `bhatt-scholze` line 1678 | Distinguishes derived pushforward comparison from an invalid assertion that pullback commutes with inverse limits. |
| Same version, Definition 6.5.1 and Example 6.5.2, p.49 | `bhatt-scholze` lines 2300 and 2307 | Derived-complete constructible coefficient objects; a geometric point gives perfect complexes over the complete coefficient ring. |
| Same version, Lemmas 6.5.3–6.5.5, p.49 | `bhatt-scholze` lines 2308–2315 | Boundedness, finite reductions and tensor closure for those constructible objects. |
| Same version, Theorem 6.7.1 and Lemma 6.7.2, p.55 | `bhatt-scholze` lines 2581–2589 | Constructible direct image for finitely presented qcqs maps, assuming properness or a quasi-excellent ℓ-coprime target. A geometric field target supplies the nonproper case missing from the claimed supplier. |
| Same version, Lemma 6.7.4, p.55, and Lemma 6.7.5, p.56 | `bhatt-scholze` lines 2593–2603 and 2616–2627 | Smooth and proper base change with completed pullbacks and the displayed hypotheses, not arbitrary interchange of pullback and limits. |
| Same version, Definition 6.8.1, Lemma 6.8.2(1), p.58, and Proposition 6.8.4(1), p.59 | `bhatt-scholze` lines 2759–2764 and 2786–2789 | Continuous coefficient sheaf equals the inverse limit of finite quotients; lisse integral systems recover the corresponding pro-étale local systems. |
| Same version, Proposition 6.8.14(2), p.62 | `bhatt-scholze` lines 2917–2923 | Rational constructible category is the integral category up to isogeny, under the section’s topologically Noetherian convention. |
| Stacks §61.29, Definition 61.29.1 and Lemma 61.29.2, tags 09C1/09C2, p.59 | `stacks-proetale` lines 2661–2684 | Derived completeness, finite Tor amplitude and uniform bounds on quasi-compact schemes; not finiteness over an arbitrary arithmetic base. |
| Stacks §61.30, Theorem 61.30.1, tag 09C9, pp.63–64 | `stacks-proetale` lines 2836–2879 | Proper base change for derived-complete coefficients with bounded-below classical reductions and perfect Λ/Iⁿ over Λ. ℤℓ/ℓⁿ has a length-one free resolution, so the coefficient hypothesis holds here. |
| Stacks §64.18, Definitions 64.18.1 and 64.18.8, tags 03UM/03UT, pp.22–23 | `stacks-trace` lines 1036–1042 and 1107–1111 | Classical sheaf towers and degreewise cohomology definitions over an algebraically closed base. These definitions do not alone prove the roadmap’s derived natural equivalence. |
| Stacks §64.18, Example 64.18.4 and Remark 64.18.5, tags 03UP/03UQ, p.23 | `stacks-trace` lines 1076–1096 | Levelwise kernels require normalization; finite stalks and finite ℤℓ stalk modules, not automatically all global cohomology groups. |

The Bhatt–Scholze locators above refer to the version actually read; no unverified agreement with published pagination is asserted. The Stacks chapter/section titles in the README’s source map match the fetched chapters. These checks support the intended geometric theory, but do not cure ownership or missing contracts.

**Computed adversarial pass.** O=ℤℓ, Q=ℚℓ, Λₙ=ℤ/ℓⁿ; complexes are cohomological. Except where a row deliberately tests an excluded case, k is separably closed and ℓ is invertible. “Pass” below means the displayed instance agrees, not a proof of the full theorem. “Specify” means the prose needs a domain or construction before the full claim can be assessed (R06). Repeated promises in scope/completion lists refer to these same rows.

The table contains 103 rows, covering the mathematical targets, their principal API operations, every worked example and every finding with a mathematical witness.

| Statement / README lines | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: prime/invertibility, 69 | ℓ=2 in 𝔽₃; ℓ=3 in 𝔽₃ | 2·2=1 in 𝔽₃; 3=0 is not a unit. The second case is excluded. | Pass; retain explicit invertibility. |
| Conventions: tower indices, 75–87 | ℓ=2; n=1,2 and excluded n=0 | Λ₁=ℤ/2, Λ₂=ℤ/4; Λ₀=ℤ/1=0. A tower starting at zero would lose the first meaningful reduction. | Pass; n≥1 is necessary to the convention. |
| Conventions: continuous action, 106 | G=ℤ₃, action on Q₃ by a↦4ᵃ | 4^(3ʳ)→1 in Q₃. With discrete target topology the same infinite-image action is not continuous. | Pass; retain module topology. |
| Layer 0: inverse systems / morphisms, 154 | O/4→O/2 for ℓ=2 | 3 mod 4↦1 mod 2; a transition in the reverse direction cannot send 1 to an element of order 4. | Pass; earlier owner R01. |
| Layer 0: inverse limit, 155 | Λₙ tower; zero tower | lim Λₙ=O; lim 0=0, not ∏Λₙ. (0 mod 2,1 mod 4) is in the product and not in the limit. | Pass; R01. |
| Layer 0: derived inverse limit, 155 | ℤ —×2← ℤ —×2← … | lim=0; lim¹=ℤ₂/ℤ≠0. Derived limit has nonzero H¹ although the ordinary limit is zero. | Pass; retain derived object. |
| Layer 0: Milnor exact sequence, 156 | Same tower as complexes in degree 0 | At i=1: 0→ℤ₂/ℤ→H¹(Rlim)→0→0; the middle term equals ℤ₂/ℤ. | Pass; do not suppress lim¹. |
| Layer 0: ML vanishing, 157 | Finite quotient tower and ×2 tower on ℤ | Images at fixed n for Λₘ→Λₙ are always Λₙ; images 2ʳℤ strictly decrease. lim¹ values are 0 and ℤ₂/ℤ. | Pass; native ML predicate exists. |
| Layer 0: surjective transitions, 158 | ℤ/8→ℤ/4→ℤ/2 | Images are respectively all 4 and all 2 residues; eventual ranges equal targets; lim¹=0 for the full tower. | Pass; cite pinned ML theorem. |
| Layer 0: finite products, 159 | Two constant-rank towers | lim(Λₙ²)=O²=(lim Λₙ)²; rank zero gives 0 on both sides. | Pass; R01. |
| Layer 0: tensor compatibility, 159 | Finite free towers of ranks 2 and 3 | O²⊗O³=O⁶; lim(Λₙ²⊗Λₙ³)=O⁶. | Pass for finite perfect factors; specify the claimed completeness/tensor hypotheses. |
| Layer 0: group actions, 159 | S₃ permuting three coordinates | (12)(23)e₁=e₂ whereas (23)(12)e₁=e₃; these values persist in Λₙ³ and O³. | Pass; nonabelian action must retain order. |
| Layer 0: derived completion, 160–163 | K=ℤ, Qℓ and ℤ/ℓ | Completions are O, 0 and ℤ/ℓ; for the last, each derived reduction has Tor in degree −1 as well as H⁰. | Pass; do not use ordinary tensor universally. |
| Layer 0: recovery/conservativity, 164 | K=O versus K=Q | O/ℓⁿ=Λₙ detects O; Q⊗ᴸΛₙ=0 for all n despite Q≠0. Q is not derived complete. | Pass; completeness essential. |
| Layer 0: small limits, 166 | Countable module quotient tower | lim Λₙ=O is a type in the coefficient universe; its cardinality need not be finite. | Pass on this model; sheaf universe comparisons still need owners. |
| Layer 1: normalized-system definition, 170–180 | Constant tower; ranks 1 then 2 | Λₙ₊₁⊗ᴸΛₙ=Λₙ; Λ₂²⊗ᴸΛ₁=Λ₁²≠Λ₁. | Pass; these are missing positive/negative Checks. |
| Layer 1: morphisms/equivalences, 184 | Multiplication by 1 and by ℓ on O | 1 reduces to an isomorphism at every n; ℓ reduces to zero at n=1 and is not invertible. | Pass; excludes the wrong zero map. |
| Layer 1: shifts, 185 | O[1] | H⁻¹(O[1])=O and H⁰=0; reductions give Λₙ[1] with the same degree. | Pass; pin this shift convention in README. |
| Layer 1: cones/triangles, 185 | Cone of ℓ:O→O | H⁰=O/ℓ, H⁻¹=0 integrally; modulo ℓ the two-term complex has H⁻¹=H⁰=𝔽ℓ. | Pass; derived reduction retains Tor. |
| Layer 1: truncations, 185 | Cₙ=[Λₙ —ℓ→ Λₙ], degrees −1,0 | τ≥0 C₂=𝔽ℓ; Torᵢ^(Λ₂)(𝔽ℓ,𝔽ℓ)=𝔽ℓ for all i≥0. It is not in Dᵇ_ctf(Λ₂). | Specify transported/normalized truncation; R06. |
| Layer 1: tensor, 186 | O/ℓ⊗ᴸO/ℓ | H⁻¹=𝔽ℓ and H⁰=𝔽ℓ, not only a degree-zero tensor. Uniform amplitude is [−1,0]. | Pass; use derived tensor. |
| Layer 1: internal Hom, 186 | RHom(O/ℓ,O) | H⁰=0, H¹=𝔽ℓ; O/ℓ has a length-one finite free resolution. | Pass on perfect source; specify the sheaf-perfect domain. |
| Layer 1: pullback, 187 | Identity; geometric point of constant rank-two system | id*Λₙ²=Λₙ²; the stalk rank is 2 before and after reduction. | Pass. |
| Layer 1: finite actions, 188 | C₂ swapping a pair, also ℓ=2 | Swap matrix squared=I; its reduction modulo 2 remains a nontrivial swap, not an averaged projector. | Pass without inverting group order. |
| Layer 1: Tate twists, 189 | q=2, ℓ=3, n=2; twists 1 and −1 | Geometric scalars are 5 and 2 modulo 9; product=10=1 mod 9 for twist 0. | Pass; explicit convention Check missing. |
| Layer 1: constant system, 190 | Ranks 0,1,2 | Limits 0,O,O² and reductions 0,Λₙ,Λₙ²; the zero system cannot model the unit. | Pass. |
| Layer 1: lisse rank, 191 | Rank-one monodromy −1 at ℓ=3 | On the double cover the stalk is Λₙ; loop acts by −1, which is 2 mod 3, not the trivial 1. | Pass; retain nonconstant lisse examples. |
| Layer 1: normalization, 192 | Kernel of ×ℓ on Λₙ | Each kernel has ℓ elements, but its transition to the preceding kernel is zero; stable image=0, matching ker(ℓ:O→O)=0. | Pass; termwise kernels are not normalized kernels. |
| Layer 1: reduction functors, 193 | O/ℓ as a perfect O-complex | Derived mod-ℓ has H⁻¹=H⁰=𝔽ℓ; ordinary quotient has H⁰ only. | Pass; use derived reduction. |
| Layer 1: all reductions conservative, 194 | Complete O; noncomplete Q | O⊗ᴸΛ₁=𝔽ℓ≠0; Q⊗ᴸΛₙ=0 for every n but Q≠0. | Pass with completeness. |
| Layer 1: uniform-bound membership, 196 | Constant O and O[2] | Their reductions have intervals [0,0] and [−2,−2], independent of n. Direct sum has a common interval [−2,0]. | Pass; bounds are existential, not chosen data. |
| Layer 2: primitive realization, 200 | Constant and zero tower on geometric point | Rlim Λₙ=O[0]; Rlim 0=0. Both agree with global cohomology there. | Pass; duplicate owner R01. |
| Layer 2: ordinary RΓ comparison, 205–206 | Geometric point; 𝔾ₘ constant tower | Both sides have (H⁰,H¹)=(O,0) for the point and (O,O(−1)) for 𝔾ₘ. | Pass examples; nonproper finiteness input R03. |
| Layer 2: support construction/comparison, 209–214 | Point; 𝔸¹ | Required outputs are O[0] and O(−1)[−2]; finite reductions are Λₙ[0] and Λₙ(−1)[−2]. Neither integral output is a finite-torsion coefficient. | Supplier-domain failure; R02. |
| Layer 2: reduction, 220 | Constant O at point, n=1,2 | O⊗ᴸΛ₁=Λ₁ and O⊗ᴸΛ₂=Λ₂; no negative Tor for this free object. | Pass. |
| Layer 2: long exact/Milnor sequences, 221 | 0→O —ℓ→ O→𝔽ℓ→0 | Kernel of ×ℓ is 0, cokernel 𝔽ℓ; derived mod ℓ introduces an adjacent 𝔽ℓ Tor group. | Pass; retain connecting maps. |
| Layer 2: functoriality, 222 | Coefficients multiplied by 2 then 3 | Composite on O is ×6=×3∘×2, with the same value mod every ℓⁿ. | Pass. |
| Layer 2: coefficient change, 223 | O→Λ₂→Λ₁ on O² | Both paths give Λ₁², rank 2; an underived change on torsion need not do so. | Pass for displayed free object. |
| Layer 2: cup/tensor, 224 | Degree-one classes x,y on 𝔾ₘ² | x∪y generates O(−2) in degree 2; y∪x=−x∪y. At ℓ=3 modulo 3, scalars 1 and 2 differ. | Pass; sign witness belongs in README. |
| Layer 2: group actions, 225 | S₃ acting on three geometric points | H⁰=O³ with permutation action; a transposition has trace 1, a 3-cycle trace 0. | Pass; nonabelian witness. |
| Layer 2: proper/support compatibility, 226 | 𝔓¹→point | RΓ=RΓc=O[0]⊕O(−1)[−2]; their mod-ℓⁿ reductions give the same two Λₙ summands. | Pass proper case; extension needed in R02. |
| Layer 3: site morphism/direction, 230 | Identity object X→X | ν:X_proet→X_et; ν* sends Λₙ to Λₙ. The unit on sections sends 1↦1, not to 0. | Pass; source/target must remain explicit. |
| Layer 3: stalks/lissity/constructibility, 232 | Rank-one nontrivial double-cover local system | Each stalk is Λₙ and monodromy −1 before and after ν*; replacing it by a constant system changes −1 to 1. | Pass. |
| Layer 3: cohomology comparison, 235–237 | Geometric point and constant Λ₂ | Both sites give H⁰=Λ₂ and Hⁱ=0 for i>0. | Pass; source Corollary 5.1.6 supports general bounded-below comparison. |
| Layer 3: support comparison, 240 | 𝔸¹, finite Λ₂ | Both support theories must give H²c=Λ₂(−1), all other degrees zero. | Pass finite-coefficient instance. |
| Layer 3: direct-image/pullback/tensor/twists, 240 | Two-point finite étale map; rank-one twist | Pushforward stalk=Λₙ², pullback preserves each Λₙ, and twisting multiplies each coordinate by q⁻¹. | Pass on this finite map; list separate domains in R06. |
| Layer 4: three coefficient models, 244–250 | Geometric point; connected versus two-component U | Each model has sections O on the point and O² on two components. Continuous functions are componentwise constants there. | Pass; completion is part of the middle model. |
| Layer 4: reduction of ellAdicSheaf, 250 | Point, ℓ=2, n=1,2 | O/2=ℤ/2 and O/4=ℤ/4; finite sheaf ranks are 1 on both sides. | Pass. |
| Layer 4: lisse extension, 252 | Double-cover local system with monodromy −1 | Inverse-limit monodromy remains −1 in O; each reduction is −1 in Λₙ. | Pass; constant-only comparison would fail. |
| Layer 4: constructible extension, 252 | Skyscraper O at one closed point of 𝔸¹ | Stalks at support/complement are O and 0; reductions are Λₙ and 0 on both sites. | Pass. |
| Layer 5: constant derived comparison, 256–262 | Point and 𝔓¹ | Both sides give O[0] and O[0]⊕O(−1)[−2], respectively. | Pass examples; R01 ownership. |
| Layer 5: general system comparison, 264 | C=O/ℓ supported at a geometric point | Integral H⁰=𝔽ℓ on both sides; derived reduction modulo ℓ has H⁻¹=H⁰=𝔽ℓ on both. | Pass; torsion is included. |
| Layer 5: degreewise equivalences, 268 | 𝔓¹, i=0,1,2,3 | Groups on both sides: O,0,O(−1),0. | Pass. |
| Layer 5: support comparison, 269 | 𝔾ₘ | H⁰c=0, H¹c=O, H²c=O(−1) on both adic theories; ordinary H⁰=O is different. | Pass values; R02 construction. |
| Layer 5: proper/smooth compatibility, 270 | 𝔓¹ over k extended to separably closed k′ | Ranks in degrees 0,1,2 stay 1,0,1 on either path through comparison/base change. | Pass. |
| Layer 5: cup/Künneth compatibility, 271 | 𝔓¹×𝔓¹ | Even-degree ranks 1,2,1; h₁h₂ is the degree-4 generator on either side; h₁²=h₂²=0. | Pass. |
| Layer 5: Galois/finite-group compatibility, 272 | Two points swapped by Frobenius and C₂ | Both actions are matrix [[0,1],[1,0]], hence commute; trace=0, square=I. | Pass with descended equivariant coefficients. |
| Layer 5: reduction compatibility, 273 | Point O, modulo ℓ² then ℓ | 1↦1↦1 equals direct reduction; zero object stays zero. | Pass. |
| Layer 6: smallness, 281 and 287 | Point, empty scheme, 𝔾ₘ | Small models: O in degree 0 at point; zero for empty scheme; O(−1) in degree 1 for 𝔾ₘ. | Pass models; statable missing headline R04. |
| Layer 6: finite generation, 282 | 𝔓¹ and 𝔾ₘ | Ordinary ranks are (1,0,1) and (1,1); support ranks for 𝔾ₘ are (0,1,1). | Pass; ordinary supplier missing R03. |
| Layer 6: boundedness, 283 | Geometric point versus excluded Spec ℝ at ℓ=2 | Point: Hⁱ=0 for i>0. Over ℝ: integral H^(2r)=ℤ/2 for r≥1 and H^(2r+1)=0. | Pass only with stated geometric-base hypothesis. |
| Layer 6: perfectness, 284 | Point with O/ℓ; constant 𝔓¹ | O/ℓ has free resolution [O —ℓ→ O]; 𝔓¹ has two rank-one free summands in degrees 0 and 2. | Pass; perfect does not mean free cohomology. |
| Layer 6: ordinary derived reduction, 285 | Point with O/ℓ | Both sides have H⁻¹=H⁰=𝔽ℓ modulo ℓ; taking an ordinary quotient on the left would omit H⁻¹. | Pass. |
| Layer 6: support derived reduction, 285 | 𝔸¹ with constant O | Both sides have only H²c=Λₙ(−1). At n=1 this has ℓ elements in the one-dimensional stalk. | Pass with adic support construction R02. |
| Layer 7: rational realization definition, 291–300 | Point with O and O/ℓ | O⊗Q=Q; (O/ℓ)⊗Q=0, agreeing with degreewise rationalization. | Pass; torsion must vanish. |
| Layer 7: finite dimension/cohomology, 300 | 𝔾ₘ compact supports | Dimensions in degrees 0,1,2 are 0,1,1 before/after taking cohomology and scalar extension. | Pass on geometric domain. |
| Layer 7: scalar-extension functor, 304 | Multiplication by ℓ on O | It is noninvertible over O but becomes an isomorphism on Q with inverse ℓ⁻¹. | Pass. |
| Layer 7: integral lattice independence, 305 | L=O and L′=ℓO inside Q | Q⊗L=Q=Q⊗L′ via their specified inclusions; the inclusion matrix ℓ becomes invertible. | Pass; specify identification with the rational object. |
| Layer 7: tensor/duals/twists/Hom, 306 | Q(1) and its dual | Dual=Q(−1), tensor=Q(0), geometric scalars q⁻¹·q=1; Hom of lines has dimension 1. | Pass on finite-rank carriers. |
| Layer 7: characteristic polynomial/trace/determinant, 307 | F=diag(1,q) on Q² | charpoly=(T−1)(T−q); trace=1+q; determinant=q; det(1−TF)=(1−T)(1−qT). Rank zero gives trace 0, determinant 1. | Pass; distinguish both polynomial conventions. |
| Layer 7: support Künneth, 308 | 𝔸¹×𝔸¹ | Q(−1)[−2]⊗Q(−1)[−2]=Q(−2)[−4]; geometric trace=q² on either side. | Pass. |
| Layer 7: rational category boundary, 310 | Torsion O/ℓ and integral O | Rationalization identifies the former with 0 and the latter with a nonzero line; a category retaining torsion unchanged is wrong. | Pass; does not assert every lisse rational object has a global lisse lattice. |
| Layer 8: action construction, 314–320 | X=𝔸¹ over 𝔽₂; descended constant coefficients | H²c=Q₃(−1) with geometric multiplier 2. A geometric skyscraper at a∈𝔽₄∖𝔽₂ is moved to a²≠a and has no descent isomorphism. | Pass for coefficients over X; make descent explicit in contract. |
| Layer 8: finite-level/limit continuity, 324 | Finite étale degree-2 scheme over 𝔽₂ | Frobenius acts by swap at every level; its square=I and the kernel contains open subgroup 2ℤ̂. | Pass. |
| Layer 8: functoriality, 325 | Two-point scheme→point, constant pullback | Pullback sends a↦(a,a); swap(a,a)=(a,a), equal to pulling back the trivial point action. | Pass. |
| Layer 8: triangle/tensor/twist equivariance, 326 | Multiplication by ℓ on O(1) | Frob·ℓ=ℓ·Frob=ℓq⁻¹; tensor with O(−1) has product multiplier 1. | Pass. |
| Layer 8: field restriction, 327 | 𝔽₂⊂𝔽₄ on Q₃(1) | Geometric multiplier changes from 1/2 to (1/2)²=1/4; modulo 9 it changes from 5 to 7. | Pass. |
| Layer 8: change of closure, 328 | Permutation representation, transpositions conjugate in S₃ | Matrices conjugate; both have trace 1, determinant −1 and eigenvalues 1,1,−1. | Pass; equality needs a chosen identification, invariants do not. |
| Layer 8: arithmetic/geometric Frobenius, 329–330 | q=2 on O₃(1) | Arithmetic=2, geometric=1/2; modulo 9 they are 2 and 5 with product 1. | Pass; sibling convention agrees. |
| Layer 8: rational finite-dimensional representations, 331 | Finite étale scheme of degree m=0,1,2 | Dimensions are 0,1,2; for the degree-2 nonsplit case trace(F)=0 and trace(F²)=2. | Pass; no q=1 finite field is admitted. |
| Layer 8: pinned Tate convention, 333 | q=3, ℓ=2, n=3 | Arithmetic=3 and geometric=3 mod 8 (3·3=1); at q=2, ℓ=3, n=2 they instead differ: 2 versus 5. | Pass; the second witness actually distinguishes inverse conventions. |
| Layer 9: proper base change, 339 | 𝔓¹ in a constant family | Geometric fibre ranks 1,0,1 on both sides; H²=O(−1). | Pass; specify completed pullback source/target. |
| Layer 9: smooth base change, 340 | Smooth projection base change and constant rank-one coefficient | Pullback of O has stalk O before/after pushforward for the identity proper map; unit section 1 maps to 1. | Pass instance; full theorem needs the actual cartesian square and smooth leg. |
| Layer 9: Rf! base change, 341 | 𝔸¹ over k, extend to separably closed k′ | Both geometric support complexes are O(−1)[−2]. | Pass instance; R02 operation contract. |
| Layer 9: constructibility/lissity, 342 | Proper closed immersion {0}→𝔸¹ | R⁰i*O has stalk O at 0 and 0 elsewhere: constructible but not lisse. Smooth-proper constant 𝔓¹ has constant ranks 1,0,1. | Specify distinct hypotheses; do not infer lissity from constructibility. |
| Layer 9: projection formula, 343 | 𝔸¹→point, external free coefficient O² | Both sides are O²(−1)[−2], rank 2 in degree 2. | Pass; state exact coefficient domain. |
| Layer 9: ordinary Künneth, 344 | 𝔾ₘ² | Ordinary cohomology ranks 1,2,1 with twists 0,−1,−2; equals tensor of two (O[0]⊕O(−1)[−1]) complexes. | Pass; nonproper ordinary finiteness R03. |
| Layer 9: support Künneth, 344 | 𝔾ₘ² | Support ranks in degrees 2,3,4 are 1,2,1; alternating geometric trace=1−2q+q²=(q−1)². | Pass; sign differs from an unsigned sum. |
| Layer 10: topological realization definition, 350 | Point and ℂ× with constant finite systems | Point realizes O[0]; ℂ×≃S¹ has H⁰=H¹=O. Rlim of Λₙ cochains gives the same groups. | Pass; topological system needs its own named carrier. |
| Layer 10: integral Artin comparison, 353–355 | 𝔾ₘ/ℂ and Spec ℂ[ε]/(ε²) | 𝔾ₘ has integral ranks (1,1) on both sides; the nonreduced point has ranks (1,0,0,…), as does its one-point analytification. | Pass; nilpotents do not introduce extra cohomology. |
| Layer 10: compact-support Artin comparison, 358 | 𝔸¹/ℂ | Étale H²c=O(−1); topological H²c(ℂ,O)=O after forgetting arithmetic twist, and all other degrees vanish. | Pass. |
| Layer 10: rational Artin comparison, 358 | 𝔾ₘ/ℂ | After tensoring, ordinary dimensions are (1,1), support dimensions (0,1,1) on both sides. | Pass. |
| Layer 10: singular-cohomology corollary, 360–368 | ℂ×≃S¹; ℙ¹(ℂ)≃S² | Singular Betti numbers are (1,1) and (1,0,1), agreeing with geometric étale dimensions. | Pass; source is geometric X, not an arbitrary unrelated topological space. |
| Layer 10: naturality/products/cups, 370 | z↦z² on ℂ× and product of two circles | On H¹ the map is ×2 on each theory; on the two-factor cup generator it is ×4. Swapping factors introduces −1. | Pass. |
| Layer 10: group actions/integral lattices, 370 | z↦z⁻¹ on ℂ×, lattice O⊂Q | H¹ multiplier=−1 on singular and étale cohomology; it preserves O and extends to the same −1 on Q. | Pass. |
| Summit, 372 | Point; 𝔾ₘ/𝔽₂ geometrically, ℓ=3 | Point: rank 1 in degree 0. 𝔾ₘ: ordinary ranks (1,1), support ranks (0,1,1), geometric support trace −1+2=1. | Pass geometric examples; R01–R05 prevent certification of package. |
| Acceptance 1, 376 | Geometric point; empty scheme | Point H⁰=O, Hⁱ>0=0; empty scheme all groups=0. | Pass; no invented minimum dimension. |
| Acceptance 2, 377 | Continuous coefficient, n=1,2 | O/ℓ=Λ₁; O/ℓ²=Λ₂. | Pass. |
| Acceptance 3, 378 | μ_(3ⁿ) tower over 𝔽₂ | Transition ζ↦ζ³; geometric action is 2⁻¹, equal to 5 mod 9, not 2. | Pass; roots-of-unity transition direction matters. |
| Acceptance 4, 379 | 𝔓¹ at finite, integral, rational coefficients | Ranks 1,0,1 at every stage; H² coefficient is Λₙ(−1), O(−1), Q(−1), respectively. | Pass. |
| Acceptance 5, 380 | Spec 𝔽₄ over 𝔽₂ versus two split points | Nonsplit F has trace 0, F² trace 2; split F has trace 2 already. Both spaces have dimension 2. | Pass; distinguishes split from nonsplit. |
| Acceptance 6, 381 | 𝔾ₘ/ℂ, ℓ=2, n=2 | Both H⁰ and H¹ reduce from O to ℤ/4; higher ordinary cohomology is zero. | Pass. |
| Acceptance 7, 382 | Native EllAdicCohomology carrier on point | Carrier lives in Type (u+1); O is a Type u model in degree 0 and 0 is a Type u model above degree 0. | Pass model; native theorem is absent, R04. |

The negative controls were not silently excluded: noncomplete Q, arithmetic Spec ℝ, nontrivial finite monodromy, a non-descending geometric skyscraper, torsion with adjacent Tor, a nonproper scheme, and levelwise truncation are all represented explicitly. Zero and nonzero rings are distinguished by the prime and field assumptions; ℓ=0,1 and a field with q=1 are not legal inputs. Purely inseparable base extensions and square-zero thickenings leave the prime-to-characteristic étale theory unchanged; for a point their computed H⁰ remains O and higher groups remain zero. Denominators q and ℓ are used only in their stated rational/unit settings. No assertion about weights or bounds on eigenvalues is inferred.

## Not verifiable

- **Exact Summit locator:** no theorem number or printed page is supplied. The source sample could be checked only ingredient by ingredient, as recorded above; it cannot be certified at an absent locator (R05).
- **Milne, Étale Cohomology (1980):** the sources service found no legal text through bibliographic resolution. It remains recorded under `milne-etale` in the job’s missing-reference list. The README supplies no chapter/theorem/page. No contents of this book are asserted here.
- **SGA 4½, Cohomologie étale (1977):** the sources service classified the bibliographic citation as uncertified/paywalled. No text certification is claimed and no further missing-text request is made for it. An initially checked institutional scan was a different SGA volume and was discarded as evidence.
- **Full unquantified operation lists:** phrases such as tensor compatibility “under completeness hypotheses” and “standard” adic base change do not fix theorem signatures. The table checks explicit instances; it does not certify every possible interpretation of those phrases. R06 requests exact domains and maps.
- **Tau Ceti pin:** none is present in this head’s manifest. Therefore no claim that a construction is absent from, or present in, a pinned Tau Ceti library has been made.
- **Open work without supplied files:** not independently checked for ownership. Main’s directly read ownership contract already proves R01; no verdict rests on an unseen open proposal.

The review is complete despite these source limitations. They are disclosed here rather than guessed or used to park the verdict.

## Source issues

- none
