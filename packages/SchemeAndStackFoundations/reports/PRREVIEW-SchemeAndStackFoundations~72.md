# Review of SchemeAndStackFoundations (pull request #1276 at 618343f)

**Verdict:** needs changes

This is a full review of the head that r71 read; the folder has not changed since. Both r71 findings are carried. Four are new: one missing hypothesis introduced by this pull request's rewrite of §0.1, one headline that is statable, one false Check and one imprecise locator. There is also one README/Lean generality gap.

## R01 (P2) — The branch still pins Tau Ceti `358314d4`, where the README's Tau Ceti citations and the counterparts of 19 restated definitions do not exist

Re-raised: H01. The repair report says the remaining step is the worker's merge, because a folder repair may not touch `lake-manifest.json` or `lean-toolchain`. That is the right owner for the step, but it does not remove the defect: the README is written against `2fd255d9` (`README.md:464`, "**From Tau Ceti** (`2fd255d9`)") and the branch builds against `358314d4`.

- **Location.** `lake-manifest.json`: Tau Ceti `358314d4`, Mathlib `f6090c70`. `Suggested.lean` still restates 19 definitions that Tau Ceti has at `2fd255d9` (for example `:127 def Ring.IsJapanese`, `:289 def IsAlgebraicSpace`, `:1137 def ChowGroup`).
- **Claim.** The README cites Tau Ceti files and lines that do not exist at the branch pin. This round's sample shows the problem is not limited to the 8 citations r71 counted. Every Tau Ceti file:line citation I opened in the seeded sections fails at the pin:
  - §0.1: 3 of 3;
  - §0.2: 7 of 7;
  - §0.10: 12 of 12;
  - §0.30: 24 of 24;
  - §2.3: 5 of 5.
- **Witness.** At `358314d4` these are absent: `RelativeSpec/MorphismProperties.lean`, `RingTheory/LocalRing/Unibranch.lean`, `RingTheory/StrictHenselization/`, `Scheme/Normal.lean`, `Morphisms/CodimensionOne/`, `Sites/NonabelianCohomology/Torsor.lean`, `RingTheory/Japanese.lean` and `Chow/Basic.lean`. At `2fd255d9` each opens at the cited line. `RegularFunctions.lean:53` is `pushforwardStructureAlgebra_X` at the pin.
- **Repair.** Unchanged from r71:
  1. The worker merges `origin/main`. `git merge-tree` was clean in r71.
  2. A folder repair then makes three changes:
     - swap the 19 definitions for Tau Ceti's;
     - write `Curve.vectorBundleDegree_pullback` with `FixedRank.vectorBundleDegree`;
     - align the *Lean:* lines of §§0.5, 0.20, 0.21, 1.3, 2.17, 3.3, 4.1, 4.13 and 5.1.

  R04 depends on the same merge.
- **Tested.** All 51 citations above open at `2fd255d9` with the declaration the README names. For example, `CodimensionOne/FiniteType.lean:103` is `coheight_apply_eq_one`, with the hypotheses the README lists: finite, scheme-theoretically dominant, `X` integral, target locally of finite type over a field.

## R02 (P3) — The pull-request description still describes a §4.10A this head lacks and states no order with the four conflicting heads

Re-raised: H02. The repair report says the description is the author's to rewrite. That is correct, but the defect is unchanged.

- **Location.** `scratch/pull-request.md`: "New section 4.10A constructs that scheme …", "This README-only addition changes no Lean declarations".
- **Witness.**
  - `grep -c '4\.10A' README.md` returns 0.
  - Against main, `Suggested.lean` changes by 1818 lines.
  - `scratch/overlaps.md` lists #1656, #1807, #1808 and #1854 as conflicting in `README.md` and `Suggested.lean`.
- **Repair.** Rewrite the description to say what the branch does: Tau Ceti-built Layer 0–5 objects are cited, and `Suggested.lean` is reduced to headline theorems. Add one line per conflicting pull request saying which side rebases. No file change.

## R03 (P2) — §0.1's `pushforwardAlgebra_baseChange` lost the quasi-compact and quasi-separated hypothesis in this rewrite, and is false without it

