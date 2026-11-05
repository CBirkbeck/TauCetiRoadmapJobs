# Review of SheafTheoreticSmithTheory (pull request #1734 at 373aa53)

**Verdict:** accepted

Incremental re-review of the 36 lines changed since 98ab730 (README only: fourteen `LP3.0` labels replaced by `§4.1`, five `GS0` labels replaced by `§0.29`, and the §4.6 locator split), together with the previous report's four findings. The gate rerun on this head passes every check; the dependency check from the worktree prints `depcheck: 204 roadmaps, 1631 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line; the outside-folder diff against `origin/main` is empty; `Suggested.lean` is unchanged since 98ab730 and elaborates with `sorry` as the only warning. No blocking finding remains. One note, entirely board-side.

## R01 (P3) — the package plan still labels the three LanglandsParameterStacks gaps `LP3.0` and carries five unowned `G1`–`G5` entries

Location: `packages/SheafTheoreticSmithTheory/design/plan.json`, `gaps` entries `finite-highest-weight-ideals`, `integral-highest-weight-orders`, `integral-tilting-lifts` (field `section` = `LP3.0`) and the five entries with `id` `SheafTheoreticSmithTheory/G1` … `G5` (no `supplier`, no `section`). The README (lines 103, 105, 107) now says "associated to §4.1" and names no `G` slug.

Claim: the intake announces each declared gap on the supplier's job with the plan's `section`.

Witness: `jq '.gaps[] | [.id, .supplier, .section]'` on the board's plan at commit 8c065443 prints `LP3.0` three times and `null` suppliers for `G1`–`G5`; LanglandsParameterStacks at its open head has no string `LP3` (its good-filtration section is `### 4.1 Highest-weight modules and good filtrations`, line 919).

Repair (board-side; nothing in the pull request changes): set `section` to `4.1` on the three LanglandsParameterStacks entries, and either delete the `G1`–`G5` entries or give them supplier `SheafTheoreticSmithTheory` with the README sections that own them (G1: §1.1 with `gap:witt-adic-uniform-operations`; G2: §§3.1, 4.4, 4.7; G3: §4.5; G4: §7.6; G5: §6.8), so that the intake announces contracts on sections that exist. This carries the plan half of the previous R01 and the whole of the previous R03.

## Previous findings

- R01 — partly repaired: README line 101 now reads "LanglandsParameterStacks §4.1, *Highest-weight modules and good filtrations*, supplies good/Weyl filtrations and the Donkin–Wang–Mathieu tensor theorem"; no `LP3` remains in the README (grep count 0). The plan's three `section` fields still say `LP3.0` (board-side, this report's R01, P3).
- R02 — repaired: lines 14, 93, 633, 726 and 807 now cite "GeometricSatakeAndFusion §0.29, *Equal-characteristic Schubert models and coefficient comparison*"; no `GS0` remains (grep count 0).
- R03 — not repaired: the plan's `G1`–`G5` entries are unchanged at board commit 8c065443; board-side only, folded into this report's R01 (P3).
- R04 — repaired: line 839 now cites Feng24 line 1066 "for the finite L⁺G-equivariant filtration with external-product associated graded and the external-product stalk computation; the direct-sum form for parity objects follows from §3.4 under the equivalence of §4.5, and for O through the integral-tilting-lifts contract; Theorem 4.8, p.23, Feng24 line 997".

## Verified sound

**The repaired citations, resolved at the supplier heads.** LanglandsParameterStacks at #1202, `### 4.1 Highest-weight modules and good filtrations` (README line 919): split reductive `G` over a field `k`; `∇_λ=H⁰(λ)`, `Δ_λ=H⁰(−w₀λ)^*` from ReductiveGroups §10B; the bullets state `H^i(G,∇_λ⊗∇_μ)` is `k` for `i=0`, `μ=−w₀λ`, zero otherwise; Donkin's criterion with `Ext¹_G(Δ_λ,V)`; tensor stability of good filtrations (Jantzen II.4.21; Donkin, Mathieu). This is exactly what README line 101 consumes and what §§3.2–3.5 and 4.6 list in their `*Needs:*` lines; the three gap contracts extend it (finite saturated ideals, integral orders, tilting lifts), none of which §4.1 states. GeometricSatakeAndFusion at #1235, `### 0.29 Equal-characteristic Schubert models and coefficient comparison` (README line 802): `R[[t]]`-lattice functor over `E=𝔽_q((t))`, finite-dimensional Schubert models, projective bounds, Bruhat closure relations, reduced-word Demazure resolutions, affine Schubert strata, base change and finite-jet actions, with perfection taken only after the finite-dimensional schemes are built: the items README line 93 lists. Its `GL₂`, bound `(1,0)` Check (ordinary model `ℙ¹`) agrees with this README's §4.6 Check.

