# Review of CompactSupport (pull request #196 at 4bd7237)
Folder: `TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/`

**Verdict:** rejected

Previous AI review: none. The gate on this head fails (`latex` 118, `tex` 24, `metadata.toml` missing); the targeted build and the dependency check pass. The folder is rejected rather than sent back for changes because its entire content is a re-plan of a roadmap that is already on main (R01): no edit inside the folder can repair that, the repair is to delete the folder and have its consumers cite the existing owner.

## R01 (P1) — The roadmap re-plans EtaleCohomologyFoundations, which is on main and earlier in the merge order

**Location.** `TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/README.md` lines 107–123 ("The missing reusable library consists of: 1. a structured type/category of compactifications … 13. Galois and finite-group actions"), and line 105 ("No existing Mathlib package supplies the Noetherian Nagata compactification theorem or the complete étale Rf_! formalism required here").

**Claim.** The thirteen items are missing and are built here; the roadmap's suppliers are only the sibling folders `ConstructibleEtale` and `EtaleBaseChange` (lines 34–39, 101–102).

**Witness.** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` on main (d00bcc1), line 7: "This roadmap owns scheme compactification objects, Nagata existence and coherent common refinements; … étale extension by zero, localization, `D⁺` torsion lower shriek …; proper and smooth base change, …, finite-coefficient Künneth, cohomological dimension and constructible finiteness". Item by item, with the owning section on main:

| CompactSupport item (line) | EtaleCohomologyFoundations section on main (line) | Generality there |
|---|---|---|
| 1. `Compactification f`, `DenseCompactification f`, morphisms, base change, restriction over base opens, products, closure of the open image, the category (Layer 0, 127–146; Conventions 81–83) | §G.1 `Compactification`, `DenseCompactification`, `Compactification.Hom`, `baseChange`, `denseReplacement`, `denseReplacementMap`, products over `S`, restriction over base opens (57–103); `Suggested.lean` lines 33–112 already declare the structure, its category, `identity`, `baseChange`, `denseReplacement` | any `f`; existence for separated finite type over qcqs `S` |
| 2. Nagata compactification, Noetherian route via admissible blowups, strict transforms, disjoint closures, gluing, two-open step, affine cover (Layer 1, 148–164) | §G.2 `nagataCompactification` (105–137): the same seven steps, then the qcqs reduction | qcqs base, "no Noetherian … hypothesis is added" |
| 3. Common refinements, threefold compatibility, cofilteredness, identity and cocycle laws, functor from one chosen compactification (Layer 2, 166–178) | §G.3 `compactificationCommonRefinement`, `denseCompactification_cofiltered`, `denseCompactification_hom_unique`, the categorical comparison principle with identity, inverse, three-choice cocycle and base-change laws (139–173) | qcqs base |
| 4–5. `j_!` on module-valued étale sheaves: adjunction, exactness, full faithfulness, stalks, composition, base change, coefficient change, constructibility, open–closed sequence (Layer 3, 180–203) | §0.7 (439–441): left adjoint of restriction, stalks, exactness, full faithfulness, composition, arbitrary base change, coefficient forgetting, enhanced derived `j_!` | any scheme, any ring `Λ` |
| 6. underived `f_! = f̄_* j_!`, independence, agreement with `f_*` and `j_!`, composition, base change (Layer 4, 205–229) | §0.8 `ClassicalAlgebraic.properSupports` and `properSupports.derivedComparison`: "writing underived `f!=p_*j_!` … `H⁰(R⁺f!F)=f!F`" (567–569) | qcqs base, finitely presented `f` |
| 7–8. `Rf_! := Rf̄_* ∘ j_!`, not the derived functor of `f_!`, canonical map from `R(f_!)`, degree-zero agreement, independence, composition, proper and open agreement, base change, shifts, triangles, coefficient change, group actions (Layer 5, 231–250) | §0.8 (567–578), including the identical non-derived-functor remark and the `A¹` witness `R²(Γ_c)(Λ)=⊕_(a∈k)Λ(−1)` versus `H²_c=Λ(−1)` (577); constructible base change §F.2.4 `VanishingCycles.etaleCompactSupports` (592–611) | `D⁺` torsion, any `Λ`; ctf exchange for Noetherian schemes |
| 9. open–closed triangles, naturality, Mayer–Vietoris for finite covers, group actions, base change (Layer 6, 252–272) | §0.7 `ClassicalAlgebraic.supportLocalization`, `supportLocalization.mayerVietoris` (443–445) and their compact-support form (580) | any scheme, any `Λ` |
| 10. `RΓ_c(X,K)=RΓ(Spec k, Rf_!K)`, `H^i_c`, localization, proper comparison, field extension, Galois and finite group actions, twists (Layer 7, 274–296) | §F.2.5 `VanishingCycles.compactSupportCohomology` (613–627): the same definition and the same list | separated finite type over a field |
| 11. `Rf_!` preserves `D^b_ctf`; finite `H^i_c`, bounded, perfect `RΓ_c` over separably closed `k` (Layer 8, 298–314) | §F.3 `VanishingCycles.compactSupportFiniteness` (730–737): "prove `Rf!K∈Dᵇ_ctf` … finite `Hⁱc`, bounded amplitude and perfect `RΓc(X,K)`" | Noetherian schemes, same coefficients |
| 12. projection formula and compact-support Künneth, associativity, symmetry, external products, equivariance (Layer 9, 316–336) | §F.2.7 `VanishingCycles.etaleKunnethCompactSupport` (759–774): `Rf!(K⊗ᴸf*L) ≅ Rf!K⊗ᴸL` and `RΓc(X,K)⊗ᴸRΓc(Y,L) ≅ RΓc(X×_k Y,K⊠L)` with cup/external products, symmetry, associativity, base change, actions | identical |
| 13. finite-group actions on lower-shriek and compact-support complexes | §0.8 (567), §F.2.5 (617–618), §F.10.4 `freeTorsorEquivariantPerfectness` (1372–1379) | identical or wider |
| Layer 10 calculations: point, finite étale scheme, `A¹ ⊂ P¹`, `𝔾_m ⊂ A¹` triangle, product compactification of `Aⁿ`, proper schemes (338–348) | Checks of §§G.1–G.3, 0.7, 0.8, F.2.5, F.2.7 (96, 135, 172, 453, 576–578, 624–627, 772–774) | identical |

The merge order lists EtaleCohomologyFoundations at line 18 and CompactSupport at line 393, and nothing in the family (grep over `TauCetiRoadmap/CohomologicalPointCounting/`) cites EtaleCohomologyFoundations. The README's own suggested home `TauCeti.AlgebraicGeometry` (line 27) with the names `Compactification` and `DenseCompactification` (line 81) is exactly the home and the names §G.1 fixes ("the shared scheme compactification package in `TauCeti.AlgebraicGeometry`", line 60), so the two roadmaps would be two owners of one object. Open pull requests 848 (ComplexComparisonPartII), 852, 1002 and 1040 consume that package and none re-builds it.

**Repair.** Delete the folder. In the family index and in `ConstructibleEtale`, `EtaleBaseChange`, `ComplexComparison`, `EllAdicRealization` and `TraceFormula`, replace every "owned by `CompactSupport`" and every consumption of `Rf_!`, `RΓ_c`, perfectness, localization and Künneth by citations of EtaleCohomologyFoundations §§G.1–G.3, 0.7, 0.8, F.2.4, F.2.5, F.3 and F.2.7 by section and declaration name (`Compactification`, `nagataCompactification`, `compactificationCommonRefinement`, `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports`, `VanishingCycles.etaleCompactSupports`, `VanishingCycles.compactSupportCohomology`, `VanishingCycles.compactSupportFiniteness`, `VanishingCycles.etaleKunnethCompactSupport`). I found nothing in this folder that EtaleCohomologyFoundations does not already state; if the author finds such an item, it is an "EtaleCohomologyFoundations, Part II" roadmap whose introduction says where the base roadmap stops, not a parallel plan.

## R02 (P2) — Suppliers cited for objects that main already owns

**Location.** README lines 87 ("Use the finite torsion and `D^b_ctf` conventions of `ConstructibleEtale`"), 101–102 ("`D^b_ctf` from `ConstructibleEtale`; direct image, proper base change, constructibility, and finiteness from `EtaleBaseChange`"), 336 ("Reuse the external-product API from `EtaleBaseChange`"), 387.

**Claim.** The bounded ctf category, proper base change and ordinary Künneth are supplied by the two sibling folders of this pull request.

**Witness.** On main, `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` §F.1 `VanishingCycles.constructibleDerivedCategory` (459–469: "`Dᵇ_c` and `Dᵇ_ctf` … `Dᵇ_ctf` is triangulated and symmetric monoidal"), §F.2.1 `VanishingCycles.properBaseChange` (504–508, "for arbitrary torsion"), §F.2.6 `VanishingCycles.etaleKunneth` (645–647). A citation of a sibling for an object an earlier roadmap on main owns is supplier drift and makes two owners.

**Repair.** Subsumed by R01's deletion. If any part of the folder survives as a Part II, its `## Exact supplier contracts` cites EtaleCohomologyFoundations §F.1, §F.2.1 and §F.2.6 by name, never the siblings, for these three objects.