- **Location.** `README.md:597–600`: "Prove `pushforwardAlgebra_baseChange`: for a flat `g : S' → S` with base change `f' : X' → S'`, the base change map `g^* f_* O_X → f'_* O_{X'}` is an isomorphism".
- **Claim.**
  - On main, `f` was fixed as quasi-compact and quasi-separated in the sentence that defined `pushforwardAlgebra` (main `README.md:494`).
  - This head replaces that definition with Tau Ceti's `pushforwardStructureAlgebra f`, which takes any `f`. Quasi-coherence of `f_* O_X` is now stated only conditionally, so the target is stated for every `f`.
  - Stacks 02KH, the cited source, assumes `f` qcqs (book line 123118, p. 2591).
- **Witness.** Take `f : ⨿_{n∈ℕ} Spec k → Spec k` (not quasi-compact) and `g : Spec k(s) → Spec k` (flat). Then:
  - `g^* f_* O = (∏_n k) ⊗_k k(s)`;
  - `f'_* O = ∏_n k(s)`;
  - `(sⁿ)_n` is not in the image, because its coordinates span an infinite-dimensional `k`-subspace.
- **Repair.**
  - Write "for `f` quasi-compact and quasi-separated and a flat `g : S' → S`".
  - Add the witness above as a negative Check.
- **Tested.** For the finite family `⨿_{n≤N} Spec k`, `k^N ⊗_k k(s) = k(s)^N` and the map is an isomorphism. For the infinite family it is not surjective.

## R04 (P2) — The Hodge index theorem is statable at the Tau Ceti commit the README is written against, and the docstring's reason is wrong at both commits

- **Location.** `Suggested.lean:47–54`, the §5.10 bullet: "the pins have no pairing of two classes on `Pic(S)` … no numerical equivalence and no `Num S`". `README.md:7426`: "Prove `hodge_index`: for `H` ample and `D` with `D · H = 0`, `D² ≤ 0`, with equality iff `D ≡ 0`".
- **Claim.**
  - The pairing is one short definition with a real body on native carriers: `(L·M) = χ(O) − χ(L⁻¹) − χ(M⁻¹) + χ(L⁻¹⊗M⁻¹)`. It uses `Scheme.Modules.eulerCharBelow k S _ 3`, `InvertibleSheaf.dual` (`LineBundle/Dual.lean:44`) and `tensorProduct` (`LineBundle/TensorProduct.lean:63`), all present at both commits.
  - Numerical triviality is `∀ M, D·M = 0`.
  - At `2fd255d9`, `LineBundleClass.IsAmple` exists (`LineBundle/Ample.lean:71`), so the README's statement is statable there, and the headline is absent.
  - At `358314d4`, the bullet's own citations, `LineBundleClass.IsAmple` and `LineBundleClass.intersectionNumber` (`IntersectionNumber/Basic.lean:111` at `2fd255d9`), do not exist. The missing carrier there is ampleness, not the pairing.
- **Witness.** `ls TauCeti/AlgebraicGeometry/IntersectionNumber` and `LineBundle/Ample.lean` both fail at `358314d4`. Both open at `2fd255d9`.
- **Repair.**
  - After R01's merge, add the pairing on `InvertibleSheaf S` with the body above.
  - Add `hodge_index` with these hypotheses: `[IsAlgClosed k]`, `S` proper, smooth and geometrically integral over `k`, `topologicalKrullDim S = 2`, `(LineBundleClass.mk H).IsAmple` and `pairing D H = 0`. Conclude `pairing D D ≤ 0`, and `pairing D D = 0 → ∀ M, pairing D M = 0`.
  - Delete the §5.10 docstring bullet and list `hodge_index` on §5.10's *Lean:* line.
  - If the merge has not happened when this is repaired, the bullet must instead name ampleness as the missing carrier and drop the two citations that do not exist at the pin.
- **Tested.** On `ℙ¹×ℙ¹` with `χ(O(a,b)) = (a+1)(b+1)`, `D = O(1,−1)` and `H = O(1,1)`:
  - `D·H = 1 − 0 − 0 + χ(O(−2,0)) = 1 − 1 = 0`;
  - `D·D = 1 − 0 − 0 + χ(O(−2,2)) = 1 − 3 = −2`;
  - `H·H = 1 + χ(O(−2,−2)) = 2`.

  These agree with the §5.10 Checks (`D² = −2`, `O(a,b)² = 2ab`). The sibling review r68 elaborated this statement at `2fd255d9`, with exit 0 and `sorry` as the only warning.

## R05 (P3) — A §4.19 Check claims an example with no generically étale alteration; the section's own curve Check refutes it

