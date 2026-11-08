# Review of JacobianChallenge (pull request #1892 at 5ec759e)

**Verdict:** needs changes

Seven findings, all P3; nothing blocks. This head repairs nine of the previous review's ten findings in full and the tenth (R09) in part; the details open Verified sound. The gate passes. The module elaborates with `sorry` as the only warning. The dependency check reports no UPWARD or CYCLE line. Every sampled locator supports its statement as written.

## R01 (P3) — The Layer B heading changes an anchor that three open roadmaps link to

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md` line 361: "## Layer B: coherent cohomology over `k`: Serre duality, genus, Riemann–Roch".

**Claim.** Renaming the heading is harmless.

**Witness.** On main the heading reads "genus, Riemann–Roch, Serre duality", so the anchor `#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality` is dropped. Three open pull requests link to it:

- AbundanceStatement README line 64 (#545);
- CrystallineCohomology README line 3450 (#857);
- AnabelianGeometryAndNonabelianChabauty README lines 5342 and 5448 (#1021).

**Repair.** Restore the word order of main: `## Layer B: coherent cohomology over `k`: genus, Riemann–Roch, Serre duality`. Its anchor is exactly the old one: the slug drops the colons, the comma and the en dash.

No other anchor moves. The Layer A, C, D, E and F headings keep main's anchors, and the open links to the Layer A and Layer F anchors resolve at this head. No roadmap cites the new `X.n` subsection numbers, so no old → new table is needed.

## R02 (P3) — D.5 and D.8 both prove `isRepresentable_picZeroSets`, and each leaves the identification to the other

**Location.**

- D.5, lines 828–830: "`relativePicardDegreeZeroFppfSheaf X.hom` is represented … by an open and closed subgroup scheme `Pic⁰_{X/k}` of `picardScheme X.hom`; D.8 identifies it with the Jacobian scheme."
- D.8, lines 926–930: "The descended `k`-scheme represents `picZeroSets X` … this proves `isRepresentable_picZeroSets` … which D.5 identifies with …".

**Claim.** Galois descent is needed to represent the degree-zero Picard sheaf without a rational point.

**Witness.** D.5 gets the representation over `k` from D.4's `hasPicardScheme_of_curve` ("with no rational point", line 798) and the local constancy of the degree (Stacks 0B9T). D.8 then builds the same object a second time, by `DescentDatum`, Stacks 01ZY, 0245 and 0AP4 and gluing, and points back to D.5.

**Repair.** Keep a single route. The recommended one keeps D.5's representation and moves only the properties to `l`:

- **D.5.** After "of `picardScheme X.hom`", replace "; D.8 identifies it with the Jacobian scheme" with: "This is `isRepresentable_picZeroSets`. `jacobianScheme X ≅ Pic⁰_{X/k}` compatibly with the representations, by `Functor.RepresentableBy.isoReprX`."
- **D.8.** Replace lines 914–930, from "Tau Ceti's `relativePicardDegreeZeroFunctorBaseChangeIso`, after sheafification," to "of `picardScheme`.", with: "D.2's base change gives `(picardScheme X.hom)_l ≅ picardScheme (X_l).hom`. The degree-zero pieces match, because the fibre degree does not change under field extension (A.3). Hence `(jacobianScheme X)_l ≅ Pic⁰_{X_l/l}`, which D.6–D.7 make smooth, projective and geometrically connected of dimension `g`." Keep the descent of properties along `Spec l ⟶ Spec k` (SchemeAndStackFoundations §0.11).
- **Remove what only the descent used.** Drop `DescentDatum` and `DescentDatum.exists_isAffine_baseChange_hom_isIso` from D.8's *Needs:*, from the Layer D Dependencies and from the Tau Ceti contract (line 244).
- **Update the wording.** Drop "by Galois descent" from lines 34 and 272 and from the D.8 heading (line 906). In line 16, replace it with "over any field". In `Suggested.lean` line 140, change "(the README builds the representing scheme by Galois descent)" to "(README D.5 represents it inside the Picard scheme)".

Tested on two curves:

- The pointless conic over `ℝ`: D.5 alone gives `Pic⁰ = Spec ℝ`, the degree-zero component of `∐_ℤ Spec ℝ`, with no field extension.
- Selmer's cubic: D.5 gives `Pic⁰` over `ℚ`. Properness and geometric integrality are checked over an `l` with `X(l) ≠ ∅`.

If the descent route is kept instead, delete D.5's representability sentence and its "no rational point" (line 822), and let D.8 alone prove `isRepresentable_picZeroSets`.

## R03 (P3) — E.1 states the theorem of the cube only on `A × A × A`, below its source and below a consumer's contract

**Location.** E.1, lines 984–988: "Prove the theorem of the cube for invertible sheaves on an abelian variety's triple product … (Milne, *Abelian Varieties*, I §5, Theorem 5.1 …)".

**Claim.** The cited theorem is the abelian-variety case.

**Witness.**

- Milne I Theorem 5.1 (p. 21) is stated for complete, geometrically irreducible `U`, `V`, `W` with rational base points.
- ArakelovGeometryAndAbelianHeightsPartII (#1833) declares this general form as a contract on "JacobianChallenge Layer E" (README lines 13, 125 and 1666). That roadmap comes later in the merge order (line 338).

**Repair.** Make E.1 begin: "Prove the theorem of the cube for complete geometrically irreducible varieties `U`, `V`, `W` over `k` with rational points `u₀`, `v₀`, `w₀`: an invertible sheaf on `U × V × W` whose restrictions to `U × V × {w₀}`, `U × {v₀} × W` and `{u₀} × V × W` are trivial is trivial (Milne I Theorem 5.1, p. 21). For an abelian variety `A`, deduce …". The rest of E.1 stays as it is.

Then:

- Add the Check: on `ℙ¹ × ℙ¹ × ℙ¹`, `𝒪(1, 0, 0)` is trivial on `{u₀} × ℙ¹ × ℙ¹` but restricts to `𝒪(1, 0)` on the other two faces, so triviality on one face does not suffice.
- List ArakelovGeometryAndAbelianHeightsPartII among the downstream consumers of E.1.

Tested: take `U = V = W = A` and Milne's sheaf `m₁₂₃^*L ⊗ m₁₂^*L⁻¹ ⊗ m₁₃^*L⁻¹ ⊗ m₂₃^*L⁻¹ ⊗ p₁^*L ⊗ p₂^*L ⊗ p₃^*L` (Corollary 5.2). Its restriction to `A × A × {0}` is `m₁₂^*L ⊗ m₁₂^*L⁻¹ ⊗ p₁^*L⁻¹ ⊗ p₂^*L⁻¹ ⊗ p₁^*L ⊗ p₂^*L ≅ 𝒪`, and the other two faces are symmetric. So the general statement gives back E.1's abelian-variety form.

## R04 (P3) — Downstream consumers misdescribes ModularCurves

**Location.** Lines 1285–1286: "ModularCurves imports this roadmap's module for its Picard and Jacobian contracts".

**Claim.** ModularCurves imports this module and consumes its Picard and Jacobian.

**Witness.** ModularCurves on main, README lines 76–88 and 585–588, consumes three contracts "as prose":

- invertible sheaves and divisors;
- Riemann–Roch and Serre duality;
- proper-flat cohomology, Grauert's theorem and base change.

Its `Suggested.lean` imports "nothing from another roadmap", and its Layer 2D owns the relative Picard sheaf of an elliptic curve (line 60). No roadmap file on main imports this module.

**Repair.** Replace the clause with: "ModularCurves consumes, as prose contracts, Layer A's invertible sheaves, divisor–line-bundle correspondence and base change of `𝒪(D)`, Layer B's Riemann–Roch and Serre duality, and Layer C's proper-flat cohomology, Grauert's theorem and base change; its own Layer 2D represents the degree-zero relative Picard sheaf of an elliptic curve over an arbitrary base."

## R05 (P3) — D.1's locators do not contain the five-term obstruction sequence

**Location.** D.1, lines 700–705: "Prove the obstruction sequence `0 → Pic(T) → Pic(X_T) → Pic_{X/k}(T) → H²_fppf(T, 𝔾_m) → H²_fppf(X_T, 𝔾_m)` … (Stacks 0B9N; Kleiman, *The Picard scheme*, Theorem 2.5, pp. 17–18)".

**Claim.** The cited results state this sequence.

**Witness.**

- Kleiman's Theorem 2.5 (p. 18 of the arXiv version) only compares the four Picard functors.
- The five-term sequence is (2.11.4), in Remark 2.11, pp. 20–21.
- Stacks 0B9N (Lemma 4.3 of *Picard Schemes of Curves*) is the split sequence `0 → Pic(T) → Pic(X_T) → Pic_{X/S}(T) → 0` when `f` has a section.

**Repair.** Make the parenthesis "(Kleiman, Remark 2.11, sequence (2.11.4) and the paragraph after it, pp. 20–21)". Cite Stacks 0B9N at "The section `x₀` rigidifies it … and removes that obstruction" (lines 696–697), which is what it proves.

Tested on the pointless conic `C/ℝ` with `T = Spec ℝ`. The sequence reads `0 → Pic(Spec ℝ) = 0 → Pic(C) = 2ℤ → Pic_{C/ℝ}(ℝ) = ℤ → Br(ℝ) = ℤ/2 → Br(C)`. The degree-one class goes to the class of the conic's quaternion algebra, and `Br(C)` kills that class. The sequence is exact. The section case (`ℙ¹_k` with a rational point) is 0B9N.

## R06 (P3) — The Tau Ceti contract omits declarations the layers consume, and Layer F's Dependencies omit Layer C

**Location.** "From Tau Ceti", lines 162–248, and the Layer F Dependencies, line 1263: "Layers B, D, E".

**Claim.** The contract lists what is consumed from Tau Ceti.

**Witness.**

- D.6 and D.8 consume `AbelianVariety.TangentSpace` (`AbelianVariety/TangentSpace.lean:85`) and `finrank_tangentSpace_eq_dim` (`:193`), which the previous review's R09 asked to add.
- F.3 and `Suggested.lean` line 295 use `AbelianVariety.baseChange_toOver` (`AbelianVariety/Basic.lean:292`).
- None of the three is in the contract.
- F.3's *Needs:* includes C.2, so Layer F depends on Layer C.

**Repair.** Add to "From Tau Ceti" (paths under `TauCeti/AlgebraicGeometry/`):

- `AbelianVariety.TangentSpace` and `finrank_tangentSpace_eq_dim` (`AbelianVariety/TangentSpace.lean`);
- `AbelianVariety.baseChange_toOver` (`AbelianVariety/Basic.lean`);
- `relativePicardDegreeZeroFunctorBaseChangeRepresentableBy` (`PicardFunctor/PicZero/BaseChange.lean`, used in F.3);
- `rigidifiedPicardDegreeZeroFunctor` (`PicardFunctor/PicZero/Rigidified.lean`, used in D.8);
- the B.1 inputs:
  - `Scheme.Modules.subsingleton_cohomologyOn_succ_of_isAffineOpen` (`Cohomology/Affine.lean`);
  - `Scheme.Modules.homologyCechComplexIsoCohomology` (`Cohomology/Cech/Basic.lean`);
  - `Scheme.Modules.subsingleton_cohomology_of_two_le_of_smooth` and `Scheme.Modules.finiteDimensional_cohomology_of_smooth` (`Curves/Cohomology.lean`);
- the C.1 inputs:
  - `Scheme.Hom.higherDirectImageRestrictIso` (`Cohomology/HigherDirectImage/Restrict.lean`);
  - `Scheme.Hom.isZero_higherDirectImage_succ_of_isAffineHom` (`Cohomology/HigherDirectImage/Affine.lean`);
- the B.2 inputs:
  - `nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual` (`Modules/Differentials/Canonical.lean`);
  - `InvertibleSheaf.nonempty_cohomologyOneDualEquivCohomologyZero_tensor_dual` (`LineBundle/SerreDuality.lean`);
  - `SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero_symm_apply_repartitionToCohomologyOne` (`WeilDivisor/Scheme/SerreDuality.lean`).

If R02 keeps the descent route, name `TauCeti.DescentDatum` with its file, `CategoryTheory/Limits/Shapes/Pullback/DescentDatum.lean`. Tau Ceti also has `TauCeti.Algebra.DescentDatum` (`RingTheory/Flat/EffectiveDescent.lean`), and `exists_isAffine_baseChange_hom_isIso` is about the first.

Change the Layer F Dependencies to "Layers B–E".

## R07 (P3) — The module docstring's reason why the trace is not statable contradicts B.2 and the pin

**Location.** `Suggested.lean` lines 38–40: "the Serre-duality trace as a named map (it needs the repartition description of `H¹(X, Ω_{X/k})` and residues at closed points of arbitrary residue field; …)".

**Claim.** The pin lacks residues at closed points of arbitrary residue field.

**Witness.**

- B.2 (lines 402–404) defines that residue as Tau Ceti's `repartitionDualComponent` evaluated at `1`, which exists at the pin (`FieldTheory/FunctionField/Differential/LocalComponent.lean:84`).
- `SchemeWeilDivisor.repartitionQuotientEquivCohomologyOne` (`WeilDivisor/Scheme/PrincipalParts/RepartitionCohomology.lean:262`) describes `H¹(X, 𝒪_X(D))` by repartitions.

**Repair.** Replace the parenthesis with: "(the pin describes `H¹(X, 𝒪_X(D))` by repartitions, `SchemeWeilDivisor.repartitionQuotientEquivCohomologyOne`, and has the local components `repartitionDualComponent`; it reaches `H¹(X, Ω_{X/k})` only through `relativeDifferentialsIsoDivisorSheaf`, which needs an integral curve and takes a separating transcendental element and the divisor of its Weil differential as data, so a trace free of these choices on every smooth proper curve, connected or not, is B.2's target; the duality statement quantifies the trace existentially instead)."

The pin bears this out: `relativeDifferentialsIsoDivisorSheaf` (`Modules/Differentials/Canonical.lean:170`) has `[IsIntegral X]`, `ht : Transcendental k t`, `K` and `hK` among its arguments.

## Verified sound

**Previous review, finding by finding.**

- **R01 (Gorenstein duality owned elsewhere): repaired.** B.4 is now "Riemann–Roch and Serre duality for line bundles" (line 490). Lines 54–58 defer the Cohen–Macaulay and Gorenstein case to SchemeAndStackFoundations §2.20 (`cm_serre_duality`, `curve_dualizing_comparison`) and §3.3 (`vectorBundle_riemann_roch`, `curve_serre_duality`), and to StableReduction contract J-B / SR-2. "Gorenstein" now occurs only in that deferral, and `Scheme.IsCurveOver` and `IsIwanagaGorenstein` are gone from both files.
- **R02 (existential base change): repaired.** The `Nonempty` statement is gone. `abelJacobiBaseChange` (lines 289–295) and `isAlbanese_baseChange_abelJacobi` (lines 303–310) state the pointed form. The docstring (lines 41–44) names the pointless representation as not statable, and F.3 (lines 1215–1238) matches.
- **R03 (two owners of the Picard scheme): repaired on this side.** Lines 45–52 make D.2 the owner of `HasPicardScheme`, `picardScheme` and `picardSchemeIso` and hand §0.3 of JacobianChallengePartII the curve-family proof. Lines 1288–1291 list it as a consumer. At #1225's head, JacobianChallengePartII §0.3 still defines the relative Picard scheme as "Mathlib's `Functor.reprX` of that functor". It is later in the merge order (line 69 against line 1), so citing D.2's `picardScheme` is its repair, not this roadmap's.
- **R04 (pinned results planned again): repaired.** Lines 70–77 and 193–227 cite all 14 declarations of the previous table. C.1 (lines 539–543), C.2 (575–577, 586–588, 595–599), A.3 (319–334), B.4 (492–500) and F.2 (1181–1184) each state what remains and how it differs from the pinned result.
- **R05 (false C.3 Check): repaired.** Lines 631–637 use `ℙ¹_A ∖ {∞₀}`. I recomputed it: `H⁰ = A` by codimension two in the regular `ℙ¹_A`, while `lim_n (A/tⁿ)[x] = A⟨x⟩`.
- **R06 (dual of the tangent space): repaired.** Line 1185 reads "`T_0 J = H¹(X, 𝒪_X) ≅ H⁰(X, Ω_{X/k})^∨`".
- **R07 (Hilbert scheme built twice): repaired.** Representability is stated once, in C.4 (lines 641–660), with its Lean form under the Layer C heading (`Suggested.lean` line 88). The Abel maps are stated once, in D.5 (lines 836–849). Every *Needs:* in Layer D points backwards: D.5 needs B.4, C.2, C.4, D.2 and D.4; D.6 needs D.4–D.5; D.7 needs D.4–D.6; D.8 needs D.2–D.7.
- **R08 (torsion contract): repaired.** E.7 (lines 1110–1117) adds the finite étale `A[n]` with `A[n](k^sep)` free over `ℤ/n` of rank `2 dim A` and its Galois action. The Check at lines 1127–1130 cites `WeierstrassCurve.natCard_comp_mulBy_eq_one` (`EllipticCurve/Scheme/FieldPoints.lean:183`), and Downstream lists J-A1 through J-E (lines 1275–1280).
- **R09 (pins described wrongly): partly repaired.** The docstring (lines 45–48) and the attribute (line 78) are fixed, and D.6 and D.8 cite `AbelianVariety.TangentSpace` and `finrank_tangentSpace_eq_dim`. The Tau Ceti contract still lacks them; see R06 of this review.
- **R10 (locators): repaired.**
  - (a) Line 1190 and `Suggested.lean` line 276 cite Milne III Propositions 2.1 and 2.3.
  - (b) Lines 924–926 cite Stacks 0245 and 0AP4, and 0CDR is now described as the dictionary "for quasi-coherent modules".
  - (c) Line 586 cites Stacks 0B9T.

**Gate, build, dependency check.**

- My gate run at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- `lake env lean` on `TauCetiRoadmap/JacobianChallenge/Suggested.lean` exits 0 with 14 warnings, all "declaration uses `sorry`", at lines 66, 79, 95, 126, 142, 179, 192, 218, 228, 236, 259, 267, 277 and 303.
- The dependency check with `--movable` reports `depcheck: 238 roadmaps, 2342 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. JacobianChallenge is line 1 of the merge order, and its roadmap suppliers (SchemeAndStackFoundations) are on main.
- `git diff --stat origin/main...HEAD` lists only the README and `Suggested.lean` of this folder.
- The pins are the same as main's: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

**Signatures.** I elaborated `#check @` for all 27 declarations in one scratch copy.

- Every type matches the worker's `signatures.md` and the README's statement.
- Every `def`, `abbrev` and `instance` carries `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` explicitly, so none loses a binder.
- The three genus statements carry the `FiniteDimensional` instance that `Scheme.genus` needs.
- `multiplication_etale_iff` carries `0 < A.dim`, with `A.dim : WithBot ℕ∞`.

Nothing changed.

**Padding probe.** I replaced each of the 14 `sorry`s in scratch copies with `first | T | sorry`, for `T` = `infer_instance`, `simp`, `rfl` and `aesop`. None closes.

- `simp` makes progress without closing on lines 222, 231 and 239; `aesop` fails exhaustively on lines 222, 231, 239, 272 and 282.
- One library lemma does not suffice either. The pin has representability instances only for `d = 0, 1` (`EffectiveCartierDivisor/Representable.lean:94, 160`) and isogeny results only for `n = −1` (`AbelianVariety/Isogeny.lean:150`) and `n = 0` (`DimensionZero.lean:120`). It has no finite-dimensionality result for a general proper scheme; only curves (`Curves/Cohomology.lean:128, 159`) and `ℙ¹` are covered.

**Headline theorems** (Summary, Layers B–F) and their status in `Suggested.lean`:

| Headline | Status |
|---|---|
| finite-dimensional coherent cohomology on proper `X/k` | stated (`finiteDimensional_cohomology`) |
| Serre duality through a trace | stated, with the trace quantified; the named trace is in the docstring as not statable (R07 corrects the reason) |
| Hilbert scheme of points of a curve | stated |
| Picard scheme of the curve without a point | stated (`hasPicardScheme_of_curve`, with the three definitions) |
| `Jac X` represents `Pic⁰` over any field | stated (`isRepresentable_picZeroSets`, `jacobianScheme`, `JacobianVariety`) |
| `Jac X` proper, geometrically integral, `dim = g` | stated |
| Albanese property; closed immersion for `g ≥ 1`; isomorphism for `g = 1` | stated |
| field base change | pointed Albanese form stated; the pointless representation is in the docstring (no base-change isomorphism for `relativePicardDegreeZeroFppfSheaf` at the pin; confirmed, only the presheaf versions at `PicZero/BaseChange.lean:158, 234`) |
| `[n]` an isogeny; `[n]` étale iff `(n : k) ≠ 0` | stated |
| dual, polarizations, theta, autoduality | in the docstring; confirmed: `AbelianVariety/` at the pin has `Albanese`, `Basic`, `DimensionZero`, `End`, `Hom`, `Isogeny`, `MorphismGroup`, `Product`, `TangentSpace`, `Trivial`, and no dual carrier |

**Library declarations opened at the pins** (61; paths under `TauCeti/` unless marked Mathlib):

- Picard functors: `relativePicardFppfSheaf` (type `Sheaf (fppfTopology.over S) AddCommGrpCat`, no hypotheses), `relativePicardDegreeZeroFppfSheaf` (needs `IsProper`, `SmoothOfRelativeDimension 1`, `GeometricallyConnected`), `relativePicardDegreeZeroFppfSheafι` (`PicZero/Fppf.lean:192`), `relativePicardPresheafBaseChangeIso` (`PicardFunctor/BaseChange.lean:115`), `relativePicardDegreeZeroFunctorBaseChangeIso` and `…RepresentableBy` (`PicZero/BaseChange.lean:158, 234`), `relativePicardFiberDegree` (`PicZero/Basic.lean:141`), `rigidifiedPicardFunctor` (`Rigidified.lean:70`), `rigidifiedPicardDegreeZeroFunctor` and `…Iso` (`PicZero/Rigidified.lean:108, 255`), `abelJacobiMapOfDegree` (`Abel/Degree.lean:110`), `abelJacobiMapToPicZeroFppf` (`Abel/Fppf.lean:91`), `abelJacobiMap_app_injective_of_genus_pos` (`Abel/PointSeparation.lean:119`).
- Divisors and degree: `relativeEffectiveCartierDegreeSubfunctor` (needs `IsProper`, `RelativeDimensionLE 1`) and `relativeEffectiveCartierDegreeOneSection` (`Degree/Basic.lean:85`), `Scheme.CartierDivisor.ClassGroup`, `principalSubgroup_eq_ker`, `classGroupAddEquivLineBundleClass`, `nonempty_iso_sheaf_iff` (`CartierDivisor/ClassGroup.lean:68, 61, 123, 158`), `LineBundleClass` (`LineBundle/Class.lean:50`), `LineBundleClass.picZero` (`WeilDivisor/Scheme/PicZero.lean:92`, `= ker eulerDegreeHom` at `:97`), `LineBundleClass.eulerDegree_mul`, `SchemeWeilDivisor.relativeDegree_principalDivisor`, `InvertibleSheaf.eulerDegree_eq_relativeDegree` (`EulerCharacteristic.lean:343, 256, 303`), `InvertibleSheaf.eulerDegree_eq_finrank_mul` (`LineBundle/Degree.lean:157`), `InvertibleSheaf.eulerCharBelow_eq_relativeDegree_add_one_sub_genus` (`RiemannRoch/Basic.lean:263`; it needs a rational point), `InvertibleSheaf.finrank_cohomology_zero_sub_finrank_cohomology_zero_tensor_dual` (`LineBundle/SerreDuality.lean:204`; no rational point, `k` integrally closed in `k(X)`).
- Cohomology: `Scheme.genus` (guarded by `FiniteDimensional`, value in `ℕ`), `finiteDimensional_cohomology_one_trivial_of_smooth` (`RiemannRoch/Finiteness.lean:79`), `bijective_cohomologyBaseChange`, `cohomologyBaseChangeLinearEquiv`, `finrank_cohomology_pullback_eq_of_isPullback` (`Cohomology/FlatBaseChange.lean:185, 241, 277`), `genus_eq_of_isPullback_of_smooth` (`Curves/Genus/BaseChange.lean:72`), `upperSemicontinuous_finrank_cohomology_one_fiber` (`Semicontinuity.lean:130`), `bijective_cohomologyBaseChange_zero_of_subsingleton_cohomology_one` (`CohomologyAndBaseChange.lean:113`), `higherDirectImageRestrictIso`, `isZero_higherDirectImage_succ_of_isAffineHom`, `isFinitePresentation_higherDirectImage_of_isFinite`, `isZero_higherDirectImage_succ_of_isClosedImmersion` (`HigherDirectImage/Restrict.lean:52`, `Affine.lean:109, 120`, `ClosedImmersion.lean:44`), `free_cohomology_zero_twistingSheaf` and `subsingleton_cohomology_twistingSheaf_of_lt_card` (`ProjectiveSpace/TwistingSheaf.lean:113`, `HigherCohomology.lean:740`), `subsingleton_cohomologyOn_succ_of_isAffineOpen` (`Affine.lean:243`), `homologyCechComplexIsoCohomology` (`Cech/Basic.lean:103`), `subsingleton_cohomology_of_two_le_of_smooth` and `finiteDimensional_cohomology_of_smooth` (`Curves/Cohomology.lean:149, 159`), `FinitelyPresentedSheaf` (`FinitelyPresentedSheaf/Basic.lean:48`).
- Differentials and duality: `relativeDifferentialsIsoDivisorSheaf` (`Modules/Differentials/Canonical.lean:170`), `eulerDegree_relativeDifferentials`, `finrank_cohomology_zero_relativeDifferentials`, `finrank_cohomology_zero_sub_finrank_cohomology_zero_differentials_tensor_dual`, `nonempty_cohomologyOneDualEquivCohomologyZero_differentials_tensor_dual` (`Canonical.lean:305, 262, 286, 248`), `SchemeWeilDivisor.repartitionToCohomologyOne`, `repartitionQuotientEquivCohomologyOne` (`RepartitionCohomology.lean:155, 262`), `cohomologyOneDualEquivCohomologyZero` and its `_symm_apply_…` lemma, `finrank_cohomology_zero_trivial_eq_one_of_isIntegrallyClosedIn`, `genus_eq_genus_functionField` (`WeilDivisor/Scheme/SerreDuality.lean:122, 137, 236, 245`), `weilDifferentialOfSeparating`, `kaehlerDifferentialEquivWeilDifferentialOfSeparating` (`Differential/Comparison.lean:91, 156`), `repartitionDualComponent`, `apply_eq_finsum_repartitionDualComponent`, `finsum_repartitionDualComponent_eq_zero` (`LocalComponent.lean:84, 186, 219`), `Place.traceResidue_coord_smul_eq_repartitionDualComponent` (`Independence.lean:275`).
- Abelian varieties: `AbelianVariety.dim : WithBot ℕ∞`, `IsAlbanese` (implicit `J`, takes the base point and the map), `IsIsogeny`, `mulBy`, `Hom.toSchemeHom`, `baseChange_toOver` (`Basic.lean:292`), `TangentSpace` and `finrank_tangentSpace_eq_dim` (`TangentSpace.lean:85, 193`), `WeierstrassCurve.toAbelianVariety`, `projModelPointsMulEquiv`, `pointAddEquivPicZero`, `natCard_comp_mulBy_eq_one` (`EllipticCurve/Scheme/AbelianVariety.lean:65`, `GroupLaw.lean:117`, `PicZero.lean:120`, `FieldPoints.lean:183`), `TauCeti.DescentDatum` (`CategoryTheory/Limits/Shapes/Pullback/DescentDatum.lean:86`; distinct from `TauCeti.Algebra.DescentDatum`, `RingTheory/Flat/EffectiveDescent.lean:147`) and `DescentDatum.exists_isAffine_baseChange_hom_isIso` (`Descent/Affine.lean:532`; affine `X` over affine `S'`, flat `p`).
- Mathlib: `isCommMonObj_of_isProper_of_geometricallyIntegral` (`AlgebraicGeometry/Group/Abelian.lean:131`), `ClassGroup.equivPic` (`RingTheory/PicardGroup.lean:876`), `Functor.RepresentableBy.isoReprX` (`CategoryTheory/Yoneda.lean:572`), `HasPullback`, `LocallyOfFinitePresentation`.

**Cross-roadmap citations resolved** (main 5556a3f, open heads of the 2026-11-08 index):

- SchemeAndStackFoundations on main. These sections exist with the cited names:
  - §0.9 (line 848), §0.11 (938), §1.1 (2071), §2.2 (3309), §2.6 (3437), §2.11 (3656);
  - §2.20 (4275: `cm_serre_duality` 4352, `curve_dualizing_comparison` 4358);
  - §3.3 (4713: `vectorBundle_riemann_roch` 4735, `curve_serre_duality` 4741);
  - §3.6 (4905: `picardComponent` 4907, `picardComponent_torsor` 4914), §3.7 (4937);
  - §4.9 (5448: `Scheme.Modules.Cohomology.formalFunctionsIso` planned at 5456–5457; this resolves the resolver's one lead), §4.12 (5613: `chow_lemma` 5625), §4.14 (5706).
- The target-level direction is unchanged from main and accepted by the dependency check. Layer C feeds §4.9, which feeds C.3 and D.4. §4.14 needs Layer C and StableReduction Layer 2, which uses only contracts J-A1, J-A2, J-B, J-C and J-B / SR-2 (StableReduction README line 407). So there is no cycle through Layer D.
- StableReduction on main: contracts J-A1–J-E (README lines 302–309) match Downstream.
- EtaleCohomologyFoundations §0.11 (line 1157), AlgebraicCurves Layer 12 (line 1801), EnhancedDerivedSheaves E2.8 (lines 27, 137), AdicSpacesPartIII (line 401) and AlgebraicVectorBundles (lines 403–406) match their Downstream entries. ModularCurves does not (R04).
- JacobianChallengePartII at #1225: §§0.1–0.4, 2.1 and 2.6 exist (headings at lines 144, 154, 175, 199, 328, 401).
- Observation for SchemeAndStackFoundations' maintainers, not a finding here: SchemeAndStackFoundations §3.6 on main defines `jacobian X := Pic⁰_{X/k}` and proves `jacobian_dim`. These restate D.8's `JacobianVariety` and `dim_jacobianVariety`. §3.6 *Needs* JacobianChallenge Layers D–E, so this roadmap is the owner and the citation belongs in §3.6.

**Overlaps.**

- #1187, the Tau Ceti bump, conflicts textually, but its target `ab00ba392` (2026-10-19) is an ancestor of the pin 2fd255d9 (checked with `git merge-base`), so it is superseded.
- No id cited here is dropped by an open pull request, and no id cited here is defined only by an open revision.
- The one id this pull request drops is R01's.
- I searched every open head and main by object for `HasPicardScheme`, `picardScheme`, `jacobianScheme`, `JacobianVariety`, the Hilbert scheme of points (`Hilbᵈ`, `relativeEffectiveCartierDegreeSubfunctor`), the theorem of the cube, the Serre-duality trace, Kleiman's Lemma 4.9 and the Brauer obstruction sequence. Results:
  - HyperellipticCurves (#1707) and GroupActionsOnRiemannSurfaces (#1728) consume `JacobianVariety`.
  - AbelianSchemesAndArithmeticModuli (#849, merge order 41) owns the cube over a general base and consumes Layer E.
  - ArakelovGeometryAndAbelianHeightsPartII (#1833) declares the general cube on Layer E (R03).
  - ComplexComparisonPartII (#848, merge order 39) proves the obstruction sequence over a general base and *Needs* this Layer D.
  - AlgebraicModuliForArithmeticGeometry (#853) has a general Hilbert functor as algebraic spaces.
  - None of them is a second owner of an object owned here.

**Sources: the seeded sample.**

*"Cohomology and base change" (C.2), against the Stacks project chapter PDFs:*

- 02KH (Coherent, Lemma 5.2): `f` quasi-compact and quasi-separated, `g` flat, `F` quasi-coherent; (1) is the sheaf statement and (2) the affine `⊗_A B` form, as written.
- 0B91 (Derived Categories of Schemes, Lemma 30.4): `f` proper of finite presentation, `G` finitely presented and flat over `S`; `Rf_*G` is perfect and commutes with arbitrary base change. This supports the bounded complex of finite projective modules over affine `S`.
- 0BDN (Lemma 32.1): upper semicontinuity, under the same hypotheses.
- 0B9T (Lemma 32.2): local constancy of `χ`.
- 02O5 (Proposition 19.1), 02O6 (Lemma 19.2) and 01XK (Lemma 4.6), for C.1: as stated.

The README's statements are at or below the sources' generality. The Grauert and cohomology-and-base-change clauses cite Hartshorne and Mumford; see Not verifiable.

*"Jacobian scheme" (D.8):*

- Stacks 056U (Varieties, Lemma 25.6): separable closed points are dense on smooth `X`, as used.
- 01ZY (Properties, Lemma 30.5): a finite set lies in an affine open given an ample sheaf, which applies to the projective `Pic⁰_{X_l/l}`.
- 0CDR (Descent, Lemma 6.1): Galois descent of quasi-coherent modules, now described as such.
- 0245 (Descent, Lemma 37.1): descent data on affine morphisms are effective.
- 0AP4 (Descent, Lemma 35.13): data effective on a stable open cover are effective.
- Kleiman, Theorem 5.11 (p. 42): `T₀ Pic_{X/k} = H¹(𝒪_X)` over a field.
- Milne, *Abelian Varieties* v2.0, III Proposition 2.1 (printed p. 91): `T₀ J ≅ H¹(C, 𝒪_C)` and `dim J = g`.

All support D.8 as written. The route is redundant, but that is R02, not a locator issue.

*Also checked:*

- Stacks:
  - 0BS2 (Algebraic Curves, Lemma 4.1): (5) holds for quasi-coherent `F` on proper `X` of dimension at most 1, and (6) gives `ω_X ≅ Ω_{X/k}` for smooth `X`. This supports `serreDuality_exists_trace`.
  - 0C1A (Lemma 8.4; needs `H⁰ = k`); 0BUG (8) (geometrically integral implies `H⁰ = k`).
  - 0B9A (Proposition 2.6), 0B9D (Lemma 3.1), 0B9I (Proposition 3.6, geometrically irreducible, as C.4 says).
  - 0A26 (Lemma 43.4); 0B9Z and 0BA0 (separably closed, as the attributes say); 0B9N (R05); 02L6 (Lemma 23.21).
  - 0BFD (Lemma 9.5), 0BFG (Lemma 9.8, degree `d^{2 dim A}`), 0BFH (Lemma 9.9, `A` nonzero, which matches the `0 < A.dim` hypothesis), 03RP (5)–(7) ((7) is stated over an algebraically closed field; for étale `A[n]` the `k^sep`-points are the same).
  - 01XS (the section "Cohomology of projective space", containing Lemma 30.8.1).
- Kleiman: Theorem 2.5 (p. 18), Theorem 4.8 (pp. 27–28), Lemma 4.9 (p. 30), Proposition 5.19 (p. 47), Remark 5.24 (p. 50).
- Milne, printed pages:
  - I Theorems 5.1 (p. 21), 6.4 (p. 29), 7.2 (p. 33), Remark 7.3 (p. 34), Proposition 8.4 (p. 35), Remark 8.7 and Theorem 8.9 (p. 37);
  - the definition of a polarization (I §11, p. 53);
  - III Lemma 2.4 and Proposition 2.3 (p. 92), Theorem 6.6 (p. 105), Lemmas 6.8–6.9 (p. 106), Remark 6.10 and Summary 6.11 (p. 107).

  Lemma 6.9 (`−f^∨` and `φ_{L(Θ)}` are inverse) matches E.6's `q ∘ λ_Θ = [−1]`.

**Adversarial table.**

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| `finiteDimensional_cohomology` | `X = ∅`; `ℙ¹_k`, `𝒪(−2)`; `ℙ²_k`, `𝒪(−3)`; `𝔸¹_k` | `H^i = 0`; `h⁰ = 0`, `h¹ = 1`; `h² = 1`; `H⁰ = k[t]` infinite, excluded by `IsProper` | holds | none |
| `serreDuality_exists_trace` | `ℙ¹_k`, `F = 𝒪(n)` | `dim Hom(𝒪(n), 𝒪(−2)) = max(−1−n, 0) = dim H¹(𝒪(n))^∨` | holds | none |
| same | `X = ∅`; `ℙ¹_L/k`, `[L:k] = 2` separable, `F = Ω`; `ℙ¹ ⊔ E`, `F = 𝒪` | `0 = 0`, `t = 0`; `dim_k Hom = 2 = dim_k H¹(Ω)^∨`, `t = Tr_{L/k} ∘ tr`; `0 + 1 = 0 + 1` | holds | none |
| B.2 negative control | `𝔽_p(t)`, `P : x^p = t`, `η = x^{p−1}dx/(x^p − t)` | `u = 1/x` gives `η = −u⁻¹du/(1 − tu^p)`, `res_∞ = −1`, so `res_P = 1`, while `Tr_{κ(P)/k} = 0` | holds | none |
| B.3 degree formula | `ℙ¹_L/k`; standing curves | `χ_k(Ω) − χ_k(𝒪) = −2 − 2 = −4 ≠ 2g − 2 = −2`; `0C1A` needs `H⁰ = k` | hypothesis needed, as stated | none |
| B.4 Riemann–Roch | pointless conic `C/ℝ`, `P` of degree 2 | `χ(𝒪(P)) = 3 = 2 + 1 − 0` without a rational point | holds | none |
| A.3 base-field Check | conic `→ ℂ` | `deg_ℝ 𝒪(P) = 3 − 1 = 2`; `deg_ℂ = 2`; `χ_ℝ` over `ℂ`: `6 − 2 = 4 = 2·2` | holds | none |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` | `d = 0, 1`; `ℙ¹`, `d = 2`; `ℙ¹_L/k`, `d = 2`; `ℙ¹ ⊔ ℙ¹`, `d = 2` | `Spec k`, `X`; `ℙ²`; `ℙ²_L ⊔ R_{L/k}ℙ¹`, dimension 2; three components of dimension 2; addition `X × X → Sym²X` of degree `2 = 2!/(1!1!)` on each | holds | none |
| `HasPicardScheme` / D.2 Checks | `f = 𝟙 S`; fold map `S ⊔ S → S` | `Pic(T)/Pic(T) = 0`, represented by `S`; the presheaf is `Pic(T)` (`ℤ` on `ℙ¹_k`), which sheafifies to `0`, represented by `S` | holds | none |
| `hasPicardScheme_of_curve` | `ℙ¹_k`; conic `C/ℝ` | `∐_ℤ Spec k`; `∐_ℤ Spec ℝ` with `Pic(C) = 2ℤ ⊊ Pic_C(ℝ) = ℤ` | holds | none |
| D.1 obstruction sequence | `C/ℝ`, `T = Spec ℝ`; `ℙ¹_k` with a point | `2ℤ → ℤ → ℤ/2 → Br(C)`, `1 ↦` the conic's class, killed in `Br(C)`; split by the section | true; locator wrong | R05 |
| `isRepresentable_picZeroSets` (D.5 against D.8) | `C/ℝ`; Selmer cubic over `ℚ` | D.5 alone: `Spec ℝ`, the degree-zero component; `Pic⁰_{X/ℚ}` of dimension 1. D.8 rebuilds both by descent | true, proved twice | R02 |
| `isProper_jacobianScheme`, `geometricallyIntegral_jacobianScheme` | `ℙ¹`; elliptic `E`; genus 2 | `Spec k`; `E`; a 2-dimensional abelian variety: all proper and geometrically integral | holds | none |
| `dim_jacobianVariety` | `ℙ¹`; `E`; Selmer cubic; `y² = x⁵ + 1` | `0 = 0`; `1 = 1`; `1 = 1` (`Jac: x³ + y³ + 60z³ = 0`); `2 = 2` | holds | none |
| `multiplication_isogeny` | `dim 0`, `n = 5`; `E`, `n = −2`; supersingular `E`, `n = p`; `n = 0` excluded | `id`; degree `4`; purely inseparable of degree `p²`; `[0]` is an isogeny only in dimension 0 (`DimensionZero.lean:120`) | holds; the hypothesis is needed | none |
| `multiplication_etale_iff` | `E/𝔽_3`, `n = 2, 3, 6, 0`; `dim A = 0` | étale and `2 ≠ 0`; not étale and `3 = 0`; not étale and `6 = 0`; `[0]` not flat and `0 = 0`; in dimension 0, `[3] = id` is étale while `3 = 0` in `𝔽_3`, so `0 < dim` is needed | iff holds | none |
| `abelJacobi` | base point; `E` with `O`, `P` | `x₀ ↦ 0`; `a_P = t_{𝒪(O − P)} ∘ a_O`, since `𝒪(x − P) = 𝒪(x − O) ⊗ 𝒪(O − P)` | holds | none |
| `isAlbanese_abelJacobi` | `g = 0`; `g = 1` | every pointed `ℙ¹ → A` is constant and factors uniquely through `0`; `a` is an isomorphism and `φ = f ∘ a⁻¹` is a homomorphism by rigidity | holds | none |
| `isClosedImmersion_abelJacobi` | `g = 0` excluded; `g = 1`, `2`, `3` | `ℙ¹ → Spec k` is not; `h⁰(K − x) = g − 1` (`0, 1, 2`), from Riemann–Roch with `h⁰(𝒪(x)) = 1`, so evaluation is surjective | holds | none |
| `isIso_abelJacobi_of_genus_eq_one` | `g = 1`; `g = 2` | closed immersion of integral curves of dimension `1 = 1`; `1 ≠ 2` | holds; hypothesis needed | none |
| `isAlbanese_baseChange_abelJacobi` | `K = k`; `E/ℚ` to `ℂ`; `ℙ¹` | pullback along `𝟙` and `ε` invertible; `a_ℂ` an isomorphism; constant to `Spec K` | holds | none |
| E.1 cube | Milne 5.1 against E.1; `ℙ¹ × ℙ¹ × ℙ¹`, `𝒪(1,0,0)`; Corollary 5.2 sheaf on `A³` | the source is for complete `U, V, W`, E.1 for `A × A × A`; trivial on one face, `𝒪(1,0)` on two; restriction to `A × A × {0}` is `𝒪` | true but narrowed | R03 |
| E.5 and E.6 signs | `E`, `L = 𝒪([0])` | `t_b^{-1}(0) = −b`, so `φ_L(b) = 𝒪([−b] − [0])`; `q(𝒪([−b] − [0])) = −b = [−1]b` | holds | none |
| E.7 torsion | `E` over a separably closed field, `n` invertible; `n = p` | `(ℤ/n)²`, order `n²` = `natCard_comp_mulBy_eq_one`; order `p` or `1` against degree `p²` | holds | none |
| C.2 three-point Check | `[1:0:0]`, `[0:1:0]`, `[1:1:t]` in `ℙ²_{𝔸¹}` | collinear iff `t = 0`; `h⁰ = 1, 0`; `χ = 3 − 3 = 0`; `f_*F = 0` | holds | none |
| C.3 non-proper Check | `ℙ¹_A ∖ {∞₀}` | `H⁰ = A`; `lim (A/tⁿ)[x] = A⟨x⟩ ≠ A` | holds | none |
| D.4 Check | `ℙ¹`, `L = 𝒪(−1)`, `m = 1` | `H¹ = 0`, `H⁰ = 0`; `E = H⁰(𝒪) = k`; `0 ↦ 𝒪(−1)` | holds | none |
| D.5 Checks | `E`, `d = 1 = g = 2g − 1`; genus 2, `AJ_2` | surjective, smooth and birational, so an isomorphism; the fibre over `[K − 2x₀]` is the canonical pencil, `≅ ℙ¹` | holds | none |
| F.2 tangent map | genus `g ≥ 1` | `T_0 J = H¹(𝒪) ≅ H⁰(Ω)^∨`; the dual of `T_xX → T_0J` is evaluation, surjective since `h⁰(Ω(−x)) = g − 1` | holds | none |
| Downstream: ModularCurves | its README lines 76–88, 585 | "imports this roadmap's module" against three prose contracts and no roadmap import | false | R04 |
| Layer B anchor | main heading against this head | `…-genus-riemannroch-serre-duality` against `…-serre-duality-genus-riemannroch` | link broken in 3 open roadmaps | R01 |
| docstring "not statable" reason | `repartitionDualComponent`, `repartitionQuotientEquivCohomologyOne` at the pin | the docstring says absent; both are present (`LocalComponent.lean:84`, `RepartitionCohomology.lean:262`) | inaccurate | R07 |

## Not verifiable

- Hartshorne, *Algebraic Geometry*, II.6.13–6.15, III.5.1–5.2, III §7, III.12.8–12.11: no legal copy. The C.2 cohomology-and-base-change and Grauert clauses were cross-checked against Stacks 0B91, 0BDN and 0B9T, and the standard statements agree.
- Mumford, *Abelian Varieties*, §§5 and 13: no legal copy. Cross-checked against Stacks 0B91 and 0BDN and against Milne I §8 and Kleiman Remark 5.24.
- Serre, *Algebraic Groups and Class Fields*, Chapter II; Stichtenoth, *Algebraic Function Fields and Codes*, Sections I.7 and 4.3; Liu; Bosch–Lütkebohmert–Raynaud, Chapters 8–9: no legal copy. They are cited only as background.
- Milne, *Jacobian Varieties* (Cornell–Silverman): not read. The README's Part III numbering and pages were checked against the *Abelian Varieties* v2.0 notes, which it names, from the author's page.
- Ownership against open pull requests was checked with the roadmap index's search over all open heads, and against the sibling checkouts this brief lists, including #1833.

## Source issues

- **Gap** in milne-av at I §5, Theorem 5.1, pp. 21–27: the notes say themselves that the section must be rewritten to include a complete proof of the theorem of the cube, and the proof given is a sketch; it should give the full argument or cite a complete proof such as Mumford §10; affects the proof.
