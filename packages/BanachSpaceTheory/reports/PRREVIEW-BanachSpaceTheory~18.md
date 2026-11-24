# Review of BanachSpaceTheory (pull request #3027 at 374b9ce)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 39 changed lines since `74a09b7`. The change adds the item B7.HermitianNorms with three references and widens one scope sentence; its statements were read against Chen–Moriwaki, Theorem 1.2.54, and Gaudron 2008, §§2 and 4, and the bounds, the uniqueness of the least-volume Hermitian norm, the invariance under a conjugate-linear involution and both Checks were recomputed and hold. No finding: accepted, with three small corrections and one format note, none blocking. One correction concerns the change (the least-volume norm is stated over ℂ only, while its source proves it over ℝ and ℂ); the other two concern untouched text and belong in a separate pull request. Nothing is left for a human to decide.

## C01 — The least-volume Hermitian norm is stated over ℂ only, though the theorem cited for it is over ℝ and ℂ

No layer then has the real case (existence, uniqueness and the `√n` bound for the least-volume Euclidean norm bounded above by a given norm), so B7 plans less than its source proves, and for this item the description's phrase "stated in the generality of its source" does not hold. Chen–Moriwaki state Theorem 1.2.54 (CM line 3586, p. 84) for a nonzero finite-dimensional space over `k = ℝ` or `ℂ` with `r` the rank over `k`, and the item's own second paragraph says "over `ℝ` and `ℂ`, with the uniqueness of the extremal Hermitian norm". The real statement is true by the same proof: on `ℓ^∞_2(ℝ)` the least-area ellipse containing the square is the disc of radius `√2`, so `‖x‖_J = |x|₂/√2` and `|x|₂/√2 ≤ |x|_∞ ≤ |x|₂ = √2·‖x‖_J`. Only the clause on `τ` needs ℂ.

The smallest change is in the sentence beginning "Prove that there is a unique Hermitian norm" (README line 1323): state existence, uniqueness and the bound for a `𝕜`-inner-product norm on an `n`-dimensional normed `𝕜`-space, keep the first sentence and the deduction for `τ` over ℂ, and adjust the scope sentence at line 14 to match.

## C02 — Untouched text: README, B6.Cotype2 (line 1189). The two-point family `y, y` does not show that no nonzero space has type `p > 2` or cotype `q < 2`

For `‖y‖ = 1` the family `y, y` has `R₂ = (½·4)^(1/2) = √2`. Type `p` then reads `√2 ≤ C·2^(1/p)`, which holds with `C = 2^(1/2−1/p)`, and cotype `q` reads `2^(1/q) ≤ C·√2`, which holds with `C = 2^(1/q−1/2)`: nothing is refuted. The family of `n` copies of `y` has `R₂ = √n`, so type `p` gives `√n ≤ C·n^(1/p)`, false for large `n` when `p > 2`, and cotype `q` gives `n^(1/q) ≤ C·√n`, false for large `n` when `q < 2`. The parenthesis would read "(by the family of `n` copies of `y`)". For a separate pull request.

## C03 — Untouched text: `local_reflexivity` and `kadec_snobar` (Suggested.lean lines 304, 317) are over ℝ, while the README states both over `𝕜` (lines 1274, 1310)

The complex statements the README promises therefore have no acceptance test. Stating both over `RCLike 𝕜`, as `eberlein_smulian` already is, would close the gap. For a separate pull request.

## N01 — The subscript of `‖·‖_J` can be read as B7's John ellipsoid, which it is not

