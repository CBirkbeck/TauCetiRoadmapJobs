# Review of RootSystems (pull request #1196 at 265d185)
Folder: `TauCetiRoadmap/RepresentationTheory/RootSystems/`

**Verdict:** needs changes

This is a full review of head `265d185`: the folder changed by 1551 lines after `3e78a6d`, the head the previous review read (a new Layer 1 on the geometric representation of Coxeter systems, Layers 2–6 renumbered, `Suggested.lean` rewritten with 13 declarations). Every passage was re-read. Of the previous review's four notes, two are repaired by the head and one by the pin move (details under Previous findings); one note stands as a note. The gate fails on two counters (the module-system advisory counted under `build`, and one statement-hygiene hit), and the review adds two blocking findings: the rational classification headline is already a pinned Tau Ceti theorem, and EnriquesSurfaces at its open head owns the same Layer 1 objects. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (the same as main's).

## R01 (P2) — `rational_classification` is a pinned Tau Ceti theorem, restated as a target

**Location:** `TauCetiRoadmap/RepresentationTheory/RootSystems/Suggested.lean:101–108` (`rational_classification`); `README.md:687–696` ("Prove `rational_classification`: a nonempty irreducible finite reduced crystallographic root system over ℚ is isomorphic to the native rational model of exactly one valid type"); `README.md:9` and `README.md:18–19` (the Summary and Scope list the rational classification among the end results this roadmap owns); `Suggested.lean:16` (the docstring lists it as a headline stated here).

**Claim:** At the pin, `TauCeti/LinearAlgebra/RootSystem/FiniteType/RationalClassification.lean:70` proves `RootPairing.existsUnique_nonempty_equiv_rationalRootSystem` with exactly this statement and exactly these hypotheses (finite, nonempty, spanning, crystallographic, reduced, irreducible, coefficients ℚ): `∃! t : DynkinType, ∃ ht : t.Valid, Nonempty (P.Equiv (t.rationalRootSystem ht))`. The same file's line 56 proves the base-wise form `RootPairing.Base.nonempty_equiv_rationalRootSystem_iff`. The roadmap plans what the library already proves; its three-step route (base existence, the type of a base, rigidity) is the pinned proof.

**Witness:** On a scratch copy of `Suggested.lean` with `import TauCeti.LinearAlgebra.RootSystem.FiniteType.RationalClassification` added, the one-tactic probe closes the theorem: `exact RootPairing.existsUnique_nonempty_equiv_rationalRootSystem P` (the only one of the eleven admitted theorems that closes). A separate scratch file restating the theorem and proving it by that term elaborates with no warning.

