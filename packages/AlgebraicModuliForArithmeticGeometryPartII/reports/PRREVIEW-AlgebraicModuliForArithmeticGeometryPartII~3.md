# Review of AlgebraicModuliForArithmeticGeometryPartII (pull request #1754 at eaed48f)

**Verdict:** needs changes

Three findings: one P2 and two P3. The gate passes at this head (every counter 0, `build=0`), the dependency check shows no UPWARD or CYCLE line, and all 14 sorried theorems survive the one-tactic probe. The P2 is new: a headline the module docstring calls not statable (Murre–Oort representability of the Picard sheaf) is statable at the pins, since the pinned Tau Ceti already carries the relative Picard fppf sheaf.

**The previous review's findings, finding by finding.**

- r2 R01 (Nakai–Moishezon and global generation re-planned): repaired. README line 11 now reads "its §4.15 `spaceNakaiMoishezon` owns the Nakai–Moishezon criterion on proper algebraic spaces over an algebraically closed field; §1.7(i) here is its extension" and "StableReduction Layer 2 owns global generation and relative ampleness"; §1.7(i) (line 388) is stated as the extension to every field with the route of line 408; §3.3 (line 709) consumes the global-generation laws from StableReduction Layer 2.
- r2 R02 (two open owners of Kleiman's criterion, the ℚ-Cartier pairing and semiampleness): repaired. Line 11: "AbundanceStatement Layers 4A–4D and 5 state the algebraically closed characteristic-zero projective case of §§0.7, 1.1–1.5, 1.7 and 3.3; this roadmap owns the general statements." I re-read AbundanceStatement at #545 (Layers 4A–4D at its README lines 232–330, Layer 5 at 331–358): its scope is projective varieties over algebraically closed characteristic-zero fields, so the sentence is accurate.
- r2 R03 (relative criterion and DVR ampleness statable): repaired. `IsRelAmple` (Suggested.lean line 144), `IsRelNef` (152), `isRelAmple_iff_exists_isRelNef_pow_mul_inv_pow` (165) and `isAmple_iff_isAmple_specialFibre` (396) are declared and named at README lines 394, 1052 and 1065; the docstring sentences of lines 24–25 and 29 are gone.
- r2 R04 (`letI` in a signature): repaired by deleting the theorem; `statement-hygiene=0`.
- r2 R05 (21 TeX fragments): repaired; `tex=0`.
- r2 R06 (three API lemmas as headlines): repaired. `eulerDegree_pullback_fromNormalization`, `cartierDivisor_toWeilDivisorHom_injective`, `IsSemiample` and `isNef_of_isSemiample` are deleted with their three imports; README lines 168, 219, 705 and 716 keep the statements in prose.
- r2 R07 (§1.3 remark gives finite dimension only; page slip): repaired. Line 291: "The remark cited gives finite dimensionality of N¹(X/S) only; integral freeness of finite rank comes from the route below through §1.2"; line 476 reads "pp. 20–21" (KLE05 line 980 lies after the page-20 marker at 962 and before the page-21 marker at 1005).
- r2 R08 (five references missing from the manifest): partly repaired. LAZ04 and HAR77 are recorded as `uncertified` (manifest lines 250 and 264); MAT86 and EIS95 are replaced by STACKS 031T, STACKS 0335 and the Tau Ceti Japanese-field instance (README lines 170 and 211). KLE66 is still cited (line 396) and listed (line 1200) but absent from the manifest: R02 below.

## R01 (P2) — Murre–Oort representability is statable at the pins and absent

Location: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean` lines 15–16, "Murre–Oort representability and finite type of the torsion component lack the fppf Picard sheaf and Picard group scheme." README §2.1, line 437, states the theorem as a target; README line 7 names it as what this continuation owns.

Claim: the fppf Picard sheaf of a proper k-scheme and representability by a group scheme cannot be stated against the pinned Tau Ceti.

Witness: at the pinned Tau Ceti (2fd255d9) `TauCeti/AlgebraicGeometry/PicardFunctor/Fppf.lean` line 104 defines `relativePicardFppfSheaf f : Sheaf (Scheme.fppfTopology.over S) AddCommGrpCat` for every morphism `f : X ⟶ S`, the fppf sheafification of `T ↦ Pic(X_T)/Pic(T)` of `PicardFunctor/Relative.lean` line 84, on Mathlib's `Scheme.fppfTopology` (`AlgebraicGeometry/Sites/Fpqc.lean` line 54). Representability of such functors by an object of `Over S` is already expressed at the pin with `Functor.RepresentableBy` (`PicardFunctor/BaseChange.lean` line 197). The statement below elaborates in a scratch copy from the worktree with `sorry` as the only warning:

```lean
import TauCeti.AlgebraicGeometry.PicardFunctor.Fppf

/-- Murre–Oort (Kleiman, Corollary 4.18.3): the fppf Picard sheaf of a proper scheme over a
field is represented by a separated k-scheme locally of finite type; the group law comes with
representability of the group-valued sheaf. -/
theorem picardFppfSheaf_representable (k : Type u) [Field k] (X : Scheme.{u})
    (x : X ⟶ Spec (CommRingCat.of k)) [IsProper x] :
    ∃ P : Over (Spec (CommRingCat.of k)),
      IsSeparated P.hom ∧ LocallyOfFiniteType P.hom ∧
      Nonempty (((TauCeti.AlgebraicGeometry.relativePicardFppfSheaf x).obj ⋙
        forget AddCommGrpCat).RepresentableBy P) := by
  sorry
```

Repair: add this theorem to Layer 2 of `Suggested.lean` with the import above (its object file is built in the worktree), name it in README §2.1 (line 437) and in the list of line 91, and rewrite the docstring sentence: the fppf Picard sheaf exists at the pin; what is still missing is the identity component and the n-th power maps on the representing scheme, so finite type of the torsion component (§2.5) and the Brauer sequence of §2.4 remain unstated. Tested on the instances that fix the statement: for X = P¹_k the representing object is `∐_{d∈ℤ} Spec k`, separated and locally of finite type; for X = Spec k[ε]/(ε²) it is Spec k (README Check, line 447); and `IsSeparated` excludes the line with doubled origin, which represents nothing here. The quasi-projectivity of the components and commutativity of the group law are not part of the Lean statement and need no carrier.

## R02 (P3) — KLE66 is cited but not recorded in the manifest

Location: README line 396, "(KLE66, Theorem III.1 for (i) on proper schemes over a field and Theorem IV.1 for (iii)" and line 1200; also the Lean docstring at line 123, "Kleiman, Theorem IV.1".

Claim: every cited work is recorded in `packages/AlgebraicModuliForArithmeticGeometryPartII/sources.toml`.

Witness: the manifest has 16 entries; the only 1966 entry is EGA-IV3 (line 168), and no entry has the title "Toward a numerical theory of ampleness". The r2 repair added LAZ04 and HAR77 (lines 250, 264) but not KLE66.

Repair: record KLE66 (S. L. Kleiman, Toward a numerical theory of ampleness, Annals of Mathematics 84 (1966), 293–344, DOI 10.2307/1970447) as `uncertified` with locators Theorem III.1 and Theorem IV.1 and `cited_for` "1.7". Tested: the reference line 1200 already carries the bibliographic data the entry needs.

## R03 (P3) — Two page locators are off by one page

Location: README line 1110, "BMP23, proofs of Lemmas 2.54 and 9.25, pp. 27 and 111; BMP23 line 1230", and line 330, "PS12, Proposition 1.2, p. 3, PS12 line 98".

Claim: Lemma 2.54's proof is on p. 27 and Proposition 1.2 on p. 3.

Witness: BMP23 line 1222 (the statement of Lemma 2.54) and line 1230 (its proof's citation of CT20) both lie after the page-28 marker at line 1219, so the lemma and its proof are on PDF p. 28; p. 27 ends at line 1218. PS12 line 98 lies between the page-2 marker (line 47) and the page-3 marker (line 117), and the arXiv page footer "1" at line 45 shows PDF page = printed page, so Proposition 1.2 is on p. 2 (Theorem 4.3 is correctly on p. 9, after the marker at line 409).

Repair: write "pp. 28 and 111" at line 1110 and "p. 2" at line 330. Tested: Lemma 9.25 at BMP23 line 4998 is after the page-111 marker at line 4983, so that half stays.

## Verified sound

**Gate, dependency check, build.**
- Gate re-run on this head with the build: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`.
- Dependency check from the worktree: `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The roadmap is at line 263 of the merge order; its open-pull-request suppliers ResolutionOfSingularitiesCharacteristicZero (19), AlgebraicModuliForArithmeticGeometry (36) and ComplexComparisonPartII (43) are earlier; EnriquesSurfacesAndIntegralNonexistence (323), K3SurfacesAndSymplecticBoundedness (315), StableReductionPartII (316) and WeilConjectures (122, consumer only) are cited only under Downstream consumers or in scope sentences, never as suppliers.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds README.md, Suggested.lean and metadata.toml.
- `lake env lean` on Suggested.lean: 14 `declaration uses sorry` warnings at lines 90, 103, 125, 134, 165, 199, 224, 246, 279, 317, 334, 354, 376 and 396, nothing else, in 7 s.
- Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 (the worktree's lake-manifest).

**Signatures.** The worker's elaborated signatures of all 25 declarations (11 definitions, 14 theorems) were compared with the README statements; no section variable exists to be lost, and every hypothesis is in the declaration's own type: `IsProper`, `IsNoetherian S`, `IsAlgClosure`, `IsPurelyInseparable`, `Smooth`, `IsAlgClosed Ω`, `IsDiscreteValuationRing`, `IsAdicComplete`, `Flat`. The four new declarations match their README statements: `IsRelAmple` is line 394's "ample on f⁻¹(V) for every affine open V" (and `IsAmple` at `LineBundle/Ample.lean` line 71 includes `CompactSpace`, as the docstring says); `IsRelNef` is line 347's all-points form; the relative criterion carries `IsNoetherian S` and a relatively ample `h`; the DVR theorem carries neither flatness nor completeness, as line 1065 says.

**One-tactic probe.** A scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | (intros; simp_all) | trivial | exact ⟨⟩` fails at all 14 theorems (14 errors, 0 remaining sorries). Nothing is padding; the two definitions with bodies (`componentGraph`, `IsProjectiveOver`) are needed by headlines.

**Seeded sample (15 targets; every locator read at its line, page markers checked).**

| Target | Lines read | Result |
|---|---|---|
| 0.2 | BMP23 1122–1130 (Lemma 2.47, p. 25: d_C with D·C = d_C(φ*D·C_k̄), proofs need only C proper); DW22 507–518 (Lemma 4.1, p. 12), 423 (Lemma 3.6) | supported; the README's quotient [L:k]/[K(C_L):K(C)] agrees with DW22 517 |
| 0.6 | KLE05 2742–2753 (Remark 6.14, p. 57: Chow cover γ, H = (γ*)⁻¹Pic^τ); STACKS Varieties 4790–4794 (0BET, projection formula with deg(Z → f(Z))) | supported |
| 1.2 | KLE05 2840–2850 (Remark 6.19, p. 59: Pic^τ of finite type, Néron–Severi rank finite); BMP23 825–832 (Remark 2.22, p. 19: N¹ ⊗ ℝ finite dimensional) | supported as the README now words it (line 276) |
| 2.1 | KLE05 1630–1632 (Corollary 4.18.3, p. 34), 1578–1579 (Proposition 4.17, p. 33); SCH23 167–184 (§1, pp. 4–5) | supported; statable at the pin (R01) |
| 2.2 | SCH23 313–319 (Lemma 1.4, pp. 7–8: Γ(X ⊗ A, G_a) = Γ(X^aff ⊗ A, G_a) by flatness) | supported |
| 2.5 | KLE05 2701–2712 (Definition 6.8, Lemma 6.9, p. 56), 2724–2727 (Proposition 6.12, p. 57); SCH23 526–528 (Proposition 4.2, p. 12), 547 (table, p. 13: ordinary ↔ μ₂) | supported |
| 2.7 | SCH23 185–188 (constant local system, p. 5), 175–178 (stalk ℤ^ρ, k^sep = k^alg points) | supported |
| 2.8 | SCH23 204–218 (norm N with N ∘ pr* = n, p. 5) | supported |
| 2.10 | SCH23 191–194 (Lemma 1.1, p. 5; the source writes d ≥ 0), 195–231 (proof) | supported with d ≥ 1 (source issue below) |
| 3.3 | SCH23 265–273 (R(X,L), P(X,L), semiample ⇒ projective contraction, p. 6); WIT22 319–323 (nef, base point free, semiample, big, p. 7) | supported |
| 4.7 | STACKS Quot 1177–1179 (0D01: Hilb an algebraic space locally of finite presentation for separated finitely presented f), 969–973 (0CZV: lifts a torsor under Hom(K, Q ⊗ J)) | supported |
| 4.8 | SCH23 349–355 (Theorem 2.1, p. 8), 356–364 (proof: negative definite ⇒ ⊕ℤC_i ↪ Num(Ω), trivial action on components) | supported |
| 5.2 | HW23 1526–1529 (ample 𝒜 with 𝒜|_X ≡ A, p. 33); LMFDB11 88–104 (conductor 11, rank 0, torsion ℤ/5), 164 (minimal equation) | supported |
| 5.3 | HW23 1406–1417 (Lemma 6.3, p. 31: obstruction in H², 08BE algebraization, 0D3A ampleness); KLE05 2219–2240 (Proposition 5.19, p. 47; units sequence 2234–2238) | supported; the source assumes mixed characteristic and projective X, and its three steps hold for proper flat 𝒳 in every characteristic, as line 1052 says |
| 5.4 | HW23 1513–1517 (curves over S lie on the special fibre; NE(𝒳/S) = NE(X), p. 33); STACKS Divisors on Spaces 1392–1397 (0D3A) | supported |

Other locators read this round: STACKS Algebra 13506 (00PH), 20199–20206 (031T(2)), 21186–21188 (0335(1)); Descent 2932–2936 (0D2P); Descent on Spaces 1008–1012 (0D3D); Varieties 1320–1321 (0BDG), 4474–4478 (0AYW), 4676 (0BEL), 4790 (0BET); Semistable Reduction 2982–2989 (0C66 (1)–(4)); EGA-IV3 986–988 (8.8.2, p. 27); LIP69 1091 (§13, pp. 222–223), 1167 (Lemma 14.1, p. 224); AHK07 63 (§1, p. 2), 135–138 (Lemma 1.6, pp. 3–4); PS12 421 (Theorem 4.3, p. 9); CT20 630–640 (Lemma 2.17, pp. 16–17), 667–702 (curve argument); KEE99 46–50 (0.0, printed p. 254), 677–686 (Lemma 2.16, printed p. 270); BMP23 819–822 (§2.5, p. 18), 1177–1178 (Proposition 2.51, p. 27), 4789 (Proposition 9.16(a), p. 106), 5252–5255 (Definition 9.30, p. 116); SCH23 232–240 (dual graph, Proposition 1.2, p. 6), 260–264 (contraction, Theorem 1.3), 276–288 (Galois stage), 289–300 (purely inseparable stage), 332–347 (§2, p. 8), 659 and 703–706 (Proposition 5.5 and sequence (4), pp. 15–16); WIT22 1513–1516 (Proposition 5.3, p. 34), 1528–1529 (Keel 2.16); HW23 90–92, 96, 111–112.

**Adversarial table (values computed on each side).**

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `NumericallyTrivial` | P¹_k, O(m); P¹_ℂ over ℝ, O(1); X = ∅ | deg = m; deg_ℝ = χ(O(1)) − χ(O) = 4 − 2 = 2; no curves | trivial iff m = 0; not trivial; trivial | none |
| `RelNumericallyTrivial` | pr₁ : P¹×P¹ → P¹ with O(a,b); f = id_S | fibre degree b; no curves in fibres | iff b = 0; every class | none |
| `numericalClassGroup_free_finite` | ∅, P⁰, P¹, E×E over k̄ | ranks 0, 0, 1, 2 + rank End(E) ∈ {3,4,6} | free of finite rank | none |
| `relNumericalClassGroup_free_finite` | id_S; pr₁ on P¹×P¹; S = Spec ∏_ℕ k | 0; ℤ; bounded integer sequences | Noetherian hypothesis needed and present | none |
| `IsNef` | P¹ with O(m); Bl_p P² with O(E); X finite | m ≥ 0; E·E = −1; vacuous | matches §1.5 | none |
| `isAmple_iff_exists_isNef_pow_mul_inv_pow` | P¹×P¹, h = O(1,1), a = O(2,1) and a = O(1,0); Bl_p P², h = 3H − E, a = 2H − E and a = H | O(2,1)·h⁻¹ = O(1,0) nef ⇒ ample; O(m,0)·O(−n,−n) = O(m−n,−n) never nef, O(1,0) not ample. (2(2H−E) − (3H−E)) = H − E nef ((H−E)·E = 1, (H−E)·(H−E) = 0) ⇒ 2H − E ample; mH − n(3H−E) has E-degree −n < 0, never nef, and H·E = 0 so H not ample | both directions agree | none |
| `isAmple_mul_of_mem_numericallyTrivialClasses` | E with a = O(p), b = O(q−p); Enriques H, b = ω | O(q) degree 1, ample; H ⊗ ω has H's intersection numbers | holds | none |
| `IsRelAmple` | pr₁ on P¹×P¹ with O(a,b); id_S, S affine; f with f⁻¹(V) not quasi-compact | ample on f⁻¹(V) = P¹×V iff b > 0; every class (affine); fails `CompactSpace` | matches line 420; quasi-compactness built in | none |
| `IsRelNef` | pr₁ on P¹×P¹; id_S; generic point of Spec ℤ_p for P¹ | b ≥ 0; vacuous; O(m): m ≥ 0 on the generic fibre too | all-points form agrees with closed-point form | none |
| `isRelAmple_iff_exists_isRelNef_pow_mul_inv_pow` | pr₁ on P¹×P¹, h = O(0,1), a = O(a,b); n = 0 control; id_S with S affine; S = ∅ | O(ma, mb−n) f-nef iff mb ≥ n, solvable with m,n ≥ 1 iff b > 0, which is f-ampleness; n = 0 would make O f-nef though not f-ample; both sides hold for every class; both sides true | iff holds, 0 < n needed and present | none |
| `isAmple_iff_isAmple_specialFibre` | P¹_R with O(1) and O; Bl_x(P¹_R) with pullback of O(1); X = ∅ | ample on both / neither; degree 0 on E on both sides; both true | matches §5.4; 0D3A needs proper over Noetherian, present | none |
| `HasTrivialNumericalGaloisAction` | P¹_ℂ/ℝ; pointless conic; Spec K′/k | conjugation swaps (1,0),(0,1); g*O(1) ≅ O(1); Num = 0 | fails; holds; holds | none |
| `constantNumericalClasses_iff_positivePowerDescent` | P¹; P¹_ℂ/ℝ; conic; d = 0 control | d = 1; image diagonal, (d,0) never diagonal; image 2ℤ, d = 2; d = 0 vacuous | agree; 0 < d needed and present | none |
| `numericallyTrivial_torsion_of_algebraic_finiteField` | y²+y = x³ over 𝔽₂; y² = x³−x over 𝔽₃; E/ℚ̄ control | 2+1 = 3 points; 3+1 = 4 points; infinite order | holds; algebraicity needed | none |
| `IsContraction` | id; pr₁; 𝔸¹ → Spec k[t²,t³]; P¹_ℂ → Spec ℝ | f_*O = O; O; k[t] ≠ k[t²,t³]; ℂ ≠ ℝ | last two excluded | none |
| `contraction_descends_purelyInseparable` | K = k; perfect closure; ℂ/ℝ control | identity squares; Γ(U′,O) = Γ(U,O) ⊗ K; one component of P¹_ℂ ⊔ P¹_ℂ does not descend | holds; inseparability needed | none |
| `IsProjectiveOver` | Spec K, n = 0; 𝔸¹; Spec ℂ over ℝ; shifted Spec K | Proj K[T₀] = Spec K; not proper; V(T₀²+T₁²) ⊂ P¹_ℝ; not of finite type | each law excludes its wrong model | none |
| `contraction_descends_of_constantNumericalClasses` | Spec K′ with K′/k separable quadratic; P¹_ℂ/ℝ | Num = 0 constant, descends; hypothesis fails | matches SCH23 262–264 | none |
| `componentGraph` | P¹ ⊔ P¹; V(xy); ∅ | 2 vertices, 0 edges; 1 edge; empty | matches | none |
| `constantNumericalClasses_iff_componentGraphDescent` | P¹ ⊔ P¹ with the swap; P¹_ℝ ⊔ Spec ℂ; P¹ over k[ε]/ε² | closure equation fails for the swap; outside purity (3 vertices over 2); one vertex, Num = ℤ, O(1) of degree 1 on the reduced curve | purity needed; closure equation needed | none |
| `fibreComponentGraph_descends_of_constantNumericalClasses` | blow-up of a k-point on a smooth fibre; conic bundle over P¹_ℝ control | [[−1,1],[1,−1]]: value −1 on (1,0), 0 on (1,1); two conjugate lines over one vertex | edge kept; constancy needed | none |
| `residueField_eq_of_reducible_geometricFibre` | 𝔽_q base; irreducible fibre over a degree-2 point | purely inseparable residue extension trivial; outside hypothesis | κ(a) = k | none |
| `lineBundle_lifts_completeDVR_of_h2_zero` | P¹_R with O(d), d = −1,0,1; §5.2's non-flat P³ over k[[t]]/t² | lifts exist; image 3ℤ, O(1) does not lift | flatness needed and present | none |
| Murre–Oort (§2.1, R01) | P¹_k; Spec k[ε]/ε²; line with doubled origin | ∐_ℤ Spec k; Spec k; excluded by `IsSeparated` | statable, absent | R01 |
| §0.7 Checks | H ⊃ ℓ; div(x/y); quadric cone | 1; 1 − 1 = 0; (2ℓ·ℓ′) = (H·ℓ′) = 1 so 1/2 | correct in every characteristic | none |
| §1.3 Check | P¹ ⊔ P¹ with O(1) ⊔ O(−1) | χ = (n+2) + n = 2n + 2 = χ(O(n) ⊔ O(n)); degrees (1,−1) | Euler test fails, curves separate | none |
| §1.4 Check | E×E, A = [[1,√2],[√2,2]] | det A = 0; det(A+I) = 2·3 − 2 = 4; det(A+I/2) = (3/2)(5/2) − 2 = 7/4 | NE ≠ NE‾ | none |
| §1.7(i) route | P¹_ℂ over ℝ with O(1) | (O(1)·X)_ℝ = 2 = 1·(1+1) over ℂ | field-extension formula agrees | none |
| §2.3 | ℂ/ℝ; ℝ×ℝ; k[ε]/ε² | Br(ℂ) = 0; (ℤ/2)²; Br(k) | matches | none |
| §2.4 | pointless real conic | Pic = 2ℤ ⊂ ℤ, cokernel ℤ/2 = Br(ℝ) | matches | none |
| §2.11 | ℤ/4 → ℤ/2; ℤ/8 → ℤ/2 control | d(1) = 2; 2·2 = 4 ≠ 0 so no factorization | matches | none |
| §4.2 route | nonreduced curve, closed point a_i not embedded | maximal ideal not associated ⇒ contains a nonzerodivisor ⇒ Cartier D_i at a_i | Cartier divisors exist | none |
| §4.5 Check | Bl_x P²_ℝ, κ(x) = ℂ | E² = 0 − 2 = −2 = (E₁+E₂)² = −1 −1 + 0 | matches | none |
| §5.5 Check | three sections of P²_{k[[t]]}, H = 2h − e₁ − e₂ − e₃ | H² = 4 − 3 = 1; H·ℓ = 2 − 3 = −1 | converse fails | none |
| §5.7 curve input | Bl_p S → S with O(−E); exceptional locus | (−E)·E = 1 ≥ 0, pullbacks have E-degree 0; D′ = π*D ⊄ Exc since codim π(Exc) ≥ 2 | hypothesis (4) needed; curve not contracted | none |
| §5.8 | P^n lines; P¹_ℂ over ℝ; H′ = 3H | (O(1)·ℓ)/1 = 1; d = 2, 2/2 = 1; minimizers unchanged | matches | none |
| §5.9 Checks | P², Bl_p P²; F₂; quadric threefold cone | 1 = 2 − 1; 2 − 1 = 1; 2 − 0 = 2 vs Cartier rank 1 | matches | none |

**Library declarations opened at the pins (file and line).**
- Mathlib (1b1ccf4b): `IsProper` (`Morphisms/Proper.lean` 41), the proper pullback.snd instance (82), `Flat` (`Morphisms/Flat.lean` 42), the `Subsingleton (Pic R)` instance (`RingTheory/PicardGroup.lean` 545), `IsPurelyInseparable` (`FieldTheory/PurelyInseparable/Basic.lean` 107), `finrank` (`LinearAlgebra/Dimension/Finrank.lean` 61), `Scheme.Hom.finrank` (`Morphisms/FlatRank.lean` 88–89), `DistribMulAction` (`Algebra/GroupWithZero/Action/Defs.lean` 346), `Scheme.Hom.fiber`, `fiberι`, `fiberToSpecResidueField` (`AlgebraicGeometry/Fiber.lean` 37–46), `IsNoetherian` (`Noetherian.lean` 277), `MvPolynomial.gradedAlgebra` (`RingTheory/MvPolynomial/Homogeneous.lean` 613), `Proj.toSpecZero` (`ProjectiveSpectrum/Basic.lean` 151), `Smooth` (`Morphisms/Smooth.lean` 59), `fromSpecResidueField` (`ResidueField.lean` 237), `GeneratingSections` (`Algebra/Category/ModuleCat/Sheaf/Generators.lean` 44), `LinearMap.continuous_of_finiteDimensional` (`Topology/Algebra/Module/FiniteDimension.lean` 287), `Scheme.Hom.normalization` and `fromNormalization` (`Normalization.lean` 122, 169), `Scheme.fppfTopology` (`Sites/Fpqc.lean` 54), `Functor.RepresentableBy` (`CategoryTheory/Yoneda.lean` 282).
- Tau Ceti (2fd255d9): `LineBundleClass` (`LineBundle/Class.lean` 50), `IsAmple` (`LineBundle/Ample.lean` 71: `CompactSpace` plus affine nonvanishing loci of sections of positive powers) and `IsAmple.of_pow` (96), `intersectionNumber` (`IntersectionNumber/Basic.lean` 111: Euler degree of the pullback, needing `C.Over (Spec k)`) and `intersectionNumber_one` (126), `InvertibleSheaf.eulerDegree` and `LineBundleClass.eulerDegree` (`LineBundle/Degree.lean` 74, 130), `InvertibleSheaf.pullback` (`LineBundle/Pullback.lean` 100), `IsGloballyGenerated` (`LineBundle/GlobalGeneration.lean` 139) with `isGloballyGenerated_iff_of_iso` (157), `isGloballyGenerated_iff_forall_isClosed` (167, `JacobsonSpace`) and `isGloballyGenerated_iff_nonempty_generatingSections` (238), `CartierDivisor` (`CartierDivisor/Basic.lean` 127), `CartierDivisor.sections` (`CartierDivisor/Sheaf.lean` 81), `toWeilDivisorHom` (`WeilDivisor/Scheme/Cartier/Inverse.lean` 234), `IsNormalScheme` (`Scheme/Normal.lean` 84), `isFinite_fromNormalization_of_isJapanese` (`Normalization/Finite.lean` 120: Japanese hypothesis on every nonempty affine open), `isRegular_normalization_fromSpecStalk_genericPoint` (`Normalization/Regular.lean` 112), `IsUniversallyJapanese.of_field` (`RingTheory/UniversallyJapanese.lean` 126) and `isJapanese` (77), `sum_sum_intersection_mul_neg` (`Curves/StableReduction/NumericalType/IntersectionForm.lean` 186), `intersectionGraph` and `intersectionGraph_connected` (`NumericalType/Topology.lean` 47, 66), `Matrix.dotProduct_mulVec_nonpos_of_mulVec_eq_zero` and `_eq_zero_iff_` (`LinearAlgebra/Matrix/NegSemidef.lean` 88, 101), `biadditiveToIntBilinear`, `leftRadical`, `LeftNumericalQuotient` (`LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean` 66, 90, 138), `InvertibleSheaf.trivial` (`LineBundle/Basic.lean` 144), `relativePicardPresheaf` (`PicardFunctor/Relative.lean` 84), `relativePicardFppfSheaf` (`PicardFunctor/Fppf.lean` 104).
- Neither pin has a nef predicate, relative ampleness, Kleiman's criterion, a Picard group scheme, an algebraic-space carrier, a surface intersection pairing of divisors, or a ℚ-Cartier ℚ-divisor class theory; the other docstring sentences stand.

**Cross-roadmap citations resolved this round (all found).**
- SchemeAndStackFoundations on main: §0.9 (848), §0.11 (938, `field_extension_descent`), §0.23 (1475), §§1.1–1.11 (2071–2390), §2.1 (3265), §2.2 (3309), §2.6 (3437, flat base change), §2.10 (3631), §2.11 (3656; `finite_pushforward_exact` 3674, small étale sites), §2.15 (3867; `etale_galois_comparison` 3872), §2.22 (4428), §3.4 (4789), §3.5 (4876; `lineBundleNorm` 4878), §4.9 (5448; `stein_factorization` 5472, Noetherian schemes), §4.10 (5487), §4.12 (5613), §4.13 (5643; `serre_normality_S₂` 5675), §4.15 (5725; `spaceNakaiMoishezon` 5861 over an algebraically closed field, as line 11 says), §5.2 (6653), §5.3 (6701; `proper_pushforward`, `flat_pullback`, `c1_degree_curve` 6709–6711), §5.9 (7129, surfaces only), §5.10 (7175; `Num.free_finiteRank` 7206, 7220).
- StableReduction on main: Layer 2 (405–466; the invertible-sheaf API extension with global generation and relative ampleness at 437–438, the fibrewise-ampleness openness at 452–453, contraction descent at 461–465), J-A2 (305), Layer 1 (372), Layer 4 (529).
- JacobianChallenge Layers A–D (111, 135, 143, 218); AlgebraicVectorBundles L0A–L0C, L1A–L1B (215, 228, 254, 269, 290); EtaleCohomologyFoundations §F.3 (676; `compactSupportFiniteness` 730: finite H^i for separated finite-type X over separably closed k with finite coefficients killed by an invertible N).
- AlgebraicModuliForArithmeticGeometry at #853: §1.4 (699), §1.5 (734), §1.6 (875; `bigLineBundle` 935, `boundedSupportParameters` 898, the finite-family reduction `boundedDegreeHilbertPolynomials`), §2.1 (1073, `hilbertFunctorAsQuot`), Layer 3 (1142), §7.3 (9297; `picard_infinitesimal_lifting` 9399), §7.6.1 (9648), §7.6.1a (9713), §7.9 (9792).
- ComplexComparisonPartII at #848: §C3.2d.2 (2310, `relative_picard_algebraicSpace`, proper flat finitely presented with universal functions), §C3.2d.4 (2346, `picard_brauer_obstruction`), §C3.2e (2382, `picardTorsionComponent`, projective flat geometrically integral over locally Noetherian), §C3.2f.1–C3.2f.2 (2394, 2412). The hypotheses match README line 71.
- ResolutionOfSingularitiesCharacteristicZero at #1199: §7.8 (1151, field resolution with smooth source preserving the regular locus).
- AbundanceStatement at #545: Layers 4A–4D (232, 256, 278, 301) and 5 (331), projective varieties over algebraically closed characteristic-zero fields (scope at 20–31).

**Ownership against open work.** `roadmaps grep` over the 472 open heads and main: the Lean names `IsRelAmple`, `IsRelNef`, `IsNef`, `NumericallyTrivial`, `HasTrivialNumericalGaloisAction`, `IsContraction`, `componentGraph` and `contraction_descends` occur only in this roadmap; `IsProjectiveOver` only here and as SchemeAndStackFoundations' differently named `IsProjectiveOverSpec` (#1276 line 1289, a predicate over a ring, not a second owner of Schröer's descent). "Numerical local system" occurs only here and in its consumers EnriquesSurfacesAndIntegralNonexistence (#1488) and WeilConjectures (#1208); "Alexeev" only here. "Kleiman" hits are JacobianChallengePartII's curve Picard scheme (#1225) and MotivesAndAlgebraicCycles' standard conjectures (#1313), different objects; "Nakai" hits are SchemeAndStackFoundations §4.15 (cited), AbundanceStatement 4D (scope sentence), and HeightsRationalPointsAndObstructions' arithmetic Nakai (#1017 line 2800, Arakelov degrees). "Relatively ample" in StableReductionPartII (#1841, merge order 316) concerns nodal-curve dualizing sheaves. No main `Suggested.lean` declares a nef, relative-ampleness, numerical-triviality or contraction predicate. The overlaps tool reports no id dropped by any open pull request and no other pull request changing this folder.

**Declared gaps.** The six slugs of `design/plan.json` match the six `What <Supplier> must provide (gap:…)` paragraphs (README lines 53, 55, 61, 63, 65, 67) with the same suppliers and sections. Each is minimal against what I read: AlgebraicModuliForArithmeticGeometry §1.6 at #853 has no finite-point detection for proper f and no proper birational section comparison; its §2.1 defines the Hilbert functor as Quot and represents it only through SchemeAndStackFoundations §4.14's projective case; its §7.3 has `picard_infinitesimal_lifting` but no nonflat relative representability; SchemeAndStackFoundations §5.9 is surfaces only and §5.3 has no nef-and-big criterion. None has supplier `none`; each `needs` sentence is a single statement with its hypotheses.

**Principles and form.** No `set_option`, no sorry'd data, one module docstring, `theorem` only, `import Mathlib` plus four `TauCeti.*` modules with built object files, no pull-request numbers or process words in the folder (gate `prnum=0`, `round-labels=0`, `residue=0`). The prose of the sections changed since bba32f3 (§§0.4, 0.7, 1.5, 1.7, 3.3, 5.3, 5.4) is the author's own wording. The README's generality equals the Lean's for every declaration.

## Not verifiable

- KLE66, Theorems III.1 and IV.1: Annals of Mathematics 84 (1966), paywalled; not in the manifest (R02) nor in the sources cache. Cited by locator only.
- LAZ04, §§1.1.C, 1.3.B, Theorem 1.2.23, Remark 1.2.29, Theorem 1.4.9, Corollary 1.4.10, Theorems 1.4.23 and 1.4.29, Remark 1.4.24, Examples 1.4.5 and 1.5.2; HAR77, Chapter II §5 and Theorem 7.1: commercial textbooks, settled as `uncertified` in the manifest. Cited by locator only.
- I looked in the package `sources.toml` and the worker's sources cache. This review edits no manifest, so nothing was fetched.

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, printed p. 5: the source allows the uniform exponent d ≥ 0; it should be d ≥ 1, since d = 0 makes the condition vacuous; affects a stated result.
- **Misprint** in SCH23 at proof of Theorem 1.3, printed p. 7: the source names the continuous map of the pair (f′, ϕ′) as f; it should be f′; affects nothing.
- **Misprint** in SCH23 at proof of Theorem 1.3, printed p. 7: the source writes the preimage of the affine open V′ as f′⁻¹(V); it should be f′⁻¹(V′); affects nothing.
- **Misprint** in SCH23 at §2, printed p. 8: the source writes the curve as C ⊂ X and the geometric fibre as X ×_Z Spec Ω, and in the proof of Theorem 2.1 the contraction as f : X → Z; it should be S in each place, the surface just introduced; affects nothing.
- **Error** in SCH23 at §2, printed p. 8: the source says a contraction of S is birational onto a geometrically normal surface or of fibre type onto a smooth curve; it should also allow the structure morphism to Spec k, which is a contraction since h⁰(O_S) = 1; affects nothing, since Theorem 2.1 assumes a one-dimensional fibre.
- **Misprint** in CT20 at Lemma 2.17, printed p. 17: the source puts the descended ℚ-Cartier divisor M on Y; it should be on S, the target of f; affects nothing.
