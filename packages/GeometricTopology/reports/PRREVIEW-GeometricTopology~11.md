# Review of GeometricTopology (pull request #1517 at 2559c13)

**Verdict:** needs changes

Previous-review reconciliation was performed first. The supplied previous report is headed **PR #903 at 6f8b64f**, not this PR/head, and discusses 17 declarations and 25 companion Lean files absent here. Its assertions cannot be carried forward as evidence for this checkout:

| Previous finding | Passage checked at this head | Disposition |
|---|---|---|
| R01, build/module advisory | Suggested.lean:1, `import Mathlib` | Not reproduced: worker build=0; direct elaboration exits 0 with no diagnostics. No repair inferred from the unrelated history. |
| R02, companion files | Suggested.lean:58–62, empty namespace; folder file listing | Not applicable: the named companion Lean files do not exist here. No `#print axioms` or submodule import is present in the sole Lean file. |
| R03, `From Completed.HopfRinow` | README.md:647, “Hopf--Rinow roadmap … Layer 1” | Not applicable: that heading is absent. The actual relative link is stale after archival; the supplier still resolves by name on main and its Layer 1 supplies the connection. Fix the link to Completed/HopfRinow while adding exact contracts. |

There was no supplied repair report marking a finding “not actionable in this package”. No settled finding is re-raised. All findings below were checked against this head independently.

## R01 (P1) — The Euler-class target reverses the conjecture and fails on a small sphere

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:826–836`: “a witness foliation violating it”.

**Claim:** Thurston proved the norm bound for taut foliations. The counterexamples concern integral norm-one classes which are not Euler classes of any taut foliation. Moreover, the displayed predicate uses −χ on every embedded surface, making its negation automatic.

**Witness:** A small sphere bounding a ball has [S]=0, hence |⟨e,[S]⟩|=0, while −χ(S)=−2. See gabai-yazdi lines 21–29, 49–60, 81–90, 111–114.

**Repair and retest:** Replace the target by Yazdi’s even integral dual-norm-one class not realized by any cooriented taut foliation, with the source’s regularity. Own the norm/pairing inputs. Keep the true χ₋ bound: sphere 0≤0, genus-2 leaf 2=2. Correct the authorship; cite Main Theorem, arXiv:1603.03822v4, p.3.

## R02 (P1) — PL embeddings need not be locally flat

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:333`: “Smooth and PL embeddings are locally flat”.

**Claim:** The unrestricted PL implication is false in codimension two, precisely where this roadmap uses slice discs.

**Witness:** The cone on a polygonal trefoil is a PL disc in B⁴. Its punctured local complement has trefoil group ⟨a,b | a²=b³⟩, not ℤ; daverman-venema lines 1373–1403.

**Repair and retest:** Keep smooth local flatness with boundary/neat hypotheses. For PL embeddings impose local unknottedness or the source’s codimension restriction. Add linear disk (local complement group ℤ) and trefoil cone (nonabelian group) as positive/negative Checks; see Daverman–Venema §1.2, Theorem1.2.1, p.29.

## R03 (P1) — The proposed circle carrier drops immersion

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:491`: “{ f : C^∞(S¹, M) // IsEmbedding f }”.

**Claim:** A smooth map which is a topological embedding need not be a smooth embedding. The newly named carrier disagrees with the implementation the PR intends to follow.

**Witness:** f(eⁱᵗ)=eⁱ⁽ᵗ⁻ˢⁱⁿᵗ⁾ is a smooth circle homeomorphism, but its derivative at t=0 is 0. Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72 requires both immersion and embedding.

**Repair and retest:** Consume native `TauCeti.SmoothCircleEmbedding` and `SmoothLinkEmbedding`, including `singletonEquiv`; do not redeclare them. The standard circle passes immersion, the stalled parametrization fails, and identical link components fail disjointness.

## R04 (P1) — Arbitrary boundary-piece gluing can be non-Hausdorff

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:216–223`: “codimension-0 submanifold-with-corners A ⊆ ∂M”.

**Claim:** No closedness/properness, neatness, or compatible collar condition is imposed. This class of gluings does not always produce a manifold.

**Witness:** Glue two closed upper half-planes along the open positive boundary ray by identity. The two origins remain distinct, but every pair of their quotient neighbourhoods intersects along that ray.

**Repair and retest:** Require closed, properly embedded collared boundary faces, matching dimensions and compatible corner strata/collars. Prove separation of the quotient. The open ray fails closedness; full-boundary gluing and compatible closed intervals remain admissible.

## R05 (P1) — The concordance endpoint uses a mirror where it needs a boundary sign

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:624–625`: “boundary Σ = K ⊔ K'.mirror”.

**Claim:** In the fixed product S³×[0,1], a concordance has endpoints K and K′, with opposite induced boundary orientations. Reflection of the ambient S³ is the mirror operation and is not the boundary-orientation reversal. The prose also incorrectly identifies concordance with a specialization of isotopy.

**Witness:** For a trefoil T, σ(T)=−2 and σ(mirror T)=2. An annulus between these endpoints cannot exist, so the displayed relation fails T~T. Livingston Definition 2.1: livingston lines 118–132.

**Repair and retest:** Define endpoint restrictions K at 0 and K′ at 1, with induced boundary −K⊔K′. Reserve reverse-mirror for the group inverse. The trefoil cylinder proves reflexivity; signature still excludes T~mirror(T). Define concordance separately from level-preserving isotopy.

## R06 (P1) — The JSJ object omits the condition which makes it canonical

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:729–745`: “existence and canonicity (up to isotopy)”.

**Claim:** Disjoint incompressible tori with Seifert-or-atoroidal complementary pieces do not determine the JSJ family without minimality.

**Witness:** For T³, the empty family works. One coordinate T² also works, cutting to T²×I, a Seifert manifold. Family cardinalities 0 and 1 cannot be related by isotopy; hatcher3 lines 531–535.

**Repair and retest:** Require minimality under deletion, and state uniqueness only for minimal families under compact orientable irreducible hypotheses. This selects the empty family for T³. Cite Hatcher §1.2, Theorem1.9, p.14; handle S¹×S² separately.

## R07 (P1) — The simplicial link signature and zero-dimensional recursion are wrong

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:927–928`: “link (K) (σ : K.faces) : AbstractSimplicialComplex ι”.

**Claim:** A link cannot generally retain every vertex of K. Also, natural subtraction n−1 makes the proposed link criterion wrong for n=0. This contradicts the README’s own correct explanation of vertex-type restrictions at lines 872–874.

**Witness:** For the one-vertex 0-ball, its vertex link is empty. AbstractSimplicialComplex on that same one-vertex type forces its singleton face (Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:154–156). At n=0, n−1=0, but the empty link is neither a 0-ball nor a 0-sphere.

**Repair and retest:** Use the actual link vertex subtype or `PreAbstractSimplicialComplex`; add a 0-manifold base clause or augmented (−1)-sphere. Retest point/edge-endpoint/interior-vertex links: empty/one/two points. Restrict the boundary-simplex sphere formula to n≥1 unless augmented.

## R08 (P1) — The diffeomorphism headlines confuse components and homotopy equivalence

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1056`: “π₀(Diff S³) = 0”; `TauCetiRoadmap/GeometricTopology/Suggested.lean:43`: “≃ₜ*”.

