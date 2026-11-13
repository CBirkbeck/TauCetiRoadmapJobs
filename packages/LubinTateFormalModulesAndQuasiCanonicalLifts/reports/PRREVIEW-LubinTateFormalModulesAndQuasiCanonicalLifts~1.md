# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (pull request #2284 at 9100745)

**Verdict:** needs changes

## R01 (P2) — Layer 2 is narrowed to characteristic zero below its source and the pinned Artin map

**Location:** `TauCetiRoadmap/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` lines 26–28, "The torsion, Tate-module and reciprocity results of Layer 2 are stated for nonarchimedean local fields of characteristic zero"; `Suggested.lean` lines 142, 159, 179 (`[CharZero K]`).

**Claim:** The division-field degree (§2.3), the explicit reciprocity law and the norm groups (§2.5) are stated only for finite extensions of `ℚ_p`.

**Witness:** `K = 𝔽_q((t))`, `f = tX + X^q`: nonzero roots satisfy the Eisenstein `X^(q−1) + t`, degree `q − 1 = (q−1)q⁰`. `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:106–114` needs no characteristic; FunctionFieldArithmetic §4.1 restates the theorem for `char K = p`.

**Repair:** State §§2.1–2.6 for every nonarchimedean local field `K`. Keep "`K/ℚ_p` finite" only on the clauses that use `p`-divisible groups: the levels `G[p^r] = G[π^(er)]` and `BarsottiTate.equivFormalLieGroup` in §2.1, `BarsottiTate.tateModule` in §2.2. Delete `[CharZero K]` from `finrank_adjoin_primitive_lubinTate_root`, `artinMap_apply_lubinTate_root` and `artinMap_fixes_lubinTate_roots_iff` (the file elaborates without it, `sorry` the only warning) and "of characteristic zero" from their docstrings. Add to §2.3 the Check "for `K = 𝔽_q((t))` and `f = tX + X^q` the nonzero roots of `f` satisfy `X^(q−1) = −t`, so the first division field has degree `q − 1`". Replace lines 26–28 by "The torsion, division-field and reciprocity results of Layer 2 hold for every nonarchimedean local field; their comparisons with `p`-divisible groups are stated for finite extensions of `ℚ_p`", the Conventions clause "in Layers 0 and 2–9, `K` has characteristic zero" by "in §§0.3–0.4 and Layers 3–9", and the FunctionFieldArithmetic bullet of Downstream consumers by "FunctionFieldArithmetic §§4.1–4.2 use §§2.1–2.5 at `char K = p` and add the ramification filtration and the relative Lubin–Tate fields".

## R02 (P2) — Layer 3 is narrowed to `K/ℚ_p` below VZ07, through a rigidity input that needs finite `p`-height

**Location:** `README.md` line 1089, "Fix `K/ℚ_p` finite, a field `k` over `k_K`, a formal `O_K`-module `G₀` over `k` of finite height `h ≥ 1`"; lines 1205–1207, "on the underlying commutative formal groups of residual `p`-height `h[K:ℚ_p]`".

**Claim:** Lifting, the tangent dimension `h − 1` and representability by `B[[t₁,…,t_(h−1)]]` are for finite extensions of `ℚ_p`.

**Witness:** VZ07 line 2736 fixes any complete discretely valued field with finite residue field (Theorem 3.8, VZ07 line 3021). Over `𝔽_q[[t]]`, the additive law with `[t] = X^q` has `O`-height 1 and `[p] = 0`: `TauCeti.FormalGroupHom.eq_of_map_residue_eq` does not apply; VZ07 Lemma 2.6 does.