**Repair:** Delete `rational_classification` from `Suggested.lean` and the two sentences of the docstring that announce it; in `README.md` move the theorem into the From Tau Ceti contract (`RootPairing.existsUnique_nonempty_equiv_rationalRootSystem` and `RootPairing.Base.nonempty_equiv_rationalRootSystem_iff` in `FiniteType/RationalClassification.lean`, with their hypotheses), rewrite §3.1 as consumption (what remains for this roadmap in §3.1 is nothing beyond the Checks, which can stay as the section's worked examples), and drop "the rational classification" from the Summary's end results and from the Scope's list of owned objects (keep "the type A Weyl group over characteristic-zero domains", which is a genuine extension of the pinned `RootPairing.weylGroup_equiv_perm_of_typeA` at `Weyl/TypeA/Basic.lean:265`, that one being over ℚ with spanning and `1 ≤ n`).

## R02 (P2) — Two open roadmaps own the general geometric faithfulness and root-sign theory

**Location:** `README.md:16–17` ("This roadmap owns the general Coxeter geometric sign and faithfulness theorems (Layer 1)"), `README.md:61–66` ("The ownership boundary with EnriquesSurfaces §5.2 places the general arbitrary-index geometric sign, faithfulness and integral comparison results here in Layer 1"), `README.md:1161–1163`; `Suggested.lean:51–85` (`rankTwo_nonnegative`, `geometric_sign_criterion`, `geometric_faithfulness`, `integral_geometric_realization`).

**Claim:** EnriquesSurfaces, pull request #1286 at its head `a85be7e` (a new-folder pull request by the same author), says the opposite. Its `README.md:9`: "Section 5.2 owns the general geometric-faithfulness theorem and its root-sign theory on the native Coxeter representation". Its §5.2 (`README.md:525–561`) plans `coxeterGeometricFaithful` (injectivity of `CoxeterSystem.geometricRepresentation` for every index type, no finiteness or nondegeneracy), the root-sign theory with the right-descent criterion "ρ(w)eᵢ is positive precisely when ℓ(wsᵢ)=ℓ(w)+1", "transport under reindexing and restriction to standard parabolics", the rank-two sign alternative "for finite and infinite exponents", and at line 548–549 the integral comparison `reyeGeometricFaithful` with "2 times the native standard real form is the positive integral Gram". That is the content of §§1.1–1.4 here, object for object (§1.4's hypothesis is `A i j = 2·B(αᵢ,αⱼ)`). Neither Mathlib nor Tau Ceti has it at the pin (`TauCeti/GroupTheory/Coxeter/Geometric.lean:97–103` says faithfulness "is not proved here"), so both open heads build it.

**Witness:** `EnriquesSurfaces/README.md` at `a85be7e`, lines 9, 525, 527, 542, 548–549, 561 (its §5.2 cites "RootSystems Layer 3" for exchange and Matsumoto only, never Layer 1 here).

**Repair:** One owner. RootSystems is on main and precedes every open pull request, so this roadmap is the right owner and EnriquesSurfaces §5.2 becomes its consumer: the pull request description of this change states that EnriquesSurfaces (its open pull request) is revised to consume §§1.1–1.4 here before it merges, and the author makes that revision there (its Scope sentence and §5.2 become "consume RootSystems §§1.1–1.4; prove the T246 and Reye statements"). Nothing else in this folder changes: the Scope paragraph at lines 61–66 and the Downstream bullet already state the direction. Recorded as blocking by the overlap rule (an object two open roadmaps both own), so that the human approver sees the dependency between the two pull requests.

## R03 (P3) — Statement hygiene: a headline concluding `Nonempty (… ≃* …)` under a plain name

**Location:** `Suggested.lean:113–119` (`weylGroup_equiv_perm_of_typeA … : Nonempty (P.weylGroup ≃* Equiv.Perm (Fin (n + 1)))`); `README.md:725`.

**Claim:** The gate's statement-hygiene rule (worker's run and my rerun, both `statement-hygiene=1`): a theorem concluding `Nonempty (A ≃ B)` is kept only as a corollary named `nonempty_*`, or the isomorphism is named as data. The README itself asks for the data form ("Refine the existence statement by a marked equivalence for any specified Cartan relabelling, sending the simple reflections to the adjacent transpositions in that order", lines 731–733), which is the right headline but needs the marked equivalence as a definition, and that is a README target.

**Witness:** Gate line: "line 119: P3 theorem `weylGroup_equiv_perm_of_typeA` concludes `Nonempty (P.weylGroup ≃* Equiv.Perm (Fin (n + 1)))`".

**Repair:** Rename it `nonempty_weylGroup_mulEquiv_perm_of_typeA` in `Suggested.lean` and at `README.md:725` (the pinned Tau Ceti precedent is `TauCeti.nonempty_weylGroup_mulEquiv_of_hasCartanType`), or state the marked equivalence as data with its generator equations. The same rule would catch `rational_classification` (`∃! t, ∃ ht, Nonempty (P.Equiv …)`) were it kept; R01 removes it.

## R04 (P3) — The gate's build counter: `Suggested.lean` needs the module-system header

**Location:** `Suggested.lean:1–8` (`import Mathlib` and seven `import TauCeti.*` lines).

**Claim:** The pinned Mathlib is built with the module system, and the gate counts Lake's advisory "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`" as a build problem: the worker's gate and my rerun both end `build=2 FAIL`, with the two advisory lines the only build output (the file itself compiles: `lake env lean` gives exactly eleven `declaration uses sorry` warnings and nothing else). No acceptance while the gate fails.

**Witness:** Gate output, `build:` lines, twice the same advisory for this file.

**Repair:** Make the header `module`, blank line, `public import Mathlib`, the seven `public import TauCeti.*` lines, then `@[expose] public section` before the namespace and a closing `end` at the end of the file (the precedent on main is CoboundaryExpansion). Tested on a scratch copy with exactly that header: it elaborates with the eleven `sorry` warnings and nothing else, and the `export` lines are unaffected. No roadmap on main imports this module any more (`CFSGStatement/Suggested.lean` imports only Mathlib), so no consumer changes.

## R05 (P3) — LieHighestWeight ids cited that its open revision drops

**Location:** `README.md:45` ("[LieHighestWeight, Layers 1–2](../LieHighestWeight/README.md#layer-2-weights-of-a-module-and-their-integrality) owns the representation-theoretic weight lattices, fundamental and dominant weights") and `README.md:1135` ("LieHighestWeight Layers 2, 6 and 10 consume …").

