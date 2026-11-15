# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (pull request #2284 at 95a3644)

**Verdict:** needs changes

Previous findings at this head: R01 (Layers 5–6 and §§7.1–7.2 narrowed to `F₀/ℚ_p`) repaired: "Let `F₀` be a nonarchimedean local field of either characteristic and `F/F₀` a finite separable extension", with the `𝔽_q((t))` Check in §7.1 and §6.6 routed through `TauCeti.ClassFieldTheory.artinMap_restrict`, `TauCeti.ClassFieldTheory.localArtinMap_eq_zero_iff` and uniqueness. R02 ((F1) narrowed) repaired: "(F) with `q = p` for a ring `O` in which `p` is a uniformizer, so that `π = p`". R03 (§0.4 locator) repaired: "Mil20, Corollary 7.62, p.132, from Krasner's lemma, Proposition 7.60, p.131", both read at Mil20 lines 5785–5786 and 5820–5821. R04 (description) repaired: "the Honda type `p − sT²` and the strict isomorphism with the Honda model for a commutative formal group law over `W(𝔽_(p²))`".

## R01 (P3) — Conventions make `K/ℚ_p` finite in all of Layer 4, against §§4.1–4.2

**Location:** `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` lines 140–141, "in §§0.3–0.4, Layer 4, §§7.3–7.6 and Layers 8–9, `K` has characteristic zero, so `K/ℚ_p` is finite with ramification index `e` and residue degree `f`".

**Claim:** Throughout Layer 4 the field `K` is a finite extension of `ℚ_p`.

**Witness:** README line 1575: "`O` be a discrete valuation ring of characteristic zero, complete or not, with fraction field `K`"; lines 1641–1643 use the integers of `ℚ_p^ur` and `W(𝔽̄_p)`, whose fraction fields are infinite over `ℚ_p`.