## R03 (P2) — Statements narrowed below what the cited sources prove, by instruction

**Location.** README line 69: "The `Compactification` and `Rf_!` definitions themselves are stated for this same class of morphisms — do not generalize the carriers ahead of the theorems"; line 152 (Nagata for "Noetherian schemes"); line 236 (`Rf_!` on `D⁺(X_ét,Λ)` for Noetherian `S`); line 182–188 (`j_!` only for the finite torsion `Λ` of line 87).

**Claim.** The whole formalism is for separated finite-type morphisms between Noetherian schemes and finite torsion coefficients.

**Witness.** stacks-0F41 (flat.txt) line 4714–4715: Theorem 38.33.8 is for `S` quasi-compact and quasi-separated and `X → S` separated of finite type. stacks-0F7H (more-etale.txt) line 1650–1661: `Rf_! = Rf̄_* ∘ j_!` is defined for `Y` qcqs, on `D⁺_tors(X_ét,Λ)` for any ring `Λ` and on all of `D(X_ét,Λ)` for torsion `Λ`; Lemma 63.9.1 (0F7I, line 1663) proves independence at that generality. stacks-03S2 (etale-cohomology.txt) line 5237–5245: Definition 59.70.1 defines `j_!` for any `Λ`. EtaleCohomologyFoundations states all three at the source's generality (§G.2 line 111: "No Noetherian, field, finite-presentation or complex-base hypothesis is added"; §0.7: "any coefficient ring `Λ`"). The planning rule is never to narrow a statement below what the sources support; the Noetherian route is a proof route, not a hypothesis of the theorem.

