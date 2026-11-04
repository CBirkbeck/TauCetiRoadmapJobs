# FIX-RT-TopologicalMirrorSymmetryForHitchinSystems~2

Findings of red-team round 2, passes a (F01–F03) and b (F01–F03), each settled once below. Line numbers of the old text refer to `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md` at the reviewed head; new line numbers refer to the repaired file.

## RT-TopologicalMirrorSymmetryForHitchinSystems~2a/F01 (P3) — applied

Verified: the Check at old line 413 restated the API bullet of §1.3 (a μr-neutralization gives a point of Split′), and the discriminating instance of the failed converse is already the first Check of that section (the real Hamilton gerbe). The Check at old line 203 restated the §0.2 API bullet on the integer-exponent subalgebra without specializing q, a or s. Old: both Checks present. New: both deleted; the API bullets stay. §0.2 keeps three Checks (q=4 root choice, ℒ⁰ on the nontrivial-character point, bidegree of ℒ versus ℤ(1)); §1.3 keeps four.

## RT-TopologicalMirrorSymmetryForHitchinSystems~2a/F02 (P2) — applied

Verified: old §3.9 line 814 asked for the powered universal-family gerbe, its commutator pairing and the sector sums, while §4.4 constructs the Γ-equivariant gerbe and α_PGL,L′, and §3.9's Needs named no provider. Old: the gerbe-sector obligation inside §3.9. New: §3.9 keeps the geometry only (M_SL^L is one point, Γ acts trivially, M_PGL^e=BΓ, zero tangent spaces, no free locus; Needs gains §3.1 and §3.3); a new target §4.8 "Genus-one canonical gerbe sectors", placed at the end of Layer 4 after §4.7 (hence after §4.4 as asked), states nondegeneracy of the commutator (Weil pairing to a unit exponent), the transgression characters ν↦(ν,γ)^c, the sector sums 1+0+⋯+0 over ℂ and over every finite field of §5.1 including nonconstant Γ, with five Checks and a proof route; the Lean docstring lists it as not statable. Repointed: Summary (line 15), §4.7 (text and the n=2 Check), §5.1 (route and Needs), §5.3 (route and Needs), §5.4 (Check and Needs), §5.6 (route and Needs), Layer 4 and Layer 5 Dependencies, Worked examples.

## RT-TopologicalMirrorSymmetryForHitchinSystems~2a/F03 (P2) — applied differently

Verified at `packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md`: H.0/mixed-hodge-module (line 619) gives the point comparison on `TauCeti.Hodge.MixedHodgeStructure`, H.0/abelian-strictness (653) strictness, H.1/operations (683) the six operations and localization triangles, H.1/weight-bounds (717) the 𝔾_m witness H_c¹=ℚ(0), H_c²=ℚ(−1), P/pair-cohomology (1204) compact cohomology at f=0 on smooth quasi-projective U with Hodge-module coefficients, P/pair-kunneth-duality (1257) Künneth and the (−d) trace. That roadmap is line 178 of the merge order, this one 314. Old: gap `geometric-compact-mhs` on HodgeStructures asked for the whole geometric theory. New: a "From TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory" contract consumes those six nodes, with the 𝔾_m and 𝔸¹ values; the gap is narrowed to the extension to separated finite-type varieties, character-field coefficients, finite-group projectors, finite-monodromy adapters and SNC comparison; every Needs line and Dependencies line that cited the gap now cites the import beside it; §0.1's route and G=1 API bullet name P/pair-cohomology at f=0.

Differently: the residual gap is assigned to MixedHodgeModulesAndIrregularHodgeTheory (section "H.0/mixed-hodge-module; H.1/operations; P/pair-cohomology; P/pair-kunneth-duality"), not to HodgeStructures as the repair text says. HodgeStructures is a completed roadmap on main, earlier than MixedHodgeModulesAndIrregularHodgeTheory in the order; asking it to "extend that supplied realization" would make an earlier roadmap consume a later one, which the single-direction-of-supply principle forbids. The plan's `gaps` entry carries the same `needs` sentence, supplier and section.

## RT-TopologicalMirrorSymmetryForHitchinSystems~2b/F01 (P2) — applied

