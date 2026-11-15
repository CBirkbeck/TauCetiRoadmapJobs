# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (pull request #2284 at 5e497cd)

**Verdict:** needs changes

Previous findings at this head: R01 (§6.4 cited Y95, Proposition 4 for the orders `O_s`) repaired: "(G86, §5, p.325: the two cases, `O_F` or some `O_s` with `s ≥ 1`, for an order containing `O₀`, before Proposition 5.3, and Proposition 5.3(2) …)", and Y95 is no longer cited in §6.4. R02 (summary block restricted Layer 2 to `ℚ_p`) repaired: "Over every nonarchimedean local field it computes torsion, Tate modules and division-field degrees and proves the explicit reciprocity law".

## R01 (P2) — Layers 5–6 and §§7.1–7.2 are narrowed to `F₀/ℚ_p` below G86 and Y95

**Location:** `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` line 1735, "Let `F₀/ℚ_p` be finite with integers `O₀`, uniformizer `ϖ₀` and residue cardinality `q₀`"; line 1923, "a finite extension of finite extensions of `ℚ_p`"; Conventions lines 135–137.

**Claim:** Lattice quotients, the lattice classification, fields of moduli, the degrees `q₀^(s−1)(q₀+1)`, `q₀^s` and the uniformizer property need characteristic zero.

**Witness:** Y95 lines 67–70 (p.294): `K₀` any nonarchimedean local field, `K/K₀` finite separable. G86 lines 45, 63: complete, finite residue field, separable quadratic. `F₀ = 𝔽_q((t))`, `F = 𝔽_(q²)((t))`, `s = 1`: `(q²−1)/(q−1) = q+1` classes.

**Repair:** State Layer 5, Layer 6 and §§7.1–7.2 for a nonarchimedean local field `F₀` of either characteristic and `F/F₀` finite separable; their inputs §§2.1–2.5 and 3.6 already hold there. Keep "`F₀/ℚ_p` finite" only on the clauses that use it: `BarsottiTate.quotientFiniteFlatSubgroup` in §5.2, §5.5, the comparisons with GrossZagierAndArithmeticHeights §7.2 (stated in mixed characteristic) in §§6.1, 6.5, 6.6, 7.1, and `localAbelianExistence`; in §6.6 identify the norm group of `M_L` by the route of §2.5 (`TauCeti.ClassFieldTheory.artinMap_restrict`, `TauCeti.ClassFieldTheory.localArtinMap_eq_zero_iff`), which needs no existence theorem. Change the Conventions bullet to "in §§0.3–0.4, Layer 4, §§5.5, 7.3–7.6 and Layers 8–9, `K` has characteristic zero". Add to §7.1 the Check "for `F₀ = 𝔽_q((t))` and `F = 𝔽_(q²)((t))` the level-one degree is `(q² − 1)/(q − 1) = q + 1`; an inseparable quadratic `F/F₀` (residue characteristic two) is excluded".

## R02 (P2) — §4.2 narrows Honda's condition (F1) to unramified extensions of `ℚ_p`, and its own Check leaves that class

**Location:** `README.md` lines 1610–1612, "For `O` the integers of an unramified extension of `ℚ_p`, finite or infinite, `π = p`, `q = p` and `σ` the Frobenius lift (condition (F1))"; lines 1629–1631.

**Claim:** Condition (F1) means the integers of an unramified extension of `ℚ_p`.

**Witness:** H70 line 508 (p.225): (F1) is "unramified valuation and (F) with `q = p`". `W(𝔽̄_p)`, used at lines 1630–1631, is complete; an infinite algebraic unramified extension is not, so "moreover complete" leaves only `W(𝔽_(p^f))`.

**Repair:** Replace the clause by: "For `O` a discrete valuation ring of characteristic zero in which `p` is a uniformizer, with an endomorphism `σ` of its fraction field inducing the `p`-power map on the residue field (condition (F1), so `π = p` and `q = p`; for example the integers of an unramified algebraic extension of `ℚ_p`, finite or infinite, the completion of such a ring, and `W(k)` for a perfect field `k`), prove the converse: …". On `W(𝔽̄_p)`: `p` is a uniformizer and the Witt Frobenius reduces to the `p`-power map, so the Check at lines 1629–1631 is then inside the hypothesis.

## R03 (P3) — §0.4 has no source locator

**Location:** `README.md` lines 713–716, "Prove that there are number fields `E₁ ⊂ E₂ ⊂ ⋯ ⊂ E_r` and height-one primes `𝔭_i` of their rings of integers, with `𝔭_(i+1)` above `𝔭_i`, and continuous field isomorphisms".

**Claim:** The target is stated with its locator.

**Witness:** Lines 711–749 cite Mathlib and Tau Ceti declarations only; no parenthesised source locator occurs in §0.4, and no entry of References covers the statement.