**Repair.** Subsumed by R01. In any surviving Part II: state existence and `Rf_!` over qcqs bases and `j_!` for an arbitrary ring, and keep the Noetherian case as the proof's first stage.

## R04 (P2) — False claim about Mathlib at the pin: blowups and strict transforms

**Location.** README line 99: "Mathlib scheme-theoretic image, closure, blowup, strict-transform, and gluing infrastructure; build the missing lemmas named in Layer 1 in those existing namespaces"; line 156 (admissible blowups and strict transforms as the first step of Layer 1); line 164.

**Claim.** Mathlib has blowup and strict-transform infrastructure that Layer 1 extends.

**Witness.** Mathlib at the pin `9caeba1000ef8f302920981f4a08651d325abc81`: a case-insensitive search of `Mathlib/AlgebraicGeometry/` for `blowup`, `blow-up`, `blow_up`, `strictTransform` and `strict transform` returns no file; the only Rees-algebra material is `Mathlib/RingTheory/ReesAlgebra.lean` (a graded algebra, no scheme). Scheme-theoretic images do exist (`AlgebraicGeometry.Scheme.Hom.image`, `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` line 650; `IsSchemeTheoreticallyDominant`, `Mathlib/AlgebraicGeometry/Morphisms/SchemeTheoreticallyDominant.lean`). On main the blowup carriers for this proof are owned by StableReduction Layer 4 and SchemeAndStackFoundations §4.11, which EtaleCohomologyFoundations §G.2 cites (line 131–134).

**Repair.** Subsumed by R01. Otherwise: delete "blowup, strict-transform" from the Mathlib consumption list and cite StableReduction Layer 4 and SchemeAndStackFoundations §4.11 in the supplier contracts.

## R05 (P2) — A statable headline is absent from `Suggested.lean`, and the docstring does not say what is not statable

**Location.** `TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/Suggested.lean` lines 3–20: the module docstring and the single comment "No compiled targets yet; see README.md."