**Repair:** Open Layer 3 with "Fix a nonarchimedean local field `K`, a field `k` over `k_K`, …". In §3.4 state the rigidity as its own claim, "a homomorphism between two lifts over a small extension `R′ → R` whose reduction to `R` is zero is zero, since its composite with `[π]`, which is nonzero modulo `𝔪_(R′)`, vanishes (VZ07, Lemma 2.6, p.61)", and name `TauCeti.FormalGroupHom.eq_of_map_residue_eq` and `TauCeti.FormalGroupIso.eq_of_map_residue_eq` as the route when `char K = 0`, where the residual `p`-height is `h[K:ℚ_p]`. Keep "`K/ℚ_p` finite" on §3.7 and on the comparisons with EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3 and BordismFormalGroups §F5. Add to §3.6 the Check "for `O_K = 𝔽_q[[t]]`, `k = 𝔽_q` and the additive module with `[t] = X^q` (height one, `[p] = 0`) the representing ring is `B`".

## R03 (P3) — Page of Honda's Lemma 2.4 in §4.3

**Location:** `README.md` line 1407, "(H70, Lemma 4.2, p.231, Lemma 2.4 and Theorem 3, pp.223–225,".

**Claim:** Lemma 2.4 of H70 is on pp.223–225.

**Witness:** H70 line 380: Lemma 2.4 is stated on printed p.222 (the page that begins at H70 line 367); §4.2 of the README cites it correctly as "Lemmas 2.3–2.4 … pp.222–225".