- **Location.** `README.md:6575–6577`: "Over an imperfect field the alteration need not be generically étale (`y² = x^p − t` admits no generically étale alteration to a smooth curve with the same function field)". The same section, `:6571–6572`: "For a curve the theorem is resolution by normalisation (§4.13) with `φ` a modification."
- **Claim.**
  - `alteration_theorem` asks for `X̄_1` regular, not smooth.
  - For a curve, the regular projective model with the identity alteration satisfies the theorem. It is birational, so `IsAlteration.IsGenericallyEtale` holds.
  - The parenthetical is about smoothness ("same function field" means birational), not about generic étaleness.
- **Witness.** Take `k = 𝔽_p(t)` with `p` odd and `C : y² = x^p − t`.
  - At `y = 0`, the maximal ideal is `(y)`, because `x^p − t = y²`. So `C` is regular.
  - The function-field map of the identity is `id`, which is separable.
- **Repair.** Replace the Check with: "for `y² = x^p − t` over `𝔽_p(t)` the regular projective model is not smooth over `k`; the identity alteration satisfies the theorem and is generically étale, since `X̄_1` is only required to be regular."
- **Tested.** Over `k^{1/p}`, `y² = u^p` with `u = x − t^{1/p}` is singular at `u = y = 0`, so `C` is not smooth. Over `k` it is regular, as shown above.

## R06 (P3) — §0.14 cites 0D4A, a lemma about finite projective modules, for the finite étale equivalence

- **Location.** `README.md:1206–1208`: "base change is an equivalence from finite étale `R`-algebras to finite étale `R/I`-algebras (Stacks, Lemmas 15.13.1 (0D4A), 15.13.2 (09ZL))".
- **Witness.** Book line 58838 (p. 1228): 0D4A says `P ↦ P/IP` is a bijection on isomorphism classes of finite projective modules. Lines 58857–58881: 09ZL states the finite étale equivalence, and its proof does not use 0D4A.
- **Repair.** Cite 09ZL alone, or write "(09ZL; 0D4A is the finite projective analogue)".

## R07 (P3) — Two Lean statements are wider than the README and the cited sources, and the README does not record this

- **Location.**
  - `Suggested.lean:663–668`, `Curve.isAffine_or_isProper`, assumes only `LocallyOfFiniteType`. `README.md:4670` defines a curve as "of finite type", and Stacks 0A27 (book line 138240) is stated for curves.
  - `Suggested.lean:491–495`, `Etale.brauer_functionField_curve_trivial`, allows any `K` algebraic over `k(t)`. `README.md:3942–3943` says "a function field of transcendence degree one", and Stacks 03RD (line 232925) is about function fields of varieties.
- **Claim.** Both wider statements are true, but each needs an argument the README does not give. `#check` confirms that neither signature carries the missing hypothesis.
  - For curves: an integral separated scheme locally of finite type of dimension 1 is quasi-compact. Its normalisation embeds into the regular projective model of `K(X)`, minus finitely many points.
  - For Tsen: `Br` of a direct limit of fields is the direct limit of the `Br`.
- **Repair.** Do one of the following:
  - add `[QuasiCompact (X ↘ Spec (.of k))]` and `Algebra.FiniteType k K` (or `K` finitely generated over `k⟮t⟯`) to the two signatures;
  - or add one sentence each to §3.1 and §2.16 saying that the Lean form is wider, with the reduction step above.
- **Tested.**
  - The line with doubled origin is integral, locally of finite type and of dimension 1, and is neither affine nor proper. `IsSeparated` excludes it.
  - For `K` an algebraic closure of `k(t)`, `Br(K) = 0` trivially, so the wider Tsen statement holds there.

## Previous findings

- **R01 — not repaired** (same head).
  - `lake-manifest.json` still pins `358314d4`.
  - `Suggested.lean:127` `def Ring.IsJapanese` and `:1137` `def ChowGroup` remain.
  - The README still cites `2fd255d9`-only lines (§0.30, `Normal.lean:84`).
- **R02 — not repaired.** `scratch/pull-request.md` still opens "The existing coherent-module existence theorem … New section 4.10A …" and names no order with #1656, #1807, #1808 or #1854.

## Verified sound

### Gate, dependency check, build

