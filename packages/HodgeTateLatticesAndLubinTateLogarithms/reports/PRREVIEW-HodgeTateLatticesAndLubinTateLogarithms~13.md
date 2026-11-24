# Review of HodgeTateLatticesAndLubinTateLogarithms (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HodgeTateLatticesAndLubinTateLogarithms/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 156 changed lines since `b8f3652`. The change adds the *Origin*, *Method of the formal proof* and *Corollary of* labels with their conventions, new references, and updated Dependencies, Scope and supplier lines; since the previous review it also makes 3.3 a corollary of LubinTateFormalModulesAndQuasiCanonicalLifts §4.2b. I checked that deduction and the other five *Corollary of* lines against the supplier sections at this head, and the new locators I could read legally against their texts. There are no findings. Two small corrections from the previous review are still open (a *Method* sentence of 0.5h that reads against statement (4), and the account of Pilloni–Stroh at `p = 2`); neither blocks, and nothing is left for a human to decide.

## C01 — Read literally, the *Method* label of 0.5h says the colength of `𝒜` is at least `p^{2g}·deg(ω_{A[p]})`, which contradicts (4)

In the *Method of the formal proof* of 0.5h (line 396), "is at least twice the colength of `𝒜`, which is at least `p^{2g}·deg(ω_{A[p]})`" lets "which" attach to "the colength of `𝒜`". Read that way it is false: statement (4) gives `2·colength(𝒜) = p^{2g}·deg(ω_{A[p]})`, and for `A[p] ≅ μ_p × ℤ/p` (`g = 1`, `v(c) = 1/(p − 1)`) the colength is `p²/2 < p² = p^{2g}·deg(ω)`. The route of 0.5h (line 419) writes the chain correctly, with `2·colength(𝒜)` in the middle. Writing "is at least `2·colength(𝒜)`, and `2·colength(𝒜) ≥ p^{2g}·deg(ω_{A[p]})`" removes the ambiguity.

## C02 — Pilloni and Stroh also treat `p = 2`, conditionally; the restriction to `p ≥ 3` is that of HodgeTateAndCanonicalSubgroups §5.5

The reference entry for Pilloni and Stroh (line 974) and the *Origin* labels of 0.5a and 0.17a (lines 50 and 432) say "for `p ≥ 3`". Their Théorème 1.9 assumes `p ≥ 3` (PS16 line 221), but Remarque 1.10 (PS16 lines 226–228) uses at `p = 2` a cokernel bound with exponent `2` in place of `1/(p − 1)`, communicated by Fargues and not written up, and the later statements carry `p = 2` variants (PS16 lines 245–246, 256). A reader takes from "for `p ≥ 3`" that the source is silent at `p = 2`; it is not, and its exponent `2` (the factor `4`) is the factor that 0.5b attributes to [FormalProof]. A clause in the reference entry such as "(at `p = 2` conditionally on a bound with exponent `2`, their Remarque 1.10)" would be accurate.

## Questions for the author

- The *Origin* of 0.18a and the reference entry place the Raynaud extension in Faltings–Chai, chapter III. NeronModelsAndSemistableAbelianVarieties cites it at chapter II §1. Is chapter III meant for the finite and toric parts of the torsion only? I could not open Faltings–Chai (no legal copy) to check.

## Previous findings

The previous review had no findings and three small corrections.