**Repair:** Replace the clause by: "in §§0.3–0.4, 4.3–4.4 and 7.3–7.6 and Layers 8–9, `K` has characteristic zero, so `K/ℚ_p` is finite with ramification index `e` and residue degree `f`; in §§4.1–4.2, `O` is any discrete valuation ring of characteristic zero satisfying Honda's condition (F), and its fraction field `K` need not be complete or finite over `ℚ_p`." With this text `W(𝔽̄_p)[1/p]` and `ℚ_p^ur` are inside the stated convention.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, Layer 4 clause | `O` the integers of `ℚ_p^ur`; `W(𝔽̄_p)` | Both satisfy (F1) (H70 lines 314–317, 508–512); `[K:ℚ_p]` infinite, against "`K/ℚ_p` is finite". | contradiction with §§4.1–4.2 | R01 |
| §0.4 | `r = 1`; `ℚ₂(√−1)` with `X² + 3` | Mil20 lines 5820–5821: `[L:ℚ] = [K:ℚ_p]`, `L·ℚ_p = K`. Root field `ℚ₂(√−3)`, unramified, `≠ ℚ₂(√−1)`. | locator supports the statement | none |
| §1.2 `exists_lubinTate_interpolation` | `n = 0`; odd `p`, `(1+X)^p − 1` vs `pX + X^p`; `W(𝔽_(p²))`, `q = p`; over `K` | `H = 0`. `pc + p(p−1)/2 = p²c`, `c = 1/2`. `ā^p ≠ ā`. Degree `r`: divisor `π − π^r ≠ 0`. | holds | none |
| §1.3 `exists_formalModule_of_isLubinTateSeries` | `G` with `f∘G = G(f, f)`, not assumed commutative; `𝔽_q[[t]]`, `tX + X^q` | `G ≡ X + Y` solves the arity-two problem, so `G = F_f`. `(X+Y)^q = X^q + Y^q`: additive law. | holds | none |
| §1.4 | `g = f + πX²`, `q > 2` and `q = 2` | `πc = π + cπ²`; at `q = 2`, `πc + 1 = 1 + π + cπ²`; `c = (1 − π)⁻¹` in both. | holds | none |
| §2.2 | invariant differential `P(X)dX`; `𝔽_q((t))` | `P([π]X)·[π]′ = πP(X)`, so `[π]′ = π·unit`, nonzero in characteristic `p`. `T_π` killed by `p`: no `ℤ_p`-lattice. | holds; Y95 lines 117–120 | none |
| §2.3 `finrank_adjoin_primitive_lubinTate_root` | `ℚ₂`, `2X + X²`, `m = 1, 2`; `ℚ₃`, `−3X + X³` | Root `−2`, degree `1`; `X² + 2X + 2`, degree `2`. `[3]_(f′) = 3X − X³`; `ℚ₃(√3) ≠ ℚ₃(√−3)`. | holds | none |
| §2.5 `artinMap_apply_lubinTate_root` | `m = 0`; `ℚ₂`, `u = 3`, `m = 1`; `x = −3`, `m = 4` | `P(0) = 0 = σ(0)`. `P = X`: `−2 ↦ −2`; truncation `X/3` gives `−2/3`. `(−3)·5 = −15 ≡ 1 mod 16`. | holds | none |
| §2.5 `artinMap_fixes_lubinTate_roots_iff` | `m = 0`; `K/ℚ₃` unramified quadratic, `m = 2` | Right side `Kˣ`, left side every `x`. Both subgroups have index `8·9 = 72`; `exp(−3α) ≡ 1 − 3α mod 9`. | holds | none |
| §3.3 | `𝔽₂[ε]/(ε²)`, `h = (1+ε)X`; `E_t : y² + txy + y = x³` | `(1+ε)⁻¹ = 1+ε`: law `X + Y + (1+ε)XY`, `[2] = (1+ε)X²`. `Δ = −8t³ − 27 + 9t³ = t³ − 27`. | consistent; VZ07 lines 2878–2884 | none |
| §4.1 | `ℓ = Σ(−p)^(−j)X^(p^(2j))`; `q = 1` | `p(−p)^(−j) + (−p)^(1−j) = 0`; with `p − T²`: `2p(−p)^(−j)`, `2/p` at `j = 2`. `2 + 1 + 1 + ⋯` diverges. | holds; H70 lines 309–353 | none |
| §4.2 | H70's (F1); `X + X²/p` | H70 line 508: unramified valuation and (F) with `q = p`, as the README now reads. `XY` coefficient `−2/p`. | holds | none |
| §4.3 `exists_hondaType_log_of_map_zsmulSeries` | H70 Lemma 4.2 with `[sp]_G` and `X^q` | `sp·ℓ − ℓ(X^q) ∈ pO[[X]]` (H70 lines 738–740), times `s`: `pℓ − sℓ(X^(p²))`. | holds for every `p` | none |
| §4.3 `exists_strictIso_hondaLog_of_map_zsmulSeries` | recursion; `f = 2X + X⁴` | `(sp)^(−j)(p − s·sp) = 0` for `j ≥ 1`. `1 + 16a = 2a`, `a = −1/14`; `−1/14 − 1/2 = −4/7 ∈ ℤ₂`. | holds; H70 lines 431–435 | none |
| §4.4 `isLubinTateSeries_zsmulSeries_formalGroup` | `p = 2`, `y² + y = x³` | `#E(𝔽₂) = 3`, `#E(𝔽₄) = 9 = 4 + 1 + 4`, `s = −1`; `(Frob − sp)² = 0`; `z ↦ z^q`. | holds; BKO21 lemma has the sign reversed | none |
| §5.4 | unramified quadratic, level one; `a ∈ O_F^×` | Stabilizer of a line `k_(F₀)^×`: degree `(q₀²−1)/(q₀−1) = q₀+1` vs `q₀²−1`. Y95 line 175: `a⁻¹L`. | supported | none |
| §5.5 | equal characteristic; `O₀ = W(𝔽_(p²))`, subgroup of order `p` | `[p] = 0` for an `O₀`-module, `[p] ≠ 0` for a curve. An `𝔽_p`-line in `𝔽_(p²)` is not `O₀`-stable. | consistent | none |
| §6.2 | `L ↦ π_F⁻¹L` | Y95 lines 162–167: same lifting; exponent shifts by `[k_F:k_(F₀)]`. | supported | none |
| §6.3 Check | cubic `O = O₀ + ϖ₀O_F` | Lengths of `O_F/𝔠` and `O/𝔠`: `3 ≠ 2·1`; `O_F/O` has length `2 ≠ 1`. Y95 lines 305–309. | holds | none |
| §6.4 | `x = a + ϖ₀^s b` a unit; `s = 0` | `a` is a unit, `x = a(1 + ϖ₀^s b/a)`; `1 + O_F ∋ 0`. G86 lines 198–201. | holds | none |
| §6.6, either characteristic | uniqueness at the pin | `localClassField_unique` (`LocalExistence/Correspondence.lean:68`) assumes only `IsNonarchimedeanLocalField`; no `CharZero`. | route holds in characteristic `p` | none |
| §7.1 | `s = 1, 2`; `𝔽_q((t)) ⊂ 𝔽_(q²)((t))` | `(q₀²−1)q₀^(2s−2)/((q₀−1)q₀^(s−1)) = q₀^(s−1)(q₀+1)`; ramified `q₀^s`; `(q²−1)/(q−1) = q+1`. | holds; G86 lines 204–209 | none |
| §7.2 | `ℚ₃(π)`, `π² = 3` | `X³` coefficient of `[π]∘[π]`: `π + π³ = 4π`; vertices `(1,2), (3,1), (9,0)`, as Y95 line 362 with `e = 2`, `f = 1`. | supported | none |
| §7.3 | `p = 5` | BKO21 lines 726–728: `(O/p^sO)^×/(ℤ/p^s)^×`, degree `p^(s−1)(p+1)`: `6`, `30`. | supported | none |
| §7.5 | `H_1` over `O_(Ψ′_1)` | `−pX + X^(p²) ∈ ℤ_p[X]`, so `H̄^(p) = H̄`; `End = ℤ_p + pO`, index `p`; `v(−p) = p + 1`. | holds | none |
| §7.6 | level `s ≥ 1`; `s = 0` | BKO21 lines 754–760: `p` lattices `(1 + ap^s)p^(−s−1)ℤ_p t + T` and one `p^(−s)ℤ_p t + p⁻¹T`; `p + 1` in all. | supported | none |
| §8.4 | `p = 5` | `[Ψ′_(n+1):Φ]/(p+1)`: `6/6 = 1`, `30/6 = 5`, `150/6 = 25 = p^n`. | holds | none |
| §9.1 | `ℚ_p(√p)`, `𝔾_m`; `x ∈ G(𝔪_K)` | `N(1 + √p) = 1 − p` vs `1 + Tr = 1`; `Tr x = [[L:K]]x`. BKO21 lines 736–744. | holds | none |