- **Gate.** The worker's gate reports every counter 0 and `OK`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` printed every counter 0 and `OK`, exit 0.
- **Dependency check.** The output of `gate --depcheck … --movable`, verbatim:

  ```text
  depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** `lake env lean <abs>/Suggested.lean` exited 0 in 64 s, with 44 "declaration uses `sorry`" warnings and nothing else. The file contains 44 `sorry`.
- **Padding probe.** I made a scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | trivial | decide`. All 44 positions still fail, so no theorem closes in one tactic.
- **Signatures.** `scratch/signatures.md` lists 115 entries with 0 lost binders. My `#check @` of `Curve.isAffine_or_isProper`, `Etale.brauer_functionField_curve_trivial`, `Formal.DeJong.alteration_theorem`, `Formal.generic_flatness`, `Groups.Torsor.trivial_iff_section` and `weil_bound` matches the README, apart from R07.
- **Suppliers.** Every supplier roadmap the README names is on main: AlgebraicVectorBundles, StableReduction, JacobianChallenge, ClassFieldTheory, ProfiniteCohomology, QuadraticFormInvariants and GrothendieckEulerForms. That is required, because this roadmap is itself on main.

### Seeded locators

All checked in the cached Stacks book (version ed88ff78), at book line and page:

- **§0.1.**
  - 01LM (Situation 27.3.1, l. 110572, p. 2324) and 01LN;
  - 01LC (26.24.1, p. 2319: qcqs);
  - 02KH (30.5.2, p. 2591: `g` flat, `f` qcqs; see R03);
  - 01I6.
- **§0.2.**
  - 01LX (27.4.6), 01T2 (29.15.2), 01TQ (29.22.2), 01S7 (29.11.2), 02K8 (29.45.2), 01WI (29.45.3), 01QO (29.2.1);
  - 01SB (29.11.7, the equivalence for affine `f`).
- **§0.10.**
  - 0BPZ (15.108.1, p. 1508), 0BQ0 (15.108.3, p. 1509), 06DM (15.108.5, p. 1511);
  - 04GP and 04GQ (p. 857);
  - 03RV (59.64.4, p. 4865), 04MF (5.9.6, p. 142).
- **§0.12–§0.13.**
  - 0A02 (p. 1225), 0A03 and 0AGV (p. 1226), 04GV (p. 858), 07QY (p. 1626), 07QR, 07PX;
  - 0DYE (15.12.7, p. 1227: integral, `V(J) = V(IB)`), 0H7Q (15.12.8, pp. 1227–1228);
  - `bhatt-scholze-2014` line 518: Proposition 2.3.3 (4), ind-étale composition;
  - `clausen-mathew-morrow-2021` line 911: Remark 3.19, p. 22.
- **§0.14.**
  - 09XI (15.11.6, pp. 1220–1221; all five conditions, as at `README.md:1191–1196`), 09XK (p. 1222);
  - 0FWU (Example 15.11.14, p. 1224), 09ZL (p. 1229), 04GG (10.153.3, items 1–13), 0H74 (15.13.3, p. 1229);
  - 0D4A: see R06.
- **§0.26.**
  - `van-hoften` (arXiv v4): (2.1.2) at line 322, p. 8; Example 2.1.3 at line 334, p. 8; Definition 2.1.9 at line 412, p. 10.
  - `zhu-2017`: §A.2.1 at line 2380, p. 49; Proposition A.15 with (A.2.1) at line 2388, p. 50; Corollary A.16 at line 2413.
  - `bhatt-scholze-2017`: §4 opening at line 696, p. 15. The Frobenius factorisation in the proof of 11.41 is at line 2455, p. 53.
- **§0.30.** 033I (28.7.1), 00PD (10.119.7, item (5)), 00H8 (10.38.7), 02JE (§110.19, p. 7354), 09E4 (15.113.1), 00NR (10.106.4).
- **§1.22.** 06WG (96.11.1), 06WT (96.14.3), 077A (103.11.1, qcqs), 0GQQ (103.11.2), 070A.
- **§2.3.** 03AH (21.4.1), 03AI (21.4.2), 03AJ (21.4.3), all on p. 1933.
- **§2.12–§2.13.**
  - `morel-voevodsky` (Numdam): Proposition 1.1 and Definition 1.2 at lines 1765–1778, pp. 95–96; Definition 1.3 at line 1790, p. 96; Proposition 1.4 at line 1802, p. 96, with Lemma 1.5 on p. 97; Lemma 1.6 and Remark 1.7 at lines 1851–1858, p. 98.
  - 03A0 (7.29.1).