**Claim.** Nothing can be stated yet; "Once the types exist, prototype … here using `sorry`".

**Witness.** The Summit's first component, existence of a compactification of every separated finite-type morphism to a Noetherian (indeed qcqs) base, is statable at the pin: `IsOpenImmersion`, `QuasiCompact`, `IsProper`, `IsSeparated`, `LocallyOfFiniteType` and `QuasiCompact` all exist in Mathlib 9caeba1 (`Mathlib/AlgebraicGeometry/Morphisms/{Separated,FiniteType,Proper,QuasiCompact}.lean`), and `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` lines 33–43 on main state the `Compactification` structure against exactly these classes. The file states nothing and its docstring names neither the headline theorems nor the missing carriers; it is process narrative ("No compiled targets yet", "Once the types exist").

**Repair.** Subsumed by R01 (the headline is already declared on main; declaring it here again would create a second owner of the same fully qualified object). In any surviving Part II: state the headlines that are statable and name, per headline, the carrier each unstatable one lacks (the étale `Rf_!` lacks a module-valued small-étale derived category at the pin).

## R06 (P3) — The gate fails: LaTeX delimiters, TeX syntax, missing metadata

**Location.** README lines 7–19, 65–67, 77–79, 185–188, 210, 218–220, 236, 256–266, 279–285, 302–304, 321–324, 331–333 and 118 inline `\( … \)` spans (gate `latex` rule: "no LaTeX delimiters outside code spans and code blocks"), 24 `tex` hits (`_{`, `^{`, `\operatorname`, `\mathrm`), and `metadata.toml` missing from the folder.

**Repair.** Rewrite every formula in Unicode or a backticked code span (`Rf_!`, `D^b_ctf(X, Λ)`, `RΓ_c(X, K) = RΓ(Spec k, Rf_! K)`), add `metadata.toml`, and re-run the gate. No acceptance while the gate fails; moot under R01.

## R07 (P3) — README shape: no `*Needs:*` lines, no Checks, no per-theorem locators, process narrative

**Location.** Whole README. Counts: `*Needs:*` 0, `**Checks.**` 0, `### Examples` 0, `### Dependencies` 0; no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## Downstream consumers` or `## References` heading; theorem-level locators 0 (the only locators are chapter and section numbers in the table at lines 51–57 and "§38.33" at line 154; "SGA 4, Exposé XVII, and SGA 4½" at line 48 and "Milne, Chapter VI" at line 49 carry no theorem or page). Process and non-timeless text: line 41 and `Suggested.lean` line 6 ("nonexhaustive", contradicting the acceptance-test rule), line 27 ("per the family convention"), `Suggested.lean` line 20. Dependencies are given as directory paths in a code block (lines 36–39) rather than roadmap name and section. Definitions (`Compactification f`, `DenseCompactification f`, `j_!`, `f_!`, `Rf_!`, `RΓ_c`) have no Checks at all; the rule is at least three discriminating Checks per definition.

**Repair.** Subsumed by R01. For any Part II: follow the shape of `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` (sections with `*Source:*`, `*Needs:*` and `**Checks.**`), cite Stacks by tag and lemma number (for instance 0F7I for independence, 0GK0 for the fibre formula, 0GL0 for constructibility), and SGA 4 XVII by theorem number.

## R08 (P3) — Invertibility of the annihilator is assumed where no cited theorem needs it

**Location.** README line 87: "In every base-change, constructibility, finiteness, perfectness, projection-formula, and Künneth theorem, the annihilator `N` of the coefficient ring is assumed invertible on the base"; line 306 ("assuming the annihilator of `Λ` is invertible on `S`").

**Claim.** `Rf_! K ∈ D^b_ctf(S,Λ)` and the base-change theorems need `N` invertible on `S`.

**Witness.** stacks-0GL0 (more-etale.txt) line 2538–2542: constructibility of `Rf_! K` for `K` in `D⁺_tors,c` holds for any Noetherian `Λ`, with no invertibility. stacks-095T (etale-cohomology.txt) line 8827–8841: proper base change holds for every torsion abelian sheaf. EtaleCohomologyFoundations §0.8 and §F.2.1 state `Rf_!` base change "without an invertibility condition" (line 567) and §F.2.4 restricts invertibility to the ctf exchange. Invertibility is needed for smooth base change, ordinary finiteness of `Rf_*` and ordinary Künneth, none of which this folder states.