**Repair:** Add a locator for the density statement after "compatible with the inclusions", for example "(S. Lang, *Algebraic Number Theory*, 2nd ed., Chapter II, §2, the corollary of Krasner's lemma: a finite extension of `ℚ_p` contains a dense number field of the same degree)", with the page, and the entry under References. That text was not read for this review: confirm the page before adding it.

## R04 (P3) — The description's account of `Suggested.lean` omits the two Honda theorems

**Location:** pull request description, fourth paragraph: "`Suggested.lean` states the Lubin–Tate theorem … ; and the Lubin–Tate structure of the formal group of a supersingular elliptic curve over `W(𝔽_(p²))`."

**Claim:** The paragraph lists what `Suggested.lean` states.

**Witness:** `Suggested.lean` lines 231 and 250 state `exists_hondaType_log_of_map_zsmulSeries` and `exists_strictIso_hondaLog_of_map_zsmulSeries` (README §4.3(ii), (iii)); the paragraph names neither.

**Repair:** Insert before "and the Lubin–Tate structure": "the Honda type `p − sT²` and the strict isomorphism with the Honda model for a commutative formal group law over `W(𝔽_(p²))` whose `p²`-power Frobenius is `[sp]`, `s = ±1`;".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 `FormalModule` | `𝔽_p[t] → 𝔽_p`, `t^k b ↦ b(0)X^(p^k)`; `O_F/O_(F₀)` | `b(0)c(0)^(p^k) = b(0)c(0)`; `1+t ↦ X` vs `X + X^p`. Height `q_F^h = q₀^(fh)`, `[ϖ₀]`: `q₀^(efh)`. | additivity axiom independent; VZ07 lines 2697–2703 | none |
| §0.4 | `ℚ₂(√−1)` with `X²+3`; `u′` nonresidue mod `p` | Root field `ℚ₂(√−3)`, unramified, `≠ L`; nonresidue gives inert `p`, residue gives two completions `ℚ_p`. | statement holds; no locator | R03 |
| §1.2 `exists_lubinTate_interpolation` | `n = 0`; `p` odd, `(1+X)^p−1` vs `pX+X^p`; fraction field | `H = 0`, both sides `0`. `pc + p(p−1)/2 = p²c`, `c = 1/2`. Degree `r`: `(π − π^r)c`, nonzero in `K`. | holds | none |
| §1.3 `exists_formalModule_of_isLubinTateSeries` | `G` with `f∘G = G(f,f)`; `𝔽_q[[t]]`, `tX+X^q` | `G ≡ X+Y` solves the arity-two problem, so `G = F_f` without commutativity. `(X+Y)^q = X^q+Y^q`: additive law. | holds | none |
| §1.4 | `g = f + πX²` | `πc = π + cπ²`, `c = (1−π)⁻¹`; for `q = 2` both sides gain `1`. | holds | none |
| §2.3 `finrank_adjoin_primitive_lubinTate_root` | `ℚ₂`, `2X+X²`, `m = 1, 2`; `ℚ₃`, `−3X+X³` | Root `−2`, degree `1 = (2−1)·2⁰`; `X²+2X+2`, degree `2`. `[3]_(f′) = 3X − X³`; `ℚ₃(√3) ≠ ℚ₃(√−3)`. | holds | none |
| §2.3 `G_LT` bridge | `π′ = uπ`, `y_i = [u^(−i)]x_i` | `f′(y_(i+1)) = [u^(−i)]x_i = y_i`: a bare bijection with `A^♭` exists for every `π′`. | route needs the supplier's `q`-power coordinate, which it cites | none |
| §2.4 | level `1`; `m = 0` | Image mod `π`: `k_K^×`, order `q−1`; after `F_f[π^m]`: `U(K,m)`, `O_K^×` at `m = 0`. | consistent with §2.5 | none |
| §2.5 `artinMap_apply_lubinTate_root` | `m = 0`; `ℚ₂`, `u = 3`, `m = 1`; `x = −3`, `m = 4` | `t = 0`, `P(0) = 0`. `φ(−2) = (−1)^(1/3) − 1 = −2 = P(−2)`; truncation gives `−2/3`. `−3·5 ≡ 1 mod 16`. | holds | none |
| §2.5 `artinMap_fixes_lubinTate_roots_iff` | `m = 0`; `K/ℚ₃` unramified quadratic, `m = 2` | Right side `Kˣ`, left side all `x`. Both subgroups have index `8·9 = 72`; `exp(−3α) ≡ 1−3α mod 9`. | holds | none |
| §2.6 | `Art(π′) = Art(u)Art(π)` | `χ_π = u⁻¹`, `η_u = u`, product `1`; with `η_u⁻¹`: `u⁻²`. | holds | none |
| §3.2 | `W(𝔽₄)`, `h = X+cX²`; `𝔽_q((t))`; degree `n` over `K` | `−2c`, `c(a−a²)`, `(1−ζ)(1−ζ²) = 3`. `c_i = c_(i−1)/(t − t^(q^i))`. `b = h(t)/(t^n − t)` kills `h`, then `c`. | holds; VZ07 lines 2729–2740 | none |
| §3.4 | small extension, `α ≡ 0`; additive module | `[π]∘α = πα = 0`; `Σ a_i[π̄]^i = 0` forces `a_i = 0`. `ε(āX)^q = āεX^q`. | holds; VZ07 lines 2859–2869 | none |
| §3.5 | `h = 1, 2` | Dimensions `0`, `1`. VZ07 line 3000 and LT66 lines 214–216: `h − 1`. | supported | none |
| §4.2 | `X + X²/p`; (F1) on `W(𝔽̄_p)` | `XY`: `−2/p`; at `p = 2`, `X²Y²`: `−1/4 + 3/2 − 15/4 = −5/2`. `W(𝔽̄_p)` satisfies H70's (F1), not the README's clause. | integrality statements hold; hypothesis narrowed | R02 |
| §4.3 `exists_hondaType_log_of_map_zsmulSeries` | H70 Lemma 4.2 with `ψ₁ = [sp]_G`, `ψ₂ = X^q`; `ℓ_(−1)` | `sp·ℓ − ℓ(X^q) ∈ pO[[X]]`, times `s`. `(p−T²)⋆ℓ_(−1)`: `2p(−p)^(−j)`, `2/p` at `j = 2`. | holds for all `p` | none |
| §4.3 `exists_strictIso_hondaLog_of_map_zsmulSeries` | recursion; `f = 2X+X⁴` | `p·a_n − s·a_(n/p²) = pδ_(n,1)`: `a_(p^(2j)) = (sp)^(−j)`, unique. `1/(2−16) = −1/14`; `−1/14 − 1/2 = −4/7`. | holds; H68 lines 210–218 | none |
| §4.4 `isLubinTateSeries_zsmulSeries_formalGroup` | `p = 2`, `y²+y = x³`; `s = 1` | Over `𝔽₄`: `2 + 6 + 1 = 9 = 4+1+4`, `s = −1`. `s = 1`: `(p−1)²`. `(Frob − sp)² = 0`; `z ↦ z^q`. | holds; BKO21 lemma has the sign reversed | none |
| §5.3 | `𝔾_m`, `L₁ = T`, `L₂ = p⁻¹T` | `{a : aT ⊂ p⁻¹T} = p⁻¹ℤ_p ∋ 1`; reversed: `pℤ_p ∌ 1`. Y95 lines 141–146. | supported | none |
| Layers 5–6, §§7.1–7.2 | `F₀ = 𝔽_q((t))`, `F = 𝔽_(q²)((t))`, `s = 1` | `#(O_F/t)^× / #(O₀/t)^× = (q²−1)/(q−1) = q+1`; Y95 line 67 and G86 line 45 allow it. | sources cover equal characteristic; README does not | R01 |
| §6.1 | quadratic `F/F₀`; G86 lines 77–83 | `O₀`-height `ef·1 = 2`; height-one `O_F`-problem has `h−1 = 0` parameters. | supported | none |
| §6.2 | `L ↦ π_F⁻¹L`; `L₂ = uT` | Exponent shifts by `[k_F:k_(F₀)]`; `uT = T`. Y95 lines 156–167. | supported | none |
| §6.4 | `x = a + ϖ₀^s b` unit; `s = 0` | `a` unit, `x = a(1 + ϖ₀^s b/a)`; `1 + O_F ∋ 0`. G86 lines 198–201. | holds; locator repaired | none |
| §7.1 | `s = 1, 2` | `(q₀²−1)q₀²/((q₀−1)q₀) = q₀(q₀+1)`; `(q₀−1)q₀^(2s−1)/((q₀−1)q₀^(s−1)) = q₀^s`. | holds; G86 lines 204–209 | none |
| §7.3 | `p = 5` | Degrees `6`, `30`. BKO21 lines 715–728: `(O/p^sO)^×/(ℤ/p^s)^×`, degree `p^(s−1)(p+1)`. | supported | none |
| §8.1 | `n = 0, 1` | `[Φ₀:Φ] = p²−1`, `[Φ₁:Φ] = (p²−1)p²`. BKO21 lines 227–240. | supported | none |
| §8.4 | `A_s = ℤ_p^×(1+p^sO)`, `B_s = μ_(p²−1)(1+pℤ_p)(1+p^(s+1)O)` | Indices `(p+1)p^(s−1)`, `p^s`; `A_sB_s = B_(s−1)`, index `p^(s−1)`; intersection index `(p+1)p^s`, so `A_(s+1)`. | holds | none |
| §9.1 | `ℚ_p(√p)`, `𝔾_m`; `x ∈ G(𝔪_K)` | `N(1+√p) = 1−p` vs `1 + Tr = 1`; `Tr x = [[L:K]]x`. | holds | none |
| §9.2 | `Ψ′_(s+1)/Ψ_s` | Degree `(p+1)p^s/p^s = p+1`; `p+1 ∈ ℤ_p^×`. BKO21 lines 734–744. | supported | none |
| §9.3 | `p = 5`, `s = 0`, `ℓ_H(x) = 25` | Both routes `Tr_(Ψ′_2/Φ)`, `[30]x`, logarithm `750`; corrected sides `−750`; `[Φ₁:Φ] = 600`. | holds | none |

