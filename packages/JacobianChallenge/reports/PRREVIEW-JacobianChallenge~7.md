# Review of JacobianChallenge (pull request #1892 at e472503)

**Verdict:** needs changes

This is a full review: the folder changed by 157 lines since 098e9fd. There are two findings, both P3, and nothing blocks. The previous review's only finding is repaired. The gate passes. `Suggested.lean` elaborates with `sorry` as its only warning. The dependency check reports no problems.

## R01 (P3) — A.3 says every hypothesis is a pinned result but names none for quasi-compactness

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md`, A.3:
- Lines 426–427: "Every hypothesis is a pinned result."
- Line 438: "It is quasi-compact, being proper over `k`, and separated (`Scheme.IsSeparated.of_isSeparated`)".
- The *Needs:* line (439–448) names no quasi-compactness result.

**Claim.** The names that A.3 and its *Needs:* line list discharge every hypothesis of the results A.3 consumes. One of those results is base-field invariance, `InvertibleSheaf.eulerDegree_pullback` / `LineBundleClass.eulerDegree_pullback`.

**Witness.** Tau Ceti's `eulerDegree_pullback` takes `[CompactSpace X]` (`LineBundle/BaseChange.lean` lines 54 and 73). On the standing curve, `example : CompactSpace X := inferInstance` fails. It closes only through Mathlib's `QuasiCompact.compactSpace_of_compactSpace` (`Morphisms/QuasiCompact.lean:148`), which the README never names.

**Repair.** Three edits, tested together on a scratch copy of the README:
- **A.3, line 438.** Replace "being proper over `k`," with "being proper over `k` (Mathlib's `QuasiCompact.compactSpace_of_compactSpace` applied to its structure morphism),".
- **A.3 *Needs:*, line 448.** Append Mathlib `QuasiCompact.compactSpace_of_compactSpace`.
- **From Mathlib, line 150.** After "a scheme geometrically connected over a field is connected.", add "A scheme quasi-compact over a quasi-compact scheme is quasi-compact, `QuasiCompact.compactSpace_of_compactSpace` (`Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean`)."

**Tests of the repair.**
- The scratch probe sets up the standing curve with `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` over `Spec k`. With `have : CompactSpace X := QuasiCompact.compactSpace_of_compactSpace (X ↘ Spec (.of k))` and the other names A.3 cites, every hypothesis of `LineBundleClass.eulerDegree_pullback` elaborates.
- The negative control `CompactSpace X` by `inferInstance` still fails, so the name is needed.
- `roadmaps resolve` on the edited copy reports no unresolved citation. Run from a scratch path, it does not check Lean names against the pins, so I checked this name at the Mathlib pin directly.

## R02 (P3) — Two base-change targets carry no source locator: D.2's for the Picard scheme and D.8's "Field base change"

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md`:
- D.2, lines 869–873: "base change (for `b : S' ⟶ S` … `picardScheme f' ≅ (Over.pullback b).obj (picardScheme f)` …)".
- D.8, lines 1066–1068: "**Field base change.** For every field extension `K/k`, prove that the base change `(jacobianScheme X)_K` represents the degree-zero Picard fppf sheaf of the curve `X_K`, with no rational point."

**Claim.** Each target has its locator. Neither paragraph cites a source; this README requires one for every theorem.

**Witness.**
- Kleiman, Exercise 4.4 (`kleiman2005` line 1286, p. 27): if the Picard scheme exists, it exists after any base change and is the fibre product with the new base.
- Kleiman, Proposition 5.3 (`kleiman2005` lines 1782–1786, p. 37): over a field, forming `Pic⁰` commutes with extending `k`.

**Repair.**
- **D.2, line 873.** Replace "the adjunction `Over.map b ⊣ Over.pullback b`)" with "the adjunction `Over.map b ⊣ Over.pullback b`; Kleiman, Exercise 4.4, p. 27)".
- **D.8, line 1068.** Replace "with no rational point." with "with no rational point (Kleiman, Exercise 4.4, p. 27, and Proposition 5.3, p. 37)."