**Claim:** On main `RepresentationTheory/LieHighestWeight/README.md:351, 370` has Layers 1 and 2 with that heading, so the citation resolves today; the open revision of LieHighestWeight (pull request #1220, head `beea1d2`) has no Layer 1 or 2 (its layers are 0, 3, 5–10): the weight lattice, fundamental and dominant weights are its Conventions (`README.md:139–166`) and the pinned `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible` (its line 25–26); Layer 6 (Weyl character and dimension formulas, line 1260) and Layer 10 (line 2624) exist at both heads. The two citations break when that revision merges, and the README cites nothing that survives it.

**Witness:** `rev` checkout of #1220, `LieHighestWeight/README.md` headings at lines 554, 706, 913, 1260, 1489, 1995, 2370, 2624; the overlaps report lists exactly these three ids.

**Repair:** Cite the content rather than the layer number: at line 45 "LieHighestWeight (its weight-lattice conventions and native dominant-integral classification) owns …, and its Layer 6 the Weyl character and dimension formulas" and at line 1135 "LieHighestWeight (weights, Layer 6 and Layer 10) consume …"; or keep the numbering and have the pull request description's merge-order paragraph name the LieHighestWeight revision whose numbering is cited.

## R06 (P3) — A third-party copy of a copyrighted textbook is linked as the source, and three cited works are not in the manifest

**Location:** `README.md:1174–1175` ("The institutional course copy has the printed numbering: [University of Washington](https://sites.math.washington.edu/~billey/classes/reflection.groups/references/Humphreys.ReflectionGroupsAndCoxeterGroups.pdf)"); `README.md:1169–1184` (Humphreys 1990 and 1972, Kac 1990).

**Claim:** The linked file is a complete scan of a Cambridge University Press book on a course page that is neither the publisher's, the author's, nor an institutional repository: not a legal place under the sources policy, so the review did not read it (Not verifiable). The roadmap's manifest records four works (`milne17`, `sga3iii`, `bourbaki46`, `bjornerbrenti05`); Humphreys *Reflection Groups and Coxeter Groups* (now the locator of every Layer 1 target and of §§2.1, 3.1, 3.2), Humphreys *Introduction to Lie Algebras* and Kac have no entry.

**Witness:** The manifest `packages/RootSystems/sources.toml` has four `[[source]]` tables; the Layer 1 locators (lines 425, 460–461, 466, 479–480, 507–508, 522–524, 563–564) all point into Humphreys 1990.

**Repair:** Replace the link by the publisher locator (Cambridge Studies in Advanced Mathematics 29, DOI 10.1017/CBO9780511623646) and keep the printed page numbers; have the manifest record the three works as `uncertified` with those locators (a worker step; the README text does not change otherwise).

## Previous findings

- R01 (chamber declarations cited in the wrong namespace) — resolved by the pin: at Tau Ceti `2fd255d9`, `TauCeti/LinearAlgebra/RootSystem/Chamber.lean:97` opens `namespace RootPairing` and line 141 defines `dominantChamber` there, so `RootPairing.dominantChamber` and `RootPairing.openDominantChamber` (`README.md:285, 1130, 1155`) now resolve (the `#check` sweep below).
- R02 (a second open pull request on this folder) — resolved: the open-pull-request index lists only #1196 on `RootSystems`.
- R03 ("formerly" narrative; Layer 5 title) — repaired: the Downstream section is a table of old label → present location (`README.md:1122–1133`) with no revision narrative; the type A and G₂ material is §3.2 and the Layer 3 Examples.
- R04 (unused `[Fintype ι]` in the metric headline) — unchanged (`Suggested.lean:168`); the route uses no finiteness (`RootPairing.InvariantForm.two_mul_apply_root` is for every root pairing, `IsIrreducible` carries none). A note, not a finding; `[Finite ι]` would match the README's "finite".

## Verified sound

### Head, gate, dependency check, elaboration, signatures

Head `265d185853484784651f6b8965704b69e3402874`; the diff against `origin/main` outside the roadmap folder and the family index is empty (`git diff --stat` lists only the folder's two files; the family index files are unchanged). Gate rerun with the build and the local merge order: every counter zero except `statement-hygiene=1` and `build=2` (R03, R04). Dependency check (the `--movable` form of the brief):

```text
depcheck: 239 roadmaps, 2363 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. RootSystems is on main; the README has no `From TauCetiRoadmap.<X>` section and no `*Needs:*` line names a roadmap. RootSystemsPartII (a new-folder pull request, merge-order line 198) and EnriquesSurfaces are named only as consumers and in the Scope deferrals, never as suppliers.

`lake env lean` on `Suggested.lean`: exit 0, exactly eleven `sorry` warnings (the eleven theorems), nothing else. The worker's `signatures.md` was compared declaration by declaration with the README: the four Layer 1 statements quantify over every `CoxeterSystem M W` with no finiteness, as §§1.1–1.4 say; `presentation_length_eq_inversions`, `weyl_based_complement`, `existsUnique_basedAut_of_cartanMatrix` and `weylGroup_equiv_perm_of_typeA` carry finite, characteristic-zero domain, crystallographic and reduced explicitly, the based-diagram theorem adds spanning (as `RootPairing.Base.eq_one_of_forall_indexEquiv_eq` requires), the type A theorem has no spanning (as §3.2 says); `eq_highestRoot_of_forall_root_add_notMem` adds nonempty and irreducible; `rational_classification` is over ℚ with spanning, nonempty, irreducible; `invariantMetric_unique_scale` over ℝ with spanning, irreducible and both positivity hypotheses; `basedAut` keeps only `[CommRing R]` and the module instances its type needs. No section binder is lost.

One-tactic probes (`by first | rfl | infer_instance | (simp; done) | exact?`) on a scratch copy with the rational-classification module imported: ten theorems fail to close; `rational_classification` closes by one `exact` (R01). `GeometricPositive` and `basedAut` have real bodies on native carriers.

A scratch file with `#check @name` for every backticked dotted name of the README (185 names after removing file names) elaborated with zero errors against the pin, including the 48 Tau Ceti names new at this head (`weylCoxeterHom_injective`, `weylCoxeterSystem`, `length_weylCoxeterSystem_eq`, `isReduced_weylCoxeterSystem_iff`, `existsUnique_dynkinType`, `HasCartanType.of_base`, `nonempty_equiv_of_hasCartanType`, the `HighestRoot.lean` family, `weylGroup_equiv_perm_of_typeA`, `typeARationalWeylGroupEquiv_ofIdx_typeASimpleIndex`, `rationalRootSystem`, the `Coxeter/Geometric.lean` family, `parabolicHom`, `matsumoto`, `poincarePolynomial`, the diagram-automorphism declarations, `posRootsFinset_g2`, `isIrreducible_of_connected_diagramGraph_cartanMatrix`, the three `Weyl/Automorphism.lean` names, the three `DynkinType` export aliases). Seven Tau Ceti modules the sweep needed lacked object files in the lake directory and were built with `lake build <module>` first (the build succeeded, 7217 jobs).

### Hypotheses of the cited suppliers, read at the pin

| Declaration (file at the pin) | Hypotheses confirmed against the README sentence |
|---|---|
| `RootPairing.nonempty_base` (Mathlib `RootSystem/BaseExists.lean`) | `[Field R] [CharZero R] [Finite ι] [IsRootSystem] [IsCrystallographic] [IsReduced]`: "finite reduced crystallographic root systems over characteristic-zero fields" (line 146–148) |
| `RootPairing.Base.equivOfCartanMatrixEq` (Mathlib `CartanMatrix.lean`) | both pairings spanning, reduced, finite, same characteristic-zero domain, Cartan entries equal along `e` (line 157–159) |
| `RootPairing.Base.eq_one_of_forall_indexEquiv_eq` (`Weyl/Automorphism.lean`) | `[IsRootSystem]` only: "with spanning" (line 303, 946–947) |
| `RootPairing.Base.existsUnique_map_eq` (`Weyl/Bases.lean`) | finite, characteristic-zero domain, crystallographic, reduced, no spanning (line 293–295) |
| `TauCeti.weylCoxeterHom_injective`, `weylCoxeterSystem`, `length_weylCoxeterSystem_eq` (`Coxeter/Presentation.lean:158, 167, 191`) | finite, characteristic-zero domain, crystallographic, reduced, no spanning (line 251–254); `weylCoxeterSystem` is `ofExchange` of the presented system along `weylCoxeterHom` |
| `TauCeti.existsUnique_dynkinType` (`FiniteType/Classification.lean`) | finite, nonempty, spanning, reduced, crystallographic, irreducible, characteristic-zero domain (line 316–318) |
| `TauCeti.nonempty_equiv_of_hasCartanType`, `nonempty_weylGroup_mulEquiv_of_hasCartanType` | both spanning, finite, reduced, same ring (line 320–323) |
| `RootPairing.weylGroup_equiv_perm_of_typeA` (`Weyl/TypeA/Basic.lean:256–266`) | ℚ, spanning, reduced, crystallographic, `1 ≤ n` (line 357–361); so §3.2's extension to characteristic-zero domains without spanning is new |
| `RootPairing.Base.highestRoot` and its six lemmas (`HighestRoot.lean:88–294`) | finite, nonempty, characteristic-zero domain, crystallographic, reduced, irreducible (line 328–332); the root-string converse `root_highestRoot_add_root_notMem` (line 125) and the two "no addable simple root" lemmas (lines 138, 152: dominance and positive coefficients) exist; the characterization `eq_highestRoot_of_forall_root_add_notMem` does not |
| `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (`FundamentalDomain.lean`) | linear order, strict ordered ring, finite, crystallographic, reduced, flip reduced, spanning (line 287–290) |
| `RootPairing.InvariantForm.apply_eq_or`, `exists_apply_eq_or` (Mathlib `Finite/Lemmas.lean`) | finite, characteristic-zero domain, crystallographic, reduced, irreducible; nonempty for the second; no positivity (line 178–184) |
| `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix` (`FiniteType/Irreducible.lean`) | field of characteristic zero, crystallographic, spanning (§6.1 is over ℝ, spanning) |
| `CoxeterMatrix.geometricForm`, `geometricReflection`, `CoxeterSystem.geometricRepresentation` (`Coxeter/Geometric.lean:125–171`) | Gram entry `−cos(π/M i i')`, `−1` at entry 0, diagonal 1, reflection `v − 2B(αᵢ,v)αᵢ`, any index type: the Conventions at lines 97–104; faithfulness explicitly not proved (lines 97–103) |
| `CoxeterMatrix.reindexGroupEquiv_apply_simple`, `_symm_apply_simple` (Mathlib `Coxeter/Basic.lean:138–142`) | forward map sends the reindexed generator `i` to the original `e.symm i`; the inverse sends `i` to the reindexed `e i` (line 202–203 and the Check at 242–244) |
| `CoxeterSystem.alternatingWord` (Mathlib `Coxeter/Basic.lean:397`) | `alternatingWord i j (m+1) = (alternatingWord j i m).concat j`: ends in `j` for `k > 0` (line 107) |
| `CoxeterSystem.parabolicHom`, `length_parabolicHom`, `range_parabolicHom` (`Coxeter/Restriction.lean`) | any entry-preserving `f`, arbitrary index types (line 264–268) |
| `RootPairing.IsIrreducible` (Mathlib `Irreducible.lean:148–154`) | includes `Nontrivial M` and `Nontrivial N` (line 75) |
| `TauCeti.DynkinType.Valid` | A≥1, B≥2, C≥3, D≥4 (line 311–312), unchanged from the previous review |

### The adversarial table (computed values)

Conventions: `Cᵢⱼ = ⟨αᵢ, αⱼ∨⟩`, coefficient columns, reflection at `i` subtracts `Σⱼ Cⱼᵢ cⱼ` from entry `i`; the geometric form `B(αᵢ,αⱼ) = −cos(π/mᵢⱼ)`, `−1` at an infinite entry, reflection `x − 2B(αᵢ,x)αᵢ`; `alternatingWord i j k` ends in `j`, the rightmost letter acts first. Root sets, counts, greatest vectors and the rank-two images were recomputed from the matrices by a script of my own (closing the simple vectors under the coefficient reflections; iterating the geometric reflections in floating point), independently of the README.

| Statement | Instances tried | Values computed on the two sides | Result |
|---|---|---|---|
| Conventions: B₂ column formula | `!![2,-2;-1,2]`, c=(1,0), short node 2 | entry 2 becomes 0 − C₁₂·1 = 2: (1,2); with C in place of Cᵀ: (1,1) | Pass (Check line 113–114) |
| Conventions: A₂ action and word order | ρ(sᵢsⱼ)αᵢ, ρ(sⱼsᵢ)αᵢ | (0,1) = αⱼ and (−1,−1) = −αᵢ−αⱼ; infinite entry: ρ(sᵢsⱼ)αᵢ = (3,2) | Pass (line 108–109) |
| Conventions: inversions of s₁s₂ in A₂ | α₁, α₂, α₁+α₂ | inversions {α₂, α₁+α₂}; of s₂s₁ {α₁, α₁+α₂} | Pass (line 115–116) |
| Conventions: coweight direction | σ=(123) | weight e₁↦e₂; contravariant coweight e₁↦e₃; inverse e₁↦e₂; ⟨e₂,e₂⟩=1, ⟨e₂,e₃⟩=0 | Pass (line 117–119, 983–985) |
| Supplied conventions: finite type, validity, A₁ datum, H-model, A₁ chamber | [2], empty, affine A₁; A₀,A₁,B₁,B₂,C₂,D₃; roots ±2 coroots ±1; (8,3),(55,21),(377,144) of norm 2 | q(1)=2; affine value 0 at (1,1); validity false,true,false,true,false,false; pairing 2, weight pairs to 1; heights 2→3; chamber [0,∞), 1↦−1 | Pass (lines 382–401) |
| §1.1 `GeometricPositive` | αᵢ, 0, αᵢ−αⱼ, αᵢ+αⱼ (m=0) | αᵢ positive; 0 fails the strict clause; (1,−1) neither sign; (1,1) positive with norm 1−2+1=0, not a root (roots have norm 1) | Pass; excludes the weak-cone and the positive-norm models |
| §1.2 `rankTwo_nonnegative` | m=3, k=0..3; m=2, k=1,2; m=0, k=1..4 | m=3: (1,0),(1,1),(0,1),(0,−1); m=2: (1,0),(−1,0); m=0: (1,2),(3,2),(3,4),(5,4) | Pass; k=3 at m=3 and k=2 at m=2 refute `k ≤ m`; the S(k) formula matches each value |
| §1.2 `geometric_sign_criterion` | A₂, w=sᵢsⱼ; rank one | ℓ(w)=2, ℓ(wsᵢ)=3, ρ(w)αᵢ=αⱼ positive; ℓ(wsⱼ)=1, ρ(w)αⱼ=−αᵢ−αⱼ negative; ρ(s)α=−α with ℓ(s·s)=0<1 | Pass; right descents, not left |
| §1.3 `geometric_faithfulness` | empty I; rank one; infinite dihedral | trivial group on the zero space; [−1]≠[1]; (sᵢsⱼ)ⁿαᵢ=(2n+1,2n): (1,0),(3,2),(5,4), so (sᵢsⱼ)ⁿ≠1 although det B = 0 | Pass; nondegeneracy not needed |
| §1.3 reindexing witness | e=(0 1) on A₂; e=(0 1 2) on three orthogonal nodes | Tρ(sᵢsⱼ)αᵢ = Tαⱼ = α′ᵢ and ρ′(s′ⱼs′ᵢ)α′ⱼ = α′ᵢ; `reindexGroupEquiv` sends reindexed generator 0 to original e⁻¹(0)=2, its inverse sends 0 to e(0)=1 | Pass (Mathlib lines 138–142) |
| §1.4 `integral_geometric_realization` | A=[2]; A=[1]; A=[[2,−1],[−1,2]]; A=[[2,−2],[−2,2]]; mod 2 | x↦−x; [1] violates Aᵢᵢ=2B(αᵢ,αᵢ)=2; sᵢeⱼ=eᵢ+eⱼ; (sᵢsⱼ)eᵢ=(3,2) with det 0; [−1]≡[1] mod 2 | Pass; hypothesis forces m∈{1,2,3,∞} |
| §2.1 `presentation_length_eq_inversions` | rank 0; A₁; A₂ words [], [i], [i,j], [i,j,i], [i,i] | inversion counts 0; 1; 0,1,2,3; [i,i] spells 1 with 0 inversions and length 0 | Pass; follows from pinned `length_eq_of_exchange` data, not one tactic |
| §2.2 longest element, Poincaré | A₁, A₂, G₂ | lengths 1, 3, 6 = positive counts; polynomials 1+q, 1+2q+2q²+q³ | Pass |
| §3.1 `rational_classification` | A₁ (two bases), A₂, empty, B₂ vs C₂, B₃ vs C₃ | one valid type each; empty has no valid type; `!![2,-2;-1,2]` and `!![2,-1;-2,2]` are one relabelling; B₃/C₃ not | True, but pinned (R01) |
| §3.2 `weylGroup_equiv_perm_of_typeA` | A₀..A₃; ℚ² non-spanning; ℤ[1/2] | orders 1,2,6,24 = (n+1)!; roots ±(1,0), coroots ±(2,0): reflection diag(−1,1), W of order 2; over ℤ[1/2]: 3R reflection-stable, 1∉3R (3a=2ᵏ impossible) | Pass; no spanning |
| §4.1 coefficient reflection, orbit union | B₂ | s₂(1,0)=(1,2), s₂(1,2)=(1,0); both simples give 8 roots, the long root alone 4 | Pass |
| §4.2 `eq_highestRoot_of_forall_root_add_notMem` | A₂, B₂, G₂, D₄, F₄; A₁²; empty | greatest (1,1),(1,2),(3,2),(1,2,1,1),(2,3,4,2); in B₂ the root (1,1) has (1,1)+(0,1)=(1,2) a root, so it is not a counterexample; A₁² has no greatest element and is reducible; the empty system has no positive root and fails `Nonempty ι` | Pass; route (least-height root above β, lowered by a simple root with positive pairing) checked step by step |
| §4.2 simply-laced unit ascent | A₂, A₇, D₄, E₆, E₇, E₈; B₂, B₃, C₄, F₄, G₂ | non-greatest positives lacking a height+1 simple reflection: 0 in every ADE case; 2 of 3, 2 of 8, 4 of 15, 4 of 23, 2 of 5 otherwise | Pass; hypothesis needed |
| §4.3 counts and greatest vectors | E₆,E₇,E₈; A₇; C₄,C₉,C₁₃ | 36/63/120 positives, greatest (1,2,3,2,1,2), (2,3,4,3,2,1,2), (2,4,6,5,4,3,2,3), heights 11,17,29; A₇: 28, height 7; Cₙ: 16, 81, 169 positives, greatest (2,…,2,1); the computed C₄ positive set equals the README's sixteen tuples | Pass |
| §5.1 `basedAut`, `weyl_based_complement` | A₁, A₂, empty, root-free rank one | stabilizers of order 1, 2, 1, 2; |Aut| = 2·1, 6·2, 1·1; a Weyl element preserving the support fixes the base (`Base` is determined by its support, Mathlib `Base.lean:68–76`) and is 1 by uniqueness in `existsUnique_map_eq` | Pass; no spanning |
| §5.2 `existsUnique_basedAut_of_cartanMatrix` | A₁, A₂, B₂, D₄, E₆ | Cartan-preserving permutations 1, 2, 1 (the swap turns (−2,−1) into (−1,−2)), 6, 2; D₄ discriminant stabilizer 6/3 = 2 | Pass |
| §5.3 full data | root-free rank 0,1,2; GL₂; simply connected A₁ | Aut = 1, {±1}, GL₂(ℤ) with the shear of infinite order; det(1,−1;1,1) = 2; root 2 spans 2ℤ ⊊ ℤ | Pass; spanning correctly absent |
| §6.1 components | A₂, A₁², empty | 1, 2, 0 blocks; (1,1) a root of A₂ only | Pass |
| §6.2 `invariantMetric_unique_scale` | A₁ B=xy, C=3xy; nonreduced ±1,±2; A₁³ diag(1,2,5); zero space | c=3 (c=2 fails at (1,1), c=0 fails positivity); 12/4=3 and D(x,2)=6x−6x=0; squared lengths {1,2,5}, three scales; zero space excluded by `Nontrivial` | Pass; finiteness unused (note) |
| §6.2 r per type | B₂, G₂; B,C,F₄ nodes | squared lengths 2,1 (B₂) and 1,3 (G₂, ratio √3); long nodes B₂:0, G₂:1, F₄:0,1 from `rootLength` | Pass |
| Layer 1 Example | m=5 | 2cos(π/5) = 1.618… = (1+√5)/2, irrational, so §1.4's hypothesis fails | Pass |

### Ownership and duplication by object

Searched the pinned Mathlib and Tau Ceti by object: faithfulness and root signs of the geometric representation (absent: `Coxeter/Geometric.lean:97–103`; nothing else in `TauCeti/GroupTheory/Coxeter/` uses `geometricRepresentation`), the length transfer to the presented group (the pinned `CoxeterSystem.length_eq_of_exchange` at `ExchangeCondition.lean` gives it from three lemmas that `Presentation.lean:118–150` keeps `private`), the rational classification (present: R01), type A over a domain without spanning (absent; the pinned theorem is over ℚ with spanning), the highest-root characterization (absent; its converse and two halves present), the based complement, the Cartan-preserving extension and the unique positive scale (absent). Open roadmaps: EnriquesSurfaces (R02); RootSystemsPartII at its head consumes §5.1 and §6.1 by these numbers (`README.md:7, 19, 244–262`) and declares no colliding name; ReductiveGroups §9A.1a-L on main (`README.md:1230`) consumes the based factorization; KacMoody, QuantumEnvelopingAlgebras, ReductiveGroupsPartII, TopologicalKTheory, ConvexityToric and CFSGStatement on main cite the old layer labels that the Downstream table maps to native declarations. Ownership against open pull requests was checked through the brief's index and checkouts.

### Shape, policy, Lean form

README shape as the house style: Summary, Scope and ownership, Conventions with three convention Checks, Exact supplier contracts (From Mathlib, From Tau Ceti, five Checks of supplied conventions), How to read the build, Layers 1–6 in prose with `*Needs:*` lines, Examples and Dependencies per layer, Downstream consumers, References. Every definition (`GeometricPositive`, the transport maps, the integral action, the coefficient reflection, `basedAut`, the lattice-preserving subgroup, component spaces) lists its API and at least three discriminating Checks; every target has a locator. No LaTeX, no pull-request numbers, no process words (grepped: formerly, removed, currently, so far, checkpoint, handoff, packet, optional, deferred). Every backticked name of the roadmap's own in the README is declared in `Suggested.lean` and every Lean name appears in the README (gate `readme-ids-missing=0`). `Suggested.lean`: `theorem` only, no `set_option`, no sorried data, no `#eval`, one module docstring naming the one headline not statable (the componentwise metric parameterization).

### Seeded sample and sources

Printed pages: Milne's printed page is the PDF page minus 12; the SGA 3 re-edition's printed page is the PDF page plus 62 (page 37 marker at sga3iii line 1371 carries printed 99).

| Sample | Verification |
|---|---|
| 1.1–1.4 (Humphreys §5.3–§5.4, §5.5) | Not readable legally (R06, Not verifiable). The statements were checked by computation (table rows §1.1–§1.4) and against the pinned definitions in `Coxeter/Geometric.lean`; the arbitrary-index extension argued at lines 480–484 uses only inputs whose pinned signatures have arbitrary index types (`parabolicHom`, `exists_isMinimalCosetRep`, `length_mul_of_isMinimalCosetRep`, `wordProd_alternatingWord_eq_of_mem_parabolic_pair`, all confirmed above). |
| 2.1 Completeness of the relations | Pinned: `weylCoxeterHom_injective` (`Presentation.lean:158`, "Tits' theorem") and `weylCoxeterSystem`; Bourbaki VI §1 no. 5 Thm 2 and Humphreys §1.9 uncertified. |
| 2.2 Length and reduced expressions | Pinned `ncard_inversions_longestElement`, `poincarePolynomial`, `bruhatLE_iff_exists_sublist_wordProd_eq`; Bourbaki, Björner–Brenti uncertified. |
| 3.1 Classification independent of a base | Pinned `existsUnique_dynkinType`, `HasCartanType.of_base`, `HasCartanType.map`; the rational theorem is pinned too (R01). Humphreys §1.4, §2.9 uncertified. |
| 3.2 Type A | milne17 line 25053 (C.16, p. 611, the sum-zero model) and 25116 (C.25, pp. 612–613, base eᵢ−eᵢ₊₁); the source's `i > j` misprint is not copied. |
| 4.2 Greatest positive roots | milne17 line 25111, C.24 p. 612: a root whose coefficients dominate every root's, unique for the base; Bourbaki uncertified. |
| 4.3 Numbered family comparisons | Bourbaki Planches uncertified; the E, A and C values recomputed above, and the E-chain transport agrees with Mathlib's `CartanMatrix.E` (unchanged from the previous review). |
| 5.1 The actual base stabilizer | sga3iii line 1374 (Prop. 6.7.2, p. 99), 1368 (Lemma 6.7.1, p. 98, `u sₐ u⁻¹ = s_{u(a)}`), 1051 (Prop. 6.1.3, p. 90); milne17 line 25554 (C.53, p. 624). |
| 5.2 Oriented diagrams and actual isogeny lattices | sga3iii lines 1608 (Prop. 7.3.2, pp. 104–105, simply connected or adjoint reduced data), 1627 (Cor. 7.3.4), 1654 (Cor. 7.4.5), 1660 (Rem. 7.4.6). |
| 5.3 Full integral data and central directions | sga3iii lines 19–42 (Def. 1.1.1, Rem. 1.1.2, pp. 63–64); milne17 lines 25314 (C.43, p. 618), 25401 (C.51, p. 620). |
| 6.1 Irreducible components | milne17 lines 25102 (C.23, p. 612), 25585 (C.55, p. 625). |
| 6.2 Positive invariant forms and squared lengths | milne17 line 25421 (p. 621, invariant inner product unique up to scalar for an indecomposable system), 25438 (table (180)), 25617 (simply laced = equal lengths). |

No locator in the README is flagged unverified. No manifest or file was edited; the worktree is unchanged (`git status` clean).

## Not verifiable

- **Humphreys, *Reflection Groups and Coxeter Groups* (1990):** the only copy the README points to is a course-page scan (R06); not read. §§1.4, 1.7, 1.9, 2.9, 2.10, 5.1, 5.3, 5.4, 5.5 and the page numbers 10, 14, 16–18, 39, 41, 106, 109–113 are cited by locator only. The mathematics of Layer 1 was verified by computation and against the pinned definitions instead.
- **Humphreys, *Introduction to Lie Algebras and Representation Theory* (1972), §§9–11; Kac (1990), Ch. 4:** paywalled, not in the manifest; cited for background only.
- **bourbaki46** and **bjornerbrenti05**: settled as uncertified; VI §1 nos. 3, 5, 6, 8, §4 Planches I–IX, and §2.2, Theorem 3.3.1 not read.
- The ten admitted theorems other than `rational_classification` were elaborated and audited by instance, not proved.

## Source issues

- **Misprint** in milne17 at Example C.25, printed p. 612 (milne17 line 25120): the source says the positive roots for its vector t are eᵢ − eⱼ with i > j; it should be i < j, since (t, eᵢ − eⱼ) = j − i; affects a stated result.
- **Misprint** in milne17 at Appendix C(g), printed p. 622 (milne17 line 25453): the source says two simple roots have both pairings negative; it should be nonpositive, both being zero for the A₁×A₁ system displayed beside it; affects nothing.
