<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1714#issuecomment-6400103538 -->
Red team round 1 pass b (claude) of fb5342d

Verdict: needs changes

1. **F01** (P1) Two cited continuation roadmaps exist nowhere

   Location: `packages/RootSystemsPartII/README.md:13` ("belong to the separate continuation RootSystemsPartIIDominanceAndDemazure. Integral representation bounds and minuscule detection belong to RootSystemsPartIIMinusculeBounds") and `README.md:362` ("The separate dominant-subtraction/Demazure and minuscule-bound continuations consume the integral order of §1.1").

   Claim: two named roadmaps own the affine/Demazure and the minuscule-bound directions and will consume §1.1.

   Witness: `tauceti-roadmap roadmaps grep 'RootSystemsPartIIDominanceAndDemazure|RootSystemsPartIIMinusculeBounds'` returns "no match on main or in any open roadmap pull request"; `packages/` on the board contains no such folder; `design/plan.json` `restructure.proposal` says "No files, jobs or atlas ids for the two proposed roadmaps are created by this submission."

   Repair: remove both names. Line 13 → "Dominant subtraction, affine Bruhat/Demazure theory, twisted Newton reduction and the affine action, as well as integral representation bounds and minuscule detection, are out of scope and belong to later continuations in RootSystems' direction; none of them supplies this roadmap." Line 362 → "Later continuations in RootSystems' direction (dominant subtraction and Demazure reduction; minuscule bounds) consume the integral order of §1.1 and supply no ingredient to the finite fold." A roadmap may be named only once it exists on main, as an open pull request or as a board package.

2. **F02** (P1) §4.4's proof route applies §4.3 to the root span, and no supplier restricts a root pairing to its root span

   Location: `packages/RootSystemsPartII/README.md:336` ("Put E = spanℝ Φ … apply §4.3 on the full integral-weight subgroup of E. Its orbit increment lies in Q ⊆ L"); `Suggested.lean:186–204` (`invariant_step` carries `[P.IsRootSystem]`); `Suggested.lean:209–211` (`ambient_coroot_step` has no spanning mixin).

   Claim: the ambient theorem follows from the spanning theorem by projecting the endpoints to the root span E and applying `invariant_step` there.

   Witness: `invariant_step` quantifies over a `RootPairing ι ℝ M N` with `[P.IsRootSystem]`; applying it "on E" needs a root pairing whose weight module is the root span (with coroots in a dual of E) together with the comparison of its base, chamber and cone with P's. At the pins no such construction exists: Mathlib has only the submodule `RootPairing.rootSpan` (`Mathlib/LinearAlgebra/RootSystem/IsValuedIn.lean:165`, an `abbrev` for `span S (range P.root)`) and no root-pairing-valued declaration on it; Tau Ceti's `TauCeti/LinearAlgebra/RootSystem/` has no definition returning a `RootPairing` on a submodule (`InvariantSubmodule.lean` contains one membership theorem, `RootPairing.root_mem_of_pairing_ne_zero`). RootSystems on main mentions the root span only for the canonical form (`TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:156`); no `*Needs:*` line of §4.4 names the restriction. The same gap sits under `README.md:31` ("apply it on the real root span" for `cartanMatrix_nondegenerate`, whose statement needs `[P.IsRootSystem]`).

   Repair: add to §4.4 (before `ambient_coroot_step`) a named target with signature: "`restrictRootSpan`: for a finite reduced crystallographic real root pairing P with base b, a root pairing on `P.rootSpan ℝ` and `P.corootSpan ℝ` (pairing the restriction of `P.toLinearMap`; roots `P.rootSpanMem ℝ i`, coroots `P.corootSpanMem ℝ i`), with `IsRootSystem`, `IsReduced`, `IsCrystallographic`, a base with support `b.support`, and for x ∈ E the equalities of simple-coroot values, of membership in `dominantChamber` and of membership in `posRootCone` with those of P. Perfectness of the restricted pairing comes from nondegeneracy of `P.RootFormIn ℝ` on the root span (`Mathlib/LinearAlgebra/RootSystem/Finite/Nondegenerate.lean`)." Add `restrictRootSpan` to the `*Needs:*` lines of §4.4 and cite it at `README.md:31` and `:336`. Alternatively state `invariant_step` without `[P.IsRootSystem]` on the fixed part of the root span; the realization structure as written (spanning on `fixedSpace P sigma`) cannot do this when central fixed directions exist, so the restriction target is the smaller change.