- **§2.20.**
  - 0DI0 (36.35.1, p. 3155), 0E2T (48.28.1, p. 4153, with conditions (1)–(2) as written);
  - 0E2D, 0E2F, 0E2G (pp. 4078–4079), 0DI2, 0E2U, 0E2W, 0E2X, 0E2Y;
  - 0BV8 (48.21.7: Cohen–Macaulay ⇒ `f^!O_Y = ω[d]`), 0C0Z, 0C10, 0AWQ, 0E9W, 0C08;
  - 0E9Z (48.29.2: lci, factoring through a proper smooth `P`), 0BRT (48.15.7);
  - 0FVU, 0FW0 (Remark 48.27.6, the perfect pairings), 0E31;
  - 0GEW (Example 48.3.9: proper Noetherian, `L ∈ D⁻_Coh`, `K ∈ D⁺_QCoh`). 48.3.6 is 0A9Q.
- **§5.3 and §5.8.** 02SN (§42.25, `c_1(L) ∩ −`), 02TG (§42.28), 02UO (§42.66, proper smooth `f`, `R^i f_* E` locally free, `T_{X/Y}`).
- **Suggested.lean docstrings.** All of these hold:
  - 0A26, 0A27, 0BY9 (proper, dimension 1, `H⁰ = k`);
  - 0C1C, 0C1D, 0C1F;
  - 0A3J, 03RC, 03RD;
  - 02UZ;
  - 01XF (stated for ideals; the Lean hypothesis covers all quasi-coherent modules, so the Lean statement is weaker and true);
  - 06Z0;
  - 02H0, 02HG, 02H6, 02HM, 04EX, 07E8, 0AIF;
  - 0899 (l. 126205), 09ZT, 0A42;
  - 0AB0 (29.52.12, for integral `X`);
  - 052A (generic flatness: `S` integral, finite type, dense `U`);
  - 032F, 032R, 032W, 07QV;
  - 04DZ;
  - 0AUW (Dedekind: flat iff torsion free);
  - 02QR, 02QO, 02RW, 0AYR, 0AYZ;
  - 04SK (no flatness on `G` is needed, so the Lean `torsorRepresentability` is right), 04S6, 04TY, 06P9, 043H, 02X2, 03MJ, 04RD, 025Y.
- **Other source passages (§§0.3–0.5).** 01PE, 01PF, 0G41 (qcqs `X`, quasi-compact `U`), 01PI, 01XZ, 01N2, 01NN, 01NO, 01NR, 01O3, 01O4, 0B5J, 01N0, 01N1, 064Q, 064T, 066E, 064V and 08E4.

### Library declarations opened

- **Tau Ceti at `2fd255d9`.**
  - §0.1: `RegularFunctions.lean:53`, `QuasiSeparated.lean:107` (`[QuasiCompact f] [QuasiSeparated f]`), `AffineFunctions.lean:65`;
  - §0.2: `RelativeSpec/Basic.lean:462`, `Unit.lean:179`, `MorphismProperties.lean:69/82/94/120/132`;
  - §0.10: `Unibranch.lean:57/110/149`, `Scheme/Unibranch.lean:43/54/64`, StrictHenselization `Algebra.lean:75`, `Point.lean:40/257`, `Henselian.lean:45`, `Etale.lean:138`, `Noetherian.lean:39`;
  - §0.30: all 24 lines;
  - §2.3: `Torsor.lean:61/159/226/234/276`;
  - R04: `Ample.lean:71`, `IntersectionNumber/Basic.lean:111`, `NonvanishingLocus.lean:82`.
- **Tau Ceti at both commits.** `LineBundle/Dual.lean:44`, `TensorProduct.lean:63`, `EulerCharacteristic.lean` `eulerCharBelow`.
- **Mathlib at the pin.**
  - `ProjectiveSpectrum/Proper.lean:372`, the `IsProper (Proj.toSpecZero 𝒜)` instance (§4.19 API);
  - `OrderOfVanishing.lean:52`: `Scheme.ord` is 0 off coheight-one points, so the Lean `Chow.RatEquiv` sums are sound;
  - `Algebra/Azumaya/Defs.lean:60`: `IsAzumaya` includes `FaithfulSMul`, as §2.22 says.
- **Duplication searches.** These found no duplicate of a `Suggested.lean` headline at either commit or in Mathlib at the pin:
  - Mathlib has no scheme-level `FormallySmooth` class, no generic flatness, no Serre affineness criterion and no Grothendieck vanishing.
  - Tau Ceti has no Nisnevich topology, no J-2 or quasi-excellence, and no small-étale topological invariance.
  - Tau Ceti's `ProjectiveOrbit/GenericFlatness.lean` and `TensorProduct/Galois.lean` (descent of morphisms) are narrower than the headlines.