**Claim:** The full diffeomorphism group has orientation-reversing elements. Cerf’s connectedness result concerns the orientation-preserving component. Smale’s theorem is about the canonical inclusion being a homotopy equivalence, not a topological group isomorphism.

**Witness:** Identity has degree +1; reflection has degree −1. They cannot be isotopic. Thus π₀Diff(S³) has two components, matching π₀O(4), not one. TauCeti/Geometry/Diffeomorphism/Smale.lean:46–49 pins the inclusion.

**Repair and retest:** State Cerf as π₀Diff⁺(S³)=0 or π₀Diff(S³)≅ℤ/2. Use the native canonical-inclusion `SmaleConjecture`, not a topological-group isomorphism. Identity/reflection remain distinct components and match determinant ±1.

## R09 (P1) — The roadmap explicitly creates two-way supply with CombinatorialHeegaardFloer

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:35–39`: “there-to-here for the definitions and here-to-there for the invariants”.

**Claim:** The named dependency is a roadmap-level cycle, even if the definitions precede the invariants within their own layers. The contract requires a single direction of supply.

**Witness:** CombinatorialHeegaardFloer on main, README.md:225–237 (Lane K), consumes GeometricTopology Layer 4. GeometricTopology README.md:592–618 consumes its τ back. The directed edges are GT→CHF and CHF→GT.

**Repair and retest:** Keep knot/concordance foundations here; move CHF-dependent applications to a downstream GeometricTopology Part II or another named downstream owner. Remove the return supplier edge, including in the docstring. The repaired graph has GT→CHF only.

## R10 (P1) — Several prerequisites are attributed to sections which do not supply them

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:775`: “consume layer 3's surface mapping classes”; also lines 355–357, 595–618, 735–750, 767–770.

**Claim:** Layer 3 has no surface mapping-class construction; Layer 1 defines connected sum but not prime-decomposition existence/uniqueness or surface classification. Topological normal bundles are merely flagged. CombinatorialHeegaardFloer does not supply Rasmussen s. No declared gaps assign these missing contracts.

**Witness:** Layer 3 ends at line 413 without mapping classes. Layer 1 ends at line 293 without prime decomposition. CHF’s Lane G provides τ and Lane K grid reconciliation; searching that file finds no Rasmussen or s-invariant target.

**Repair and retest:** Own the missing mapping-class, prime-decomposition and required normal-neighbourhood inputs, or cite actual earlier contracts; declare precise external gaps where needed. Remove the nonexistent s supplier. SL₂(ℤ) for T² and the prime-but-reducible S¹×S² test the missing distinctions.

## R11 (P1) — The fake-RP⁴ unlock assumes an impossible smoothing

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:292–293`: “a smooth structure on a fake RP⁴”.

**Claim:** The starred manifold in Kirby Problem 4.82 is not just an arbitrary exotic smooth RP⁴. Its Kirby–Siebenmann invariant is opposite to that of RP⁴, so it cannot be a smooth summand. It is also nonorientable, outside the connected-sum interface stated here.

**Witness:** kirby lines 6812–6827, printed pp.225–226: ks(⋆RP⁴)=1, ks(⋆CP²)=1, and ks(their connected sum)=0. A smooth summand would require ks=0.

**Repair and retest:** Construct the starred topological manifolds and their nonorientable topological sum; cite the exact smoothing theorem for the sum. Neither summand can be assumed smooth. Obstruction arithmetic is 1+1=0 mod2; vanishing alone is not a dimension-4 smoothing proof.

## R12 (P2) — The geometric-structure definition admits orbifolds and applies to the wrong pieces

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:727–728,735–747`: “M = X / Γ for a discrete Γ ≤ Isom X”.

**Claim:** Discreteness alone does not make the quotient a manifold. Also, compact JSJ pieces with torus boundary are not complete quotients of the boundaryless model X; the geometric metric belongs to the interior, with the appropriate geometric decomposition.

**Witness:** Γ=⟨−Id⟩ acts discretely on ℝ³ but fixes 0; its quotient link is ℝP², not S². A nonempty-boundary cut piece has ∂≠∅, whereas a free quotient of X has ∂=∅.

**Repair and retest:** Require a free properly discontinuous action and specify completeness/volume. Apply geometricity to interiors of correctly cut pieces. The reflection quotient fails freeness; T²×I is compared via its interior. Distinguish JSJ from geometric decomposition.

## R13 (P2) — Statable headline theorems are absent from Suggested.lean

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:29–35`: “there are no compiled targets to state against the pin yet”.

**Claim:** The file contains no declarations, but the pinned Tau Ceti has concrete carriers and propositions for several advertised deep results. Waiting for those types is unnecessary.

**Witness:** At Tau Ceti a91d3aaf: SmaleConjecture (Geometry/Diffeomorphism/Smale.lean:46), AnnulusConjecture (Geometry/Manifold/LocallyFlat/Annulus.lean:105), TriangulationConjecture (Topology/TriangulationConjecture.lean:74). A scratch file stated all three headlines and elaborated successfully.

**Repair and retest:** State supported headlines using individual pinned Tau Ceti imports. Include Smale, annulus and Manolescu for every dimension≥5; audit the other native propositions listed below. Name genuinely missing carriers individually. Three scratch theorem statements already elaborate; do not substitute Checks.

## R14 (P2) — The build list replans objects already supplied at the pin

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:377–386,431–438,664–684,865–897`: “What to build”.

**Claim:** The inventory mostly surveys Mathlib and schedules foundational constructions without resolving Tau Ceti. Native circle/link presentations, Diff group/topology, curvature, hyperbolic metrics and triangulability already exist. Rebuilding them conflicts with the shared library.

**Witness:** TauCeti: KnotTheory/SmoothLink/Basic.lean:61,165; Geometry/Diffeomorphism/Group.lean:82; Geometry/Diffeomorphism/Topology.lean:85; Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean:148; Topology/Triangulable.lean:40. All are in the manifest pin, not newer main.

**Repair and retest:** Move existing objects and exact native APIs into Scope and ownership / Exact supplier contracts. Retain only distinguished extensions. Use native knots/links, Diff, curvature and triangulability. Preserve genuine GT ownership acknowledged by RiemannianGeometry and CharacteristicClasses; do not add reverse supplier edges.

## R15 (P2) — The Piccirillo unlock cites the wrong result and an unusable invariant

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:528–529`: “0-shake genus vs slice genus … via the Conway knot … τ”.

**Claim:** Problem 1.41 is resolved by Shake genus and slice genus, not by The Conway knot is not slice. The latter’s replacement-knot argument uses s, and explicitly says τ vanishes. The roadmap also never defines shake genus or its trace carrier.

**Witness:** piccirillo lines 101–104: the replacement knot has τ=0; lines 209–215 give s=2. piccirillo-shake lines 65–68 state the distinct trace/slice-genus result and Corollary 1.2 resolving Problem 1.41.

**Repair and retest:** Separate shake genus (arXiv:1803.09834v2, Corollary1.2) from Conway non-sliceness (arXiv:1808.02923v1, Theorem1.1). Define trace/shake genus. Assign s applications downstream of a genuine supplier. The replacement knot has τ bound0 but s bound1, so τ cannot perform this obstruction.

## R16 (P2) — Standing hypotheses and advertised generality are not fixed

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:69–75,762–779`: “Every closed 3-manifold splits into two handlebodies”.

