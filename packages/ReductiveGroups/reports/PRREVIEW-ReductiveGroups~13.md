# Review of ReductiveGroups (pull request #1676 at e861250)

**Verdict:** needs changes

The thirteen findings below include eleven blocking findings. The review covers the README and all nine listed Lean files at `e8612506bcfaf8f006d80a2e6889cf590408b24d`. No pull-request file was changed. The diff outside `TauCetiRoadmap/ReductiveGroups/` is empty. The worker's gate passes, and both the targeted build and direct elaboration of `Suggested.lean` pass with only `sorry` warnings. Those checks do not establish the mathematical claims or make the eight unimported companion files conform to the Lean rules.

## Previous findings

These are the nine findings of the review at `b4b5bc5`, assessed individually before the full review. No repair report marking a finding “not actionable in this package” was supplied.

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01 reciprocal suppliers | README 1304 “Lang's theorem”; 2952 “This roadmap owns the based comparison”; 661 “This complex Lie-group dictionary is owned here” | The three offending README supplier edges were removed. The replacement repeats an independent supplier's topology construction (R07 below); obsolete companion references remain (R05). |
| R02 pinned embedding/linear-reductivity duplication | README 132 “Embedding theorem and faithfulness”; 917 “and is not restated. The target is the converse” | Repaired for the declarations identified previously. R08 below concerns a different pinned result. |
| R03 missing Borel and reductivity headlines | Suggested 151 `linearlyReductive_of_reductive`; 163 `exists_conjugate_eq_of_isBorelOverAlgClosed` | Repaired. Both signatures elaborate, with the necessary hypotheses. |
| R04 companion files | SpecialLinearCoordinateTargets 16 “noncomputable def coordinatePresentation”; CoverLiftTargets 31 “CoverLifts.LiftGroup” | Not repaired. All eight companions are unchanged since the reviewed head; R05 below. |
| R05 supposedly native covering comparison | README 1246 “Construct the covering homeomorphism” | Repaired: it is now a construction target, with covering and simply connectedness inputs. |
| R06 regular-fibre supplier | README 665 “Consume SmoothBundlesConnections B1.0 for regular fibres” | Repaired. B1.0 is the matching supplier. |
| R07 shape, dependencies, Checks, locators | README now has Examples and Dependencies for the layers; 2725 begins “10B. Induction, Weyl modules and simple heads” | Partly repaired. Several important theorem blocks still have no claim-level source locator; R12. Layer 1 adds a substantial target after its Dependencies section. |
| R08 docstring's missing carriers | Suggested 27 “sheaf … exist at the pin”; 42 “11B's finite Weyl-arrangement theorem” | Repaired for the quotient/arrangement distinctions identified previously. Newly owned 11A is still missing despite being statable; R09. |
| R09 CFSG ownership | README 2579 “Explicit carriers with numbered symmetries”; 3255 lists CFSG as a consumer | Repaired: the three exceptional carriers and numbered symmetries are specified here. |

## R01 (P1) — The radical is not the schematic neutral component of the centre

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:905`: “for reductive G the radical is the identity component of the centre and a torus”.

**Claim:** This identifies a smooth torus with a possibly nonreduced group scheme. The roadmap explicitly uses schematic centres and includes all characteristics.

**Witness:** Over an algebraically closed field of characteristic p, `R(SL_p)=1`, whereas `Z(SL_p)°=μ_p`, with coordinate algebra `k[ε]/(ε^p)`. It is connected of length p, not a torus. README 1862 supplies this same centre.

**Repair:** Identify the radical with the maximal central torus. Over an algebraically closed/perfect field identify it with `(Z(G)_red)°`; for arbitrary fields specify the descent of the geometric central torus rather than silently reducing an imperfect-field scheme. Keep the full schematic centre multiplicative type. Tests: the repaired expression gives `1` for `SL_p` and `G_m` for `GL₂`; the former expression gave `μ_p` for `SL_p`. Conrad's Theorem 3.3.4 supports the multiplicative-type centre, not the false equality (conrad line 4072).

## R02 (P1) — The orthogonal quotient Check uses the wrong side

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1126`: “GLₙ/Oₙ is Spec of the invariants of g ↦ gᵗg”.

**Claim:** The displayed map does not descend to the stated right-coset quotient. It descends to the left quotient `Oₙ\GLₙ`.

**Witness:** Over ℂ take `g=diag(2,1)` and `h=[[0,1],[1,0]]∈O₂`. Then `gᵗg=diag(4,1)`, but `(gh)ᵗ(gh)=diag(1,4)`, although `gO₂=ghO₂`.

**Repair:** Use `g↦ggᵗ` for `GLₙ/Oₙ`, and record the right-invariance equation `(gh)(gh)ᵗ=ggᵗ`. On the witness both values become `diag(4,1)`. Describe the target as the open subscheme of invertible symmetric matrices, not the entire affine space of symmetric matrices. Also label this disconnected-subgroup Check as the general reductive-subgroup extension: the preceding target assumes H connected, whereas Oₙ is disconnected, including O₁=μ₂.

## R03 (P1) — Layers 8 and 9 depend on one another

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1769`: “Layer 9's split models”; 2694: “Layers 0, 2, 3, 4, 7 and 8”.

**Claim:** Layer 8's existence/classification consumes the construction in Layer 9, while Layer 9 declares Layer 8 as an input. This is a layer-level cycle, even though the roadmap-level dependency checker does not report it.

**Witness:** README 1868 lists Layer 9 among Layer 8's dependencies; README 2694 lists Layer 8 among Layer 9's. README 1795 itself says the relative extension is not a prerequisite of Layer 9.

**Repair:** Move the needed definitions of split reductive groups/pinnings before the integral construction, cite their precise subsections at each Layer 9 target, and place existence/classification after that construction. Remove the blanket Layer 8 dependency. Test the A₁ route: define its root datum and pinning, construct `SL₂/ℤ`, then identify/classify it; constructing `SL₂` must not require its classification theorem.

## R04 (P2) — Lang's proof route cites a characteristic-zero comparison in characteristic p

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1314`: “Needs: 3A.4's closed orbits and 3A.5's orbit-map differential”.

**Claim:** The Lang statement is correct, but the cited differential input is the complex holomorphic submersion construction in 3A.5. Lines 670–684 explicitly use characteristic-zero separability and characteristic-zero stabilizer smoothness. They cannot supply the finite-field argument.

**Witness:** The map `G_m→G_m`, `t↦t^p`, is a surjective orbit map with derivative zero and stabilizer `μ_p`. Thus the generic orbit separability used in 3A.5 cannot be transported to characteristic p.

**Repair:** Give the finite-characteristic argument its own input: either the dimension-of-fibres theorem plus finite twisted stabilizers, as in Milne 17.96 (milne lines 15758–15766), or an algebraic full-rank argument using the proved equation `dF=0`. Specify the tangent trivializations: right translation from x makes the derivative `−id`; left translation gives `−Ad(x⁻¹)`. Test `G_a/F₂`: `L(t)=t²−t`, `dL=1`, and `L(θ)=1` in F₄. This proves the needed rank statement without assuming characteristic zero or generic separability for arbitrary actions.

## R05 (P2) — The companion files still contain admitted data and prohibited imports

