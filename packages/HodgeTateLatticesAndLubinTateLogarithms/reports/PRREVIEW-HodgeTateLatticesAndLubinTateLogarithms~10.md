# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 154 changed lines since `74a09b7`. The change adds *Origin*, *Method of the formal proof* and *Corollary of* labels, the conventions that explain them, new references, and updated Dependencies, Scope and Downstream lines; it removes or renumbers nothing and leaves `Suggested.lean` as it was. I checked every new source locator I could read legally against its text. I also checked the five *Corollary of* deductions (0.5c, 0.5f, 3.2, 3.4, 3.5) against the supplier sections at this head; they hold, and so do the new cross-roadmap citations. There are no findings. There are three small corrections, none blocking: a *Method* sentence in 0.5h that can be read against statement (4), an incomplete account of Pilloni–Stroh at `p = 2`, and a sentence of the description that the head contradicts. Nothing in this folder's change is left for a human to decide.

## C01 — Read literally, the *Method* label of 0.5h says the colength of `𝒜` is at least `p^{2g}·deg(ω_{A[p]})`, which contradicts (4)

In the *Method of the formal proof* of 0.5h (line 396), the clause "is at least twice the colength of `𝒜`, which is at least `p^{2g}·deg(ω_{A[p]})`" attaches "which" most naturally to "the colength of `𝒜`". Read that way it is false. Statement (4) gives `2·colength(𝒜) = p^{2g}·deg(ω_{A[p]})`. For `A[p] ≅ μ_p × ℤ/p` (`g = 1`) the colength is `p·(p/2) = p²/2`, which is less than `p² = p^{2g}·deg(ω)`. The route of 0.5h writes the chain correctly, with twice the colength in the middle. Writing "is at least `2·colength(𝒜)`, and `2·colength(𝒜) ≥ p^{2g}·deg(ω_{A[p]})`" would remove the ambiguity.

## C02 — Pilloni and Stroh also treat `p = 2`, conditionally; the restriction to `p ≥ 3` belongs to HodgeTateAndCanonicalSubgroups §5.5

The reference entry for Pilloni and Stroh (line 972) and the *Origin* labels of 0.5a and 0.17a (lines 50 and 432) say "for `p ≥ 3`". Pilloni and Stroh (2016) prove the case `p ≥ 3`, but they also define `ω^mod` at `p = 2`:

- Remarque 1.10 uses, at `p = 2`, a cokernel bound with `2` in place of `1/(p − 1)`, which Fargues communicated to them and which is not written up.
- Lemme 1.12 and Notation 1.1 give the `p = 2` levels (`n ≥ 2`, `n₀ = 2g + 1`).

The `p ≥ 3` restriction is the one HodgeTateAndCanonicalSubgroups §5.5 adopts. That remark is also the only printed trace of the `p = 2` bound besides Fargues (2011), so it bears on the *Origin* of 0.5b. Its exponent `2`, the factor `4` at `p = 2`, is the factor [FormalProof] uses. A clause such as "(at `p = 2` conditionally on a bound with exponent `2`, their Remarque 1.10)" in the reference entry would be accurate.

## C03 — The description says that LubinTateFormalModulesAndQuasiCanonicalLifts §4.2b covers a Frobenius lift on any valuation ring and comes from §4.2a; the head states it over `ℤ_p` only

The description's sentence "LubinTateFormalModulesAndQuasiCanonicalLifts §4.2b, for a Frobenius lift on the valuation ring of any nonarchimedean field of characteristic zero and residue characteristic `p`, from its §4.2a" does not match the head. At this head §4.2b states the Dieudonné–Dwork lemma for `ℚ_p[[X]]`, with a proof route by induction on the degree after Krattenthaler–Rivoal, and does not use §4.2a. This README also describes it as the case `K = ℚ_p`, `σ = id` of 3.3 (the *Origin* of 3.3, line 699; Scope; Dependencies).

The difference matters here. If §4.2b had the wider form, the first statement of 3.3 would be a corollary of it and would need a *Corollary of:* line. The right text is "LubinTateFormalModulesAndQuasiCanonicalLifts §4.2b, over `ℤ_p` (Krattenthaler and Rivoal, Lemma 1)". If the wider form was intended, it should be stated in §4.2b, and 3.3 should then cite it.

## Questions for the author

