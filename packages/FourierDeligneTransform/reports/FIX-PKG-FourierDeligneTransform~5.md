# FIX-PKG-FourierDeligneTransform~5

Findings of REV-PKG-FourierDeligneTransform~4 (one review: F01, F02, F03). All three were verified at the text and applied. F01 was also repaired wherever the same pattern occurs: §1.1 API, §1.3, §3.7 and the §3.6 group-action route.

## F01 (P2) — applied

§3.6 opening line. Old: "Prove, for the data of this layer:". New: one of the two tensored inputs must be of finite Tor amplitude (`K_1` or `K_2` for external products, convolution and Plancherel; `M` or `L` for group actions), as in §1.1 Künneth and gap:projection-formula-qcqs, and every `Dᵇ_ctf` object qualifies. Two negative-control Checks added (the reviewer's `ℤ/9` witness and `H = S`).

Verification. `ψ(1) = −1 ∈ ℤ/9` with `p = 2` is nondegenerate: `(−1)² = 1` and `−2 = 7` is a unit. `Tor_i^{ℤ/9}(ℤ/3, ℤ/3) = ℤ/3` for every `i ≥ 0`, so `K_1 ⊠ K_2` and `K_1 ⊗^L [−1]^*K_2` leave `D⁺`. The transform, `Rs_!` and `Rπ_!` are defined only on `D⁺` (EtaleCohomologyFoundations §0.8, README Conventions). The finding is right.

Difference from the suggested repair. The reviewer asks for `M` of finite Tor amplitude in the group-action item. I state "`M` or `L`", which is wider and still true. Over the base `H`, `FT(pr_V^*L ⊗ π_H^*M) ≅ FT(pr_V^*L) ⊗ π'^*_H M` holds by the gap's projection formula when either `π'^*_H M` or `pr^*pr_V^*L ⊗ ℒ_ψ⟨ , ⟩` has finite Tor amplitude, and the second does when `L` does. I wrote out the route (LAU87 lines 503–507: the automorphism `(pr_H, m)`, (1.2.2.4), Künneth). Because that route uses the transform over the base `H`, `H` must be qcqs. So the item now says "quasi-separated `S`-group of finite type (automatic over a Noetherian `S`)"; LAU87 works over Noetherian bases, so this narrows nothing the source supports. The §3.6 `*Needs:*` line gains §1.1, for the Künneth formula.

The same pattern elsewhere in the roadmap:
- §1.1 API. Old: "tensoring a kernel by `p_Y^*M` gives `Φ(−) ⊗^L M`". New: for `M` of finite Tor amplitude, `𝒦 ⊗^L p_Y^*M` is again a kernel and `Φ_{𝒦⊗p_Y^*M} ≅ Φ_𝒦(−) ⊗^L M`. The existing `ℤ/4` Check now notes that `M = ℤ/2` produces its kernel.
- §1.3: coefficient change is stated on `Dᵇ_ctf(X, Λ)`.
- §3.7. Old: `FT_{h∘ψ}(Λ' ⊗^L K) ≅ Λ' ⊗^L FT_ψ(K)` for arbitrary `K`. New: for `h` a map of finite rings and `K` of finite Tor amplitude. The `*Needs:*` line gains EtaleCohomologyFoundations §0.8 (coefficient change under Tor bounds). The `ℤ/49 → ℤ/7` Check gains the `(ℤ/7)_V` non-example.

Places checked and left unchanged, because one tensor factor is lisse of rank one (flat) or the input is in `Dᵇ_ctf`: §1.2 (kernels of finite Tor amplitude), §1.4, §2.4, §3.2 (its API already carries the hypothesis), §3.4 (`FT(π^*M[r]) ≅ σ'_*M(−r)`, where the projection formula is applied with `B = ℒ_ψ⟨ , ⟩`), §3.5, §3.6 translation, quadratic and sub-bundle items, §§3.8, 4.1–4.2, Layer 5 (field coefficients and `Dᵇ_c`; the §5.4 group-action input is `M = ℒ_χ`, which is lisse).

## F02 (P3) — applied

§2.4 `*Needs:*` line. Old: "EtaleCohomologyFoundations §§F.2.4, F.2.6–F.2.7, F.3; …§IG.0.T2". New: "§§0.8 and F.2.1 (`Rf_!` and its base change for arbitrary torsion) and gap:projection-formula-qcqs, for the vanishing of `RΓ_c` over every finite `Λ`; §§F.2.4, F.2.6–F.2.7, F.3 and §IG.0.T2 for `RΓ` and the trace formula when char `Λ` is prime to `p`". §2.6 names the same three inputs for the vanishing, including characteristic not invertible in `k`. The Layer 2 Dependencies line gains §0.8, §F.2.1 and gap:projection-formula-qcqs.

Verification, on EtaleCohomologyFoundations on main. §F.2.4 at line 599 requires "finite `Λ` killed by `N` invertible on `S`", and §F.2.7 at lines 760–762 requires invertible annihilator. §0.8 at line 567 defines `Rf_!` on `D⁺` torsion for any coefficient ring and gets its base change from §F.2.1, which holds for arbitrary torsion. The route uses `Rpr_{2!}pr_1^*ℒ_χ = π^*RΓ_c` (base change), `Rpr_{2!}(pr_1^*ℒ ⊗ pr_2^*ℒ) = π^*RΓ_c ⊗ ℒ` (projection formula with `ℒ` flat) and the shear; these give `(χ(a) − 1)H^i_c = 0` with no finiteness used. On the `𝔽_4` Check: `RΓ_c(𝔾_{m,𝔽̄_2}, 𝔽_4) = 𝔽_4[−1]` lies entirely in the trivial `μ_3`-eigenspace, so `RΓ_c(ℒ_χ) = 0` for `χ = id`. That agrees with the Check.

## F03 (P3) — applied

§5.6. Old: the four-term sequence "(LAU87 lines 2620–2628)". New: "…, the sequence of §5.5 with the tame value above. (LAU87 lines 2620–2628 give the three-term form without `H²_c` under the hypotheses of LAU87 Corollaire (4.3.1.1), LAU87 lines 2565–2567, which include `F` irreducible, unramified at `∞` and not geometrically constant; these make `H²_c(A_{k̄}, j_!F) = (F_η̄)_{π_1(U_{k̄})}(−1)` vanish.)" New Check: `F = Λ`.

Verification. LAU87 line 2623 states the sequence with three terms; lines 2565–2567 give the hypotheses. The four-term sequence follows from §5.5's sequence at `0'` (LAU87 lines 975–985, 993–995) together with `𝔉^{(∞,0')}(F_∞) ≅ F_∞(−1)` for unramified `F_∞`. Vanishing of `H²_c` under LAU87's hypotheses: the kernel of `F_η̄ → (F_η̄)_{π_1^geom}` is stable under the arithmetic `π_1`, so for irreducible `F` it is `0` or everything. If it were `0`, `π_1^geom` would act trivially and `F` would be geometrically constant. So it is everything and the coinvariants vanish. The `LAU87` manifest locator gains "§4.3 (4.3.1.1)". This is the only change to `sources.toml`; no source was added or fetched.

## Checks

- Elaboration: `lake env lean packages/FourierDeligneTransform/Suggested.lean` from the content checkout exited 0 with no output in 4.8 s. `Suggested.lean` is unchanged and declares nothing: the docstring explains why no headline is statable at the pins, and none of the edits touches a carrier. So the `#check @name` comparison had nothing to compare, and no Lean name was added or removed.
- Direction check (`gate --depcheck … --movable`):

      depcheck: 237 roadmaps, 2421 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. Every new citation is to EtaleCohomologyFoundations (§§0.8, F.2.1, line 57 of the order), which is already a supplier, or to the existing gap:projection-formula-qcqs.
- `roadmaps resolve` on the README: no citation and no Lean name found nowhere.
- `design/plan.json`: unchanged. The gap used, `projection-formula-qcqs` (EtaleCohomologyFoundations §0.8 and §F.5), is already declared there and under "Exact supplier contracts" with the "one of `A`, `B` of finite Tor amplitude" hypothesis that the repairs rely on.
- Grep of the README for LaTeX delimiters, machine paths and process words: no hits. The word "background" at line 624 is a false positive.
- Ownership: no new object or construction was introduced, so no ownership search was needed. Ownership against open pull requests was not re-checked in this round.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.6 external product, Tor hypothesis | `ℤ/9`, `p = 2`, `ψ(1) = −1`, `K_1 = K_2 = (ℤ/3)_{𝔸¹}` | `Tor_i(ℤ/3, ℤ/3) = ℤ/3` for all `i ≥ 0`, so it leaves `D⁺` | hypothesis needed |
| same, `K_2 = Λ_{𝔸¹}` | `r = 2` on `𝔸²` | left `FT((ℤ/3)_{𝔸²}) = σ'_*(ℤ/3)(−2)[−2]`; right `σ'_*(ℤ/3)(−1)[−1] ⊠ σ'_*(ℤ/9)(−1)[−1] = σ'_*(ℤ/3)(−2)[−2]` | equal |
| §3.6 convolution, `K_2 = Λ_{𝔸¹}` | `r = 1` | left `FT(Rs_!(ℤ/3)_{𝔸²}) = FT((ℤ/3)(−1)[−2]) = σ'_*(ℤ/3)(−2)[−3]`; right `σ'_*(ℤ/3)(−1)[−1] ⊗ σ'_*(ℤ/9)(−1)[−1] [−1] = σ'_*(ℤ/3)(−2)[−3]` | equal |
| §3.6 convolution, skyscrapers (old Check) | `i_{a*}Λ`, `i_{b*}Λ`, `r = 1` | `ℒ_ψ(ax')[1] ⊗ ℒ_ψ(bx')[1][−1] = ℒ_ψ((a+b)x')[1]` | holds |
| §3.6 Plancherel, Tor | same `K_1 = K_2` | `K_1 ⊗^L [−1]^*K_2 = (ℤ/3 ⊗^L ℤ/3)_{𝔸¹}`, not in `D⁺` | hypothesis needed |
| §3.6 Plancherel, `K_2 = Λ` | `r = 1` | left `Rπ'_!σ'_*(ℤ/3)(−2)[−2] = (ℤ/3)(−2)[−2]`; right `Rπ_!(ℤ/3)_{𝔸¹}(−1) = (ℤ/3)(−1)[−2](−1)` | equal |
| §3.6 Plancherel, `K_i = i_{0*}Λ` | `r = 1` | left `Rπ'_!Λ[2] = Λ(−1)`; right `Λ(−1)` | holds |
| §3.6 group action, `M` or `L` | `H = S`, `M = ℤ/3`, `L = Λ_{𝔸¹}` (only `L` of finite Tor amplitude) | left `FT((ℤ/3)_{𝔸¹}) = σ'_*(ℤ/3)(−1)[−1]`; right `ℤ/3 ⊗ σ'_*(ℤ/9)(−1)[−1]`, the same | "`M` or `L`" justified |
| same, both of infinite Tor amplitude | `M = ℤ/3`, `L = (ℤ/3)_{𝔸¹}` | `M ⊠ L = (ℤ/3 ⊗^L ℤ/3)_{𝔸¹}`, not in `D⁺` | excluded by the hypothesis |
| §3.6 group-action route, transpose | `f = (pr_H, m)` | `(f^{−1})^∨(h, e') = (h, ᵗh^{−1}e') = (h, m'(h, e'))`, so `FT_{/H}(m^*K) = (pr_H, m')^*FT_{/H}(pr_V^*K) = m'^*FT(K)` | matches LAU87 line 498 (`m'(g, e') = ᵗg^{−1}e'`) |
| §3.6 `H` quasi-separated | Noetherian `S`; general qcqs `S` | finite type over Noetherian `S` gives a Noetherian, hence quasi-separated, `H`; the transform over `H` needs a qcqs base (Layer 3 data, EtaleCohomologyFoundations §0.8) | added; nothing lost against LAU87 |
| §1.1 API, tensoring a kernel | `X = Y = S = Spec k`, `Λ = ℤ/4`, `𝒦 = Λ`, `M = ℤ/2` | `𝒦 ⊗ p_Y^*M = ℤ/2`, of infinite Tor amplitude, so not a kernel; with `M` of finite Tor amplitude `[a, b]` and `𝒦` of finite Tor amplitude `[c, d]`, the tensor has amplitude in `[a + c, b + d]` | hypothesis needed |
| §3.7 coefficient change | `ℤ/49 → ℤ/7`, `K = (ℤ/7)_V`; `ψ(1) = 18 ↦ 4` | `ℤ/7 ⊗^L_{ℤ/49} ℤ/7` has `ℤ/7` in every degree `≤ 0`; `4³ = 64 ≡ 1`, `4 − 1 = 3` a unit mod 7 | hypothesis needed; reduced character nondegenerate |
| §3.7 with `K = Λ_V` | `ℤ/49 → ℤ/7`, `r = 1` | `FT(Λ_V) ⊗^L ℤ/7 = σ'_*(ℤ/7)(−1)[−1] = FT_{ψ mod 7}((ℤ/7)_V)` | equal |
| §2.4 `RΓ_c = 0`, `p`-torsion (Needs) | `𝔾_m/𝔽_4`, `Λ = 𝔽_4`, `χ = id` | `H^i(ℙ¹, 𝔽_2) = 𝔽_2, 0, 0`, so `H¹_c(𝔾_m, 𝔽_4) = 𝔽_4` and nothing else, all in the trivial eigenspace; `χ(ω) − 1 = ω²` a unit | `RΓ_c(ℒ_χ) = 0`; inputs §0.8, §F.2.1 and the gap hold for any torsion |
| §2.6 vanishing, `p`-torsion (Needs) | `k = 𝔽̄_2`, `N = 3`, `Λ = 𝔽_4` | the same computation on the Kummer cover | inputs named |
| §5.6 four-term sequence | `F = Λ` on `U = A` | `0 → H¹_c = 0 → F'_{η̄_{0'}} = 0 → Λ(−1) → H²_c = Λ(−1) → 0`, exact | needs the `H²_c` term |
| §5.6 under LAU87's hypotheses | `F` irreducible, not geometrically constant | kernel of `F → F_{π_1^geom}` is stable under arithmetic `π_1`, so it is everything, the coinvariants are `0` and `H²_c = 0` | three-term form recovered |
| §5.6 wild case | `F = ℒ_ψ(x²)`, `p` odd | `F_∞` is wild, so the unramified clause does not apply; `H²_c = 0`, `H¹_c` has rank 1 (§2.8) | clause not used |

## For the maintainer

- No Lean name changed, and no cross-roadmap id was added, dropped or renumbered. Consumers are unaffected. The §3.6 hypotheses hold automatically for the `Dᵇ_ctf` and field-coefficient inputs that DeligneWeightsAndPurity and EtaleDualityAndPerverseSheaves would import.
- The pattern repairs in §1.1 API, §1.3, §3.7 and the `H` quasi-separated clause go beyond the lines F01 names; each is listed above with its witness.
- Nothing is defined only by an open revision, and no supplier moved.
