# Review of BanachSpaceTheory (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 39 changed lines since `aecb53a`. The change adds the item B7.HermitianNorms with its three references and widens one scope sentence. Its statements were checked against Chen–Moriwaki, Theorem 1.2.54, and against Gaudron 2008, §§2 and 4. The Hermitian-norm bounds, the existence and uniqueness of the least-volume Hermitian norm, the invariance under a conjugate-linear involution and both Checks are correct, and were recomputed on the ℓ¹ and ℓ^∞ examples. No finding: accepted, with three small corrections and one format note, none blocking. One correction concerns the change: the uniqueness statement is narrowed to ℂ although its source holds over 𝕜. The other two concern untouched text and belong in a separate pull request. Nothing is left for a human to decide.

## C01 — The least-volume Hermitian norm is stated over ℂ only, though the theorem cited for it holds over ℝ and ℂ

As written, no layer has the real case: existence, uniqueness and the `√n` bound for the least-volume Euclidean norm bounded above by a given norm. B7 therefore plans less than its source proves. For this item, the description's sentence that each addition is "stated in the generality of its source" does not hold. Chen–Moriwaki state Theorem 1.2.54 (CM line 3586, p. 84) for a space over `k = ℝ` or `ℂ`, with `r` the rank over `k`, and the item's own second paragraph says so ("over `ℝ` and `ℂ`, with the uniqueness of the extremal Hermitian norm"). Over ℝ the statement holds with the same proof. For example, on `ℓ^∞_2(ℝ)` the least-volume ellipsoid containing the square is `√2·B₂`, so `‖x‖_J = |x|₂/√2` and `|x|₂/√2 ≤ |x|_∞ ≤ |x|₂`. Only the τ clause needs ℂ.

The smallest change would be in the sentence at line 1323: state the existence, the uniqueness and the bound for a `𝕜`-inner-product norm on an `n`-dimensional normed `𝕜`-space. Keep the first sentence and the τ deduction over ℂ, and adjust the scope sentence at line 14 to match.

## C02 — Untouched text: B6.Cotype2 (README line 1189). The two-point family `y, y` does not show that no nonzero space has type `p > 2` or cotype `q < 2`

For `‖y‖ = 1` the two-point family gives `R₂ = √2`. Type `p` then reads `√2 ≤ C·2^(1/p)`, which only forces `C ≥ 2^(1/2−1/p)`, and cotype `q` reads `2^(1/q) ≤ C·√2`, which only forces `C ≥ 2^(1/q−1/2)`. So for a large constant the family refutes nothing. The family of `n` copies of `y` does refute both, because its Rademacher average is `√n`: type `p` gives `√n ≤ C·n^(1/p)`, which fails for `p > 2` as `n → ∞`, and cotype `q` gives `n^(1/q) ≤ C·√n`, which fails for `q < 2`. The parenthesis would read "(by the family of `n` copies of `y`)". This is for a separate pull request.

## C03 — Untouched text: `local_reflexivity` and `kadec_snobar` (Suggested.lean lines 304, 317) are over ℝ, while the README states both over `𝕜` (lines 1274, 1310)

Because the Lean statements cover only the real case, the complex statements the README promises have no acceptance test. Stating both over `RCLike 𝕜`, as `eberlein_smulian` and `james` already are, would close the gap. This is for a separate pull request.

## N01 — The subscript of `‖·‖_J` can be confused with B7's John ellipsoid

