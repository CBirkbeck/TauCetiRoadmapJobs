# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #1754 at 7db093c)

**Verdict:** needs changes

This is an incremental re-review of the 105 lines that changed since eaed48f. All three previous findings are repaired. There are five findings, all P3. Two of them are gate failures (`tex=2` and `statement-hygiene=2`), so the gate fails at this head. The mathematics of the two new headlines checks out: Kleiman's criterion for real classes, and Murre–Oort representability on the pinned Picard fppf sheaf. Every computed instance agrees on both sides, the dependency check is clean, and all 16 sorried theorems survive the one-tactic probe.

## R01 (P3) — Gate `tex`: `O_{X,x}` outside code spans in the new §3.3 text

Location: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md`.
- Line 726: "A family of global sections generates M iff its germs generate the O_{X,x}-module M_x at every point x".
- Line 740: "a submodule of the free rank-one O_{X,x}-module L_x is everything iff it is not contained in m_x·L_x".

Claim: the README writes mathematics in Unicode, with TeX-like subscripts only inside code spans.

Witness: on this head, the gate reports `tex: line 726` and `tex: line 740` under the rule "no TeX-only syntax (`_{`, …) outside code spans". The run ended with `FAIL`.

Repair: write the local ring as a code span in both places: "the `O_{X,x}`-module M_x" (line 726) and "the free rank-one `O_{X,x}`-module L_x" (line 740). Tested: the tex rule exempts code spans. The same file already writes `deg_κ(L^{-1})` (line 103) and `L^{⊗m}` (line 411) that way without a hit.

## R02 (P3) — Gate `statement-hygiene`: `letI` in the signature of the real-class Kleiman theorem

Location: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` lines 162 and 170: "letI : C.Over (Spec (CommRingCat.of k)) := ⟨i ≫ x⟩", inside both sides of the `↔` of `exists_isAmple_realCombination_iff_exists_pos_nef_sub`.

Claim: a theorem's statement carries no `letI`/`haveI`.

Witness: on this head, the gate reports `statement-hygiene: line 162` and `line 170`, each with "P3 `letI` in the signature of theorem `exists_isAmple_realCombination_iff_exists_pos_nef_sub`". The previous round removed this defect by deleting a theorem, and the new theorem brings it back. (The same `letI` in the bodies of the definitions `NumericallyTrivial` and `IsNef` is allowed and is not flagged.)

Repair: on each side, give the curve its structure over `k` through an instance binder tied to `i ≫ x`. The `Over` structure is determined by its morphism, so the statement is unchanged:

```lean
      ∀ (C : Scheme.{u}) [IsIntegral C] [C.Over (Spec (CommRingCat.of k))] (i : C ⟶ X),
        IsClosedImmersion i → C ↘ Spec (CommRingCat.of k) = i ≫ x →
          topologicalKrullDim C = 1 →
          ∑ l, t l * (TauCeti.AlgebraicGeometry.LineBundleClass.intersectionNumber k i (a l) : ℝ) = …
```

Make the same change on the right-hand side. Tested: a scratch copy of the theorem with both sides rewritten this way elaborates from the worktree with `sorry` as the only warning. Its `#check` shows the binders `[IsIntegral C] [C.Over (Spec ↧k)]` and the hypothesis `C ↘ Spec ↧k = i ≫ x` on both sides.

## R03 (P3) — The new Lean statement asserts separatedness, but the cited pages do not prove it

Location: `Suggested.lean` lines 208–209 ("Murre–Oort (Kleiman, Corollary 4.18.3): … is represented by a separated `k`-scheme locally of finite type"), and README §2.1, line 450 ("a separated commutative k-group scheme locally of finite type … (KLE05, Corollary 4.18.3 and the following paragraphs, pp. 34–35; Proposition 4.17, p. 33").

Claim: Corollary 4.18.3, the paragraphs after it, and Proposition 4.17 give the separatedness that `picardFppfSheaf_representable` asserts with `IsSeparated P.hom`.

Witness:
- KLE05 lines 1630–1632 (Cor. 4.18.3, p. 34): existence, representation of the fppf functor, and a disjoint union of open quasi-projective subschemes.
- KLE05 lines 1578–1579 (Prop. 4.17): locally of finite type.
- Pages 34–35 (lines 1599–1742) never mention separatedness.
- Separatedness is Proposition 5.3, p. 37, at KLE05 line 1782.

Repair: add "Proposition 5.3, p. 37; KLE05 line 1782" for separatedness to the §2.1 locator and to the Lean docstring (for example "Kleiman, Corollary 4.18.3, Proposition 4.17 and Proposition 5.3"). Add "Proposition 5.3 (p. 37)" to the KLE05 locator in `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml` (line 29). Tested: line 1782 lies after the page-37 marker at line 1743. It assumes exactly the representability that Corollary 4.18.3 gives for proper X over k.

## R04 (P3) — The new global-generation bullet restates a pinned Tau Ceti lemma without citing it

Location: README §3.3, line 726: "A family of global sections generates M iff its germs generate the O_{X,x}-module M_x at every point x (STACKS, Definition 17.4.1 and Lemma 17.4.2, tags 01AM and 01AN)". The From Tau Ceti contract (line 39) adds the nonvanishing-locus lemmas but not this one.

Claim: what the pins already state is cited, not restated.

Witness: pinned Tau Ceti (2fd255d9), `TauCeti/Algebra/Category/ModuleCat/Sheaf/Stalk.lean` line 154: `SheafOfModules.GeneratingSections.span_germ_eq_top`. If finitely many sections generate `M` over a neighbourhood `U` of `x`, their germs span the stalk at `x`. That is the forward direction of the bullet for finite families.

Repair: in the bullet and in the From Tau Ceti paragraph of line 39, cite `SheafOfModules.GeneratingSections.span_germ_eq_top` (`TauCeti/Algebra/Category/ModuleCat/Sheaf/Stalk.lean`) as the forward direction for finite generating families. Keep STACKS 01AN for the converse and for arbitrary families, and add the lemma to the §3.3 *Needs:* line. Tested: the lemma's hypothesis `[Finite G.I]` is met by the finite families that the bullet's last sentence produces on a quasi-compact X.

## R05 (P3) — The manifest's locators lag behind this head's citations

Location: `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml`:
- line 238: PS12 `locator = "Proposition 1.2, p. 3, …"`.
- line 256: LAZ04 locator.
- line 186: STACKS `locator = "0AYW; 0BEL; …; 0CZX (section only)"`, with `cited_for` at line 194.

Claim: the manifest records every cited work with its locators and the sections it is cited for.

Witness:
- PS12: README lines 333 and 1217 now say "p. 2", because the previous round's page repair (PS12 line 98 lies before the page-3 marker at line 117). The manifest still says p. 3.
- LAZ04: README line 406 adds "Definition 1.3.11 and Proposition 1.3.13, pp. 48–49", which are absent from line 256.
- STACKS: README cites tags 0A26 and 0B8X (line 172, §0.4), 01AM and 01AN (line 726, §3.3), 0335 (line 172) and 031T (line 214, §0.7). None of these is in the STACKS locator, and `cited_for` lacks 0.4, 0.7, 1.7 and 3.3. (0D2P and 0D3A are cited in §1.7.)

Repair:
- PS12: write "p. 2".
- LAZ04: append "Definition 1.3.11; Proposition 1.3.13 (pp. 48–49)".
- STACKS: append "0335; 031T; 0A26; 0B8X; 01AM; 01AN" to the locator, add "0.4", "0.7", "1.7", "3.3" to `cited_for`, and add a `chapter_texts` entry for the Modules chapter (`modules.pdf`, tags 01AM and 01AN).
- KLE05: the Proposition 5.3 locator of R03.

Tested: 0A26 and 0B8X are in the manifest's own Varieties text (STACKS lines 4253–4254 and 2130–2133). 01AM and 01AN are at lines 192 and 203 of the cached Modules chapter.

## Previous findings

- R01 — repaired: `Suggested.lean` line 214, "theorem picardFppfSheaf_representable … ∃ P : Over (Spec (CommRingCat.of k)), IsSeparated P.hom ∧ LocallyOfFiniteType P.hom ∧ Nonempty (… RepresentableBy P)". README line 450 names it, and docstring lines 16–18 now name only the torsion component as lacking a carrier.
- R02 — repaired: `sources.toml` line 279, id "KLE66", doi "10.2307/1970447", locator "Theorem III.1; Theorem IV.1", status "uncertified", cited_for ["1.7"].
- R03 — repaired: README line 333 "PS12, Proposition 1.2, p. 2, PS12 line 98", line 1124 "pp. 28 and 111", line 1217 "p. 2". The manifest's PS12 locator still says p. 3 (folded into R05).

## Verified sound

**Gate, dependencies, build.**
- Gate re-run on this head: `set_option=0 blob=0 latex=0 tex=2 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=2 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The four hits are R01 and R02.
- Dependency check: `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Merge order: this roadmap is at line 263. Its suppliers still in open pull requests are earlier: ResolutionOfSingularitiesCharacteristicZero (19), AlgebraicModuliForArithmeticGeometry (36), ComplexComparisonPartII (43). EtaleCohomologyFoundations (57) is also earlier. JacobianChallenge (2), SchemeAndStackFoundations, StableReduction and AlgebraicVectorBundles are on main (65930ba). The diff touches no supplier citation.
- Files: nothing changed outside the folder. The folder holds README.md, Suggested.lean and metadata.toml.
- Elaboration: `lake env lean` on Suggested.lean gives 16 `declaration uses sorry` warnings and nothing else (lines 93, 106, 128, 137, 153, 200, 214, 248, 273, 295, 328, 366, 383, 403, 425, 445), in 8 s.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9. The new import `TauCeti.AlgebraicGeometry.PicardFunctor.Fppf` exists and has a built object file.

**Signatures.**
- I ran `#check @` in a scratch copy on `exists_isAmple_realCombination_iff_exists_pos_nef_sub`, `picardFppfSheaf_representable`, `isAmple_iff_exists_isNef_pow_mul_inv_pow` and `IsNef`. I compared the other 23 declarations against the worker's elaborated signatures.
- The file has 27 declarations (11 definitions, 16 theorems). The worker's 28th entry, "`,` (theorem, line 400)", is a parsing artifact of the word "theorem," inside a docstring.
- No section `variable` exists, so no declaration can lose one.
- The two new theorems carry `IsProper x`, `hh : h.IsAmple`, `[Fintype ι]` and the nonempty index `Fin (n + 1)` in their own types, matching README (v) at line 399 and §2.1 at line 450.
- Universes check out: `relativePicardFppfSheaf` takes values in `AddCommGrpCat.{u + 1}` (`PicardFunctor/Fppf.lean` line 104). Mathlib's `Functor.RepresentableBy` (`CategoryTheory/Yoneda.lean` line 282) takes `F : Cᵒᵖ ⥤ Type v` with `v` independent of the category's Hom universe, so the `Type u`-to-`Type (u+1)` bijection is well formed.

**One-tactic probe.** I replaced each `sorry` in a scratch copy with `first | rfl | simp | infer_instance | (intros; simp_all) | trivial | exact ⟨⟩ | (constructor <;> intro <;> simp_all) | exact ⟨_, rfl⟩`. All 16 theorems fail (errors at each of the 16 proof sites, no sorry left), so neither new theorem is padding.

**Headlines.** The Summary's end theorems are in the Lean file:
- positive-power constancy (line 248);
- projective contraction descent (328);
- fibre-graph descent (383);
- DVR lifting (425);
- Murre–Oort, now stated (214).

The docstring names the ones that are not statable, with the carrier each lacks: intersection-label descent, cone comparison over a DVR, Cascini–Tanaka vertical descent, the AHK rank, finite type of Pic^τ, and the closed-cone forms of the ample and nef cones. The new real-class theorem states Amp = int(Nef) in curve-degree form. With an ample h in the interior, α ∈ int(Nef) iff α − εh is nef for some ε > 0, so this is the theorem itself rather than a weakened stand-in, and the docstring says so (lines 23–25).

**Seeded sample, where this head touches it.**
- 1.4: the PS12 page marker at line 47 precedes Proposition 1.2 at line 98 (page 3 starts at line 117), so p. 2 is right.
- 1.5: BMP23 lines 819–822 (p. 18: curves over Z, N₁, f-nef ℝ-Cartier divisors) and WIT22 lines 317–323 (p. 7: relatively nef, base point free, semiample) support the definitions. The new bullet's perfect-residue-field clause follows from §0.4's new bullet.
- 2.1: KLE05 lines 1630–1632 (Cor. 4.18.3, p. 34), 1578–1579 (Prop. 4.17, p. 33) and 1650–1652 (Murre, p. 35); separatedness is at line 1782 (R03).
- 5.7: BMP23 Lemma 2.54 and its proof's CT20 citation are at lines 1222–1230, after the page-28 marker at line 1219. Lemma 9.25 is at line 4998, after the page-111 marker at line 4983.

The other eleven sampled targets (0.6, 2.2, 2.6, 2.12, 3.4, 4.3, 4.4, 4.5, 5.3, 5.4, 5.6) are untouched by the diff, so under the incremental scope they were not re-read this round. The previous report read the locators of 0.6, 2.2, 5.3 and 5.4.

**New locators read this round.**
- STACKS Varieties 4253–4254 (0A26, Lemma 33.43.4: a proper scheme of dimension ≤ 1 over a field is H-projective).
- STACKS Varieties 2130–2133 (0B8X, Lemma 33.25.8: over a perfect field, the smooth points of a reduced locally algebraic scheme are its regular points).
- STACKS Modules 192–199 (01AM, Definition 17.4.1) and 203–205 (01AN, Lemma 17.4.2: sections generate iff their germs generate every stalk).

All support the README sentences at lines 172 and 726.

**Library declarations opened at the pins (file and line).**
- Tau Ceti:
  - `SchemeWeilDivisor.exists_nonempty_iso_sheaf` (`WeilDivisor/Scheme/Picard.lean` 222: Noetherian integral, DVR codimension-one stalks, dimension ≤ 1);
  - `InvertibleSheaf.eulerDegree_eq_relativeDegree` (`WeilDivisor/Scheme/EulerCharacteristic.lean` 303: proper integral curve with finite-dimensional H¹(O));
  - `AlgebraicGeometry.Scheme.Modules.mem_nonvanishingLocus_iff` (`LineBundle/NonvanishingLocus.lean` 104, namespace at line 61, `Iff.rfl` with the germ spanning the stalk);
  - `mem_nonvanishingLocus_of_app_ne_zero` (`LineBundle/GlobalGeneration.lean` 96, namespace `TauCeti.AlgebraicGeometry`);
  - `InvertibleSheaf.IsGloballyGenerated` (`GlobalGeneration.lean` 139: every point is in the nonvanishing locus of a global section);
  - `relativePicardFppfSheaf` (`PicardFunctor/Fppf.lean` 104, which asserts no representability);
  - `SheafOfModules.GeneratingSections.span_germ_eq_top` (`Sheaf/Stalk.lean` 154, R04);
  - `LineBundleClass.intersectionNumber` (`IntersectionNumber/Basic.lean` 111, with the instance `[C.Over (Spec (.of k))]` that R02's binder supplies).
- Mathlib: `Scheme.fppfTopology` (`Sites/Fpqc.lean` 54) and `Functor.RepresentableBy` (`Yoneda.lean` 282).

Every name the diff adds to the supplier contracts (README lines 37 and 39) exists with the hypotheses stated there.

**Ownership against open work.**
- The scope sentence at line 10 no longer mentions AbundanceStatement and claims the general statements of §§0.7, 1.1–1.5, 1.7 and 3.3. AbundanceStatement at #545 (open, not in the merge order) still plans the algebraically closed characteristic-zero projective case in its Layers 4A–4D and 5 (its README lines 224–358) and cites no other owner.
- AbundanceStatement is on the list of roadmaps never to be cited as suppliers, so this roadmap, at merge order 263, is the right owner. Settling the overlap means AbundanceStatement cites this roadmap, which is a repair to that pull request, not to this one.
- The pull-request description, which this review does not cover, still says the theory "extends … AbundanceStatement". That clause should go when the description is next regenerated.
- `roadmaps grep` over main and the 476 open heads: `picardFppfSheaf_representable`, `exists_isAmple_realCombination`, "ample ℝ-divisor/ℝ-Cartier", "regular rather than smooth" and "Kleiman's criterion" occur only here and, for the last, in AbundanceStatement.
- `relativePicardFppfSheaf` is also used by JacobianChallengePartII (#1225, `Suggested.lean` line 159: representability for proper smooth relative curves over an affine Noetherian base with an ample class), JacobianChallenge's revision (#1892) and ModularCurves (#1101, a `#check`). Neither Jacobian statement contains the arbitrary-proper-over-a-field theorem, and §2.1 does not contain theirs.
- StableReduction Layer 2 on main (README lines 405–466) lists global generation only as an API extension (line 438), without a pointwise criterion, so §3.3's new bullet duplicates nothing there.
- The overlaps tool reports no id dropped by an open pull request and no other pull request changing this folder.

**Principles and form.** No `set_option`, no sorry'd data, `theorem` only, and `import Mathlib` plus five existing `TauCeti.*` modules. The new prose of §§0.1, 0.4, 0.7, 1.5, 1.7(v), 2.1 and 3.3 is the author's own wording, and no source passage is copied. The README's generality equals the Lean's for both new declarations.

**Adversarial table.** Rows marked "r3" are carried from the previous report (eaed48f) for statements this diff leaves untouched. The other rows are computed at this head.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `exists_isAmple_realCombination_iff_exists_pos_nef_sub` | P¹_k, h = O(1): α = O(1); α = O(−1); ι = ∅ (α = 0) | α = O(1): LHS with s = (1), b = (O(1)) gives 1 = 1; RHS with ε = 1 gives 1 ≤ 1. α = O(−1): LHS needs −1 = Σ s_j d_j with d_j ≥ 1; RHS needs ε ≤ −1. α = 0: LHS needs 0 = Σ s_j d_j > 0; RHS needs ε ≤ 0 | true/true; false/false; false/false. With `Fin n` instead of `Fin (n + 1)` the empty combination would make 0 ∈ Amp: the nonempty index is needed and present | R02 (form only) |
| same | P¹×P¹, h = O(1,1), α = √2·O(1,0) + O(0,1); α = O(1,0) | Curves have degrees (c, d) ≥ 0 against (O(1,0), O(0,1)). First α: s = (√2−1, 2−√2), b = (O(2,1), O(1,1)) gives (√2−1)(2c+d) + (2−√2)(c+d) = √2c + d; RHS holds with ε = 1 and fails with ε = 1.01 at (0,1). O(1,0): degree 0 on (0,1), so LHS > 0 = 0 fails and RHS ε ≤ 0 fails | true/true; false/false | none |
| same | X = ∅ or X finite over k; double line V(x²) ⊂ P², α = t·h | No curves: LHS with b = 1 (ample on an affine scheme) and RHS with ε = 1 both hold. Double line: only curve X_red, (h·X_red) = 1, so LHS iff t > 0 and RHS iff some ε ∈ (0, t] exists, i.e. t > 0 | agree in every case; nonreduced X allowed | none |
| `picardFppfSheaf_representable` | P¹_k; X = ∅; Spec k[ε]/ε²; the line with doubled origin | ∐_{d∈ℤ} Spec k (separated, locally of finite type, not of finite type); the presheaf is 0, represented by Spec k; the kernel H¹(T, 1+εO_T) = 0 on affines gives Spec k; not separated, so excluded | statable and true; separatedness needs KLE05 Prop. 5.3 | R03 (locator) |
| §0.1 residue-weighted degree | P¹_ℝ with O(1), section with divisor ∞; O(2), section x² + y² | 1·[ℝ:ℝ] = 1 = χ(O(1)) − χ(O) = 2 − 1; 1·[ℂ:ℝ] = 2 = 3 − 1 | agrees with the convention of line 23 | none |
| §0.4 projective and smooth normalization; Check y² = x^p − t | nodal cubic over k; κ = F₃(t), f = y² − x³ + t at P = (y, x³ − t) | Normalization P¹_k is smooth and projective. ∂f/∂x = −3x² = 0 and ∂f/∂y = 2y = 0 at P, so P is not smooth; x³ − t = y² in O_P gives m_P = (y), a DVR. Away from P, ∂f/∂y ≠ 0 | regular, not smooth; 0A26 and 0B8X read | none |
| §0.7 ℚ-linear extension | quadric cone, D = ℓ, (r, A) = (2, H) and (4, 2H) | (H·ℓ′)/2 = 1/2; (2H·ℓ′)/4 = 1/2 | independent of the pair | none |
| §1.5 perfect-residue clause | S = Spec ℤ; S = 𝔸¹ over F_p(t) | residue fields F_p, perfect: smooth test curves suffice; closed points have residue fields finite over F_p(t), imperfect: regular form needed | matches §0.4 | none |
| §1.7(v) √2 Check | D = √2F₁ + F₂ on P¹×P¹ | (√2−1)(2,1) + (2−√2)(1,1) = (2√2−2+2−√2, √2−1+2−√2) = (√2, 1); D − ε(F₁+F₂) = (√2−ε, 1−ε) is nef iff ε ≤ 1 | correct | none |
| §1.7(v) quadric-cone and nonemptiness Checks | Q ⊂ P³, ℓ; P¹ with 0; X finite | 2ℓ = H ample, (ℓ·ℓ′) = 1/2 > 0; 0 − ε·1 < 0 for every ε > 0; Amp = {0} via 1·[O_X] | correct | none |
| §1.7(v) route, A + εN | ε = −2.5, m = −3 | ε/m = 5/6 > 0, 1 − 5/6 = 1/6 > 0; sum (1/6)A + (5/6)(A − 3N) = A − 2.5N | positive combination of amples | none |
| §3.3 pointwise criteria | O(1) on P¹ at [0:1]; O(−1); skyscraper k_p on P¹ | x has fibre value 0 and y has value 1; Γ = 0, so no point qualifies and the sheaf is not globally generated; Γ = k generates the stalk at p and the zero stalks elsewhere, so O → k_p is onto | correct | R01, R04 |
| `NumericallyTrivial` | r3: P¹_k with O(m); P¹_ℂ over ℝ with O(1); X = ∅ | deg = m; χ(O(1)) − χ(O) = 4 − 2 = 2; no curves | trivial iff m = 0; not trivial; trivial | none |
| `RelNumericallyTrivial` | r3: pr₁ on P¹×P¹ with O(a,b); f = id_S | fibre degree b; no curves | iff b = 0; every class | none |
| `numericalClassGroup_free_finite` | r3: ∅, P⁰, P¹, E×E | ranks 0, 0, 1, 2 + rank End(E) ∈ {3, 4, 6} | free of finite rank | none |
| `relNumericalClassGroup_free_finite` | r3: id_S; pr₁; S = Spec ∏_ℕ k | 0; ℤ; bounded integer sequences | Noetherian needed and present | none |
| `IsNef` | r3: P¹ with O(m); Bl_p P² with O(E); X finite | m ≥ 0; E·E = −1; vacuous | matches §1.5 | none |
| `isAmple_iff_exists_isNef_pow_mul_inv_pow` | r3: P¹×P¹, h = O(1,1); Bl_p P², h = 3H − E | O(2,1)·h⁻¹ = O(1,0) nef; O(m−n, −n) never nef; H − E nef with (H−E)·E = 1 | both directions agree | none |
| `isAmple_mul_of_mem_numericallyTrivialClasses` | r3: E with O(p) ⊗ O(q−p); Enriques H ⊗ ω | O(q) of degree 1, ample; same intersection numbers | holds | none |
| `IsRelAmple` | r3: pr₁ with O(a,b); id_S, S affine | ample on P¹×V iff b > 0; every class | matches line 397 | none |
| `IsRelNef` | r3: pr₁; id_S; generic point of Spec ℤ_p | b ≥ 0; vacuous; m ≥ 0 | all-points form agrees | none |
| `isRelAmple_iff_exists_isRelNef_pow_mul_inv_pow` | r3: pr₁, h = O(0,1); n = 0 control | O(ma, mb−n) f-nef iff mb ≥ n, solvable iff b > 0; n = 0 makes O f-nef | 0 < n needed and present | none |
| `isAmple_iff_isAmple_specialFibre` | r3: P¹_R with O(1) and O; Bl_x P¹_R | ample on both sides / neither; degree 0 on E on both | matches §5.4 | none |
| `HasTrivialNumericalGaloisAction` | r3: P¹_ℂ/ℝ; pointless conic; Spec K′ | swap of (1,0) and (0,1); g*O(1) ≅ O(1); Num = 0 | fails; holds; holds | none |
| `constantNumericalClasses_iff_positivePowerDescent` | r3: P¹; P¹_ℂ/ℝ; conic; d = 0 | d = 1; (d,0) never diagonal; image 2ℤ, d = 2; d = 0 vacuous | 0 < d needed | none |
| `numericallyTrivial_torsion_of_algebraic_finiteField` | r3: y² + y = x³ over F₂; y² = x³ − x over F₃; E/ℚ̄ | 3 points; 4 points; infinite order | algebraicity needed | none |
| `IsContraction` | r3: id; pr₁; 𝔸¹ → Spec k[t², t³]; P¹_ℂ → Spec ℝ | O ≅ f_*O; same; k[t] ≠ k[t², t³]; ℂ ≠ ℝ | last two excluded | none |
| `contraction_descends_purelyInseparable` | r3: K = k; perfect closure; ℂ/ℝ control | identity; Γ(U′, O) = Γ(U, O) ⊗ K; a component of P¹_ℂ ⊔ P¹_ℂ does not descend | inseparability needed | none |
| `IsProjectiveOver` | r3: Spec K with n = 0; 𝔸¹; V(T₀² + T₁²) ⊂ P¹_ℝ | Proj K[T₀] = Spec K; not proper; Spec ℂ over ℝ | each law excludes its wrong model | none |
| `contraction_descends_of_constantNumericalClasses` | r3: Spec K′, K′/k separable quadratic; P¹_ℂ/ℝ | Num = 0, descends; hypothesis fails | matches SCH23 | none |
| `componentGraph` | r3: P¹ ⊔ P¹; V(xy); ∅ | 2 vertices, 0 edges; 1 edge; empty | matches | none |
| `constantNumericalClasses_iff_componentGraphDescent` | r3: swap on P¹ ⊔ P¹; P¹_ℝ ⊔ Spec ℂ; P¹ over k[ε]/ε² | closure equation fails; 3 vertices over 2; one vertex, Num = ℤ | purity and closure equation needed | none |
| `fibreComponentGraph_descends_of_constantNumericalClasses` | r3: blow-up on a smooth fibre; conic bundle over P¹_ℝ | [[−1,1],[1,−1]]: −1 on (1,0), 0 on (1,1); two conjugate lines over one vertex | constancy needed | none |
| `residueField_eq_of_reducible_geometricFibre` | r3: F_q base; degree-2 point | trivial purely inseparable extension; outside the hypothesis | κ(a) = k | none |
| `lineBundle_lifts_completeDVR_of_h2_zero` | r3: P¹_R with O(d); non-flat P³ over k[[t]]/t² | lifts exist; image 3ℤ | flatness needed | none |
| §§0.7, 1.3, 1.4, 1.7(i), 2.3, 2.4, 2.11, 4.2, 4.5, 5.5, 5.7, 5.8, 5.9 | r3, rows unchanged (quadric cone 1/2; χ = 2n + 2; det A = 0, det(A+I) = 4, det(A+I/2) = 7/4; 2 = 1·(1+1); Br(ℂ) = 0; cokernel ℤ/2; 2·2 ≠ 0 in ℤ/8; E² = −2; H² = 1, H·ℓ = −1; (−E)·E = 1; 2/2 = 1; 2 vs Cartier rank 1) | as computed in r3 | agree | none |

## Not verifiable

- LAZ04, Definition 1.3.11 and Proposition 1.3.13, pp. 48–49 (new at README line 406), and the docstring's Corollary 1.4.10 and Theorem 1.4.23. This is a commercial textbook, settled as `uncertified` in the manifest, so it is cited by locator only. The mathematics of (v) was checked independently in the table above.
- KLE66, Theorems III.1 and IV.1: paywalled and settled as `uncertified`.
- HAR77, Chapter II: settled as `uncertified`.
- I looked in the package `sources.toml` and the worker's sources cache. Nothing was fetched.

## Source issues

- none