- The *Origin* of 0.18a (line 558) and the reference entry (line 958) place the Raynaud extension in Faltings–Chai, chapter III. NeronModelsAndSemistableAbelianVarieties (README line 1443) cites it at chapter II §1, p. 34, and EisensteinIdealAndRationalTorsion cites III §7 for the torsion of degenerations. Is chapter III meant for the finite and toric parts, with chapter II for the Raynaud extension? I could not open Faltings–Chai to check.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Headline 0.5b (a) at `p = 2` (Lean `smul_mem_span_cotangentMap_groupLike`) | `μ₂`; Oort–Tate order 2 with `v(a) = v(b) = 1/2` | `μ₂`: cokernel 0. Oort–Tate: group-likes `1, 1 + bx`, cokernel `O_C/(c)` with `v(c) = 1/2 ≤ v(2) = 1` | holds |
| Headline 3.1 (Lean `exists_twistedLog_inverse_norm_coeff_le`) | `S` a point, `ς = id`, `q = p` | `g = T − T^p/p + …`: `v = −1`; bound `−(p−1)/(p−1) = −1`, attained | holds |
| 0.5b *Origin*: Fargues (2011) has no hypothesis on `p` | Far11 lines 1264, 1289–1290, 1335, 1378 | Théorèmes 2 and 3 carry no `p`-hypothesis; Théorème 1 assumes `p ≠ 2`; Remarque 2 asserts `p = 2` without proof | holds |
| Scope: Scholze–Weinstein Prop. 4.3.6, up to `ε` | SW12 lines 1457–1467 | killed by `p^{1/(p−1)+ε}`, no `p` hypothesis; the `(C, O_C)` case cites Fargues | holds |
| 0.5f *Corollary of* HodgeTateAndCanonicalSubgroups §0.5, odd `p` | §0.5 on main; route of 0.5f | §0.5: odd `p`, `v(a) ≥ 1/(p−1)`. 0.5f route: 0.5b (a) for `H^D`. `p = 2` correctly excluded | holds |
| 0.5c (b), (c) *Corollary of* NashBlowups §§1.2, 1.3 | kernel of `π*F → L_F` against kernel of `π*F → π*ω_G` | both are the torsion of `π*F`, so `L_F` is the image lattice; iso over the locally free locus | holds |
| 3.2 (a) as LubinTate §4.2a (ii), `f = ℓ` | `S = O`, `τ = σ²`, `q = p²`, `s₁ = p⁻¹` | `σ²b ≡ b^{p²}`; `τ^r(p⁻¹)·pO = O ⊆ O`; `D(ℓ) = T` | hypotheses met |
| 3.5 integrality via §4.2a | `λ_s − p⁻¹λ_{s−2}(T^{p²}) = T_s`; `z_s` | `s₁ = p⁻¹·`(shift `s ↦ s−2`); `D(z)_s = Σ_rσ^s(ω_r)X_r` integral | holds |
| 3.3 at `K = ℚ_p`, `σ = id` against LubinTate §4.2b and KR08 Lemma 1 | KR08 line 506 | `S(z^p)/S(z)^p` form ⇔ `exp` form, by `v_p(p^k/k!) ≥ 1` and `v_p(p^k/k) ≥ 1` | equal |
| 3.4 (a) from LubinTate §4.3a (ii) | coefficients of `δ_F g₀` | in `ℚ_p`; integral over `W(𝔽̄_p)` ⇔ over `ℤ_p` ⇔ over `O` | holds |
| 3.4 Corollary remark: `f([a]x) − a·f(x)` integral | `a = n ∈ ℤ`, then `p`-adic limits | sum of `δ_F f` terms on integral arguments; limits of `[n]` converge coefficientwise | holds |
| 3.4 *Origin*: BW Lemma 2.5 | BW11 line 345; `n = 2`, `π = sp` | basis `log_H`, `π⁻¹log_H(T^q)` = `ℓ_s`, `s·g₀` | holds |
| 0.5d *Origin* relation | against 0.5d (b); first Check | identical formula; `r = (1,0)`, conjugate ranks `(0,1)`: `S = p/(p²−1)` | consistent |
| 0.5d *Origin*: Hernandez | Her16 lines 1727, 1764 | `deg Coker = K_τ + Ha_τ/(p^f−1)` when `Ha_τ < 1/2` and `p − 1 > q_τ` | holds |
| 0.5h *Method* chain against (4) | `μ_p × ℤ/p`, `g = 1` | `2·colength = p²` equals `p^{2g}·deg ω`; "colength `≥ p²`" fails, since `p²/2 < p²` | C01 |
| 0.5g *Origin*: `|c| = |ζ_p − 1|`, `det Π = c^g` | `p = 2` Check; 0.5g (c) | `c = −2`, `|−2| = |ζ₂ − 1|`; `det Π = c^g` from `Π^TJΠ = cE` | holds |
| Pilloni–Stroh "for `p ≥ 3`" | PS16 lines 226–228, 245–246, 256 | `p = 2` treated with exponent `2` in place of `1/(p−1)` | C02 |
| 3.1 *Origin*: Lang via Schneider–Teitelbaum | SchneiderTeitelbaum2001 lines 531, 572–576 | `log_G: B(r) ≅ B(r)` for `r < p^{−1/e(q−1)}`, `e = 1` here | holds |
| 0.18a *Origin*: SW Theorem B | SW12 lines 126–130 | pairs `(T, W)`, `W = Lie G ⊗ C`, abstract | holds |
| 3.4 *Origin*: Lazard Lemme 3 | Laz55 line 264 | symmetric homogeneous 2-cocycles of degree `q` are `a·C_q` | holds |
| Downstream: §8.14b also takes 0.18a | ArithmeticVolumes README lines 594, 612, 664 | 0.18a cited inside §8.14b | holds |