3. **F03** (P3) `stembridge_step` is weaker than its proof: endpoint integrality is never used

   Location: `Suggested.lean:38–39` (`hlam_int`, `hmu_int`), `README.md:92` ("distinct dominant λ,μ with integral simple-coroot values").

   Claim: the step needs λ, μ to have integral simple-coroot values.

   Witness: the route of `README.md:94` (Rap00 lines 195–214) uses only sign inequalities: case (i) ⟨β,αᵢ∨⟩ ≥ 0 from the root-sum theorem, case (ii) ⟨μ,αᵢ∨⟩ ≥ 0 plus nonpositive Cartan entries; integrality of λ, μ enters nowhere. Instance: A₁, λ = 0.1α, μ = 1.1α; pairings 0.2 and 2.2 (both dominant, non-integral); μ − λ = α ∈ Q⁺; β = α gives λ + β = 1.1α dominant with remaining budget 0. The same holds for `invariant_step`, `ambient_coroot_step` and `torsion_lattice_coroot_step`, whose route is fold + `stembridge_step` (§4.1's integrality transfer is then not needed for the step).

   Repair: delete `hlam_int`/`hmu_int` from `stembridge_step` and from the three invariant/ambient/torsion theorems; in `README.md:92` write "distinct dominant real λ,μ with λ ≤ μ in §1.1 (no integrality of the endpoints is needed; the lattice statement of Rap00, Lemma 2.3, is the special case λ,μ ∈ L)" and keep the sentence on increments staying in L. If the author prefers the lattice form, say in §1.2 that the real form is the one proved and the lattice form its corollary.

4. **F04** (P3) Unused hypothesis `hstable` in `ambient_coroot_step`

   Location: `Suggested.lean:215` (`hstable : ∀ x : M, x ∈ L ↔ sigma.weightMap x ∈ L`), `README.md:334` ("σ-stable additive subgroup").

   Claim: σ-stability of L is a hypothesis of the ambient step.

   Witness: the conclusion mentions L only through `(lam : M) + orbitSum P sigma i ∈ L`, which follows from `hroots` and additivity of L; fixedness is stated on M via `sigma.weightMap`. The `README.md:336` route never uses it. Instance: GL₂ cocharacter space M = ℝ² with root and coroot (1,−1); σ = identity on the root line and multiplication by 2 on the central line ℝ(1,1) (a based automorphism, with the same map as coweight map), so σ(1,0) = (3/2, 1/2); L = ℤ² contains the root but is not σ-stable; λ = (0,0), μ = (1,−1) are fixed, dominant, integral and comparable, and the conclusion holds with β = (1,−1), λ + β = μ ∈ L. Note also that `[FiniteDimensional ℝ M] [FiniteDimensional ℝ N]` are implied by the perfect pairing over a field and are harmless.

   Repair: delete `hstable` from `Suggested.lean:215` and "σ-stable" from `README.md:334`; keep "L ⊆ V an additive subgroup containing every root".

5. **F05** (P3) §2.2 re-derives the uniqueness of reflections that Mathlib provides

   Location: `README.md:151` ("One route observes that all linear automorphisms permuting the finite spanning root set form a finite group … Averaging a positive form over that group makes every candidate root reflection orthogonal … the reflection, and hence its coroot functional … is determined").

   Claim: choice-independence of the realization's coroots must be derived here from finiteness and spanning.

   Witness: `RootPairing.IsRootSystem.ext` (`Mathlib/LinearAlgebra/RootSystem/Basic.lean:197`, `[Finite ι] [CharZero R] [IsDomain R]`: two root systems with the same perfect pairing and the same roots are equal) and `Module.Dual.eq_of_preReflection_mapsTo` (`Mathlib/LinearAlgebra/Reflection.lean:339`: two reflections in the same root preserving a finite spanning set have equal coroots) state exactly this.

   Repair: replace the sentences from "One route observes" to "native reflection axioms" at `README.md:151` by "Two realizations with the same root vectors and evaluation pairing coincide by `RootPairing.IsRootSystem.ext`; the coroot of each folded root is the unique functional of `Module.Dual.eq_of_preReflection_mapsTo`." Add both names, with their files, to the Mathlib supplier contract (`README.md:25–35`).

6. **F06** (P3) §3.1's tree dichotomy is false as stated

   Location: `README.md:202` ("A tree automorphism either fixes a central vertex or exchanges the endpoints of its central edge. In the first case it preserves distance from that vertex").

   Claim: every automorphism of a finite tree either fixes a central vertex or swaps the two endpoints of the central edge.

   Witness: D₅ with the fork exchange (vertices 4 ↔ 5, path 1–2–3 with 4, 5 attached to 3): the tree has the central edge {2,3} (longest paths 1–2–3–4 and 1–2–3–5), the automorphism fixes both 2 and 3 pointwise and exchanges nothing; neither alternative holds. The conclusion (no adjacent pair in one orbit) still follows, since distance to the fixed edge is preserved and the two endpoints are fixed.

   Repair: "A tree automorphism fixes the centre: either a central vertex, or the central edge, whose endpoints it fixes or exchanges. When the centre is fixed pointwise it preserves distance from it, so adjacent vertices are never in the same orbit (two adjacent vertices have distances differing by one, except the two fixed endpoints). Only the exchange of the central edge's endpoints remains."

7. **F07** (P3) Padding: `rootLE` and `fixedSpace` restate library membership

   Location: `Suggested.lean:28–29` (`def rootLE … := y - x ∈ TauCeti.posRootCone P b`), `Suggested.lean:59–60` (`def fixedSpace … := LinearMap.fixedSubmodule sigma.weightMap`).

   Claim: both are definitions needed to state the headlines.

   Witness: each body is a single library term; every use can be inlined (`mu - lam ∈ TauCeti.posRootCone P b`; `LinearMap.fixedSubmodule sigma.weightMap`). `README.md:17` already names `fixedSpace` as notation for `LinearMap.fixedSubmodule`.

   Repair: delete both from `Suggested.lean`, inline their bodies at every use (`stembridge_step`, `invariant_step`, `ambient_coroot_step`, `OrbitSumRealization`, `fixedWeylGroup`'s companions, `fixed_weyl_group`, `invariant_*`), and keep `rootLE` and `fixedSpace` in the README as the names of the order and the fixed submodule (the README's Checks on them stay).

Package read in full: `packages/RootSystemsPartII/README.md` (377 lines, 13 bold targets, 53 Checks) and `packages/RootSystemsPartII/Suggested.lean` (263 lines, 17 declarations). Libraries checked at the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) by reading the files at those commits. Suppliers resolved on content main (RootSystems, LieHighestWeight, ReductiveGroups) and at the open head of ReductiveGroupsPartII. No Lean was elaborated in this pass (the board checkout has no Lake setup): the file is **not built** here; signatures were read against the pinned sources and against the package report's elaboration record.

