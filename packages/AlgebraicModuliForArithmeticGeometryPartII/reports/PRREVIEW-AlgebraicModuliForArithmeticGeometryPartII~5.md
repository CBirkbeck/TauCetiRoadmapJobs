# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #1754 at 36adfc3)

**Verdict:** accepted

This is an incremental re-review of the 24 lines that changed since 7db093c. The diff touches only `README.md` and `Suggested.lean`; nothing outside the folder changed. It has no findings.

- Previous findings R01–R04 are repaired.
- R05 (stale locators in the board manifest) is not repaired, but it is settled. The repair report explains that its job may not change existing manifest records, and its brief confirms that, so the finding is not re-raised. The edits are listed below for whoever maintains the manifest.
- The gate passes and the dependency check is clean.
- The new `Over` binders in the real-class Kleiman theorem were checked in Lean: a scratch theorem proves them equivalent to the old `letI` form.

## Previous findings

- R01 — repaired: README line 726 now reads "its germs generate the `O_{X,x}`-module M_x at every point x", and line 740 reads "the free rank-one `O_{X,x}`-module L_x". The gate now reports `tex=0`.
- R02 — repaired: `Suggested.lean` lines 161–162 and 169–170 now read "(_ : IsIntegral C) [C.Over (Spec (CommRingCat.of k))] (i : C ⟶ X) (_ : IsClosedImmersion i), C ↘ Spec (CommRingCat.of k) = i ≫ x →". The gate now reports `statement-hygiene=0`.
- R03 — repaired: README line 450 now reads "Proposition 4.17, p. 33, for local finite type; Proposition 5.3, p. 37, for separatedness; KLE05 lines 1630, 1578 and 1782". The docstring at `Suggested.lean` lines 209–210 cites the same two propositions.
- R04 — repaired: README line 726 now reads "For finite families the forward direction is local and is Tau Ceti `SheafOfModules.GeneratingSections.span_germ_eq_top` … STACKS 01AN gives the converse and arbitrary families". The lemma is also in the From Tau Ceti contract (line 39) and on the §3.3 *Needs:* line (742).
- R05 — not repaired, settled: `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml` line 238 still has "Proposition 1.2, p. 3". The LAZ04 locator (line 256), the KLE05 locator (line 29) and the STACKS locator and `cited_for` (lines 186 and 194) are also unchanged.
  - The repair report answered that its job may only add manifest records and may never change an existing one. Its brief says exactly that, so the reason holds and the finding is not re-raised.
  - The manifest is not part of this pull request, and the README's own locators are correct at this head.
  - The edits stay with the manifest's owner:
    - PS12: change "p. 3" to "p. 2".
    - LAZ04: add Definition 1.3.11 and Proposition 1.3.13 (pp. 48–49).
    - KLE05: add Proposition 4.17 (p. 33) and Proposition 5.3 (p. 37).
    - STACKS: add tags 0335, 0A26, 0B8X, 031T, 01AM and 01AN; add 0.4, 0.7, 1.7, 3.3, 4.3 and 5.4 to `cited_for`; add a Modules-chapter entry.

## Verified sound

### Gate, dependencies, build

