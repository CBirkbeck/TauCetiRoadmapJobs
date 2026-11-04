# Review of McKaySkewGroup (pull request #223 at 30f098d)

**Verdict:** needs changes

This is a full re-review of the repaired head (1450 changed lines since `cdab583`). The previous review's findings are reconciled first, then the whole folder is reviewed.

## Status of the previous review's findings

| Previous | Status at `30f098d` | Evidence |
| --- | --- | --- |
| R01 (P1) uniform scaling | **Repaired.** `README.md:1066–1070` now states `Π^(c²λ)(Q) → Π^λ(Q)` for the uniform scaling and `Π^(cλ)(Q) → Π^λ(Q)` for the one-sided scaling; the Check at `README.md:1091–1093` computes `diag(−4,4)` at `c = 2`; `Suggested.lean:355–357` says `Π^(c²λ) ≅ Π^λ`. Recomputed below (row A19). |
| R02 (P1) companion files admit data | **Not repaired.** `git diff --stat cdab583..HEAD -- TauCetiRoadmap/McKaySkewGroup` lists only `README.md` and `Suggested.lean`; the three companion files are byte-identical to the previous head. See R01 below. |
| R03 (P1) companions do not elaborate | **Not repaired.** Same files; `CBHTraceControls.lean:46` still fails on the unknown `DeformedPreprojectiveAlgebra`. See R01 below. |
| R04 (P2) Weyl-algebra Check needs characteristic zero | **Repaired.** `README.md:1094–1099`: the nonexistence is stated over characteristic zero, with the `k[t]/(tᵖ)` and `𝔽₂` controls. Recomputed (row A21). |
| R05 (P2) double-edge polynomial and CBH headlines | **Repaired.** `IsMcKayQuiver` (`Suggested.lean:279`) admits the Kronecker quiver and the one-loop quiver; `exists_full_corner_equiv_preprojectiveAlgebra` and `exists_full_corner_equiv_deformedPreprojectiveAlgebra` quantify over every McKay quiver. |
| R06 (P2) representation-lattice headline | **Repaired.** `rootLatticeQuotientMap` (`Suggested.lean:155`) has a real body and `exists_repRing_addEquiv_of_isMcKayLabelling` (`:176`) states the Layer 2 comparison on `TauCeti.repRing`. |
| R07 (P3) skew product replanned | **Repaired.** `README.md:697–703` consumes `SkewMonoidAlgebra`, `single_mul_single`, `liftNCRingHom`, `liftNCAlgHom`; only the equivariant-module equivalence is built. |
| R08 (P3) geometric locators | **Mostly repaired.** §7.4 cites BKR01 Theorem 1.2 p. 4, §7.5 cites KV00 §2.1 Lemma and Proposition p. 5 and Rei97 §4.5 Proposition p. 84, §7.2 cites Springer §4.5; all three readable locators verified below. The bibliography's FKS entry now names §8.3 p. 30. Still open: the folder has no `sources.toml` (noted under R06 below). |
| R09 (P3) companion import lists | **Not repaired.** `CBHTraceControls.lean:1–5`, `McKayClassificationTargets.lean:1–5`, `GeometricMcKayTargets.lean:1–5` unchanged. See R01 below. |
| R10 (P3) companions are catalogues | **Not repaired.** Same files. See R01 below. |
| R11 (P3) README shape | **Largely repaired.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, per-layer Examples and Dependencies, Checks in §§6.1–6.5 and 7.1–7.6 are present. Remaining: §§0.1, 4.2 and 5.1 have no `*Needs:*` line (R07 below). |
| R12 (P3) executable search | **Repaired.** §7.2 (`README.md:1799–1805`) states the exceptional invariants, the relation and the inverse map as mathematics with a Molien/freeness route; no search space or certificate remains. |

## R01 (P1) — The three companion Lean files are unchanged: admitted data, failed elaboration, forbidden imports, catalogue padding

**Location:** `TauCetiRoadmap/McKaySkewGroup/CBHTraceControls.lean:1,132`, `McKayClassificationTargets.lean:1,110`, `GeometricMcKayTargets.lean:1–2,351–352`. For example `noncomputable def clusterScheme : ∀ (H : Subgroup TauCeti.SU2) [Fintype H], Over complexPoint := sorry`.

**Claim:** These files are reviewed under the Lean form rules (the brief names them). They admit mathematical data (`scalarStarRepresentation`, `rotationCover`, `namedGenerators`, `clusterScheme`, `resolution`, `resolutionMap`, `tautological`, `componentLabel`, 54 `sorry`s in the geometric file alone), import `Mathlib.*` submodules and another roadmap's module (`TauCetiRoadmap.AlgebraicVectorBundles.Suggested` at `GeometricMcKayTargets.lean:2`) without `import Mathlib`, and do not elaborate. This re-raises R02, R03, R09 and R10 of the previous review, none of which the repair report marked not actionable; the pull-request text itself says "the four Lean files are unchanged".

**Witness:** `git diff --stat cdab583..HEAD -- TauCetiRoadmap/McKaySkewGroup` lists only `README.md` and `Suggested.lean`. Elaborating a scratch copy of `CBHTraceControls.lean` with `lake env lean` gives `CBHTraceControls.lean:46:4: error: Function expected at DeformedPreprojectiveAlgebra` and `:47:25: Unknown identifier deformedPreprojectiveIdeal`; `Suggested.lean:328` declares lower-case `deformedPreprojectiveAlgebra` and no `deformedPreprojectiveIdeal`, `binaryDihedral`, `IrrepFamily` or `cbhCornerEquivDeformedPreprojective`, all of which the controls use. A scratch copy of `McKayClassificationTargets.lean` fails at `:49:60` (`Function expected at trivialFDRep`, unknown identifier) and `:52:44` (unknown `cyclicSU2`), after three `sorry` warnings at lines 38, 41, 45 for admitted definitions. A scratch copy of `GeometricMcKayTargets.lean` fails at `:1:0`: the object file of `TauCetiRoadmap.McKaySkewGroup.McKayClassificationTargets` does not exist, since that module does not compile.

