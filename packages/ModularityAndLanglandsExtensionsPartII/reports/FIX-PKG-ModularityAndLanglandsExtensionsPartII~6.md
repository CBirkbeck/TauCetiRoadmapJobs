# Repair report: ModularityAndLanglandsExtensionsPartII

Findings F01–F07 come from REV-PKG-ModularityAndLanglandsExtensionsPartII~5, the only review this round. Each was checked against the cached sources, the supplier roadmaps and the pinned libraries. All seven are correct, and all seven are repaired in `packages/ModularityAndLanglandsExtensionsPartII/README.md`. No finding touches `Suggested.lean`, `metadata.toml`, `sources.toml` or `design/plan.json`, and none of them changed. Nothing was committed and nothing was written to GitHub.

## F01 (P1) — applied

§14.5 API: "`ψ′` is `ψ` composed with reduction modulo `M`" → `ψ′ = DirichletCharacter.changeLevel h ψ` (`h : M ∣ MM′`): `ψ` composed with `ZMod.unitsMap` on units, zero on non-units. Non-triviality, square and prime values are cited from Mathlib. New negative-control Check (`M = 4`, `M′ = 3`: values `0` at `3`, `−1` at `7`). Mathlib contract and *Needs* updated.

## F02 (P2) — applied

Layer 12 introduction, §12.1(13) and §12.1 Checks. "if `Σ ∩ S_p ≠ ∅` then `p > 2`" → "`Σ_π ∩ S_p ≠ ∅`". Unramified rank-two conditions are now restricted to `Σ_σ − Σ_π` away from `p`. At `v | p` it stays the one `π` fixes; all `σ`-ramified places stay in the unitary level. New `p = 2` Check.

## F03 (P2) — applied

§10.5: "irreducible and adequate for `t > n − 1`" → irreducible for `t > n − 1`, adequate on `G_{ℚ(ζ_t)}` since the image contains `Sym^{n−1}(SL_2(𝔽_t))` and `t > 8n(n − 1) ≥ 2n + 2` (ArithmeticGaloisRepresentations §7.9, clause (3)). New Check `t = n = 13`. The same input is made explicit in §10.8 (`t > 4n(n − 1)`).

## F04 (P2) — applied

§4.2 (archimedean): "`f_v` a coefficient … `= ϵ`" → `π̃(f̃_v^H) = ϵ σ_v(f_v)` for every matrix coefficient, `= ϵ` for the coefficient normalised by `σ_v(f_v) = 1` (given explicitly). New `U_1(ℝ)` Check (`f = 1` gives `1`, `f = 2` gives `2`). The consumer §5.3 now names the normalised coefficient.

## F05 (P3) — applied

§0.2 Check: "`G_{ℚ_p}^{ab} ≅ ℤ_p^× × ℤ_p` (completed)" → `G_{ℚ_p}^{ab} ≅ ℤ_p^× × ℤ̂` (ClassFieldTheory Layers 7–8). Lifts of `χ̄` are the Teichmüller lift times characters of the pro-`p` quotient `ℤ_p²`, which gives the dimension-2 polydisc. New Check: `Hom(·, C_5)` has 5 elements against 1 for `p = 3`. Supplier contract extended.

## F06 (P3) — applied

§6.9 Check "not congruent to `1` … no Steinberg lift could exist" deleted. In its place: a positive control showing that condition (4) is ordered and only sufficient (`𝔽_5`, `{2, 1}`: `4 ≠ 1`, swapped `6 = 1`), and the true necessary condition, a single `q_{ṽ_0}`-string, with a negative control (`𝔽_7`, `{3, 1}`, ratios `3`, `5` ∉ `{2, 4}`).

## F07 (P3) — applied

§13.4 proof sketch: "the case covered by the repaired set `S` of Layer 12" → "a case Layer 12 covers because its set `S` and its unitary level contain the ramification of `σ`", with the rank-two condition at `v_0` unramified if `v_0 ∤ l` and the one `γπ` determines if `v_0 | l` (consistent with F02).

## Verified evidence