- C01 (0.5h *Method* sentence) — not repaired: line 396 still reads "is at least twice the colength of `𝒜`, which is at least `p^{2g}·deg(ω_{A[p]})`". Kept as C01 above.
- C02 (Pilloni–Stroh at `p = 2`) — not repaired: lines 50, 432 and 974 still say "for `p ≥ 3`" with no mention of Remarque 1.10. Kept as C02 above.
- C03 (the description's account of LubinTateFormalModulesAndQuasiCanonicalLifts §4.2b) — repaired: §4.2b at this head states the lemma "for a Frobenius lift" on the valuation ring of any nonarchimedean field of characteristic zero and residue characteristic `p`, deduced from §4.2a, as the description says, and 3.3 now carries the *Corollary of:* line that this form calls for.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 3.3 first statement as the complete-`K` case of LubinTate §4.2b | hypotheses side by side; `Ψ = X`; Artin–Hasse exponent | §4.2b: any valued `K`, same `σ`, same exponential form. `X^p − pX ∉ pO[[X]]`, `1/p!` not integral; `−pX ∈ pO[[X]]` | holds |
| 3.3 last clause from the criterion (*Corollary of*) | `h ≃ 0`, `p ∤ N` | `(h/N)^σ(X^p) − p·h/N = N⁻¹(h^σ(X^p) − ph)`; `σ(N⁻¹) = N⁻¹`, `|N| = 1`; lies in `pO[[X]]` | holds |
| LubinTate §4.2b route via §4.2a, `f = log(1 + X)` | coefficient of `D(f)` at `X^{pm}`; `p = 2`, `m = 1, 2` | odd `p`: `0`. `p = 2`: `(−1 − (−1)^{m+1})/2m` = `−1/m` (`m` odd), `0` (`m` even); `τ^r(p⁻¹)·pO = O` | holds |
| 3.3 *Origin*: KR Lemma 1 is the case `ℚ_p`, `σ = id` | KR08 lines 504–510 | `S ∈ 1 + Σz_iℤ_p[[z]]` iff `S(z^p)/S(z)^p ∈ 1 + pΣz_iℤ_p[[z]]`; several variables | holds |
| Headline 0.5b (a) at `p = 2` (Lean `smul_mem_span_cotangentMap_groupLike`) | `μ₂`; constant `ℤ/2` | `μ₂`: `I² = 2I`, `ω = O/2` spanned by `x − 1`, cokernel `0`. `ℤ/2`: `I² = I`, `ω = 0` | holds |
| Headline 3.1 (Lean `exists_twistedLog_inverse_norm_coeff_le`) | point, `q = p`; `p = 3`, `q = 2`; degree 1 | `g = T − T^p/p + …`: norm `p` = bound `p^{(p−1)/(p−1)}`; `−T²/3`: `3 ≤ 3¹`; degree 1: `1 ≤ p⁰` | holds, attained |
| 0.5b *Origin*: Fargues (2011) without hypothesis on `p` | Far11 lines 1264, 1289–1290, 1335–1339, 1378–1380 | Théorème 1 assumes `p ≠ 2`; Remarque 2: at `p = 2` cokernel killed by `2`; Théorèmes 2, 3 carry no hypothesis | holds |
| 0.5f *Corollary of* HodgeTateAndCanonicalSubgroups §0.5, odd `p` only | §0.5 at this head; route of 0.5f | §0.5: odd `p`, `v(a) ≥ 1/(p−1)`, `p = 2` out of scope; 0.5f applies the bound to `H^D` | holds |
| 0.5c (b), (c) *Corollary of* NashBlowups §§1.2, 1.3 | §1.2 bullets, §1.3 statement | locally free rank-`r` quotient `π_N*F → L_F`, identity over `U`; unique lift for reduced `Z` with dense `h⁻¹(U)` | holds |
| 3.2 (a) as LubinTate §4.2a (ii), `f = ℓ` | `S = O`, `τ = σ²`, `q = p²`, `s₁ = p⁻¹` | `D(ℓ) = ℓ − p⁻¹ℓ(X^{p²}) = T`; `D(g)` integral ⇒ `ℓ⁻¹(g)` integral | holds |
| 3.4 (a) *Corollary of* LubinTate §4.3a (ii) | `K = ℚ_p`, `n = 2`, `π = sp`, `q = p` | `log_H = Σ X^{p^{2i}}/(sp)^i = ℓ_s`; second basis element `π⁻¹log_H(X^p) = s·g₀`, a unit multiple of `g₀` | holds |
| 3.5 integrality *Corollary of* LubinTate §4.2a | `τ = σ²`, `q = p²`, `s₁ = p⁻¹`·(shift `s ↦ s − 2`) | `λ_s − p⁻¹λ_{s−2}(T^{p²}) = T_s`; `D` of `Σ_rσ^s(ω_r)ℓ(X_r)` is `Σ_rσ^s(ω_r)X_r`, integral | holds |
| 0.5h *Method* chain against (4) | `μ_p × ℤ/p`, `g = 1` | `2·colength = p²(p−1)·v(c) = p²`; "colength ≥ `p²`" would need `p²/2 ≥ p²` | C01 |
| Pilloni–Stroh "for `p ≥ 3`" | PS16 lines 221, 226–228, 245–246, 256 | Thm 1.9: `p ≥ 3`; Rem. 1.10: `p = 2` with exponent `2`, unwritten; `n₀ = 2g + 1` at `p = 2` | C02 |

- Source locators checked against the text in this round: 8 (Far11 Théorèmes 1–3 and Remarque 2; PS16 Théorème 1.9, Remarque 1.10, Notation 1.1; KR08 Lemma 1). The other locators of the labels were not reopened; the label text is the text the previous review read.
- Cross-roadmap citations resolved at this head: LubinTateFormalModulesAndQuasiCanonicalLifts §§4.2a, 4.2b, 4.3, 4.3a; HodgeTateAndCanonicalSubgroups §§0.5, 0.18, 0.20, 2.4, 2.5, 5.5; NashBlowups §§1.2, 1.3; AlgebraicModuliForArithmeticGeometry §5.4. All present with the cited subject.
- The README at the merge base and at the head have the same headings, in the same order: no layer or item removed, renumbered or retitled.
- Overlap check: read ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, TaylorBoundsAndDepthsOnHeightTwoFormalGroups, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (consumers, by vocabulary), and the suppliers HodgeTateAndCanonicalSubgroups (owner of Fargues' bound for odd `p` and of `ω^mod`) and LubinTateFormalModulesAndQuasiCanonicalLifts (owner of §§4.2a, 4.2b, 4.3a); nothing shared: the Dieudonné–Dwork lemma is owned by LubinTate §4.2b and cited here, and no open pull request changes this roadmap or drops an id it cites.
- Dependency check: `depcheck: 129 roadmaps, 1445 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 68 and 106), nothing else. The file is unchanged since the merge base; its three elaborated types match 0.5b (a) and 3.1, no binder lost; neither theorem closes by one tactic (each needs the bound itself).
- Files changed outside this folder all lie in the roadmap folders and family indexes the pull request owns.
- The pull request's text: its sentences on this family (labels, unchanged section numbers) and on LubinTate §4.2b agree with the head; this folder removes no section, declaration or supplier.

Source independence: changed passages only; 6 passages compared with 3 sources (Far11, PS16, KR08), none shared beyond formulas the mathematics forces; largest share [FormalProof], 38 mentions, whose text was not read; arrangement not compared, since the diff adds, removes or reorders no layer.

Research link: 0.5b and 2.4 are the integral Hodge–Tate bounds of Fargues (2010, 2011); Pilloni–Stroh (2016) build the modified Hodge bundle on them, which 0.5a–0.5c and 0.17 generalise; 3.2–3.4 rest on Hazewinkel's functional-equation lemma (1978), the Dieudonné–Dwork lemma (Krattenthaler–Rivoal 2011) and Gross–Hopkins (1994). Rests on the README's references and on Far11, PS16, KR08 as read.

## Not verifiable

- The *Method of the formal proof* labels: not compared with the [FormalProof] repository, which was not read; checked only against the README's own statements and routes.
- Colmez (1992) Théorème 5.2, Fargues (2010) §9, Hazewinkel (1978), Lang (1978, 1980), Gross–Hopkins (1994), Faltings–Chai: no legal copy read in this round.
- Hernandez, Boyarchenko–Weinstein, Lazard, Scholze–Weinstein, Schneider–Teitelbaum locators of the labels: not reopened in this round; the labels citing them are unchanged since the previous review, which read them.

## Source issues

- **Misprint** in Far11 at §5, introduction, and §5.4 (before Théorème 3): the source refers to the same cokernel theorem of its reference [16] as Théorème 7 in one place and Théorème 6 in the other; it should be one number throughout; affects nothing.
- **Gap** in Far11 at §5.3.2, Théorème 2, with Remarque 2 of §5.2: the theorem carries no hypothesis on `p`, while its proof rests on Théorème 1, stated for `p ≠ 2`, and the remark gives only a weaker unproved variant at `p = 2`; it should restrict to odd `p` or prove the case `p = 2`; affects nothing.

## For the human reviewers

- The recorded decisions were applied and do not bear on this folder's change: it removes no section, and its six *Corollary of:* lines (0.5c, 0.5f, 3.2, 3.3, 3.4, 3.5) name sections present at this head.
