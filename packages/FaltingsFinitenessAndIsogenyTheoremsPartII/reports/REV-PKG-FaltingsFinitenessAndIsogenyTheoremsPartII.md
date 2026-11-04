<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1273#issuecomment-6391053058 -->
Review (claude) of ddef4f3

Verdict: needs changes

1. **F01** (P1) A cited roadmap that exists nowhere: OpenImageTheoremsForAbelianVarieties

   **Location.** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md` line 15: "Elliptic and surface open-image theorems, real multiplication images, and density/automorphy applications belong to OpenImageTheoremsForAbelianVarieties"; line 1254 (a paragraph describing that roadmap's layers and their supply direction); lines 1256–1263 (six "Consumer boundary Checks").

   **Claim.** Scope is deferred to, and a supply direction is stated for, a named roadmap.

   **Witness.** `roadmaps grep --fixed OpenImageTheoremsForAbelianVarieties` answers "No match on main or in any open roadmap pull request"; the name is not in the merge order, not in the board's package index, and appears only inside two other packages' design files.

   **Repair.** Delete the name on line 15 and say in one clause that open-image, real-multiplication and density/automorphy results are outside this roadmap. Delete the line-1254 paragraph (it plans another roadmap's layers) and the six consumer boundary Checks (they test objects this roadmap does not define: `SL₂(𝔽₉)`, Sato–Tate components, a Weil restriction). Re-running the grep on the repaired README must return no match.

2. **F02** (P1) Four plan gaps for this roadmap's own proofs have supplier `none` (G1, G2, G4, G5)

   **Location.** `design/plan.json` gaps G1, G2, G4, G5, none stated under `## Exact supplier contracts`. Their targets: README §2.2 (lines 340–344), §§2.4–2.5 (372–392), §6.3 (918–946), §7.5 (1070–1076). §2.2 *Needs:* "§2.1; ArakelovGeometryAndAbelianHeights §3.4; AbelianSchemesAndArithmeticModuli §A5.2–A5.4".

   **Claim.** Each gap is a declared contract.

   **Witness.** Supplier `none` is unowned. The §2.2 route uses "a multiplicity estimate" (line 342); `roadmaps grep -i 'zero estimate|multiplicity estimate'` finds no such estimate on abelian varieties anywhere, only one-variable and modular ones (DiophantineApproximationAndTranscendence).

   **Repair.** Give each gap an owner and declare it where the intake reads it (same slug in plan.json and a `What <Supplier> must provide (gap:<slug>)` line):
   - G1: state the multiplicity estimate and the auxiliary-section/interpolation estimate as Layer 2 targets of this roadmap (bost95 §§5.2–5.3) with their own *Needs* lines, and take the matrix-height input from ArakelovGeometryAndAbelianHeights §5.8, which states Masser's matrix lemma; then retire G1.
   - G2: the decay half is already `gap:fixed-siegel-cusp-family`; the value bound is target §2.4 here. Retire G2 and add the arithmetic value estimate §2.4 uses to its *Needs* line.
   - G4: the slope inputs are `gap:hermitian-maximal-slope` (see R10); the gr14 §§6.1–6.9 argument is §6.3 here and reuses the G1 multiplicity target. Retire G4.
   - G5: §7.5's route uses only §5.3, A4.1 and A6.7, all owned. Retire G5.
   Retiring or re-assigning a plan gap is a maintainer edit (at the package stage plan.json may only gain gaps).

3. **F03** (P1) §8.1 rests on an unowned theorem (gap G7, supplier `none`)

   **Location.** README §8.1, lines 1138–1142: "The generic/specialization extension of the number-field Tate theorem yields rational Hom comparison and semisimplicity." *Needs:* only Part I R28.4.5–R28.4.6, A6.25, A4.1. Plan gap G7 has supplier `none` and is not stated in the README.

   **Claim.** The Hom comparison over finitely generated fields follows from the number-field case by specialization.

   **Witness.** noot95 line 172 (proof of Corollary 1.5) obtains exactly this comparison from Faltings–Wüstholz VI §3, so Noot's specialization (the input of §8.2) presupposes §8.1. Equal images (noot95 Proposition 1.3) transfer semisimplicity, but not equality of Hom ranks.

   **Repair.** Own the step: add a target here for the function-field Tate comparison (fw84 VI §3, uncertified, cited by locator) with a decomposed route, or name a supplier roadmap and section; record it as `gap:<slug>` with that supplier in plan.json and in the README contracts; add NeronModelsAndSemistableAbelianVarieties §6.0 and InverseGaloisAndArithmeticFundamentalGroups IG.2.4 to the §8.1 *Needs* line, since the route specializes.