**Repair.** Subsumed by R01. Otherwise drop the blanket convention and attach invertibility only to the targets whose cited proof uses it.

## Verified sound

**Gate and build.** The worker's gate: `set_option` 0, `sorry-data` 0, `prnum` 0, `imports` 0, `outside-folder` 0, `build` 0, `depcheck` 0; failures only `latex`, `tex`, `metadata` (R06). `lake env lean TauCetiRoadmap/CohomologicalPointCounting/CompactSupport/Suggested.lean` from the worktree: exit 0, no output in 3.8 s (the file declares nothing, so there is no `#check` comparison to make and no one-tactic probe to run; nothing is padding and nothing is sorry'd data). The dependency check, run as instructed with `--movable`: `depcheck: 163 roadmaps, 1164 edges, 0 problem(s)`, no UPWARD or CYCLE line. The whole pull request touches only the seven roadmap folders and the family index (15 files, all additions).

**Seeded sample, the Summit (line 350).** Each of its four clauses checked against the text at the locator:

- compactification independence: stacks-0F7H line 1663–1668, Lemma 63.9.1 (0F7I), for `f` separated finite type between qcqs schemes, any `Λ` on `D⁺_tors`; supports the statement, at wider generality than written (R03);
- base-change compatibility: stacks-0GJY line 2246–2250, Lemma 63.12.2 (0GK0), `(Rf_!K)_ȳ ≅ RΓ_c(X_ȳ, K|_{X_ȳ})` for every geometric point; together with proper base change (stacks-03S2 line 8827–8841, Theorem 59.91.11, torsion sheaves) supports the statement;
- constructibility preservation: stacks-0GJY line 2538–2542, Theorem 63.14.5 (0GL0), `Λ` Noetherian, `f` separated of finite presentation between qcqs schemes; supports the statement, without the invertibility hypothesis (R08);
- perfect `RΓ_c` for ctf coefficients: the Stacks chapter proves constructibility, not finite Tor amplitude of `Rf_!`; the README's locator for this clause is "SGA 4, Exposé XVII, and SGA 4½" without a theorem number (R07). The statement itself is the standard one (SGA 4 XVII 5.2.11 and 5.3.6; SGA 4½ Th. finitude) and is stated identically by EtaleCohomologyFoundations §F.3.