- **F01.** At the pinned Mathlib, `DirichletCharacter R n := MulChar (ZMod n) R` is at `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:39` and `MulChar.map_nonunit` at `Mathlib/NumberTheory/MulChar/Basic.lean:130`. `changeLevel` is at `DirichletCharacter/Basic.lean:65` (`ofUnitHom (ψ.toUnitHom.comp (ZMod.unitsMap hm))`), with `changeLevel_injective` (`[NeZero m]`) at :79, `changeLevel_eq_one_iff` at :88 and `changeLevel_eq_cast_of_dvd'` at :103. `ZMod.unitsMap` is at `Mathlib/Data/ZMod/Units.lean:29`. A scratch Lean file (not in the package) proved four facts at the pin: `¬ IsUnit (3 : ZMod 12)`; `χ₄` of the ring image of `3` is `−1`; `changeLevel` of any `ψ` mod 4 is `0` at `3`; and `changeLevel χ₄` is `−1` at `7`.
- **F02.** In nt26 lines 1222–1230 (reduction (13), p. 26), `Σ` is the ramification set of `π`. The implication `Σ_p ≠ ∅ ⇒ p > 2` is proved from the non-potential-crystallinity of `r_π` at a Steinberg place together with hypothesis (4) (nt26 lines 1192–1194). That hypothesis constrains only `π` and `π′`. The local rings at `v ∈ S_p` (nt26 lines 1263–1279) depend only on `r_π|_{G_{F_v}}`. The unitary level is Iwahori at the ramification places (nt26 lines 1470–1471). The package's Layer 12 keeps it at all of `Σ`.
- **F03.** nt21b lines 1186–1190 (Proposition 3.9) and 1254–1258 (Theorem 3.1) assert only irreducibility, for `t > m`. BLGGT Theorem 4.2.1 needs adequacy. The supplier ArithmeticGaloisRepresentations §7.9, at its open head, says `p ∣ n` excludes adequacy. Its symmetric-power clause (3) gives adequacy of `(Sym^{n−1} r̄)(Γ′)` for finite image with `SL₂(𝔽_p) ⊆ r̄(Γ′)` and `p ≥ 2n + 2`. The image of `G_{ℚ(ζ_t)}` contains `SL_2(𝔽_t)` because `SL_2(𝔽_t)` is perfect for `t ≥ 5` and `Gal(ℚ(ζ_t)/ℚ)` is abelian. The other adequacy claims (§§6.7, 7.7, 13.5) cite the `a₀(p)` threshold or take adequacy as a hypothesis, which agrees with clause (2). They are unchanged.
- **F04.** nt21 lines 553–560 (Proposition 1.6) say "a coefficient for `σ_v`" and conclude `= ϵ`. The proof (lines 561–567) combines Clozel's identity and Kaletha's Proposition 5.10, both linear in the test function. So the general identity is `ϵ σ_v(f_v)`, and the value `ϵ` needs `σ_v(f_v) = 1`. `G(F⁺_v)` is compact at infinite places (§4.1). Schur orthogonality with volume `1` makes `∫ dim σ · conj⟨σ(g)e, e⟩ σ(g) dg` the projection onto `ℂe`. Only §4.2 and its consumer §5.3 use the archimedean coefficient.
- **F05.** ClassFieldTheory (on main) Layer 7 gives the absolute Artin map `artinMap : K^× → G_K^{ab}`, with dense image and with the image of the units equal to that of inertia (`map_artinMap_unitFiltration_zero`). Layer 8 gives `injective_artinMap` in characteristic zero. Both are present at the pinned Tau Ceti (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:188`, `…/Local/Unramified.lean:475`, `…/LocalExistence/ArtinMap.lean:113`).
- **F06.** th24 Theorem 6.11 (lines 1769–1775) gives an ordered sufficient condition. Its other hypotheses are symmetric under exchanging `(π_1, ψ_1)` and `(π_2, ψ_2)`. Local–global compatibility at `ṽ_0`, for an unramified twist of `St_n`, forces the residual Frobenius eigenvalues to form one `q_{ṽ_0}`-string, which gives the necessary condition.
- **F07.** `v_0` (§13.2, `S5-global` (3)) has `q_{v_0} ≡ −1 mod p`. It can lie above the auxiliary prime `l` of §13.4, so both cases are named.

## Adversarial mathematics record

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §14.5 API, enlargement of the modulus | `M = 4`, `M′ = 3`, `ψ = χ_{−4}`; arguments `3`, `5`, `7` | ring composite at `3`: `−1`; `changeLevel` at `3, 5, 7`: `0, 1, −1`; principal mod `12` at `3`: `0`; `(ψ′)²(3) = 0`, raw square `1` | raw composite is not a `MulChar`; `changeLevel` repair (Lean-checked values) |
| same, degenerate `M′` | `M′ = 1`; `M′ = 0` with `M = 5` | `changeLevel_self` gives `ψ′ = ψ`; for `M = 5`, `{±1} → (ℤ/5)^×` has image of order `2 < 4`, so injectivity fails at level `0` | `M′ > 0` (hence `NeZero (MM′)`) is needed and stated |
| same, square law | `ψ² = 1` | `changeLevel(ψ)² = changeLevel(ψ²) = changeLevel(1) = 1` | holds |
| §12.1(13), dyadic exclusion | `p = 2`, `r = 2`, `π` crystalline `{0,1}`, `σ_v` Steinberg | `rank N_π = 0`, `rank N_σ = 1`; `Σ_π ∩ S_2 = ∅`, `Σ ∩ S_2 ≠ ∅` | old implication excluded an allowed `p = 2`; fixed; Check added |
| Layer 12, local condition at `v ∣ p` in `Σ_σ − Σ_π` | unramified versus crystalline | Hodge–Tate weights `{0,0}` versus `{0,1}`; `r_π` has `{0,1}` | unramified ring misses `r_π`; condition fixed by `π` |
| `R^loc` dimension with added places away from `p` | unramified framed lifts of trivial residual, fixed det | local ring `𝒪[[x_1,x_2,x_3]]`, relative dimension `3`; sum `1 + 3[F:ℚ] + 3|S|` unchanged | the count of §12.6 still holds |
| `r = 1` boundary of the `p = 2` Check | `σ` a character | `St_1` is a character, monodromy `0` | witness needs `r ≥ 2`, which is stated |
| §10.5, irreducible versus adequate | `t = n = 13` | `Sym^{12}` irreducible (`12 ≤ t − 1`); `tr I_{13} = 13 ≡ 0`, so `H⁰(H, ad⁰) ∋ I ≠ 0` | old claim false; Check added |
| §10.5, bound | `n = 3, 4`; `t = 53` | `8n(n−1) = 48, 96`; `2n + 2 = 8, 10`; `53 > 48`, `53 ≥ 8`; `t = 13 ≤ 1248` | criterion (3) applies; `t = n` excluded |
| §10.8, bound | `n = 3` | `4n(n−1) = 24 ≥ 8 = 2n + 2` | adequacy input holds; made explicit |
| image on `G_{ℚ(ζ_t)}` | `t ≥ 5` | `SL_2(𝔽_t)` perfect, quotient `Gal(ℚ(ζ_t)/ℚ) ≅ (ℤ/t)^×` abelian | `SL_2(𝔽_t) ⊆ r̄(G_{ℚ(ζ_t)})` |
| §4.2, archimedean value | `U_1(ℝ)`, `σ` trivial; `f = 1, 2` | traces `1`, `2`; right-hand sides `ϵ`, `2ϵ` | normalisation needed; Check added |
| same | `σ = z^m`, `f = z^{−m}`; `σ′ = z^{m′}` | `∫ z^{−m} z^m = 1`; `∫ z^{−m} z^{m′} = 0` (`m′ ≠ m`) | normalised coefficient discriminates |
| same, plausible wrong model | `U_3(ℝ)`, standard `σ` (dim `3`), `f = 3·conj(χ_σ)` | operator `= Id`, trace `3` | character-type coefficient gives `3ϵ`; excluded by `σ_v(f_v) = 1` |
| §5.3 multiplicity | archimedean factors | normalised factor `ϵ_v · 1` at each `v ∣ ∞` | `∏ϵ` in `m(σ)` consistent |
| §0.2, abelian group | `p = 3`, target `C_5` | `|Hom(ℤ_3^× × ℤ̂, C_5)| = 5`; `|Hom(C_2 × ℤ_3 × ℤ_3, C_5)| = 1` | old identification false; Check added |
| §0.2, polydisc dimension | `ℚ_3`, `ℚ_5`, `ℚ_3(ζ_3)` | pro-`p` quotients `ℤ_3²`, `ℤ_5²`, `μ_3 × ℤ_3³` | dims `2, 2`; `3` components of dim `3 = d + 1` |
| §6.9, ordered condition | `q_{ṽ_0} = 2`, `𝔽_5`, `(ψ_1, ψ_2)(ϖ) = (2, 1)` | `2·2 = 4 ≠ 1`; swapped `3·2 = 6 ≡ 1` | not necessary; positive control |
| §6.9, necessary condition | `q_{ṽ_0} = 2`, `𝔽_7`, `{3, 1}` | ratios `3`, `3^{−1} = 5`; allowed `{2, 2^{−1} = 4}` | not a string; negative control |
| §6.9, degenerate `q ≡ ±1` | `q_{ṽ_0} = 11`, `𝔽_5`; `q_{ṽ_0} = 2`, `𝔽_3` | `q ≡ 1`: `{1,1}` passes in both orders; `q ≡ −1`: `q = q^{−1}`, orders agree | consistent |
| §13.4 wording | `v_0 ∤ l`, `v_0 ∣ l` | condition unramified, or crystalline from `γπ` | covered by Layer 12 as repaired |

## Ownership, pins and source status

- No new target, definition or Lean name. The repairs consume three existing owners. `DirichletCharacter.changeLevel` comes from Mathlib at the pin, so no generic character construction is planned here. The adequacy criterion comes from ArithmeticGaloisRepresentations §7.9, at its open head, earlier in the merge order and already a supplier. Local reciprocity comes from ClassFieldTheory Layers 7–8, on main.
- No new source. All locators are in nt21, nt21b, nt26 and th24, already cached. `needs-references.toml` was not created.

## Checks and exact outcomes

- `lake env lean packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, run from the content checkout, printed exactly two warnings, both "declaration uses `sorry`", at lines 97 and 116, and no error. No `TauCeti.*` module needed building.
- Mechanical binder check. A scratch copy with `#check @symPowerEulerFactor`, `@HasQuadraticSelfTwist`, `@symPowerEulerProduct_levelOne_entire` and `@symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` elaborated. The signatures are unchanged from the previous round, and each matches its README statement. `HasQuadraticSelfTwist : {N} → [NeZero N] → {k} → Newform N k → Prop`. Both theorems keep `1 ≤ n` and the Satake hypotheses, and the general-level theorem keeps `[NeZero N]`, `2 ≤ k` and `¬HasQuadraticSelfTwist f`. Nothing changed.
- `tauceti-roadmap … gate --depcheck …` printed:

      depcheck: 245 roadmaps, 2257 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." Its library names outside TauCetiRoadmap were not checked by the tool. The new Mathlib and Tau Ceti names (`DirichletCharacter.changeLevel`, `changeLevel_injective`, `changeLevel_eq_one_iff`, `changeLevel_eq_cast_of_dvd'`, `ZMod.unitsMap`, `MulChar.map_nonunit`, `ZMod.χ₄`, and the Artin-map declarations) were checked by hand at the pins, at the files and lines above.
- No gap changed. The README contracts and `design/plan.json` still agree on all 13 gap slugs.

## Notes for the maintainer

- No Lean name, section number or heading changed, so other roadmaps' citations of this package are unaffected.
- The repaired Layer 12 set-up now fixes the rank-two condition at `σ`-ramified places above `p` as the one `π` determines. This matters for §13.4 if `v_0` lies above the auxiliary prime `l`.
- Source issue (for the source-issues list): nt21b Propositions 3.9 and the proof of Theorem 3.1 (pp. 25 and 27) justify BLGGT Theorem 4.2.1 by irreducibility alone. Its adequacy hypothesis holds because `t > 4n(n − 1) ≥ 2n + 2`, by the large-characteristic criterion.
- No suspicious instructions were found in the review text.