**Repair:** Delete `CBHTraceControls.lean`, `McKayClassificationTargets.lean` and `GeometricMcKayTargets.lean` from the folder. Every statement in them that is a target or a Check is already in the README (the `Q₈` trace test is §5.2, the quotient and cluster constructions are §§7.1–7.5). `Suggested.lean` already states the headlines that are statable at the pins. Tested on the instance that refuted the original: with the three files removed, the folder's only Lean file is `Suggested.lean`, which elaborates with nine `sorry` warnings and nothing else (see Verified sound).

## R02 (P2) — "The highest root is the only dominant root" is attributed to a supplier that does not state it

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:1883–1885` ("the process stops exactly at a dominant root, which is the highest root (RootSystems: in an irreducible simply-laced root system the highest root is the only dominant root)") and `README.md:524–527` ("the adjacent-simple-root orbit adapter to identify this dominant root as the highest root").

**Claim:** The proof routes of §1.1 (the marked extension `α₀ = −θ`) and §7.5 (minimality of the fundamental cycle) both use the uniqueness of the dominant root in an irreducible simply-laced root system. No cited supplier states it: the RootSystems README on main (`RepresentationTheory/RootSystems/README.md`) contains no occurrence of "highest root" (its Layer 4 gives the dominant chamber as a fundamental domain, which does not single out a root), ReductiveGroups 9A.1a (`ReductiveGroups/README.md:1125–1145`) gives the norm-two shell, height induction and `a + b ∈ Φ ↔ B(a,b) = −1` but not uniqueness of the dominant root, and the pins have no `highestRoot` declaration (grep of `Mathlib/LinearAlgebra/RootSystem/` and of Tau Ceti). The statement is true for irreducible simply-laced systems and false without irreducibility (for `A₁ × A₁` both simple roots are dominant), so the hypothesis matters.

**Witness:** `grep -n "highest root" RepresentationTheory/RootSystems/README.md` on main `c994070` returns only references to the LieHighestWeight roadmap (lines 39, 41, 49, 165, 315). For `A₁ × A₁` with Cartan matrix `diag(2,2)`, `α₁` and `α₂` are both dominant roots, so the uniqueness needs irreducibility, which the route must supply from connectedness of the McKay graph.

**Repair:** State in §1.1 a target "in an irreducible finite simply-laced root system (ReductiveGroups 9A.1a's norm-two shell with connected diagram) a dominant root is the highest root, and a dominant root is unique", with the route: a dominant positive root `β` that is not highest admits a simple `α` with `⟨β, α⟩ = −1` and `β + α ∈ Φ` (9A.1a), contradicting dominance only through the standard argument that the support of `θ − β` is nonempty and `⟨θ − β, θ − β⟩ > 0`; cite this target from §7.5 instead of RootSystems. On the refuting instance `A₁ × A₁` the target does not apply (disconnected), and on `A₂` with `δ_rest = (1,1)` it gives `θ = α₁ + α₂`, the unique dominant root, as §1.1 needs.

## R03 (P2) — CharacterTheory Layer 3 is cited for a Hom-dimension API and a character-recognition theorem it does not contain

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:207–208` ("CharacterTheory, Layer 3: the regrouping and Hom-dimension API for finite direct sums and the character-recognition theorem in characteristic zero"), used at `README.md:321`, `:383` (the `A₅` intertwiner) and `:475` (the multiplicities `M_ij`).

**Claim:** CharacterTheory Layer 3 on main (`RepresentationTheory/CharacterTheory/README.md:241–262`) states completeness of the irreducible characters, primitive central idempotents, the virtual-character lattice, the character table, second orthogonality and labelled uniqueness. It states neither a "regrouping and Hom-dimension API for finite direct sums" nor a theorem that two representations with equal characters are isomorphic. The Hom-dimension formula is at the Mathlib pin, `FDRep.scalar_product_char_eq_finrank_equivariant` (`Mathlib/RepresentationTheory/Character.lean:223`) with `FDRep.char_orthonormal` (`:245`); the recognition theorem is at neither pin nor in CharacterTheory (grep for "same character", "afford", "recogni" returns only "table recognition" at line 252, about tables of groups). The `A₅` route of §0.2 and the multiplicity computation of §1.1 therefore rest on an input no owner provides.

**Witness:** `grep -n -i "Hom-dimension\|regroup\|recognition" RepresentationTheory/CharacterTheory/README.md` on main returns only line 252 ("table recognition"). `Mathlib/RepresentationTheory/Character.lean:223` gives `finrank (V →ᵣ W)` as the character scalar product, which is the Hom-dimension input, for `k` of characteristic zero and `G` finite.

**Repair:** In the supplier contract cite Mathlib `FDRep.scalar_product_char_eq_finrank_equivariant` and `FDRep.char_orthonormal` for the Hom dimensions, and CharacterTheory Layer 3 only for completeness and the primitive central idempotents. State the recognition theorem as a target of Layer 1 ("two objects of `FDRep ℂ Γ`, `Γ` finite, with equal characters are isomorphic"; route: semisimplicity of `FDRep ℂ Γ` and the multiplicity formula above, or Mathlib `FDRep.char_orthonormal` plus the decomposition into simples), and cite that target from §0.2. On the instance that refuted the original, the two `Q₈`-representations `V` and `V ⊗ χ` for a nontrivial character `χ` have the same character, and the repaired target identifies them, as §1.2's Example (`V ⊗ χ ≅ V`) needs.

## R04 (P3) — The acceptance file's "not statable" justification for Layer 6 misstates the pins, and §6.1 restates pinned curved objects

