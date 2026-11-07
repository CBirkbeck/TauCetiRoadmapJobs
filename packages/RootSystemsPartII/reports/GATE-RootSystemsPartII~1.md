# GATE-RootSystemsPartII~1: answers to human review

One review (roed-math, 2026-11-06), three numbered items; item 2 makes two distinct points, so four findings. All repairs are in `TauCetiRoadmap/RootSystemsPartII/README.md` (commit `06bbb0c4`); `TauCetiRoadmap/RootSystemsPartII/Suggested.lean` is unchanged. #1196's head has moved since the review (3e78a6d → 265d185): what the review calls RootSystems §3.1 and §2.1 is now §6.1 *Irreducible components* and §5.1 *The actual base stabilizer*, and the repairs cite the numbering at 265d185.

## H01 (roed-math) — applied

§3.3 no longer proves the component decomposition itself (the old route used positive-root reflection descent plus the connected-diagram criterion). README line 246 now takes the irreducible components of RootSystems §6.1, and the transport clause of §6.1 makes σ permute the blocks. The RootSystems supplier contract (line 56) states what §6.1 provides: internal direct sum, each root in exactly one block, irreducible restrictions, transport by equivalences, and orthogonality under every positive-definite invariant form, applied here to `RootPairing.RootForm`. Scope (line 13) records that §6.1 owns the decomposition, and the §3.3 *Needs:* line cites it. `RootPairing.Base.IsPos.induction_on_reflect` and `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix` were left with no consumer here, so they are removed from the supplier contracts.

## H02 (roed-math) — applied differently

The six-layer RootSystems titles are gone from line 55 (now 56–58) and from lines 7, 113, 168, 199 and 289. Old Layers 1, 4, 5 and 6 are now the native Tau Ceti declarations, with `TauCeti.posRoots`, `TauCeti.exists_mem_support_height_reflectionPerm_lt` and `TauCeti.weylGroup_eq_closure_simple` added to the contract (lines 45–46). The suggested mapping old Layer 2 → RootSystems §1.1 (marked presentation, now §2.1) is not applied, because nothing here uses the Coxeter presentation. The fixed-Weyl argument of §2.3 needs only simple generation of the folded Weyl group (`TauCeti.weylGroup_eq_closure_simple`, `TauCeti/LinearAlgebra/RootSystem/SimpleReflections.lean` line 122, now in the §2.3 *Needs:*) and the inversion-count declarations it already cited. Line 58 says so.

## H03 (roed-math) — applied

Conventions line 19: a based automorphism (support preserved in both directions) is now identified as an element of the based subgroup of RootSystems §5.1, carried in every statement as the explicit hypothesis on σ. The supplier contract consumes §5.1 for that membership condition only. The two forms agree: for a bijection, `σ '' S = S` iff `∀ i, i ∈ S ↔ σ i ∈ S`; both directions are checked in the table below. The Lean hypothesis `hbase` is unchanged, since a roadmap's declaration cannot be imported.

## H04 (roed-math) — applied differently

Line 62 no longer names the paragraph. It cites "the paragraph of §9A.1b that derives the connected type dictionary and exports projection, distinct-orbit sum and full-k-sum as separate maps (the paragraph immediately before *Integral and full-Y comparisons*)". That locator holds on main and at every open head that changes ReductiveGroups, whereas the paragraph has three different names across them:
- *Exceptional certificates, types and components* on main, #1807 and #1854;
- *Exceptional fixed algebras, types and components* at #1676, #1797 and #1808;
- *Exceptional fixed Lie algebras, types and components* at #1332.

Using #1676's name would therefore break if #1332 merged first. #1676 is not made a dependency, and the other two paragraph names cited (*Signed orbit modules and brackets*, *Folded frame, finite Cartan and presentation*) are identical on all seven copies.

## Same defect elsewhere in the roadmap (no reviewer comment)

- LieHighestWeight Layer 2, cited in Scope line 7, is dropped at #1220's head (overlaps.md). Its content, the weights of a module and their integrality, is native at the pin: `TauCeti.integralWeightLattice` (`TauCeti/Algebra/Lie/Weights/WeightLattice.lean` line 188) and `TauCeti.exists_int_apply_coroot` (`TauCeti/Algebra/Lie/Weights/Integrality.lean` line 202). Line 7 now cites those, and keeps only LieHighestWeight Layer 6, whose title is the same on main (line 773), at #1220 (line 1260) and at #1797 (line 773).
- ReductiveGroupsPartII §RG2.1.4 *Minuscule coweights and the dominance order* and §RG2.4.3 *Dominant inertia-coinvariant cocharacters* were checked on main (lines 2421 and 5994) and resolve; no change was needed.

## Dependencies for the merge-order paragraph

- **Only an open revision defines:** RootSystems §5.1 and §6.1, defined only at #1196 (head 265d185), so #1196 merges before this roadmap.
  - #1196 is a revision, but two things allow the dependency here. First, it renumbers and renames the RootSystems layer headings this README cited; that is the "drops an id this roadmap cites" case. Second, it is the closest open roadmap in vocabulary and claims §6.1 ownership of the very decomposition §3.3 used. With RootSystems earlier in the merge order, the overlap rule gives ownership to RootSystems and a citation from here.