The unit ball of `‖·‖_J` is the least-volume ellipsoid containing the unit ball of the norm, which is Löwner's ellipsoid, `L(C)` in Gaudron's Définition–Théorème 2.4. The subscript comes from Chen–Moriwaki's name "John norm", whereas in B7 "John's theorem" is the maximal inscribed ellipsoid. A clause saying so after the definition at line 1323 would remove the ambiguity.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| HermitianNorms: `‖x‖_H ≤ ‖x‖ ≤ √n‖x‖_H` | `ℓ^∞_n(ℂ)`; `n = 1`, `‖z‖ = c|z|` | ℓ^∞: John ellipsoid `B₂`, `‖T‖ = 1`, `‖T⁻¹‖ = √n`, `‖·‖_H = |·|₂/√n`; `n = 1`: `‖·‖_H = c|·|`, both bounds equalities | holds | none |
| Route `‖x‖_H = |T⁻¹x|/‖T⁻¹‖` | any `T` with `‖T‖‖T⁻¹‖ ≤ √n` | `|T⁻¹x| ≤ ‖T⁻¹‖‖x‖`; `‖x‖ ≤ ‖T‖·|T⁻¹x| = ‖T‖‖T⁻¹‖·‖x‖_H ≤ √n‖x‖_H` | holds | none |
| Unique least-volume `‖·‖_J ≤ ‖·‖`, `√n` bound | CM Thm 1.2.54; `ℓ¹_n`, `ℓ^∞_n` | max det-norm ⇔ min volume (vol ∝ `det_ℂ(u)⁻¹`); ℓ¹: `B_J = B₂`, `|x|₁ ≤ √n|x|₂`; ℓ^∞: `B_J = √n·B₂ ∋ (1,…,1)` | holds; source over ℝ and ℂ | C01 |
| τ-invariance of `‖·‖_J` | τ = coordinate conjugation on `ℂ^n`, ℓ^p norms | `h′(λx,y) = conj h(λ̄τx,τy) = λh′(x,y)`; `det_ℝ τ = (−1)^n`; `‖τx‖_J ≤ ‖τx‖ = ‖x‖` | holds | none |
| Check ℓ^∞ | `n = 2`, `x = (1,1)` | `‖x‖_H = 1`, `|x|_∞ = 1`, `|x|₂ = √2`: `1 ≤ 1 ≤ √2` | true | none |
| Check ℓ¹ | `x = (1,…,1)` | `|x|₁ = n`, `√n·|x|₂ = n` | equality, true | none |
| Gaudron sentence, constant `√(2n)` | Gaudron2008 line 540; `n = 1` | (12): `d ≤ √(2n)`; `E = ℂ`: `d = 1 ≤ √2` | true, weaker than `√n` | none |
| Scope sentence, line 14 | item text | item over ℂ; other B7 items unchanged | consistent | none |
| B5.LocalHaarDual vocabulary | bdlhv08 lines 14611–14617, p. 383 | locally Borel and locally null as in README | matches | none |
| B6.Cotype2 locator | pisier12gt lines 1591–1605, p. 31 | Def. 9.6: cotype 2, type 2, cotype-p variant | matches | none |
| B6.Cotype2 two-point argument | `(y,y)`, `‖y‖ = 1` | `√2 ≤ C·2^(1/p)` only forces `C ≥ 2^(1/2−1/p)`; `n` copies: `√n ≤ C·n^(1/p)` fails | insufficient | C02 |
| `james` | `E = 0` | inclusion surjective; `f = 0`, `x = 0` attains | both true | none |
| `pietsch_domination` | `T = 0`, `ν = δ₀` | `π_p(0) = 0 ≤ C`; `0 ≤ C·0` | both true | none |
| `grothendieck_real` | `m = n = 1`, `a = 1` | hypothesis `|st| ≤ 1`; `|⟨u,v⟩| ≤ 1 ≤ 8` | holds | none |
| `local_reflexivity` | `F = 0` | `T = 0` meets all three clauses | holds; ℝ only | C03 |
| `kadec_snobar` | `dim F = 1` | Hahn–Banach projection, norm `1 = √1` | holds; ℝ only | C03 |
| `dvoretzky_finite` | `k = 1` | `N = 1`, `T t = t·x/‖x‖` isometric | holds | none |
| `dvoretzky` | `n = 1` | `T t = t·x₀`, `‖x₀‖ = 1` | holds | none |

