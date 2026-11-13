# FIX-RT-VectorBundlesAndIsocrystalsPartII~2: repair of red-team round 2 (passes a and b)

Files changed: `packages/VectorBundlesAndIsocrystalsPartII/README.md`, `packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean` (docstrings and one layer comment only), `packages/VectorBundlesAndIsocrystalsPartII/sources.toml` (Fontaine03 locator). `design/plan.json` is unchanged: no new supplier gap was needed.

## RT-VectorBundlesAndIsocrystalsPartII~2a/F01, RT-VectorBundlesAndIsocrystalsPartII~2b/F01 (P2) — applied

Verified. LocallyAnalyticDistributions §0.0 (its README at its open head) restricts compact-type regularity to finite `K/ℚ_p`, with compact transitions, and never uses the word compactoid. Over `C` a compact map of Banach spaces is zero. CN25 line 1261–1262 asks for c-compact images, and over `C` no nonzero closed bounded lattice is c-compact.

Old → new: §2.5 "compactoid … in the sense of LocallyAnalyticDistributions §0.0" → compactoid image over `B_m` (`HasCompactoidImage`, CompactOperators §0.5, for `m = 1`), with completeness, regularity and submodule/quotient permanence as targets, a route and four Checks. §§4.1, 4.2 and 4.5 now cite §2.5. Added a supplier contract, a Scope bullet and Dependencies.

## RT-VectorBundlesAndIsocrystalsPartII~2a/F02 (P3) — applied

CN25 line 1102–1103 writes `X♭_1 = (X_1, X_(1/p), …)`. The characters `ψ_α` are defined through the roots `E_α` (CN25 line 1061–1068), so this is a slip. Old (§3.7 route): "a logarithmic lift in `B₂` of the compatible `X`-roots". New: `ℓ = v̂·log[E_1^♭]`, with `θ(ℓ) = vX` and `(σ−1)ℓ = v̂ψ_1(σ)t`, so `λ_v = v`. At `p = 2`, `log E_1 = X` again. The misprint is noted where it occurs.

## RT-VectorBundlesAndIsocrystalsPartII~2a/F03 (P3) — applied

Fontaine03 line 2885–2887 (p. 355) prints the plain sum, and so does FF18 line 1014–1016 (Proposition 2.28, p. 23). Old: "Fontaine03, Théorème 6.1 and §§6.2–6.5 …; FF18 …, read with alternating signs". New: Théorème 6.1 is located on p. 355, and the text says that Fontaine03 and FF18 print the plain sum, a misprint for the alternating sum stated in CN25 Theorem 2.6(ii).

## RT-VectorBundlesAndIsocrystalsPartII~2a/F04 (P3) — applied

The README defines a TVS only on sympathetic algebras, and `C{X}` is not one. CN25 line 1487–1488 places the lifts in the extension evaluated at the sympathetic closure. Old (§4.14): "closed in the Fréchet space `𝐖(C{X})`". New: closed in `E(C̃{X})`, which is Fréchet as an extension of Fréchet spaces (LocallyAnalyticDistributions §0.2, *Extensions of Fréchet spaces*); open mapping onto `E(C)`. Needs updated. Added the Check `E = V₁ ⊕ V₁`: lifts `{(cX, vX)}`. No other TVS is evaluated at `C{X}` in the README.

## RT-VectorBundlesAndIsocrystalsPartII~2a/F05 (P3) — applied

The parent (VectorBundlesAndIsocrystals, *Sympathetic Vector Spaces*) uses connected algebras with pointwise exactness, and `C` is initial. So `Hom_VS(ℚ_p, F) = F(C)` is exact in `F`, and `Ext^i_VS(ℚ_p, −) = 0` for `i ≥ 1`. §6.3 is retitled "The constant source is projective in VS" and restated without the Milnor tower. Its Needs are now the parent only, and the Checks are new (`V₁`, `B_dR`, `V₁` not projective). §6.5 statement and route, the §6.6 route and Needs, the Layer 6 Dependencies (LocallyAnalyticDistributions §0.2 removed) and How to read follow. CN25 line 927–930 is cited for the tower argument.

## RT-VectorBundlesAndIsocrystalsPartII~2a/F06 (P3) — applied differently

The cycle was real: Layer 0 needed §1.8, while Layer 1 needed Layer 0. Old → new: §1.8 → §0.10, unchanged; §1.9 → §1.8; references, Dependencies, Examples and `Suggested.lean` follow. No stub "(now §0.10)" was left, because the README is timeless. No roadmap cites §§1.8–1.9 here.