4. **F04** (P1) Gaps G3 and G8 (supplier `none`) duplicate supplies the README already names

   **Location.** plan.json G3 ("prove or locate cyclicity with a degree-index maximal splitter") and G8 ("Supply the closed-subgroup theorem for compact subgroups of GL_n(Z_ℓ), their topological finite generation, and openness of the relevant profinite Frattini subgroup"); README lines 77 and 89–91.

   **Claim.** Unowned prerequisites.

   **Witness.** README line 77 already declares `gap:cyclic-maximal-subfield` (supplier ClassFieldTheory Layer 10). ArithmeticGaloisRepresentations (open head bef111d) §5.8 "Compact subgroup charts" and §6.4a "Finite Frattini quotient of a compact matrix group" state the closed-subgroup theorem and openness of Φ(P).

   **Repair.** Retire G3 in favour of `gap:cyclic-maximal-subfield`; set G8's supplier to ArithmeticGaloisRepresentations §§5.8, 6.4a, or retire it because README line 89 consumes those sections as supplied (maintainer edit).

5. **F05** (P1) Minkowski's first theorem cited to a section that does not state it

   **Location.** README line 548 (§3.3 *Needs:* "GeometryOfNumbersAndQuadraticArithmetic §1.1"), line 600 (§3.5 *Needs*), line 642 (Layer 3 Dependencies), line 63 ("Sections 1.1–1.2 give the symmetric convex-body Minkowski interface").

   **Claim.** GeometryOfNumbersAndQuadraticArithmetic §1.1 supplies the convex-body theorem used in §3.3 and §3.5.

   **Witness.** That section (open head 465728d) is "Elementary product and volume bounds": `ordered_tail_product`, `orthonormal_cube_volume`, `inscribed_cube`, `intrinsic_ball_lower_bound`. Its Scope (line 34) says Minkowski's first theorem is Mathlib's, used without restatement.

   **Repair.** Cite Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (`Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`, line 65; resolves at the pin) in `### From Mathlib`, in the §3.3 and §3.5 *Needs* lines and in the Layer 3 Dependencies; keep the GN citation only for successive minima (§1.2) and §1.5.

6. **F06** (P2) Part I's R28.6.7 is rebuilt without citation; the Scope misstates where Part I stops

   **Location.** README line 7: "FaltingsFinitenessAndIsogenyTheorems stops at qualitative finiteness, number-field Tate comparison and semisimplicity (R28.4–R28.5)"; §7.3 (line 1040), §7.6 (line 1088), §6.1 route (line 888).

   **Claim.** Part I supplies only R28.4–R28.5 here.

   **Witness.** Part I (open head bf09cb8) R28.6.7 `commutant_almostAll`: for almost all ℓ the ℤ_ℓ-algebra generated by Galois is the commutant of End_K(A)⊗ℤ_ℓ, with auxiliary `order_centralizer_reduce` (the integral centralizer reduces mod ℓ). §7.6 at d=1 is that theorem; §7.3 is that auxiliary.

   **Repair.** Scope: Part I stops at R28.6, including the integral commutant at almost all primes. Cite R28.6.7 in the §7.6 and §7.7 *Needs* lines and say in one clause that §7.6 differs by uniformity over subgroups of index at most d. In §7.3 either consume `order_centralizer_reduce` or keep §7.3 with one clause on how it differs (explicit exceptional set ℓ∤M_A, injectivity at every ℓ). Cite R28.6.6 `hom_isogenous_cyclic` for the rank-one non-CM Hom lattice in the §6.1 route.

7. **F07** (P2) A headline statable at the pins (§6.4) is absent, and the module docstring calls it unstatable

   **Location.** `Suggested.lean` lines 17–18: "the quadratic elliptic bounds require stable height and its j-invariant comparison"; README §6.4, line 958.

   **Claim.** The quadratic elliptic bounds cannot be stated at the pins.

   **Witness.** §6.4 uses the Weil height of j, not the Faltings height: Tau Ceti `TauCeti.Isogeny.degree` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean`, line 99) and Mathlib `NumberField.absLogHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean`, line 145) suffice. The statement below elaborates at the pins with only a `sorry` warning.

   **Repair.** Add `import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree` (its object file is built), a `/-! ## Layer 6: Quadratic elliptic isogeny estimates -/` section with the theorem below, its name backticked in README §6.4, and restrict the docstring sentence to §6.3 (Faltings height). Tested with `lake env lean` from the content checkout (mz20 Lemma 2.2, D≥2; gr14 Theorem 1.4):

   ```lean
   theorem elliptic_isogeny_j_height_bound :
       ∃ C : ℝ, 0 < C ∧ ∀ (k : Type) [Field k] [NumberField k], 2 ≤ Module.finrank ℚ k →
         ∀ (E₁ E₂ : WeierstrassCurve k) [E₁.IsElliptic] [E₂.IsElliptic],
           Nonempty (TauCeti.Isogeny (E₁.baseChange (AlgebraicClosure k)).toAffine
             (E₂.baseChange (AlgebraicClosure k)).toAffine) →
           ∃ φ : TauCeti.Isogeny (E₁.baseChange (AlgebraicClosure k)).toAffine
               (E₂.baseChange (AlgebraicClosure k)).toAffine,
             (φ.degree : ℝ) ≤ C * (Module.finrank ℚ k : ℝ) ^ 2 *
               Real.log (Module.finrank ℚ k) ^ 2 * (1 + NumberField.absLogHeight₁ E₁.j) ^ 2 := by
     sorry
   ```

