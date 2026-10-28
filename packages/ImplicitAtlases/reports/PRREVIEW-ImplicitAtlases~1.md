# Review of ImplicitAtlases (pull request #974 at 50ab7a5)

**Verdict:** needs changes

🤖 Independent AI review. Six findings: two P2 blockers and four P3 findings. The supplied gate passes. No previous review or settled finding was supplied. This review changes no pull-request file.

## R01 (P2) — Assume local orientability before constructing a rank-one orientation sheaf

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:102`, also the standing conventions at lines 9–21 and the VFC at lines 130–138. The claim is “Construct the rank-one locally constant virtual orientation sheaf” after defining local orientability, without assuming that property. V1 does not imply it.

**Witness:** Let s(x)=x² on ℝ, with C₂ reflecting the thickening and acting trivially on E=ℝ; d=0, X={0}, X∅reg=∅, Xαreg=ℝ. Virtual fiber sign: −1. A coarse pulled-back fiber has sign +1.

All V1 axioms hold: the only nonidentity zero fiber is {0}, its quotient is X, its footprint is X, and the extra-factor freeness/submersion assertions over X∅reg are vacuous. The identity chart is one-dimensional, as d+dim E=1 requires. But at 0 the proposed equivariant identification would identify a trivial rational stabilizer representation with the sign representation. Their invariant dimensions are respectively 1 and 0.

**Repair:** Explicitly assume local orientability for the orientation descent, orientation-valued Čech comparisons, VFC, and the laws that use them. Keep V1 and the chain construction available without it. Preserve the reflection example as a rejected input to the rank-one descent theorem; a trivial Γ-action, or simultaneous reflection on Xα and Eα with s(x)=x, has virtual sign +1 and passes. This is precisely the hypothesis of Pardon Definition 4.1.3 and Theorem 4.3.4: `pardon2016 line 1460` and `pardon2016 line 1623`. Do not replace the whole sign fiber by its zero invariant module while still claiming a rank-one local system.

## R02 (P2) — Import the existing invariance-of-domain target

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:160`: “The invariance-of-domain proof is an owned target.” The ensuing paragraph plans the general Euclidean theorem again.

**Witness:** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1376`, B2.9 at the supplied open head, already owns continuous injective maps U→ℝ^m for open U⊆ℝ^m, for every finite m, and their manifold consequence.

That roadmap is earlier in the supplied merge order. Its board package also contains this target under “Invariance of domain in equal real dimension” at `packages/AbelianSchemesAndArithmeticModuliPartII/README.md:1098`. This is the same object and generality, not merely a differently named planar special case. The ambient implicit-atlas engine remains new work; it need not be rejected as a whole.

**Repair:** Delete the second foundational construction, cite AbelianSchemesAndArithmeticModuliPartII B2.9 in the supplier contract and this target's dependencies, and retain here the cell-like-stratum consequences and their normal-line comparisons. The supplier covers the proposed tests m=0, x↦x³ on (−1,1), and x↦−x on ℝ; it excludes x↦x² on (−1,1), whose image [0,1) is not open. No upward move is needed.

## R03 (P3) — Make Suggested.lean an acceptance test rather than an interface catalogue

**Location:** `TauCetiRoadmap/ImplicitAtlases/Suggested.lean:7` and lines 32–113: “declarations below expose native carriers”. There are eleven auxiliary declarations and one theorem, but no stated VFC, purity, comparison, independence, product, or Gysin headline.

**Witness:** `VirtualKComplex` at line 112 is the category of all compact-indexed cochain functors. On a point it admits both the zero functor and a constant ℚ[0] functor, with H⁰ respectively 0 and ℚ; neither is selected as the virtual construction.

The file honestly disclaims the missing construction, so this is a form/policy defect, not a false assertion that an arbitrary functor computes a VFC. Likewise `Thickening` deliberately omits the atlas axioms. These declarations make no retained headline statable and therefore do not qualify for the permitted “few simple definitions” exception.

**Repair:** Inventory the headlines listed below. Delete auxiliary sketches that no retained headline needs, and give the module docstring the required target-signatures title and a separate explanation of the missing carrier for each unstatable headline. State any genuinely statable retained headline with `sorry` on native carriers. After R02 moves invariance of domain to its owner, an import-and-docstring-only file is an acceptable outcome if the remaining headlines require the missing atlas/virtual-complex/cover-colimit interfaces. Do not substitute a generic functor, a free predicate, or a weakened theorem. This repair removes the zero-functor ambiguity instead of adding fields asserting the desired answer.

## R04 (P3) — Delete the negative-dimension boundary case from Suggested.lean

**Location:** `TauCetiRoadmap/ImplicitAtlases/Suggested.lean:87`, `no_regularCoordinate_of_negative`; README line 60 already states the same boundary case.

**Witness:** The proof uses only `dimension_eq`, nonnegativity of a natural-number cast, and arithmetic. With d=−2 and dim E=1 it excludes n=−1; with d=−1 and dim E=1 it permits n=0.

**Repair:** Delete it from `Suggested.lean`. Keep both computations as README Checks on the regular-chart dimension convention. This applies even though the theorem is already proved: the rule excludes boundary-case padding, not just admitted padding. There are zero sorried theorems in this file, so the requested one-tactic probe has zero admitted declarations to test; inspecting this existing proof establishes the boundary-case classification directly.

## R05 (P3) — Restore local APIs, discriminating Checks, and explicit dependency clauses

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:1`, lines 29–210, and the verification list at line 212. The only `**Checks.**` block is at line 200. There are no `*Needs:*` clauses or layer-ending Examples/Dependencies sections.