**Repair:** "(H70, Lemma 4.2, p.231, Lemma 2.4, p.222, and Theorem 3, p.225,".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2 interpolation; `existsUnique_lubinTate_intertwiner` | `p` odd, `f=(1+X)^p−1`, `g=pX+X^p`; `W(𝔽_(p²))`, `q=p` | `X²`: `pc+p(p−1)/2 = p²c`, `c=1/2`. Reduced `X^p` coefficients `ā^p ≠ ā`. | consistent; hypothesis needed | none |
| §1.3; `exists_formalModule_of_isLubinTateSeries` | `𝔽_q[[t]]`, `f=tX+X^q`; `ℤ_p`, `(1+X)^p−1` | `f(X+Y)=f(X)+f(Y)`, so `F_f=X+Y`; `F_f=X+Y+XY`. `subst φ f` is `f∘φ` at the pin. | holds | none |
| §1.4 coordinate independence | `g=πX+X^q+πX²`; `ℤ₂`, `u=3` | `πc=π+cπ²`, `c=(1−π)⁻¹` (also at `q=2`); both composites `(1+X)⁶−1`. | holds | none |
| §2.2 Tate module | `𝔾_m/ℤ_p`; Y95 line 119–120 | rank 1 `=h`; source: free of rank `n` with transition `[π₀]`, p.295. | holds; LT65 part unread | none |
| §2.3; `finrank_adjoin_primitive_lubinTate_root` | `ℚ₂`, `2X+X²`, `m=1,2`; `𝔽_q((t))`, `m=1` | Root `−2`, degree `1=(2−1)·2⁰`; `X²+2X+2`, degree 2. Degree `q−1` in characteristic `p`. | true beyond the stated scope | R01 |
| §2.5; `artinMap_apply_lubinTate_root`, `artinMap_fixes_lubinTate_roots_iff` | `ℚ₂`, `x=−3`, `m=4`; `u=3`, `m=1`; `m=0` | `(−3)⁻¹≡5 mod 16`; `P=X` gives `−2`, truncation `X/3` gives `−2/3`; `m=0`: both sides all of `Kˣ`. | holds; no `CharZero` needed | R01 |
| §2.6 twist | `Art(π′)`, `Art(π)`, units | `u⁻¹·u=1`; `1·u=u`; `v⁻¹` both sides, `η_u` trivial on inertia. | holds | none |
| §3.2 coefficient algebra | VZ07 lines 2739, 2844 | Polynomial on one generator per degree; degree `q^i−1` generator is the `X^(q^i)` coefficient of `[π]`; pp.58–59, 61. | supported, any characteristic | R02 |
| §§3.4–3.6 deformations | `𝔾_m/𝔽_p[ε]`; additive `O_K`-module; `𝔽_q[[t]]` height one | Coboundary `−εcXY`; `εX^q` commutes as `ā^q=ā`; `[p]=0` with `O`-height 1. | holds; scope too narrow | R02 |
| §4.1 type operators | `ℓ=Σ(−p)^(−j)X^(p^(2j))`; H70 lines 309–354 | `p(−p)^(−j)+(−p)^(1−j)=0`; for `p−T²`: `2/p` at `j=2`. (F), special, type at pp.220–221. | holds | none |
| §4.2 integrality | `X+X²/p`, `p=2`; H70 lines 482, 607, 627, 668 | `XY`: `−1`; `X²Y²`: `−1/4+3/2−15/4=−5/2`. Theorems 3, 4 need (F), (F1); Lemma 3.4, Prop. 3.5 completeness. | holds | none |
| §4.3 sign pairing | `a_(p²)=2sp`; `f=2X+X⁴` | `(Frob−sp)²=0`, so `sp·ℓ−ℓ(X^q)∈pO[[X]]`, type `p−sT²`. `1/(2−16)=−1/14`; `−1/14−1/2=−4/7`. | README right, BKO21 lemma reversed | R03 (locator) |
| §4.4; `isLubinTateSeries_zsmulSeries_formalGroup` | `y²+y=x³`, `p=2`; `s=1` | `#E(𝔽₂)=3`, `a₄=0−4`, `#E(𝔽₄)=9=4+1+4`, `Δ=−27`. `s=1`: `(p−1)²` points. | holds | none |
| §5.1 lattices and kernels | Y95 lines 121–122; G86 lines 185–195 | Lattices over `T` ↔ finite `A₀`-stable subgroups; rational over the fixed field of the stabilizer. | supported | none |
| §5.2 lattice quotients | `𝔾_m`; `L=ϖ₀^(−m)T`; Y95 lines 126–140 | `X −_G c=(X−c)/(1+c)`; quotient via `[ϖ₀^m]`, twist `q₀^(hm)`. Source: reduction `X^(q^N)`. | holds | none |
| §5.3 homomorphisms | `L₂=ϖ₀⁻¹L₁`; Y95 lines 141–154 | `a=ϖ₀⁻¹` gives `aL₁=L₂`; source: `Hom` is `{a : aL₁ ⊂ L₂}`, p.296. | holds | none |
| §5.4 descent | unramified quadratic, level one | Stabilizer of a line `k_(F₀)^×`; degrees `q₀+1` and `q₀²−1`; equal (3) at `q₀=2`. | holds | none |
| §5.5 elliptic quotient | supersingular, `O₀=W(𝔽_(p²))`, order `p`; BKO21 lines 715–725 | `𝔽_p`-line in `𝔽_(p²)` not `O₀`-stable. Source forms `A/C` with `End = ℤ_p+p^sO`. | holds | none |
| §6.1 canonical lift | G86 lines 77–83; Y95 lines 156–159 | Unique lift, trivial height-one deformation space; p.322, p.296. | supported | none |
| §6.3 classification | cubic `O₀+ϖ₀O_F`; Y95 lines 186–211 | Length `3 ≠ 2·1`, not Gorenstein. Props. 1–2: orbit of classes; marked iff `[L₁]=[L₂]`. | holds | none |
| §6.6 field of moduli | `a=π_F`, `L=T`; Y95 lines 175, 212–213, 220 | `[π_F⁻¹T]=[T]`; source `m_(a⁻¹L)=m_((a,K)L)` with `(u,K)` acting by `[u⁻¹]`. | holds | none |
| §7.1 degrees | `s=1,2`; `q₀=2`; G86 lines 205–209 | `(q₀²−1)q₀^(2s−2)/((q₀−1)q₀^(s−1))=q₀^(s−1)(q₀+1)`; ramified `q₀^s`; `3` and `2`. | holds | none |
| §7.2 uniformizer | `ℚ₃(π)`, `π²=3`; Y95 lines 361–362 | `X³` coefficient `π+π³=4π`; vertices `(1,2),(3,1),(9,0)`. | holds | none |
| §8.4 field comparisons | index count in `O^×` | `(p+1)p^(s−1)·p^s/p^(s−1)=(p+1)p^s`, the index of `ℤ_p^×(1+p^(s+1)O)`. | holds | none |
| §8.5 generators | `[p]w_(n+1)`; BKO21 lines 272–281 | `[(−1)^n][−p]v_(n+1)=w_n`; source: generators differ by `(−1)^n`, footnote 2, p.948. | holds | none |
| §9.3 square | `p=5`, `s=0`, `ℓ(x)=25` | `[30]x`, logarithm `750`; with `j_1`: `−750` on both corrected sides. | holds | none |