**Claim:** The manifold convention supplies no separation, countability, nonemptiness or dimension range; standard handlebodies require a connected orientable closed 3-manifold. The general Diff(M) scope is also narrowed to compact M and leaves noncompact M as an unstated later choice. “Haken” and an oriented foliation plane field need explicit irreducibility/essentiality and orientation assumptions.

**Witness:** ℝP²×S¹ is closed nonorientable and has no splitting into ordinary orientable handlebodies. A small S² has injective trivial π₁ but cannot make every 3-manifold Haken. ChartedSpace alone has no T2 or nonempty field (Mathlib/Geometry/Manifold/ChartedSpace.lean:141).

**Repair and retest:** Pin Hausdorff second-countable finite-dimensional real conventions and per-theorem orientation, connectedness and boundary assumptions. Specify essential Haken surfaces and oriented foliation planes. Give noncompact weak Whitney theory a target. Exclude empty M from Weeks minimality (volume0); exclude nonorientable M from ordinary Heegaard splitting.

## R17 (P2) — Alexander normalization does not determine the sign

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:519`: “Δ_K(t) = Δ_K(t⁻¹), Δ_unknot = 1”.

**Claim:** These two equations do not fix the sign for a general knot. Pinning two additional knot values does not fix it on every other knot, including the Alexander-one knots in Freedman’s headline.

**Witness:** For an unlisted Alexander-one knot, both +1 and −1 satisfy symmetry; the convention only constrains the unknot, trefoil and figure-eight. The negative choice makes the hypothesis Δ=1 depend on an arbitrary sign.

**Repair and retest:** Add ΔK(1)=1 for every knot and the Conway/skein convention. Then +1 passes and −1 fails for Alexander-one knots. Treat link normalization separately, including empty and multi-component links.

## R18 (P2) — Computational algorithms are part of the promised deliverable

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:479–487`: “multiple algorithms for the same invariant”.

**Claim:** The binding scope is mathematical library theory, whereas this target repeatedly asks for algorithms and evaluates completion through their execution.

**Witness:** Lines 481–487 prescribe multiple algorithms; line 978 requires computation by the Layer-4 algorithm. This is explicit scope, not just a small illustrative example.

**Repair and retest:** Retain invariant definitions through Seifert forms, skein relations and representations, their invariance and comparison theorems. Delete executable algorithms from scope. Keep trefoil/figure-eight values t−1+t⁻¹ and −t+3−t⁻¹ as mathematical Checks.

## R19 (P2) — The README incorporates copied source passages

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:1004–1010`: “essential statements quoted with attribution”; “verbatim statements”.

**Claim:** The README adopts an in-repository extract collection as its references, contrary to the own-words/no-source-passages rule. This is independent of whether a quotation might qualify for fair use.

**Witness:** TauCetiRoadmap/GeometricTopology/references/README.md:3–7 describes verbatim extracts; references/lee-smooth-collar.md has three quoted source paragraphs under “Key statements (quoted)”.

**Repair and retest:** Remove the copied-source collection and its links. State the mathematics in original prose with edition/theorem/page locators and legal links. The collar target can cite Lee Theorem9.25, p.222, without copying paragraphs. The separate stray-files finding records the gate-required deletion.

## R20 (P2) — Completion means stating theorems rather than proving the owned library

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:11–15`: “state (not prove) these theorems faithfully”.

**Claim:** The task contract makes Suggested.lean an acceptance test for headline theorems the finished roadmap will prove. This README instead repeatedly defines success as elaborating statements, and includes Zeeman’s open conjecture among proposed theorem targets.

**Witness:** Lines 991–994 test only that each target elaborates; lines 940–941 explicitly call Zeeman open and “stated”. A sorry-only declaration can meet that criterion without proving any result.

**Repair and retest:** Make completion require proofs of owned constructions and solved milestones, with named proof inputs. State Zeeman as a precise open-conjecture proposition, not an admitted headline theorem promising its proof. Distinguish it from the proved Manolescu result; extensions beyond existing ownership belong in Part II.

## R21 (P2) — Zeeman is missing finiteness and a triangulation convention

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:921–933`: “for a contractible 2-complex K”.

**Claim:** The cited conjecture is for finite complexes, with the PL product understood through a suitable triangulation/subdivision. The unrestricted statement admits infinite contractible complexes and does not specify what simplicial product is being collapsed.

**Witness:** The locally finite triangulated plane is contractible and has infinitely many triangles. Its product with I cannot become one vertex through finitely many elementary collapses. Kirby Problem 5.2 explicitly says finite (kirby lines 7883–7884).

**Repair and retest:** Require finite contractible two-dimensional K and a specified existence of suitable product triangulation/subdivision with a finite collapse sequence. Infinite plane is excluded; finite disk passes. Keep the conjecture as a proposition rather than silently promising a solution.

## R22 (P3) — Definitions lack local APIs, discriminating Checks and exact target locators

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:201–280,969–994`: “Acceptance criteria (checks along the way)”.

**Claim:** The seven global acceptance bullets do not provide three discriminating Checks for each definition. Layers lack per-target Needs, Examples and Dependencies, and many theorem citations are just books or problem numbers. Scope/ownership and exact supplier contracts are absent; the introduction has no Summary paragraph.

**Witness:** For Slope (lines 550–556), there is no definition-local API or Checks; no *Needs:* line occurs anywhere. Gluing, HyperbolicMetric, JSJDecomposition and Collapsible have the same shortfall. Layer headings are level three under one umbrella section.

**Repair and retest:** Restructure into required headings. Give every definition its API and three discriminating Checks, every theorem hypotheses/locator, every layer dependencies/examples. Slopes test ∞=(1,0),0=(0,1), rejection of (2,0). Resolve Group.rank at the pin. Keep these Checks out of Suggested.lean.

