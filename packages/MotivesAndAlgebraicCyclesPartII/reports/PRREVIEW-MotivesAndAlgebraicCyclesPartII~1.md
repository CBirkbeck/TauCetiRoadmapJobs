# Review of MotivesAndAlgebraicCyclesPartII (pull request #2459 at c2ddf08)

**Verdict:** needs changes

## R01 (P2) — The Summary overstates the explicit description of motivic K-theory

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCyclesPartII/README.md` line 3 (Summary): "the explicit description of motivic K-theory on strictly totally disconnected rings by the cofibre of the K-theory of the ideal of topologically nilpotent elements"

**Claim:** §7.6 proves this only on nonarchimedean strict rings and only after inverting the residue characteristics; the Summary asserts it integrally and at archimedean points, where it is false or undefined. §7.6 itself is stated correctly.

**Witness:** For `C = ℂ₂`, `π₀ Kmot(C) = ℤ[1/2]` while `π₀ cofib(K(C_{<1}) → K(C)) = K₀(C) = ℤ` (§6.1, Checks). On `ℂ`, the elements of norm `< 1` form no ideal.

**Repair:** Replace the clause with: "the explicit description of motivic K-theory on nonarchimedean strictly totally disconnected rings, after inverting their residue characteristics, by the cofibre of the K-theory of the ideal of topologically nilpotent elements".

## R02 (P3) — A §1.7 Check says the projection formula fails at the complex point

**Location:** README §1.7, Checks, bullet 2: "Over a geometric Banach point `C`, the projection `ℙ¹_C → Marc(C)` … the Riemann sphere for `C = ℂ` … For this map the effective projection formula fails (§3.3; Scholze, Example 4.26, p. 26)"

**Claim:** The formula fails only for nonarchimedean `C`. At `C = ℂ`, which the bullet names, it holds.

**Witness:** At `ℂ`, `Deff_mot` is sheaves on `S²` (§§1.3, 2.1), and `f_* = RΓ(S², −)` has cohomological dimension 2, so it commutes with colimits. Scholze line 1095 assumes `X` nonarchimedean, and line 2124 handles `ℂ` by the topological projection formula.

**Repair:** Replace the last sentence with: "For nonarchimedean `C` the effective projection formula fails for this map (§3.3; Scholze, Example 4.26, p. 26), so the quasi-pro-étale hypothesis is not idle; at `C = ℂ` it holds, since `f_* = RΓ(S², −)` has finite cohomological dimension and commutes with colimits."

## R03 (P3) — §0.7 restates the pinned repleteness predicate and omits the primary source of its Postnikov consequence

**Location:** README §0.7: "Prove that the arc-topos is replete: the inverse limit of a countable tower of epimorphisms of arc-sheaves is an epimorphism onto its first term. Consequently its hypercomplete ∞-topos … is Postnikov complete (Scholze, proof of Theorem 4.20, p. 24 …)"

**Claim:** The predicate already exists at the pin as Tau Ceti's `TauCeti.IsReplete`, but §0.7 does not cite it and *From Tau Ceti* does not list it. The theorem that a replete topos is Postnikov complete (`gap:replete-postnikov`) is due to Mondal–Reinecke; Scholze cites them for it, and the README does not.

**Witness:** `TauCeti/CategoryTheory/Limits/Replete.lean:91` defines `class IsReplete` with field `epi_π_app_zero`, which is the same clause. Scholze lines 1030–1031 say "as the arc-topos is replete, see [MR25]", and line 2715 is the [MR25] entry.

**Repair:**
- In §0.7, write: "Prove that the arc-topos satisfies Tau Ceti's `TauCeti.IsReplete`".
- Add `TauCeti.IsReplete` to §0.7's *Needs* and to the Layer 0 Dependencies.
- Add this bullet under *From Tau Ceti*: "`TauCeti.IsReplete C` (TauCeti/CategoryTheory/Limits/Replete.lean): the projection from the limit of a tower of epimorphisms onto its first term is an epimorphism; §0.7 proves it for the arc-topos."
- After "Postnikov complete", cite the primary source with the locator of its main theorem: Mondal–Reinecke, *On Postnikov completeness for replete topoi*, Homology Homotopy Appl. 27 (2025), no. 1, 179–196. Add this work to References and to `sources.toml`.

## R04 (P3) — §9.5's negative-control Check depends on Layers 10–11

**Location:** README §9.5, Checks, bullet 3: "then `Ψ(ℤmot[E_C]) = ℤmot[E]` would lie in `DMT(𝔽̄_p)` (§11.1) … rational Tate objects over `𝔽̄_p` are mutually orthogonal (§11.4) … §10.5 identifies the two dimensions"

**Claim:** This Layer 9 Check rests on §§10.1, 10.5, 10.6, 11.1 and 11.4, which come later and are missing from §9.5's *Needs*. It cannot be run when §9.5 is built.

**Witness:** §9.5's *Needs* line reads "§§2.7, 8.1, 9.1; EnhancedDerivedSheaves §E5:presentability.2", and Layer 9's Dependencies begin "Layers 0–8". The bullet cites §§10.1, 10.5, 10.6, 11.1 and 11.4.

**Repair:**
- Move the bullet unchanged to §11.4's Checks.
- Add to §11.4's *Needs*: "§§2.7, 8.2, 8.5, 10.1, 10.6, 11.1; SchemeKTheoryOperations §2.6; MotivicEtaleKTheory §2.2". Move those two suppliers, and Vakil, from Layer 9's Dependencies to Layer 11's.
- Put this Check in its place in §9.5: "At the complex point `DMT(ℂ) = Dmot(ℂ) = D(ℤ)`, since every `ℤ(n)` is `ℤ` there (§8.1, Checks) and `ℤ` generates `D(ℤ)`; the pointwise condition has content only at nonarchimedean geometric points, where §11.4 exhibits an object outside `DMT`."

## R05 (P3) — The description leaves the end-theorem list empty and misdescribes `Suggested.lean`

**Location:** Pull-request description: "It also constructs the presentable category `DM_et(k, ℤ)` … The end theorems are:" (nothing follows); "the Lean states only real-bodied definitions and theorems statable …"; "succeeds with `sorry` as the only warning"

**Claim:** The list of end theorems is missing. At the head, `Suggested.lean` declares nothing and contains no `sorry`, so the other two sentences are wrong.

**Witness:** `Suggested.lean` lines 12–13 read "None of the headline theorems is statable at the pins, so this file states nothing", and lines 50–52 open and close the namespace with nothing between. `lake env lean` prints no warning.

**Repair:**
- After "The end theorems are:", insert: "cancellation over every small arc-stack (§5.3); finitarity and the rational Adams splitting of motivic K-theory (§§6.1, 6.3), and its description on nonarchimedean strict rings after inverting residue characteristics (§7.6); the torsion and tilting comparisons (§§4.8, 4.9, 8.3); six operations with proper base change (§§8.5, 9.4); rigidity (§§9.1, 9.6); the comparison with integral étale motives over algebraically closed discrete fields (§10.6); the monodromy equivalence over the completed algebraic closure of `𝔽̄_p((T))` (§11.8); and the overconvergent comparison (§12.3)."
- Replace the Lean sentence with: "`Suggested.lean` declares nothing: its docstring lists the nine headline theorems and, for each, the carriers that the pinned Mathlib and Tau Ceti lack."
- Replace "succeeds with `sorry` as the only warning" with "succeeds with no warning".

## R06 (P3) — The summary block says the roadmap follows Scholze's paper

**Location:** Pull-request description, `roadmap-summary` block: "Approach and generality. It follows Scholze's Berkovich motives: one arc-site treats archimedean and nonarchimedean points together"

**Claim:** The organisation principle forbids saying that a roadmap follows a source. The README orders its layers by their *Needs* lines and makes no such claim.

**Witness:** The binding principles say "a roadmap does not say it follows a source". The README Summary (line 3) names its inputs by roadmap and does not mention a source it follows.

**Repair:** Change the sentence to: "Approach and generality. Its main source is Scholze's *Berkovich motives*; one arc-site treats archimedean and nonarchimedean points together, …"

## Verified sound

| Statement | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §0.1 seminormed rings compactly assembled | identity of `ℤ[T]_r`; Banach tower `Z_n = ℚ_p⟨x₁,…,x_n⟩` | identity not weakly compact; fails for Banach rings | `T`: norm `r` in colimit, `r+1/n` at stages; `z = Σ pⁿx_n`, `|z| = 1/p`, coefficient `p^{n+1}` at `x_{n+1}` | holds; Scholze lines 367–401, pp. 9–10 |
| §0.3 `A((T))_{1/2}` | `f = 1+2T` over `ℂ`; `u = 1/3` | sum norm and both bounds needed | sup: `|f| = 1`, `|f²| = 2`; sum: `2`, `4 ≤ 4`; `T^{−n} ↦ 3ⁿ > 2ⁿ` | holds; Example 3.4 p. 15 |
| §0.6 quasi-pro-étale | `C → C′` (Gauss point); identity; `Cont(S, C)` | `C → C′` not qpe | `|T − c| = max(1, |c|) ≥ 1`, so `C′ ≠ C`; identity gives `S` a point | holds; Def 4.3, line 812, p. 19 |
| §0.7 repleteness ⇒ Postnikov | Tau Ceti pin; Scholze proof of 4.20 | restates the clause; cites Scholze only | `TauCeti.IsReplete` has the same clause; line 1030 cites [MR25] | R03 |
| §0.8 arc-stacks of schemes | `K[ε]/ε²`; sup norm, `r = 1`; doubled origin | nilpotents invisible; sum norm; not separated | `|ε|² = |ε²| = 0`; `(1+T)²` sup `2 > 1`; `ϖⁿ → 0` outside the locus | holds; Cor 9.6 p. 52, Lemma 5.11 p. 30 |
| §1.3 complex comparison | `Cont([0,1], ℂ)`, `U = (0,1]` | excision stalks | at `0`: `0 → ℤ → ℤ`; at `t > 0`: `ℤ → ℤ → 0` | holds; Thm 4.14, Props 4.15–4.16, all on p. 23 |
| §1.7 proper base change | `ℙ¹_C → Marc(C)`, `C` nonarchimedean and `ℂ`; fold map | Check: PF fails at every `C` | nonarch: `H¹(ℙ¹_C, Ḡ_m) ≠ 0`; `ℂ`: `RΓ(S², −)` of dimension 2, PF holds | R02; Thm 4.20 p. 24 |
| §2.1 Lemma 5.3, effective motives | `ℂ`; nonarchimedean `C`; `1 + aT` | `d(C⟨T⟩₁) ≤ 3`; `G_m` not ball-invariant | `ℂ`: 2; nonarch: `1 + scd ≤ 1 + 2 = 3`; `1 + aT` a unit not in `C^×` | holds; lines 1115–1121, p. 26 |
| §2.3 rational truncations | nonarchimedean geometric point | amplitude `[0, 1]` | `E₂^{ij}` nonzero only for `i = 0, 1`, so `H^i M` is ball-invariant | holds; Prop 5.10, lines 1272–1282, p. 30 |
| §3.5 annulus fibre bound | `T² + T/2 + 4` over `ℂ₂`, `r₁ = 1/4`, `r₂ = 4`; `T² − 1` | bound with `min` | root norms `1/8, 2`; `min(4, 1) = 1 < 2` excludes; source `max = 4` admits (line 1471) | holds; source error |
| §4.2 shrinking curves | open disc; line with doubled origin | separation needed | complement `{|1/T| ≤ 1}`; `ϖⁿ` converges to both origins | holds; lines 1556–1558, p. 37; vanDerPut pp. 156, 159 |
| §4.4 test sections | `(T − a_i)^m − ct`; `T² − T − t` | basis degree vectors | `i`-th coordinate `(−1)^{m+1}ct`, slope 1, others slope 0; witness gives both `−t` | holds (E10) |
| §4.8 torsion comparison | `ℤ₂` with `‖x‖ = 2^{−⌊v/2⌋}`; `ℂ`, `p = 2` | norm versus pointwise `|p| < 1` | `‖2‖ = 1`, `ρ(2) = 2^{−1/2}`; `|2|_ℂ = 2`, both sides `D(ℤ)` | holds; Cor 6.6, Thm 6.7, p. 39 |
| §6.3 Adams splitting | `ℙ²`; complex point | eigenvalues `1, 2, 4` | denominators `3, −2, 6`; `Kmot ⊗ ℚ (ℂ)`: `ℚ` in degrees `0, 2, 4, …` | holds |
| §7.4 KH-cofibre | `ℚ_p`; ℓ¹-completion of `ℚ₂[T]`; `C × C′` | cofibre; uniformity needed | `π₀ = K₀(ℚ_p) = ℤ`, fibre gives `ℤ × 𝔽_p^×`; `|2 + 2T| = 1`; rank `ℚ²` | holds; Thm 8.13, lines 2070–2090, pp. 49–50 |
| §7.6 and Summary | `C = ℂ₂`; `C = ℂ` | Summary: description on strict rings | `π₀ Kmot = ℤ[1/2]` vs `π₀ cofib = ℤ`; on `ℂ`, norm `< 1` is not an ideal | R01 |
| §9.2 compact morphisms | `{|T| < 1} ⊂ {|T| < 2}` | factors through the closed disc | proof of Prop 10.3, lines 2275–2279 | holds; pp. 54–55 |
| §9.5 DMT negative control | `E × E`, `E` elliptic over `𝔽̄_p` | uses §§10.1–11.4 | intersection matrix determinant `2`, so `dim End ≥ 3 > 2`; inputs come after Layer 9 | R04 |
| §9.6 rigidity | `ℂ × ℂ`; `[0,1]`; Hilbert cube | rigid, not compactly generated; `d = ∞` | `RΓ_c((0,1], ℤ) = 0`; `H^n_c((0,1)^n) = ℤ` | holds; Prop 10.3 p. 54; Thm 1.12 p. 6 |
| §10.3 generators over `k` | `f : Marc(k((T))) → Marc(k)` | `f_*ℤ = ℤ ⊕ ℤ(−1)[−1]` | dual `ℤ ⊕ ℤ(1)[1] = ℤmot[G_m]`; source cone `ℤ(−1)[−1]`, line 2408 | holds; Thm 11.1, pp. 57–58 |
| §10.5 rational shift | `X = ℙ¹`, `j = 1` | `π_i = K_{i+2j}^{(j)}` | `π_{−2} = K₀^{(1)} = ℚ`, `π₀ = K₂^{(1)} = 0` | holds (E6) |
| §11.7 Galois stack | `h_*O` vs `f_*ℤ` | degree-one map is the identity | both `ℤ[1/p] ⊕ ℚ(−1)[−1]`; identity of value group `ℚ`, lines 2559–2565 | holds; Thm 11.9 p. 61 |
| Headline §5.3 cancellation | `C = ℂ`; symmetry swap | `− ⊗ ℤ(1)` fully faithful | `ℤ(1) = ℤ`; swap is `−1` on `ℤ[1] ⊗ ℤ[1]`, `+1` on `ℤ ⊗ ℤ` | holds; Thm 1.9 p. 6 |
| Headline §§6.1, 7.6 `Kmot` | `C = ℂ₂`, `ℂ₃` | `π₀ Kmot(C) = ℤ[1/p]` | `p · rank(1/p) = 1` impossible in `ℤ`; `E_K(C)[1/2]` has `π₀ = ℤ[1/2]` | holds; Thm 1.7 p. 5 |
| Headline §§4.9, 8.3 tilting | `ℂ_p` | `Marc(ℂ_p)♭ ≃ Marc(ℂ_p♭)` | `μ_n` is the `n`-torsion of `C^×/(1 + C_{<1})` on both sides; `|p| = 1/p`, `0` | holds |
| Headline §§8.5, 9.4 six operations | closed disc; `βℕ` | disc not smooth; `βℕ ∉ P_B` | `f_*ℤ = ℤ` vs dual `ℤ(1)[2] = (Ḡ_m ⊗ ℚ)[1]`; `βℕ` not metrizable | holds; Thm 9.2, Props 9.4–9.5 |
| Headline §10.6 étale motives | `k = 𝔽̄_p`; `ℙ¹`; `ℤ/ℓ` | both sides agree | `Map(ℤ(−j), ℤ)_ℚ = ℚ[0]` iff `j = 0`; `ℤ ⊕ ℤ(1)[2]`; `D(ℤ/ℓ)` | holds |
| Headline §11.8 monodromy | `ℚ ⊕ ℚ(1)`; `ℤ/2` over `𝔽̄₃` | locally nilpotent `N` | `N ≠ 0`, `N² = 0`; `(ℤ/2, 0)` with `A ⊗ ℚ = 0`; Tor amplitude `[−1, 0]` | holds; Cor 11.10 p. 61 |
| Headline §12.3 overconvergent | `ℤ/n`; `j_!` from the rank-one point; `n = 1` | essential image | identity specialization; `0 → ℤ/n` not an iso for `n > 1`; `n = 1` zero | holds |

- Locators: 15 sampled targets; 41 locators read at the stated lines and pages of Scholze arXiv v3; vanDerPut Theorem 1.1 (p. 156) and Corollary 1.3 (p. 159); CD Corollary 5.5.7 and Remark 5.5.8 (pp. 56–57); corrections E1–E10 checked at Scholze lines 672, 1471, 1601–1631, 2182, 2399, 2452.
- Library declarations: 37 names elaborated by `#check` (23 Tau Ceti, 14 Mathlib); `TauCeti.IsReplete` (Replete.lean:91), `TauCeti.puncturedAffineSpace` (:78) and `TauCeti.PuncturedAffineSpace.homEquiv` (:208) read at the pin. All match their contracts.
- Cross-roadmap citations: about 165 section and name citations resolved in 27 roadmaps (16 on main, 11 at open heads). `Perf.Spd` is DiamondsAndVStacks §D6.1. No upward or cyclic edge.
- Gate: every check 0 at c2ddf08. Dependency check: "depcheck: 262 roadmaps, 2545 edges, 0 problem(s)". The diff outside the roadmap folder is empty.
- Lean: `lake env lean Suggested.lean` exits 0 with no output. The file has no declaration, so there is nothing to probe for padding and no `#check @` comparison to make. The nine headlines named in the docstring are not statable: Berkovich spectrum, Banach arc-site and K-theory spectrum are absent from both pins.
- Gaps: the 12 slugs are identical in the README and `design/plan.json`. None is already supplied; checked against EnhancedDerivedSheaves §§E2.4, E2.7, SchemeKTheoryOperations §5.2, GeneralAlgebraicKTheory §1.6, and KTheoryFiniteLocalFields §§2.1, 6.5.
- Overlap check: read RationalAnalyticPrismatization, ArcTopologyAndDescent, DiamondEtaleCohomology, AnalyticStacks, VStackSheavesAndLisseCategories (open) and EnhancedDerivedSheaves, SchemeKTheoryOperations, DiamondsAndVStacks (main); shared: Banach arc-site and quasi-pro-étale maps (owner here, consumed by RationalAnalyticPrismatization), monodromy description of `MG_k`, `MG_C` representations (owner here, assigned by AnalyticStacks), stable compact assembly (owner EnhancedDerivedSheaves; non-stable variant kept here), arc-topology on schemes (owner ArcTopologyAndDescent; a different site).
- Source independence: 15 passages compared across 3 sources (Scholze, vanDerPut, CD). The longest shared run is 7 words, in the definition of compact assembly (Scholze line 377). Scholze has the largest share, about 107 of 120 locators. Compared with Scholze's table of contents (lines 14–27), Layers 0–12 run through §§2–12 in order, with merges and splits. Every step of that order is forced by a *Needs* line (1.1←0.6, 2.1←1.7, 3.3←2.4, 4.4←3.5, 5.3←4.8, 6.2←5.4, 7.2←6.1, 8.1←5.3, 9.1←8.5, 10.5←7.5, 11.1←10.3, 12.3←9.4), except the free order of Layers 7 and 8. Result: independent.