- Source locators checked against the text: 8. These are CM §1.2.8, Theorem 1.2.54 (p. 84, CM lines 3567–3698) and Remark 1.2.55; Gaudron2008 Définition–Théorème 2.4 (p. 30, lines 322–336), the complex case and (12) (pp. 35–36, lines 511–540), and Définition 4.6 (p. 49, lines 981–989); the John 1948 bibliographic data (CM line 18942); pisier12gt Definition 9.6; bdlhv08 C.5. The texts were read under the ids `CM` and `Gaudron2008`, which other roadmaps' manifests use. This roadmap's manifest records none of the three works the change cites.
- Library declarations opened: pinned Tau Ceti has `TauCeti/Analysis/Normed/Module/BanachMazur.lean`, `FinitelyRepresentable.lean` and the comment in `Analysis/Convex/AffineNormalization.lean` line 41. Neither pinned library has a John or Löwner ellipsoid or a Hermitian-norm approximation, so B7.HermitianNorms duplicates nothing.
- Cross-roadmap citations resolved: SlopesOfHermitianVectorBundles §6.1 (README lines 1056–1064) uses the bounds on `‖·‖_H`. HeightsRationalPointsAndObstructions §5.17d.1 (lines 127, 2988, 2995) uses the least-volume norm, the `√n` bound and τ-invariance. The item supplies both. The item's `*Needs:*` lines cite only B7 itself.
- Record: the merge base and the head have the same headings, layers and items. The change adds 38 lines and changes one.
- Open pull request #1854 also rewrites this README. The description's merge-order block puts #1854 first, and #1854's head keeps John's theorem over `𝕜` and `d ≤ √n` in its 7.2.
- Overlap check: read BochnerSpaces, SchattenClassesAndSchurMultipliers, OperatorIdeals and SelfAdjointSpectralTheory (open), and BanachAlgebras, SNumbers and VariationalMethods (main); the third list was empty. None states John–Löwner ellipsoids or Hermitian norms close to a norm; SNumbers only consumes B7's projection theorems. The new object's owner is BanachSpaceTheory.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on Suggested.lean exits 0 with 24 `sorry` warnings and nothing else. The change does not touch Suggested.lean.

Source independence: changed passages only. 7 passages were compared with 2 sources (CM, Gaudron2008). At most 4 consecutive words are shared ("Hermitian norm ‖·‖_J bounded"), as the mathematics forces, and the Gaudron sentence summarises the French rather than translating it. In the changed text CM has the largest share, 3 of 7 locators. Arrangement not compared: no layer is added, removed or reordered.

Research link: B7.HermitianNorms is the John–Löwner comparison that Gaudron (2008) and Chen–Moriwaki (2020) use to pass from normed to Hermitian adelic vector bundles in slope theory. HeightsRationalPointsAndObstructions §5.17d.1 applies it to Chen's (2010) convergence of maximal slopes. This rests on the README references and on Gaudron2008 §§2, 4 and CM §1.2.8.

## Not verifiable

- F. John 1948 (Courant anniversary volume, Interscience): no legal open copy. It is cited only for the real maximal ellipsoid, and its bibliographic data were confirmed from CM line 18942.
- Hewitt–Ross Theorem 12.18 (B5.LocalHaarDual): recorded as uncertified; untouched text.

Automatic checks set aside as false positives: two lead types. The signature report flagged a dropped normed-group binder on the two existence theorems for the approximation property and scalar-plus-compact, but there the space and its instances are bound inside the existential. The citation resolver reported the Schauder-basis reflexivity criterion and approximation-property theorem as found nowhere, but both are this roadmap's own declarations in Suggested.lean, lines 97 and 117.

## Source issues

- **Misprint** in CM at Theorem 1.2.54, p. 84: the source says the final two-sided bound holds with the arbitrary Hermitian norm `‖·‖_h`; it should be `‖·‖_J`, as the proof establishes (p. 86); affects nothing.
- **Misprint** in CM at the proof of Theorem 1.2.54, p. 86: the source says the unit ball is the set where the norm equals 1; it should be at most 1; affects nothing.
- **Misprint** in CM at the proof of Theorem 1.2.54, p. 86: the source says the chosen point has `‖x‖ > 1`; it should be `‖x₀‖ > 1`; affects nothing.

## For the human reviewers

- none