Verified with `roadmaps show MotivesAndAlgebraicCycles` (head of its open pull request, reader line 929): §4.20 defines `K₀Var k` over any field with the closed/open relations, product, universal property, `[X]=[X_red]` and `𝕃=[𝔸¹]`, and says no characteristic-zero blow-up presentation is assumed. MotivesAndAlgebraicCycles is line 82 of the merge order. The Logic roadmap's own text could not be read here: `roadmaps show` reports it on neither main nor any open roadmap pull request, so the review's quotations of its lines 22, 83 and 632 are unverified; the ownership verdict rests on §4.20 alone. Old: gap `equivariant-grothendieck` on LogicAndDefinabilityInNumberTheory, "Layer 3"; §0.2 took the ring from "the equivariant scissor supplier contract". New: contract "From TauCetiRoadmap.MotivesAndAlgebraicCycles" consuming §4.20, with the gap (supplier MotivesAndAlgebraicCycles, section 4.20) asking for K₀^G(Var_k) over any field and over finite-type R⊂ℂ for a finite list of varieties, the Bittner presentation in characteristic zero and the distinction from the representation quotient; the Logic contract keeps only §§2.5, 2.7–2.9, 2.11–2.12; §0.2 names K₀Var k and the spread-out ring over R; §0.3's G=1 Check names the ring; §§0.1–0.3, 0.5 Needs and Layer 0 Dependencies cite MotivesAndAlgebraicCycles §4.20; the plan's gap entry matches.

## RT-TopologicalMirrorSymmetryForHitchinSystems~2b/F02 (P3) — applied

Verified: "(uncertified)" in §5.4, "cited without a certified source text" and "Source status: uncertified." in References record the manifest's status, a process state. Old: those three phrases. New: deleted; the References sentence now reads that GWZ20 locators refer to the published version and the other locators to the open preprint versions. `sources.toml` is unchanged and still records GWZ20 as uncertified.

## RT-TopologicalMirrorSymmetryForHitchinSystems~2b/F03 (P3) — applied

(a) Verified: all contracts are under "Exact supplier contracts" above Layer 0. Old: "the equivariant scissor realization supplier contract below" (§0.1, §0.2, §0.3 Needs, Layer 0 Dependencies) and "the rank-one unitary-family supplier contract below" (§1.5 Needs, Layer 1 Dependencies). New: the first becomes "TauCetiRoadmap.MotivesAndAlgebraicCycles §4.20" with the slug `gap:equivariant-grothendieck` where not already present; the second becomes the slug `gap:unitary-splitting-families`, with the duplicate in §1.5 removed.
(b) Verified at the open-pull-request head of CountingBundlesAndHallAlgebrasOfCurves (`TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md`): §7.3 stable canonical Higgs moduli (line 1156), §8.3 all-characteristic coprime Higgs count (1238), §10.4 degree-independent universal bundle count (1394). Old (§4.1): "the canonical GL carrier and the separate all-degree counting theorem of CB are imports". New: "The canonical GL carrier is CountingBundlesAndHallAlgebrasOfCurves §7.3; its canonical coprime counting formulas of §§8.3 and 10.4 are not used here."
(c) Old (§1.1 Check): "pulled back from R to Spec R". New: "For U=V=Spec ℝ, the μ₂-gerbe whose class is the nonzero element of H²(ℝ,μ₂)≅Br(ℝ)[2], the class of the Hamilton quaternions, is arithmetic, since it is neutral over ℂ, but is not neutral over ℝ." Pattern: the §1.3 Check "on X/R with X(R) nonempty" meant the same field and now reads "a curve X/ℝ with X(ℝ) nonempty" with the Hamilton gerbe pulled back.

## Checks run