**Location:** `TauCetiRoadmap/ReductiveGroups/SpecialLinearCoordinateTargets.lean:16`: “noncomputable def coordinatePresentation”; `CoverLiftTargets.lean:31`: “CoverLifts.LiftGroup”.

**Claim:** The Lean form rules apply to every listed file, not only the module built by the gate. The eight companion files are unchanged and retain admitted constructions, roadmap/Mathlib-submodule imports, duplicate definitions, and references to the deleted `CoverLifts` namespace.

**Witness:** `coordinatePresentation` ends in `sorry`; `CoverLifts.LiftGroup` and `CoverLifts.projection` have no definition in the folder. `CoverLiftTargets.lean:13` also rebuilds the pin's `TauCeti.BilinForm.isometryGroup` (Isometry.lean:153).

**Repair:** Delete the eight companion files, keeping their mathematical targets in the README. Transfer genuinely statable headline propositions into `Suggested.lean` with real elementary definitions; R09 identifies one such transfer. Do not transfer admitted data or API catalogues. Test: `Suggested.lean` imports none of the companions, so their deletion leaves its successful build unchanged and removes the unresolved `CoverLifts` references. This is the unrepaired substance of previous R04; removal of README links alone does not repair the files.

## R06 (P2) — Generic rational cohomology and cotensor induction already have an owner

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:386`: “Rational cohomology and algebraic induction”; 389: “prove that there are enough injectives”.

**Claim:** This block re-plans IntegralHeckeAndGaloisDeterminants §0.7, including its arbitrary-base construction, coface convention and induction dictionary. The main version of ReductiveGroups already consumes that section. The supplier is earlier and does not require ReductiveGroups for this block.

**Witness:** `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1144–1237`, §0.7 at its indexed head, gives the same injective embedding, Hochschild complex, cotensor equalizer, reciprocity, and antipode comparison of the two function conventions.

**Repair:** Restore an exact supplier contract for §0.7 and retain only the field/group-scheme adapters and applications specific to Layers 6A and 10B. Carry the supplier's flatness hypotheses on both Hopf algebras for its induction construction. Test: for `H=ℤ[t,t⁻¹]`, the weight-one differential is `1⊗(t−1)`; after coefficient-last transport it is `(t−1)⊗1`. For `Ind₁^{C₂}ℤ`, both constructions give rank two with the nonidentity element swapping the delta basis. These are the same objects, not variants requiring a new owner.

## R07 (P2) — The replacement complex topology duplicates ComplexComparisonPartII

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:645–655`: “prove the topology independent of the embedding … gives complex-manifold charts”.

**Claim:** ComplexComparisonPartII C−1.1 supplies exactly the classical topology, gluing, smooth charts, Hausdorffness and proper comparison now reconstructed here. Calling only the subsequent comparison its responsibility does not avoid two owners for the construction.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:777–792`, C−1.1 at its indexed head, identifies the affine zero-locus topology, glues it, constructs smooth manifold charts, and supplies the separated/proper comparisons; topological consumers use that same carrier.

**Repair:** Consume C−1.1 for the topology and charts. Keep the group/tangent dictionary, algebraic orbit smoothness, and the specific submersion/stabilizer comparison here; do not consume the downstream FormalConnectionsOpers construction. Test: both carriers give ℂ for A¹, the same polynomial map `z↦z²` on G_m, and one underlying point for `Spec ℂ[ε]/ε²`; the supplier additionally retains the nonreduced analytic ring sheaf.

## R08 (P2) — Relative reductivity is already defined and stable under base change at the pin

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1774`: “Define these fiberwise predicates … Prove invariance under isomorphism, arbitrary base change”.

**Claim:** The reductive Hopf-side predicate and these two properties are existing Tau Ceti results. The relative scheme/Hopf transport and further representability/descent targets can remain, but the existing construction must be cited.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38` defines `reductiveCommHopfAlgPropertyOver`; line 54 supplies isomorphism invariance; line 82 proves `.baseChange`, over every commutative ring, without a Noetherian hypothesis.

**Repair:** List these exact declarations in the Tau Ceti contract and delete their reproving targets. State separately the scheme-side comparison, semisimplicity, products, descent, centre and derived-group targets. Test the existing base-change theorem on `ℤ→F₂` and `ℤ→ℤ[ε]/ε²`; it permits both, so the consumed predicate must not be narrowed to reduced bases or fields.

## R09 (P2) — The newly owned plane-braid headline is statable but absent

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:2961`: “Prove the generator-characterized based isomorphism π₁(Conf_n(ℂ),[b]) ≃ TauCeti.BraidGroup n”; `Suggested.lean:41–47` lists only other Layer 11 endpoints.

**Claim:** The plane-configuration theorem and the nonsplitting theorem at README 2990 have native carriers. Neither appears in the acceptance module. They need no spectral quotient or constructed algebraic group.

**Witness:** A scratch probe using the companion's real ordered subtype, permutation action, orbit quotient and basepoint elaborated both the existence of the fundamental-group/braid equivalence and the nonsplitting proposition, with only two `sorry` warnings.

**Repair:** Keep those few real configuration definitions in `Suggested.lean` and state the plane-braid headline as an existence proposition; add the generator/cover comparison when its explicit paths are available, naming any genuinely missing refinement. State the native `permHom` nonsplitting theorem for `2≤n`. Do not use a `sorry`-defined equivalence. Test: `n=0,1` gives the trivial group; `n=2` gives `ℤ→C₂` by parity, with pure subgroup `2ℤ`, which has no section. The same probe needs only `import Mathlib` and `TauCeti.GroupTheory.SpecificGroups.Braid.Basic`.

## R10 (P2) — The S₃ representation Check needs a characteristic hypothesis

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:371`: “the two-dimensional irreducible representation is faithful”; 374: “dimension two, and its kernel is A₃”.

**Claim:** The standing field k is arbitrary. The assertions about irreducibility, tensor decomposition and sign are not valid in the small characteristics allowed by the roadmap.

**Witness:** In characteristic 3, the augmentation plane contains the invariant vector `(1,1,1)` and S₃ has no two-dimensional simple. In characteristic 2, `sign=1`, so its coefficient algebra has dimension 1 and kernel S₃.

**Repair:** State the positive Check over ℂ (or with suitable explicit characteristic restrictions), and keep the two failures as negative controls. Over ℂ the standard representation is faithful, its tensor square is `1⊕sign⊕V`, and the sign coefficient algebra has dimension 2 and kernel A₃. This changes the example, not the all-field library scope.

## R11 (P2) — The diagonalizable-group anti-equivalence also exists at the pin

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:778`: “the contravariant equivalence between finitely generated abelian groups M and diagonalizable groups”; `Suggested.lean:34`: “diagonalizable groups and tori as objects … no carrier”.

**Claim:** The diagonalizable group-scheme carrier and anti-equivalence are already present. Both the target and the docstring's absence claim overlook the pinned implementation.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean:110` defines `DiagonalizableGroupSchemeCat`; line 138 defines `TauCeti.DiagonalizableGroup.schemeEquivalence : FGCommGrpCatᵒᵖ ≌ DiagonalizableGroupSchemeCat k` for every field k, in k's universe.