**Tests of the repair.**
- Exercise 4.4 assumes only that the Picard scheme exists. That is exactly D.2's hypothesis `HasPicardScheme f`, for an arbitrary `S` and `S'`.
- On D.8's first Check, the pointless real conic `C` with `K = ℂ`:
  - Exercise 4.4 gives `Pic_{C_ℂ/ℂ} = (∐_{d∈ℤ} Spec ℝ) ×_ℝ ℂ = ∐_{d∈ℤ} Spec ℂ`.
  - Proposition 5.3 gives the degree-zero piece `(Spec ℝ)_ℂ = Spec ℂ = jacobianScheme (ℙ¹_ℂ)`, which is what the Check states.
- `roadmaps resolve` on the edited copy reports no unresolved citation.

## Previous findings

- **R01 (r6), separatedness in B.3: repaired.** Lines 606–607 now read "it is separated, its structure morphism being proper (`Scheme.IsSeparated.of_isSeparated`)". The B.3 *Needs:* line ends with `Scheme.IsSeparated.of_isSeparated` (line 614). The Tau Ceti contract bullet at lines 206–208 states the same lemma. A.3 (line 438) and the A Dependencies (line 482) now use it too. The repair goes beyond the previous review's three edits: A.3 now also cites, for the standing curve, `equivCartierDivisor`, `classGroupAddEquivLineBundleClass`, `eulerDegree_mul_of_smooth`, `eulerDegree_pullback` and `connectedSpace_of_subsingleton`. R01 above comes from that new text.
- **r6 remarks on A.3** (base-field invariance and additivity already pinned; no change was requested): addressed. A.3 now consumes `InvertibleSheaf.eulerDegree_pullback`, `LineBundleClass.eulerDegree_pullback` and `LineBundleClass.eulerDegree_mul_of_smooth` instead of re-planning them. A.1 likewise consumes `LineBundleClass.pullbackHom`, `pullbackHom_id`, `pullbackHom_comp` and `pullback_one` instead of planning them.

## Verified sound

**Gate, build and dependency check at e472503.**
- My gate run: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run also reports `build=0`.
- `lake env lean TauCetiRoadmap/JacobianChallenge/Suggested.lean` exits 0 in 28 s with 14 warnings, all "declaration uses `sorry`". They are at lines 70, 83, 99, 130, 147, 185, 198, 224, 234, 242, 265, 273, 283 and 309.
- Dependency check with `--movable`: `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. JacobianChallenge is line 1 of the merge order.
- Nothing changes outside the folder. The pins are Tau Ceti 2fd255d and Mathlib 1b1ccf4.

**Signatures.**
- One scratch file `#check @`s all 27 declarations against the built module. Every elaborated type matches `signatures.md` exactly (27/27 after normalising names), and no section binder is lost.
- Each type matches its README statement in generality:
  - C.4: no geometric connectedness.
  - D.2: an arbitrary `f : X ⟶ S`.
  - E.7: `n ≠ 0`, and `0 < A.dim` for étaleness.
  - `dim_jacobianVariety` and the genus hypotheses: the `FiniteDimensional` binder is required to state `Scheme.genus` (`Cohomology/Genus.lean:64`).

**Padding.** A scratch copy replaces each of the 14 `sorry`s with `first | infer_instance | rfl | simp | decide | trivial | aesop`, each followed by `done`. All 14 still need `sorry`. The definitions have real bodies: `reprX`, `representableBy`, `CommGrpObj.ofRepresentableBy`, structure fields, and the Over-pullback with `eqToHom`. There is no padding.

**Headline theorems.**
- Stated:
  - `isRepresentable_picZeroSets` with `jacobianScheme`, `JacobianVariety` (no rational point).
  - `isProper_jacobianScheme`, `geometricallyIntegral_jacobianScheme`.
  - `dim_jacobianVariety`.
  - `isAlbanese_abelJacobi`, `isClosedImmersion_abelJacobi`, `isIso_abelJacobi_of_genus_eq_one`.
  - `isAlbanese_baseChange_abelJacobi` (pointed field base change).
  - The deep inputs: `finiteDimensional_cohomology`, `serreDuality_exists_trace`, `isRepresentable_relativeEffectiveCartierDegreeSubfunctor`, `hasPicardScheme_of_curve`, `multiplication_isogeny`, `multiplication_etale_iff`.