- Source locators checked against the text: 66 (G86 7, Y95 14, H70 15, H68 2, LT66 6, VZ07 12, BKO21 8, Mil20 2), among them every non-LT65 locator of the fifteen sampled sections; none wrong.
- Library declarations opened at the pin: 58 names of the supplier contracts resolved in the cited files, among them `TauCeti/RingTheory/FormalGroup/Hom.lean:137,351,433`, `…/FormalGroup/ZSMul.lean:38,147`, `…/FormalGroup/Rigidity.lean:186`, `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,132`, `…/Local/Reciprocity.lean:139`, `…/LocalExistence/Correspondence.lean:68`, `Mathlib/RingTheory/FormalGroup/Basic.lean:57,75`. No Lubin–Tate series, module or `FormalModule` at either pin.
- Cross-roadmap citations resolved: VectorBundlesAndIsocrystals Layer 5, "Lubin–Tate universal cover and sections of O(1)" (`G_LT` defined over `O_E`, `r_i = r_(i+1)^q`); RelativeFarguesFontaine §2.5; EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3; GrossZagierAndArithmeticHeights §7.2 (mixed characteristic); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.8, R07.1.12–13, R07.1.20 (Dedekind base), R07.1.20a (mixed characteristic), R07.2.6–2.8; BordismFormalGroups §§F1, F5; ClassFieldTheory Layers 6–8 and C.6; LocalFieldsRamification Layers 0–2; RamificationOfCompleteDiscretelyValuedFields §4a.3 (both characteristics); ModularCurves §§0B, 0C, 2B, 7C–7F through its former-label table; EllipticCurves Layers 1, 3. None missing. AnticyclotomicLocalUnits and ComplexMultiplicationAndExplicitReciprocityPartII cite `LT.k` and former titles, which the former-numbering table maps.
- Gate: every check passed. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: eight `sorry` warnings, nothing else. `Suggested.lean` is unchanged since the previous head; the elaborated signatures keep `[IsDomain O]`, `[IsDiscreteValuationRing O]` and `[Finite (IsLocalRing.ResidueField O)]` and agree with the README statements.
- Padding probe on scratch copies: `simp`, `rfl`, `infer_instance` and `trivial` each fail on all eight theorems. Headlines not stated (Tate module, `Gal(K_π/K)`, universal deformation, general Honda criterion, quasi-canonical classification, BKO squares) are named in the module docstring with the missing carrier.
- Pull request text read against the head: title, summary block and prose agree with it; nothing left out.
- Overlap check: read AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, BordismFormalGroups, FunctionFieldArithmetic; Lubin–Tate torsion, division-field degree and Artin action in equal characteristic: owner this roadmap §§2.1–2.5 (earlier in the merge order), while `TauCetiRoadmap/FunctionFieldArithmetic/README.md` at its open head (lines 503–504, 1294–1295, 1305–1310) still reads §§2.1–2.5 as `ℚ_p`-only and states `lubinTate_torsion` itself, and is to cite them; formal Lie groups and `p`-divisible groups: FiniteFlatGroupsAndIntegralPadicHodgeTheory, cited; `W(k)[[u]]`: BordismFormalGroups §F5, cited; local points and their recurrences: AnticyclotomicLocalUnits, a consumer.

Source independence: 18 passages compared with 8 sources, none shared; largest share Y95, 24 of 95 locators; contents compared with Y95: independent (Layer 5 ↔ §3, Layer 6 ↔ §4, §7.2 ↔ §6 only, in the order that the *Needs:* §5.2 of §6.2 and §6.6 of §7.2 force; these layers also carry G86 and BKO21 material and the elliptic comparison, and Y95 §§7–14 have no counterpart); the text of LT65 could not be read.

## Not verifiable

- The fifteen LT65 locators (§§0.2, 0.3, 1.1–1.4, 2.2–2.6, 8.1, 8.2, 9.1 and the `Suggested.lean` docstrings): LT65 is recorded as uncertified and its text is not in the sources cache; those statements were tested by computation only.

## Source issues

- **Error** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `∓x² + p` and parameter `±p`, as its own proof (Frobenius equals `±p`) shows; affects a stated result.

## For the human reviewers

- **Licence.** 15 of the 95 source locators cite LT65 (Annals of Mathematics 81, 1965), recorded as uncertified: the wording of `README.md` §§1.1–2.6 was not compared with that text.
