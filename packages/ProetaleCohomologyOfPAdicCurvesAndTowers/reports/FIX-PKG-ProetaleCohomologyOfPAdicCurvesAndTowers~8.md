# FIX-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~8

Findings of `REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~7` (review of head b9ffd1c). All four were verified against the cached sources, the board packages and the merge order. Files changed: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` were not changed.

## F01 (P2) — applied

Verified. CDN-CURVES lines 4284–4290 and 4324 restrict §8 to curves without boundary; `Y^sp` is defined for them only (line 4372, and footnote 49 at line 4352 uses the absence of `0+` points); Théorème 8.12 (lines 4542–4543) is stated on `WD_Y`. Remarque 0.16(ii) (lines 412–415) asserts the `WD_K`-statement for overconvergent affinoids without proof.

Old → new (§4.6): "for `Y` an overconvergent affinoid or a curve without boundary … `WD_Y`-representations … similar (Théorème 8.12 = Remarque 0.16(ii))" → the `WD_Y` statement for curves without boundary (Théorème 8.12); for `Y^†` the `WD_K` statement: `WD(V)`, `V = H¹_proét(Y^†, ℚ_ℓ(1))` (§4.5 recipe with `G_K`), similar to `H¹_HK(Y^†)(1)`, citing Remarque 0.16(ii).

The reviewer's text did not say how `H¹_HK(Y^†)(1)` becomes a `WD_K`-representation, so the new text adds that `W_K` acts `C̆`-linearly through the pairs `(g, φ^n)` that act trivially on `k_C` (CDN-CURVES Remarque 8.6(i), lines 4418–4423). It also says that `N` comes from §3.2 through the colimit of §4.1, and that the proof runs on the finite filtrations of §§4.1(a) and 4.3, with the inertia formula of §2.5. *Needs* gains §2.5, §3.2 and §4.1. A new Check covers the overconvergent annulus, with the twist as a negative control, and the disc.

Pattern search: `Y^sp`, `WD_Y` and "overconvergent affinoid" occur elsewhere only in §4.3 (filtrations, correctly for both classes, Théorème 0.15), §4.4 (curves without boundary), Layer 4 Examples (half-plane) and §7.4 (applies §4.6 to `M_n^ϖ`, a disjoint union of curves without boundary). None needed a change.

## F02 (P2) — applied

Verified. CDN-CURVES lines 2036–2038 define `A_{ℓ,n}` of a leg by divisors of finite support. Lemme 4.4 (lines 2041–2050) identifies `Symb_ℓ(Y^gen) = ℤ_ℓ ⊗̂ O(Y^gen)^×` with `lim A_{ℓ,n}/(C^×)^{ℓ^n}`. The README defined `A_{ℓ,n}` only for quasi-compact curves, and restricting a symbol to a leg can give a non-unit.

Old → new (§2.4, *Symbols of the pieces*):
- Defined `C(Z^gen)`, `A_{ℓ,n}` of a leg and the Lemme 4.4 isomorphism.
- Defined the restriction to a leg as `(f_n) ↦ (f_n|_{Y_a})` followed by the inverse of that isomorphism.
- *Localized symbols* now take `u_{i,n} ∈ A_{ℓ,n}(Y_i^gen)` (for a leg, in the sense above), `v_{i,n} ∈ C(Y_i^gen)^×` and `g_{i,j,n} ∈ C(Y_{i,j}^gen)^×`.

One difference from the suggested text: for a leg, `C(Z^gen)` is the field of fractions. `O(Z^gen)` is a domain there because it embeds in the analytic functions on the connected open annulus; the Laurent series `Σ a_k T₁^k + Σ b_k T₂^k` converge for `|p^µ| < |T₁| < 1`. For a ghost circle I could not verify that `O_C[[T, T^{−1}⟩[1/p]` is a domain. `Σ_{j≥1} p^{1/j}T^j` has Gauss norm `1` but no unit coefficient, which defeats the leading-coefficient argument. So `C(Z^gen)` there is the total ring of fractions. It agrees with the field of fractions if the ring is a domain, and it is all the localized symbols need.

Pattern repairs:
- The text also says how restriction from a short to its ghost circles lands in units. A nonzero function on a short becomes a unit there; the argument is given, and the instance `T − p = T(1 − pT^{−1})` checks it.
- §3.3 (the syntomic regulator, which also restricts `f_n` to legs) now says that `f̃_{n,i}` lifts `f_n|_{Y_i}`, which may have zeros and poles of multiplicity divisible by `p^n`. The lifts are chosen so that the limit is holomorphic (CDN-CURVES lines 532–535).

New Check: the Tate-curve element with a zero in a leg, its unit representative `f h^{−ℓ^n}`, independence of `h`, and the excluded function with infinitely many zeros.

## F03 (P3) — applied differently

Verified that the bullet was wrong. `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` covers patched modules and density and contains no Thorne or Drinfeld material. The gap `drinfeld-steinberg-detection` is declared by ModularityAndLanglandsExtensionsPartII on CompletedCohomologyAndLocalGlobalCompatibility §0.7 (`packages/ModularityAndLanglandsExtensionsPartII/README.md:443`, `design/plan.json:5804`). THO24 lines 771–796 (Theorems 3.5–3.6) are about Dat's complex, and line 1514 uses Theorem 3.5 in Corollary 6.3.

The suggested repair names CompletedCohomologyAndLocalGlobalCompatibility as a downstream consumer. I did not use that wording: in `merge-order/ORDER.txt` that roadmap is line 252, *before* this roadmap (line 265), and its §0.7 at its head ("Definite unitary forms for global patching") does not use §6.10. Listing an earlier roadmap as a consumer would reverse the single direction of supply.

Old → new: the bullet now names **ModularityAndLanglandsExtensionsPartII** (line 284, later) as the consumer: Thorne's Theorems 3.5–3.6 rest on §6.10; Dat's complex enters Theorem 5.2 and Theorem 3.5 enters Corollary 6.3, inputs that its gap asks of CompletedCohomologyAndLocalGlobalCompatibility §0.7. `sources.toml` THO24 locator extended accordingly.

## F04 (P3) — applied

Old → new (References): "The sources manifest is `packages/…/sources.toml`; locators below use the numbering of the versions recorded there." → "Locators below use the numbering of the versions recorded in `sources.toml`, in this folder." No other `packages/` or machine path remains in `README.md`, `Suggested.lean` or `sources.toml` (grep).

## Adversarial pass on new and changed text

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §4.6, curves without boundary (`WD_Y`) | Tate curve over `K`; `y² + y = x³` component over `𝔽₂` | Tate: geometric Frobenius `diag(q^{−1}, 1)`, `Ne₁ = µe₀` on both sides. `𝔽₂` curve: `#E(𝔽₂) = 3`, `a = 0`; twisted characteristic polynomial `X² + 1/2` on both sides. | Sound; unchanged apart from the restriction to curves without boundary. |
| §4.6, overconvergent affinoid (`WD_K`) | closed annulus `{|ϖ_K| ≤ |T| ≤ 1}^†`, `T` defined over `K` | ℓ-adic: `V = ℚ_ℓ`, the Kummer class of `T`, fixed by `G_K`, so `WD(V) = ℚ_ℓ`, `N = 0`, every `w ∈ W_K` acts by `1`. HK: `C̆·dT/T`, `φ = pσ`, twisted `φ = σ`; geometric Frobenius `(g, φ^f)`, `g` acting by `x ↦ x^{p^{−f}}` (Remarque 8.6(i): `deg = f`), acts by `p^f/p^f = 1`. | Similar. Added as a Check. |
| same, twist control | annulus, untwisted HK | `(g, φ^f)` on `dT/T` with `φ = pσ` gives `q`; ℓ-adic twisted side gives `1`. | `q ≠ 1`; the twist is needed. In the Check. |
| same | closed disc `|T| ≤ 1`, overconvergent | `H¹_HK(Y^†) = 0` (§4.1 Check); `H¹(disc, ℚ_ℓ) = 0`. | Both `0`. In the Check. |
| same | `E` with good reduction over `K` minus a `K`-rational open residue disc | `Γ`: one vertex, one leg; `H¹(Γ) = 0`, `H¹_c(Γ) = coker(L → L) = 0`. Both sides reduce to the middle piece, `H¹_ét(E_s, ℚ_ℓ(1))` against `H¹_cris(E_s)(1)`; twisted characteristic polynomial `X² − (a/q)X + 1/q` on both. | Similar; matches the first Check of §4.6. |
| §4.6, `WD(V)` with `G_K` for `Aut_K(Y)` | `V` unramified | the colimit stabilises at `L = K`, `WD(V) = V`, `N = 0` (§4.5 Check). `Aut_K(Y) = G_K × Aut_C(Y)^{G_K}` (CDN-CURVES line 4412), so `G_K` is a factor. | Recipe well defined. |
| §2.4, `A_{ℓ,n}` of a leg | `f` on a Tate curve, `Div(f) = ℓ^n(P − Q)`, `P − Q ∈ E[ℓ^n]`, `P` in the leg at `T₁ = α` | `f|_{Y_a}` vanishes at `α`, so it is not a unit. Its divisor has finite support and is divisible by `ℓ^n`. `h = T₁ − α` has a single zero on `|p^µ| < |T₁| < 1`, and `f h^{−ℓ^n}` is a unit. Two choices of `h` differ by a function with no zeros or poles, a unit by normality (line 2044), so the class mod `ℓ^n`-th powers is unchanged. | Sound. Added as a Check. |
| §2.4, finite support | bounded `Σ a_k T₁^k` with `v(a_{2^n}) = 2^{−n}` | Newton-polygon slopes `−2^{−2n−1}`, all distinct, so infinitely many zeros with `|T₁| → 1`. | Excluded from `A_{ℓ,n}`, as Lemme 6.1's gluing needs. In the Check. |
| §2.4, `O(leg^gen)` a domain | `Σ_{k≥0} a_k T₁^k + Σ_{k≥1} b_k T₂^k` | Converges on `|p^µ| < |T₁| < 1`, since `|T₂| = |p^µ/T₁| < 1`. Injective into analytic functions on the connected annulus. | Domain; field of fractions used. |
| §2.4, ghost circle | `x = Σ_{j≥1} p^{1/j}T^j` | Gauss norm `1`, no unit coefficient; no scaling gives one. | Domain property not established; total ring of fractions used. |
| §2.4, short → ghost circle gives units | `h = T − p` on the closed disc at its boundary ghost circle | least index with a unit coefficient `k = 1`, `ũ = T`, `a_0 = −p ∈ pO_C`, `h = T(1 − pT^{−1})`, inverse `T^{−1}Σ_m p^m T^{−m}`, coefficients tending to `0`. | Unit, as claimed. |
| §2.4, localized-symbol relations (unchanged) | trivial families | `(a_{i,n+1}/a_{j,n+1})^ℓ = (a_{i,n}/a_{j,n})(a_{i,n+1}^ℓ/a_{i,n})(a_{j,n}/a_{j,n+1}^ℓ)` | Holds; the new membership conditions (`v ∈ C(Y_i^gen)^×`, `g ∈ C(Y_{i,j}^gen)^×`) contain the trivial families: `a_{i,n} ∈ C(Y_i^gen)^×` restricts to units on ghost circles by the row above. |
| §3.3, lifts of `f_n|_{Y_i}` | closed disc, `f_n = (T − p)^{p^n}` | `df_n/f_n = p^n·dT/(T − p) → 0` as `n → ∞` | The limit is holomorphic, as the added sentence says. |
| §6.10 consumer | merge order | CompletedCohomologyAndLocalGlobalCompatibility line 252, this roadmap 265, ModularityAndLanglandsExtensionsPartII 284 | The consumer is the later roadmap; the bullet now names it. |
| References path | grep for board-folder and machine paths | none in `README.md`, `Suggested.lean`, `sources.toml` | Clean. |

## Checks run

- `lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean` (run from the content checkout): exit 0, one warning `122:8: declaration uses 'sorry'`. No `TauCeti.*` import, so nothing was built.
- `#check @name` for all 7 declarations (`parabolic`, `parabolic_mono`, `translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`) in one scratch file, elaborated once. Every type equals the scratch `signatures.md` and the README statements of §§0.3 and 0.4(a). No binder was lost, and nothing changed: `Suggested.lean` was not edited.
- Dependency check:

```text
depcheck: 223 roadmaps, 1995 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the edited README flags the same two leads as before: ModpRepresentationsOfGL2OverLocalFields §0.3 and PadicLocalLanglandsForGL2QpPartII §4.1. Both are board packages, and their READMEs exist under `packages/`. The new citation, CompletedCohomologyAndLocalGlobalCompatibility §0.7, resolves at its open head. No Lean name was flagged.
- Ownership: no new object was introduced, so no new ownership question arises. The restriction maps and `A_{ℓ,n}` of legs belong to §2.4, which this roadmap owns. Ownership against the open pull requests was checked with the `roadmaps` tools (grep and show).
- No gate failures were listed for this round. `design/plan.json` gaps are unchanged; no new supplier gap was needed.
- No new source was fetched. The added locators are in texts already cached: CDN-CURVES Remarque 8.6, Lemmes 4.4 and 6.1; THO24 Theorem 5.2 and Corollary 6.3. `sources.toml` locators were extended for CDN-CURVES and THO24. No `needs-references.toml` was written.

## For the maintainer

- **Merge-order consequence of the gap `drinfeld-steinberg-detection`.** ModularityAndLanglandsExtensionsPartII asks CompletedCohomologyAndLocalGlobalCompatibility §0.7 to supply Thorne's Theorem 5.2 and Corollary 6.3. Both use Dat's complex, which §6.10 of this roadmap owns. CompletedCohomologyAndLocalGlobalCompatibility is earlier in the merge order (line 252) than this roadmap (line 265). To fill that gap from §6.10, it must move after this roadmap, or the gap must be re-pointed to a later owner. No edit of this package can settle this.
- **§4.6 scope.** The overconvergent-affinoid case is now a `WD_K` statement only, resting on CDN-CURVES Remarque 0.16(ii), which gives no proof. The review's human-reviewer note on keeping this case still applies; nothing was changed because of it.
- **Names.** No Lean name changed. Section numbers are unchanged; §§2.4, 3.3, 4.6 and the References were edited in place.