- Named in the module docstring as not statable, each with its missing carrier or construction:
  - the named residue trace;
  - `Pic^d`;
  - the canonical unpointed representation by `(Jac X)_K` (no sheaf base-change iso at the pin);
  - dual, polarizations and theta;
  - the canonical `T₀ Jac ≅ H¹`.

**Pinned declarations behind the changed text.** I opened each one at the pin and compared its hypotheses with the README. Tau Ceti rows are under `TauCeti/AlgebraicGeometry/`.

| declaration | file:line | hypotheses at the pin | README |
|---|---|---|---|
| `LineBundleClass.pullbackHom`, `_id`, `_comp`, `pullback_one` | `LineBundle/Functoriality.lean:189, 204, 209, 167` | any scheme morphism | matches A.1 |
| `SchemeWeilDivisor.equivCartierDivisor` | `WeilDivisor/Scheme/Cartier/Inverse.lean:341` | `IsIntegral`, `IsNoetherian`, DVR codim-one stalks, `coheight ≤ 1` | matches A.2 / line 184 |
| `SchemeWeilDivisor.classGroupAddEquivLineBundleClass` | `WeilDivisor/Scheme/Picard.lean:252` | same, `coheight ≤ 1` as `Fact` | matches |
| `Scheme.CartierDivisor.classGroupAddEquivLineBundleClass` | `CartierDivisor/ClassGroup.lean:123` | `IsIntegral` | matches (a distinct name) |
| `LineBundleClass.eulerDegree_mul_of_smooth` | `Curves/Degree.lean:55` | `IsProper`, `SmoothOfRelativeDimension 1`, `ConnectedSpace` | matches |
| `Inv./LineBundleClass.eulerDegree_pullback` | `LineBundle/BaseChange.lean:54, 73` | `CompactSpace X`, `IsAffineHom (pullback.diagonal (terminal.from X))`, `IsPullback` square | matches; `CompactSpace` unnamed (R01) |
| `relativeDegree_principalDivisor`, `eulerDegree_eq_relativeDegree`, `eulerDegree_mul` | `WeilDivisor/Scheme/EulerCharacteristic.lean:256, 303, 343` | integral, (locally) Noetherian, DVR stalks, `IsProper`, `coheight ≤ 1`, `H¹` finite | matches |
| `finiteDimensional_cohomology_one_trivial_of_smooth` | `WeilDivisor/Scheme/RiemannRoch/Finiteness.lean:79` | `IsProper`, `SmoothOfRelativeDimension 1`, `ConnectedSpace` | matches |
| `finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn` | `WeilDivisor/Scheme/SerreDuality.lean:236` | integral, DVR stalks, `X.IsSeparated`, `hex`, `hdim`, Noetherian, `hF`, `hk` | matches lines 227–232 |
| `InvertibleSheaf.finrank_cohomology_zero_sub_finrank_cohomology_zero_tensor_dual` | `LineBundle/SerreDuality.lean:204` | same block (line 54) | matches |
| `eulerCharBelow_eq_relativeDegree_add_one_sub_genus` | `WeilDivisor/Scheme/RiemannRoch/Basic.lean:263` | rational section `s` | "with a rational point": matches |
| Mathlib `GeometricallyConnected.connectedSpace_of_subsingleton` | `Geometrically/Connected.lean:98` | `[Subsingleton S] [Nonempty S]` | "over a field": matches |
| `Scheme.IsSeparated.of_isSeparated` | `Morphisms/Separated.lean:83` | `[IsSeparated f] [S.IsSeparated]` | matches |
| `AbelianVariety.IsAlbanese`, `finrank_tangentSpace_eq_dim`, `IsIsogeny`, `dim` | `AbelianVariety/Albanese.lean:84`, `TangentSpace.lean:193`, `Isogeny.lean:61`, `Basic.lean:118` | `x₀ ≫ a = η` plus unique factorization; finite and surjective; `topologicalKrullDim` | matches D.8, E.7, F |

**Standing-curve probe.** A scratch file with `[SmoothOfRelativeDimension 1]`, `[IsProper]` and `[GeometricallyConnected]` over `Spec k` derives, from A.3's names:
- `IsIntegral`, `ConnectedSpace` and `IsCurveOver`;
- `IsNoetherian`, `coheight ≤ 1` and the DVR stalks;
- finiteness of `H¹`;
- `X.IsSeparated`, and from it `IsAffineHom` of the diagonal by instance.