- Source locators checked against the text: 17. Far11 Thms 1–3 and Rem. 2; SW12 Prop. 4.3.6 and Thm B; BW11 Def. 2.3, Prop. 2.4, Lemma 2.5; KR08 Lemma 1; Her16 Props 6.2, 6.9, Thm 6.10; Laz55 Lemme 3; PS16 §1.8; Sch13 III.3; SchneiderTeitelbaum2001 §3.
- Cross-roadmap citations resolved at this head or on main: 13. HodgeTateAndCanonicalSubgroups §§0.5, 2.4, 2.5, 5.5; LubinTate §§4.2, 4.2a, 4.2b, 4.3, 4.3a; NashBlowups §§1.2, 1.3; AlgebraicModuli §5.4; ArithmeticVolumes §8.14b; TaylorBounds and LocalGain lines unchanged.
- The README at the merge base was compared with the head heading by heading: identical. No item was removed, renumbered or reduced; all 18 sections carry both labels.
- Overlap check: I read HodgeTateAndCanonicalSubgroups (owner of Fargues' bound for odd `p` and of `ω^mod`, cited), LubinTateFormalModulesAndQuasiCanonicalLifts (owner of §§4.2a, 4.2b, 4.3a, cited), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (consumer), TaylorBoundsAndDepthsOnHeightTwoFormalGroups (consumer) and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (scope). Nothing shared: each object has its single owner as cited.
- Dependency check: `depcheck: 132 roadmaps, 1473 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 68, 106), nothing else. The file is unchanged since the merge base. The elaborated types of its three declarations match the README's statements, and no binder is lost.
- No change outside the folder beyond the folders the pull request owns.

Source independence: changed passages only; 10 passages compared with 9 sources (Far11, SW12, PS16, BW11, KR08, Her16, Laz55, Sch13, SchneiderTeitelbaum2001); none shared beyond statements of a dozen words that the mathematics forces. Largest share: [FormalProof], 37 of about 110 source mentions. Arrangement not compared, since no layer is added, removed or reordered.

Research link: 0.5b and 2.4 are the integral Hodge–Tate bounds of Fargues (2010, 2011) and Scholze–Weinstein (2013). Pilloni–Stroh (2016) build the modified Hodge bundle on them, and 0.5a–0.5c and 0.17 generalise it. 3.4 rests on the quasi-logarithms of Gross–Hopkins (1994), as in Boyarchenko–Weinstein (2016). This line rests on the README's references and on Far11, SW12, PS16 and BW11 as read here.

## Not verifiable

- The 18 *Method of the formal proof* labels: not compared with the [FormalProof] repository, which has no local copy and which this review did not read. They were checked only against the README's own statements and routes.
- Colmez (1992), Théorème 5.2 (0.5g): the sources service found no legal copy.
- Fargues (2010), §9, Théorème 7: the sources service found no legal copy (publisher landing page only).
- Hazewinkel (1978) I.2, II.10; Lang (1978) §8.6 Lemma 4 and Lang (1980) ch. 14 (checked only as cited by Schneider–Teitelbaum and by Krattenthaler–Rivoal); Gross–Hopkins (1994) Prop. 13.8 (checked as quoted by Boyarchenko–Weinstein); Mumford (1969); Breen (1983); SGA 7 IX; Faltings–Chai ch. III: books or proceedings with no open copy; not fetched.
- Hernandez: only arXiv v1 read; that the published numbering agrees was not checked.

## Source issues

- **Misprint** in Far11 at §5, introduction (p. 927) and §5.4 (p. 935): the source calls the same cokernel theorem of its reference [16] (Fargues 2010) Théorème 7 on p. 927 and Théorème 6 on p. 935; it should be one number throughout (HodgeTateAndCanonicalSubgroups cites Théorème 7); affects nothing.
- **Gap** in Far11 at Théorème 2 and Remarque 2 (pp. 933–935): the theorem has no hypothesis on `p`, but its proof uses Théorème 1, proved via Faltings only for `p ≠ 2`, and Remarque 2 asserts the `p = 2` case without proof; it should be restricted to odd `p` or carry a proof at `p = 2`; affects nothing (this roadmap proves `p = 2` by its own route).
- **Gap** in SW12 at Proposition 4.3.6, proof (p. 40): the argument reaches `p^{2/(p−1)+ε}` and leaves to the reader the improvement to `p^{1/(p−1)+ε}`; it should give that step; affects nothing (the `(C, O_C)` case used here is Fargues').

## For the human reviewers

- The decisions recorded for this pull request do not bear on this folder's change: it removes no section, and its five *Corollary of:* lines name sections present at this head.
