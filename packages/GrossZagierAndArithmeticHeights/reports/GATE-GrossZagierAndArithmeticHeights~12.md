# GATE-GrossZagierAndArithmeticHeights~12: answers to human review

Reviewed head `9d72f01`. Nothing was changed: `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` and `TauCetiRoadmap/GrossZagierAndArithmeticHeights/Suggested.lean` are as at `9d72f01`, and there is no commit.

## H01 (mycaule) — answered
This roadmap does not construct the Néron–Tate pairing. It uses Tau Ceti's `WeierstrassCurve.Affine.neronTatePairing` for elliptic curves (pinned `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:368`), and for abelian varieties it imports Néron–Tate heights and their symmetric bilinear form from HeightsRationalPointsAndObstructions §§0.18–0.21 (README Scope, third and fifth paragraphs; supplier-table rows "From Tau Ceti elliptic …" and "From HeightsRationalPointsAndObstructions …"). So the external `NeronTate/` folder overlaps that supplier, not this roadmap: its `Faltings.IsNeronTateHeight` and the theta-polar `Faltings.neronPairing` on `J(K̄) × J(K̄)` correspond to that roadmap's §0.19 `neronTateHeight` and §0.21 `neronTateForm`. The pairings this roadmap does construct are on other domains: §1.1 on `A × A∨`, with adjunction under `u` and `u∨`, and §§1.2 and 8.7, which take values in a coefficient field.

Evidence:

- **External folder** (AxiomMath/Mordell at `82a30cb`; Apache-2.0; a formalization of Faltings's theorem along Bombieri–Vojta):
  - `NeronTate/Basic.lean` defines `Faltings.IsNeronTateHeight` on the k-points of an abelian variety, for a class in `Pic(A) ⊗ ℚ`, with k algebraic over ℚ.
  - `NeronTate/Pairing/Basic.lean` defines `Faltings.neronPairing` as `QuadraticMap.polar` of ĥ_Θ on the K̄-points of a Jacobian J, where Θ is the theta divisor.
  - `NeronTate/Pairing/Bilinear.lean` proves that this pairing is symmetric and biadditive, on `J × J`.
  - `NeronTate/Functoriality.lean` proves pullback along a homomorphism `φ : A' → A`. It uses no dual abelian variety and no Poincaré bundle.
  - The remaining files (TateLimit, Existence, Uniqueness, Nonneg, Northcott, PositiveDefinite) match HeightsRationalPointsAndObstructions §§0.18–0.20 and §1.8.
- **Supplier text**, read at the head of HeightsRationalPointsAndObstructions (`525f074`):
  - §0.18 is Tate's limit and §0.19 is `neronTateHeight`, with the pullback law ĥ_(f*M)(P) = ĥ_M(fP) − ĥ_M(f0).
  - §0.21 is `neronTateForm` b(P,Q) = ĥ(P+Q) − ĥ(P) − ĥ(Q), together with the Poincaré comparison b(P, φ_L Q).
  - That README does not cite AxiomMath/Mordell. A prior-art citation, which the repository README asks for under "Porting existing work", belongs in its §§0.18–0.21. That roadmap is outside this folder and was not edited.
- **What this roadmap owns.** §1.1 is the canonical height h𝒫 of the rigidified Poincaré bundle on `A × A∨`, with h_B(ux, y) = h_A(x, u∨y). §1.2 is the trace-dual pairing with values in `M ⊗ ℝ`, and §8.7 extends it L-linearly. None of these occurs in the external folder. It reaches `h𝒫` only through the composite h𝒫(x, φ_Θ y) = b_Θ(x, y), and that composite is the §0.21 comparison this roadmap imports.
- **Normalizations agree.** For genus 1, Θ = (O). Then polar ĥ_(O)(P,P) = ĥ_(O)(2P) − 2ĥ_(O)(P) = 4ĥ_(O)(P) − 2ĥ_(O)(P) = 2ĥ_(O)(P) = h_x(P).
  - Tau Ceti: `neronTatePairing W P P = P.canonicalHeight` (`neronTatePairing_self`, line 384), with `canonicalHeight` = h_x.
  - So the external pairing for (O) is README §0.1's B_x, which is also Tau Ceti's `neronTatePairing`.
  - For a Jacobian, the diagonal of the theta polar is ĥ_(2Θ). This is the "class 2Θ" height ⟨a,a⟩_K used in §8.15 (and in §8.6 through Gross–Zagier I (4.3)).
  - No README formula changes.

## Adversarial pass

No statement was added or changed. The one computation this point touches is the normalization of the external pairing against the roadmap's conventions:

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| README §0.1: Tau Ceti `neronTatePairing` = B_x = polar of h_(O) | E with a point P, Q = P; h_x(P) = c | Tau Ceti: B_x(P,P) = ½(h_x(2P) − 2h_x(P)) = ½(4c − 2c) = c. Polar of h_(O) = h_x/2: h_(O)(2P) − 2h_(O)(P) = 2c − c = c | agree | none |
| External `neronPairing` (polar ĥ_Θ) vs README §8.15 "class 2Θ" height | genus 1: Θ = (O); general J: diagonal | polar ĥ_Θ(a,a) = ĥ_Θ(2a) − 2ĥ_Θ(a) = 2ĥ_Θ(a) = ĥ_(2Θ)(a); at genus 1 this is h_x(a) = `canonicalHeight a` | agree | none |
| README §1.1 vs external Functoriality | u = id; u = [n] on an elliptic curve (u∨ = [n]) | §1.1: h𝒫(nx, y) = h𝒫(x, ny) = n·h𝒫(x,y). External: ĥ_(φ*c) = ĥ_c ∘ φ, so for φ = [n] and symmetric c the value is n²ĥ_c (a quadratic, not a bilinear, law) | different statements on different domains | none |

## Ownership and citations

- Ownership was checked against the open roadmap pull requests through the roadmaps tool.
  - HeightsRationalPointsAndObstructions (head `525f074`) owns the general Néron–Tate height and form.
  - It is earlier in the merge order, and this README already cites it, at §§0.11–0.12, 0.16, 0.18–0.21 and 1.7–1.8.
  - That citation was resolved at its head this round. The §0.18, §0.19, §0.20 and §0.21 headings and content are as cited.
- The citations lead list flags three names. They are unrelated to H01 and are left untouched:
  - README 102 `SerreTate.homCriterion` is declared under that name in AbelianSchemesAndArithmeticModuli A4.10 (line 2394 of its README at its head).
  - README 125/262 `CanonicalModel.special_rational` and `CanonicalModel.special_action` refer to the two defining conditions of `TauCeti.Shimura.CanonicalModel` in ShimuraVarieties §4.4: special-point rationality over `E(T,h)^ab`, and the reciprocity action. That roadmap states these conditions in prose without these field names. The names do not claim anything about this roadmap or the pins, so they do not affect the gate. A later round could align them with ShimuraVarieties' wording.

## Suggested.lean signatures

`Suggested.lean` is unchanged, so no scratch `#check` file was elaborated. The one declaration, `canonicalHeightRat_exists_unique`, was compared with README §0.2, using the elaborated type in the worker's signature file. The binders are `K`, `[Field K]`, `[Height.AdmissibleAbsValues K]`, `[DecidableEq K]`, `W`, `[W.toAffine.IsElliptic]`, and the conclusion is `∃! q : QuadraticMap ℚ (ℚ ⊗[ℤ] W.Point) ℝ, ∀ P, q (1 ⊗ₜ P) = P.canonicalHeight`. This matches §0.2's hypotheses and statement, and no binder is lost.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: `Build completed successfully (18248 jobs).` There are two warnings: the expected `declaration uses 'sorry'` at `Suggested.lean:43:8`, and the module-system note on `import Mathlib`.
- Gate: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable --pr 1487`): `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