## Dependency check

    depcheck: 52 roadmaps, 583 edges, 0 problem(s)

No UPWARD or CYCLE line. RootSystemsPartII is in `merge-order/ORDER.txt` (position 24) directly after ReductiveGroupsPartII (23); its suppliers are main (RootSystems, LieHighestWeight, ReductiveGroups) and ReductiveGroupsPartII, all earlier.

## Computed pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `rootLE` (§1.1) | PGL₂ coroot lattice ℤ, coroot 2; rank 0; A₂ | 2−0 = 2 ∈ 2ℕ, 1−0 = 1 ∉ 2ℕ; Q⁺ = {0} so comparison = equality; (1,1)−(0,1) = (1,0) ∈ ℕ², (1,0)−(0,1) ∉ | true as stated; R07 |
| `stembridge_step` | A₂ λ=0, μ=α₁+α₂; PGL₂; A₁ λ=0.1α, μ=1.1α | simple increments give pairings (2,−1),(−1,2); θ gives (1,1), budget 0; real instance works | true; integrality unused (R03) |
| `orbitIndices`/`orbitSum` | σ=id; A₂ reversal; D₄ triality | {i}, αᵢ; {1,2} ↦ α₁+α₂; outer orbit size 3, six iterates = 2(α₁+α₃+α₄) | true |
| `foldedIndices` | A₂ reversal | orbits {θ} and {α₁,α₂} both ↦ α₁+α₂, image has one element | true |
| `OrbitSumRealization` | A₃ reversal; D₄ triality; A₂ reversal; identity on ∅ | β₁=α₁+α₃: norm 4, β₂=α₂: norm 2, (β₁,β₂)=−2, ⟨β₁,β₂∨⟩=−2, ⟨β₂,β₁∨⟩=−1, β₂+2β₁ has norm 10 ∉ roots; D₄: norms 6, 2, inner −3, entries −3,−1, 12 roots; A₂: (f,f)=2 not 4; ∅: zero space | consistent; coroots determined by `IsRootSystem.ext` (R05) |
| `fixedWeylGroup`/`fixed_weyl_group` | A₃ reversal; D₄ triality; A₂ id; A₁×A₁ swap | W(B₂) order 8 = centraliser of σ in S₄; W(G₂) order 12; S₃ (pointwise stabiliser {1}); {1, s₁s₂} ≅ W(A₁) | true |
| `indexEquiv_eq_self_of_multiple_edge` | B₂, G₂, F₄, Bₙ/Cₙ paths | node exchange turns (−2,−1) into (−1,−2), (−3,−1) into (−1,−3); multiple edge unique and oriented | true |
| `simpleOrbit_pairing_eq_zero_or_typeA_even` | A₃, A₄, D₄, D₅ fork swap, E₆ | A₃: middle vertex fixed, outer pairing 0; A₄: middle pair pairing −1, n=2; D₄, E₆: branch vertex fixed; D₅: central edge fixed pointwise (R06) | true |
| `general_fold` | A₂ₙ reversal; A₁×A₁ swap; two D₄ with triality return; identity on B₂ | orbit sums of eₐ−e_b are f̃ₐ−f̃_b with f̃_c = e_c − e_{2n+2−c}: exactly ±fᵢ, ±fᵢ±fⱼ, a reduced Bₙ with 2n² roots, no 2fᵢ; ±(α₁+α₂); norms 12, 4, entries −3,−1; B₂ with 8 roots | true |
| `invariant_weight_transport` | A₂ reversal d=(1,1); orthogonal orbit of size k; wall λ=0 | middle: ⟨λ,f∨⟩ = 2(λ,f)/2 = 2d; orthogonal: 2·k·d·(α,α)/2 ÷ k(α,α) = d; 0 ↦ 0 | true |
| `invariant_cone_transport` | A₂ c(α₁+α₂), c=2; (α₁+α₂)/2; −(α₁+α₂); central vector | coefficients (2,2) ↦ 2; ½ ∉ ℕ; −1 in both lattices, in neither monoid; central vector in neither | true |
| `invariant_step` | D₄ (centre 2), λ=2ρ, μ=λ+θ, θ=(1,2,1,1) | values (2,2,2,2), (2,3,2,2); α₁+α₂ has values (1,1,−1,−1), λ+α₁+α₂ = (3,3,1,1), budget (0,1,1,1); triality orbit sum (1,3,1,1), budget (0,−1,0,0) fails; θ fixed, budget 0 | true (existential); refutes the source's inference (Source issues) |
| `ambient_coroot_step` | GL₂ λ=(c,c), μ=(c+1,c−1); torus with σ=2 on a central line; PGL₂ 0 vs 1 | increment (1,−1), coordinate sum 2c preserved; Q⁺={0}; 1 ∉ 2ℕ | true; route needs the root-span restriction (R02); `hstable` unused (R04) |
| `torsion_lattice_coroot_step` | A = ℤ⊕ℤ/2, r=(2,0), f(n,t)=n; τ(n,t)=(n,t+n mod 2) | λ=(0,1), μ=(2,1): β=(2,0), λ+β=(2,1); (0,0),(0,1): difference not in ⟨(2,0)⟩ℕ; τ fixes (2,0), moves (1,0) | true |
| Conventions row/direction | A₃ reversal; D₄ triality | aᵢⱼ=⟨αᵢ,αⱼ∨⟩ gives outer-first (−2,−1); coweightMap(coroot(σi)) = coroot i (Hom.lean:75) carries coroot 3 to coroot 1 | consistent with `RootPairing.Hom` |
| ReductiveGroups 9A.1b normalisation | A₃ outer-first, projected vs distinct sum | H-row projected matrix [[2,−2],[−1,2]] (RG line 1500) equals the root-row distinct-sum matrix numerically; projected root-row matrix is its transpose | README's warning at line 57 is correct |