- **Gate**, re-run on this head: `gate AlgebraicModuliForArithmeticGeometryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run on the same head also reports `build=0`.
- **Dependency check** (`gate --depcheck … --movable`): `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Merge order.** This roadmap is at line 263. Its suppliers still in open pull requests come earlier: ResolutionOfSingularitiesCharacteristicZero (19), AlgebraicModuliForArithmeticGeometry (36), ComplexComparisonPartII (43) and EtaleCohomologyFoundations (57). JacobianChallenge (2), SchemeAndStackFoundations, StableReduction and AlgebraicVectorBundles are on main (3b3f7ef). The diff changes no supplier citation.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` gives 16 `declaration uses sorry` warnings (lines 93, 106, 128, 137, 154, 201, 216, 250, 275, 297, 330, 368, 385, 405, 427, 447) and nothing else.
- **Files.** The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Pins.** Mathlib 1b1ccf4b and Tau Ceti 2fd255d9.

### The changed Lean statement

- `#check @exists_isAmple_realCombination_iff_exists_pos_nef_sub` gives the same binders on both sides of the `↔`: `∀ (C : Scheme), IsIntegral C → ∀ [inst_3 : C.Over (Spec ↧k)] (i : C ⟶ X), IsClosedImmersion i → C ↘ Spec ↧k = i ≫ x → topologicalKrullDim ↥C = 1 → …`. The theorem keeps `[IsProper x]`, `h.IsAmple`, `[Fintype ι]` and the nonempty index `Fin (n + 1)`. This matches `signatures.md` and README §1.7(v).
- I added two theorems to a scratch copy of the file, and both elaborate with no error:
  - `probe_binder_equiv`: for every predicate `P` on `C.Over (Spec k)`, `(∀ [inst], C ↘ Spec k = i ≫ x → P inst) ↔ P ⟨i ≫ x⟩`.
  - `probe_lhs_equiv`: the new left-hand curve clause is equivalent, for all data, to the `letI` clause of 7db093c.
  
  The right-hand clause has the same shape. The repair therefore changes the form of the statement and not its meaning. This rests on Mathlib's `CategoryTheory.OverClass` having the single field `hom` (`CategoryTheory/Comma/Over/OverClass.lean` line 42).
- `picardFppfSheaf_representable` changed only its docstring. Its type is still `∃ P : Over (Spec k), IsSeparated P.hom ∧ LocallyOfFiniteType P.hom ∧ Nonempty (… RepresentableBy P)`.
- The file has no section `variable`, so no declaration can lose a binder. The other 25 declarations are untouched by the diff. `signatures.md` lists 28 entries; the extra one, "`,` (theorem, line 400)", is a parsing artifact of the word "theorem," inside a docstring.

### One-tactic probe

In a scratch copy I replaced every `sorry` with `first | rfl | simp | infer_instance | (intros; simp_all) | trivial | exact ⟨⟩ | (constructor <;> intro <;> simp_all) | exact ⟨_, rfl⟩ | (refine ⟨_, ?_⟩; simp) | aesop`. All 16 theorems fail: there are 16 errors, one per proof site, and no `sorry` remains. Nothing is padding.

### Changed README passages

- **§2.1 locator (line 450).** Each cited result sits on the page given:
  - KLE05 line 1578 (Proposition 4.17: locally of finite type when the Picard scheme represents the fppf functor) follows the page-33 marker at line 1556.
  - KLE05 line 1630 (Corollary 4.18.3) follows the page-34 marker at line 1599.
  - KLE05 line 1782 (Proposition 5.3: separated over a field when it represents the fppf functor) follows the page-37 marker at line 1743.
  
  Proposition 5.3 assumes exactly the representability that Corollary 4.18.3 gives for X complete over k.
- **From Tau Ceti contract (line 39).** The pinned lemma `SheafOfModules.GeneratingSections.span_germ_eq_top` is at `TauCeti/Algebra/Category/ModuleCat/Sheaf/Stalk.lean` line 154, in the root namespace `SheafOfModules` (line 147).
  - It takes `G : (M.over U).GeneratingSections`, `[Finite G.I]` and `x ∈ U`, and concludes that the germs span the stalk over `TopCat.Presheaf.stalk R.obj x`. It says nothing about infinite families or the converse, as the README says.
  - It is stated for `M : SheafOfModules (TauCeti.SheafOfModules.ringCatSheaf R)`. That `abbrev` (`Sheaf/Defs.lean` line 62) has the same body as Mathlib's `AlgebraicGeometry.Scheme.ringCatSheaf` (`AlgebraicGeometry/Modules/Presheaf.lean` line 32).
  - A scratch `example` (`X : Scheme`, `M : X.Modules`, `R := X.sheaf`) elaborates with no error, so the lemma applies to `X.Modules` as the contract says.