The unit ball of `‖·‖_J` is the least-volume ellipsoid containing the unit ball of the norm: Löwner's ellipsoid, `L(C)` in Gaudron's Définition–Théorème 2.4 (Gaudron2008 line 325), whereas "John's theorem" in B7 is the maximal inscribed one. The subscript is Chen–Moriwaki's ("John norm", CM line 3616). A clause after the definition at line 1323 saying so would remove the ambiguity.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| HermitianNorms: `‖x‖_H ≤ ‖x‖ ≤ √n‖x‖_H` | `ℓ^∞_n(ℂ)`; `n = 1`, `‖z‖ = c·|z|` | ℓ^∞: inscribed ellipsoid `B₂`, `‖T‖ = 1`, `‖T⁻¹‖ = √n`, `‖·‖_H = |·|₂/√n`; `n = 1`: `‖·‖_H = c|·|`, both equalities | holds | none |
| Route `‖x‖_H = |T⁻¹x|/‖T⁻¹‖` | any `T` with `‖T‖‖T⁻¹‖ ≤ √n` | `|T⁻¹x| ≤ ‖T⁻¹‖‖x‖`; `‖x‖ ≤ ‖T‖·|T⁻¹x| = ‖T‖‖T⁻¹‖·‖x‖_H ≤ √n‖x‖_H` | holds | none |
| Unique least-volume `‖·‖_J ≤ ‖·‖`, `√n` bound | CM Thm 1.2.54; `ℓ¹_n`, `ℓ^∞_n`; real `ℓ^∞_2` | source maximises `det u` over `B_u ⊇ B`, i.e. minimises volume; ℓ¹: `B_J = B₂`, `|x|₁ ≤ √n|x|₂`; ℓ^∞: `B_J = √n·B₂` | holds; source over ℝ and ℂ | C01 |
| τ-invariance of `‖·‖_J` | coordinate conjugation on `ℂ^n` | `h′(x,y) = conj h(τx,τy)` Hermitian; `‖τx‖_J ≤ ‖τx‖ = ‖x‖`; `τ² = 1` so `|det_ℝ τ| = 1`, equal volume | holds | none |
| Check ℓ^∞ | `n = 2`, `x = (1,1)` | `‖x‖_H = √2/√2 = 1`, `|x|_∞ = 1`, `|x|₂ = √2`: `1 ≤ 1 ≤ √2` | true | none |
| Check ℓ¹ | `x = (1,…,1)` | `T = n^(−1/2)·id`, `‖T‖ = 1`, `‖T⁻¹‖ = √n`, `‖·‖_H = |·|₂`; `|x|₁ = n = √n·√n` | true, equality | none |
| Gaudron sentence, constant `√(2n)` | Gaudron2008 lines 521–523, 540; `E = ℂ` | (12): `d ≤ √(2n)`; `n = 1`: `d = 1 ≤ √2` | true, weaker than `√n` | none |
| Scope sentence, line 14 | item text | item over ℂ; other B7 items as on `main` | consistent with the item | C01 |
| B5.LocalHaarDual vocabulary | bdlhv08 lines 14611–14617, p. 383 | locally Borel, locally null, locally a.e. as in the README | matches | none |
| B6.Cotype2 locator | pisier12gt lines 1591–1605, p. 31 | Definition 9.6: cotype 2, type 2 reversed, cotype-p variant | matches | none |
| B6.Cotype2 two-point argument | `(y,y)`, `‖y‖ = 1`; `n` copies | `√2 ≤ C·2^(1/p)` holds for `C = 2^(1/2−1/p)`; `√n ≤ C·n^(1/p)` fails | two points insufficient | C02 |
| `local_reflexivity` | `F = 0` | `T = 0` meets the three clauses; signature over ℝ | holds; ℝ only | C03 |
| `kadec_snobar` | `dim F = 1` | Hahn–Banach projection of norm `1 = √1`; signature over ℝ | holds; ℝ only | C03 |
| `dvoretzky_finite` | `k = 1` | `N = 1`, `T t = t·x/‖x‖`, isometric | holds | none |