**Repair:** Cite the native carrier, `schemeEquivalence`, and its `functorCompιIso` in the supplier contract; keep only additional exactness/descent statements not supplied there. Correct the docstring. Tests: the zero character group gives the trivial scheme, ℤ gives G_m, and ℤ/p gives μ_p even in characteristic p. The native definition requires neither smoothness nor reducedness, so these latter objects must not be discarded.

## R12 (P3) — Several theorem locators are missing or point to different results

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1478`: “Dudas–Michel, Propositions 7.5 and 7.7, p. 25”; 1317 “Fixed-coset lifting”; `Suggested.lean:161` cites Milne 17.10.

**Claim:** The Harish–Chandra citation is to fixed-point/orbit results, and the Borel-conjugacy citation is to maximal tori. Fixed-coset lifting has no attached source locator. Large new theorem blocks such as 10B's induced/Weyl-module classification and Steinberg module also have no claim-level locator.

**Witness:** Dudas–Michel 7.5 and 7.7 are on fixed points and rational orbits (dudas-michel lines 1141, 1159); biadjunction is 9.4, p. 36 (line 1634). Milne 17.9(b) is Borel conjugacy; 17.10 concerns tori.

**Repair:** Cite Dudas–Michel Definition 9.2, p. 35 and Proposition 9.4, p. 36 for the functors/biadjunction; Lemma 7.6(i), p. 25 for the algebraic fixed-coset specialization, explaining that the preceding abstract group argument proves the stated generalization; Milne 17.9(b), p. 354 for Borel conjugacy. Add exact locators at the other theorem claims, rather than relying on the bibliography. Test: the fixed-coset source needs no normality in (i), but does in (ii); retain that distinction. Supply a specific primary locator for the presentation in 11A: Fox–Neuwirth §7, pp. 123–126, is available legally and supports it.

## R13 (P3) — Three boundary Checks exclude neither zero nor trivial cases

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:802` uses `[[2,1],[0,2]]`; 934 describes `GLₙ` as not semisimple; 1727 excludes the identity Steinberg endomorphism because its fixed group is infinite.

**Claim:** These Checks silently assume, respectively, characteristic different from 2, positive rank, and a nontrivial connected group.

**Witness:** In characteristic 2 the matrix has determinant 0; `GL₀=1` is semisimple with radical 1; the identity of the trivial group is its Frobenius and has exactly one fixed point.

**Repair:** Put the Jordan example over ℚ, require `n>0` for the GLₙ example, and restrict the identity-endomorphism negative control to positive-dimensional groups. Add the three boundary values explicitly. The repaired Jordan factors are `2I` and `I+N/2`; the other two boundary values remain `1`, rather than `G_m` or an infinite fixed group.

## Verified sound

**Mechanical checks.** The worker's gate reports zero failures for its text scanners, dependency check and targeted build. Independently, `lake build TauCetiRoadmap.ReductiveGroups.Suggested` completed successfully (9134 tasks), and `lake env lean` on the original absolute file succeeded with eight `sorry` warnings. A scratch copy appended `#check @name` for all 15 declarations: seven definitions/abbreviations and eight theorems. All 15 printed successfully. In particular, the orbit statements retain smoothness, finite type and the relevant nonemptiness hypotheses; characteristic zero remains in the linear-reductivity theorem; algebraic closedness is part of `IsBorelOverAlgClosed` rather than a lost section variable. No signature correction was needed for these eight statements.

Each of the eight admitted theorems was tested in a copy with `simp`, `rfl` and `infer_instance`, accepting only complete solutions. All eight remained admitted. Reading the native conditional Borel theorem and the opposite-direction reductivity theorem also rules out those tempting one-lemma replacements. No padding finding is made against the eight retained statements. This does not certify the companions: their admitted data and catalogue contents are addressed by R05.

The independent dependency check printed exactly:

```text
depcheck: 204 roadmaps, 1559 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line at roadmap level. R03 is the explicit internal Layer 8/9 cycle, which this output does not detect. No declared supplier-gap plan was available. The scope is a revision of the existing ReductiveGroups library plan, not a replacement route; the original general Chevalley, rational-representation and small-characteristic scope remains. The new generic material with an existing owner is isolated in R06–R08 and R11; these are repairable by import/deferral, so the verdict is not “rejected”. No computational algorithm or copied source passage was identified in the reviewed prose.

**Headline inventory.** The README's deep endpoints are the three-way group dictionary and rational-representation dictionary; locally closed reduced orbits, boundary dimension and closed-orbit existence; Jordan/tori/unipotent structure; characteristic-zero complete reducibility and Levi complements; reductive coset affineness; Borel/tori conjugacy, parabolics, root extraction and Bruhat coordinates; Lang/fixed-coset and Steinberg results; Harish–Chandra biadjunction, Mackey and common-Levi independence; split/relative existence and classification; signed ADE cover/folding and integral PBW/Chevalley constructions; distribution/Frobenius contraction; highest-weight and Steinberg modules, Peter–Weyl and the SL₂ quotient; plane/arrangement braid and spectral-monodromy comparisons; and the SL coordinate presentation. Suggested states five orbit results, characteristic-zero reductivity ⇒ linear reductivity, Borel conjugacy, and the SL presentation. Its docstring names most of the missing geometric carriers. The plane-braid omission is demonstrated by elaboration, not inferred from an anticipated API (R09). The diagonalizable-carrier absence assertion is false (R11). Lang/Steinberg, Levi complements and Harish–Chandra endpoints should also be named explicitly in that docstring when explaining their unstated geometric/group interfaces.

**Pinned definitions and ownership.** Searches were by objects as well as declaration names, in both pinned libraries, main roadmaps, board package material and the indexed open roadmaps; the relevant owner texts were opened. The main checkout used was `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. Existing roadmaps were assessed on main; the new IHGD/ComplexComparisonPartII contracts were read at their indexed heads. RootSystems and ReflectionInvariantTheory on main supplied shape comparisons. The citation resolver's fourteen leads do not mean fourteen missing declarations: thirteen are this roadmap's own names; `Gassmann.almostConjugate_iff_permutation_equiv` is in InductionRestriction's Suggested, line 728.

The following are concrete pin/owner comparisons, not assumptions about newer libraries:

| Object inspected | File and locator | What it supplies / limit checked |
|---|---|---|
| Affine/Hopf dictionary | Mathlib `AlgebraicGeometry/Group/Affine.lean`, `hopfSpec.fullyFaithful`, `essImage_hopfSpec` | Affine group objects over Spec R; does not assert affineness of arbitrary homogeneous quotients. |
| Proper group commutativity | Mathlib `AlgebraicGeometry/Group/Abelian.lean`, `isCommMonObj_of_isProper_of_geometricallyIntegral` | Both properness and geometric integrality are hypotheses; constant S₃ is excluded. |
| Borel carrier | TauCeti `Algebra/AlgebraicGroup/Borel/Basic.lean:148` | Algebraic closedness and minimality of the smooth connected solvable quotient predicate. |
| Borel conjugacy at the pin | TauCeti `Algebra/AlgebraicGroup/Borel/Conjugation.lean:161` | Contains a conjugate-containment hypothesis; does not subsume Suggested's unconditional theorem. |
| Reductive carrier | TauCeti `Algebra/AlgebraicGroup/Reductive/Basic.lean:70`, iff at 80 | Smoothness, geometric connectedness and exclusion of smooth connected normal geometric unipotent subgroups. |
| Linear reductivity | TauCeti `Algebra/AlgebraicGroup/LinearlyReductive.lean:64` | Native finite-comodule complete reducibility, with its carrier-universe restriction. |
| Relative reductivity | TauCeti `Algebra/AlgebraicGroup/Reductive/Over.lean:38,54,82` | Predicate, isomorphism invariance and arbitrary base change; R08. |
| Diagonalizable groups | TauCeti `Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean:66,110,138,154` | Actual group-scheme carrier and anti-equivalence, including nonsmooth μ_p; R11. |
| Faithful representations | TauCeti `Algebra/AlgebraicGroup/Representation/Embedding.lean:118`; `Representation/Faithful/Basic.lean:161,221,249` | Surjective coordinate map, faithfulness and basis independence; already properly consumed. |
| SL coordinate algebra | TauCeti `Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:201,225,380,574` | Coordinate map, its localized kernel, point equivalence and natural point comparison; the unlocalized polynomial quotient in Suggested is a real further comparison. |
| Homogeneous quotient | TauCeti `Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:50`; `HopfIdeal/Coinvariants/Basic.lean:92` | Arbitrary closed subgroup and right-invariant functions; no normality in this sheaf carrier. |
| Bilinear isometries | TauCeti `LinearAlgebra/BilinearForm/Isometry.lean:153,166` | Native subgroup and membership equation, without an ADE/definiteness requirement. |
| Braid exponent/parity route | TauCeti `GroupTheory/SpecificGroups/Braid/Basic.lean:151`; `GroupTheory/Coxeter/Artin.lean:226` | Generator exponent sum is 1; no existing plane-configuration comparison was found. |
| Covering lifting/uniqueness | Mathlib `Topology/Homotopy/Lifting.lean:477`; `Topology/Covering/Basic.lean:367` | Simply connected, locally path-connected source for lifting; preconnected source for uniqueness. |
| Dimension/descent/quotients | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§0.3,0.7,1.1,1.5,1.13–1.15,2.6 (551,755,2071,2167,2418,2458,2502,3437) | Relative Proj, dimension, fpqc descent and sheaf/group/torsor interfaces; not universal quotient representability. |
| Affine descent/Weil restriction | `TauCetiRoadmap/ModularCurves/README.md:386,412`, §§0E–0F | Finite locally free base map and affine finitely presented source; arbitrary base change. |
| Regular fibres and quotient manifolds | `TauCetiRoadmap/SmoothBundlesConnections/README.md:221,315,421`, B1.0/B1.1/B1.4 | Correct regular-fibre, principal-bundle and homogeneous-space inputs. |
| Closed Lie subgroups and flags | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, Layers 2,6–8 (275,383,407,428) | Closed subgroups and compact/flag topology; does not construct scheme analytification. |
| Lie algebra/highest-weight inputs | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md`, Layers 3–5,7 (405,537,567,931); Chevalley restriction 1066; Serre presentation 1158 | Lie-theoretic inputs; the rational all-characteristic group category remains distinct. |
| Generic cohomology and induction | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1144–1237`, §0.7 | Same generic objects and inversion dictionary; R06. |
| Analytic carrier | `TauCetiRoadmap/ComplexComparisonPartII/README.md:777–792`, C−1.1 | Same underlying topology and smooth charts; R07. |
| CFSG boundary | `TauCetiRoadmap/CFSGStatement/README.md:215` | Consumes ReductiveGroups Layer 9; no longer used to specify this roadmap's carriers. |

The related RootSystems/RootSystemsPartII, IntegralLattices, SchubertGeometry, ClassicalGroups, AlgebraicVectorBundles, AlgebraicTopology, DGFloer, GroebnerGeometry and InductionRestriction material was searched for lattice, folding, highest-weight, flag, covering and invariant constructions. Abstract root systems, integral lattices, Serre presentations and finite-group induction are distinct supplied objects; the signed group-cover Lie algebra, full-root-datum integral realization and its rational group representations remain this roadmap's extensions. The construction of a group scheme from a full root datum must not be replaced by a selected representation or good-characteristic special case. The README's all-ring integral charts and the small-prime exceptional constructions retain that scope. No duplicate fully qualified name was found between the eight kept headline declarations and a supplier declaration.

**Sources.** Both seeded targets were checked in legal text. Milne Definition 17.95, printed p. 382 (milne lines 15742–15749), Theorem 17.96 and Corollaries 17.97–17.98, printed p. 383 (15752–15785), support Lang/Steinberg surjectivity, the finite-field specialization and H¹=1. The source writes the other Lang convention; precomposition with inversion gives `x⁻¹F(x)`. Its proof uses finite twisted stabilizers, not the characteristic-zero input cited by this README. Dudas–Michel Lemma 7.6(i), printed p. 25 (dudas-michel lines 1145–1153), gives the fixed-coset bijection for a connected F-stable subgroup; the abstract surjective-Lang version in the README follows by its displayed elementary group argument, including for nonnormal J. Normality is required only in the source's separate H¹ comparison (ii).