- **§3.3 bullet (line 726).** STACKS (Modules chapter) line 203 (Lemma 17.4.2, tag 01AN) is stated for an arbitrary index set and in both directions. This supports "STACKS 01AN gives the converse and arbitrary families". The finite, local, forward direction is the Tau Ceti lemma above.
- **Real-class docstring (`Suggested.lean` lines 149–150).** "Each curve is a `k`-scheme through its closed immersion into `X`" matches the hypothesis `C ↘ Spec k = i ≫ x`.
- **Dependents of §2.1.** §2.4 (line 507) and §2.5 (line 520) consume the §2.1 statement, which is unchanged.
- **Dependents of §3.3.** The scope sentence (line 11), §3.4 (line 759) and §5.6 (line 1114) consume the §3.3 statements, which are unchanged; only citations were added.
- **Search.** `roadmaps grep` over main and the 478 open heads finds `span_germ_eq_top` and `picardFppfSheaf_representable` only in this roadmap.

### Seeded sample

None of the fifteen sampled targets is in the diff. I still checked each cited source line against its page marker in the cached texts:

| Target | Source line | Page marker | Result |
|---|---|---|---|
| 0.3 | KLE05 2724, 2498, 2754 | p. 57 (2713), p. 52 (2452), p. 57 | match |
| 0.4 | BMP23 825; SCH23 167 | p. 19 (824); p. 4 (135) | match |
| 1.1 | BMP23 825; HW23 96 | p. 19; p. 3 (94) | match |
| 1.2 | KLE05 2840 | p. 59 (2808) | match |
| 1.4 | BMP23 819; HW23 1513 | p. 18 (781); p. 33 (1493) | match |
| 1.6 | WIT22 319; KEE99 46 | p. 7 (291); PDF p. 2 (39) | match |
| 2.9 | SCH23 198 | p. 5 (181) | match |
| 2.12 | WIT22 1513; KEE99 677 | p. 34 (1483); PDF p. 18 (675) | match |
| 3.2 | SCH23 265 | p. 6 (227) | match |
| 3.5 | EGA-IV3 986; SCH23 276 | p. 27 (953); p. 7 (274) | match |
| 4.8 | SCH23 349 | p. 8 (320) | match |
| 5.2 | HW23 1528; LMFDB11 88 | p. 33 (1493); p. 1 | match |
| 5.3 | HW23 1406; KLE05 2219 | p. 31 (1400); p. 47 (2216) | match |
| 5.4 | HW23 1513; STACKS spaces-divisors 1392 | p. 33; p. 30 (1353) | match |
| 5.5 | HW23 1490 | p. 32 (1446) | match |

The README flags no locator as unverified. This round read the opening line of each cited result: for example, SCH23 line 349 is Theorem 2.1, HW23 line 1406 is Lemma 6.3 and EGA-IV3 line 986 is Théorème (8.8.2). It also computed the sampled rows of the table below. Under the incremental scope, the full proofs at these lines were not re-read.

### Citations, gaps, ownership

- **Citation lead.** The worker's resolver found one lead, `Num.free_finiteRank` at README line 279. It resolves to a target of SchemeAndStackFoundations §5.10 on main (that README, lines 7206 and 7220), not to a library name, so it is not a defect.
- **Declared gaps.** The six slugs in the README (`projective-nef-big-criterion`, `proper-bigness-birational-comparison`, `proper-hilbert-space-tangent`, `proper-picard-nonflat-descent`, `relative-exceptional-degree-witnesses`, `relative-numerical-component-reduction`) are the six in `design/plan.json` `gaps`. The diff touches none of them.
- **Overlaps.** `overlaps.md` lists no other open pull request changing this folder, no dropped id and no id defined only by an open revision. The diff adds no construction, only citations of one Tau Ceti lemma and two Kleiman propositions, so the previous round's ownership conclusions stand. AbundanceStatement is on the never-cite list, so this roadmap owns §§0.7, 1.1–1.5, 1.7 and 3.3.
- **Pull-request description.** It is not part of this review. It still says the theory "extends … AbundanceStatement", and that clause should go when the description is next regenerated.

### Headlines