**Location:** `TauCetiRoadmap/McKaySkewGroup/Suggested.lean:53–55` ("there are no curved modules, duplexes, curved homotopy categories or stable categories of graded modules at the pins"); `README.md:1131–1134` (the definition of `(A,c)`-complexes and duplexes as new objects) and `README.md:1150–1156` (homotopy categories built from StablePeriodicCurved's `MorphismIdeal`).

**Claim:** The pinned Tau Ceti has `TauCeti.IsCurvedDGAlgebra` (`TauCeti/Algebra/Homology/Curved/Algebra/Defs.lean`), `TauCeti.IsCurvedDGLeftModule` with the left-module square `d_M² = −(w • x)` and the Leibniz rule `d(a x) = da x + (−1)^|a| a dx` (`Curved/Module/Defs.lean`), and `TauCeti.CurvedDuplex C w` with its parity shift, null-homotopic ideal, `CurvedDuplex.HomotopyCategory`, elementary disks, Frobenius exact structure whose stable category is the homotopy category, and the triangulation (`Curved/Duplex.lean`, `DiskFactorization.lean`, `Frobenius.lean`, `Triangulated.lean`), the last three citing FKS §§2–3 by name. FKS's category `Com(A,c)` is exactly the curved DG left modules over the curved DG algebra `(A, 0, −c)` of the pin, and FKS's disks and `Φ₂` are the pin's disks. What the pin lacks is narrower: duplexes over a parity-graded algebra whose odd elements exchange the two components (the pin's duplexes have a scalar curvature in an `R`-linear category), bimodule duplexes, and the stable category of graded `Ã_c`-modules. The headline (FKS Theorem 1) is therefore still not statable without a long encoding, so this is a documentation and duplication defect, not a missing headline.

**Witness:** `TauCeti/Algebra/Homology/Curved/Module/Defs.lean` header: "`dM (dM x) = -(w • x)`", "`dM (a • x) = d a • x + (-1) ^ |a| • (a • dM x)`"; `Curved/Duplex.lean` header: "the homotopy category `CurvedDuplex.HomotopyCategory C w`"; `Curved/DiskFactorization.lean` header: "follow Frenkel, Khovanov and Schiffmann, …, Sections 2–3".

**Repair:** In the module docstring replace the sentence by the exact missing carriers (duplexes over a parity-graded ring with the odd part exchanging components, bimodule duplexes, graded `Ã_c`-module stable categories). In the supplier contract add `TauCeti.IsCurvedDGAlgebra`, `TauCeti.IsCurvedDGLeftModule`, `TauCeti.CurvedDuplex`, `TauCeti.CurvedDuplex.HomotopyCategory` and the disk/Frobenius results with their files; in §6.1 define `Com(A,c)` as the curved DG left modules over `(A, 0, −c)` at the pin and state the comparison of its homotopy category with the pin's `CurvedDuplex.HomotopyCategory` where the curvature is scalar (the `ℚ[u,u⁻¹]` Check), building only the parity-graded duplex category and the stable categories.

## R05 (P3) — The centre's block-scalar equivalence restates CharacterTheory Layer 2

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:1046–1049` ("Construct `Z(ℂ[Γ]) ≃ ℂ^(Irr Γ)` as the block-scalar map, which is the algebra equivalence").

**Claim:** CharacterTheory Layer 2 on main (`RepresentationTheory/CharacterTheory/README.md:235–237`) states "The center splits. `Z(k[G]) ≃ₐ[k] (Irreps k G → k)`, evaluation by central characters". The McKay roadmap's trace coordinates and the factor `δ_i` are new, the algebra equivalence is not.

**Witness:** CharacterTheory `README.md:235`: "`Z(k[G]) ≃ₐ[k] (Irreps k G → k)`, evaluation by central characters".

**Repair:** Cite CharacterTheory Layer 2 for the equivalence and keep only the trace-coordinate map, the identity `Tr_{ρ_i}(z) = δ_i f_i` and the `Q₈` test here. The `Q₈` values (block scalars `(1, −1)`, traces `(1, −2)`) are unchanged by the citation.

## R06 (P3) — No `sources.toml`, and two supplier contracts drop a hypothesis of the pinned declaration

**Location:** `TauCetiRoadmap/McKaySkewGroup/` (no `sources.toml`); `README.md:177–180` ("`TauCeti.irreducibleRepresentation`, the complete family of irreducibles indexed by `Fin (Nat.card (ConjClasses G))` over an algebraically closed field").

**Claim:** The brief's sources rule records every cited work in the roadmap's `sources.toml`; the folder has none, so the twelve works of the References and the four inline citations (Isaacs, Crawley-Boevey's Conze paper, Tikaradze, Springer) carry no fetch status (this is the open part of the previous R08). The pinned `TauCeti.irreducibleRepresentation` lives under `variable [Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]` (`TauCeti/RepresentationTheory/CharacterTable/Table.lean:160`), so the contract must say so; over `ℂ` the hypothesis is automatic, which is why the Lean file is unaffected.

**Witness:** `ls TauCetiRoadmap/McKaySkewGroup` lists `CBHTraceControls.lean GeometricMcKayTargets.lean McKayClassificationTargets.lean README.md Suggested.lean metadata.toml`; `Table.lean:160`: `variable [Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]`.

**Repair:** Add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one entry per work, recording for HK01, FKS05, BKR01, KV00, Rei97, GSV83 and Tikaradze the arXiv/Numdam copies read, `uncertified` for Springer and CBK22, and the status the service returns for Ste85, McK80, CBH98, CL18, CS03 and Isaacs. Add `[Invertible (Nat.card G : k)]` to the `irreducibleRepresentation` contract.

## R07 (P3) — Missing `*Needs:*` lines, an unused hypothesis and process wording

**Location:** `TauCetiRoadmap/McKaySkewGroup/README.md:263` (§0.1), `:906` (§4.2), `:976` (§5.1): no `*Needs:*` line; `README.md:1126–1127` ("Scope all typeclass workarounds to those declarations; do not globally remove imported instances"); `README.md:1492` ("Acceptance must recover both directions…"); `Suggested.lean:312` (`[Nontrivial G]` in `exists_full_corner_equiv_zigzag`).

**Claim:** Every target lists its needs item by item; §0.1 (Mathlib matrix groups, `Quaternion`), §4.2 (3.2, 4.1, ZigzagPreprojective's parameterized skew-zigzag algebra) and §5.1 (Tau Ceti `preprojectiveRelator`, Tikaradze/Crawley-Boevey locators) do not. The two quoted sentences are implementation instructions, not mathematics. In `exists_full_corner_equiv_zigzag` the hypothesis `∃ g, V.ρ g = −1` with `finrank V = 2` already excludes the trivial group, so `[Nontrivial G]` is unused (a note, not a defect).

**Witness:** `grep -n "Needs" README.md` shows no line between 263 and 320, between 906 and 975, or between 976 and 1006. For the trivial group `V.ρ g = 1 ≠ −1` on a two-dimensional `V`, so the existential hypothesis fails.

**Repair:** Add the three `*Needs:*` lines; delete the two process sentences (the first belongs in an implementation note, the second restates §6.4's targets); drop `[Nontrivial G]` or keep it with a comment that it is implied.

## Verified sound

**Scope and gate.** The base tree has no `McKaySkewGroup` folder; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/McKaySkewGroup'` is empty. The worker's gate at this head passes every check including the targeted build. Independently, `lake env lean TauCetiRoadmap/McKaySkewGroup/Suggested.lean` from the worktree completed in 17 s with exactly nine `declaration uses sorry` warnings (lines 76, 85, 95, 131, 142, 176, 295, 312, 361) and no other diagnostic. The dependency check printed, in full:

```text
depcheck: 162 roadmaps, 1176 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `McKaySkewGroup` is at position 317 of the merge order, after SchemeAndStackFoundations (2), KacMoody (3), RepresentationTheory (181) and AlgebraicVectorBundles (248); every other supplier is a roadmap on main (`c994070`). No gaps are declared and none is needed. The citation resolver reported nothing unresolved.

**Signatures.** I appended `#check @name` for all 24 declarations of `Suggested.lean` to a scratch copy and elaborated it once. Every theorem keeps its binders: the three classification theorems carry `[Finite H]` or `Nat.card = 48`; `exists_isMcKayLabelling` carries `[Finite G] [Nontrivial G]`, `finrank = 2`, injectivity and `det = 1`; `exists_repRing_addEquiv_of_isMcKayLabelling` carries `[Finite G]`, `t.Valid` and the labelling; the two corner theorems and the CBH theorem carry `[Finite G]`, the dimension, faithfulness and determinant hypotheses, the McKay quiver, and (CBH) centrality of `z` and the trace formula for `lam`. The three `*Aut` definitions and six instances keep `[Field k] [Group G]` and the `FDRep`; none needs finiteness. `IsMcKayLabelling`, `IsMcKayQuiver`, `rootLatticeQuotientMap`, `cbhRelator`, `deformedPreprojectiveAlgebra` and `CBHAlgebra` have real bodies on native carriers. No binder was silently lost; nothing in the pull request was changed.

**Padding probe.** On a scratch copy each of the nine sorried theorems was tried with `rfl`, `simp`, `infer_instance`, `trivial`, `decide`, `omega` and `aesop` (63 probes); every probe either left the `sorry` or failed with unsolved goals, none closed. No declaration restates a definition, mirrors a Check or computes a small value. The three companion files are the padding (R01).

**Headline inventory.** README end theorems: Klein's classification and conjugacy (stated: three theorems), the McKay correspondence and converse (stated), the representation-ring/root-lattice comparison (stated), the preprojective and zigzag corner theorems (stated), the Crawley-Boevey–Holland theorem (stated), relative Koszul duality (not statable: no relative tensor algebra over a noncommutative base at the pins; `TauCeti/Algebra/QuadraticAlgebra` is the number-theoretic quadratic algebra), the FKS Weyl action (not statable, with the docstring correction of R04), the geometric correspondence (not statable: no Hilbert scheme and no surface resolution at the pins; grep for `Hilb` in Tau Ceti returns nothing). The docstring names each absent headline.

**Adversarial computations (46 rows).** Each row gives the values computed on both sides. Rows A01–A12 cover the Lean headlines, A13–A46 the seeded sections and the passages the findings touch.