Further locator checks: Milne 17.9(b) versus 17.10 (milne lines 14525–14548); Conrad 3.3.4 (conrad lines 4072–4075); Dudas–Michel 7.5/7.7 versus 9.2/9.4 (dudas-michel lines 1141–1159 and 1599–1637). The open publisher scans of [Fox–Neuwirth](https://journals.msp.org/mscand/article/view/2675) and [Fadell–Neuwirth](https://journals.msp.org/mscand/article/view/2674) were fetched through the sources service after confirming the publisher's PDF access. Fox–Neuwirth §7, pp. 123–126 derives the braid presentation (fox-neuwirth lines 153–218), and §8, p. 126 gives torsion-freeness (223–229). Fadell–Neuwirth §II, pp. 111–112 constructs the configuration fibration for a connected Hausdorff manifold of dimension at least two (fadell-neuwirth lines 22–70), which includes ℂ. No source prose was copied into the report or worktree.

**Adversarial computations.** The following 148 rows give actual values; they are finite tests and convention checks, not proofs of all general theorems. “Retain” means the tested statement survives these instances. Rows marked Rxx identify the required change. Nonexistent/admitted constructions in the companions cannot acquire a value merely from `sorry`; their intended mathematical definitions are tested where stated in the README, and their Lean status is recorded under R05 and Not verifiable.

| Statement / definition | Instances | Computed sides / distinguishing values | Result and change |
|---|---|---|---|
| Proper group ⇒ commutative | Constant S₃/ℂ; trivial group | `(12)(23)=(123)` versus `(23)(12)=(132)`; trivial commutator 1=1 | Geometric integrality excludes S₃; retain. |
| Points group and Hopf convolution | G_a, G_m; upper/lower GL₂ unipotents | Addition 2+3=5; multiplication 2·3=6; products `[[2,1],[1,1]]` and `[[1,1],[1,2]]` differ | Convolution uses group multiplication, not coordinatewise commutativity; retain. |
| Affine/Hopf and base-change dictionaries | G_m; μ₂ over F₂ | `R`-points = Rˣ; μ₂(F₂)={1}, but algebra has dimension 2 | Scheme structure, not just points, retained. |
| Sheaf quotient and point lifting | G_m/μ₂ over ℚ | 2 not a rational square; `(√2)²=2` after extension | Sheaf epi ≠ pointwise surjectivity; retain. |
| Finite regular subcomodule | G_a on span(1,t) | `ρ(t)=t⊗1+1⊗t`; matrix `[[1,t],[0,1]]`; coefficient t generates k[t] | Retain supplied embedding. |
| Faithful coefficient criterion | Weight-one G_m; μ_p | Coefficients alone k[t], with antipode k[t,t⁻¹]; μ_p character detects length p despite one geometric point | Retain. |
| Zero-dimensional representation | Trivial group; nontrivial G_m | GL₀=1; kernel respectively 1 and G_m | Faithful iff source trivial; retain. |
| S₃ irreducibility and tensor square | ℂ; characteristic 3 | ℂ: 4=1+1+2; char 3 augmentation plane has invariant line span(1,1,1) | R10. |
| S₃ sign coefficients | ℂ; characteristic 2 | Dimensions 2 versus 1; kernels A₃ versus S₃ | R10. |
| Tensor reconstruction | G_m | Weight n acts by tⁿ; degrees 1,2 require t², not independent s | Tensor law excludes wrong model; retain transport only. |
| Rational invariants/Hochschild differential | Weight-one ℤ[t,t⁻¹] | `d⁰(1)=1⊗t−1⊗1`; invariant kernel 0 | R06: consume supplier. |
| Cofree acyclicity/enough injectives | Trivial group, coefficients ℤ/2 | H⁰=ℤ/2; Hⁿ=0 for n>0; ℤ itself not injective since 2x=1 has no integer solution | No coefficient flatness/injectivity assumed; R06. |
| Cotensor induction/reciprocity | 1⊂C₂; C₂⊂S₃ | Induced ranks 2 and 3; delta bases permuted; identity evaluation sends constant 1 to 1 | R06. |
| Induction inversion convention | C₂⊂S₃, g=(123) | Right coset C₂g maps to left coset g⁻¹C₂=(132)C₂ | Supplier's inversion intertwiner needed; R06. |
| Lie bracket | SL₂, E₁₂,E₂₁ | `[E₁₂,E₂₁]=diag(1,−1)`; reversed bracket is its negative | Retain sign. |
| Tangent versus dimension | μ_p in char p | dim scheme=0; dim tangent=1; dF=0 | Smoothness cannot be omitted; retain. |
| Hopf-ideal condition | μ_n⊂G_m; equation t−2 | `Δ(tⁿ−1)=(tⁿ−1)⊗tⁿ+1⊗(tⁿ−1)`; counit(t−2)=−1 | First subgroup, second not; retain. |
| Identity component/component group | μ₃/ℚ; μ_p/F_p | μ₃ has 2 arithmetic points, 3 geometric points; neutral component 1. μ_p connected: neutral component μ_p, component group 1 | Geometric/schematic distinction required; retain. |
| Normal subgroup/quotient | C₃⊂S₃; C₂⊂S₃ | First quotient group C₂; second has 3 cosets but subgroup not normal | Homogeneous sheaf allowed in both, group quotient only first; retain. |
| Orbit morphism and geometricOrbit | G_m acting on A² with weights (1,−1), x=(1,1) | Image xy=1, including its generic point; not just its closed k-points | Retain native scheme image. |
| orbitClosure | Same action, x=(1,0) | Orbit `{(a,0):a≠0}`; closure line y=0 | Retain. |
| orbitBoundary | Same action, x=(1,0) | Closure minus orbit={(0,0)} | Retain. |
| orbitDimension | Previous line; closed point | Dimensions 1 and 0; empty boundary dimension ⊥ | Retain extended dimension convention. |
| orbit_locallyClosed | G_m on A¹ at 1; S₃ on itself | A¹\{0} open; six-point orbit closed | Retain disconnected case. |
| exists_reduced_orbit_model | Trivial group on Spec k[ε]/ε² | Underlying orbit one point; reduced model Spec k, not length-two thickening | Retain. |
| boundary_dimension_lt | G_m on P¹ at [1:1] | Boundary two points: 0<1; closed orbit: ⊥<0 | Retain both branches. |
| exists_closed_orbit_in_closure | G_m on A¹ at 1 | Closure A¹ contains closed orbit {0} | Retain. |
| exists_closed_orbit | Empty X; nonempty previous example | Empty case has no point/nonempty hypothesis; nonempty gives {0} | Retain nonemptiness. |
| Minimum orbit route | G_a on A², t·(x,y)=(x+ty,y) | y≠0 orbit affine line dimension 1, closed; y=0 orbit point dimension 0 | Closed does not imply globally minimum; the route needs only existence of a minimum. |
| Complex topology/compactness | A¹, G_m, P¹; dual numbers | ℂ and ℂˣ noncompact; P¹(ℂ) compact; dual numbers one topological point | R07: use supplier carrier. |
| Orbit submersion | Complex scaling; char-p power action | Derivatives 1 and 0 at identity; char-p stabilizer μ_p | Complex theorem survives; R04 prevents reuse at p. |
| Projective dual convention/H⁰ | dim V=2, scalar action t | On V*: t⁻¹; on H⁰(P(V*),O(1)): t; H⁰ dimension 2 | Retain inverse in dual action. |
| Closed-orbit restriction map | G acting trivially on V=ℂ², orbit point in P¹ | H⁰(P¹,O(1)) rank 2 → fibre rank 1 | Restriction need not be an isomorphism; retains kernel. |
| Jordan factors | `2I+E₁₂` over ℚ | Semisimple 2I, unipotent I+E₁₂/2; product original matrix | R13 scopes the Check. |
| Jordan boundary | Same matrix over F₂ | det=0 rather than a unit | R13. |
| Diagonalizable anti-equivalence | Character groups 0,ℤ,ℤ/p | D(0)=1, D(ℤ)=G_m, D(ℤ/p)=μ_p with length p in char p | R11: native anti-equivalence handles all three. |
| Character/cocharacter pairing | χ(t)=tᵃ, λ(t)=tᵇ | χ∘λ=t^(ab); pairing ab | Retain direction. |
| Nonsplit torus lattice | Norm-one torus over ℝ | Conjugation acts −1 on ℤ; split torus action +1 | Galois marking distinguishes the forms. |
| Unipotent fixed-vector definition | G_a, α_p, μ_p | G_a/α_p nonzero modules have fixed vectors; nontrivial μ_p weight line has fixed space 0 | Unipotent ≠ nonsmooth or characterless; retain. |
| Characterless counterexample | SL₂ | Character group 0, but standard module fixed space 0 | Rejects false unipotence test; retain. |
| Lie–Kolchin | Connected upper triangular group; S₃/ℂ | First preserves span e₁; standard S₃ module has no invariant line | Connectedness needed; retain. |
| Unipotent radical | G_a⋊G_m; SL₂ | R_u=G_a; R_u=1 | Retain. |
| Polynomial exp/log | N=E₁₂+E₂₃; N=0 | exp N=I+N+E₁₃/2; exp0=I, log I=0 | Char-zero denominator needed; retain. |
| exp subgroup/automorphism comparison | Heisenberg centre ℂE₁₃ | exp(aE₁₃)=I+aE₁₃; conjugating scales a on both sides | Retain polynomial map, not arbitrary topological exponential. |
| Radical/centre | SL_p in char p; GL₂ | 1 versus μ_p for false equality; G_m=G_m for GL₂ | R01. |
| Reductivity ⇒ linear reductivity in char 0 | G_m; SL₂/ℂ | Weight direct sums; standard module simple; invariants split | Retain kept headline; char zero retained. |
| Failure of positive-char complete reducibility | Symᵖ of standard SL₂ module | Dimension p+1, stable span(xᵖ,yᵖ) of dimension 2 | Positive-characteristic blanket claim excluded. |
| Connected linearly reductive groups at p | G_m; SL₂ | G_m weight-line invariants exact; SL₂ Symᵖ obstruction | Torus criterion passes. |
| Levi extension/group law | G_a⋊G_m | `(u,t)(v,s)=(u+tv,ts)`; reverse generally v+su | Retain semidirect convention. |
| Vector-extension cocycle sign | Section changed by b | New c(q,r)=old c+q·b(r)−b(qr)+b(q) | Correct plus coboundary; retain. |
| H¹/conjugate Levi | G_a⋊G_m | Conjugating by c gives section `(c(1−t),t)`; cocycle is coboundary | Retain sign against chosen action. |
| Levi uniqueness boundary | Central G_a×Q; U=1; Q=1 | All central unipotent conjugators fix Q; L=G in U=1; L=1 in Q=1 | No uniqueness of conjugating element asserted. |
| Matsushima positive instance | G_m/μ₂ | Invariants ℂ[t²,t⁻²], quotient coordinate s=t² | General disconnected-H version true; connected target alone does not cover it. |
| Orthogonal quotient orientation | diag(2,1), swap matrix | gᵗg changes diag(4,1)→diag(1,4); ggᵗ remains diag(4,1) | R02. |
| Nonreductive quotient obstruction | SL₂/N⁺ | Invariants k[a,c]; quotient A²\{0}, Spec invariants A² | Reductivity essential; retain. |
| Borel conjugacy | Upper/lower triangular SL₂, w=[[0,1],[−1,0]] | `w[[a,b],[0,d]]w⁻¹=[[d,0],[−b,a]]` | Retain unconditional headline. |
| Maximal tori conjugacy scope | Split/norm-one tori in real groups | Character Galois actions +1 and −1 | Algebraically closed hypothesis cannot be dropped. |
| Root datum versus Dynkin diagram | SL₂, PGL₂ | SL₂ root=2, coroot=1; PGL₂ root=1, coroot=2 | Same diagram, index-two different datum; retain. |
| Parabolics/Bruhat cells | GL₃, fixed B,T | 4 standard parabolics, 6 Weyl cells; lengths 0,1,1,2,2,3 | Retain, not one cell per parabolic. |
| 7C root subsets | A₂, w=s₁ | Inverted roots={α₁}; retained={α₂,α₁+α₂}; sizes 1+2=3 | Disjoint Lie summands. |
| 7C product coordinates | SL₃ positive unipotent, a=2,b=3,c=7 | x₁(2)·h(3,1) has upper entries (2,3,7); correction c−ab=1 | Noncommutativity correction essential; retain. |
| 7C rank-one factorization | x₊(a)x₋(b), 1+ab invertible | Matrix `[[1+ab,a],[b,1]]` on both sides | Unit condition prevents division-by-zero chart. |
| 7C Weyl representative | a unit | n(a)=[[0,a],[−a⁻¹,0]], n(1)²=−I | Retain sign. |
| 7C covering uniqueness | Connected covering of simply connected base | Degree 1, chosen fibre point unique; disconnected two-copy cover degree 2 | Connectedness necessary; retain. |
| Lang's theorem (seed) | G_a/F₂, F₄=F₂[θ]/(θ²+θ+1) | L(θ)=θ²−θ=1; L(0)=0; over closure every fibre quadratic nonempty | Theorem survives; route R04. |
| Lang connectedness | Constant C₂/F₂ | F=id; L image={1}, misses other element | Connectedness necessary and stated. |
| Lang trivial boundary/H¹ | Trivial group | L image={1}; H¹ singleton | Retain. |
| Frobenius rational points | Split SL₂/F₂ | card(G^F)=6; B^F order 2; coset set size 3 | Rational-point comparisons pass. |
| Fixed-coset lifting (seed), nonnormal J | H=S₄, J=⟨(123)⟩, σ conjugation by (12) | 8 cosets, 4 σ-fixed; each has 1 fixed representative; card(H^σ)/card(J^σ)=4/1=4 | Direct enumeration; normality unnecessary. |
| Fixed-coset negative control | ℤ/4, σ=−1, J={0,2} | Lang on J has image {0}; coset {1,3} stable with 0 fixed representatives | Surjectivity hypothesis necessary. |
| Parabolic intersection | GL₃ line/plane parabolics with common T | For P stabilizing e₁ and Q stabilizing span(e₂,e₃), P∩Q=GL₁×GL₂ and its unipotent radical=1; for P=Q it has radical dimension 2 | Retain common-torus hypothesis. |
| Rational transport | G_m with F(t)=t³, μ₂ subgroup | A stable coset ±a with a²∈F₃ nonsquare has no F-fixed member | Connected/Lang subgroup hypothesis essential. |
| Harish–Chandra induction dimension | GL₂(F₂)=S₃, B order 2, trivial Levi module | Induced dimension 3=[G:B]·1; trivial multiplicity 1 | Retain; locator R12. |
| Averaging idempotent | U=C_p, coefficients ℤ[1/p] versus F_p | e²=e since p/p²=1/p; 1/p undefined in F_p | Invertibility of card(U) explicitly required. |
| Harish–Chandra identity Levi | L=G, U=1 | e_U=1; induction/restriction identity | Retain. |
| Principal-series Mackey | GL₂, torus T | Two Weyl double cosets; endomorphism dimension 2 for trivial character in ordinary coefficients | Retain split/common-torus scope. |
| Transporter meaning | T diagonal in GL₂; nontrivial upper unipotent | T∩T=T has full rank; T∩uTu⁻¹=center only | u is not a transporter containing a maximal torus; retain. |
| Common-Levi corner inverse | t=e_Ue_V, s=e_Ve_U z_U⁻¹ | ts=e_U; st=e_V using the unit z_V | Both inverse directions required; retain. |
| Gassmann identity | S₃, H=⟨(12)⟩, g transposition/3-cycle/1 | 1·2=2·1; 0·2=3·0; 3·2=6·1 | Retain character-to-count convention. |
| GL₃ finite-field example | GL₃(F₂) points/lines | 7 points, 7 lines; stabilizers same order 24, different geometric types | Same permutation character does not mean conjugate subgroups. |
| Steinberg square relation | Pinned diagram automorphism θ of order 2 commuting with F_q | (θF_q)²=F_(q²) | Retain; ordinary and twisted hypotheses distinguished. |
| Identity Steinberg boundary | Trivial group; positive-dimensional G | Fixed groups size 1 and infinite; trivial identity equals Frobenius | R13. |
| Classification construction order | A₁ root datum | Native input datum, constructed SL₂, then identified datum; reversing requires the constructed group first | R03. |
| Relative reductivity base change | ℤ→F₂ and ℤ→ℤ[ε]/ε² | SL₂ is smooth of relative dimension 3 on both bases; every geometric fibre is SL₂ and has trivial unipotent radical | R08: consume existing theorem. |
| Forms of rank-one torus | ℝ | H¹(C₂,{±1}) has 2 elements: action +1 or −1 | Retain. |
| Pseudo-reductive Weil restriction | Purely inseparable K/k of degree p | dim Res G_m=p; geometric units of k̄[t]/tᵖ have torus rank 1 and unipotent dimension p−1 | Not reductive; K=k returns G_m. |
| Schematic relative centre | SL_p versus GL_p at p | μ_p length p nonsmooth versus smooth G_m | Retain; refutes R01 original equality. |
| Full integral toral lattice | Root-free rank 1 datum | Lie lattice Y=ℤ; distribution toral algebra contains binom(H,2), not just ℤ | Central torus retained. |
| Signed ADE cocycle/commutator | A₂ ordered α₁<α₂ | ε(a,b)/ε(b,a)=(-1)^B(a,b); adjacent roots have value −1 | Retain. |
| Signed cover inverse | (a,s) and (−a,sε(a,−a)) | Product=(0,s²ε²)=(0,1) | Retain. |
| Signed root-line normalization | a=α₁+α₂ in A₂ | ε(a,−a)=−1; [E₁₃,−E₃₁]=−diag(1,0,−1) | Sign tied to cover product; retain. |
| Cover lift kernel | Rank r; r=0 | Characters Q→{±1} number 2ʳ; rank 0 kernel 1 although cover has 2 elements | Lift group is not the cover itself. |
| Full isometry lifts | A₁ | Isometries ±1; kernel C₂; four compatible lifts | Cannot select one lift and call it all lifts. |
| Change of vertex order | A₂ single reversed bond | Correction (-1)^(a₁a₂); at (1,1) value −1 | Bond reordering, not all vertex pairs; retain. |
| Signed orbit fixed module | Negative one-cycle over ℤ and F₂ | Fixed equation v=−v: over ℤ v=0, over F₂ arbitrary | Invariants do not commute with this base change. |
| Folded Cartan A₃ | Orbits {1,3},{2} | H-row/E-column matrix [[2,−2],[−1,2]] | Retain orientation. |
| Folded Cartan A₄ | Orbits {1,4},{2,3} | Adjacent orbit multiplier 2; matrix [[2,−1],[−2,2]] | Excludes treating every orbit as orthogonal. |
| Folded Cartan D₄ | Outer triple, central singleton | Matrix [[2,−3],[−1,2]] | Retain long/short direction. |
| Averaged-root norm | Orbit O | B(S_O,S_O)=card(O)d_O; B(S_O/card(O),S_O/card(O))=d_O/card(O) | Normalization survives singleton. |
| Exceptional folded dimensions | D₄ triality; E₆ reversal | 6 fixed roots+6 triples→12 roots+2 torus=14; E₆→48 roots+4=52 | Retain G₂/F₄ ranks and dimensions. |
| Integral fixed lattice/full Y | γ=[[0,−1],[1,−1]] | γ³=I; det(γ−I)=3; integral invariants 0, mod 3 vector (1,−1) fixed | Full-Y modular caveat necessary. |
| PBW divided-power multiplication | SL₂ | E·E=2E^(2); EF=FE+H | Retain integral coefficients, including reduction at 2. |
| Toral divided powers | Weight 3, degree 2 | binom(3,2)=3 | Ordinary H²/2 gives 9/2, wrong object. |
| SL₂ big-cell inverse | a unit, ad−bc=1 | u₋(c/a)diag(a,a⁻¹)u₊(b/a) has lower-right (1+bc)/a=d | Retain. |
| Integral translated chart cover | [[2,1],[3,2]] over ℤ | det=1; a,c not units; (a,c)=(2,3)=ℤ | Scheme cover, not one global chart per ring point. |
| Small-prime SL₂ points | ℤ/4 | card(SL₂(ℤ/4))=48; [[0,1],[3,0]] lies in D(c) | All-ring scope survives. |
| Central quotient kernel | SL₂→PGL₂ | Character index 2; kernel μ₂; at 2 coordinate length 2 | Scheme kernel not abstract C₂ points. |
| Central isogeny point surjectivity | ℚ, diag(2,1) in PGL₂ | Determinant square class 2 not 1 | fppf surjective, not onto rational points. |
| Pinned comparison | diag(2,1/2) on x_α(a) | x_α(4a), not x_α(a) | Unmarked conjugacy is not pinned equality. |
| Elementary subgroup | G_m/ℚ | E_G={1}; GE_G=ℚˣ | Does not assert root generators give every torus point. |
| Special isogenies | Short/long-root parameters | Applying τ twice gives t↦tᵖ; on parameters first powers are 1 and p in opposite order | Keeps bad-prime construction. |
| Exceptional explicit carriers | G₂ at 3; F₄ at 2; tripled D₄ | Ideal/quotient dimensions 7/7 and 26/26; D₄ carrier 3·8=24 | A single 8-dimensional D₄ module cannot carry the prescribed triality permutation. |
| Jets/distributions | G_m, order n | Jet coordinate count n+1; unit constant coefficient; toral distribution binomial, not ordinary polynomial divided powers | Retain. |
| Frobenius on root distributions | SL₂ at p | E^(p)↦E^(1); E^(1)↦0; first-kernel dimension p³ | Relative Frobenius twist retained. |
| Toral contraction idempotent | p=3, weights 0,1,2,3 | binom(λ−1,2) mod 3 =1,0,0,1 | Selects weights divisible by p. |
| Frobenius contraction versus tensor | Two weights 1,p−1 | Each contracted space 0; tensor has weight p and nonzero contraction | No tensor-equivalence overclaim. |
| Rational torus versus Lie weights | G_m in char p, weights 1 and 1+p | Differential both 1; rational characters t and t^(1+p) differ | Integral X-labels essential. |
| Induced/Weyl head and socle | SL₂, weight p | ∇ dimension p+1, L(p) dimension 2; Δ head L(p), ∇ socle L(p) | Distinct modules in characteristic p. |
| Contravariant versus ordinary dual | G_m weight λ | Ordinary dual weight −λ; τ fixing T gives contravariant weight λ | Retain stated twist. |
| Integral contravariant form | SL₂ binary degree p | Specialization has nonzero radical; simple quotient dimension 2 | No claim of perfect specialized form. |
| Algebraic Steinberg module | SL₂ weight p−1 | Dimension p=p^1; p=2 gives dimension 2 | No good-prime restriction. |
| Binary form action | g=[[a,b],[c,d]] | Substitution (du−bv,−cu+av) uses inverse; upper unipotent sends y→y and x→x−by | Convention consistent. |
| Binary form Lucas test | p=3,n=4 | binomial coefficients 1,1,0,1,1; highest-generated simple dimension 4 versus ambient 5 | Retain. |
| Highest line versus generation | p=2,n=2 | Highest submodule span(x²,y²) dimension 2; orbit of xy generates all 3 dimensions | Unique highest line alone insufficient. |
| Binary simplicity criterion | n=(a+1)p^m−1 | Digits below top all p−1; every binom(n,j) nonzero mod p | Retain n=0 trivial case. |
| Peter–Weyl coalgebra | G_m | Coefficients tⁿ; Δ(tⁿ)=tⁿ⊗tⁿ; summands one-dimensional | Retain; not finite-group functions. |
| SL₂ right-unipotent invariants | [[a,b],[c,d]]·[[1,t],[0,1]] | First column unchanged; second adds t·first; invariants k[a,c] | Retain right convention; contrasts R02. |
| SL₂ quotient torsor transition | D(a)∩D(c) | s_c=s_a n(−1/ac); u_c−u_a=1/ac | Opposite signs occur in section versus coordinate transitions. |
| Polynomial versus rational GLₙ modules | det⁻¹ | Weight (−1,…,−1); no extension to singular matrices | Polynomial-monoid condition necessary. |
| Ordered configuration carrier | n=0,1,2 | Point; ℂ; ℂ×ℂˣ via centroid and difference | Native subtype topology, not discrete finite-set topology. |
| Plane quotient/covering | n=2 | Difference z identified with −z; quotient coordinate z² | Cover degree 2, branching point excluded. |
| Plane braid headline | n=0,1,2 | Fundamental groups 1,1,ℤ; braid groups same | R09 adds signature. |
| Pure braid comparison | n=2 | π₁ cover maps ℤ→ℤ by multiplication 2; pure subgroup 2ℤ | Retain normalization. |
| Permutation-extension nonsplitting | n≥2, transposition | Lift has odd exponent sum; an order-2 element has sum 0 | Contradiction; R09 adds signature. |
| Fundamental-group product/endpoint | S₃ endpoint (123) | Inverse endpoint is (132), not (123); adjacent transpositions individually hide this distinction | Retain inverse-endpoint convention. |
| Weyl arrangement rank 1/0 | A₁; root-free central torus | C* modulo ±1 via square, π₁=ℤ; ℂʳ contractible, π₁=1 | No group-hypertorus replacement. |
| Root system versus datum local system | Bₙ/Cₙ; SL₂/PGL₂ | Same Weyl group possible; A₁ lattice index 2 distinguishes full datum | Preserve character/cocharacter lattices. |
| Spectral discriminant | GL₂ diagonal λ₁,λ₂ | Δ=(λ₁−λ₂)²; zero precisely at collision | Retain regular-semisimple base. |
| Regular versus regular semisimple | Nonzero nilpotent in gl₂ | Centralizer dimension 2 but not a torus; scalar centralizer dimension 4 | Distinguishes regular nilpotent and scalar boundary. |
| Cameral product/fibre | GL₂, distinct eigenvalues | Two eigenvalue orderings; homogeneous fibre G/T | Weyl action is free on ordered regular torus. |
| Differential of conjugation | sl₂, t=diag(a,−a), a≠0 | Root directions multiplied by ±2a | Invertible over ℂ; characteristic 2 not silently included. |
| Homogeneous fibre π₁ | Complex G/T | Flag fibration with contractible unipotent fibre gives π₁=0, including PGL₂ | Global form of G does not introduce a false fibre π₁. |
| Spectral projectors | A=diag(1,2) | (A−2I)/(1−2)=diag(1,0); (A−I)/(2−1)=diag(0,1) | Denominators nonzero exactly on simple spectrum. |
| Centering | n=2, tuple (1,3); n=0 | Centroid 2, centred tuple (−1,1); n=0 reciprocal not permitted by 0<n | Retain guard. |
| Root local-system monodromy | Three-cycle endpoint w | Transport w⁻¹=(132) under chosen convention | Marking and inverse cannot be suppressed. |
| determinantRelation | n=0,1,2 | 0; x−1; ad−bc−1 | Quotients ℤ,ℤ,ℤ[a,b,c,d]/(ad−bc−1). |
| exists_coordinatePresentation | Same three n | Localizing at det adds no element after det=1; coordinate rings equal above | Retain nontrivial all-n comparison. |
| SL coproduct/antipode | x₊(2)x₋(3); upper unipotent over ℤ/4 | Δa evaluates 1+6=7; inverse upper entry −1=3 mod4 | Retain integral signs. |

## Not verifiable

- **Admitted companion constructions.** The eight companion files were read but not elaborated as a separate package. Their missing `CoverLifts` names and prohibited imports/data are directly visible. A theorem about an equivalence defined by `sorry` does not specify a computable map, so claims about those particular Lean values cannot be certified from these files. This limitation does not affect the independently elaborated acceptance module or the real-definition plane probe.
- **Primary books not available as legal full text.** The source service classified Waterhouse, Borel, Springer, Howlett–Lehrer and Serre as `uncertified` at publisher/DOI endpoints. Their contents were not guessed. These are recorded as unverified locators, not requested under new keys. Howlett–Lehrer resolved to Elsevier; the four Springer books were rejected by the service's paywall rule.
- **Unresolved references.** The single scratch reference request records Jantzen (citation resolver, I.3–I.4 and the highest-weight applications); SGA3 (citation resolver, Exposé XIX); Conrad–Gabber–Prasad (Cambridge landing page, Definition 1.1.1/Proposition 1.1.9); Dipper–Du (citation resolver, pp. 101–130); Carter (citation resolver, §1.17); Lang (JSTOR landing page, pp. 555–563); Steinberg (AMS landing page, Memoirs 80); Gassmann (citation resolver, pp. 665–675); Brieskorn and Salvetti (citation resolvers, arrangement presentation/model). No paywall was bypassed. The seeded Lang/fixed-coset claims were independently verified in Milne and Dudas–Michel, so their verification does not depend on obtaining Lang's original article. This report does not certify unavailable sources merely because the mathematical statement is familiar.
- **Additional accessible sources.** Birman–Brendle v2, McNinch v1, Gros–Kaneda v2 and Hedén v2 were obtained through the service. The configuration/presentation source was checked against Fox–Neuwirth directly. McNinch's condition (L) and split-unipotent hypotheses are explicit (mcninch lines 138–197); their all-purpose omission would be invalid, so the roadmap must retain its characteristic-zero construction of the required linear vector layers. Gros–Kaneda works with split integral models over an algebraically closed field (gros-kaneda lines 23–39); arbitrary-field descent of the displayed distribution interfaces remains a roadmap obligation. Hedén's right-multiplication SL₂ bundle convention was checked (heden lines 91–96). These readings do not certify every theorem in those papers.
- **Locator coverage.** The README flags no locator literally as “unverified” or “uncertified”. Both mandatory seeded targets were checked as described above. Broad bibliography-only references do not supply theorem/page locators for every API assertion; R12 records that remaining shape defect. No claim is made to have certified every bibliography entry or completed general proofs from the finite adversarial tests.
- **Open-work coverage.** Ownership was checked in the supplied main and sibling trees and the roadmap service's indexed heads. Unlisted private/unavailable work was not inspected. The generic cohomology and analytification findings cite the owner text actually opened, not an imagined future implementation.

## Source issues

- **Error** in milne at Proposition 1.65(a), printed p. 26: the proof chooses its open set after extending to the algebraic closure; it should choose that open set before extending the field; affects the proof; corrected in print at the paperback correction to p. 26, recorded in the author's errata (milne lines 26802, 26822–26823).