**Witness:** The orientation-line definition at line 33 has no local three-Check list; the global instruction to “Verify” at line 212 gives no computed orientation-swap value. The Gysin Check at line 202 leaves its value as ±(a−b).

**Repair:** Use the required Roadmap/Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and Layer headings. For every definition put its API and at least three discriminating computed Checks beside it; attach each theorem's actual prerequisites and finish each layer with Examples and Dependencies. Turn the long verification wish list into those checks. For example o₀=ℤ, reflection on oℝ acts by −1, and swapping two odd real orientation factors acts by −1. For the transverse-zero example choose ν(x,y)=x−y and the increasing θ orientation, giving i!(1,0)=η and i!(0,1)=−η; the opposite normal convention must negate both. Name every retained Lean declaration in the README: none of the twelve present declaration names currently appears there. The R03/R04 deletions can discharge most of that mismatch.

## R06 (P3) — Attach exact source locators to targets and record the source

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:216`, with the unsupported-at-point-of-use claims throughout V0–V6. The references principally cite “§§3–6 and AppendixA”; only a few claims have local theorem/page locators. No `sources.toml` exists in this folder.

**Witness:** The V3 global comparison at lines 116–122 has no local locator; the verified supporting result is Theorem 4.3.4, printed page 39, `pardon2016 line 1623`, with local orientability explicitly assumed.

**Repair:** Add exact theorem/definition and printed-page locators at the supported claims, using the source table below. Record the single Pardon work in `sources.toml`, citing the v6 numbering actually read, under one lifetime key. Label new arguments such as V6's finite orientation-cover Čech comparison and V7's supported Gysin comparison as constructions here, with locators for their inputs rather than attributing them to a nonexistent theorem of Pardon. Record the trace normalization correction in mathematical terms. The source service legally fetched the entire cited work; no access request is needed. This review does not edit the manifest.

## Verified sound

The following is evidence from source reading, inspection of definitions at the pins, and explicit small-instance calculations, not a claim that finite tests prove all the proposed general theorems. R01 conditions all rows involving the rank-one virtual orientation sheaf.

**Gate and scope.** HEAD is `50ab7a502c81b26fb6a710aba62e4c05b661240f`. The supplied worker gate reports every check passing, including the targeted build, imports, metadata, source-material, stray-files, dirty, and outside-folder checks. The independent outside-folder diff is empty. The target folder contains README.md, Suggested.lean and metadata.toml. No `set_option`, sorry-data, free-Prop placeholder, copied source passage, computational algorithm, or route-specific restriction was found in these two reviewed files. No declared gaps were supplied. The general implicit-atlas engine is distinct from the analytical application constructions.

The requested mechanical dependency check was run, with this exact output:

```text
depcheck: 162 roadmaps, 1163 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The text has zero `*Needs:*` lines; its supplier paragraphs and proof-order paragraph were nevertheless read manually. The missing local clauses are R05, not a fabricated mechanical dependency failure.

**Elaboration and signatures.** Built the explicitly permitted `TauCeti.AlgebraicTopology.Singular.Relative` prerequisite successfully, then ran `lake env lean` on the specified Suggested.lean: exit 0, no warnings. A scratch copy with `#check @name` for all twelve declarations also elaborated with exit 0. No Lean process was left running. The printed types retain `[Fintype G]` and `[FiniteDimensional ℝ E]` on `Thickening`, `ZeroFiber`, `RegularCoordinateAt`, and the negative-dimension theorem. `expectedDimension` drops finite-dimensionality and is the total expression d+finrank E; every actual chart/theorem use still has finite-dimensionality. `CoveringGroup` and `ObstructionTuple` retain only a type family, and do not assert group/module structures by themselves. `NonnegativeParameters` and `activeIndices` do not need the section's decidable-equality binder. No harmful dropped standing hypothesis was found. Nothing was changed in the reviewed signatures.

**Headline inventory and statability.**

| Headline in README | Location | Acceptance-test assessment at the pins |
| --- | --- | --- |
| Partial purity and global virtual/Čech comparison | V3, lines 104–122 | Needs the actual implicit atlas, normalized deformation/flag complex, pure-K and cover-colimit comparison carriers; absent and not individually explained in the docstring. |
| Canonical normalized rational VFC and finite-subatlas independence | V4, lines 126–138 | Needs the preceding constructions and orientation/trace maps; no native VFC construction was found. Generic `VirtualKComplex` does not supply it. |
| Boundary triangle, boundary law, cobordism and specified refinement invariance | V5.1–3, lines 144–148 | Needs actual boundary/refinement atlas and VFC carriers; not replaced by the existing finite-index sketches. |
| Finite-CW realization and regular-section/Euler comparison | V5.5–6, lines 152–154 | Ordinary chains and cohomology exist, but the statement also needs the actual virtual functional and its comparison. |
| Stratified virtual quasi-isomorphism | V6.3, line 162 | Needs the stratified atlas and normalized virtual complexes; not presently represented. |
| Product comparison and product VFC | V6.4–5, lines 164–170 | Needs the actual virtual/Čech comparison, orientation-cover models and product atlas. Fixed-cover Čech complexes alone are insufficient. |
| Compatible transverse diagonal/Gysin VFC identity | V7, lines 176–198 | Needs the joint-model atlas, supported Čech operation and virtual trace comparison. Not a theorem supplied by Pardon. |
| General invariance of domain used for strata | V6.2, line 160 | Statable on native Euclidean spaces, open sets, continuous maps and `IsOpenEmbedding`, but already owned by the earlier B2.9 target: import it under R02. |