8. **F08** (P2) Padding in Suggested.lean: `division_norm_body_lower_bound` and its two definitions

   **Location.** `Suggested.lean` lines 39–66 (`regularNormCoordinates`, `divisionNormBody`, `division_norm_body_lower_bound`); README line 104 ("The two Layer 3 headlines expressible on native carriers are …"), lines 544 and 580.

   **Claim.** p(D) ≥ 2^m is a headline theorem.

   **Witness.** mw95 lines 232–234: the Class Index Lemma follows from Lemmas 2.1–2.2 once (2.6), p(D) ≥ 2^m, holds; Lemma 3.3 (line 319) proves (2.6). It is a step inside `class_index_bound`'s proof; the two definitions serve only it.

   **Repair.** Delete the theorem and both definitions from `Suggested.lean` (the README keeps §§3.3–3.4 as prose targets; drop their backticked Lean names and the line-104 sentence). The one-tactic probes (`simp`, `positivity`, `norm_num [divisionNormBody]`, `aesop`) do not close it: this is padding by role, not by triviality.

9. **F09** (P2) Gap G6 asks for what the pins already provide

   **Location.** plan.json G6 (supplier ProfiniteArithmetic): "Register that existing upstream stage, then move this precise supply into requests and both direct prerequisite lists"; README line 47 consumes the same declarations directly from Tau Ceti.

   **Claim.** A supplier contract is needed for the profinite-integer ring.

   **Witness.** `TauCeti.zHat.ringEquivPiPadicInt` (`ZHat/Decomposition.lean`, line 162), its continuity theorems (lines 182, 187) and `TauCeti.zHat.tendsto_sum_idem` (line 320) exist at the pinned Tau Ceti. G6 itself asserts no mathematical gap; its text is tooling narrative.

   **Repair.** Retire G6 (maintainer edit); README line 47 is the contract.

10. **F10** (P2) `gap:hermitian-maximal-slope` is compound and leaves its inequalities unstated

   **Location.** README line 59: "… with dual, tensor, symmetric-power and norm-controlled morphism inequalities and the metric-rescaling law, compatible with the semistable-extension convention for abelian tangent bundles."

   **Claim.** One precise contract.

   **Witness.** Four inequality families are named, none stated; the route needs exact error terms, e.g. gr14 line 1441 (μ̂_max of the ℓ-th symmetric power at most ℓ(μ̂_max + 2 log rank)) and line 1434 (−h(e) ≤ μ̂_max).

   **Repair.** Split into slugs, one statement each, same slugs in plan.json: (a) μ̂_max of a nonzero Hermitian bundle over O_K exists, is invariant under finite extension, and −h_Ē(e) ≤ μ̂_max(Ē) for e≠0; (b) the symmetric-power bound of gr14 line 1441; (c) for nonzero φ: Ē→F̄, μ̂_min(Ē) ≤ μ̂_max(F̄) + h(φ); (d) rescaling every archimedean metric by c>0 shifts μ̂_max by −½ log c. Ask the semistable-extension convention for abelian tangent bundles separately, from the section that defines that bundle.

11. **F11** (P3) `gap:hom-specialization-saturation` restates half of A6.25

   **Location.** README line 51: "specialization from geometric generic Hom to geometric fibre Hom is injective with torsion-free cokernel".

   **Witness.** AbelianSchemesAndArithmeticModuli (open head 71ecc01) A6.25(1) already gives that, over a connected locally Noetherian base, Hom embeds into the Hom of a geometric fibre.

   **Repair.** Needs: "the cokernel of the A6.25(1) specialization map on geometric Hom is torsion-free, compatibly with every finite étale torsion realization."

12. **F12** (P3) Two statements are narrower than their sources

   **Location.** README §5.2 (line 808, factorization over k only); §2.2 (line 340, principal polarizations only).

   **Witness.** mw95 lines 45–50 and 661–671: Theorem I holds over any K ⊇ k, factors simple over K. bost95 Theorem 2.2 (line 151) and gr14 lines 63–68: the period theorem for any ample L, constant depending on deg_L A.

   **Repair.** Register the relative-K factorization next to §5.4 (mw95 p. 23), and state §2.2 for an arbitrary polarization with the constant's dependence on its degree (the principal case becomes a Check), or say in one clause why every consumer needs only the narrower form.