`equivCartierDivisor`, `classGroupAddEquivLineBundleClass`, `eulerDegree_mul`, `eulerDegree_mul_of_smooth`, `picZero`, `relativeDegree_principalDivisor` and `eulerDegree_pullback` then all elaborate. `IsSeparated`, `ConnectedSpace` and `CompactSpace` each fail by `inferInstance`. The first two are named in the README; the third is R01.

**Seeded sample.**
- **"Cohomology and base change" (C.2).** The hypotheses match each Stacks result:
  - Stacks 02KH (Lemma 30.5.2): `f` quasi-compact and quasi-separated, `g` flat, `F` quasi-coherent. Matches lines 707–711.
  - Stacks 0B91 (Lemma 36.30.4): `Rf_*` is perfect and commutes with base change for `f` proper of finite presentation and `F` of finite presentation. This supports the bounded complex `K`.
  - 0BDN (Lemma 36.32.1), upper semicontinuity, and 0B9T (Lemma 36.32.2), local constancy of `χ`: proper of finite presentation, `F` flat. The README's proper, locally Noetherian, coherent and flat hypotheses imply these.
  - Hartshorne III.12.8–12.11 is uncertified and cited "for projective `f`", which is honest. Mumford §5 is under Not verifiable.
- **"Field base change" (D.8).** No locator (R02). The mathematics checks: the fibre of `X_K ×_K T` over a point of a `K`-scheme `T` is that of `X ×_k T`, so the presheaf degree-zero condition is preserved, and Kleiman, Exercise 4.4 and Proposition 5.3, supports the statement.
- **"Properness and geometric integrality" (D.8).**
  - Stacks 056U (Lemma 33.25.6): on a smooth `k`-scheme, closed points with finite separable residue field are dense. This matches; `X` is nonempty because Mathlib's `ConnectedSpace` includes `Nonempty`.
  - SchemeAndStackFoundations §0.11 (main, line 938) descends separated, finite type, proper and smooth along `Spec k' → Spec k`.
  - Stacks 0BA0 (Lemma 44.6.7), over a separably closed field: `Pic^d` are smooth proper varieties of dimension `g`; `γ_d` is surjective for `d ≥ g`, smooth for `d ≥ 2g − 1` and birational for `d = g`. This matches D.5's "(5)–(6)" and the Lean attributes.
  - Kleiman Proposition 5.19 (`kleiman2005` line 2219, p. 47): smooth near `s` when `H²(𝒪_{X_s}) = 0`.
- **"Jacobian" (D.8).**
  - Kleiman Theorem 5.11 (line 2002, p. 42): `T₀ Pic_{X/k} = H¹(𝒪_X)` when `Pic_{X/k}` exists and represents the étale functor.
  - Milne III Proposition 2.1 (`milne-av` line 3702, printed p. 91, PDF p. 97): the tangent space of `J` at 0 is `H¹(C, 𝒪_C)` and `dim J = g`.
  - Milne III Proposition 2.3 and Lemma 2.4 (lines 3747–3756, p. 92) support F.2's route.

**Other locators read this round.**
- Stacks 0BS2 (Lemma 53.4.1) (5): a natural isomorphism `Hom(F, ω_X) ≅ Hom_k(H¹(X,F), k)` for quasi-coherent `F` on a proper `X` of dimension ≤ 1. Item (6): `ω_X ≅ Ω_{X/k}` for `X` smooth of relative dimension 1. By Yoneda, a natural isomorphism is `φ ↦ t ∘ H¹(φ)` with `t` the image of `id_ω`, which is `serreDuality_exists_trace` exactly.
- Stacks 02O6 (Lemma 30.19.2): `A` Noetherian, `f` proper, `F` coherent.
- Stacks 0B9A (Proposition 44.2.6): `Hilbᵈ` is representable when finite sets of fibre points lie in affine opens. "Special case" is accurate through C.4's 0B9D identification.
- Stacks 0B9Z (Proposition 44.6.6): over a separably closed field, so "More general" is accurate.
- Stacks 0BF4 (`stacks-project` line 4825): E.1's field form matches its hypotheses, including the condition that `W` is connected, at an arbitrary point `w₀`.
- Tate 1968:
  - Definition p. 154 (line 234);
  - Theorems 2 and 3 with the Corollary, p. 155 (lines 243–262);
  - Theorem 5 p. 158 (line 371) and its Corollary p. 159 (line 377).