**Sources and sample.** The brief says the worker found no sampled targets by heading and supplies no fifteen target identifiers. I therefore made an explicit fallback sample: rank 32 source-backed target labels by SHA256 of `50ab7a502c81b26fb6a710aba62e4c05b661240f|<label>` and take the first fifteen. The resulting labels and checks are below. This is a new reproducible sample, not a claim to have recovered an unavailable worker sample. There are no README locators explicitly marked unverified. All explicit locators, including those outside the sample, were inspected. The only cited work is Pardon, arXiv:1309.2370v6, fetched through the sources service from arXiv; all page numbers below are its printed pages, not the journal pagination.

| Sample target | Source locator and extraction | Hypotheses/support result |
| --- | --- | --- |
| V2 deformation space | Definition 4.2.1, p.35; `pardon2016 line 1467` | Equations, active-index regular condition, group action and index direction agree. |
| V5 boundary law | Lemma 5.2.4, pp.42–43; `pardon2016 line 1793` | Locally orientable boundary atlas; dual connecting map agrees, subject to R01. |
| V6 product chain map | Definition 6.3.2, p.51; `pardon2016 line 2160` | Actual finite product atlases, associativity, trace and finite-subatlas comparisons; not a general diagonal theorem. |
| V6 stratification | Definition 6.1.6, p.48; `pardon2016 line 2023` | Finite S, thickening stratifications, zero-fiber compatibility and geometric orientation maps are present. |
| V4 finite-subatlas independence | Definition 5.1.1, p.41; `pardon2016 line 1728` | Same ambient locally orientable atlas; union comparison is the right scope. |
| V0 orientation line | Definition 4.1.1, p.34; `pardon2016 line 1445` | Top local homology of a finite-dimensional real vector space; dual and parity must still be tracked. |
| V1 smooth enhancement | Definition 3.1.3, p.32; `pardon2016 line 1357` | Smoothness only on regular loci; footprint local-diffeomorphism condition is over ψ⁻¹(XIreg), not every possibly singular zero set. Use this precise domain when expanding R05. |
| V6 stratified complex | Definition 6.2.2, pp.49–50; `pardon2016 line 2100` | Degree-one incidence pushforward, odd normal maps, and genuine geometric cancellation agree. |
| V5 manifold normalization | Lemma 5.2.6, p.43; `pardon2016 line 1806` | Empty-index regular footprint all X; empty subatlas reduces to the ordinary fundamental pairing. |
| V1 atlas axioms | Definition 3.1.1, pp.31–32; `pardon2016 line 1324` | Compact Hausdorff base, all finite subsets, finite groups, real obstruction modules, ten compatibility/transversality conditions agree. |
| V4 global trace | Definitions 4.2.5–6, p.36; `pardon2016 line 1523` and `pardon2016 line 1538` | Global relative domain is correct. README's J-dependent weights repair the source's unweighted trace prescription; see Source issues. |
| V3 Čech comparison | Theorem 4.3.4, p.39; `pardon2016 line 1623` | Locally orientable finite atlas with boundary; R01 records the omitted hypothesis. |
| V2 finite flag total | Definition 4.2.6, p.36 and Definition A.7.2, p.128; `pardon2016 line 1527`, `pardon2016 line 5612` | Finite interval diagram with normalized arrows, actual endpoint deletion; TS5 supplies the native-sign adapter. |
| V1 reindexing | Remark 3.1.5, pp.32–33; `pardon2016 line 1366` | Finite-subset version permits injective relabeling; arbitrary index maps require the larger finite-sets-over-A construction. |
| V3 partial purity | Lemma 4.3.1, pp.37–38; `pardon2016 line 1553` | Locally orientable atlas, manifold/closed-support duality, compactly supported suspension and finite quotient descent; R01 applies. |

Additional source checks: Definition 3.2.1 and boundary restriction, p.33 (`pardon2016 line 1393`); local orientability/descent, pp.34–35 (`pardon2016 line 1448`); footnote 17's global-only trace, p.34 (`pardon2016 line 1453`); local diagonal comparison, p.38 (`pardon2016 line 1591`); the last connecting square of Proposition 4.4.2, pp.39–40 (`pardon2016 line 1646`, `pardon2016 line 1672`); chart shrinkings/disjoint unions, p.42 (`pardon2016 line 1762`, `pardon2016 line 1777`); regular-section/Euler comparison, pp.44–45 (`pardon2016 line 1843`, `pardon2016 line 1901`); stratified quasi-isomorphism, p.50 (`pardon2016 line 2130`); finite quotient pullback, Lemma A.4.9, p.121 (`pardon2016 line 5330`); xⁿ/zⁿ examples, p.20 (`pardon2016 line 834`); and the expressly unproved general fiber-product desideratum, p.40 (`pardon2016 line 1698`).

**Pinned objects and ownership.** Mathlib was checked at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The supplied content checkout equals its origin/main at `d00bcc158f6faf5b505e8410b76886db635e58ab`. Object searches used the roadmap grep service, main files, board packages, and supplied open heads. No fully qualified `TauCetiRoadmap.ImplicitAtlases` collision was found. A search finding from an unrelated open revision was not treated as a new supplier.

The following definitions were opened, rather than inferred from their names:

| Native input | File and line at the pin | What it supplies, and limits |
| --- | --- | --- |
| `TopPair`, `TopPair.ofSubset` | `Mathlib/Topology/Category/TopPair.lean:31`, line 54 | An embedding A→X and the subset constructor; no compactness, Hausdorffness, or nonemptiness axiom. |
| `TopPair.singularChainComplexFunctor` | `TauCeti/AlgebraicTopology/Singular/Relative.lean:100` | Relative chains, coefficient-object functor, natural-number homological degrees; no orientation twist or atlas. |
| `TopPair.twistedChainComplex` | `TauCeti/AlgebraicTopology/Singular/Twisted/Relative.lean:79` | Actual cokernel of the local-system chain map; system on the ambient space and its pullback to the subspace. |
| `TopCat.eilenbergZilberHomotopyEquiv` | `TauCeti/AlgebraicTopology/Singular/EilenbergZilber.lean:76` | Absolute Alexander–Whitney/shuffle homotopy equivalence with coefficient tensors; relative/twisted/invariant adapters remain additional work. |
| `Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean:73` | Fixed vectors for every group element. No automatic freeness or one-dimensionality. |
| `GroupAlgebra.average`, `Representation.averageMap`, `isProj_averageMap` | `Mathlib/RepresentationTheory/Invariants.lean:38`, lines 126 and 141 | Finite-group averaging with explicit invertible order; no permission to divide by a zero characteristic-p group order. |
| `CochainComplex.shiftFunctor` | `Mathlib/Algebra/Homology/HomotopyCategory/Shift.lean:44` | Degree i+n and differential multiplied by n.negOnePow. This justifies the native-sign tests below. |
| `TauCeti.koszulBraidingSummand` | `TauCeti/Algebra/Homology/Monoidal/Braiding.lean:91` | Degree-(p,q) factor (−1)^(pq); does not itself carry the independent super parity. |
| `CategoryTheory.cechComplexFunctor` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65` | Fixed-cover tuple complex. It is not the required compact-space refinement-colimit comparison or virtual complex. |

Resolved cross-roadmap contracts:

- TopologicalSheafCohomology at the supplied open head: TS0.4 independent parity; TS1 compact-space Čech; TS2.1–4 K-sheaves/purity/total comparisons; TS3.1 extension by zero and TS3.6 finite quotients; TS4.0b–d local orientations/upper bounds; TS4.1–2 tame boundary and arbitrary closed supports; TS5.1–4 finite flags/pure gluing. These are present in `TauCetiRoadmap/TopologicalSheafCohomology/README.md:39`, 47, 53, 64, 74, 84, 100, 108, 112, 126, and 141 respectively. In particular its quotient contract expressly keeps stabilizer invariant fibers; it does not imply the missing rank-one descent in R01.
- AlgebraicTopology on main: Stages 2–3 at `TauCetiRoadmap/AlgebraicTopology/README.md:326` and 471, Stage 5 at 849, Stage 6 at 946, and the pinned-library inventory at 192. These own ordinary relative/twisted chains, excision, shuffle/Alexander–Whitney, cup/cap, and the specified CW/manifold comparisons. The target's broader nonsmooth orientation use correctly points to TS4 instead.
- CharacteristicClasses on main: C1.2b at `TauCetiRoadmap/CharacteristicClasses/README.md:419`, its `cechSingularCWTypeComparison` at 462, and C2.1 Thom/local-coefficient theorem at 619. Its CW-type/paracompact hypotheses and orientation-valued Thom class agree with V5/V7's restricted uses. The supplier contract should name C2.1 explicitly rather than referring only to “its real Thom/Euler construction”.
- DGAInfinity on main: `TauCetiRoadmap/DGAInfinity/README.md:263`, Layer 0's signed complexes/tensors. Native implemented braiding is cited above; the extra parity and flags are TS0/TS5, not a second generic DG theory.
- ComplexKahlerGeometry's K2 comparison at the supplied head is at `TauCetiRoadmap/ComplexKahlerGeometry/README.md:266`–275. It is only an overlap comparison here, not a prerequisite. Orbifolds is an exclusion, not an input.
- AnalyticStableMaps at its supplied head, `TauCetiRoadmap/AnalyticStableMaps/README.md:15`, explicitly consumes this engine and owns its analytical input. GromovWittenTheory's ownership table at `TauCetiRoadmap/GromovWittenTheory/README.md:239` and SymplecticFieldTheory S4 at `TauCetiRoadmap/SymplecticFieldTheory/README.md:247` similarly consume it. They were checked as consumers, not added as suppliers. R02 is the separate duplicate foundation found in the earlier AbelianSchemesAndArithmeticModuliPartII B2.9.

**Adversarial calculations.** There are 78 mathematical rows and 12 declaration rows below, alongside 15 sampled source checks and nine pinned-object entries above. Each row states computed values on the example, including a negative control where appropriate. Statements sharing one displayed construction are kept in one row; the separate Lean table covers all twelve declarations. “Retain” means no defect was found in that calculation, not a proof of the general statement. Hypotheses about primes, DVRs, nonreduced schemes or infinite groups are not parameters of this roadmap; the relevant characteristic and finiteness controls appear below instead.

| Statement or construction | Instances tried | Values on the two sides / positive and negative values | Result; change |
| --- | --- | --- | --- |
| Compact/Hausdorff input and empty base | ∅, pt, [0,1], ℝ | First three compact Hausdorff; ℝ not compact. Hᵈ(∅)=0 and Φ∅=0. | Retain; compactness is used for finite subatlases, not imposed on thickenings. |
| Integer dimension and signs | d=−2,−1,0,1 with m=1 | d+m=−1,0,1,2; corresponding sign (−1)^d=+1,−1,+1,−1. | Retain; no natural subtraction/negative-degree truncation in signs. |
| Finite products and obstruction sums, V0.1 | Empty index; C₂ and S₃ factors; dimensions 1 and 2 | Empty group cardinality 1, empty module dimension 0; product group order 2·6=12; summed dimension 1+2=3. | Retain; nonabelian factor requires no commutativity. |
| Index transport and ordered direct sums | Two real lines, swapped | Original ordered basis (e₁,e₂); swapped determinant −1; twice-swapped determinant +1. | Retain; add explicit local Checks under R05. |
| Orientation line, V0.2 | E=0, ℝ, ℝ²; reflection | H₀(0,∅)=ℤ; H₁(ℝ,ℝ\0)=ℤ; reflection degree −1; dual sign −1; paired sign (+1). | Retain; no absolute boundary-stalk identification. |
| Boundary orientation dictionary, V0.2 | [0,∞) at 0 versus interior | Absolute H₁([0,∞),(0,∞))=0; interior orientation extension j_* has fiber ℤ at 0; j! has fiber 0. | Retain distinction. |
| Averaging and invariants, V0.3 | C₂ sign/trivial ℚ-lines, S₃ regular module, char 2 | Sign average (1−1)/2=0; trivial average (1+1)/2=1; S₃ average of a basis vector is 1/6 times six vectors. Over 𝔽₂, order(C₂)=0, not a unit. | Retain order-unit condition; zero ring gives only zero modules, with no nontrivial-rank inference. |
| Orbit-basis sign stabilizers, V0.3 | Trivial/sign stabilizer in a C₂ orbit | Trivial coefficient orbit contributes ℚ; sign-fixed equation v=−v gives v=0 over ℚ. | Retain; do not replace arbitrary projectives by free modules. |
| Relative singular chains, V0.4 | (pt,∅), (pt,pt) | H₀=ℚ and 0 respectively; all negative homological groups 0. | Retain native quotient. |
| Relative shuffle and symmetry, V0.4 | Two oriented 1-simplices | Square shuffle is two triangles with opposite permutation signs; factor flip reverses the square orientation by (−1)^(1·1)=−1. | Retain actual shuffle, not an unsigned product. |
| Super-to-native adapter, V0.5 | (q,σ,r)=(0,1,1), (1,1,1) | τ=1,0; conjugation factors −1,+1. Differential sends (q,σ) to (q+1,σ+1), preserving τ. | Retain; native cochain parity alone misses first case. |
| V1 zero-fiber and identity axioms | One trivial chart s(x)=x²−1, d=0 | Zero set {−1,+1}; X∅ is these two points; ψ is their identification; s∅=0; ψII=id. | Retain; full chart dim 1=d+1. |
| V1 composition, intersection and inverse-image axioms | Product chart with two independent coordinates | Setting coordinate 2 then 1 to zero gives (0,0), equal to setting both at once; full footprints intersect to full footprint. | Retain; arbitrary unrelated footprint maps would fail. |
| V1 quotient and extra-factor freeness | Free C₂ two-point cover versus ineffective C₂ point | Both quotients are pt; stabilizers have orders 1 versus 2. With X∅reg=pt only the free cover passes; with X∅reg=∅ the ineffective chart is allowed. | Retain distinction. |
| V1 projection and covering | s(x)=x on ℝ over regular point; s(x)=x² at 0 | First local projection derivative/topological model has one sheet; x² has two points over positive values and none over negatives, so is not a projection at 0. | Retain requirement over preimage of the lower regular locus. |
| V1 negative regular dimension | d=−1, E=0 versus E=ℝ and Xα=pt, s=0 | Expected dimensions −1 versus 0; first regular locus empty; second has a 0-dimensional regular chart and nonempty base. | Retain; negative virtual dimension does not force empty base. |
| V1 boundary restriction | Regular [0,1], d=1, E=0 | Boundary has two 0-dimensional points; a regular 0-manifold has empty boundary. | Retain d−1, not max(d−1,0). |
| V1 smooth strengthening | Smooth s=x²−1 chart; lower regular locus empty | Smooth chart ℝ; zero set two points; footprint regular-preimage condition is empty, while identity chart map is a diffeomorphism. | Specify the source's exact preimage domain under R05. |
| V1 finite-subatlas and reindexing | Cover V{a}∪V{b}=X; duplicate a-index | Union index set {a,b} is finite and covers. Two copies of a require Eₐ⊕Eₐ (rank 2 if rank Eₐ=1), not rank 1. | Retain separate finite-sets-over-A extension. |
| V2 deformation equations | s=x, I=J=B={a}, d=0, E=ℝ | Equation x=te, t≥0 gives coordinates (e,t), dimension 2=0+1+1. At t=0, x=0. | Retain. |
| V2 active-locus exclusion | s=x², X∅reg=∅ | At t=0 the regular condition fails; for t>0, e=x²/t gives a smooth topological chart (x,t). | Retain; no unwanted singular t=0 point. |
| V2 support ZK and closedness | Above s=x model, K=X or ∅ | Z_X={e=0,x=0}; Z∅=∅; both closed. For K=X, complement means e≠0. | Retain. |
| V2 deformation-space arrows | Remove an obstruction coordinate at t=0 | x-coordinate lies in the required zero fiber; projection keeps e unchanged and sends x via ψ. Two removals give ψIK=ψIJψJK. | Retain actual source subtypes. |
| V2 manifold/tame-boundary model | Nonnegative t and physical coordinate y≥0 | Quadrant dimension 2; angular doubling maps [0,π/2] to [0,π], physical ray to one closed boundary ray, edge to 0. | Retain tame half-boundary, not a missing edge. |
| V2 orientation order | One obstruction and one parameter line | D has dimension 1+1=2; exchanging the two odd factors gives −1 on both tensor and determinant descriptions. | Retain recorded order. |
| V2 partial cochain indexing | d=1,m=0, q=0,1,2 | Rᵠ=C₁,C₀,0; boundary goes from q to q+1. | Retain. |
| V2 boundary cone differential | Symbolic two-term boundary chain a and ambient b | D²(b,a)=(∂²b+∂ia−i∂a,∂²a)=(0,0); replacing −∂a by +∂a leaves 2i∂a. | Retain minus sign. |
| V2 support restriction direction | K=∅⊆L=pt | Pair quotient map goes C(pt,∅)→C(pt,pt)=0, agreeing with F(L)→F(K), not the reverse. | Retain contravariance. |
| V2 normalized interval arrows | Free orbit c=[a]+[b], removed factor C₂ | Raw quotient sends c↦2[pt]; normalized arrow sends c↦[pt]. Pullback of constant 1 is (1,1), not (1/2,1/2). | Retain separate normalizations. |
| V2 finite flag total | Poset 0<1, constant ℚ diagram | Degree −1 term ℚ maps to degree 0 ℚ² by c↦(−c,c); H⁰=ℚ, H⁻¹=0. Empty poset total=0. | Retain; ordinary colimit is not its chain model. |
| V3 local orientation descent | Reflection example R01 versus simultaneous reflection s=x | Virtual signs −1 versus (−1)(−1)=+1; invariant ranks 0 versus 1. | R01: assume local orientability. |
| V3 global orientation versus local orientability | Sign local system on S¹ versus constant line | Sign monodromy −1 gives no nonzero global trivializing section; constant monodromy +1 has one. Both fibers rank 1. | Retain distinction. |
| V3 homotopy K-descent | Two-point discrete X, K={a}, L={b} | Restriction ℚ²→ℚ⊕ℚ is identity; intersection term 0; exactness kernel/image both 0 at next term. | Retain finite MV and empty acyclicity. |
| V3 weak lower bound | d=0,m=1, cardinality I=1 | D dimension 2; q≤−3 corresponds to chain homology degree 1−q≥4>2+1, hence 0. | Retain safe bound independent of compact support choice. |
| V3 compact-support suspension | Y=pt, k=0,1,2, F=ℚ | H_c^k(ℝ^k;o)=ℚ matches H⁰(pt)=ℚ; other degrees 0. Reversing one coordinate changes the chosen generator by −1 on both sides. | Retain; proof route needs the interval/sheaf adapter. |
| V3 partial purity and boundary stalks | Empty-index pt; half-line boundary point | H⁰ partial=ℚ at pt; relative boundary stalk=0, absolute cone stalk=ℚ. | Retain under R01. |
| V3 finite quotient descent | Ineffective C₂ point; sign line | Plain coarse pullback ℚ→ℚ is identity; arbitrary sign-equivariant upstairs line has invariants 0. | Retain TS3 scope; R01 excludes false line descent. |
| V3 footprint gluing and diagonal comparison | Regular empty-index pt with a redundant free two-sheet chart | V∅=V{a}=pt; every required intersection=pt; both normalized local generators represent 1. | Retain union/intermediate-footprint conditions. |
| V3 global virtual/Čech comparison | Regular pt and oriented circle | Degree 0: ℚ=ℚ on pt; circle degree 0 and 1 each ℚ on the ordinary duality model and Čech sides. | Retain comparison target under R01. |
| V4 obstruction homology/generator | E=0, ℝ; reflection on ℝ with dual coefficients | H⁰(B)=ℚ in both ranks; other degrees 0. Reflection acts by (−1)(−1)=+1, so the generator remains 1. | Retain. |
| V4 global trace cocone | Group orders 2 and 3, or 6 and 4 | (1/2)(1/3)=1/6; (1/6)(1/4)=1/24. Free C₂ orbit: weighted trace c↦1 through either endpoint. | Retain README correction to source. |
| V4 trace support limitation | X={a,b}, K={a}, E=0, point above b | Point above b lies outside ZK but pr_e=0; target complement E\0 is empty. For K=X no such complement point exists. | Retain global-relative-only trace. |
| V4 native shift correction | d=1, q=0,1,2; d=−1, q=−2,−1,0 | Multipliers −1,+1,−1 in both cases; next multiplier equals (−1)^d times current; degree q=d multiplier +1. | Retain. Also tested d=−3,0,2,3. |
| V4 functional composition | Point atlas with ineffective C₂, d=0 | κ and ε identify generators with 1; τ sends generator to 1/2; Φ(1)=1/2, not 1. | Retain; no claimed distinguished Čech input class. |
| V4 finite-subatlas inclusion/union | Add one trivial rank-one obstruction to regular point atlas | Generator tensor 1⊗1 maps to 1; both traces evaluate 1. Comparing B₁,B₂ through their union gives 1 on both routes. | Retain same-atlas scope. |
| V4 negative dimension / empty input | d=−1 with nonempty point base; X=∅ | Čech⁻¹(pt)=0, hence Φ=0; Čechᵈ(∅)=0, hence Φ=0. | Retain, but keep these as README Checks. |
| V4 unrelated-atlas counterexample | Real x², x³; complex z²,z³ | Real local degrees 0,1; complex degrees 2,3. Equal underlying zero point does not make 2=3. | Retain specified-comparison requirement. |
| V5 exact triangle / outward-first boundary law | Oriented interval [0,1] | δ(a,b)=(b−a)η; ΦI(η)=1; Φ∂I(a,b)=−a+b. Both composite values b−a. | Retain boundary/parity adapter. |
| V5 boundary pushforward / cobordism | Interval mapped to pt; cylinder over pt | Boundary pushforward −1+1=0; endpoint functionals both evaluate 1. | Retain actual continuous extension. |
| V5 shrinkings, isomorphisms, refinement zigzags | s=x on ℝ and restriction to (−1,1) | Local degree at 0 is 1 in both; identity/relabel compositions act as 1. | Retain verified atlas axioms for the shrinking. |
| V5 functional pushforward / disjoint union | Two positively oriented points→pt | Pullback of 1 is (1,1); sum functional gives 2; identity pullback gives 1 at each point. | Retain; no assertion that target VFC must equal 2. |
| V5 finite-CW realization | Y=pt, constant ℚ coefficients | Hom(H⁰(pt),ℚ)=ℚ pairs with H₀(pt)=ℚ by a·b; functional 1↦1/2 is realized by (1/2)[pt]. | Retain UCT and comparison hypotheses. |
| V5 wild-source warning | Warsaw-circle example | Singular H₁=0 versus Čech H¹=ℚ; dual Čech virtual generator is nonzero. | Retain; source example at `pardon2016 line 801`. |
| V5 manifold and Euler normalization | Empty-index point; s=x²−ε and s=x³−ε | Point class 1; two real roots have signs −1,+1 summing 0; cubic single real root has sign +1. | Retain finite-dimensional section comparison. |
| V5 perturbation collar / compactness | Boundary half-line with s=x versus an already transverse boundary restriction | Ambient derivative of x at 0 has rank 1; boundary derivative rank 0, so excluded by README boundary hypothesis. Fixed compact support K gives total zeros in compact K×[0,1]. | Retain boundary condition; source has the error noted below. |
| V6 lower-semicontinuous stratification | Two incomparable labels on ℝ versus ℝ\0 | Connected ℝ admits only one constant label; punctured ℝ has two clopen components and both labels. Zero-fiber points ±1 receive opposite labels only in the latter model. | Retain negative control at line 158. |
| V6 cell-like face condition | Quadrant with separate edges versus codimension collapse | At corner, two separate edge closures each have a half-line boundary model; their collapsed union would make the corner interior of a line, contrary to prescribed lower boundary {0}. | Retain incidences, not just codimensions. |
| V6 normal-line incidence / d² | Oriented square | ∂square=bottom+right−top−left; each vertex occurs twice with coefficients +1 and −1, totaling 0. | Retain geometric maps; unrelated +1 signs give coefficient 2. |
| V6 invariance of domain | m=0; x³ on (−1,1); x² on (−1,1) | Images pt, (−1,1), [0,1); first two open, third not open and map not injective. | R02: consume B2.9, do not rebuild. |
| V6 restricted strata | Regular interval with endpoints and interior | Closed interior stratum model ([0,1],{0,1}) has dim 1; endpoint models (pt,∅) have dim 0. Boundary restriction d−1=0. | Retain restricted-atlas and normal-line targets. |
| V6 stratified quasi-isomorphism | Interval's two endpoints plus open edge | The relative-stratum cohomology model is ℚ²→ℚ, (a,b)↦b−a in degrees 0,1; H⁰=ℚ and H¹=0, matching the absolute virtual interval complex. Generator coefficient is 1. | Retain full quasi-isomorphism target, not just Euler count. |
| V6 product atlas and trace | Ineffective point groups C₂,C₃ | Product isotropy order 6, obstruction dimensions add; product weight (1/2)(1/3)=1/6. | Retain ordered product and invariants. |
| V6 relative product boundary | Two intervals | Product square boundary has four edges; relative fundamental class degree 2 and group ℚ, equal to ℚ⊗ℚ from degree-1 relative factors. | Retain union of physical faces. |
| V6 finite nerve / orientation double cover | Point with two repeated cover sets; sign system on S¹ | Repeated nerve is an interval: C⁰=ℚ²,C¹=ℚ,d(a,b)=b−a,H⁰=ℚ. Sign circle system has H⁰=H¹=0 over ℚ. | Retain normalization and sign-isotypic descent. |
| V6 Čech product and finite rank only before colimit | S¹×S¹, constant ℚ | Degree 1: ℚ²=ℚ⊕ℚ; degree 2: ℚ=H¹⊗H¹. Exchange of degree-1 generators is −1. | Retain; no dual-tensor identification for infinite-dimensional limits. |
| V6 product functional and unit | Two point weights 1/2,1/3; unit pt weight 1 | Product value 1/6; multiplying by unit preserves 1/2. Other bidegrees contribute 0 by definition. | Retain associativity/unit targets. |
| V7 joint ambient normal model | f(θ)=sin θ, g=0 near θ=0,π | Normal derivatives +1,−1; each is a local submersion in the ambient circle. Restricted to its zero fiber, the normal map is identically 0. | Retain ambient, not fiber-only, chart requirement. |
| V7 W-cover and fiber topology | Same example; W all zeros versus W={0} | Full cover has two points; W={0} misses π, so fails coverage. Diagonal preimage is closed in compact S¹×pt. | Retain separate cover witness. |
| V7 fiber dimension / orientation | dX=0,dY=0,n=1 and mI+mJ=2 | Virtual dimension −1; regular chart dimension −1+2=1, not negative. With mI+mJ=0 chart dimension −1, hence empty. | Retain full-dimension test. |
| V7 deformation-pair inclusion | Same obstructions in source/target | e≠0 remains e≠0; both trace targets have homological degree m at q=dZ. Removed-group weights agree exactly. | Retain same global-relative pairs. |
| V7 shift sign | n=1,dZ=0,q=0,1 | Inclusion multipliers +1,−1; native shifted differential contributes −1; chain-map square gives −∂ on both routes. | Retain degree-dZ generator normalization. |
| V7 Thom support class | sin θ into ℝ, Y=pt | Relative degree-1 class has two local signs +1,−1; absolute pulled-back class ū=0 since H¹(ℝ²)=0. | Retain support before forgetting. |
| V7 extension of classes and tautness | Z={0,π}, a=(1,0) | Restriction from two disjoint arcs can be (1,0); from a neighborhood of image {0} in M it is always (c,c). | Retain extension in P, not in M. |
| V7 supported Gysin definition | Same a and normal ν=x−y | i!(1,0)=η, i!(0,1)=−η; scalar cup with ū alone gives 0 for both and is wrong. | Retain supported construction; fix exact sign in R05. |
| V7 projection formula sign | Local class a, odd b, n=1 | a·b·u=−a·u·b; n·deg b=1 gives factor −1 on the proposed right side. | Retain right-cup convention. |
| V7 pullback-class formula | i*1=(1,1) in sine example | i!(1,1)=η−η=0=1⌣ū. | Retain; does not determine i! on (1,0). |
| V7 VFC/Gysin identity | Two oriented zeros of sine; a=(a₀,aπ) | ΦZ(a)=a₀−aπ; ΦS¹(i!a)=ΦS¹((a₀−aπ)η)=a₀−aπ. | Test agrees; general positive-degree comparison remains a proof target. |
| Application interfaces | Same underlying point, z² versus z³ atlases | Φ₂(1)=2 and Φ₃(1)=3; no unspecified auxiliary-choice equivalence may identify them. | Retain actual application comparison witnesses; no automatic GW laws. |

All twelve declared Lean objects were also checked against their actual bodies:

| Declaration | Instances and computed values | Result; change |
| --- | --- | --- |
| `CoveringGroup` | I=∅ gives one function; one C₂ factor gives 2 elements; C₂ and S₃ give 12. | Body is native Pi; delete if no headline uses it (R03). |
| `ObstructionTuple` | Empty tuple dimension 0; one ℝ factor dimension 1; two factors dimension 2. | Body is native Pi, not an invented direct sum. R03. |
| `NonnegativeParameters` | Empty tuple has one value; t=0 and t=1 admitted; t=−1 rejected. | Native subtype correct. R03. |
| `activeIndices` | t=(0,1) gives {second}; t=(0,0) gives ∅; t=(1,1) gives both. | Strict positivity correct. R03. |
| `Thickening` | ℝ, s=x², reflection, trivial obstruction action: s(−x)=x²=s(x). s=x with same actions gives −x≠x at x=1. | Equivariance discriminates; record still lacks full atlas. R03. |
| `ZeroFiber` | s=x²−1 gives {−1,+1}; s=x²+1 gives ∅; s=0 gives full carrier. | Actual subtype. R03. |
| `expectedDimension` | (d,m)=(−2,1),(−1,1),(0,0) gives −1,0,0. | No truncation; finite-dimensionality dropped only on this total expression. R03. |
| `RegularCoordinateAt` | Real chart d=0,m=1 gives n=1; point chart d=−1,m=1 gives n=0; d=−2,m=1 impossible. | Dimension equality and membership preserved. R03. |
| `no_regularCoordinate_of_negative` | Expected dimension −1 forbids every n≥0; at expected dimension 0 antecedent false and point chart exists. | True boundary case, padding; delete under R04. |
| `RelativeChains` | (pt,∅) H₀=ℚ; (pt,pt) H₀=0. | Untwisted native alias; R03. |
| `obstructionPair` | E=0 gives (pt,∅); E=ℝ gives (ℝ,ℝ\0); 0 belongs to ambient but not subspace. | Native pair constructor, no finiteness assertion. R03. |
| `VirtualKComplex` | On pt, zero functor H⁰=0 and constant ℚ[0] functor H⁰=ℚ both inhabit it. | Only an ambient functor category, no acceptance headline; R03. |

## Not verifiable

- The worker's original fifteen-target sample cannot be replayed: the supplied brief reports none found by heading and gives no target identifiers. The explicit fifteen-target fallback above was fully checked instead.
- Pardon is legally readable and was fetched successfully; there are no missing or paywalled cited texts to request. Many target-specific locators are absent rather than inaccessible (R06).
- V6's orientation-cover finite-nerve/sheaf comparison and V7's all-degree supported Gysin/virtual comparison are additional constructions, not proved results at the cited Pardon locators. The small-instance and sign tests above do not certify their general proofs. The README correctly identifies the diagonal extension as its own work; no fabricated source certification is claimed.
- The remaining deep headlines cannot be truth-tested by the supplied Lean file: it states none of them. The successful elaboration and twelve-signature inspection establish the meanings of its sketches, not purity or the VFC laws (R03).
- Ownership was searched across main, board packages, the roadmap index and the relevant supplied open-head files; this is an object-level audit, not a line-by-line review of every unrelated open roadmap. No unsupported claim about a newer upstream library was used.

## Source issues

- **Error** in pardon2016 at Definition 4.2.6, printed p.36: the source says the global trace uses raw projections at flag length zero; it should be weighted by 1/|Γ_J| to match its normalized interval arrows; affects a stated result.
- **Error** in pardon2016 at Definition 5.3.1, printed p.44: the source says ambient surjectivity defines the regular locus also for boundary bases; it should additionally require surjectivity along the boundary tangent space at boundary points; affects a stated result.

For the first erratum, a free two-point C₂ chart over a regular point sends its invariant sum to 2 by raw projection but to 1 after the normalized interval arrow and endpoint projection. The corrected projections both give 1. For the second, B=[0,∞), the trivial real line bundle and s(x)=x have a singleton zero set at the boundary: ambient derivative rank 1, boundary derivative rank 0. Declaring it a regular dimension-zero boundary chart contradicts the empty boundary of a zero-manifold. The README's collar/boundary-transversality restrictions avoid this instance. No published correction was verified.