| ID | Statement | Instances and values | Result; change |
| --- | --- | --- | --- |
| A01 | `finite_subgroup_SL2_classification` | Trivial group and `{±I}`: cyclic. `Q₈`: `QuaternionGroup 2`, order `4·2 = 8`. Orders of the disjuncts: `4n` (`n ≥ 2`), `24`, `48`, `120`; `C₄₈` satisfies the first and fourth disjunct, which is a disjunction, not a partition. | Retain. |
| A02 | `finite_subgroup_SL2_conjugate_of_mulEquiv` | `H = K = C₃` diagonal, `g = 1`: `H.map conj 1 = H`. `H = ⟨diag(ω,ω⁻¹)⟩`, `K = ⟨diag(ω⁻¹,ω)⟩`, `g = !![0,1;−1,0]`: conjugation swaps the eigenlines, `K = H.map (conj g)`. | Retain. |
| A03 | `card_eq_48_conjugate` | Order-48 subgroups: `C₄₈` (cyclic, excluded), `QuaternionGroup 12` (order `48`, excluded), binary octahedral. No fourth type: `4n = 48` only for `n = 12`, and `24, 120 ≠ 48`. | Exclusions exact; retain. |
| A04 | `IsMcKayLabelling` at `C₂` | `V = sign ⊕ sign`; `dim Hom(triv, V ⊗ sign) = 2`, `2·0 − C₀₁ = 2` for `C = !![2,−2;−2,2]`; `dim Hom(triv, V ⊗ triv) = 0 = 2 − 2`; marks `(1,1)`, affine node `0`. `A 1` is `Valid` (`1 ≤ 1`, `Basic.lean:154`). | Retain. |
| A05 | `IsMcKayLabelling` at the trivial group | `1 × 1` multiplicity `2`; a valid type has `≥ 2` nodes (`nodes_A n = n + 1`, `1 ≤ n`), so no `t` fits. | `[Nontrivial G]` needed; retain. |
| A06 | `exists_isMcKayLabelling_of_valid` | `D 4` has `5` nodes, marks `(1,2,1,1,1)` by `marks_D_apply` (`2` at node `1` only): multiset `{1,1,1,1,2}`, `Σδ² = 8 = |Q₈|`. `E6`: `Σ(3,2,1,2,1,2,1)² = 24`; `E7`: `Σ(4,2,3,2,1,3,2,1)² = 48`; `E8`: `Σ(6,3,4,2,5,4,3,2,1)² = 120`. | Retain. |
| A07 | `rootLatticeQuotientMap` at `A 1` | `bourbakiNode = Fin.succ`, affine node `0`, marks `1`: `triv (1,0) ↦ 0 − 1·1 = −1`, `sign (0,1) ↦ 1`, regular `(1,1) ↦ 0`. Form: `(0,1)·C(0,1) = 2 = 1·2·1`. | Matches `Suggested.lean:174–175`; retain. |
| A08 | `exists_repRing_addEquiv…`, kernel clauses | `Cx = 0` over `ℚ` iff `x ∈ ℚδ` (corank one, `Valid`); `δ_affine = 1` forces `x ∈ ℤδ`. Kernel of the quotient map: `x_j = x₀δ_j` for every non-affine `j` and `δ₀ = 1` give `x = x₀δ`. | Both `↔` directions hold; retain. |
| A09 | `exists_repRing_addEquiv…`, form clause | `x·Cy = (x − x₀δ)·C(y − y₀δ)` since `Cδ = 0` and `C` symmetric; both vectors vanish at the affine node, so the value is the principal submatrix form, `cartanMatrix_submatrix_bourbakiNode` (`Deletion.lean:384`). | Retain. |
| A10 | `IsMcKayQuiver`, trivial group and `C₂` | One loop: `1 + 1 = 2 = dim Hom(triv, ℂ²)`. Kronecker `0 → 1` twice: `2 + 0 = 2 = dim Hom(sign, V ⊗ triv)`; one arrow each way: `1 + 1 = 2`. Odd diagonal multiplicities never occur (`M_ii ∈ {0, 2}`). | Retain. |
| A11 | `exists_full_corner_equiv_preprojectiveAlgebra`, trivial group | `Sym(ℂ²) ⋊ 1 = ℂ[x,y]`; `Π(one loop) = ℂ⟨a,a*⟩/(aa* − a*a) = ℂ[a,a*]`; `f = 1`. | Retain. |
| A12 | `exists_full_corner_equiv_deformedPreprojectiveAlgebra`, sign of `λ` | `a ↦ −a`, `a* ↦ a*` maps `ρ ↦ −ρ`, giving `Π^(−λ) ≅ Π^λ`; `a ↦ a*`, `a* ↦ −a` keeps `ρ`. So the theorem does not depend on the orientation of `Q` or on the sign convention of `[x,y] − z`. | Retain. |
| A13 | §0.1 quaternion map | `i ↦ !![I,0;0,−I]`, `j ↦ !![0,1;−1,0]`, product `!![0,I;I,0] = image of k`; reverse product `!![0,−I;−I,0] = image of −k`. | Homomorphism, not anti-; retain. |
| A14 | §0.1 binary dihedral `n = 2`, `n = 1` | `n = 2`: `r = diag(I,−I)`, `s = !![0,1;−1,0]`, group `{±1,±i,±j,±k} = Q₈`. `n = 1`: `r = −I ∈ ⟨s⟩`, `⟨s⟩ ≅ C₄`. | Family starts at `n = 2`; retain. |
| A15 | §0.1 600-cell count | All permutations: `24·8 = 192`; even: `12·8 = 96`; `96 + 24 = 120`. | Retain. |
| A16 | §0.2 pole-orbit equation | `(2,3,4)`: `23/12 = 2 − 2/24`; `(2,3,3)`: `11/6 = 2 − 2/12`; `(2,3,5)`: `59/30 = 2 − 2/60`; `(2,2,7)`: `13/7 = 2 − 2/14`; `(2,3,6)`: `2`, no finite `K`. | Retain. |
| A17 | §0.2 odd-order preimage | `H = C₃` diagonal: `p(H) ≅ C₃`, `p⁻¹(p(H)) = H·{±I} ≅ C₆ ≠ C₃`. | README's Check correct; retain. |
| A18 | §1.1 weighted Laplacian identity | `D̃₄` star, `M` with centre row `(0,1,1,1,1)`, `δ = (2,1,1,1,1)`: `Mδ = (4,2,2,2,2) = 2δ`; `x = (3,−1,2,5,7)`: `xᵀ(2I−M)x = 98`, `Σ_{i<j} M_ij δ_iδ_j(x_i/δ_i − x_j/δ_j)² = 98`. | Identity holds; retain. |
| A19 | §1.1 `Ẽ₈` check | Tau Ceti edges `(0,1),(0,2),(2,3),(0,4),(4,5),(5,6),(6,7),(7,8)` (`Basic.lean:248`), marks `(6,3,4,2,5,4,3,2,1)`, affine node `8`: `Cδ = 0` at all nine nodes, `Σδ² = 120`; swapping entries at nodes `1,3`: `(Cδ)₀ = 1`. ZigzagPreprojective's `affineE8ArmRel` has the same eight edges. | Retain. |
| A20 | §1.2 `D₈` negative control | Dihedral order `8`: four characters, one `2`-dimensional `V`, `V ⊗ χ ≅ V`, `V ⊗ V = ⊕χ`: labelling `D̃₄`; a reflection has `det = −1`. | Determinant hypothesis independent of labelling; retain. |
| A21 | §2.2 `Q₈` and `Ẽ₈` checks | `D̃₄`: `triv ↦ −(1,1,1,2)`, finite `D₄` norm `2·(0+0+0) + 2·1 = 2`. `Ẽ₈`: `(2I − C)e₈ = Adj·e₈ = e₇`, mark `2`. | Retain. |
| A22 | §3.3 `K₃` check | `R = k(x⊗y)`: `(R⊗W) ∩ (W⊗R) ⊂ x⊗y⊗W ∩ W⊗x⊗y = 0`. `R = x⊗W`: `x⊗W⊗W ∩ W⊗x⊗W = x⊗x⊗W`, dim `2`, versus `R⊗W` dim `4`. | Retain. |
| A23 | §3.3 counterexample base | `S = ℚ[t]`, `W = S⊗S`: `Hom_{Sᵒᵖ}(W,S) ≅ Hom_ℚ(S,S)` uncountable; finitely generated `ℚ[x,y]`-modules are countable. | Separable-semisimple hypothesis material; retain. |
| A24 | §4.1 `Q₈` corner | Basic idempotent uses one matrix unit `E₁₁` in the `2 × 2` block; the central idempotent gives `M₂(ℂ)` in degree zero, not basic. Zigzag dimension of `D̃₄`: `2·5 + 2·4 = 18`; `Λ(V) ⋊ Q₈` has dimension `32`. | Retain. |
| A25 | §4.2 cyclic relations | `X_{i+1}X_i = e_{i+2}x²e_i = 0`; `Y_{i+1}X_i = e_i y x e_i`, `X_{i−1}Y_i = e_i x y e_i = −e_i y x e_i`: ratio `−1`, matching HK01 relation (42) `(i|i−1|i) + (i|i+1|i) = 0`. | Retain. |
| A26 | §4.2 odd-cycle obstruction | `n = 3`, rescalings `s = (2,3,5)`, `t = (7,11,13)`: product of the factors `(s_{i−1}t_i)/(s_i t_{i+1})` around the cycle is `1`; `(−1)³ = −1 ≠ 1`. | Retain. |
| A27 | §5.1 trace normalization | Tikaradze lines 135–137 (preprint p. 4): `λ = Σ f_i τ_i` has `i`-th entry `f_i δ_i`. `Q₈`: scalars `(1,−1)`, traces `(1,−2)`. | Supported; retain. |
| A28 | §5.2 dimension invariant | Trace weights `(+1, −2)` at leaf, centre: `d_leaf − 2d_centre = 0`, `d_leaf + d_centre ≤ 2`: only `(0,0)`. Scalar weights: `E₁₀, E₀₁` have `[a,a*] = diag(−1,1)`, a `2`-dimensional simple. | Non-isomorphism argument correct; retain. |
| A29 | §5.3 scaling | `a = E₁₀`, `a* = E₀₁`: `[a,a*] = diag(−1,1)`; scaled by `2`: `diag(−4,4) = 4·diag(−1,1)`. | `c²λ`; R01 repaired. |
| A30 | §5.3 Weyl algebra in characteristic `p` | `𝔽₂`: `D = E₀₁`, `T = E₁₀`, `DT − TD = I` on `𝔽₂²`; over `ℚ`, `Tr(I) = dim M ≠ 0` unless `M = 0`. | R04 repaired. |
| A31 | §5.3 `C₂` example | `z = c(1 − g)/2`: on `triv` `c(1−1)/2 = 0`, on `sign` `c(1+1)/2 = c`; weights `(0,c)`. | Retain. |
| A32 | §6.1 `Ã_c` multiplication | `(a + bd)(a' + b'd) = aa' + ab'd + bσ(a')d + bσ(b')d²`, `d² = c`: `(aa' + bσ(b')c) + (ab' + bσ(a'))d`. | Retain. |
| A33 | §6.1 contractibility over `ℚ[u,u⁻¹]` | `h = u⁻¹d/2`: `hd + dh = u⁻¹u/2 + u⁻¹u/2 = 1`; `h(am) = (−1)^|a| a h(m)` since `u⁻¹` is central of even degree. FKS line 538 (p. 14) Remark: invertible `c` gives a trivial category. | Retain. |
| A34 | §6.1 disk | FKS Lemma 4.1 (line 566): `P_i = P'_i ⊕ P'_i[−1]` with `d : P'_i ≅ P'_i[−1]`, contractible; the pin's `CurvedDuplex` disk is the same object (R04). | Retain. |
| A35 | §6.2 `s_a` and braid | `c = (3,5)`: `s_a s_a c = (3,5)`; `s_a s_b s_a c = (−5,−3) = s_b s_a s_b c`. | Retain. |
| A36 | §6.2 curvature of the kernel | FKS (6.3) (line 780): `d² = x(2X_a − ΣX_{i(h)})` on `A` for `C_{a,x}`; at `x = −x_a` this is `x_a(ΣX_b − 2X_a) = s_a(c) − c`, so `d² = l(s_a c) − r(c)`. | Sign agrees with FKS; retain. |
| A37 | §6.2 genericity | FKS Theorem 1 (line 999) needs a generic orbit for `R_a R_a ≅ Id`; the Remark (line 1013) weakens it to "no point of the orbit fixed by any `s_a`", which is the README's `x_a(c') ≠ 0` on the orbit. | Retain. |
| A38 | §6.3 Wedderburn sum and centre lift | `E₁₁E₁₁ + E₂₁E₁₂ = E₁₁ + E₂₂`; `ewe` for `w = E₁₂`: `E₁₁E₁₂E₁₁ = 0`. | Retain. |
| A39 | §6.4 Fourier idempotent | `Q₈`, `2`-dim block, `z = −I`: `e = (2/8)(2 − 2z) = ½(1 − z)`, `e² = ¼(2 − 2z) = e`. Without `δ`: `¼(1 − z)`, square `⅛(1 − z) ≠`. | Factor `δ_a` necessary; retain. |
| A40 | §6.5 `Q₈` endpoint composites | `φ_ab(v) = v⊗1`, `φ_ba(1) = y⊗x − x⊗y`: first composite `x ↦ Ω⊗x`, `y ↦ Ω⊗y`, so `c_ab = 1`; second `1 ↦ y∧x − x∧y = −2Ω`, `c_ba = −2`. Weighted `2·1 = 2`, `1·(−2) = −2`. | Raw scalars not antisymmetric; FKS §8.3 display (line 1168–1170) refuted; retain and keep the source issue. |
| A41 | §6.5 reflection with volume ratio | `κ_c = 2κ_l`: reflecting at `l` changes `f_c` by `(κ_c/κ_l) f_l = 2f_l`, and `f_l ↦ −f_l`. | Retain. |
| A42 | §7.1 `C₂` fibre | `S/(x²,xy,y²)` has basis `1,x,y`, length `3 ≠ 2`; `diag(1,−1)` fixes `(1,0)`, `−I` fixes nothing. | Flatness only on `V°`; retain. |
| A43 | §7.2 dihedral `m = 2` and Molien | `x = 1, y = 2`: `A,B,w,Y,Z,X = 1,16,2,17,4,−30`, `X² = 900 = 4·(289 − 64)`. Molien `C₂` series coefficients `1,0,3,0,5,0,7,0,9`; Hilbert series of `ℂ[X,Y,Z]/(XY−Z²)` with degrees `2`: `1,0,3,0,5,0,7,0,9`. NilpotentOrbits N8's `D_M` form `x²+y²z+z^(M−1)` at `M = m+2` is the README's `Z^(m+1)`. | Retain. |
| A44 | §7.4 BKR | BKR lines 122–123 (p. 4): "Suppose `n ≤ 3`. Then `G-Hilb M` is irreducible and is a crepant resolution"; `ω` is `G`-trivial for `Γ ⊂ SL₂`. A crepant resolution of a rational double point has no `(−1)`-curve. | Locator exact; retain. |
| A45 | §7.5 degrees and cycles | KV lines 193–194 (p. 5): `E_π|P¹_ρ` trivial for `π ≠ ρ`, `O(1) ⊕ O^(d_π−1)` for `π = ρ`. `D̃₄`: `Z = 2E_c + ΣE_k`: `Z·E_c = −1`, `Z·E_k = 0`; `E_c + ΣE_k`: `·E_c = +1`. `C₃`: `(E₁+E₂)·E_j = −1`. `Z_Γ·E_j = −(Cδ)_j + C₀_j = −M_{j0}`. Reid lines 3697–3699 (p. 84): unique minimal effective `Z > 0` with `ZΓ_i ≤ 0`. | Retain. |
| A46 | §7.6 Lie data | `A₁`: `sl₂`, dim `3`; `E₈`: `248 = 8 + 240`; trivial group: empty root system, zero algebra. | Retain. |

**Pinned library audit** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa` per `lake-manifest.json`), opened at the pin:

| File and line | Declaration | Consequence |
| --- | --- | --- |
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:154,177,226,368,500,519` | `Valid` (`A n ↔ 1 ≤ n`, `D n ↔ 4 ≤ n`), `IsGraphical` (`≠ A 1`), `graph`, `cartanMatrix` (`A 1 ↦ !![2,−2;−2,2]`), `marks`, `affineNode` | `A 1` valid and not graphical; `E8` numbering matches the README's. |
| `…/AffineDynkinType/Deletion.lean:84,131,384` | `finiteType`, `bourbakiNode`, `cartanMatrix_submatrix_bourbakiNode` (needs `Valid`) | `rootLatticeQuotientMap` and the form clause are on the right carriers. |
| `TauCeti/RepresentationTheory/Simple/Basic.lean:188,196` | `SimpleFDRepClasses` (skeleton of the simple full subcategory), `mk` | Labelling indexes genuine simple classes. |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean:160,248` | `irreducibleRepresentation` under `[Finite G] [IsAlgClosed k] [Invertible (Nat.card G : k)]` | R06. |
| `TauCeti/RepresentationTheory/RepresentationRing/Basic.lean`, `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:124`, `Monoidal/Basic.lean:179` | `repRing`, `SplitK0.of`, `of_mul_of` | Layer 2 headline on the native ring. |
| `TauCeti/RepresentationTheory/Quiver/Preprojective/Basic.lean:115,341,597` | `doubledVertexIdempotent`, `preprojectiveRelator`, `preprojectiveAlgebra` | `deformedPreprojectiveAlgebra` at `λ = 0` is the native algebra. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Relations.lean:300` | `nonisolatedZigzagQuotient` (connected graph with an edge) | Graphical valid types are connected with `≥ 3` nodes. |
| `Mathlib/RingTheory/Idempotents.lean:552`, `TauCeti/RingTheory/Idempotents/Corner.lean:162`, `TauCeti/RingTheory/Morita/Corner.lean` | `IsIdempotentElem.Corner`, `instAlgebra`, `cornerEquivalence` | Corner statements are on the native carrier. |
| `Mathlib/Algebra/SkewMonoidAlgebra/Basic.lean:742,779,1042`, `Lift.lean:30` | `liftNCRingHom`, `instRing`, `single_mul_single`, `liftNCAlgHom` | R07 (previous) repaired. |
| `Mathlib/RepresentationTheory/Character.lean:177,223,245` | `FDRep.char_tensor`, `scalar_product_char_eq_finrank_equivariant`, `char_orthonormal` | R03 repair target. |
| `Mathlib/RingTheory/IntegralDomain.lean:130`, `Mathlib/GroupTheory/SpecificGroups/Quaternion.lean:51,174`, `Mathlib/LinearAlgebra/UnitaryGroup.lean:253`, `Mathlib/RepresentationTheory/Basic.lean:119` | `isCyclic_of_injective_ringHom`, `QuaternionGroup`, `card = 4n`, `specialUnitaryGroup`, `asAlgebraHom` | Layer 0 and CBH statements on the named carriers. |
| `Mathlib/LinearAlgebra/RootSystem/GeckConstruction/Basic.lean:174`, `Basis.lean:105,125` | `lieAlgebra`, `equivRootSystem`, `equivLieAlgebra` | §7.6 consumes them with their hypotheses. |
| `TauCeti/AlgebraicGeometry/Quotient/Affine.lean:46–60` | `AffineInvariantQuotient.quotient`, `projection` | §7.1's `q`. |
| `TauCeti/Algebra/Homology/Curved/{Algebra/Defs,Module/Defs,Duplex,DiskFactorization,Frobenius,Triangulated}.lean` | curved DG algebras and left modules, curved duplexes, homotopy category, disks, Frobenius structure, triangulation | R04. |
| `TauCeti/RepresentationTheory/SU2/SymmetricPower.lean:70`, `ClassicalGroups/Standard.lean:45` | `SU2.toGL`, `stdRep` | §1.1's restricted representation exists. |

**Supplier audit** (main `c994070`; KacMoody at its open head, which adds a new folder and is earlier in the order). Resolved: CharacterTheory Layers 2–3 (`RepresentationTheory/CharacterTheory/README.md:221,241`; R03, R05), CompactGroups and ClassicalGroups folders, LieGroups' `SU(2)`, `SO(3)` double cover (`LieGroups/README.md:479–483`: `Ad` surjective with kernel `{±1}`), RootSystems Layers 4–6 (`RootSystems/README.md:296,321,356`; R02), ReductiveGroups 9A.1a (`ReductiveGroups/README.md:1125–1145`, norm-two shell and `a+b∈Φ ↔ B = −1`), ZigzagPreprojective scope and downstream skew-group convention (`ZigzagPreprojective/README.md:21–55,126–139`: it leaves the skew-group construction to this roadmap and supplies ordinary and parameterized skew-zigzag algebras), QuiverRepresentations Layers 0–3, DGAInfinity Layer 11 (`DGAInfinity/README.md:629`: right dual, separable semisimple base, right modules, linearity from GEF Layer 3), GrothendieckEulerForms Layer 3 (`:283,313`, linear resolutions), StablePeriodicCurved `MorphismIdeal` (`StablePeriodicCurved/Suggested.lean:122`) and Layer 5 curved modules, NilpotentOrbits N6–N8 (`NilpotentOrbits/README.md:369,417`: the five hypersurfaces, explicit resolutions, `−2` curves, intersection lattice, no global polynomial isomorphism), ReflectionInvariantTheory §1 (`:7–17`: Reynolds, Molien, Noether, finite generation), GroebnerGeometry G1 (`:63`), SchemeAndStackFoundations §§1.17, 4.14, 5.1–5.3, 5.7 (`:2624,5706,6567,6653,6701,6987`), AlgebraicVectorBundles L0A–B (`:215,228`), KacMoody KM0–KM1 (`rev/1124/.../KacMoody/README.md:20,30`). Ownership: `roadmaps grep` for McKay, Kleinian, skew group, `Γ-Hilb`, deformed preprojective, binary icosahedral and Weyl/reflection functors finds no other owner of these objects; the hits are consumers (K3SurfacesAndSymplecticBoundedness, GrothendieckEulerForms, ZigzagPreprojective) or unrelated objects (BGP reflection functors in QuiverRepresentations, Kleinian groups). The open pull request #1653 revises the existing ZigzagPreprojective roadmap and is correctly cited as on main. No declaration of `Suggested.lean` has a fully qualified name declared elsewhere.

**Sources read at their locators** (line numbers are of the service's extraction): HK01 arXiv `math/0002060v2`, lines 545–627 (preprint pp. 12–14): (38)–(41), Proposition 13, Corollary 3 with its left/right remark, Proposition 14 (symmetric for even `dim V` needs central `−Id`), Propositions 16–17 and relation (42), all as cited in §§3.3, 4.1, 4.2. FKS05 arXiv `math/0311485v1`: §2.1 lines 422–437 (shift twists the action by parity, `Ã_c` definition), §2.3–2.4 lines 454–471 (`d² = l_{c₀} + r_{c₁}`, tensor sends `Com(A,−c₁) → Com(A,c₀)`), §3.1 lines 475–490 (duplexes), §3.2 Remark line 538, Lemma 4.1 and (4.1) lines 566–573, §5.1 lines 613–623 (symmetric iff bipartite, zigzag), §6.2 lines 759–807 ((6.3)–(6.4), `s_a`), Lemma 6.1 line 810, Proposition 6.1 line 846, Theorems 1–2 and Remark lines 999–1016, §8.1–8.3 lines 1124–1170, §9.3 lines 1381–1408; every §6 locator of the README is exact. Tikaradze arXiv `2204.13647v2` lines 118–138 (pp. 3–4). BKR01 `math/9908027v2` lines 122–123 (p. 4). KV00 `math/9812016v2` lines 181–202 (p. 5). Reid `alg-geom/9602006v1` lines 3690–3707 (§4.5, p. 84). GSV83 Numdam, lines 97–113 (p. 411): the McKay bijection and the degrees as multiplicities of the fundamental cycle, corroborating KV's attribution.

## Not verifiable

- **Ste85** (§§1.1, 1.2, 2.2): the service found no legal copy by title or DOI `10.2140/pjm.1985.118.587`; the msp.org landing page `pjm/1985/118-2/p30.xhtml` names the PDF `pjm-v118-n2-p30-s.pdf`, which returned HTTP 404 to the service, and the Project Euclid issue page returned no content. §1(1)–(8) was not read.
- **McK80**, Props. 1–2: the DOI lands on the AMS volume page, on no licence class; not read.
- **CBH98**, Theorem 0.1 and §§3–4: Project Euclid landing page without a PDF link; not read. Tikaradze's statement of the CBH theorem (lines 132–137) was used only for the normalization.
- **CL18**, **CS03**, **Isaacs** Theorem 4.3: MDPI returned HTTP 403; the two books have no legal online copy known to the service.
- **Spr77** §§4.4–4.5 and **CBK22**: paywalled, recorded as uncertified.
- **Crawley-Boevey, Conze paper** (author page): the legal PDF was fetched but is an image-only scan and OCR is not installed on this worker; its p. 3 statement was not read. The same normalization is confirmed by Tikaradze.
- **FKS05 journal pagination**: only the arXiv v1 was read; the journal page correspondences in the References were not checked.
- **Companion Lean files**: none of the three elaborates (witnesses in R01), so no sorried companion theorem is certified as a well-typed proposition; their mathematical intent was reviewed from the text and is covered by the README's targets and Checks.

All missing texts are listed in the review's `needs-references.toml`; no manifest was edited.

## Source issues

- **Error** in FKS05 at §8.3, arXiv v1 printed p. 30 (lines 1168–1170): the source says the ordered wedge-composite scalars of an edge and its reverse sum to zero; it should be the endpoint-dimension-weighted scalars that sum to zero (for `Q₈` the raw scalars are `1` and `−2`); affects a stated result.