- Source locators checked against the text: 46 (VZ07 9, H70 11, H68 2, LT66 4, G86 5, Y95 9, BKO21 6), among them every non-LT65 locator of the fifteen sampled sections; none wrong.
- Library declarations opened at the pin: 16, among them `TauCeti/RingTheory/FormalGroup/Hom.lean:137,351`, `…/FormalGroup/Rigidity.lean:186`, `…/FormalGroup/ZSMul.lean:38,147`, `…/Logarithm/Naturality.lean:88`, `…/CoordinateChange/Lifting.lean:40`, `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:132`, `Mathlib/Analysis/Normed/Field/Krasner.lean:63`, `Mathlib/RingTheory/FormalGroup/Basic.lean:57`. No Lubin–Tate series, module or `FormalModule` at either pin.
- Cross-roadmap citations resolved: VectorBundlesAndIsocrystals Layer 5, "Lubin–Tate universal cover and sections of O(1)" (`G_LT`, `F = σ/π`, defined over `O_E`, `r_i = r_(i+1)^q`), RelativeFarguesFontaine §2.5, EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3, GrossZagierAndArithmeticHeights §7.2 (mixed characteristic), FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.8, R07.1.12–13, R07.1.20–20a, R07.2.6–2.8 with the nine planned names, BordismFormalGroups §F5, ClassFieldTheory Layers 6–8 and C.6, RamificationOfCompleteDiscretelyValuedFields §4a.3; the resolver reports none missing. AnticyclotomicLocalUnits cites `LT.k`, which the former-numbering table maps.
- Gate: every check passed. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: eight `sorry` warnings, nothing else. Elaborated signatures compared with the README for the eleven declarations: no binder lost.
- Padding probe on a scratch copy: `simp`, `rfl` and `infer_instance` each fail on all eight theorems. Headlines not stated (Tate module, `Gal(K_π/K)`, universal deformation, general Honda criterion, quasi-canonical classification, BKO squares) are named in the module docstring with the missing carrier.
- Overlap check: read AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, BordismFormalGroups, FunctionFieldArithmetic; Lubin–Tate torsion, division fields and Artin action in equal characteristic: owner this roadmap (earlier in the merge order), while FunctionFieldArithmetic §4.1 at its head (its README lines 1270–1271, 1293–1295) still states them and is to cite §§2.1–2.5; formal Lie groups and `p`-divisible groups: FiniteFlatGroupsAndIntegralPadicHodgeTheory, cited; `W(k)[[u]]`: BordismFormalGroups §F5, cited; finite division fields of `G_LT`: RelativeFarguesFontaine §2.5, cited.