- **#1676 is not a dependency** (see H04).
- **Ownership against open work:**
  - The component decomposition and the based subgroup were searched by object in the sibling checkouts and with `roadmaps grep`. The owner is RootSystems (#1196 §§5.1, 6.1).
  - Nothing at the pins provides the root-system component decomposition: no such declaration in `TauCeti/LinearAlgebra/RootSystem`, and only `isIrreducible_iff_invtRootSubmodule` in Mathlib `LinearAlgebra/RootSystem/Irreducible.lean`.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Based automorphism ⇔ RootSystems §5.1 membership (`σ '' S = S` vs `∀ i, i ∈ S ↔ σ i ∈ S`) | A₂ reversal; s₁ in A₂; empty system; root-free real rank one | A₂ reversal: {1,2} ↦ {2,1}, both forms true. s₁ sends α₁ to −α₁ ∉ S, both forms false. Empty: S = ∅, both forms true for every automorphism. Root-free rank one: Aut = {±1}, S = ∅, both true, matching #1196 §5.1's order-2 check | agree | none |
| §3.3: σ permutes the §6.1 blocks; cycle factor c | A₁⊕A₁ swap; B₂⊕B₂ swap; D₄⊕D₄ with triality return; A₂ identity; empty | A₁⊕A₁ swap: c = 2, τ = id, (Du,Du) = (α₁+α₂,α₁+α₂) = 4 = 2·2, two folded roots ±(α₁+α₂), as in the §3.4 Check. B₂⊕B₂: entries stay −2,−1 and norms double. D₄⊕D₄: norms 12 and 4, entries −3,−1. A₂ identity: one block, c = 1. Empty: no blocks, no cycles, matching the §6.1 Check | consistent with §§3.3–3.4 Checks | none |
| Orthogonality of blocks under `RootForm` (§6.1 hypothesis "positive-definite invariant") | A₁⊕A₁; B₂⊕B₂ | `RootForm(x,y) = Σᵢ ⟨x,αᵢ∨⟩⟨y,αᵢ∨⟩`. For x, y in different blocks each term has one zero factor, because ⟨α_j,αᵢ∨⟩ = 0 across blocks; sum 0. Positive definite on the whole space under spanning (`posRootForm_rootFormIn_posDef` on the root span) | hypothesis met | none |
| §2.3 surjectivity via `TauCeti.weylGroup_eq_closure_simple` on Ψ (finite: range of a finite ι; reduced, crystallographic: fields; ℝ char 0 domain) | A₃ reversal → B₂; D₄ triality → G₂; rank 0 | B₂: two simple reflections generate order 8, equal to the fixed group's order 8 (§2.3 Check). G₂: order 12 = 12. Rank 0: closure of ∅ = {1}, both groups order 1 | holds | added to §2.3 *Needs:* |
| `TauCeti.exists_mem_support_height_reflectionPerm_lt` as the §2.2 lowering input | A₁; A₂; B₂ | A₁: every positive root is simple, hypothesis `j ∉ b.support` never holds. A₂: j = α₁+α₂, ⟨j,α₁∨⟩ = 2−1 = 1 > 0, s₁ j = α₂, height 1 < 2. B₂: j = e₁ = α₁+α₂, ⟨e₁,α₁∨⟩ = 1, s₁ e₁ = e₂ = α₂, height 1 < 2 | holds | replaces "RootSystems Layer 1" |
| LieHighestWeight sentence (line 7) | names at the pin; Layer 6 heading | `integralWeightLattice` at WeightLattice.lean:188 and `exists_int_apply_coroot` at Integrality.lean:202 both exist. Layer 6 title is identical at main:773, #1220:1260 and #1797:773 | resolves on main and all heads | rewritten |
| §9A.1b content locator (line 62) | main, #1332, #1676, #1797, #1807, #1808, #1854 | "Derive the connected type dictionary" at 1476/2975/2429/2994/1476/2443/1476. "Export projection, distinct-orbit sum and full-k-sum" at 1486/2985/2439/3005/1486/2454/1486. Next bold paragraph *Integral and full-Y comparisons* at 1506/3004/2458/3024/1506/2473/1506 | resolves in all seven | rewritten |
| Contract removals | uses left in README | `induction_on_reflect`: 0 uses (exists at Mathlib `LinearAlgebra/RootSystem/Base.lean` line 782). Irreducibility criterion: 0 uses (TauCeti `FiniteType/Irreducible.lean` line 179) | no dangling need | removed |

## Signature check

Suggested.lean is unchanged, so the 15 elaborated types of the supplied `#check @name` signature transcript still stand. I compared each with its README statement: no lost binders, and no change to any statement's generality. The transcript's line-59 "consider marking it as noncomputable" message comes from the scratch elaboration only. The module itself, including `foldedIndices`, builds with nothing but `sorry` warnings.

## Build

`lake build TauCetiRoadmap.RootSystemsPartII.Suggested`: `Build completed successfully (8961 jobs).` The only warnings are 10 "declaration uses `sorry`" (lines 35, 95, 113, 125, 142, 154, 168, 182, 204, 230).

## Gate

`gate RootSystemsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

`roadmaps resolve` on the edited README: no cross-roadmap citations and no Lean names found nowhere. No source was added or cited anew; `needs-references.toml` is not needed.