- Source locators checked against the text: 44 (Y95 12, G86 6, BKO21 6, H70 7, VZ07 6, LT66 5, H68 2); one wrong page (R03).
- Library declarations opened at the pin: 14, among them `TauCeti/RingTheory/FormalGroup/Hom.lean:137`, `…/Local/ArtinMap.lean:114` and `:205`, `…/UnitFiltration/Basic.lean:104`, `…/FormalGroup/Rigidity.lean:186`, `Mathlib/RingTheory/FormalGroup/Basic.lean:57`. Neither pin has a Lubin–Tate series, module or `FormalModule`.
- Cross-roadmap citations resolved: 10 roadmaps, 32 sections (RelativeFarguesFontaine §2.5; GrossZagierAndArithmeticHeights §7.2; EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07 sections; BordismFormalGroups; ModularCurves; ClassFieldTheory; LocalFieldsRamification; RamificationOfCompleteDiscretelyValuedFields §4a.3; EllipticCurves). All exist; the five "found nowhere" names are planned names of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.
- Gate: every check passed. Dependency check: `depcheck: 238 roadmaps, 2162 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: six `sorry` warnings, nothing else. `#check @name` compared with the README for each declaration: no binder lost.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `trivial`) on a scratch copy: none of the six theorems closes; no padding. Headlines not stated (Tate module, universal deformation, Honda integrality, quasi-canonical classification, BKO towers) are named in the module docstring with the missing carrier.
- Pull request text read against the head: no sentence contradicted.
- Overlap check: read AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, BordismFormalGroups, FunctionFieldArithmetic; Lubin–Tate torsion fields and their Artin action are split by characteristic with FunctionFieldArithmetic §§4.1–4.2 (owner here, R01); formal Lie groups and `p`-divisible groups: FiniteFlatGroupsAndIntegralPadicHodgeTheory, cited; `W(k)[[u]]`: BordismFormalGroups §F5, cited.

Source independence: 21 passages compared with 6 sources, none shared; largest share Y95, 23 of 90 locators; contents compared with Y95: independent (only Layer 5 ↔ §3 and Layer 6 ↔ §4 correspond, in the order §6.2's *Needs:* §5.2 forces); the text of LT65 could not be read.

## Not verifiable

- §1.2 (LT65, Lemma 1, pp.381–382) and §1.4 (LT65, Theorem 1, equations (8)–(11), pp.382–383): LT65 is recorded as uncertified and its text is not in the sources cache; the statements were tested by computation only.
- The other 13 LT65 locators (§§0.2, 0.3, 1.1, 1.3, 2.2–2.6, 8.1, 8.2, 9.1): same reason.

## Source issues

- **Error** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `∓x² + p` and parameter `±p`, as its own proof (Frobenius equals `±p`) shows; affects a stated result.

## For the human reviewers

- **Licence.** 15 of the 90 source locators cite LT65 (Annals of Mathematics 81, 1965), recorded as uncertified: the wording of `README.md` §§1.1–2.6 was not compared with that text.