## RT-VectorBundlesAndIsocrystalsPartII~2a/F07 (P3) — applied

Fontaine03 line 290–291 (p. 292) states Théorème D(ii). Old (§1.1): "The same holds for extensions of finite-length `B_dR⁺`-representations". New: the middle term is a finite-length `B_dR⁺`-representation iff the extension is almost split; the structure is unique and makes both maps linear, by §0.2. Locator now "Théorème D(i)–(ii)". Added §0.2 to Needs and a Check with `B₂` and `C/ℚ_p`.

## RT-VectorBundlesAndIsocrystalsPartII~2b/F02 (P3) — applied

CN25 line 2892–2895 only expects the non-splitting and draws the zero dual from it. Old (§4.2 Check): "its continuous `C`-dual is 0 (CN25, Remark A.2, p. 58)". New: the remark is cited as an assertion, and a direct proof follows. A nonzero functional would make the one-dimensional `Ĉ/ker f` spherically complete, since spherical completeness passes to quotients by closed subspaces; the lifting computation is included.

## Checks run

- **Elaboration**: `lake env lean packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean`, run from the content checkout: exit 0. The only output is two "declaration uses `sorry`" warnings, at lines 62 and 83. No `TauCeti.*` import.
- **Signatures**: I put `#check @SemilinearRep`, `#check @semilinearRep_equivariant_map_smul` and `#check @fundamental_extension_surjective` in one scratch file and elaborated it once. The elaborated types are unchanged from the worker's signature file, and every binder is in the declaration's own signature. They match README §0.2 (first half) and §0.10: `q.ker = V`, `finrank W = 1`, `range η ≠ η(V)`, conclusion surjectivity and `finrank ker η = finrank V`. Only docstrings and the layer comment changed.
- **Dependency check**: `depcheck: 207 roadmaps, 1904 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The new supplier CompactOperators is on main.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation or Lean name found nowhere. That tool did not check Mathlib names, so I checked them at the pin: `WithSeminorms.banach_steinhaus` is at Mathlib/Analysis/LocallyConvex/Barrelled.lean:164 and `BaireSpace.instBarrelledSpace` at line 122. Both hold over any nontrivially normed field.
- **Ownership**: `roadmaps grep -i compactoid` finds the predicate in CompactOperators §0.5 on main, whose locally convex extension is out of its scope (its README line 332). It also finds PadicDifferentialEquationsAndRigidCohomology §RD.5, which works over spherically complete discretely valued fields only. So compact-type limits over `C` and `B_m` have no other owner, and this roadmap states them in §2.5. Ownership against open pull requests was checked through `roadmaps grep`.
- **Sources**: no open text proving completeness or regularity of compactoid inductive limits over a field that is not spherically complete was found (one web search). These statements are this roadmap's own targets, like §2.6 and §4.8. I added no `needs-references.toml` entry, because no statement depends on reading a missing text. All other new locators were read in the cached texts: CN25 lines 1061–1103, 1259–1262, 1487–1488, 2892–2895 and 921–930; Fontaine03 lines 285–291 and 2882–2887; FF18 lines 1012–1017.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.5 compactoid image over `B_m` | `m = 1`, `colim C^n`; identity of `c₀(ℕ, C)`; `m = 2`, identity of `B₂`; identity of `C` | `O_C^n ⊂ U + Σ O_C e_i` (holds); `e_n` has coordinate 1 at `n`, so no uniform decay (fails); `B₂° ⊂ U + B₂°·1` (holds); `θ(B₂°) = O_C` is not compact, `O_C/𝔪` is infinite | separates as intended; compactness over `ℚ_p` would exclude all three positive cases | Checks added |
| §2.5 c-compactness over `C` | closed ball `{|λ| ≤ r}` in `C` | a nested sequence of balls in `C` with empty intersection, rescaled into the ball, has empty intersection there | c-compact closed bounded lattices over `C` are 0 | sentence added |
| §2.5 regularity | `colim C^n`, set `{e_n}`; lattice `⊕ O_C p^n e_n` | trace on `C^N` is `⊕_(n≤N) O_C p^n e_n`, open; `λe_n ∈ L` iff `|λ| ≤ p^(−n)` | `{e_n}` is unbounded, as regularity requires; bounded in the `c₀` norm, which is therefore not the colimit topology | Check added |
| §2.5 quotient permanence | `V ⊂ W` closed, `V_n = V ∩ W_n` | `W_n/V_n → W_(n+1)/V_(n+1)` is injective (`V ∩ W_n = V_(n+1) ∩ W_n`); image of the ball = image of a compactoid set; quotient topology = final topology of the steps | holds | stated as target |
| §4.1 Check: infinite-dimensional Banach is not compact type | `W` Banach with compact-type presentation | ball ⊂ `W_N` bounded ⇒ compactoid in `W_(N+1)` ⇒ compactoid in `W`; `B ⊂ λB + L` with `|λ| < 1` iterates to `B ⊂ L` | finite dimension forced | Check reworded with proof |
| §4.1 Check: identity of `C` | `u = id_C` | `O_C ⊂ U + O_C·1`; `O_C` is not compact | compactoid, not compact | Check added |
| §4.5 route | `Ū_n = closure of Σ_(i≤n) p^(i−n)B_i`; trivial `H`; `H = ℤ_p` on `colim C^n` | `p^(i−n)B_i ⊂ p^(i−n−1)B_i` (increasing); `x ∈ p^(−k)B_j ⊂ U_(j+k)` (covering); `c_(στ) = c_σ + σc_τ ∈ Ū_n` (subgroup); `Ū_N` bounded ⇒ in one step | holds without closedness of `U_n`; the `ℤ_p` Check (`w = e_N` in step `N`) is unchanged | route replaced |
| §3.7 period lift | odd `p`, `E_1 = exp(pX)^(1/p)`; `p = 2`, `E_1 = exp(4X)^(1/4)`; compatibility `E_(1/p)^p = E_1` | `log E_1 = X` (`|pX| ≤ p^(−1) < p^(−1/(p−1))`; at `p = 2`, `|4X| ≤ 1/4 < 1/2`); `|E_1 − 1| ≤ p^(−1/p) < 1`; `(σ−1)log[E_1^♭] = ψ_1(σ)t`, `t² = 0` in `B₂` | `λ_v = v`; agrees with §3.6 Check 2 and §3.7 Check 1 | sentence replaced |
| §1.5 Euler sign | `X = Y = ℚ_p` | alternating `1 − ([K:ℚ_p]+1) + 0 = −[K:ℚ_p]`; plain sum `[K:ℚ_p] + 2` | sources' plain sum refuted; README Checks unchanged | locator reworded |
| §1.1 (ii) | `C(1) → B₂ → C`; `ℚ_p → C → C/ℚ_p`; uniqueness of structure | `Z = ℚ_p t`, middle `B₂`; ends of Dimension `(0,1)`, `(1,−1)` ≠ `(d,0)` of §0.6; identity between two structures is continuous equivariant, hence `B_dR⁺`-linear by §0.2 | holds; the old "same" reading collapses to (i) | statement and Check |
| §4.14 lift space | `W₁ = W₂ = C`, `E = V₁ ⊕ V₁` | `E(C̃{X}) = C̃{X}²`; rank-zero additive elements `(cX, vX)`; `ℓ ↦ (c, v)` bijective onto `C²` | closed plane; homeomorphism | Check added |
| §6.3 projectivity | `F = V₁`, `B_m`, `B_dR`, `0`; source `V₁` | `Hom = C, B_m, B_dR, 0`; `B₂ → B₁` onto at `C`; `Ext¹_VS(V₁, B_dR⁺) = C` (§6.5) | `ℚ_p` is projective, `V₁` is not; `h(ℚ_p)` has rank 1 = `ht(ℚ_p)` (§6.7) | section restated |
| §4.2 Check `Ĉ` | quotient balls with radii `r_n` strictly decreasing | lifts with `‖x_(n+1) − x_n‖ ≤ r_(n−1)`; `‖ȳ − x̄_n‖ ≤ max(r_n, r_n) = r_n` | the quotient is spherically complete, so a one-dimensional quotient would make `C` spherically complete; dual 0 | argument added |
| §0.10 (moved) | Checks recomputed: `(g,1)`, `(g,0)`, `V = 0`, `U₁` | kernel dim `h`; excluded; `η = 0`; dim 1 | unchanged | renumbered only |

## For the maintainer

- Section numbers changed inside this roadmap: §1.8 is now §0.10, §1.9 is now §1.8, and the heading of §6.3 is now "The constant source is projective in VS". `roadmaps grep` finds no other roadmap citing §§1.8, 1.9 or 6.3 of this roadmap; CstConjectureForDaggerVarieties cites only ids that keep their numbers. No Lean name changed.
- New downward supplier: CompactOperators §0.5, on main.
- No text from the reviews, the pull request or any source asked for an action outside this job.