**The §4.6 locator.** Feng24 line 997 is Theorem 4.8 (p.23, `Parity⁰_{L⁺G}(Gr_G;k) ≃ Tilt_k(Ĝ)` for `p` good); lines 1066–1075 (proof of Lemma 4.14, p.24) give the finite `L⁺G`-equivariant filtration with associated graded a direct sum of `F₁⊠⋯⊠F_p`, and `i^*(Nm F) ≅ (F′)^{⊗p}` along the diagonal. The direct-sum claim is now attributed to §3.4 (JMW16 Theorem 1.2 for tensor closure, Feng24 lines 2703–2704 for character determination) under §4.5, and to `gap:integral-tilting-lifts` for `O`.

**Gate and build.** Gate rerun on 373aa53: every scanner zero (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). Dependency check: `depcheck: 204 roadmaps, 1631 edges, 0 problem(s)`. `lake env lean` on a scratch copy of `Suggested.lean` with six `#check @name` lines appended: two `declaration uses 'sorry'` warnings (lines 61, 73) and nothing else, 9 s; the elaborated types coincide with the worker's signature file: `[Fact p.Prime]`, `[CharP κ p]`, `[PerfectRing κ p]`, `hσ : σ ^ p = 1`, `hS`, `hNorm`, `hTransfer`, `hχ` all present, no section binder lost. The file is byte-identical to the one reviewed at 98ab730, so the one-tactic probe (`simp` leaves both goals open) and the padding verdict of the previous report carry forward.

**Headlines.** Unchanged: the algebra Tate diagonal (§8.1) and Tate character extension (§8.2) are stated; the module docstring names the thirteen other headlines and the carriers each lacks; none of those is statable at Mathlib f6090c70 / Tau Ceti 358314d4 (no equivariant étale derived categories, Tate quotients, affine Grassmannians, parity or algebraic-group tilting categories at the pins).

**Adversarial table.** Rows for the statements the diff touches carry computed values; every other row carries forward from the previous report (PRREVIEW-SheafTheoreticSmithTheory~1, "Adversarial table"), whose instances and values were recomputed there and are unaffected by a label change.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| LanglandsParameterStacks §4.1 as consumed at line 101 | `GL₂`, `λ=(1,0)` | `−w₀λ=(0,−1)`; `∇_{(1,0)}⊗∇_{(0,−1)}=V⊗V^*` has `H⁰=k`; `Hom(Δ(λ),∇(λ))=k`, `Hom(Δ((1,0)),∇((0,−1)))=0` since `(0,−1)` is not `≥(1,0)` | agrees with §4.1's bullet |
| GeometricSatakeAndFusion §0.29 as consumed at line 93 | `GL₂`, bound `(1,0)`; `G_m` | ordinary model `ℙ¹`, perfect model its perfection, determinant `O(1)`; `Gr_{G_m}` discrete `ℤ` | agrees with §4.6's `ℙ¹` Check and §6.6 |
| §3.3 tilting subcategory (dual `SL₂`, `p=3`) | `Δ(3)`, `T(3)`, rank 0 | `0→L(1)→Δ(3)→L(3)→0`, dims `2,4,2`; `L(2)⊗L(1)` has character `χ(3)+χ(1)`, dim `6`, equals `T(3)`; trivial group: every module tilting, both filtrations length one | agrees |
| §3.4 tensor closure, products, characters, torus restriction | `V⊗V` for `SL₂`, `p=3`; `SL₂×SL₂`; rank 0 | `Sym²V⊕Λ²V=T(2)⊕T(0)`, `3+1=4` (`p≠2` so the symmetric/alternating splitting holds); `T(1)⊠T(1)` dim `4`, `End⁰=k⊗k=k` local; `diag(1,2)` commutes with the torus, `DU≠UD` for `U=[[1,1],[0,1]]`; rank 0: restriction is an equivalence, consistent with "generally not full" | agrees |
| §3.5 `K^b(Tilt)≃D^b(Rep)` | torus; `SL₂`, `p=3`, ideal `{0,1,2,3}` | torus: semisimple, `Ext^n=0`, `n>0`; `0→Δ(3)→T(3)→Δ(1)→0`, dims `4→6→2`; no uniform resolution length as `λ→∞` | agrees |
| §4.6 external products | `(ℙ¹)^r` with `E=O_{ℙ¹}[1]`; `r=0`; `E⊕E` | `E^{⊠r}=O[r]`, stalk `O` in degree `−r`, dense rank 1; `r=0`: `Gr=pt`, empty product `O`; `E⊕E` dense rank 2, decomposable; Koszul sign `(−1)^{1·1}` on the swap of `O[1]⊠O[1]` | agrees; locator now matches (R04) |
| §4.4 étale parity of Schubert strata (`*Needs:*` relabelled only) | previous report row §4.4 | `Swan_∞=3`, `χ_c=1−3`, `h¹=2` for `L_ψ(x³)`; constant `h¹=0` | carried forward |
| §3.1 modular Satake (`*Needs:*` relabelled only) | previous report rows §3.1–3.3 | as there | carried forward |
| §8.1 `algebra_tate_diagonal` | `ℤ[i]`, conjugation, `p=2`; `p=4` control | fixed subring `ℤ`, `Tr(a+bi)=2a`, ideal `(2)`; `δ(a+bi)=a²+b²≡a+b`; `(ac−bd)+(ad+bc)≡(a+b)(c+d) mod 2`; `p=4`, swap on `F₂[x,y]`: `Tr₄=0`, `Nm₄(x+y)−Nm₄x−Nm₄y=(x+y)⁴≠0`, excluded by `Fact p.Prime` | agrees (carried, recomputed) |
| §8.2 `tate_character_extension` | `F_p[x]`, `σ=id`, `S=F_p[x^p]`, `κ` perfect with `χ(x^p)=t`; `κ=F_p(t)` control | `χ′(x)=t^{1/p}` exists and is unique (Frobenius injective); `t∉κ^p` kills existence, excluded by `PerfectRing` | agrees (carried, recomputed) |
| all remaining rows (§§0.1–2.9, 4.1–4.2, 4.5, 4.7–4.10, 5.1–5.7, 6.1–6.8, 7.1–7.6, 8.3) | previous report | as there | carried forward, statements untouched by the diff |