- `lake env lean …/Suggested.lean` from the content checkout: exit 0, no output. The file still declares nothing; the changes are one docstring bullet for §4.8 and a `module` header line before `import Mathlib`, which silences the worker's warning that a non-module file imports Mathlib, a package built for the module system (the form used by the `module`-headed `Suggested.lean` files already on main).
- `#check @name` scratch file: not applicable, the file has no declarations, so there is no elaborated signature to compare with the README.
- Dependency check: `depcheck: 207 roadmaps, 1785 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: one lead, unchanged from before this round and not in the findings: "LogicAndDefinabilityInNumberTheory §2.11: no roadmap LogicAndDefinabilityInNumberTheory on main or in an open pull request" (the roadmap is line 153 of the merge order and its board folder holds only reports and a manifest). Lean names: none unresolved.
- No `needs-references.toml` entry was needed; no source was fetched. GWZ20 remains cited by locator as the manifest settles it.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §4.8 commutator nondegenerate, n=2, d=1 | Γ=C₂²; alternating μ₂-valued forms on 𝔽₂² | one-dimensional space of alternating forms, nondegenerate one is e₂; End(E)≃O⊕N₁⊕N₂⊕N₃ has rank 4=|Γ| | holds; stated as Check |
| §4.8 nondegeneracy route | radical element N₀≠O | φ_(N₀) locally central ⇒ section of the centre summand N₀; H⁰(N₀)=0 for degree-zero nontrivial N₀, contradiction | route sound; sentence tightened to prove End(E)≃⊕N before using it |
| §4.8 sector sum over ℂ, n=2 | neutral gerbe versus commutator gerbe | 1+1+1+1=4 versus 1+0+0+0=1; E(M_SL^L)=E(point)=1; ordinary E(BΓ)=1 | twisted value 1 matches the SL side; neutral gerbe refuted as a Check |
| §4.8 finite-field count, Γ constant, n=2 | four torsors ν, mass 1/4, sector γ≠0 | traces 1,1,−1,−1, sum 0; γ=0 sum 1; total 1=#Spec 𝔽q | holds |
| §4.8 nonconstant Γ | Fr fixes a, swaps b↔a+b in C₂²; q≡1 mod 8 | (Fr−1)Γ={0,a}, H¹ order 2=|Γ(𝔽q)|; character of γ=a on classes {0,a},{b,a+b} is 1,−1, sum 0; total 1 | holds; Check added |
| §4.8 n=1 | Γ=1, band μ₁ | one sector, 1=1 | holds |
| §4.8 ages | Γ on a point | tangent space 0, every age 0; (xy)^0=1 and q^0=1 | no shift enters |
| §4.8 point gerbe | k=ℂ, k=𝔽q | H²(ℂ,μn)=0, H²(𝔽q,μn)=0 (cd 1), so α_SL,L on Spec k is neutral; the content is the extension class in H²(Γ,μn) | stated |
| §4.8 exponent c | powered gerbe α^d, d a unit mod n | c·d is a unit; nondegeneracy preserved; for n=2 c=1 forced | only invertibility of c is claimed |
| §3.9 genus-one geometry | n=2,d=1; stable E, θ trace-free | θ∈End₀(E)=0; det(E⊗N)=L⊗N²=L; dimension (n²−1)·0=0 | one point, Γ fixes it |
| §5.3 genus-one fibre | a=0 and a≠0 | base A=k^(n−1), fibre over 0 is the point, other fibres empty; traces 1=1 | branch added |
| §5.6 genus-one isotypic identity | χγ on the trivial Γ-action point; γ-sector of BΓ | left 1 (γ=0) or 0; right 1 (γ=0) or 0 by the §4.8 sum | branch added without §5.5 |
| MHM import, 𝔾_m and 𝔸¹ | f=0, U=𝔾_m, U=𝔸¹ | H_c¹=ℚ(0), H_c²=ℚ(−1) ⇒ E=xy−1, count q−1; H_c²=ℚ(−1) ⇒ E=xy, count q | agrees with §0.1's A¹ Check; recorded in the contract and as a Check |
| MHM import scope | singular separated variety; finite-monodromy local system with character χ of order 3 | MHM only on smooth quasi-projective U with closed supports; χ-eigenspace needs ℚ(ζ₃) coefficients, absent from a rational category | both left in the narrowed gap |
| Residual gap owner | HodgeStructures (main, completed) versus MixedHodgeModulesAndIrregularHodgeTheory (order line 178) | an earlier roadmap cannot consume line 178; this roadmap is 314 | gap placed on MixedHodgeModulesAndIrregularHodgeTheory |
| Motives §4.20 import, G=1 | [ℙ¹], [𝔾_m], fat point | 1+𝕃, 𝕃−1, 1 at the source; E-realization 1+xy, xy−1, 1 | matches §0.2's ℒ convention (bidegree (1,1)) |
| Equivariant ring gap, G=C₂ on 𝔸¹ by sign | trivial and sign characters | E realizations xy and 0, counts q and 0 over 𝔽₃ (3 = 1/2+1/2+1+1 for the trivial character) | consistent with §0.1 Checks; the class lies in the requested extension, not in K₀Var k |
| Real Hamilton gerbe Checks | Spec ℝ; curve X/ℝ with a real point | H²(ℝ,μ₂)≅Br(ℝ)[2]=ℤ/2, neutral over ℂ; rigidified splitting sheaf of a base gerbe is terminal, so Split′ has a point while the gerbe is nonneutral | instance now named explicitly |
| §4.1 CountingBundles sentence | §7.3 carrier; §§8.3, 10.4 formulas | carrier consumed; formulas unused by the local-integration route | wording fixed |

## For the maintainer

- Two gap suppliers changed in `design/plan.json` and the README: `geometric-compact-mhs` moved from HodgeStructures to MixedHodgeModulesAndIrregularHodgeTheory (narrowed as above); `equivariant-grothendieck` moved from LogicAndDefinabilityInNumberTheory to MotivesAndAlgebraicCycles §4.20.
- Ownership against open pull requests: MotivesAndAlgebraicCycles was read at the head of its open pull request through `roadmaps show`; the Logic roadmap's head cited by review 2b could not be read with the tools of this brief, and the pre-existing citation lead for its §2.11 remains for the worker.
- The plan's node statements (not its `gaps`) still contain the "CB.7"/"CB" shorthand in a few places; those fields are outside what this round may edit.
- New section name other roadmaps may cite: §4.8 "Genus-one canonical gerbe sectors". No name was deleted; §3.9 keeps its title.