## R23 (P3) — The gate rejects process residue

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:547`: “layer-4-to-layer-5 handoff that lean-eval lacks”.

**Claim:** The worker’s gate at the requested head reports residue=1. There is also broader process wording in the introduction, far-horizon discussion and module docstring.

**Witness:** gate.md: residue (1), line 547. The failure rule explicitly includes “handoff”.

**Repair and retest:** Replace the process sentence with the mathematical dependency: the link exterior uses Layer1’s tubular neighbourhood. Remove other process narrative. The replacement has no prohibited “handoff” wording; rerun the scanner.

## R24 (P3) — The gate rejects the references directory as stray files

**Location:** `TauCetiRoadmap/GeometricTopology/references/`, referenced at `TauCetiRoadmap/GeometricTopology/README.md:1004`.

**Claim:** The roadmap folder contains a non-roadmap subdirectory disallowed by the gate.

**Witness:** gate.md: stray-files (1): TauCetiRoadmap/GeometricTopology/references/: not a roadmap file. The directory contains 28 Markdown files.

**Repair and retest:** Delete it; sources are the README’s references. Replace incoming links with bibliographic locators/legal URLs. Retest that the directory is absent and stray-files=0.

## R25 (P3) — Kirby numbers identify different problems

**Location:** `TauCetiRoadmap/GeometricTopology/README.md:412,583,1059,1096`: “Smale conjecture … [Kir97, Problem 4.34]”; “Property R … 1.82”.

**Claim:** Problem 4.34 concerns Diff(S⁴), not Hatcher’s Diff(S³). Problem 1.82 is generalized Property R for links, not the already proved knot case. These locators can mislead implementers about both the dimension and whether a result is solved.

**Witness:** kirby line 5950 (printed p.199) asks about Diff(S⁴) and O(5). Lines 1638–1645 (p.60) explicitly distinguish the link generalization from Gabai’s knot theorem and refer the latter to Problem 1.17.

**Repair and retest:** Cite Hatcher directly for S³; associate 4.34/4.126(C) with S⁴. Cite the knot Property R entry (1.16 in the author-posted list) and Gabai directly; do not call generalized 1.82 solved. Retest dimensions3/4 and component counts1/2. Correct the Lean comment too.

## Verified sound

Read all 1,189 README and 62 Lean lines, eleven layers and seven acceptance Checks. Repeated seed labels were covered at every occurrence: gluing 201–254, comparison 276–280/947–967, conventions 509–520 and all build/supplier/design/unlock blocks. The rows certify instances, not proofs or inaccessible locators.

Exact head confirmed; clean worktree, empty outside-folder diff. Worker targeted build passed; direct Lean elaboration exited0 without diagnostics. The file has **zero declarations**, one `import Mathlib`, no sorry-data, options or admitted examples. Binder-loss, name-collision and one-tactic-padding audits therefore have zero entries. This build proves no theorem.

A scratch probe imported nine pinned Tau Ceti modules, checked full signatures and stated Smale, annulus in arbitrary dimension and nontriangulation in dimension5: nine successful checks, three expected sorry warnings, no errors. Required object files were present.

The worker's gate is **failing**, with `residue=1`, `stray-files=1`, `build=0`, `depcheck=0`, `outside-folder=0`; every other reported scanner count is zero. Both failures have findings above. A passing build is not a passing gate.

The separately executed dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1495 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. This does not override the explicit two-way CHF dependency verified in the prose. There are no `*Needs:*` lines and no declared supplier gaps. The citation resolver found no unresolved roadmap references; it explicitly did not check pinned-library names, so the pin audit below was performed directly.

**Computed adversarial pass: 92 rows.** Rows compute test instances; they do not prove the deep results. Repairs refer to the numbered findings.

| Statement / README location | Instances and computed values on the two sides | Result; required change |
|---|---|---|
| Manifold convention, 69–75 | Empty atlas space: chart axioms true, number of points 0. Line with doubled origin: local dimension 1 at both origins, Hausdorff separation false. | R16. |
| Finite link carrier, 85–94 | n=0 gives empty union and 0 components; n=1 gives one circle; two identical circles give intersection S¹≠∅, disjoint circles give ∅. | R03/R14. |
| Isotopy versus concordance, 98–103 | A knot times I gives an annulus with χ=0. A nontrivial ribbon square knot has slice genus 0 but is not isotopic to the unknot (Alexander polynomial is (t−1+t⁻¹)²≠1). | R05. |
| Boundary dimension, 202–209 | Half-line dimension 1 has boundary a point, dimension 0. Half-plane dimension 2 has boundary ℝ, dimension 1. | R16. |
| Collar, 210–215 | At 0∈[0,1], c(0,t)=t for 0≤t<1/3; c(0,0)=0, interior t>0. At 1 use 1−t. | Contract/locator: R22. |
| Partial-face gluing, 216–223 | Two half-planes along x>0: two distinct origins, inseparable quotient neighbourhoods. Full boundary gluing: two half-planes give ℝ² with one seam. | R04. |
| Handle attachment, 219–221 | n=2,k=1: D¹×D¹ attaches along S⁰×D¹, two intervals. k=0: intended attaching region empty, but natural k−1=0 supplies S⁰, two points. | R16. |
| Tubular neighbourhood, 224–227 | Standard S¹⊂ℝ²: normal rank 1, small neighbourhood S¹×(−ε,ε). Identity ℝ→ℝ: normal rank 0, total space ℝ. | Contract/locator: R22. |
| Connected sum and disc choices, 228–254 | S² minus a disk is D²; two such pieces give S², χ=2+2−2=2. T²#S² has χ=0+2−2=0. | Contract/locator: R22. |
| PL local predicate, 258–268 | x↦abs(x) has two affine pieces; x↦x³ has nonconstant derivative on every open interval and no local affine subdivision. | The PL predicate distinguishes these. |
| PL groupoid operations, 261–269 | Identity slope 1; restrictions preserve slopes; composing slopes 2 and 3 gives 6; inverse slope 2 gives 1/2. | Local PL closure model retained. |
| PL→Top, smooth comparison, 270–280 | x↦x+x³ is a smooth diffeomorphism, derivative 1+3x²>0, but is not locally PL. A PL homeomorphism remains continuous. | R14/R22. |
| PL chart/combinatorial reconciliation, 285–290 | An interval endpoint has link one point (0-ball), interior vertex has two points (0-sphere); their charts are half-line/line respectively. | Instance agrees. |
| Starred smoothing unlock, 292–293 | ks(⋆RP⁴)=1, ks(⋆CP²)=1, connected-sum obstruction 1+1=0 in ℤ/2; smooth summand would require 0. | R11. |
| Local flatness predicate, 308–310 | Linear ℝ⊂ℝ³ has normal slice ℝ² and local complement π₁=ℤ. Cone on trefoil has local complement trefoil group, not ℤ. | Instance agrees. |
| Local-flat restriction, 315–316 | Restrict linear plane to an open disk: same codimension and slice ℝ²×{0}. Corestrict to a containing open ball locally: same slice. | Retained for stated open restrictions. |
| Local-flat homeomorphism invariance, 317–319 | Translate slice y=0 to y=1 and reflect x: inverse chart returns y=0; normal dimension stays 1. | Contract/locator: R22. |
| Local-flat product, 320–321 | ℝ→ℝ² twice gives ℝ²→ℝ⁴, normal dimension 1+1=2. Identity factor has codimension 0 and adds 0. | Retained. |
| Local-flat composition, 322–325 | Compatible inclusions ℝ→ℝ²→ℝ³ yield slice (x,0,0), codimension 1+1=2. | Contract/locator: R22. |
| Bicollar, 329–332 | Equator S¹⊂S² has two collar sides. Core circle of a Möbius strip has locally two sides but globally reverses them once. | Instance agrees. |
| Smooth/PL local flatness, 333–334 | Smooth linear disk: complement group ℤ. PL trefoil cone disk: group ⟨a,b∣a²=b³⟩, nonabelian. | R02. |
| Annulus theorem, 335–347 | Circles radius 1 and 2: map (u,t)↦(1+t)u gives radii [1,2], endpoints 1,2. Equal spheres give width 0 and fail disjointness. | Native API: R14. |
| Diff group, 378–379 | f(x)=x+1, f⁻¹(x)=x−1: both composites x. For reflections on a sphere, r²=id. | Native API: R14. |
| Weak Whitney topology, 380–387 | fₖ(θ)=θ+k⁻²sin(kθ): sup displacement k⁻²→0, derivative error k⁻¹→0, second-derivative error 1. | Instance agrees. |
| Relative Diff subgroup, 386–387 | Identity fixes every boundary point; rotation of D² by π sends boundary (1,0) to (−1,0). | Instance agrees. |
| Smooth-family map, 389–394 | Rotations by t give a smooth family and continuous group-valued map. Rotations by abs(t) are continuous but not differentiable at 0. | Instance agrees. |
| Orthogonal inclusion, 395–396 | Identity matrix degree +1; reflection degree −1; their square/composition laws agree as matrices and sphere diffeomorphisms. | Instance agrees. |
| Smale/Cerf, 404–413; 1056 | π₀O(4) has determinant values {−1,+1}; degree on Diff(S³) has the same two values. Full group components≠1. | R08/R25. |
| Watanabe, 406–409; 412–413 | A rationally nonzero class has infinite additive order: mγ≠0 for each integer m≠0. A torsion class maps to 0 after tensoring ℚ. | Contract/locator: R22. |
| Smooth circle presentation, 491 | Standard circle derivative (−sin t,cos t) has norm 1. Stalled reparametrization derivative at 0 has norm 0 despite being a homeomorphism. | R03. |
| Framing and forgetful maps, 438–445; 511–517 | Unknot with Seifert framing has linking 0; adding one blackboard kink changes framing to +1 but leaves unframed knot unchanged. | Contract/locator: R22. |
| Diagram/Gauss presentations, 439–441 | Gauss word 1212 has one symbol between the two occurrences of 1, violating the planar even-interlacement condition. Word 11 is a planar kink. | Contract/locator: R22. |
| Braids, closures and Markov moves, 439–454 | Identity 1-braid closes to unknot, 2-braid identity to 2-component unlink. σ₁ closes to unknot; σ₁² closes to Hopf link (2 components). | Instance agrees. |
| Reidemeister/framed equivalence, 448–454 | One type-I kink: underlying unknot unchanged, writhe 0→1. Removing type-II pair: writhe (+1)+(−1)=0. | Instance agrees. |
| Ambient-general versus classical presentations, 454–466 | Core loop in S¹×S² represents 1∈π₁=ℤ; every S³ loop represents 0∈π₁. | Instance agrees. |
| Seifert forms, 468–487 | For V=[[-1,0],[1,−1]], t⁻¹det(tV−Vᵀ)=t−1+t⁻¹, and signature(V+Vᵀ)=−2. Empty 0×0 form gives determinant 1, signature 0. | Instance agrees. |
| Alexander normalization, 519 | Trefoil Δ(1)=1, Δ(−1)=−3; figure-eight Δ(1)=1, Δ(−1)=5. For an unlisted knot ±Δ are both symmetric. | R17. |
| Kauffman/Jones normalization, 479–487; 509–520 | A positive kink multiplies bracket by −A³; factor (−A³)⁻ʷ cancels it. Unknot value becomes 1 before and after kink. | Contract/locator: R22. |
| Smooth/topological sliceness, 500–506; 530 | Unknot bounds standard disk, genus 0; trefoil signature magnitude 2 implies smooth genus≥1. Conway has Δ=1 and topological genus 0 but smooth genus>0. | Instance agrees. |
| Freedman headline, 530; 610–614 | Δunknot=1 and a standard locally flat disk exists; Δtrefoil=t−1+t⁻¹≠1, so it is excluded. Conway Δ=1 remains included topologically. | Native API: R14. |
| Shake genus / Conway, 528–529 | Replacement knot in Piccirillo: τ=0 supplies lower bound 0; s=2 supplies lower bound 1. | R15. |
| Link exterior, 545–548 | Empty link exterior S³ has 0 boundary tori; unknot exterior solid torus has 1; Hopf exterior T²×I has 2. | Native API: R14. |
| Slopes, 550–556 | (1,0)↦∞, (0,1)↦0; (−1,−1) and (1,1) give the same unoriented slope 1. (2,0) nonprimitive, gcd=2. | Instance agrees. |
| Dehn filling and lens spaces, 557–573 | Killing pμ+qλ in unknot exterior, where λ=0 in H₁, gives ℤ/p: p=0 gives ℤ; p=1 gives 0; p=2 gives ℤ/2. | Instance agrees. |
| General surgery interface, Layer 5 | n=3 circle surgery exchanges S¹×D² and D²×S¹, common boundary T². Dimension count 1+2=2+1=3. | Contract/locator: R22. |
| Property P, 577–584 | Meridional filling on any knot gives S³, π₁=1; exclude ∞. +1 surgery on unknot also gives S³; exclude unknot. | Instance agrees. |
| Property R, 577–584 | 0-surgery unknot: π₁=ℤ and H₂=ℤ. n-component 0-framed unlink: #ⁿ(S¹×S²), π₁=Fₙ (n=2 nonabelian). | R25. |
| 0-surgery concordance unlock, 584 | K=K′=unknot: same 0-surgery and concordant, both true. This does not witness the claimed failure for a distinct pair. | R22. |
| Chirally cosmetic unlock, 584 | ±1 fillings of unknot each give S³; orientation reversal gives an orientation-reversing identification. These exceptional trivial examples do not specify the intended nontrivial-knot theorem. | R22. |
| Concordance endpoints, 602–606; 624–625 | Cylinder on trefoil has endpoints T,T and boundary −T⊔T. Replacing endpoint by mirror changes signature −2→+2. | R05. |
| Concordance group, 602–606 | σ(T#T)=−4, so class 2[T]≠0. T#reverse-mirror(T) is ribbon, signature −2+2=0 and class 0. | Instance agrees. |
| Cobordism composition, 607–609 | Two cylinders concatenate to length 2, rescale to length 1. Euler characteristics of annuli: 0+0−χ(S¹)=0. | Instance agrees. |
| Tristram–Levine signature, 615–618 | Hermitian form (1−ω)V+(1−conj ω)Vᵀ: ω=1 gives zero/signature 0; ω=−1 gives 2(V+Vᵀ), trefoil signature −2. | Pins total-function value at 1 and sign. |
| Mutation, 619–620; 639 | Conway/KT have Δ=1; KT smooth slice genus 0, Conway smooth slice genus>0. Their smooth concordance classes differ. | Contract/locator: R22. |
| Homology-sphere concordance, 630–641 | Product S³×I has H₀=H₃=ℤ, H₁=H₂=0 and inclusions induce identity; arbitrary ambient change lacks this condition. | Contract/locator: R22. |
| Volume density, 664–670 | Metric diag(4,9) has determinant 36 and density 6; scaling n-dimensional metric by c² scales volume by cⁿ. Empty total mass 0. | Native API: R14. |
| Curvature, 671–679 | Euclidean connection has R=0; unit sphere sectional curvature +1; unit hyperbolic metric −1. Antisymmetry gives R(X,X)=0. | Native API: R14. |
| Hyperbolic metric, 680–684 | Scaling g to 4g changes sectional curvature −1 to −1/4 and 3-volume v to 8v. | Instance agrees. |
| Mostow/volume invariance, 685–700 | Isometry pulls metric back exactly, density factor 1; a degree-d finite cover has volume dv, generally not v. | Native API: R14. |
| Weeks construction/minimum, 695–710 | Whitehead-link filling coefficients (5,1),(5,2) define the reference manifold; volume≈0.9427. Empty manifold volume0<0.9427. | Contract/locator: R22. |
| Virtual fibering, 708 | An already fibered closed hyperbolic mapping torus uses identity cover of degree1; map on base S¹ still degree1. | Instance agrees. |
| Virtual Haken, 708 | A fiber of genus g≥2 has χ=2−2g≤−2 and injective nontrivial surface group; small sphere has π₁=0 yet bounds a ball. | Contract/locator: R22. |
| Eight geometries, 723–728 | S³ constant curvature +1, ℝ³ 0, H³ −1; S²×ℝ has tangent 2-planes with curvatures 1 and 0. | Instance agrees. |
| Quotient geometric structure, 727–728 | ℝ³/⟨−Id⟩ has origin isotropy order2 and link ℝP²; free ℤ³ translations yield T³ with isotropy1. | R12. |
| JSJ canonicity, 729–745 | T³ admits admissible torus-family cardinalities0 and1; both complements Seifert. | R06. |
| Geometrization with boundary, 735–758 | Cut T³ along a coordinate torus: T²×I has 2 boundary tori; its interior T²×(0,1) has none. | R12. |
| Prime versus irreducible, 750–754 | S¹×S² has π₁=ℤ and essential sphere {pt}×S²; it is prime but not irreducible. S³ has π₁=0 and is irreducible. | R10. |
| Poincaré consequence, 755–758 | S³: π₁=0; ℝP³: π₁=ℤ/2. A finite group is not the same as trivial. | Instance agrees. |
| Handlebody/splitting existence, 762–779 | Genus0 handlebody D³ has boundary S². Genus1 solid torus has boundary T². ℝP²×S¹ nonorientable cannot be union of ordinary orientable handlebodies along their connected boundary. | R16. |
| Genus minimum, 777–796 | S³ genera include0, minimum0; lens space ℝP³ minimum1. Empty subset of ℕ has no minimum witness. | Contract/locator: R22. |
| Rank bound, 780–790 | S³: 0≤0; ℝP³: 1≤1; T³: 3≤3. Group examples: rank(1)=0, rank(C₂)=1, rank(S₃)=2. | Instance agrees. |
| Li strict inequality, 790–800 | Paper constructs positive gap d=g−r≥1 and boundary sums with gap nd≥n; taking n=1 gives r<g. | Instance agrees. |
| Foliation/distribution, 813–818 | Horizontal planes in T³: rank2, corank1, brackets remain horizontal; transverse vertical circle meets every horizontal leaf. | Instance agrees. |
| Euler class and pairing, 819–825 | Trivial oriented plane bundle has e=0; TS² pairs to χ(S²)=2. Orientation reversal changes 2 to −2. | Instance agrees. |
| Euler bound, 826–837 | Small bounding sphere: left0, right−2, false. With χ₋:0≤0. Genus2 leaf: abs(−2)=2=χ₋. | R01. |
| Euler class-one nonrealization, 839–845 | Integral even class a has a mod2=0 and dual norm1. Yazdi produces such a class with number of realizing taut foliations0. | R01. |
| Realization, 865–868 | One vertex realizes a point; one edge realizes [0,1]; empty vertex type realizes ∅. | Instance agrees. |
| Realized maps, 869–871 | Edge coordinates (a,b), a+b=1: identity preserves (a,b); collapsing both vertices gives point coordinate a+b=1. | Contract/locator: R22. |
| Restriction vertex type, 871–874 | Restrict edge {0,1} to {0}: one vertex and one point. Keeping old carrier would force singleton{1} too. | Instance agrees. |
| Weak-topology compactness, 875–878 | Compact edge uses2 vertices; all vertices of an infinite discrete complex have open singleton cover with no finite subcover. | Contract/locator: R22. |
| Contiguity, 880–882 | Two endpoint maps into an edge give homotopy coordinate (1−t,t), endpoints (1,0),(0,1). Two distinct vertices in a discrete complex are not contiguous. | Correct discrimination. |
| Cone contraction, 881–882 | H(x,t)=(1−t)x+t·apex: H(x,0)=x, H(x,1)=apex, H(apex,t)=apex. | Instance agrees. |
| CW cells and order, 883–893 | One edge has2 zero-cells and1 one-cell. Order0<1 gives boundary v₁−v₀; reversing order gives v₀−v₁. | Instance agrees. |
| Cellular/simplicial boundary, 894–897 | ∂[012]=[12]−[02]+[01]; ∂²=(v₂−v₁)−(v₂−v₀)+(v₁−v₀)=0. | Correct alternating-sign convention. |
| General versus PL triangulation, 898–918 | Double suspension of the Poincaré homology sphere triangulates a topological S⁵; its distinguished links retain π₁ of order120, unlike simply connected sphere links. | Instance agrees. |
| Combinatorial base cases/link, 902–908; 927–928 | Point has empty vertex link; interval endpoint link1 point, interior link2 points. For n=0 natural n−1=0. | R07. |
| PL/combinatorial equivalence, 909–918 | Subdivision of an interval changes vertices2→3 and edges1→2 while preserving polyhedron[0,1] and the two boundary points. | Instance agrees. |
| Elementary collapse, 921 | Edge plus free endpoint collapses to remaining vertex: χ=(2−1)=1 before and1 after. Circle has χ=0 and cannot collapse to a pointχ=1. | Contract/locator: R22. |
| Zeeman, 921–933 | Finite disk×I has a collapsible triangulation and χ=1. Infinite triangulated plane×I has infinitely many simplices; finite collapses remove finitely many, never leave1. | R21. |
| Boundary-simplex Check, 989–990 | ∂Δ¹ gives2 points=S⁰; ∂Δ² gives circle=S¹. ∂Δ⁰=∅, whereas truncated exponent0−1=0 gives S⁰ with2 points. | R07. |
| Whitehead comparison, 953–959 | Smooth interval and subdivided PL interval have same underlying space; transition x+x³ remains smooth non-PL. | Instance agrees. |
| Kirby–Siebenmann comparison, 960–967 | Smooth/PL manifold has ks0; starred summands above have ks1. In dimension4, ks0 alone does not supply a smoothing. | Contract/locator: R22. |



**Headline inventory.** connected-sum well-definedness and starred-sum smoothability; collar/tubular and smooth/PL comparison theorems; annulus; Smale and Watanabe; equivalence of knot presentations; Freedman sliceness; the shake/slice-genus and Conway results; Dehn-surgery presentation and Property P/R; zero-surgery and chirally cosmetic counterexamples; concordance group, mutation and Levine; Mostow, virtual fibering/Haken and Weeks minimality; prime/JSJ decomposition and geometrization; Heegaard existence/rank bound and Li; the corrected Euler-class nonrealization result; realization/CW/PL comparison, Manolescu and the separately identified open Zeeman proposition. **None** is declared in Lean. Nine native proposition signatures and three theorem probes refute the blanket impossibility claim. Other headlines lack individual carrier audits; absence here does not establish absence at the pin. Unknot surgery/sphere-sum Checks cannot replace them.

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The 25 inspected API sites follow; findings and computed rows give their consequences.

- `Mathlib/Geometry/Manifold/ChartedSpace.lean:141` — `ChartedSpace`.
- `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72` — `IsSmoothEmbedding`.
- `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:51` — `PreAbstractSimplicialComplex`.
- `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:154` — `AbstractSimplicialComplex`.
- `Mathlib/GroupTheory/Rank.lean:33` — `Group.rank`, `rank_spec`, `rank_le`.
- `TauCeti/Geometry/Manifold/SmoothEmbedding/Basic.lean:68` — Native bundled smooth embedding and its embedding condition at 74.
- `TauCeti/KnotTheory/SmoothCircle.lean:118` — `SmoothCircleEmbedding`.
- `TauCeti/KnotTheory/SmoothLink/Basic.lean:61` — `singletonEquiv`.
- `TauCeti/Geometry/Manifold/LocallyFlat/Basic.lean:376` — Slice embedding on actual local models.
- `TauCeti/Geometry/Manifold/LocallyFlat/PL.lean:27` — Affine-graph slice example.
- `TauCeti/Geometry/Manifold/Boundary/Charts.lean:321` — Boundary manifold theorem with real half-space successor dimension and regularity hypotheses.
- `TauCeti/Geometry/Diffeomorphism/Group.lean:82` — `Diff`.
- `TauCeti/Geometry/Diffeomorphism/Topology.lean:85` — Real-body weak Whitney topology.
- `TauCeti/Geometry/Diffeomorphism/Smale.lean:46` — `SmaleConjecture`.
- `TauCeti/Geometry/Diffeomorphism/Disc.lean:77` — `WatanabeTheorem`.
- `TauCeti/Geometry/Manifold/LocallyFlat/Annulus.lean:105` — `AnnulusConjecture n`.
- `TauCeti/KnotTheory/Slice/Freedman.lean:64` — `FreedmanSliceTheorem`.
- `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Mostow.lean:72` — `MostowRigidity`.
- `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/VirtualFibering.lean:62` — `VirtualFiberingConjecture`.
- `TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/VirtualHaken.lean:65` — `VirtualHakenConjecture`.
- `TauCeti/LowDimTopology/Geometrization.lean:144` — `GeometrizationConjecture`.
- `TauCeti/Topology/Triangulable.lean:40` — Real-body existential realization/homeomorphism predicate.
- `TauCeti/Topology/TriangulationConjecture.lean:74` — `TriangulationConjecture n`.
- `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` — `riemannianVolume`.
- `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean:148` — `curvatureTensor`.

**Ownership and resolved citations.** Used `roadmaps grep`/`show` and object searches in pins, main, packages and supplied siblings: gluing, normals, local flatness, knots/concordance, PL/realization, Euler class, curvature/volume and Diff. Duplicate declared names:0. Native objects must be consumed; genuine extensions retain their established owner.

| Citation / ownership question | Resolved file and passage; result |
|---|---|
| DifferentialGeometry foliations | Main `TauCetiRoadmap/DifferentialGeometry/README.md:402–425`, Layer4: distributions/integrability/Frobenius. General foliation foundations belong there, codimension-one tautness here. |
| DifferentialGeometry corners | Same README:528, §5.5: abstract face boundary. Correct supplier subject; retain the actual hypotheses and distinguish ordinary boundary set. |
| DifferentialGeometry integration | Same README:923, §12.4: volume/measure bridge. No license to rebuild the native Riemannian measure. |
| HopfRinow connection | Main `Completed/HopfRinow/README.md:28–43,264–310`, Layer1: connection/regularity and native reuse. Correct object, archived relative link needs updating. |
| CombinatorialHeegaardFloer invariants | Main `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:190–201`, G6/G10: τ and slice bounds. No Rasmussen-s supplier; no reverse import into its foundational supplier. |
| CombinatorialHeegaardFloer presentations | Same README:225–237, LaneK consumes GT Layer4: confirms the cycle. Its open revision is not used in place of main as a new supplier. |
| AlgebraicTopology consumer | Main `TauCetiRoadmap/AlgebraicTopology/README.md:63–68`: GT triangulation/gluing interfaces are inputs. Preserve this direction. |
| ClassifyingSpaces consumer | Main `TauCetiRoadmap/ClassifyingSpaces/README.md:65`: polyhedron/realization inputs. Layer11 must provide a genuine continuous marked construction. |
| RiemannianGeometry ownership | Main `TauCetiRoadmap/RiemannianGeometry/README.md:72–82` explicitly leaves curvature/normal-bundle/geometric inputs to GT. The pinned implementation now supplies particular objects; do not add a reverse roadmap dependency. |
| CharacteristicClasses ownership | Main `TauCetiRoadmap/CharacteristicClasses/README.md:107–112`, comparison at 664: rank-two Euler target belongs here; other characteristic theory does not justify duplicating its own owners. |
| AlgebraicTopologyPartII open/board contract | `packages/AlgebraicTopologyPartII/README.md:112–114` and its supplied open folder consume GT Layer1's manifold bridge; orientation covers/flows/Sard remain DifferentialGeometry's. This is a consumer, not a missing GT supplier. |

Open-folder searches included TangentialBordism, FourManifolds, RiemannianGeometry, AlgebraicTopologyPartII and DeRhamCohomologyAndDuality. Existing-roadmap revisions are not new suppliers. Unavailable/unnamed checkouts are not certified. Name resolution does not certify nonexistent section contracts.

**Source-text verification.** These are inspected locators from legal source-service texts. Version numbers identify the copy read; no unverified published numbering is inferred.

| Source ID / version and locator | Lines inspected; what the text supports |
|---|---|
| `thurston-notes`, SLMath electronic v1.1, Theorems5.7.1–5.7.2, p.101 | 2530–2542: dimension≥3, completeness and finite volume; rigidity determines volume. This verifies the alternate lecture-note source, not Ratcliffe’s numbering. |
| `kirby`, author-posted K2 list, Problems1.15/1.16 | 394–446: Property P and knot Property R; not the generalized link question. |
| `kirby`, Problems1.19,1.31,1.41,1.53 | 514–521,611–618,754–760,921–925: exact zero-surgery/concordance questions, shake genus and mutation. A problem statement is not a resolving theorem. |
| `kirby`, Problems1.81/1.82, p.60 | 1601–1645: cosmetic-surgery distinctions and generalized Property R for links. |
| `kirby`, Problems3.45/3.51/3.60 | 3698–3718,4087–4104,4250–4274: geometry of interiors, virtual fibering, Weeks reference filling and volume question. |
| `kirby`, Problems4.34/4.126(C) | 5950,7491–7515: S⁴ questions, not Hatcher's S³ theorem. |
| `kirby`, Problem4.82, pp.225–226 | 6812–6827: starred manifolds and their nonzero Kirby–Siebenmann invariants. |
| `kirby`, Problem5.2, p.260 | 7883–7884: finite contractible two-complex in Zeeman's conjecture. |
| `daverman-venema`, §1.2, Theorem1.2.1, p.29 | 1373–1403: PL embedding local-flatness restrictions, particularly the codimension-two exclusion. |
| `hatcher3`, §1.2, Theorem1.9, p.14 | 531–539: uniqueness with minimality for torus decomposition. |
| `kronheimer-mrowka`, arXiv:math/0311489v5, Theorem2, p.296 | 54–55: nontrivial SO(3) representation after +1 surgery on nontrivial knot; reduction to other slopes at 71–76, p.297. |
| `livingston`, arXiv:math/0307077v4, Definition2.1/Theorem2.2 | 118–132: product-annulus concordance and its abelian group. Survey does not replace primary locators for later counterexamples. |
| `piccirillo`, arXiv:1808.02923v1, Theorem1.1 | 45–71,101–104,209–215: Conway non-sliceness, trace comparison, τ=0 and s=2. |
| `piccirillo-shake`, arXiv:1803.09834v2, Theorem1.1/Corollary1.2, p.2 | 65–84: separate shake/slice-genus result resolving Problem1.41; not the Conway theorem. |
| `levine`, arXiv:1405.1125v2, Theorem1.1/Remark1.5 | 31–33,135–142: homology-sphere obstruction and the ambient homology-cobordism distinction. |
| `watanabe`, arXiv:1812.02448v3, main theorem, p.1 | 32–35: positive-degree rational homotopy obstruction, not a π₀-only theorem. |
| `agol`, arXiv:1204.2810v1, Theorems9.1/9.2 as announced, p.1 | 27–30: closed aspherical virtual Haken and closed hyperbolic virtual fibering hypotheses. |
| `gmm-cusped`, arXiv:0705.4325v1, Corollary1.3, p.1 | 39–40: closed Weeks minimality is present in this primary paper; the README's source is not missing that consequence. |
| `gmm-mom`, arXiv:0910.5043v1, Theorem1.1, p.2 | 52–56: Weeks volume≈0.9427 and the two Whitehead-link fillings. |
| `li`, arXiv:1106.6302v2, Theorem1.1 | 25–31,66–68,236–239: rank bound, strict counterexamples and arbitrarily large gaps. |
| `gabai-yazdi`, arXiv:1603.03822v4, Main Theorem, p.3 | 21–29,49–60,81–90,111–114: χ₋ norm, valid Euler-class bound, parity, nonrealization of an even integral norm-one class. Author is Mehdi Yazdi. |
| `manolescu`, arXiv:1303.2354v4, Corollary1.3 | 68–73: nontriangulable manifolds in every dimension≥5. |
| `manolescu-survey`, arXiv:1607.08163v3 | 85–92,154–158: PL versus general triangulations and high-dimensional Kirby–Siebenmann scope. |

The Kirby copy is dated 22 December 1995; [Ruberman’s author page](https://sites.google.com/brandeis.edu/ruberman/home) identifies this file as the 1997 K2 list. Locators above use that copy’s printed pages; the publisher typesetting was not separately compared.

## Not verifiable

The source service attempted every cited work and the added shake-genus paper. These 25 works remain unreadable by the routes listed; their locators/hypotheses are **uncertified**. Attempts are saved in the scratch missing-reference list. No roadmap manifest was edited.

- **palais** — pp. 274–277; DOI 10.1090/s0002-9939-1960-0117741-0; no text.
- **hudson** — PL maps and manifolds; bibliographic search failed.
- **whitehead** — pp. 809–824; bibliographic search failed.
- **munkres** — Theorems 10.5, 10.6; service resolved a Monthly review, not the book; no book text.
- **kirby-siebenmann** — Essays IV–V; bibliographic search failed.
- **brown** — pp. 331–341; DOI 10.2307/1970177; no text.
- **kirby-annulus** — pp. 575–582; DOI 10.2307/1970652; no text.
- **quinn** — dimension 4 annulus theorem; DOI 10.4310/jdg/1214437139; no text.
- **freedman-quinn** — Theorem 11.7B; bibliographic search failed.
- **cerf** — Theoreme 1; bibliographic search failed.
- **hatcher-smale** — Smale theorem; author PDF request timed out.
- **burde-zieschang** — knot foundations and Seifert matrices; bibliographic search failed.
- **homfly** — pp. 239–246; DOI 10.1090/s0273-0979-1985-15361-3; no text.
- **birman** — Markov theorem and Burau representation; bibliographic search failed.
- **freedman** — Alexander polynomial one slice theorem; DOI 10.4310/jdg/1214437136; no text.
- **rolfsen** — Chapter 9; bibliographic search failed.
- **gompf-stipsicz** — Chapters 4–5; DOI 10.1090/gsm/020/05; no text.
- **gabai** — Property R; DOI 10.4310/jdg/1214441488; no text.
- **lee-riemannian** — volume and curvature; bibliographic search failed.
- **thurston** — hyperbolic structures; DOI 10.1515/9781400865321; no text.
- **ratcliffe** — Theorem 11.8.5; bibliographic search failed.
- **scott** — pp. 401–487; DOI 10.1112/blms/15.5.401; no text.
- **candel-conlon1** — foliations and leaves; bibliographic search failed.
- **candel-conlon2** — tautness; bibliographic search failed.
- **thurston-norm** — Euler class conjecture; bibliographic search failed.

Paywalled/uncertified locators (not renewed as missing-text requests):

- **hirsch** — Chapters 2, 4 section 6 Theorem 6.6; Theorems 6.1, 6.3; publisher DOI 10.1007/978-1-4684-9449-5, text unavailable.
- **lee-smooth** — Theorems 6.24, 9.25; publisher DOI 10.1007/978-1-4419-9982-5_1, text unavailable.
- **rourke-sanderson** — Chapters 1–3; publisher DOI 10.1007/978-3-642-81735-9, text unavailable.
- **lickorish** — Chapters 1, 3, 6, 8; Proposition 16.10; publisher DOI 10.1007/978-1-4612-0691-0, text unavailable.
- **kauffman** — pp. 395–407; publisher DOI 10.1016/0040-9383(87)90009-7, text unavailable.
- **moise** — Theorems 35.3, 36.2; publisher DOI 10.1007/978-1-4612-9906-6, text unavailable.
- **zeeman** — pp. 341–358; publisher DOI 10.1016/0040-9383(63)90014-4, text unavailable.

Lee metadata resolved a chapter, Munkres a review: neither verifies the cited textbook theorems.

Calegari, Scharlemann, Perelman’s three papers and Morgan–Tian were retrieved, but broad topic matches do not certify missing per-target locators/proof inputs. Smooth/PL uniqueness and unrestricted smoothing-obstruction claims remain uncertified where primary texts were unavailable.

## Source issues

- **Misprint** in kirby at Problem3.60(A), printed p.147: the source gives the Weeks volume as 0.9247…; it should be 0.9427…; affects a stated result. See kirby line4274 and gmm-mom lines52–56.
- **Misprint** in kirby at Problem1.82, printed p.60: the Property R cross-reference points to Problem1.17; it should be Problem1.16; affects nothing. See kirby lines425–426,448–456,1642–1644.