## Not verifiable

- BLR §9.2, Proposition 3 (p. 244), Example 8 (pp. 246–247) and Proposition 10 (p. 249), cited in §4.3: the manifest settles this text as uncertified (paywalled), so it was cited by locator only and not read.
- Mondal–Reinecke [MR25], the theorem behind `gap:replete-postnikov`: not in the manifest and not fetched, so R03 cannot give its theorem number.

## Source issues

- **Error** in Scholze at proof of Proposition 5.19, p. 35: the source says the non-constant coefficients satisfy `|a_i| < max(r₂^{n−i}, |a₀| r₁^{−i})`; it should be the minimum of the two bounds (witness `T² + T/2 + 4` over `ℂ₂`); affects the proof.
- **Error** in Scholze at proof of Lemma 6.5, p. 38: the source says the sections `∏_i (T − a_i)^{k_i} − t` realise the degree vector `(k₁, …, k_d)`; it should be `(1, …, 1)`, since each product coordinate is `±t`, so other sections are needed; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source uses `|T| ≥ r₁ > 1` for the outer case and bounds the inner-disc product by `r₁ⁿ` via `|T − a_i| = |a_i|`; it should be `|T| ≥ r₂`, `|T − a_j| = |a_i − a_j|` and the bound `r₁^{k_i}`; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source writes the coordinate ratio as `1 + (T₂ − T₁)/(T₂ − a_j)` and a per-annulus factor `ℚ^e`; it should be `(T₁ − T₂)/(T₂ − a_j)` and `ℚ^d`; affects nothing.
- **Error** in Scholze at Example 3.6, p. 16: the source calls the bounded product of the residue fields totally disconnected; it should first pass to `A((T))_{1/2}`, since for a trivially normed `k` the product is `k`, which is not analytic; affects nothing.
- **Gap** in Scholze at the construction after Proposition 9.3, p. 52: the source starts the six operations from all affine maps of finite cohomological dimension, whose projection formula is proved only in Corollary 10.2; it should start from the ball-embeddable maps of Theorem 9.2 and rerun after Corollary 10.2; affects the proof.
- **Misprint** in Scholze at Theorem 11.1, p. 57: the source gives the rational Hom from `ℤmot[X](−j)` to `ℤ` as the weight-`j` Adams piece of `K(X)`; it should be `K(X)^{(j)}_ℚ[−2j]`; affects a stated result.
- **Misprint** in Scholze at the construction before Definition 11.3, p. 58: the source calls the map induced by the roots `f_*ℤ → g_*ℤ`; it should be the pullback `g_*ℤ → f_*ℤ`, as on p. 57; affects nothing.

## For the human reviewers

- none