Source independence: 19 passages compared with 7 sources, none shared; largest share Y95, 22 of 92 locators; contents compared with Y95: independent (Layer 5 ↔ §3, Layer 6 ↔ §4, §7.2 ↔ §6 only, in the order that the *Needs:* §5.2 of §6.2 and §6.6 of §7.2 force; these layers also carry G86 and BKO21 material, and Y95 §§7–14 have no counterpart); the text of LT65 could not be read.

## Not verifiable

- §2.4 (LT65, Theorem 2, pp.383–384) and §2.6 (LT65, §2, Lemma 2, Theorem 3 and its corollary, pp.385–387): LT65 is recorded as uncertified and its text is not in the sources cache; both sections were tested by computation only.
- The LT65 locators of §§8.1 and 9.1 and the remaining LT65 locators (§§0.2, 0.3, 1.1–1.4, 2.2, 2.3, 2.5, 8.2): same reason.
- The Lang locator proposed in R03: the text was not read.

## Source issues

- **Error** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `∓x² + p` and parameter `±p`, as its own proof (Frobenius equals `±p`) shows; affects a stated result.

## For the human reviewers

- **Licence.** 15 of the 92 source locators cite LT65 (Annals of Mathematics 81, 1965), recorded as uncertified: the wording of `README.md` §§1.1–2.6 was not compared with that text.