- Source locators checked against the text: 7. CM §1.2.8 and Theorem 1.2.54 (p. 84, CM lines 3567–3698); Gaudron2008 Définition–Théorème 2.4 (§2, p. 30, lines 322–336), the complex case with (12) (pp. 35–36, lines 511–540), Définition 4.6 (§4, p. 49, lines 981–989); John 1948's bibliographic data (CM line 18942); pisier12gt Definition 9.6; bdlhv08 C.5. CM and Gaudron2008 are the ids of another roadmap's manifest; this roadmap's manifest records none of the three works the change cites.
- Library declarations opened: neither pinned library has a John or Löwner ellipsoid or a Hermitian approximation of a norm (only a prose mention in `TauCeti/Analysis/Convex/AffineNormalization.lean` line 41), so the item duplicates nothing.
- Cross-roadmap citations resolved: 2 consumers in this pull request. SlopesOfHermitianVectorBundles §6.1 (README lines 1057–1065) uses the bounds on `‖·‖_H`; HeightsRationalPointsAndObstructions §5.17d.1 (line 2988) uses the least-volume norm, its `√n` bound and its invariance. The item supplies both. The item's own `*Needs:*` cites only B7.
- Record: merge base and head have the same headings, layers, items and Lean declarations; 38 lines added, 1 changed. Nothing outside roadmap folders changes.
- Previous review: no findings to repair; its three small corrections and its format note stand unchanged (the text is the same) and are repeated above.
- Another open pull request rewrites this README and conflicts; the description's shared-folder order puts it first, and its head keeps John's theorem over `𝕜` and `d ≤ √n` (its 7.2).
- Overlap check: read BochnerSpaces, SchattenClassesAndSchurMultipliers, SelfAdjointSpectralTheory (open) and BanachAlgebras, SNumbers, VariationalMethods (main); the third list is empty; a search of all roadmaps for John and Löwner ellipsoids finds only consumers (SNumbers, ConvexAnalysisAndDuality, CompactQuantumMetricSpaces). Nothing shared: BanachSpaceTheory owns the new object.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1468 edges, 0 problem(s)`, no UPWARD or CYCLE line. Elaboration of Suggested.lean: exit 0, 24 `sorry` warnings and nothing else; the change does not touch the file, which has no `set_option`.

Source independence: changed passages only; 7 passages compared with 2 sources (CM, Gaudron2008), none shared beyond a run of 4 words the mathematics forces (the Hermitian norm `‖·‖_J` bounded above); the Gaudron sentence summarises and does not translate. Largest share in the changed text: CM, 3 of 7 locators. Arrangement not compared: no layer added, removed or reordered. John 1948 could not be read.

Research link: B7.HermitianNorms is the John–Löwner comparison by which Gaudron (2008) and Chen–Moriwaki (2020) pass from normed to Hermitian adelic vector bundles in slope theory; HeightsRationalPointsAndObstructions §5.17d.1 uses it for Chen's convergence of maximal slopes. Rests on the README's references and on Gaudron2008 §§2, 4 and CM §1.2.8.

## Not verifiable

- F. John 1948 (Courant anniversary volume): no legal open copy; cited only for the real maximal ellipsoid; bibliographic data confirmed from CM line 18942.
- Hewitt–Ross, Theorem 12.18 (B5.LocalHaarDual): recorded as uncertified; untouched text.

Automatic checks set aside as false positives: none failed. Two leads were dropped: the report of a lost normed-group binder on the two existence theorems (approximation property, scalar-plus-compact), where the space and its instances are bound inside the existential; and the report that the Schauder-basis reflexivity criterion and approximation-property theorem are found nowhere, which are this roadmap's own declarations (Suggested.lean lines 97, 117).

## Source issues

- **Misprint** in CM at Theorem 1.2.54, p. 84: the source says the final two-sided bound holds for the arbitrary Hermitian norm `‖·‖_h`; it should be `‖·‖_J`, as the proof shows (p. 85); affects nothing.
- **Misprint** in CM at the proof of Theorem 1.2.54, p. 86: the source says the unit ball is the set where the norm equals 1; it should be at most 1; affects nothing.
- **Misprint** in CM at the proof of Theorem 1.2.54, p. 86: the source says the chosen point has `‖x‖ > 1`; it should be `‖x₀‖ > 1`; affects nothing.

## For the human reviewers

- none