The headline theorems are unchanged and stated:
- Murre–Oort (line 216);
- positive-power constancy (250);
- the torsion theorem over algebraic extensions of 𝔽_p (275);
- descent of projective contractions (330) and contraction descent along purely inseparable extensions (297);
- component-graph descent (368) and fibre-graph descent (385);
- rationality of reducible-fibre image points (405);
- DVR lifting (427);
- ampleness on the special fibre (447);
- the integral and real Kleiman criteria (128, 154) and relative Kleiman (201);
- the numerical Néron–Severi theorems (93, 106).

The module docstring (lines 16–35) names each headline that cannot be stated at the pins and the carrier it lacks.

### Principles and form

- No `set_option` and no sorry'd data.
- Every declaration is a `theorem` or a `def`; there is no `lemma`.
- The imports are `import Mathlib` plus five `TauCeti.*` modules, all of which exist at the pin.
- The new prose is the author's own wording, and no source passage is copied.
- The README's generality equals the Lean's for the changed theorem.

### Adversarial table

Rows marked "r4" are carried from the previous report (7db093c) for statements this diff leaves untouched. The other rows were computed at this head.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `exists_isAmple_realCombination_iff_exists_pos_nef_sub` (binder form) | `probe_lhs_equiv`; wrong k-structure on C = P¹_k, k = ℚ(t), via `x ≫ Spec(t ↦ t²)` | Probe: the new curve clause ⇔ the `letI` clause, proved in Lean. Wrong structure: H⁰(O(1)) and H⁰(O) have k-dimensions 4 and 2, so the degree is 2 instead of 1. It corresponds to the ring map t ↦ t² ≠ id, so `C ↘ Spec k = i ≫ x` fails and the structure is excluded | the only admissible structure is ⟨i ≫ x⟩; statement unchanged | none |
| same, values recomputed | P¹_k with h = O(1): α = O(1), O(−1), 0 | O(1): LHS with s = (1), b = (O(1)) gives 1 = 1; RHS with ε = 1 gives 1 ≤ 1. O(−1): −1 = Σ s_j d_j with d_j ≥ 1 is impossible, and ε ≤ −1 is impossible. 0: 0 = Σ s_j d_j > 0 is impossible, and ε ≤ 0 is impossible | true/true; false/false; false/false | none |
| `picardFppfSheaf_representable` (docstring) | P¹_k; Spec k[ε]/ε²; Prop. 5.3 hypothesis | ∐_{d∈ℤ} Spec k: the diagonal is the open and closed immersion onto the pairs (d, d), so it is separated, locally of finite type and not quasi-compact. Spec k[ε]/ε²: H¹(T, 1 + εO_T) = 0 on affine T, so the sheaf is represented by Spec k. Prop. 5.3 (KLE05 line 1782) needs exactly the representability of Cor. 4.18.3 (line 1630) | locators support each clause | none |
| §2.1 locator | KLE05 lines 1578, 1630, 1782 | page markers 1556 (p. 33), 1599 (p. 34), 1743 (p. 37) | as cited | none |
| §3.3 bullet and contract, line 39 | O(1) on P¹_k with {x, y}, with {x}; ⊕_{n∈ℕ} O_X | {x, y} over U = P¹: at [0:1], x lies in m·L and y generates, so the span is everything. {x} does not generate on P¹ (it vanishes at [0:1]); on U = D(x) the lemma gives the span at [1:0]. An infinite family is excluded by `[Finite G.I]` and covered by 01AN (STACKS Modules line 203) | lemma and STACKS split as stated | none |
| §0.3 (sample) | P¹_ℂ over ℝ, L = O(d); Spec k[ε]/ε²; P¹ over 𝔽_p(t) and its perfect closure | Over ℝ, deg = χ(O(d)) − χ(O) = (2d + 2) − 2 = 2d. Over ℂ, X_ℂ = P¹ ⊔ P¹ with degrees (d, d). No curves on either side. Degree 1 before and after | trivial iff d = 0 on both sides; vacuous/vacuous; nontrivial/nontrivial | none |
| §0.4 (sample) | pr₁ : P¹×P¹ → P¹, L = O(a, b); f = id_S | every fibre, closed or generic, is P¹_{κ(s)} with degree b, so ≡_f 0 iff b = 0 and Pic^τ = ℤ × 0; fibres of id_S are points, so every L ≡_f 0 | matches `RelNumericallyTrivial` | none |
| §1.1 (sample) | pr₁ as above; P¹×P¹ over k; E over k̄ | ℤ²/(ℤ × 0) = ℤ; ℤ²; (ℤ ⊕ E(k̄))/E(k̄) = ℤ | free of finite rank | none |
| §1.2 (sample) | r4: P⁰, Pⁿ, E × E | ranks 0, 1 (n ≥ 1), 3/4/6 | free of finite rank | none |
| §1.4 (sample) | pr₁; id_S | curves over S are the closed fibres F_s, with (O(a,b)·F_s)_{κ(s)} = b, so N₁ = ℝ and NE = ℝ≥0[F], closed; for id_S there are no curves and N₁ = 0 | finite-dimensional, cone as defined | none |
| §1.6 (sample) | P¹ with O(1) and O; P¹×P¹ with O(1,0); n = 0, V = Spec k′ | m + 1 ≥ m and (L·V) = 1; h⁰ = 1 and degree 0; h⁰ = m + 1 < c·m² eventually, with (L²) = 0; h⁰ = [k′:k] ≥ c and (L⁰·V) = [k′:k] > 0 | big ⇔ (Lⁿ·V) > 0 in each case | none |
| §2.9 (sample) | Selmer cubic 3x³ + 4y³ + 5z³ = 0 over ℚ, l = degree 1; pointless conic over ℝ | it has no ℚ-point but has points over cubic fields (a rational line meets it in degree 3), so n = 3 and 3[T₁] = 0; O(1) restricts to a degree-3 bundle, a k-point over 3l. For the conic, P = 0 and T₁ is a point | n·[T_l] = 0 holds | none |
| §2.12 (sample) | y² + y = x³ over 𝔽₂ and 𝔽₄; E/ℚ̄ | #E(𝔽₂) = 3 and a = 0, so #E(𝔽₄) = 4 + 1 − (a² − 4) = 9; E(ℚ̄) has points of infinite order | finite groups; the algebraicity hypothesis is needed | none |
| §3.2 (sample) | f = pr₁ with g = pr₂; g = the structure map; Bl_p P² → P² with g = id | pr₂ is an isomorphism on each fibre, so there is no factorization; the structure map contracts everything and factors uniquely; E is not contracted, so there is no factorization | the contracted-curve hypothesis is decisive | none |
| §3.5 (sample) | X = P¹_{ℚ(√2)} over ℚ, f̄ contracting one of the two geometric components | Ȳ = Spec ℚ̄ ⊔ P¹ is defined over k′ = ℚ(√2) but not over ℚ (Galois swaps the components) | a finite k′ is needed and exists | none |
| §4.8 (sample) | r4: blow-up on a smooth fibre; conic bundle over P¹_ℝ | one vertex ↔ one vertex; two conjugate lines over one vertex, with constancy failing | constancy needed | none |
| §5.2 (sample) | P¹_R; E × E over ℤ_p, E ordinary without CM | O(d) lifts with m = 1. In the second case ρ(special fibre over 𝔽_p) ≥ 4 (graph of Frobenius) while ρ(generic fibre) = 3, so the hypothesis fails | numerical surjectivity is needed | none |
| §5.3 / `lineBundle_lifts_completeDVR_of_h2_zero` (sample) | P¹_R; quartic K3 over k⟦t⟧ with special ρ = 2 and generic ρ = 1 | H² = 0 and O(d) lifts. In the K3 case H²(O_X) = k ≠ 0, and the line ℓ (ℓ² = −2) is not (aH)² = 4a² | H² = 0 is needed and present | none |
| §5.4 / `isAmple_iff_isAmple_specialFibre` (sample) | P¹_R with O(1) and O; blow-up of P¹_R at a closed point | ample/ample; not/not (P¹ is not quasi-affine); degree 0 on the exceptional curve, so neither side is ample | agree | none |
| §5.5 (sample) | P¹×P¹×Spec R with O(1,1) and O(1,0); P¹_R with O(1) | (H²) = 2 on both fibres; (H²) = 0 on both fibres; degree 1 on both | nef and big transfers; non-big stays non-big | none |
| `NumericallyTrivial`, `RelNumericallyTrivial` | r4: P¹_k with O(m); P¹_ℂ over ℝ; ∅; pr₁ with O(a,b); id_S | m; 4 − 2 = 2; vacuous; b; every class | as r4 | none |
| `numericalClassGroup_free_finite`, `relNumericalClassGroup_free_finite` | r4: ∅, P⁰, P¹, E × E; id_S, pr₁, Spec ∏_ℕ k | 0, 0, 1, 3/4/6; 0, ℤ, bounded sequences | Noetherian base needed and present | none |
| `IsNef`, `isAmple_iff_exists_isNef_pow_mul_inv_pow`, `isAmple_mul_of_mem_numericallyTrivialClasses` | r4: P¹ with O(m); Bl_p P²; P¹×P¹ with h = O(1,1); E with O(p) ⊗ O(q − p) | m ≥ 0; E·E = −1; O(1,0) nef; degree 1, ample | as r4 | none |
| `IsRelAmple`, `IsRelNef`, `isRelAmple_iff_exists_isRelNef_pow_mul_inv_pow` | r4: pr₁ with O(a,b); id_S; control n = 0 | ample iff b > 0; b ≥ 0; mb ≥ n | 0 < n needed and present | none |
| `HasTrivialNumericalGaloisAction`, `constantNumericalClasses_iff_positivePowerDescent` | r4: P¹_ℂ/ℝ; pointless conic; d = 0 | swap of (1,0) and (0,1); image 2ℤ with d = 2; vacuous | 0 < d needed | none |
| `numericallyTrivial_torsion_of_algebraic_finiteField` | r4: y² + y = x³ over 𝔽₂; y² = x³ − x over 𝔽₃; E/ℚ̄ | 3 points; 4 points; infinite order | algebraicity needed | none |
| `IsContraction`, `contraction_descends_purelyInseparable`, `IsProjectiveOver`, `contraction_descends_of_constantNumericalClasses` | r4: 𝔸¹ → Spec k[t², t³]; P¹_ℂ → Spec ℝ; perfect closure; V(T₀² + T₁²) ⊂ P¹_ℝ | k[t] ≠ k[t², t³]; ℂ ≠ ℝ; Γ ⊗ K; Spec ℂ over ℝ | wrong models excluded | none |
| `componentGraph`, `constantNumericalClasses_iff_componentGraphDescent`, `fibreComponentGraph_descends_of_constantNumericalClasses`, `residueField_eq_of_reducible_geometricFibre` | r4: P¹ ⊔ P¹; V(xy); swap; [[−1,1],[1,−1]]; degree-2 point | 2 vertices and 0 edges; 1 edge; closure equation fails; −1 on (1,0) and 0 on (1,1); outside the hypothesis | as r4 | none |
| §§0.1, 0.4, 0.7, 1.5, 1.7(v) Checks, 2.3, 2.4, 2.11, 4.2, 4.5, 5.7–5.9 | r4 rows unchanged | quadric cone 1/2; P¹_ℝ degrees 1 and 2; √2-combination (√2, 1); ε/m = 5/6; E² = −2; (−E)·E = 1 | agree | none |

## Not verifiable

- **LAZ04** (Definition 1.3.11, Corollary 1.4.10, Theorem 1.4.23), cited in the docstring of the changed real-class theorem: a commercial textbook, settled as `uncertified` in the manifest and cited by locator only. The mathematics of the statement was checked independently in the table above.
- **KLE66** (Theorems III.1 and IV.1) and **HAR77** (Chapter II): settled as `uncertified`.
- I looked in the package `sources.toml` and the worker's sources cache. Nothing was fetched this round.

## Source issues

- none