**Section numbers.** stacks-0F41 (flat.txt) table of contents lines 39–40: §38.32 Compactifications, §38.33 Nagata compactification; stacks-0GJY (more-etale.txt) lines 10–22: §63.3 Sections with compact support, §63.8 Preliminaries, §63.9 Derived lower shriek via compactifications, §63.10 Properties, §63.12 Compactly supported cohomology, §63.13 A constructibility result, §63.14 Complexes with constructible cohomology, §63.15 Applications; stacks-03S2 (etale-cohomology.txt) line 81 and 5234: §59.70 Extension by zero. Every section number in README lines 45–57 and 154 is correct.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Compactification exists (Layer 1) | `f = id_S` proper; `A¹_k → Spec k`; `X = ∅` | identity compactification `X̄ = X`; `A¹ ⊂ P¹` with boundary one point `∞`; `∅ ⊂ ∅ → S` | holds; same three Checks appear in EtaleCohomologyFoundations §G.2 lines 135–137 | none (R01) |
| Common refinement via closure of the diagonal (Layer 2) | `C₁ = C₂ = (A¹ ⊂ P¹)` | closure of the diagonal of `A¹` in `P¹ ×_k P¹` is the diagonal `P¹`, projections are identities | holds; cocycle `α₂₃∘α₁₂ = α₁₃` trivially | none |
| `j_!` stalks and exactness (Layer 3) | `j: 𝔾_m → A¹`, `F = Λ` | `(j_!Λ)_x̄ = Λ` for `x ≠ 0`, `= 0` at `0`; `j^*j_!Λ = Λ`; `0 → j_!Λ → Λ_{A¹} → i_*Λ → 0` exact on stalks (`Λ → Λ → 0` away from 0, `0 → Λ → Λ` at 0) | holds | none |
| `j_!` preserves constructibility (Layer 3, line 200) | `j: U → X` étale with `U`, `X` qcqs, `M` a finite `Λ`-module | stacks-03S2 line 5635–5640, Lemma 59.73.1 (03S8): `j_!M` constructible for `Λ` Noetherian; the finite lisse case reduces to this constant case on a finite étale trivialization | holds; the source's hypothesis is qcqs, the README's locally Noetherian `X` with quasi-compact `j` is its Noetherian form | none |
| Underived `f_! = f̄_* j_!` independent of compactification (Layer 4) | `X = A¹`, two compactifications `P¹` and the closure of `A¹` in `P¹ × P¹` via `t ↦ (t, t²)` | both give `(f_!F)_ȳ = Γ_c(A¹_ȳ, F)`: sections whose support is proper over `ȳ`; for `F = Λ` over `k̄` this is `0` in both | holds via proper base change in degree 0 (stacks-03S2 line 8827, Theorem 59.91.11) | none |
| `Rf_!` is not the derived functor of `f_!` but agrees in degree 0 (Layer 5, line 241) | `X = A¹_k̄`, `Λ = ℤ/ℓ`, `ℓ ≠ char k` | `H²_c(A¹, Λ) = Λ(−1)`; `R²(f_!)(Λ) = ⊕_{a ∈ k̄} Λ(−1)` (colimit of local cohomology at finite supports); `H⁰`: both `0` | holds; identical witness in EtaleCohomologyFoundations §0.8 line 577 | none (R01) |
| Localization triangle and its long exact sequence (Layer 6, Layer 10) | `𝔾_m ⊂ A¹` over `k̄`, `Λ = ℤ/ℓ` | `H⁰_c(𝔾_m)=0 → H⁰_c(A¹)=0 → H⁰(pt)=Λ → H¹_c(𝔾_m)=Λ → H¹_c(A¹)=0 → 0 → H²_c(𝔾_m)=Λ(−1) → H²_c(A¹)=Λ(−1) → 0`; ranks `0,0,1,1,0,0,1,1` | exact | none |
| `RΓ_c ≃ RΓ` for proper `X` (Layer 7) | `X = P¹_k̄`, `X = Spec k` | `j = id` so `Rf_! = Rf_*`; `RΓ_c(P¹,Λ) = Λ ⊕ Λ(−1)[−2]`; a point gives `K` itself | holds | none |
| Base change to field extensions (Layer 7, worked example 5) | `k ⊂ k'` separably closed, `X = A¹` | stacks-0GJY line 2246–2250 (0GK0): `(Rf_!K)_ȳ ≅ RΓ_c(X_{k'})` for `ȳ: Spec k' → Spec k`; left side is `RΓ(Spec k, Rf_!K)` independent of `k'`; both `Λ(−1)[−2]` | holds for torsion `K`, no invertibility needed | none |
| `Rf_!K ∈ D^b_ctf(S)` (Layer 8) | `f: A¹_S → S`, `K = Λ`, `S` Noetherian | `R^if_!Λ = Λ(−1)` for `i = 2`, `0` otherwise: constructible, Tor amplitude `[0,0]` | holds; source needs no invertibility (R08) | hypothesis noted |
| Perfectness over `k̄` (Layer 8) | `X = 𝔾_m`, `Λ = ℤ/4`, `K = ℤ/2` (constructible, not ctf) | `RΓ_c(𝔾_m, ℤ/2) = ℤ/2[−1] ⊕ ℤ/2[−2]`, not perfect over `ℤ/4` | ctf hypothesis is necessary; the README keeps it (line 312) | none |
| Projection formula (Layer 9) | `f: A¹_S → S`, `K = Λ`, `L` any ctf on `S` | `Rf_!(f^*L) = L(−1)[−2] = Rf_!Λ ⊗^L L` | holds | none |
| Compact-support Künneth (Layer 9, worked example 6) | `X = Y = A¹` over `k̄` | `Λ(−1)[−2] ⊗^L Λ(−1)[−2] = Λ(−2)[−4] = RΓ_c(A², Λ)` | holds; identical Check in EtaleCohomologyFoundations §F.2.7 line 773 | none (R01) |
| Finite group action compatible with localization (worked example 7) | `G = μ_2` acting on `𝔾_m ⊂ A¹` by `t ↦ −t`, `char k ≠ 2` | the connecting map `H⁰({0}) = Λ → H¹_c(𝔾_m) = Λ` of the localization sequence is an isomorphism and `μ_2` fixes `0`, so the action on `H¹_c(𝔾_m)` is trivial; on `H²_c(𝔾_m) ≅ H²_c(A¹) = Λ(−1)` the automorphism acts by its degree, `1`; both triangle maps are equivariant | holds | none |