### Cross-roadmap citations and ownership

- **JacobianChallenge on main** cites §4.9's `formalFunctionsIso` (its `README.md:195–198`, `:279–280`). §4.9 consumes JacobianChallenge Layer C's 02O5/02O6. The edge is acyclic at the target level, and depcheck reports no CYCLE.
- **PurityForFlatCohomology (#1840)** cites §2.22 `brauer_regular_injectivity` and §2.9 `GmEtale`. Both are present (`README.md:4535`, `:3649`).
- **Overlaps.** `scratch/overlaps.md` reports no dropped id in either direction.
- **Azumaya names.** `roadmaps grep` finds `IsAzumaya.exists_etale_matrix_splitting` and `…_of_finite_cover` only in copies of this folder (main, #1656, #1807, #1808, #1854).

### Adversarial table

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §0.1 `pushforwardAlgebra_baseChange` | `⨿_ℕ Spec k → Spec k`, `g = Spec k(s)`; finite family `N` | `(∏k)⊗k(s)` misses `(sⁿ)` / `∏k(s)`; `k(s)^N` / `k(s)^N` | **R03** |
| §0.1 Checks (Hartogs, `⨿ Spec A/tⁿ`) | `M = ∏ A/tⁿ`, `D(t)` | `t^r·(1)` nonzero at `n = r+1`, so `M_t ≠ 0` / sections over `D(t)` are 0 | Pass |
| §0.2 `relativeSpec_modulesEquiv` | `S = Spec k`, `A = k[t]`, `F = O` | `p^*p_*F = A⊗_kA` (kernel `t⊗1 − 1⊗t`) / `A⊗_{A}A = A` | Pass |
| §0.10 `unibranch_finite_components` | eventually constant `𝔽₂` sequences; `Spec(k₁×k₂)`; empty family | `{m∞}` closed, not open (not Noetherian, excluded) / two clopen points, each finite étale; `∅` | Pass |
| §0.10 unibranch Checks | node; cusp; `ℝ[x,y]/(x²+y²)` | 2 branches / 1 branch with residue field `k` / `ℂ[t]` local with `[ℂ:ℝ] = 2` separable | Pass |
| §0.12–§0.13 henselization | `ℤ[i,1/2]/(2+i)`; `X²−X+pT`; `(ℤ,(6))` | `𝔽₅`; `(2X−1)² = 1−4pT` has degree 1 in `T`, so no root; `ℤ_{(2)}^h × ℤ_{(3)}^h`, and `(2)∩(4)` gives `ℤ_{(2)}^h` | Pass |
| §0.14 characterisations and 0FWU | `(ℤ,5)`; `ℤ_p⊗ℤ_p` | `T²+1` has the simple root 2 mod 5 and no integer root; `A/pA = 𝔽_p` but `Spec A` is disconnected | Pass |
| §0.26 perfectly smooth | `(𝔸²)^perf → (𝔸¹)^perf`; `⨿_ℕ Spec 𝔽_p`; `E`, `E^{(p)}` | relative dimension 1; étale but not quasi-compact; `j` versus `j^p` | Pass |
| §0.30 `isDiscreteValuationRing_stalk` | `k[x,y]_{(x)}`; 02JE example | DVR by 00PD (5); a coheight jump is excluded by the field or normality hypotheses | Pass |
| §1.22 QCoh on stacks | `B(ℤ/p)` over `𝔽_p`; raw `j_*O` | `H¹(ℤ/p,𝔽_p) = 𝔽_p ≠ 0`, so pushforward is not exact; value 0 at the origin versus `k` for a quasi-coherent sheaf | Pass |
| §2.3 `NonabelianH1` | `ℤ/2` on `Spec ℝ`; `S₃` | 2 elements = `#H¹`; `(12)(13)` has order 3 | Pass |
| §2.12 Nisnevich | `{ℤ[1/10], ℤ[1/2][i]}` over `(5)`; `Spec ℂ → Spec ℝ` | `𝔽₅[x]/(x²+1) = 𝔽₅²`; residue field `ℂ ≠ ℝ`, rejected | Pass |
| §2.13 distinguished square | `p(s) = s²+2s` on `𝔸¹∖{−1,−2}`; `Spec ℝ ⊔ Spec ℂ` | `p' = 2s+2`, `p⁻¹(0) = {0,−2}` minus `−2` is `{0}`; `p⁻¹(Z) ≠ Z`, rejected | Pass |
| §2.20 duality Checks | `ℙ¹`; `k[x,y]/(x,y)²`; nodal cubic; `ℙ²` | `ω = O(−2)`, degree `−2 = 2g−2`; 2-dimensional socle, not Gorenstein; `p_a = 1`, `ω ≅ O`, degree 0; `H²(O(−3)) = k` dual to `H⁰(O) = k` | Pass |
| §4.19 `alteration_theorem` | `𝔸¹_k`, `Z = {0}`; `y² = x^p − t` | `φ = id`, `X̄₁ = ℙ¹`, boundary `{0,∞}`, SNC; identity birational and regular, so generically étale | Pass; **R05** (Check) |
| §4.19 `IsProjectiveOverSpec` | `ℙⁿ_R`; `𝔸¹_k`; `∅` | yes; not universally closed, so no; empty closed subscheme of `ℙ⁰` | Pass |
| §5.3 `c_1` | `O(m)` on `ℙ¹`; `O(P−Q)` on `E`; `O(2)` on `ℙ¹` | degree `m`; `[P]−[Q] ≠ 0` in `Pic E`; `χ(O(2)) − χ(O) = 3 − 1 = 2` | Pass |
| §5.8 GRR and HRR Checks | `χ(ℙ²,O(1))`; `χ(ℙ¹,O(−3))`; `O(1)⊕O(−1)` | `3 = binom(3,2)`; `−2 = binom(−2,1)`; `χ = 2 = 0 + 2(1−0)` | Pass |
| §5.12 Bézout | two conics; skew lines in `ℙ³`; twisted cubic and a plane | `4 ≤ 4`; `0 ≤ 1` (no equality, since `1+1 < 3`); length 3 = 3 | Pass |
| §5.10 `hodge_index` (absent) | `ℙ¹×ℙ¹`, `D = (1,−1)`, `H = (1,1)` | `D·H = 0`, `D² = −2`, `H² = 2` through `χ(O(a,b)) = (a+1)(b+1)` | **R04** |
| `artinBootstrap` | `F = h_X`, `a = id`; `Spec k → Spec k[ε]` | is an algebraic space; not fppf locally surjective (`ε ≠ 0` in a faithfully flat `B`), excluded | Pass |
| `torsorRepresentability`, `trivial_iff_section` | frame torsor of `O(1)` on `ℙ¹`; `P = G` | locally `≅ G_{U_i}` (04SK); no nowhere-vanishing section, so not `≅ G` / unit section | Pass |
| `grothendieck_existence(_fullyFaithful)` | `A = k[[t]]`, `X = Spec A`; `X = 𝔸¹_A` (not proper) | `M = lim Mₙ` is finite; `Σ tⁿxⁿ ∈ lim Aₙ[x]` but not in `A[x]`, so properness is needed | Pass |
| `algebraize_hom` | `aₙ ≡ a`; `g₀ = 0`, `g₁ = 1`; `x ↦ Σ_{i≤n} tⁱxⁱ` on `𝔸¹_A` | `a = lim aₙ`; incompatible, excluded; no polynomial `G`, so `X` proper is needed | Pass |
| `semistable_alteration_theorem` | `ℙ¹_{k[[t]]}`, `Z = X_s`, `H = ∅` | smooth generic fibre, reduced special fibre `ℙ¹_k`; boundary `X_s = X_s` | Pass |
| `weil_bound` | `ℙ¹/𝔽_q`; `y² = x³+x` over `𝔽₃`; Hermitian curve over `𝔽_{q²}` | `0 ≤ 0`; `#X = 4`, `|4−4| ≤ 2√3`; `q³−q² = 2g·q` with `g = q(q−1)/2` (equality) | Pass |
| `vectorBundleDegree_pullback` | `z ↦ z²` on `ℙ¹`, `E = O(1)` | `χ(O(2)) − χ(O) = 2` / `2·1` | Pass |
| `genus_of_finite_etale` | étale double cover of genus 2; `z ↦ z²` on `ℙ¹` | `3−1 = 2·(2−1)`; `−1 ≠ 2·(−1)`, excluded by `[Etale f]` | Pass |
| `genus_baseChange` | `ℙ¹_L/k`; elliptic curve | `H⁰ = L`, excluded by `hH0`; genus 1 over every `K` | Pass |
| `isAffine_or_isProper` | `𝔸¹`; `ℙ¹`; line with doubled origin | affine, not proper; proper, not affine; not separated, excluded | Pass; **R07** |
| `brauer_functionField_curve_trivial` | `ℂ(t)`; `ℝ(t)`; `ℂ(s,t)`; algebraic closure of `ℂ(t)` | `Br = 0`; `(−1,−1)` nonsplit, excluded by `IsAlgClosed`; `(s,t) ≠ 0`, excluded by `halg`; `0` | Pass; **R07** |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` | `ℙ¹`, `d = 1`; `𝔸²∖0`; `ℙ¹` | `H² = 0`; `H¹(O) ≠ 0`, not affine; `H¹(O(−2)) = k`, not affine | Pass |
| `artinSchreier_vanishing` | `Spec 𝔽_p`; zero ring | `cd_p ≤ 1`, `H² = 0`; `CharP 0 p` fails, excluded | Pass |
| Azumaya theorems (3) | `ℍ/ℝ`, `d = 2`; `Mat₀(k) = 0`; `k` via `pr₁` over `k×k`; `ι = ∅` | `ℍ⊗ℂ ≅ M₂(ℂ)`, rank 4; bijective `mulLeftRight` but fibre rank 0 and not faithful; ranks `(1,0)`; `Spec A = ∅` | Pass |
| `generic_flatness`, `flat_over_dedekind` | `k[x,y]/(xy)` over `k[x]`; `S = Spec k[ε]`; `ℤ[x]/(2x)` | flat over `D(x)`; `S` not integral, excluded; component `V(2)` not dominant, and indeed `2·x = 0` | Pass |
| `smallEtaleBaseChange_isEquivalence` | Frobenius; `Spec ℂ → Spec ℝ` | universal homeomorphism; `Spec(ℂ⊗ℂ)` has 2 points over 1, excluded | Pass |
| `CH_coprod` | `∐_ℕ 𝔸¹`, `α = Σ[0ₙ]`; `∐ Spec κ` | `α ∈ RatEquiv` by coordinates; `CH₀ = ∏ℤ`, `CH₋₁ = 0` | Pass |
| `curve_fibration_field_reduction`, `node_local_structure_dvr` | conic `sx²+ty²=z²` over `𝔽₂(s,t)`; `a = 3p²` in `ℤ_p` | reduced line `ℙ¹_{k(√s,√t)} → C` finite surjective; `ε = 3`, `n = 2` | Pass |
| `isPseudoCoherentSheaf_iff_affineOpens` | `j_!O` on `Spec R`, `R` a DVR | section modules `0`, `K` pseudo-coherent, but not quasi-coherent; both sides false | Pass |

## Not verifiable

- **de Jong 1996 and Hartshorne 1977.** The manifest settles both as uncertified, so I cited them by locator only: §4.19 Theorem 4.1, Remark 4.2 and p. 66; Hartshorne II.4, p. 103.
- **Fulton 1998.** Cited in §§5.3, 5.8, 5.12: §§2.3–2.5, Theorem 2.4, Proposition 2.5, Theorem 15.2, Corollary 15.2.1, Example 8.4.6, Theorem 12.3, Example 12.3.1. It is not in the roadmap's manifest and is a Springer book with no legal open copy, so it was not opened. The §5.3/§5.8 Stacks counterparts (02SN, 02TG, 02UO) were verified instead.
- **Couveignes 2019 and Česnavičius 2020.** Both are cited in §0.10 and are open on arXiv, but neither is in the manifest. This review edits no manifest, so neither was fetched.
- **Post-merge elaboration.** Only the branch pins can be elaborated with the commands this review allows. R04's `2fd255d9` statement rests on the declarations opened there and on r68's elaboration.
- **Ownership against open pull requests.** I checked it through `scratch/overlaps.md`, `roadmaps grep` for the Azumaya names, and PurityForFlatCohomology's scope. I did not read every open README.

## Source issues

- **Misprint** in zhu-2017 at §A.2.1, p. 49: the source says a reduced `X` is weakly normal when every finite birational universal homeomorphism `Y → X` is an isomorphism, with `Y` unrestricted; it should require `Y` reduced (`Spec k[t,e]/(e², te) → 𝔸¹` is such a map and not an isomorphism, so the normal `𝔸¹` would fail); affects nothing.