**Sources: the seeded sample.** Every locator of the sampled targets opened at its line; printed page = the `=== page N ===` marker preceding the line. §0.2: Feng24 line 650 (§3.2 heading, p.14; Lemma 3.6 on p.15). §0.5: line 595 (Definition 3.1, Lemma 3.2, pp.13–14). §1.5: line 788 (Lemma 3.14, p.18: `T^*C ≅ H^*(C)⊗T^*(k)` for inflated `C`). §1.6: line 888 (`Perf_S(Y;TO)` and the quotient `D^b_S(Y;O[σ])/Perf_S → Perf_S(Y;TO)` via LL21 Corollary 4.5.2, p.20), LL21 line 624. §2.6: line 661 (display (3.3), `Psm=T^*∘i^*`, p.15). §3.4: JMW16 line 30 (Theorem 1.2, p.1), lines 686 and 691 (Theorems 5.1 and 5.3, p.16), Feng24 line 1212 (footnote 11, p.27), lines 2701–2706 (§A.4, p.60: restriction to the dual torus faithful and injective on tiltings, after Don93 p.46). §4.2: JMW14 line 228 (Definition 2.4, p.5), Feng24 line 858 (§4.1, pp.19–20). §4.7: LL21 line 641 (Proposition 4.6.1, p.14), line 985 (Proposition 5.5.2, p.22). §5.2: Feng24 line 1045 (Definition 4.12, p.24), JMW16 line 79 (Theorem 1.5, p.2). §5.3: Feng24 line 1059 (Lemma 4.14, p.24). §5.5: line 2575 (§A.3, p.57). §5.6: line 1162 (Construction 4.17, p.26). §6.3: MV07 line 879 (Proposition 6.4, p.21), Feng24 line 2628 (Remark A.1, p.58). §6.4: Feng24 lines 2634–2643 (the `CT_H[deg_H]` construction and display (A.2), p.58). §7.1: line 2742 (Lemma A.3, p.61). Also §3.3: JMW16 line 24 (Theorem 1.1, p.1), Feng24 line 993 (p.23); §3.5: Feng24 line 1017 (Proposition 4.10, p.23). Each supports the statement at the generality the README gives it.

**Declared gaps.** The six named-supplier gaps match the README's six `What <Supplier> must provide (gap:…)` sentences, slug for slug, so they count as declared; the `needs` sentences are unchanged since the previous report, where their precision and minimality were checked. The only residue is the plan's `section` label and the `G1`–`G5` entries (R01 above).

**Form.** No `LP3`, `GS0`, pull-request number, process word, LaTeX delimiter, anchor or absolute path in the folder; the folder contains `README.md`, `Suggested.lean`, `metadata.toml` only; no file outside the folder changed.

## Not verifiable

- Don93, Theorem 1.1 (Math. Z. 212): `uncertified`, cited by locator; recalled in JMW16 Theorem 1.1 (line 24), which I read.
- The previous report's items (JMW14 §§4.1–4.3, 4.10, JMW16 Theorems 5.1/5.3 beyond their statements, MV07 §§6, 11–14) were not reopened beyond the sampled lines above.
- Ownership against open pull requests: the previous report's `roadmaps grep` sweep over the index of 2026-11-03 carries forward; the diff adds no new object.

## Source issues

- none new in this round; the three items of the previous report (Feng24 proof of Lemma 4.24 p.29, Appendix A.4 p.60, proof of Proposition 4.5 p.22) stand as recorded there.