**Degenerate and junk instances.** `X = ∅`: `Rf_! = 0`, `RΓ_c = 0`, all statements hold. `S = ∅`: all categories zero. `Λ = 0`: every object zero. `Λ = ℤ` (not torsion): excluded by the standing convention of line 87, matching the `D⁺_tors` domain of stacks-0F7H line 1652–1656. Non-separated `f`: excluded by the scope, correctly (Stacks requires separatedness). `f` finite type but not quasi-compact open `j`: the convention at line 81 requires `j` quasi-compact, as does §G.1 on main. Nonreduced `X`: `Spec k[ε]/(ε²)`-valued points are preserved by schematic closure, the point of §G.1's dual-number Check; the README's "scheme-theoretic closure" (line 162) is the same construction.

**Library declarations opened at the pins.** Mathlib 9caeba1: `class IsSeparated` (`Mathlib/AlgebraicGeometry/Morphisms/Separated.lean`), `class LocallyOfFiniteType` (`Morphisms/FiniteType.lean`), `class IsProper` (`Morphisms/Proper.lean`), `class QuasiCompact` (`Morphisms/QuasiCompact.lean`), `class QuasiSeparated` (`Morphisms/QuasiSeparated.lean`), `class IsFinite` (`Morphisms/Finite.lean` line 39), `class IsSchemeTheoreticallyDominant` (`Morphisms/SchemeTheoreticallyDominant.lean`), `Scheme.Hom.image` (`IdealSheaf/Subscheme.lean` line 650), `smallEtaleTopology` (`Sites/Etale.lean` line 50), `AffineEtale.sheafEquiv` (`Sites/AffineEtale.lean`), `Scheme.ellAdicSheaf` and `EllAdicCohomology` (`Sites/ElladicCohomology.lean`). Absent at the pin: any blowup scheme, strict transform, Nagata compactification, étale extension by zero or compact-support functor (R04 for the first two; the rest agree with README line 105). Tau Ceti is not a Lake dependency of this repository at this head (`lake-manifest.json` lists Mathlib and its own dependencies only), so no `TauCeti.*` import is possible and the Tau Ceti pin could not be opened; the local Tau Ceti clone at d761866 has `TauCeti.CategoryTheory.Sites.ExtensionByZero`, an extension by zero on the open subsets of a space (a preorder site), not the étale `j_!`, consistent with README line 203.

**Cross-roadmap citations resolved.** `ConstructibleEtale` and `EtaleBaseChange` resolve to folders of this pull request (same author, new roadmaps), so the direction is legal; they are the wrong owners for the three objects of R02. The worker's lead `TauCeti.AlgebraicGeometry.EtaleCohomology` (README line 27) is a suggested code home, not a declaration, so it is not a missing-declaration finding. Consumers in the family that cite this folder: `ConstructibleEtale` line 431, `EtaleBaseChange` lines 278, 350, 389, `ComplexComparison` lines 127, 411, `EllAdicRealization` lines 119, 209, 226, 240, `TraceFormula` line 132, `FrobeniusGeometry` line 338; each must be repointed under R01's repair. Ownership against open pull requests was checked with the roadmap grep over all 389 heads for "nagata compactification" and "lower shriek": only this pull request builds them; 848, 852, 1002 and 1040 consume them.

**Declared gaps.** None declared (no `design/plan.json`); no gap is needed, since every prerequisite exists as a target on main.

## Not verifiable

- "SGA 4, Exposé XVII, and SGA 4½, finiteness and compact supports" (README line 48) and "J. S. Milne, *Étale Cohomology*, Chapter VI" (line 49): no theorem, section or page is given, so there is nothing to check at a locator; both texts are behind publisher paywalls (Springer LNM 305 and 569; Princeton University Press) and I did not look for them elsewhere. The statements they are cited for (perfectness of `RΓ_c`, projection formula, Künneth) are standard and are stated identically in EtaleCohomologyFoundations §§F.3 and F.2.7 with SGA 4 XVII §5 and SGA 4½ Th. finitude §§1–2 as locators.

## Source issues

- none