**Cross-roadmap citations** (main 3090489):
- SchemeAndStackFoundations: §0.9 (848), §0.11 (938), §1.1 (2071), §2.2 (3309), §2.6 (3437), §2.11 (3656), §2.20 (4275), §3.3 (4713), §3.6 (4905, `picardComponent_torsor` 4914), §3.7 (4937), §4.9 (5448, `formalFunctionsIso` 5457), §4.12 (5613, `chow_lemma` 5625), §4.14 (5706). These are also present, with the same names, at the heads of #1656 and #1276.
- StableReduction J-B / SR-2 (308) and J-E (310).
- EtaleCohomologyFoundations §0.11 (1159).
- ModularCurves Layer 2D; EnhancedDerivedSheaves E2.8; AlgebraicCurves; AlgebraicVectorBundles; AdicSpacesPartIII.
- JacobianChallengePartII (#1225 head) §§0.1–0.4, 2.1, 2.6, and ArakelovGeometryAndAbelianHeightsPartII §10.9a. Both are consumers, not suppliers.
- The resolver's one lead is `formalFunctionsIso`, planned in SchemeAndStackFoundations §4.9.

**Overlaps and ownership.**
- `overlaps.md` reports no dropped id and no id that only an open revision defines.
- The conflicting bump #1187 moves Tau Ceti to ab00ba392. That commit is an ancestor of the pin 2fd255d (`git merge-base --is-ancestor`), so the bump is superseded.
- JacobianChallengePartII's `RelativeJacobian.isRepresentable_relativePicardFppfSheaf` states `HasPicardScheme f` unfolded, and its §0.3 object is `Functor.reprX` of the same functor. Lines 46–48 are therefore accurate up to the abbreviation, and its Lean declares no second Picard scheme.
- AlgebraicModuliForArithmeticGeometry §7.6.1 (#853, draft) restates Tau Ceti's pinned sheaf as `relativePicardSheaf` with `relativePicardBaseChange`. JacobianChallenge is on main, line 1 of the merge order, and does not depend on it ("nothing here depends on them", line 62). The citation is owed by that roadmap, so it is not a finding here.

**Adversarial table.** Every row is computed this round unless marked (r4).

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| A.3: standing curve meets all cited hypotheses | Lean probe; `ℙ¹_L/k`, `[L:k] = 2`; `ℙ¹_{k'}/𝔽_p(t)`, `k' = k(t^{1/p})` | probe: all close, `CompactSpace` only via an unnamed lemma; `L ⊗_k k̄ = k̄ × k̄`, 2 components; `k' ⊗_k k̄ = k̄[u]/(u − t^{1/p})^p`, nilpotent | holds; list incomplete | R01 |
| `eulerDegree_pullback` (A.3 Check 5) | real conic `C`, closed point `P`, `K = ℂ` | `deg_ℝ = 3 − 1 = 2`; `deg_ℂ 𝒪(2) = 3 − 1 = 2`; `ℙ¹_ℂ` over `ℝ`: `6 − 2 = 4 = [ℂ:ℝ]·2`; a `[K:k]`-rule would give 4 for `deg_ℂ` | holds | none |
| `eulerDegree_mul_of_smooth` | `ℙ¹`, `𝒪(1) ⊗ 𝒪(−3)` | `χ(𝒪(−2)) − χ(𝒪) = −1 − 1 = −2 = 1 + (−3)` | holds | none |
| `equivCartierDivisor` | `ℙ¹`; cusp `y² = x³` | `[0] − [∞] ↔ div(t)`; stalk at the cusp is not a DVR, so the hypothesis excludes it | holds | none |
| Weil `classGroupAddEquivLineBundleClass` | `ℙ¹_k`; `ℙ¹_ℝ` | `Cl = ℤ` by degree, `Pic = ℤ·𝒪(1)`; `[x²+1=0] ↦ 𝒪(2)` | holds | none |
| A.1 `pullbackHom` | squaring map `ℙ¹ → ℙ¹` | `𝒪(1) ↦ 𝒪(2)`: `ℤ →(×2) ℤ`; `𝒪 ↦ 𝒪` | holds | none |
| `connectedSpace_of_subsingleton` | `ℙ¹_L/k`; real conic | geometric connectedness fails (2 components); conic: 1 component | holds | none |
| C.2 flat base change (02KH) | `ℙ¹_k`, `𝒪(−2)`, `K/k` | `H¹ ⊗ K = K = H¹(ℙ¹_K, 𝒪(−2))` | holds | none |
| C.2 complex `K` (0B91) | `ℙ¹_A`, `𝒪(−1)`; `𝒪(n)`, `n ≥ 0` | `K = 0`; `K = A^{n+1}` in degree 0 | holds | none |
| C.2 semicontinuity, `χ` (0BDN, 0B9T) | three sections `[1:0:0], [0:1:0], [1:1:t]`, `F = 𝓘_Z(1)` | `h⁰ = 1` at `t = 0`, else 0; `χ = 3 − 3 = 0` everywhere | holds | none |
| C.2 cohomology and base change | same family | `φ⁰(0): 0 → k` not surjective; `R¹f_*F ⊗ κ(s) = H¹(F_s)`, which is `k` at 0 and 0 elsewhere, so `R¹` is not locally free; the iff agrees | holds | none |
| C.2 Grauert | `ℙ¹_A`, `𝒪(n)` | `h⁰ = max(n+1, 0)` constant, `R⁰` free of that rank | holds | none |
| D.2 base change (Kleiman Ex. 4.4) | conic `C/ℝ`, `b: Spec ℂ → Spec ℝ`; `f = 𝟙 S` | `∐_ℤ Spec ℂ = (∐_ℤ Spec ℝ)_ℂ`; `S' = S ×_S S'` | holds; no locator | R02 |
| D.8 field base change | conic → `ℂ`; elliptic `E/ℚ` → `ℚ(i)`; `K = k` | `(Spec ℝ)_ℂ = Spec ℂ = Jac ℙ¹_ℂ`; `E_{ℚ(i)}`, dim 1 = 1; identity | holds; no locator | R02 |
| D.8 properness / geometric integrality | conic (`l = ℂ`); `y² = x⁵ + 1` over `ℚ` (`l = ℚ`); constant `ℤ/2` | `Spec ℝ`: proper, integral; abelian surface; `ℤ/2` smooth with 2 points, not geometrically connected, so the instance does not apply | holds | none |
| 056U | conic over `ℝ`; `Spec k'`, `k'/k` purely inseparable | points with `κ = ℂ` are dense; not smooth, no separable point, so the hypothesis is needed | holds | none |
| `dim_jacobianVariety` | `ℙ¹`; `E`; `y² = x⁵ + 1` | `0 = 0`; `1 = 1`; `2 = 2` | holds | none |
| `finiteDimensional_cohomology` | `∅`; `ℙ²`, `𝒪(−3)`, `i = 2`; `𝔸¹` | `0`; `1`; `k[t]`, excluded by properness | holds | none |
| `serreDuality_exists_trace` | `ℙ¹`, `𝒪(n)`; `κ(x)`; `⊕_ℕ 𝒪` on `E` | `h⁰(𝒪(−2−n)) = max(−1−n, 0) = h¹(𝒪(n))`; `0 = 0`; `∏_ℕ H⁰(Ω) = k^ℕ = (⊕_ℕ k)^∨` | holds | none |
| `isRepresentable_…DegreeSubfunctor` | `d = 0, 1`; `ℙ¹`, `d = 2`; `X = ∅`, `d = 1` | `Spec k`, `X`; `ℙ²`; `∅` | holds | none |
| C.4 Check 3 | `ℙ¹_{𝔽_q}`, `d = 2`, `q = 2` | `7 = 6 + 1`; `q² + q + 1 = (q+1)(q+2)/2 + (q² − q)/2` | holds | none |
| `hasPicardScheme_of_curve` | `ℙ¹`; conic | `∐_ℤ Spec k`; `Pic_{C/ℝ}(ℝ) = ℤ ⊋ Pic C = 2ℤ` | holds | none |
| `isRepresentable_picZeroSets` | conic; Selmer cubic; `ℙ¹` | `Spec ℝ`; an elliptic curve; `Spec k` | holds | none |
| `multiplication_isogeny` | dim 0; `E`, `n = −2`; `n = p`; `n = 0` | `id`; degree 4; `p²`; constant, not surjective, excluded | `n ≠ 0` needed | none |
| `multiplication_etale_iff` | `E/𝔽₃`, `n = 2, 3, 6, 0`; dim 0, `n = 3` | étale with `2 ≠ 0`; not étale with `3 = 0`, `6 = 0`, `0 = 0`; `[3] = id` étale but `3 = 0` | `0 < dim` needed | none |
| `isAlbanese_abelJacobi` | `g = 0`; `E` with origin `O` | `Jac = Spec k`, unique `φ = 0`; `φ = f ∘ a⁻¹` | holds | none |
| `isClosedImmersion_abelJacobi` | `g = 1, 2, 3`; `g = 0` | `h⁰(Ω(−x)) = g − 1 < g`; constant map from `ℙ¹` | `g ≥ 1` needed | none |
| `isIso_abelJacobi_of_genus_eq_one` | `g = 1`; `g = 2` | `1 = 1`; a curve inside a surface, not an iso | holds | none |
| `isAlbanese_baseChange_abelJacobi` | `K = k`; `E/ℚ → ℂ`; `ℙ¹` | identity; iso; constant to `Spec K` | holds | none |
| B.2 negative control | `𝔽_p(t)`, `η = x^{p−1}dx/(x^p − t)` | `u = 1/x`: `η = −du/(u(1 − tu^p))`, `res_∞ = −1`, so `res_P = 1`; `Tr_{κ(P)/k}` route gives 0 | holds | none |
| B.3 Check 3 | `ℙ¹_L/k`, `[L:k] = 2` | `χ_k(𝒪(−2)) − χ_k(𝒪) = −2 − 2 = −4 ≠ −2` | holds | none |
| B.4 Riemann–Roch | conic, `deg P = 2` | `χ = 3 = 2 + 1 − 0` | holds | none |
| E.1 Check 2 (cube, `U` disconnected) | `E × E`, `Δ − {0}×E − E×{0}` | faces: `[0] − 0 − [0] = 0`; `{a}×E`: `𝒪([a] − [0]) ≠ 0` | holds | none |
| D.1–D.7, E.2–E.6, F.1–F.3 Checks (r4) | as recorded in r4 | as recorded in r4 | holds | none |

## Not verifiable

- **Mumford, *Abelian Varieties*, §5** (C.2, twice). The manifest has no key for it, the sources cache has no copy, and I found no legal open copy, so the locator is unchecked. The statements it supports are also covered by Stacks 0B91, 0BDN and 0B9T, read this round. Liu's *Algebraic Geometry and Arithmetic Curves* appears only in References, without a locator or a manifest key.
- **Settled as uncertified:** Hartshorne (II.6.11, II.6.13–6.16, III.5.2, III.12.8–12.11), Serre, Bosch–Lütkebohmert–Raynaud, Stichtenoth, and Milne, *Jacobian Varieties*. Each is cited by locator only.
- **Stacks tags not in the cache.** Read on the Stacks project site this round: 02KH, 0B91, 0BDN, 0B9T, 056U, 0BA0, 0BS2, 02O6, 0B9A, 0B9Z. Not re-read this round, so their checks rest on earlier rounds: 0B9M, 0B9N, 0B9D, 0B9I, 0B9J, 01ZY, 0A26, 0BUG, 0C1A, 03RP, 0BFE, 0BFG, 0BFH, 02L6, 01TP, 01TX, 01XS, 0897, 02O5, 01XK, 056T, 033M.
- **Ownership against open pull requests.** I checked it with `overlaps.md`, the resolver and `roadmaps grep` over the 458 open heads, and I read JacobianChallengePartII and AlgebraicModuliForArithmeticGeometry §7. I did not re-read every sibling checkout.

## Source issues

- none