13. **F13** (P3) Locator slips

   **Location and witness.**
   - §3.2, line 510, "definition preceding(2.1)": (2.1) is mw95 line 155; the class index is defined after it, lines 157–159.
   - §6.1, line 886, "gr14 line 1770": that line is in Remark 7.4; Theorem 7.5 is gr14 line 1813.
   - §6.2, line 902, "gr14 line 1950": that line is in §7.3; §7.4 with Lemmas 7.7–7.8 is gr14 lines 1995–2012.
   - §7.2, line 1022, deligne84 Théorème 2.7 (line 534) says only that Galois generates an open subalgebra of the commutant for the full number-field Galois group; it does not state the product formula for every open U′ (that is ry25 lines 492–497 plus the README's own proof).
   - §1.7, line 262, "mz20 line 783": that is equation (21); (22) is mz20 line 788.

   **Repair.** Correct these five locators.

14. **F14** (P3) Process identifiers in the README and the manifest

   **Location and witness.** README line 1114, "the dimension-only constants of QI.5" (a design node id the README never defines); line 810 "MW94(5.3),(6.4)" and line 1220 "RY25 Theorem 4.7" (not manifest keys); `sources.toml` `cited_for` values "QI.1" … "QI.8" (lines 39, 55, 71, 87, 103, 119, 135, 182) name design nodes rather than README sections.

   **Repair.** "§5.5"; "mw94-preprint (5.3), (6.4)"; "ry25 Theorem 4.7"; `cited_for` values as README sections (for example "Layers 3–5" for mw95). The author edits the manifest; this review does not rewrite recorded entries.

Scope of this review: `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md` (1300 lines, eight layers, 51 targets), `Suggested.lean` (87 lines: three definitions, two theorems), `metadata.toml`, `sources.toml` and the `gaps` of `design/plan.json`. No earlier review exists. The mathematics of the stated targets checks out on every instance computed below; the blocking findings concern ownership (seven unowned plan gaps, a nonexistent cited roadmap), one drifted supplier citation, a silent overlap with Part I, and the Lean acceptance file (one statable headline missing, one intermediate lemma stated as a headline). 14 findings, 10 blocking (5 P1, 5 P2), 4 P3.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean`, run from the content checkout: success, two warnings, both "declaration uses `sorry`" (lines 62, 73), nothing else. No `set_option`, no `lemma`, a single `import Mathlib`, no sorry'd data, docstrings on every declaration, namespace and section comment present.

**Binder check.** A scratch file with `#check @regularOrderDiscriminant`, `@regularNormCoordinates`, `@divisionNormBody`, `@division_norm_body_lower_bound` and `@class_index_bound` elaborated. Every elaborated type matches its README statement and no binder was lost. A scratch `rfl` confirmed that the `Subring` acts on `D` by left multiplication, as §3.5 intends. No change.

**Padding probes.** `simp`, `positivity`, `norm_num [divisionNormBody]` and `aesop` were run on copies of both theorems; none closes either goal.

**Statability probe.** The R07 statement elaborates at the pins.

**Lean statement checks by hand.**
- `regularOrderDiscriminant` on ℤ[2i] with basis (1, 2i): the traces of left multiplication are 2, 0 and −8, the Gram determinant is −16, and |−16|^{1/2} = 4 ≥ 2, the least free index in ℤ[i].
- `divisionNormBody` for ℚ with basis 2: √|det(tr 4)| = 2, the region |2x|<1 has length 1, so p = 2 = 2¹.
- The sSup in `divisionNormBody` is over a nonempty set bounded by Minkowski, so the junk value 0 never occurs for a division algebra.

**Depcheck output** (verbatim):

    moved: FaltingsFinitenessAndIsogenyTheoremsPartII moved in the merge order from #47 to #228, right after its last supplier AutomorphicBundles (ArithmeticGaloisRepresentations, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 38 roadmaps, 376 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. The only consumer that cites this roadmap, ComplexMultiplicationAndExplicitReciprocityPartII (board design), sits later in the order (#230).

**Library declarations opened at the pins.**
- Mathlib:
  - `Matrix.frobenius_norm_mul` (`Analysis/Matrix/Normed.lean`, line 657)
  - `Algebra.discr` (`RingTheory/Discriminant.lean`, line 67; commutative only, as the README says)
  - `Algebra.trace` (`RingTheory/Trace/Defs.lean`, line 70; commutative only, so the noncommutative regular discriminant is new)
  - `isSemisimpleRing_iff_pi_matrix_divisionRing` (`RingTheory/SimpleModule/WedderburnArtin.lean`, line 244)
  - `LinearMap.mulLeft` (`Algebra/Module/LinearMap/Defs.lean`, line 1018)
  - the Minkowski declaration of R05
  - `NumberField.absLogHeight₁` (line 145)
- Tau Ceti:
  - `AbelianVariety` (`AlgebraicGeometry/AbelianVariety/Basic.lean`, line 95)
  - `AbelianVariety.End` (`End/Basic.lean`, line 83)
  - `IsIsogeny` (`Isogeny.lean`, line 61; finite and surjective)
  - `ZLattice.covolume_sq_eq_det_gram` (`Algebra/Module/ZLattice/Covolume.lean`, line 42)
  - `Subalgebra.centralizer_centralizer_of_isSemisimpleModule` (line 260) and `AlgHom.centralizer_centralizer_range` (`RingTheory/Semisimple/DoubleCentralizer.lean`, line 293). Both are stated over a commutative ring, more general than the README's "field": correct as used.
  - `zHat.ringEquivPiPadicInt` (line 162), its continuity theorems (lines 182, 187) and `tendsto_sum_idem` (line 320)
  - `IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` (line 114; needs `CompactSpace`, which the README keeps as a hypothesis)
  - `TauCeti.Isogeny` and its `degree`
  - the number-field order discriminant (`NumberTheory/NumberField/Global/Orders/Discriminant.lean`; commutative only)
- No pinned object is restated. A grep for class index, Jordan–Zassenhaus, reduced or regular trace and order discriminant finds nothing in Mathlib or Tau Ceti.

**Cross-roadmap citations resolved (34 sections).**
- AbelianSchemesAndArithmeticModuli (#849 head): A3.3, A3.4, A3.5, A3.9, A4.1, A5.1–A5.4, A6.1, A6.4–A6.8, A6.10–A6.14, A6.20, A6.22, A6.25, A6.31. Present and saying what is used. A5.2's Gaussian check E(i,1)=1 agrees with this README's convention.
- ArakelovGeometryAndAbelianHeights (#1000 head): §§1.1–1.6, 2.7, 3.4, 3.5, 4.4 (½ log d), 5.7, 5.8, 5.9 (h(j)/12 + 3), 6.1, 6.2 (both multipliers 8), 6.5. Present.
- GeometryOfNumbersAndQuadraticArithmetic (#851): §§0.1–0.3, 1.2, 1.5 present; §1.1 is drifted (R05).
- On main:
  - IntegralLattices Layers 0–1
  - SemisimpleAlgebras (under RepresentationTheory) Layers 2, 3, 6
  - QuadraticFormInvariants 7B milestones 2, 3, 5
  - ClassFieldTheory Layer 10
- AutomorphicBundles (#1069): B4.2, B4.9, B5.13.
- FaltingsFinitenessAndIsogenyTheorems (#1004): R28.4.5, R28.4.6 (R28.6.6–R28.6.7 uncited, R06).
- ArithmeticGaloisRepresentations (#856): §§5.8, 6.4a, 7.6.
- NeronModelsAndSemistableAbelianVarieties (#852): §6.0.
- InverseGaloisAndArithmeticFundamentalGroups (#850): IG.2.4, IG.2.6.
- AbelianSchemesAndArithmeticModuliPartII (#1405): exists.
- OpenImageTheoremsForAbelianVarieties: exists nowhere (R01).

**Ownership against open work.** The objects were searched (roadmaps grep on main and on all 342 open heads, and the board packages): class index, Rosati discriminant, period theorem, Masser–Wüstholz and Gaudron–Rémond estimates, uniform integral Tate, elliptic isogeny bounds, Tate over finitely generated fields. The only overlap is Part I R28.6.6–R28.6.7 (R06). No `Suggested.lean` name collides with another roadmap's.

**Declared supplier gaps.**
- `cyclic-maximal-subfield` (ClassFieldTheory Layer 10): precise, minimal (SemisimpleAlgebras Layer 6 gives maximal subfields, not cyclic ones), statable there, declared under the same slug in both files.
- `fixed-siegel-cusp-family` (AutomorphicBundles): precise, consistent with mz20 lines 942–957, statable there.
- `hom-specialization-saturation`: R11.
- `hermitian-maximal-slope`: R10.

**Sources: the seeded sample, all 15 verified at their locators.**
1. §1.4: mw94-preprint Lemma 2.2, line 138, internal p. 3.
2. §1.7: mz20 (22), line 788, p. 653, and the Gram determinant, line 886, p. 655. The README's realification fixes the source's factor of two (Source issues).
3. §1.8: mz20 Lemma 4.1, line 817, pp. 653–655; the hypotheses (23) and |x_ij| ≤ δ⁻¹ match.
4. §2.1: mw94-preprint (4.1), lines 229–234, internal p. 6.
5. §2.9: mw94-preprint Corollary, line 58, and §6, lines 409–464; d enters through (6.4).
6. §3.5: mw95, Class Index Lemma line 164 (p. 8), Lemma 2.1 line 189 (p. 9), Lemma 2.2 line 215 (p. 10), (2.6) line 234, (3.11) line 344 (p. 14).
7. §4.1: mw95, definition at lines 392–405, p. 15.
8. §4.4: mw95 Lemma 4.1, line 364, p. 14, with the bound (i_e)^{2ne}.
9. §5.4: mw95 Lemma 7.2, line 644, p. 22, and the deduction on p. 23. |GL₂(𝔽₃)|² = 2304.
10. §6.1: gr14 Theorem 7.5, line 1813, p. 385 (locator slip in R13).
11. §6.3: gr14 Theorem 1.4, line 177, p. 347; Definition 4.1, line 695, p. 360; x(B), line 729; Proposition 6.9, line 1609, p. 380. The README's constants C and 2 dominate 1778 and 1.61.
12. §7.2: ry25 lines 492–497, p. 261 (the Deligne locator is in R13).
13. §7.5: ry25 lines 548–560, p. 262: M′ is the M of the refinements' Theorem 1 at degree d·[K:ℚ], semisimplicity is from Theorem 2, the End equality from Corollary 1.
14. §8.4: ry25 Proposition 4.8 proof, lines 620–674, pp. 264–265.
15. §8.5: ry25 Theorem 4.7, line 456, p. 260, and the refinement, lines 601–607 and 652.

Also checked:
- mw95 Theorems I–II and the final constants remark (lines 688–695), which justifies C_g max(1,D,h)^κ_g in §§4.5–5.5.
- mw95 Lemmas 3.3, 4.2, 5.1, 5.2, 6.1–6.3 and 7.1.
- mz20 Lemmas 2.2, 4.2, 4.3 and 4.4.
- ts18 Theorem 2.3 (line 154, pp. 382–383).
- bost95 Theorem 2.2 (line 151, pp. 119–120).
- deligne84 Théorème 2.7 (line 534, p. 39).
- noot95 Proposition 1.3 and Corollary 1.5 (lines 130, 164).
- The waived sources against the secondary accounts:
  - The mw93-periods main theorem, as used in §2.2, agrees with bost95 Theorem 2.2, gr14 lines 63–68 and mw93-isog-preprint Lemma 4.1 (line 205).
  - Its Lemmas 8.4, 8.6 and (7.4), as used in §2.4, agree with mz20 lines 942–957.
  - Its matrix-height input agrees with mw93-isog-preprint lines 232–245.
  - mw95-refine, as used in §7.5, agrees with ry25 lines 483–560.
  - No inconsistency was found.

## Adversarial pass

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| Conv: traces | Tr_A(1), tr_B(1); ℤ[i]; ℤ on non-CM E | 2g; dim B; disc −4 vs D_λ 4; 1 vs 2 | holds | none |
| Conv: κP=Pρ, signs | E=ℂ/(ℤ+iℤ), v=i | a=0,b=1,c=−1,d=0; κ=i; κP=(i,−1)=Pρ | holds | none |
| Conv: q complex form | v=1, v=i at τ=i; [−1] | 2 Re(1)=2; 2 Re(i·(−i))=2; √(2g) | holds | none |
| Conv: degree normalisation | B=0; δ map-degree | Δ_L(0)=1; χ=√δ (A5.4: deg λ=d², h⁰=d) | holds | none |
| Conv: index 0 = infinite | Lean `index ≠ 0` | excluded explicitly in `class_index_bound` | holds | none |
| 1.1 representations | [n]; [−2]; i on Gaussian; g=0 | nI; −2P both sides; [[0,−1],[1,0]]; empty | holds | none |
| 1.2 Rosati length | g=1 v=1; [r]; v=0, g=0 | √2; √(2g)\|r\|; 0 | holds | none |
| 1.3 Rosati discriminant | ℤ; ℤ[i]; ℤ[2i]; M₂(ℤ); rank 0 | 2; 4; 16=2²·4; 16; 1 | holds | none |
| 1.4 submultiplicativity | [2][3] on E; shear S² | 72 ≤ 144; 12 ≤ 36 | holds | none |
| 1.5 degree = det ρ | [−2] on E; diag(1,0) on E²; g=0 | 4=4; 0=0; 1=1 | holds | none |
| 1.6 degree inequality | [n] on E; [−2] on E²; shear N=1 | n² = n²; 16 ≤ 16; 1 ≤ 2.25 | holds | none |
| 1.7 coordinate trace | v=1 g=1; v=i τ=i | 2=2; rational 2, complex 2 (no bar −2, no 2Re 1) | holds | none |
| 1.8 weak Siegel bounds | τ=2i, κ=2i | (a,b,c,d)=(0,4,−1,0), ℓ=√8: 4 ≤ 2√8·C, 1 ≤ C√8/2 | holds for C ≥ 0.71 | none |
| 2.1 minimal period subvariety | ω=0; (η,0); (η,η) in E² | 0, Δ=1; E×0, Δ=1; diagonal, Δ=2 | holds | none |
| 2.2 period theorem | ω=0; simple A | Δ=1 ≤ C·1; Δ(A)=1 | holds (C ≥ 1) | R12 (generality) |
| 2.3 short period bases | B=0; (1,1),(1,−1) | empty basis; det −2, index 2 | holds | R02 |
| 2.4 cusp value bound | \|u\|=e⁻²; family rescaled by e⁻ᴺ | 2; N+2 | holds | R02 |
| 2.5 imaginary-part bound | τ=it vs 100+it | same y, same conclusion | holds | R02 |
| 2.6 spanning set | End_k(E)=ℤ; (1,1),(1,−1) | q(1)=2; ℚ-span ℚ², index 2 | holds | none |
| 2.7 End discriminant | non-CM E; Gaussian E | D_λ 2; 4 | holds | none |
| 2.8 off-diagonal isogeny | A=B=E, swap | q=4, ℓ=2 ≤ C·√16 | holds | none |
| 2.9 polarized isogeny | A=B; [2] | identity deg 1; height gap 0 ≤ log 2 | holds | none |
| 3.1 regular discriminant | ℤ; ℤ[i]; ℤ[2i]; Lipschitz | 1; −4; −16=2²(−4); −256 | holds | none |
| 3.1 nondegeneracy | ℤ[x]/(x²) (not semisimple) | Gram [[2,0],[0,0]], det 0 | excluded by hypothesis | none |
| 3.2 class index | ℤ; ℤ[i]; ℤ[2i] on ℤ[i]; e=0 | 1; 1; min 2N(α)=2; 1 | holds | R13 (locator) |
| 3.3 norm body | ℚ basis 1 and 2; ℚ(i); Hamilton | 2; 2·1=2; 2π; 16·π²/2=8π² | holds | none |
| 3.4 p(D) ≥ 2^m | same | 2≥2; 6.28≥4; 78.96≥16 | holds | R08 (Lean) |
| 3.5 class index bound | ℤ[2i] e=1; ℤ e=2; ℤ[√−5], M=(2,1+√−5); Lipschitz in Hurwitz | 2≤4; 1≤1; 2≤√20; 2≤16 | holds | none |
| 3.6 trace comparison | non-CM E; Gaussian E; E² | 2=2; 16=16; 4096=4096 | holds | none |
| 4.1 cross-discriminant | End ℤ; ℤ[i]; 2ℤ×3ℤ; sign flip | 1; 16; 36; 36 | holds | none |
| 4.2 product discriminants | M₂(ℤ); M₄(ℤ); M₂(ℤ[i]) | −16 (direct); 2³² (=4¹⁶); 2¹⁶ | holds | none |
| 4.3 cross-disc isogeny | A=B non-CM; A=B Gaussian | 1 ≤ 1; 1 ≤ 16 | holds | none |
| 4.4 stable power | diagonal E ⊂ Eᴺ | degree 1 ≤ 1, N-free | holds | none |
| 4.5 polarization-free | non-CM E | \|disc\|=1, c(Hom(Ê,E),Hom(E,Ê))=1 | holds | none |
| 4.6 subvariety bound | diagonal A ⊂ A⁸ | degree 1 | holds | none |
| 4.7 product–dual isogeny | E×E′ | 1·1=1 | holds | none |
| 5.1 product target | A=A*=E | degree 1 | holds | none |
| 5.2 factorization | A simple; E² | N=1; product identity | holds | R12 |
| 5.3 unpolarized | [2] on E; general | dual degree 4=4^{2g−1}; N^{2g}=N·N^{2g−1} | holds | none |
| 5.4 relative field | k=ℚ, K=ℚ̄, g=1 | [k:ℚ]=1; 48²=2304 | holds | none |
| 5.5 geometric | non-CM E and twist | geometric degree 1, rational Hom 0 | holds | none |
| 6.1 non-CM graph | E₁=E₂, same bases | \|G_ω ∩ 0²×E²\| = 1 = N | holds | R06, R13 |
| 6.2 CM graph | Gaussian, ω=(1,1) | diagonal; N₁N₂ = 1 | holds | R13 |
| 6.3 definitions | Gaussian E², L₀; diagonal B | d=2, Δ=1, d(B)=2, δ=1/√2, ρ=1, x·δ²=½ ≤ 1 | holds | none |
| 6.3 sharp estimate | L₀^a, a=10⁵ | x=5·10⁻⁶ (diagonal 10⁻⁵, B=0 7.07·10⁻⁶); δ⁻²=10⁻⁵ ≤ 5.1·10⁻³ | holds | R02, R10 |
| 6.3 quadratic bound | D=1, E₁=E₂ | 1 ≤ C | holds (C ≥ 1) | none |
| 6.4 j-height bound | j=0, D=1; D=2 | C; 4C(log 2)² ≈ 1.92C | holds | R07 |
| 7.1 B(V) | Ẑ², V={1}; GL₂(Ẑ); rank 1 | Ẑ·I, infinite index; e₁₂, e₁₁ generate M₂(Ẑ); Ẑ | holds | none |
| 7.2 product comparison | local indices 2 and 3 | 6; the coset argument checked: B(U′)=Σc_jB(W) is compact | holds | R13 (Deligne) |
| 7.3 centralizer reduction | ψ(x)=2x; ψ=0 | M_A=2: dims mod 2 are 0 vs 1, mod 3 0 vs 0; M_A=1 | holds (ℓ∤M_A is sharp) | R06 |
| 7.4 fixed prime | ℤ₂, d=5 | subgroups of index 1, 2, 4: 3 = 1+⌊log₂5⌋ | holds | none |
| 7.5 residual refinement | trivial image on (ℤ/2)² | commutant dim 4 vs End rank 1 | threshold needed | R02 |
| 7.6 large prime | scalar End, full GL₂(𝔽_ℓ) | generated dim 4 = centralizer | holds | R06 |
| 7.7 uniform bound | local bounds 4, 9 | 36 | holds | R06 |
| 8.1 finitely generated Tate | constant non-CM E/ℚ(t) | rank 1 both sides at ℓ=2,3 | holds as statement | R03 |
| 8.2 specialization | 2ℤ ⊂ ℤ | equal after ⊗ℤ₃, cokernel ℤ/2 | saturation needed | R11 |
| 8.3 supported image | diagonal {±1} at 2 primes; {±I} at odd p | supported parts trivial, W=1; identity component {I} | holds | none |
| 8.4 supported bound | V={1}, index-2 W′ | 1 ≤ 2 | holds | none |
| 8.5 finitely generated bound | W=2ℤ, U′=3ℤ | [W:6ℤ]=3 ≤ [ℤ:3ℤ]=3 | holds | none |
| Consumer checks | SL₂(𝔽₉), SL₂(𝔽₃); f(ε,z)=(1+ε)(z−1) | 720, 24; f(1,−1)=−4, zero set ½ | arithmetic right, object foreign | R01 |

## Not verifiable

- mw93-periods (waived, no legal free copy): the Lemma 8.4, 8.6 and 9.6 and (7.4) numbering could not be checked against the printed Annals text. The isogeny preprint cites an ETH preprint of it, whose numbering may differ from the published one. Checked only for consistency with the secondary accounts listed above.
- mw95-refine (waived): Theorems 1–2 and Corollary 1 checked only through ry25's account.
- igusa Lemma 20 (uncertified, paywalled): the weak-region decay is checked only through mz20 lines 953–957.
- fw84 Chapter VI §3 (uncertified, paywalled): only through noot95 line 172.
- Several display formulas in the mw95 OCR are garbled: the Class Index Lemma display (line 166) and the Lemmas 3.1–3.2 displays. The bound |d|^{e/2} was reconstructed from Lemma 2.1, Lemma 2.2 and (2.6) (lines 189–234), and it agrees with the README.
- Three Tau Ceti modules have no object file on this worker (ZHat Decomposition, TopologicallyFinitelyGenerated, ZLattice Covolume). Their declarations were checked in the pinned source text, not by `#check`. `Suggested.lean` imports none of them.

## Source issues

- **Error** in mw95 at §2, p. 8: the source says the rational algebra of any order (a unital ring free of finite rank) is separable; it should restrict to semisimple algebras, since ℤ[x]/(x²) has regular discriminant 0; affects nothing.
- **Misprint** in mw95 at §2, p. 8, definition of the class index: the source quantifies over torsion-free modules of given rank; it should require finite generation (ℤ[1/2] over ℤ has no free sublattice of finite index); affects nothing.
- **Misprint** in mz20 at (22), p. 653, and at the Rosati discriminant display, p. 655: the source equates the conjugate-transpose complex trace with the rational trace, but the complex one is half; it should be twice the real part of the complex trace; affects nothing.
- **Gap** in ry25 at the proof of Theorem 4.7, p. 261: the source refers the product formula for the algebra generated by an open subgroup to Deligne's Théorème 2.7, which concerns only the full Galois image; it should be argued directly (closed submodules and prime idempotents); affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ddef4f3", "job": "REV-PKG-FaltingsFinitenessAndIsogenyTheoremsPartII", "model": "opus", "worker": "fable-rev73"} -->
