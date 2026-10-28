# Triage report: TARGET-AnalyticStacks

**Verdict:** `design`, roadmap `AnalyticStacks`, no base. The brief is `packages/AnalyticStacks/target.md` and the sources are in `packages/AnalyticStacks/sources.toml` (17 entries, all certified). Nothing is missing, so no `needs-references.toml` is filed.

## Step 0: consolidation with the open targets and designs

I compared the target with each open job by the objects it plans, not by name.

- **DESIGN-RationalAnalyticPrismatization (#2025).** I read the triage file `packages/RationalAnalyticPrismatization/target.md`, its review and the design at the commit the review names (ab278cd, `design/README.md` and `plan.json`, through `git show`).
  - The design plans Gelfand rings and everything built on them. It explicitly does not plan the theory filed here. Its scope paragraph and its section "Required contracts with missing owners" assign that theory to a new roadmap AnalyticStacks, for an ordering reason: MotivesAndAlgebraicCyclesPartII and AutomorphicBundlesPartII consume it and sit earlier in the merge order.
  - The review's F01 (P1) blocks the design until such a roadmap exists.
  - So the two plans share a boundary but not a theory. Merging this target into that design would put the foundations after their earlier consumers, which is a supply-direction defect. No merge.
- **TARGET-ProetaleCohomologyOfPAdicCurvesAndTowers (#401).** I read its triage commit on the local branch. It covers Colmez–Dospinescu–Nizioł pro-étale cohomology of curves and Drinfeld spaces, and does not plan analytic rings, analytic stacks or six-functor formalisms. No overlap.
- **TARGET-RefinedTraceMethodsPartII (#415).** It is filed as "Hochschild, cyclotomic and refined trace methods, Part II", a continuation of RefinedTraceMethods. That roadmap supplies nuclear modules here (§6.2) and plans no analytic stacks. No overlap.

## Step 1: is the theory planned already?

**Searches.** I ran `roadmaps grep` over main and the 367 open heads for each of these objects:

- `analytic stack`, `six-functor|6-functor|six functor`, `Heyer`, `suave`, `Gestalt`;
- `Lucas Mann|Mann, `, `Liu.Zheng`, `correspondence category|Corr\(`;
- `Clausen`, `Rodr[ií]guez Camargo`;
- `nuclear module`, `Fredholm`, `Betti (stack|realization)`, `shear`, `Rees`;
- `Cartier dual`, the ♯-group symbols, and the `A¹/G_m` spellings.

I also grepped every README under `packages/` on the board, and read the five packages under review that bear on the question from their heads in `board-packages-index.txt` or by `roadmaps show`.

**Findings, by object.**

| Object | Where it appears | Owner? |
| --- | --- | --- |
| Abstract six-functor formalisms, construction and extension theorems, kernel category, suave/prim maps | Nowhere. "Heyer", "suave" and "Gestalt" have no match. DiamondSixOperations (#927) builds concrete étale `Rf_!` after ECD §§22–25, prime to p, with no abstract formalism. EnhancedDerivedSheaves (main) supplies mates, Kan extensions and presentability, and cites Liu–Zheng only in its bibliography. MotivesAndAlgebraicCyclesPartII asks for exactly this as `AnalyticStacks:AS.0` (`design/README.md` Interface 5). | none |
| Light analytic rings over a general base; ℚ_{p,■}; solid Huber rings | SolidAnalyticRings (#1458) §§7.1–7.3 plans sphere-linear analytic structures on connective solid ring spectra and the coefficient structures of discrete animated Huber pairs, "with no geometric localization-kernel assertion". VStackSheavesAndLisseCategories (#1230) VS2.2 plans κ-condensed analytic measures, `SolidECoefficients` for finite E/ℚ_p and `ZSolidAnalytification` of discrete rings. Neither plans the light animated notion of RCSolid Definition 4.1.1, complete Huber pairs, colimits and induced structures, or localizations of analytic rings. LocallyAnalyticRepresentationsOfLocalGroups requests E_■ and affinoid solid structures from "SolidAnalyticRings SA.2, SA.4", stages that do not exist in #1458. | suppliers and comparisons only |
| ∞-topos of analytic stacks, quasi-coherent six functors | Only VS2.2's Zariski gluing of ℤ-solid spectra of discrete rings (after BCGP Remark 2.4.1). | none for the general theory |
| Solid six operations on finite-type schemes | HigherHidaAndColemanTheory D1/solid-scheme-operations (board, head 5bb542d). It was placed there because its review found no AnalyticStacks owner, and the review offered "repoint to a roadmap that states them" as the alternative. | workaround in a late consumer; to be repointed |
| Betti stacks, condensed-anima six functors, classifying stacks of locally profinite groups | Nowhere as such. SmoothRepresentationsOfLocalGroups owns smooth representations and derived Hecke algebras (SR.0d.2). VS4.2 treats classifying v-stacks with étale and solid coefficients. | none |
| Nuclear modules | RefinedTraceMethods (#1493) §6.2 "Trace-class maps and nuclear solid modules", for E₁ rings in light solid spectra. | supplier: definitions imported; descent and the profinite-set identification are new |
| Fredholm analytic rings | Only in functional-analysis senses (operator Fredholmness) in other roadmaps. The analytic-ring notion appears nowhere. | none |
| Cotangent complex of analytic rings | EnhancedDerivedSheaves E5:cotangent-export.1 and DerivedModuleAlgebra §0.4 cover discrete animated rings only. | none for analytic rings |
| Analytic Cartier duality | Classical Cartier duality only: finite flat group schemes in many roadmaps; Tau Ceti `AffineGroupScheme/CartierDuality`; G_m^♯ and BG_m^♯ in PrismaticCohomologyPartII §§4.11–4.12. | none |
| Algebraic stacks as analytic stacks; graded/filtered modules; shearing | SchemeAndStackFoundations (main) §1.21 `lineBundleSectionStack` and §1.22 abelian `Stacks.QCoh`, with a Check that QCoh(BG) is comodules. No derived graded or filtered identification, no shearing (the `shear` hits are geometric shears and unrelated). | none |
| Solid Serre duality | Only HigherHida's workaround above. | none |

**Pinned libraries.**
- I listed the Mathlib tree at 6b7abb3. It has `Mathlib/Condensed/Light/*` (`LightCondensed` at `Basic.lean:28`, `LightCondMod` at `Module.lean:42`, read at the pin), `Mathlib/Condensed/Solid.lean` (`CondensedMod.IsSolid`, line 83), basic quasicategories and the naive cotangent complex. It has no analytic rings, no correspondences and no six-functor formalism.
- I listed the Tau Ceti tree at a91d3aa. It has classical Cartier duality for finite locally free group schemes and finite Hopf algebras, and nothing on condensed or solid objects, analytic stacks or six functors.

The theory is therefore not owned anywhere: not a duplicate.

## Step 2: new roadmap or Part II

The only candidate base is SolidAnalyticRings. Its direction is a sphere-linear coefficient library: light solid spectra, countable products and limits, completed coefficients, summability structures. Its scope paragraph keeps Huber-pair geometry and geometric localization out. AnalyticStacks goes elsewhere: animated analytic rings, stacks, six functors, smoothness and duality, Cartier duality. That is a new subject, not the next stage of SolidAnalyticRings, so the verdict is `design`.

The name AnalyticStacks is kept. It is unused by any roadmap, open pull request or package, and it is the name the consumers already cite: MotivesAndAlgebraicCyclesPartII AS.0–AS.1, HigherHidaAndColemanTheory AS.3, AutomorphicBundlesPartII G-solid, and RationalAnalyticPrismatization's six gaps. The suggested labels AS.0–AS.7 keep those citations meaningful.

## Step 3: generality

The filed wording is restricted to ℚ_p. The sources state the theory over arbitrary light analytic rings, or over an essentially small category of affinoid analytic stacks, and three of the four requesting consumers work over ℤ_■ or over discrete rings. The brief makes the general statements the targets:

- ℚ_{p,■} is the instance (ℚ_p, ℤ_p)_■ of solid Huber rings (RCSolid Definition 7.1.1; And21 Proposition 3.34).
- Analytic stacks are built relative to any admissible C₀ (RCSolid Definition 6.3.23; ABLB Definition 4.2.1).
- "Maps represented in smooth rigid spaces" is the rigid instance of RCSolid Theorems 7.7.1 and 7.7.21 for locally solid smooth maps of solid Huber rings (Corollary 7.7.23).
- Cartier duality is stated for all five ring stacks of RC26a Example 3.2.36, not only over ℚ_p.

Two corrections to the filed wording:

1. "Dualizing complex given by the shifted cotangent complex" is the shorthand of ALRS Remark 6.5.6 (ALRS line 8825). The theorem is f^!1 ≅ det(L)[dim f] (RCSolid line 6208). The two agree in relative dimension one.
2. RationalAnalyticPrismatization's contract attributes "Banach ℚ_p-algebras are Fredholm" to Sch24. Sch24 proves only the gaseous real cases (Propositions VI.1.8–VI.1.9), and CS22 Proposition 9.11 proves the liquid real case. The brief keeps the ℚ_p statement as a target and records the missing nonarchimedean locator as a risk.

Gestalten are not included, although the filer lists them as a known source. They are a separate theory (Gest Lectures II–IX: categories of categories, Stefanich rings, Gestalten). The filed statement does not mention them, and RationalAnalyticPrismatization's review offers a repair that avoids them. The brief records them as a boundary and says when a separate target would be needed.

## Step 5: suppliers, consumers, placement

**Suppliers.** These are on main or earlier in `merge-order/ORDER.txt`:

- SchemeAndStackFoundations (2), DerivedModuleAlgebra (7), AdicSpacesPartII (8) and EnhancedDerivedSheaves (17);
- SmoothRepresentationsOfLocalGroups (25) and LocallyAnalyticDistributions (76);
- DiamondSixOperations (90), for Checks only;
- VStackSheavesAndLisseCategories (144) and SolidAnalyticRings (145);
- RefinedTraceMethods (220);
- ProfiniteCohomology and RigidAnalyticGeometry, on main.

Every section label cited was located by heading at the supplier's head or on main: SmoothRepresentationsOfLocalGroups SR.0.2, SR.0.3, SR.1.1, SR.0d.1, SR.0d.2; RefinedTraceMethods §6.2 and §§4.1–4.3; DerivedModuleAlgebra §§0.4, 0.6, 0.12, 0.13, 0.K.1, 1.E.0; SchemeAndStackFoundations §§1.15, 1.18–1.22, 2.18; AdicSpacesPartII §§R0.1, R0.4–R0.8, R0.16, R1.1; LocallyAnalyticDistributions §0.1. `roadmaps resolve` on the brief reports no cross-roadmap citation and no Lean name found nowhere.

**Placement.** The last supplier is RefinedTraceMethods (220), for nuclear modules. The first requesting consumer is MotivesAndAlgebraicCyclesPartII (223). So the roadmap goes directly after line 220. I made no order edit.

**Consumers.** MotivesAndAlgebraicCyclesPartII (223), AutomorphicBundlesPartII (234), LocallyAnalyticRepresentationsOfLocalGroups (306), and RationalAnalyticPrismatization and HigherHidaAndColemanTheory, which are not yet ordered. The brief maps each consumer request, and each of RationalAnalyticPrismatization's six gap slugs, to an AS label.

## Step 6: sources

All sources were fetched through the sources service, from arXiv or the authors' pages:

- RCSolid, HM, SixFF, Man22 and ABLB;
- RC26a, RJRC, AM24, Sch24 and CS22;
- CSCond, CSAnal and And21;
- Mou, BZSV, ALRS and Gest.

Theorem numbers and lines were checked in the cached extractions for every locator in the brief. Version notes:

- Man22 is the v1 extraction. Proposition A.5.10 is at Man22 line 12675, and SixFF cites that proposition by the same number.
- RC26a is v3. Its Proposition 3.2.27 is what ALRS cites as "Theorem 3.2.27", which the RationalAnalyticPrismatization design also notes.
- Sch24 is the author's seminar draft.

The Clausen–Scholze course *Analytic stacks* named in the target has no written text. The service found no legal copy. Scholze's course page links only to recordings and a meeting room, and CSAnal cites the written version as a book in preparation ([CS26]). Every statement of the brief is located in RCSolid, the written account of the course, or in the other sources, so the course is not needed. I removed the request that the service had recorded for it, rather than park the job for a text that is not required. If an operator wants the course cited, it can be added when the book appears.

## Untrusted text

Nothing suspicious was found in the issue text, the board files, the pull-request contents or the fetched sources. No text asked for commands, credentials or changes outside this job.

## What this triage did not do

- It wrote no Lean and ran no Lean command.
- It did not read the external reference behind the uniqueness clause of RCSolid Corollary 6.3.4 (RCSolid line 4107). The brief leaves that clause to the design.
- It did not collate the arXiv versions of RCSolid and RC26a with any published version; none exists.