## Verified sound

- Declarations read: 17 of 17 (`Suggested.lean`), with section context `{ι M N}` over ℝ; every theorem carries its finiteness, spanning, reducedness and crystallographic instances explicitly; no sorry'd data, no `set_option`, no `lemma`, single `import Mathlib` plus two existing Tau Ceti modules (`Chamber.lean`, `DynkinType.lean` at the pin).
- Bold targets read: 13; every target has a locator. All 17 Lean names appear in the README and every backticked own name in the README is declared.
- Mathlib declarations checked at `6b7abb3c` (20): `RootPairing`, `IsRootSystem` (Defs.lean:120), `IsCrystallographic` (IsValuedIn.lean:59), `IsIrreducible` (Irreducible.lean:147), `Base` with `support`, `linearIndepOn_root/coroot`, `flip` (Base.lean:68–92), `Base.IsPos.induction_on_reflect` (Base.lean:699), `root_add_root_mem_of_pairingIn_neg` (Finite/Lemmas.lean:228; section `[Finite ι] [CharZero R] [IsDomain R] [P.IsCrystallographic]`), `Base.cartanMatrix` (ℤ-valued, CartanMatrix.lean:104), `cartanMatrix_le_zero_of_ne` (:130), `cartanMatrix_nondegenerate` (:172, needs `[P.IsRootSystem]`, as the README says), `equivOfCartanMatrixEq` (:355, `[Finite ι₂] [P₂.IsRootSystem] [P₂.IsReduced]`), `Aut`/`weightMap`/`coweightMap`/`indexEquiv` (Hom.lean:67–75), `DistribMulAction P.Aut M` (Hom.lean:723, giving the `•` of `fixed_weyl_group` through the subgroup), `weylGroup : Subgroup (Aut P)` (WeylGroup.lean:55), `rootForm_apply_apply` (CanonicalBilinear.lean:92), `posRootForm_rootFormIn_posDef` (Nondegenerate.lean:205, ordered S), `LinearMap.fixedSubmodule` (FixedSubmodule.lean:31, carrier `{x | f x = x}`), `Matrix.IsSimplyLaced` (Cartan/Basic.lean:399, `Pairwise (A i j = 0 ∨ A i j = -1)`), `Subgroup.centralizer` (Centralizer.lean:30).
- Tau Ceti declarations checked at `a91d3aaf` (37), all in the files and namespaces the README gives: `posRootCone` (= `AddSubmonoid.closure (P.root '' b.support)`, Positive.lean:280), `mem_posRootCone`, `isPointed_posRootCone`, `exists_root_eq_sum_nat_of_mem_posRoots`, `heightLinearMap_sum_nsmul_root` (`[P.IsRootSystem]`), `exists_intCast_eq_coroot'_of_mem_posRootCone`; `dominantChamber` (= `{x | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}`, Chamber.lean:137); `finite_setOf_dominant_sub_mem_posRootCone`; `RootPairing.finite_weylGroup` (`[P.IsRootSystem]`), `RootPairing.weylGroupToPerm_injective`; `exists_mem_support_mem_inversions_of_ne_one`; `ncard_inversions_mul_ofIdx_of_mem`; `stabilizer_eq_closure_wallReflections` and `wallReflections_eq_empty_of_mem_openDominantChamber` (section `[IsStrictOrderedRing R] [Finite ι] [P.IsCrystallographic] [P.IsReduced] [P.flip.IsReduced]`, as the README states); `existsUnique_dynkinType (b)` (∃! valid type), `HasCartanType` (numbering equation), `DynkinType.cartanMatrix : Matrix (Fin t.rank) … ℤ`, `DynkinType.A`; `isTree_diagramGraph_cartanMatrix` (`[Nonempty ι] [P.IsRootSystem] [P.IsReduced] [P.IsIrreducible]`), `diagramGraph_adj` (i ≠ j ∧ A i j ≠ 0 ∧ A j i ≠ 0); `DynkinType.mem_diagramSymmetry_iff`; `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`; `DynkinType.typeASimplyConnectedRootDatum`, `hasCartanType_typeASimplyConnectedRootDatum`, `typeAGraphAut`, `indexEquiv_typeAGraphAut_typeASimpleIndex` (image `typeASimpleIndex n i.rev`); `DynkinType.eq_one_of_cartanMatrix_B2/G2/F4` (entrywise preservation ⇒ ρ = 1); `rootPairingBaseChange`, `rootPairingBaseChangeBase`, `isCrystallographic_rootPairingBaseChange` (an instance), `pairingIn_rootPairingBaseChange`, `cartanMatrix_rootPairingBaseChangeBase`, `isReduced_rootPairingBaseChange`.
- Sibling citations checked (12): RootSystems Layers 1, 2, 4, 5, 6 titles on main (README lines 218, 245, 296, 321, 356) match; LieHighestWeight Layers 2 and 6 exist (lines 370, 773) and its line 173 claims the weight-lattice/dominance dictionary; ReductiveGroups §9A.1b exists on main (line 1290) with the three named subsections (lines 1339, 1371, 1457), the distinct/full-sum export (1485–1503), component-return maps (1352–1357, 1482–1483) and the H-row convention plus transpose remark (1380–1385); ReductiveGroupsPartII at the head of its open pull request has the target *Minuscule coweights and the dominance order* inside §RG2.1.4 (dominance through `TauCeti.posRootCone` of the flipped base) and *Dominant inertia-coinvariant cocharacters* in §RG2.4.3 (order via ℕ-sums of positive échelonnage coroots), both as cited. ReductiveGroupsPartII precedes this roadmap in the merge order. The A₃/A₄ normalisation remark at README line 57 agrees with ReductiveGroups lines 1498–1500 after the transpose.
- Ownership against open pull requests: `roadmaps grep` for orbit sums, `fixedWeylGroup`, Stembridge and folding over all open roadmap pull requests and main finds no other owner of the fold, the fixed Weyl group or the integral order on a real root pairing (hits are orbit sums in Hecke-algebra and character contexts). ReductiveGroupsPartII's `dominanceLE` lives on the inertia-coinvariant translation lattice, a different carrier, and the README states the compatibility (line 79).
- Locators verified (17): Rap00 (1.8) at line 64–69 (p. 154), PGL₂ at line 172 (p. 157), Lemma 2.3 at lines 191–194, (2.10)–(2.13) at lines 199–213 (pp. 157–158); Stem08 condition (1) line 21, orbits line 23–28, (2)–(3) lines 29–34, Claim 1 line 41, Claim 3 line 57, exhaustion step line 71, proofs lines 87–101, Claim 4 lines 102–107, pages 1–3 as cited; KZ25 Proposition 5.2.3 line 2179 (p. 49), the orbit step lines 2197–2206 (pp. 49–50), Lemma 5.2.5's end line 2329 (p. 52), Corollary 5.2.7 line 2332 (pp. 52–53). The Annals reference resolves to volume 202, issue 3 (2025).
- Checks tested: 53 read, 31 recomputed (table above); none false, vacuous or a restatement; every definition has at least three.
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/RootSystemsPartII/` (README, Suggested.lean, metadata, sources, report); no pull-request numbers, no `set_option`, no `lemma`, no computational algorithm, no absolute path in the package.
- Conventions: root rows/coroot columns, forward weight map and contravariant coweight map agree with `RootPairing.Hom` fields; the D₄ direction witness and the A₃ row witness compute as stated. Sources are cited by locator in the author's words; no passage is copied.

## Not verifiable

- `Suggested.lean` was not elaborated in this pass (no Lake setup in the board checkout; the brief allows no other Lean command). The package report records `lake env lean` exit 0 with exactly ten `sorry` warnings and a `#check @` audit of all 17 declarations; the binder conclusions there agree with my reading of the signatures.
- KZ25's printed page range 1077–1156 (only the volume and issue were confirmed online); the agreement of the author preprint's numbering with the published article (the sources entry records the preprint as the version cited).
- Stembridge, Cor. 2.7 (the original of Rap00, Lemma 2.3) was not opened; the attribution is taken from Rap00 line 188.
- The internal correctness of ReductiveGroups §9A.1b's signed constructions is consumed, not re-derived; only its linear interfaces and conventions were checked against this package.

## Source issues

- **Gap** in KZ25 at Proposition 5.2.3, proof, printed pages 49–50 (author preprint, lines 2197–2206): the source passes from the individual bounds λ + σⁱ(α∨) ⋞ μ for every i to the bound for the full orbit sum λ + Σᵢ σⁱ(α∨) ⋞ μ by "it follows"; it should choose α so that the orbit sum itself fits (for instance by the Stembridge step in the folded root system, this roadmap's §4.3), since in a triality form of D₄ with λ = 2ρ∨, μ = λ + θ∨ (θ∨ = (1,2,1,1)) the root α₁ + α₂ satisfies every individual bound while its orbit sum (1,3,1,1) exceeds the budget by one at the central node; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fb5342d", "job": "RT-RootSystemsPartII~1b", "model": "fable", "worker": "fable-rt48"} -->
