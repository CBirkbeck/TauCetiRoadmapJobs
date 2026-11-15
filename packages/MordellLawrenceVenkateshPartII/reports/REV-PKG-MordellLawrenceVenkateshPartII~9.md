<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6902798557 -->
Review (claude) of 1a4d0ab

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.5 never introduces its coefficient algebra, its group `H` or its group `G`

   **Location.** `README.md:1858–1861` (§4.5): "Let `V` be an integral polarized pure Hodge–Deligne system
   with integral Frobenius and Frobenius characteristic polynomials in `ℤ[t]` outside `S`, with uniform
   coefficient filtration and strongly c-balanced monodromy, and assume `A ≥ (d + dim H)/c`."

   **Claim.** The hypotheses of the semisimple non-density theorem are stated.

   **Witness.** LS lines 3262–3266 (Theorem 7.3) take a constant H⁰-algebra `E`, `H` one of `GL_N`, `GSp_N`,
   `GO_N`, and `V` an `E`-module with `H`-structure. §4.5 names none of them: `H` and `G` ("G-completely
   reducible") have no antecedent, whereas §6.1 (`README.md:2234–2238`) states all of them. For a bare system
   (the Legendre `H¹`) `dim H` has no value. This is the pattern of the previous round's F02, in another
   section.

   **Repair.** Replace the sentence by: "Let `V` be a pure polarized integral Hodge–Deligne system on `𝒳`
   with integral Frobenius and Frobenius characteristic polynomials in `ℤ[t]` outside `S`, an equidimensional
   module of classical rank `N` over a constant étale H⁰-algebra `E` with an `H`-structure, `H = GL_N`, `GSp_N`
   or `GO_N` (§1.5), and let `G` be its semilinear coefficient normalizer (§2.1). Assume a uniform
   single-factor profile `h` on `H` (§2.8), strongly c-balanced differential monodromy relative to residue
   Frobenius (§4.2), and `A ≥ (d + dim H)/c`." Change the line at `README.md:1877` to
   "*Needs:* §§0.2, 1.5, 1.9, 2.1, 2.3, 2.8–2.9, 3.4, 4.2, 4.4." Tested on `E = ℚ`, `H = GL_N`: `G = H`,
   `dim H = N²`, "G-completely reducible" is "semisimple", and the hypotheses are those of LS Theorem 7.3 and
   of §6.1 without its second inequality; the three Checks of §4.5 are unchanged.

2. **F02** (P3) Dependency lines omit items that their own targets list

   **Location and witness.**

   1. `README.md:1536–1541` (Layer 2, Dependencies) has no Mathlib `Finsupp`; §2.7 needs it (`README.md:1403`).
   2. `README.md:1747–1749` (Layer 3, Dependencies) has neither `TauCeti.Cocharacter.parabolic` (needed by
      §3.2, `README.md:1635–1636`) nor Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing` (needed by §3.4,
      `README.md:1737`).
   3. `README.md:2869–2871` (Layer 9, Dependencies) begins "Layers 7 and 8" and has no Mathlib name; §9.1 needs
      "Layer 0; Mathlib `MvPolynomial.pderiv`, `AlgebraicClosure`" (`README.md:2785–2786`).
   4. `README.md:2259` (§6.1): "*Needs:* §§1.9, 2.9, 3.4, 5.8, 5.12." The statement uses §0.2 (polarized,
      integral, integral Frobenius), §1.5 (cited inline), §§2.7–2.8 (`T`, uniform profile) and §4.2 (strong
      balance); §4.5 lists §0.2 and §7.6 lists §2.7 for the same reason.

   **Claim.** Every layer lists its dependencies, and a `*Needs:*` line lists what the statement and its route
   need.

   **Repair.** Append "; Mathlib `Finsupp`" to the Layer 2 line; append "; `TauCeti.Cocharacter.parabolic`;
   Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`" to the Layer 3 line; start the Layer 9 line with "Layers 0,
   7 and 8" and append "; Mathlib `MvPolynomial.pderiv`, `AlgebraicClosure`"; write §6.1's line as
   "*Needs:* §§0.2, 1.5, 1.9, 2.7–2.9, 3.4, 4.2, 5.8, 5.12." and the Layer 6 Dependencies line
   (`README.md:2269`) as "Layers 0–5." Tested: a script listed, for each of the eleven layers, the external
   items of its `*Needs:*` lines beside its Dependencies line; Layers 0, 1, 4, 5, 7, 8 and 10 already contain
   every item, and the items above are the only ones missing in Layers 2, 3 and 9. No edge to a new roadmap is
   added, so the dependency check is unaffected.

3. **F03** (P3) The manifest's `cited_for` of `LS` omits §7.1

   **Location.** `packages/MordellLawrenceVenkateshPartII/sources.toml:20`: `cited_for = ["0.1-0.7", "1.1-1.9",
   "2.1-2.10", "3.1-3.4", "4.1-4.5", "5.1-5.12", "6.1", "8.1-8.5", "10.1-10.10", "Source corrections"]`.

   **Claim.** The list names every section that cites the work.

   **Witness.** `README.md:2284` (§7.1) cites "LS, Lemma 5.43, pp. 58–59". A scan of the 79 numbered sections
   finds LS cited in the sections of the list and in §7.1 only; the lists of `LV`, `Beauville`, `BC` and
   `Serre` agree with the scan.

   **Repair.** Insert `"7.1"` after `"6.1"` in that list. Nothing else in the entry changes.

Three findings: one P2 and two P3. The seven repairs of the previous round are complete and correct.
`Suggested.lean` elaborates with `sorry` as its only warning, neither sorried theorem is padding, the
dependency check is clean, and no false statement was found. What remains is one theorem (§4.5) whose
coefficient hypotheses are not stated, dependency lines that omit items their own targets list, and one
incomplete manifest field. `README.md` below means `packages/MordellLawrenceVenkateshPartII/README.md`.

## Verified sound

### Previous findings (REV-PKG-MordellLawrenceVenkateshPartII~8), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) smooth model | `README.md:1857` and `2233`: "Let `𝒳` be smooth of finite type over `ℤ[S⁻¹]` with geometrically connected generic fibre"; Conventions `181`: "with a smooth model over `ℤ[S⁻¹]`"; §1.7 `1026–1029`; §10.4 `2968`: "spread out to a smooth model" | Repaired. LS lines 3260–3261 and 3814–3815 read again; §1.7's setting is LS lines 2206–2212. |
| F02 (P3) §5.4 group | `README.md:1996–2002`: "Let `G` be an algebraic group over `ℚ_p` with reductive identity component (as in §2.3), with a fixed faithful representation `G → GL_N` …" | Repaired; purity outside a finite set and geometric Frobenius are right (recomputed below). The same pattern survives in §4.5: R01. |
| F03 (P3) "exactly when" | `README.md:2743–2746`, API `2764–2767`, Check `2778–2782`, docstring `Suggested.lean:89–95` | Repaired; recomputed below. |
| F04 (P3) pages | `782` "p. 42"; `1906–1907` "the paragraph before Definition 8.4, pp. 74–75"; `1963–1964` "Definition 8.4, Remark 8.5 and Example 8.6, pp. 75–76" | Repaired; LS page markers: p. 42 from line 1895, p. 74 from 3347, p. 75 from 3393, p. 76 from 3442. |
| F05 (P3) Needs | `1783`, `2143`, `2479–2480` | Repaired. |
| F06 (P3) Huber | `474`: "ClassicalAdicEtaleCohomology §8.2 (proper algebraic comparison)" | Repaired; no numbered locator outside the five recorded works. |
| F07 (P3) order | `1015–1018` | Repaired; the added sentence is true (an `r` invertible on `O_K[S⁻¹]` has every prime factor below `S`, and `p` lies below no place of `S`). |

### Coverage

Read in full: the README (3241 lines, eleven layers), `Suggested.lean`, `metadata.toml`, `sources.toml`,
the gaps of `design/plan.json`, the previous review and repair report, the maintainer notes and the
overlap, citation, signature and library-match files. Every layer ends with Examples and Dependencies;
every definition has an API list and at least three Checks. A scripted search of the README finds no LaTeX
delimiter, pull-request number, machine path, round label, HTML anchor, `set_option` or process word
(the twelve hits for "lemma" are prose such as "Faltings's lemma"). The six backticked names the README
attributes to this roadmap are the six declarations of `Suggested.lean`; the four backticked supplier names
resolve (`ruckert_nullstellensatz`: ComplexKahlerGeometry README line 972 and `Suggested.lean` line 226;
`hilbert_quot_schemes`: SchemeAndStackFoundations README line 7028;
`VanishingCycles.lisseDirectImageTransport`: EtaleCohomologyFoundations README line 1135, under §F.3;
`finite_curves_goodReduction`: FaltingsFinitenessAndIsogenyTheorems `Suggested.lean` line 134).

### Seeded source sample (15 targets)

| Target | Text read | Result |
|---|---|---|
| 0.5 | LS lines 1957–1975 (Example 5.10, p. 43); 2261–2275 (Lemma 5.29, pp. 49–50) | Four realizations of a smooth projective pushforward; supported. The README restricts to constant coefficients and says so. |
| 1.8 | LS lines 2366–2377, 2400–2410 (Lemma 5.30, pp. 51–52) | `GL_N` always; translate of the inversion gives `GSp_N` for `n` even, `GO_N` for `n` odd; symmetry `(−1)^k`, `k = n − 1`. Supported. |
| 2.1 | LS lines 2429–2450 (Definition 5.31, Lemma 5.32, p. 53) | Semilinear maps, similitude identity (6), exact sequence. Supported. |
| 2.5 | LS lines 2600–2660 (Definitions 5.40–5.41, Lemma 5.42, pp. 56–58) | Exact tensor filtration; equal parabolics and conjugacy in them (2639–2642); bijection with `G°`-filtrations. Supported; the sentence at 2645–2647 is the listed correction. |
| 2.11 | Serre | Not read (uncertified); see Not verifiable. |
| 4.3 | LS lines 3139–3152 (Lemma 6.8, p. 68) | `G_mon` strongly `c`-balanced with respect to the Frobenius permutation, character chosen depending on `c`. Supported. |
| 5.1 | LS lines 3382–3396 (pp. 74–75); LV §§11.1–11.2 start at LV lines 3470 and 3535 (pp. 984, 986) | `a_S`, `w_S`, `ι_(GM)` from centres, `γ_P` as inverse determinant; footnote 9 gives `a⁻¹b`. Supported. |
| 5.3 | LS lines 3397–3447 (Definition 8.4, Remark 8.5, Example 8.6, pp. 75–76); LV lines 3645–3661 (§11.4, p. 989) | Three conditions as stated; `γ_P = t^(4(a₀−a₂))`. Supported. LS's flag is decreasing; the README's increasing flag gives the same triple. |
| 5.5 | LS lines 3511–3534 (Definition 8.8, p. 77) | Equivalence through `gP₁g⁻¹ = P₂`, equal `F_M`, equal projection of `φ`. Supported: `f` enters through its parabolic. |
| 5.10 | LS lines 3605–3634 (Lemma 8.12, p. 79); LV lines 3703–3721 (Proposition 11.3, pp. 990–991) | Both conditions, codimension at least `e`; LV: `e ≤ dim G/Q`, `a₀/2`, codimension greater than `e`. Supported. |
| 8.1 | LS lines 4076–4112 (Lemma A.1, p. 89) | `(h⁰ − t)/2 < Σ_(k>0) h^k`, reduced to (8) `2h⁰ < dim H + t` and (9). Supported, with the parity restriction the README adds. |
| 8.7 | LV lines 2929–2970 (pp. 970–971) | (10.6), (10.7) with factor `d^(2n)/2`, (10.8). Supported; the printed parameter dimension is the listed correction. |
| 8.9 | LV lines 2916–2919, 3020–3039 (pp. 970, 973) | `∃ n₀`, a function `D₀(n)`; "`n₀ ≈ 60`" at line 2919. Supported. |
| 10.1 | LS lines 3877–3879 (Definition 9.1, p. 85) | Primitive: invariant under no translation; the zero translation is the listed correction. Supported. |
| 10.9 | LS lines 4013–4040 (Corollary 9.3, Theorems 9.4–9.5, pp. 87–88) | `n ≥ 4`, or `n = 3` and `d` not a multiple of the exceptional values; Theorem 9.5 in terms of `φ³`. Supported. |

No locator is flagged by the author as unverified. Also read: LS lines 2206–2216 (§5.5), 3205–3223 (Lemma
7.2), 3259–3270 (Theorem 7.3), 3812–3841 (Theorem 8.17); LV lines 2852–2911 (§10.1, Theorem 10.1),
3065–3143 (§10.3, Lemmas 10.4–10.5), 3341–3352; BC lines 1336–1350 (Theorem 10.13, PDF p. 34); Beauville
lines 80–92 and 127–138.

### Adversarial pass (sampled targets, headlines, targets of findings, repaired text)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.3 Check | projection `ℚ(0) ⊕ ℚ(−1) → ℚ(−1)`; identity `ℚ(0) → ℚ(−1)` | `im ∩ F¹` and `f(F¹)` both of dimension 1, `im ∩ W₀ = f(W₀) = 0`; second map: 1 against 0, and `W₀ = ℚ ↦ W₀ = 0` fails | Sound |
| §0.5 | `f = id`, `k = 0`; `(1 − τ)/2` | unit; `((1 − τ)/2)² = (2 − 2τ)/4 = (1 − τ)/2`, not integral on the lattice | Sound |
| §1.6 Check (repaired) | `r = 4`, `p = 5`; `r = p` | 4 a unit once 2 is inverted, 5 below no place of `S`; `r = p` needs the places above `p` in `S` | Sound |
| §1.8 | `n = 3`, `n = 4` | `(−1)^(n−1) = +1`, `−1` | Sound |
| §1.9 Check | `C₃`, `FγF⁻¹ = γ⁻¹` | `(2 − γ − γ²)² = 6 − 3γ − 3γ²`, so `e² = e`; `(γF)² = γγ⁻¹F² = F²` | Sound |
| §2.1 | `E = E₀`; `E = E₀²`; split `GO₂` | normalizer of `GL_N`, `GSp_N`, `GO_N` in `GL_N` is itself; the swap is semilinear, not linear; `GO(xy)` is the torus normalizer, self-normalizing | Sound |
| §2.2 Check | `E₀²`, `φ = (a, b)∘swap` | `g₂ = a⁻¹g₁a` and `g₁(ab) = (ab)g₁` | Sound |
| §2.3 Check | `O(xy)` over `ℚ₃` | `d r_b d⁻¹ = r_(a²b)`, `r_c r_b r_c = r_(c²/b)`; four classes | Sound |
| §2.5 | `GL₂` `(1,0)`, `(2,0)`; `𝔾_m`, `t` and `t⁻¹`; `SL₃` | same Borel, different indices; `F¹ = ℚe₊` against `ℚe₋`; adjoint weights `1, 1, 2` against `1, 4, 5`, so `span(E₁₃, E₂₃) = F⁴` of the second only | Sound; parabolic alone does not suffice |
| §2.7 | weights `2, 0, −2` | `T(1/2) = 1`, `T(1) = 2`, `T(2) = 2`, `T(3) = 0`; `T(A) = T(A + h⁰) = B = 2` | Sound |
| §2.10 Check | torus of `GL₃` | ordered set partitions `1 + 6 + 6 = 13` | Sound |
| §2.11 Check | `GL₂` over `ℚ₃` | square classes `{1, 2, 3, 6}`, four quadratic étale algebras, four classes of tori; `H¹(T) = 1` | Sound; normalizer against centralizer right |
| §3.3 | curve, varying plus constant elliptic `H¹` | `1 ≥ 0 + 1` in `X × D_mon`; `3 ≥ 2 + 3` false in `X × LG(2, 4)`; `dim U ≤ d − codim Z ≤ 0` | Sound |
| §3.4 route | germ ideal `(xy)`; norm step | `x^m ∉ (xy)`, `xy ∈ (xy)`; conjugates of a member of an ideal defined over `K_v` stay in it, so the norm does | Sound |
| §4.2 | classes `{1,2},{3,4},{5,6},{7,8}`, `σ = (13)(24)(57)(68)` | orbits `{1,3},{2,4},{5,7},{6,8}`, two classes each | Agrees with LS Example 6.7 |
| §4.3 | `c = 1` | one class meets every orbit; σ-stable partition | Sound |
| §4.4 | `GL₂`, weights `(1, 0)` | `cA − dim H ≥ e` needs `c ≥ 5` for `e = 1` | Sound |
| §4.5 | bare system; `E = ℚ`, `H = GL_N` | `dim H` undefined; with the repair `dim H = N²`, `G = GL_N` | Hypotheses missing: R01 |
| §5.1 Check | Borel of `GL₂`, `μ = diag(t, 1)` | `det(Ad | Lie P) = a/b`, `⟨γ_P, μ⟩ = −1`; `pr(1, 0) = 1/2` | Sound |
| §5.3 | `GL₆`, `2+2+2`; `GL₁₂`, `4+4+4` | `det(Ad | Lie P) = det(g_bot)⁴ det(g_top)⁻⁴`, so `⟨γ_P, F_M⟩ = 4(a₀ − a₂)`; generic `F¹`: `3 + 2 − 6 < 0`, `3 + 4 − 6 = 1`, triple `(2, 1, 0)`, value 8; `(1, 4, 1)` averages `1/4, 1, 1/4` against `1/2` | Sound |
| §5.4 (repaired) | `ℚ_p(−1)`; `H¹(E)`; `V_pE` | geometric Frobenius `ℓ`, weight 2, jump `+1`; weight 1, jumps `0, 1`, average `1/2`; weight `−1`, average `−1/2`; arithmetic Frobenius would predict `−1` | Sound |
| §5.5 | `f` with weights `(1, 0)` and `(5, 0)` | same `P_f`, same type; changing `F` changes `F_M` | Sound |
| §5.6 Check | `𝔾_a`, `ψ = −1`; `ψ(x, y) = (−x, 2y)` | `v = −u/2`; `(2, 0) + (−2, 0) = 0`, `ψ(v) − v = (2, 0)` for `v = (−1, 0)` | Sound |
| §5.9 | `SL₂`; `SL₃`, 3-cycle | `{−α} → {−α}`; both sets of size `ℓ(w) = 2`; `wβ ∈ Σ_(L_P)⁺` would give `β > 0` | Sound |
| §5.10 | `GL₂`, `c = e = 1`; `A = e` | `T(1) + T(1) = 2 > B = 1`; `T(e) = B` makes the hypothesis `B > B + …` false | Hypothesis fails where it must |
| §7.6, §7.7 | `A ≥ h⁰ + d`; `d′ ≤ d` | `3h⁰/2 + d ≤ A + h⁰`; `T` nondecreasing there, so both inequalities pass to `d′` | Sound |
| §7.8 | `M = 1`; general `M` | `‖g_M‖² = (2M+1)(8M²+8M+3)/3`, 19 at `M = 1`; `(2M+1)²/‖g_M‖² ≤ 3/(4M)`; error `≤ 2Q^(4M)·(17/16)/(15/16)³ = 2.58·Q^(4M) < 0.29·b²`; `|#Y − #ℙ^m| ≤ q^((m+1)j)` | Sound |
| §8.1 | `(n, d) = (2, 1)`: `GL₂`, `GSp₂`, `GO₂`; `(3, 1)` `GO₆` | `4 < 6`; `4 < 6`; `4 < 4` fails; `h⁰ = 8`, `16 < 20`; general reduction to `2Σm² ≤ N²`, plus `m_mid > 0` for `GO` | Sound |
| §§8.2–8.3 | `n = 2, 3` | `β = (1/4, 1/2, 1/4)`, second moment `1/2`; `β = (1/36, 2/9, 1/2, 2/9, 1/36)`, sum 1, second moment `2/3` | Sound |
| §8.4 and `eulerian_central_mass_le_half` | `n = 1, …, 7` | `2 > 1`; `4 = 4`; `36 = 36`; `488 ≤ 576`; `11420 ≤ 14400`; `377816 ≤ 518400`; `17405640 ≤ 25401600`; reference tail `(3/4)·3^(−k)`, moment bound `(3/2)·Σ(2k−1)3^(−k) = 3/2`; `(n+1)/6 ≥ 3/2` iff `n ≥ 8` | True; `n ≥ 2` needed |
| §8.5 Check | `GL₂` profile, `c ≥ 5(e + 4)` | `x ≤ 1/5`, `B = 1 > 2x` | Sound |
| §8.6 | quartic surface; quintic threefold; BC degree | `1, 19, 1`; `1, 101, 101, 1`; `(n+1)(d−2) − ((n−p)d − n − 1) = (p+1)d − n − 1` | Sound |
| §8.7 | `n = 2`; plane quartics | `d²/2·(1, 1)` against genus `(d−1)(d−2)/2`; `binomial(6, 4) − 1 = 14` against 19 | Sound |
| §8.9 | `n` fixed, `d → ∞` | `dim Y/h⁰ ∼ (d^n/n!)/(β₀ d^(2n)/2) → 0`, also with `d^(n+1)` | Sound |
| §9.1 (repaired) | `F₀ = x₀² + x₁² + x₂²`, `3F₀`, `2F₀`, `S = {2}` | content 1: both sides hold; content 3: zero modulo 3, predicate false; content 2, a unit: same point | Sound |
| §9.2 | `(3, 3)`; `(5, 3)`; `(3, 4)` | Jacobian degree at `p = (n−3)/2`: `−1`, `0`, `0`; so `(0, 6, 0)` definite, the others indefinite | Exception exactly `(3, 3)` |
| §9.3 headline (Lean) | `G = 1`; scaling | the probe with `G = 1` leaves "no form has good reduction", unprovable in one step; `G(λF) = λ^e G(F)` | Not vacuous, not padding |
| §10.1 | `([2] × id)⁻¹H′` | `Stab = E₁[2] × 0`, order 4 | Sound |
| §10.8 | `T = E[2]`; `m = |T|` | `E/T ≅ E`, quotient `E(K)/2E(K)`; `π ∘ π̂ = [m]`, so `π(A(K)) ⊇ m·(A/T)(K)` | Sound |
| §§10.6, 10.9 | `D₁` | `53130/6 = 8855`; `8855 | 17710`; `d` not divisible by `D_j` iff `φ³` not divisible by `6D_j` | Sound |

### Lean acceptance

`lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content checkout:
exit 0; the only output is `declaration uses sorry` at 69:8 and 109:8. One import, `import Mathlib`; no
`set_option`, no `lemma`, no sorry'd data. `#check @name` for all six declarations on a scratch copy,
elaborated once: `eulerian : ℕ → ℕ → ℕ`; `eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈
Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`; `HypersurfaceMonomial : ℕ → ℕ → Type`;
`IsSmoothHypersurface : {k : Type u_1} → [Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`;
`HasGoodReductionOutside : {n : ℕ} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`; the headline as in
the file. No binder lost; each agrees with its README statement. `decide` proves `eulerian 0 0 = 1`,
`eulerian 1 1 = 0`, `eulerian 3 1 = 4`, `eulerian 4 1 = 11`, the failure of the inequality at `n = 1` and
the value 488 at `n = 4`.

One-tactic probe on both sorried theorems, thirteen attempts (`simp`, `rfl`, `simp` with the definitions
unfolded, `omega`, `positivity`, `exact Nat.zero_le _`, `infer_instance`, `aesop`, `exact` with the witness
`G = 1`): none closes. No padding.

Headlines from the Summary: the coefficient non-density theorem (§6.1), the higher-dimensional theorem with
its finiteness clause (§§7.6–7.7) and Shafarevich finiteness (§§10.6, 10.9, 10.10) are named in the module
docstring as not statable, each with the missing carrier, as is §7.8; the hypersurface non-density (§9.3)
and the Eulerian bound (§8.4) are stated. None statable is absent. §7.6 asks for a smooth projective
family with a relatively ample class where LV line 2885 says "smooth proper": primitive cohomology needs
the class, so this is no narrowing.

### Library declarations opened at the pins

`Mathlib/RingTheory/Filtration.lean:432` (`Ideal.iInf_pow_eq_bot_of_isLocalRing`, with `[IsNoetherianRing
R] [IsLocalRing R] (h : I ≠ ⊤)`); `Mathlib/Data/Finsupp/Weight.lean` (`Finsupp.degree`);
`Mathlib/RingTheory/Regular/RegularSequence.lean:147`;
`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` (namespace `TauCeti.Cocharacter`);
`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188`;
`TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `Morphism.lean:77`, `Strictness.lean:110, 118, 131`,
`Abelian.lean:33`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `LineBundle/Ample.lean:71`;
`CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45`;
`IntersectionNumber/Basic.lean:111`; `LineBundle/Degree.lean:74, 130`. Each exists with the cited name and
namespace. Neither pinned library has Eulerian numbers (the only hits are Eulerian walks of graphs), a
smooth-hypersurface predicate or a good-reduction predicate for forms.

### Suppliers, gaps, overlaps

Resolved this round against main or the open heads, by heading: SheafConvolutionOnAbelianVarieties §§0.2,
2.4, 3.1, 3.3, 4.8, 5.2, 5.3, 6.7, 8.3 and the paragraph "8.2 Character generic in every conjugate";
MordellLawrenceVenkatesh §§0.3, 0.4, 0.24, 1.2, 1.10, 1.12, 1.13, 2.5, 2.6, 2.8, 2.11, 3.8;
HeightsRationalPointsAndObstructions §§1.6, 1.7, 5.2; DeligneWeightsAndPurity §§0.1, 0.2, 0.7, 0.9, 0.10,
0.16, 2.2, 4.3, 4.4, 9.12; SchemeAndStackFoundations §§0.8, 0.9, 1.16, 4.14; ComplexKahlerGeometry §3.4
of Layer 3 (K3); RestrictedPowerSeries §§2.1, 5.2; ClassicalArithmeticCompletion §§2.18, 2.39, 2.56;
ReductiveGroups Layers 3, 4, 5, 6A, 7, 7b; ReductiveGroupsPartII §RG2.0.2 (it contains the paragraph
"Analytic charts and Haar Jacobians in characteristic zero"); JacobianChallenge Layer F;
EtaleCohomologyFoundations §F.3. Statements read: SheafConvolutionOnAbelianVarieties §§3.1, 3.3 (the
formula `(−1)^(n−1−q)·d·A(n, q)` and weight `−q`, as the Conventions use them) and §§5.2–5.3 (pairs
`(1,5), (5,20), (20,76)`, `D_j` for `j ≥ 1`). `roadmaps resolve` on the README reports no unresolved
cross-roadmap citation and no unresolved Lean name. The other supplier sections rest on that tool and on
the earlier rounds' reading.

The seven gap slugs agree, supplier, section and sentence, between `design/plan.json` and the README
(compared by script, all seven identical). None is already provided: ClassicalArithmeticCompletion mentions
log-concavity once, as an alternative route in §2.56 (README line 4087), and has no variance or limit law
for descents; its Lawrence–Sawin sections (§§2.57, 2.71, 2.77, 2.78) are the Appendix C inequalities, not
Appendix A, so §8.4 is not a second copy. An acceptance would be conditional on all seven.

Dependency check (the prescribed command):

```text
depcheck: 239 roadmaps, 2276 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap is line 320 of the merge order, directly after
SheafConvolutionOnAbelianVarieties (319); LogicAndDefinabilityInNumberTheory (324) is named in Downstream
consumers only. No notion was moved.

Duplication by object: a search of main and of every open roadmap pull request finds
`IsSmoothHypersurface`, `HypersurfaceMonomial` and `eulerian_central_mass_le_half` nowhere else;
`HasGoodReductionOutside` occurs in HeightsRationalPointsAndObstructions (README line 2000) for curves, in
its own namespace; FiniteGroupInvariants has an unrelated `eulerian`; ClassicalArithmeticCompletion's
`Suggested.lean` declares no Eulerian number. "Hodge–Deligne system" occurs elsewhere only in
LogicAndDefinabilityInNumberTheory §7.6, which the README names as a consumer. The overlap file lists no
pull request changing this roadmap, no dropped id and no revision-only id.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh,
GaloisSectionsPadicPeriodMaps (and LogicAndDefinabilityInNumberTheory §7.6); character sheaves, convolution
monodromy and exceptional degrees — SheafConvolutionOnAbelianVarieties, which names a Part II of
MordellLawrenceVenkatesh as its consumer; Lie–Goursat, Faltings's lemma, residue disks, the Lagrangian
period variety — MordellLawrenceVenkatesh, which leaves the sections after Lawrence–Venkatesh §8 to another
roadmap; Eulerian numbers — ClassicalArithmeticCompletion; the period-codimension consequence of
Ax–Schanuel — this roadmap §3.3; nothing shared with GaloisSectionsPadicPeriodMaps (its period maps are
asked of MordellLawrenceVenkatesh for abelian-by-finite families).

### Maintainer notes

1. Arrangement: confirmed independent (below); no edit of this round moved a layer.
2. Worked instances without a locator: refuted at this head; the restatements carry "(LS, Example 6.7,
   p. 68)" at `README.md:1883` and "(LS, Example 8.6, pp. 75–76)" at `README.md:2216–2217` and `3178–3179`.
3. Licence remarks: carried to the last section.

### Copyright, wording and arrangement

Wording was compared at the 14 sampled locators that could be read and at eight further passages: §1.7
against LS lines 2206–2212; §4.5 against LS lines 3259–3270; §6.1 against LS lines 3812–3841; §7.3 against
LV lines 3113–3122; §7.6 against LV lines 2885–2903; §8.6 against BC lines 1341–1346; §9.2 against
Beauville lines 84–89; the docstrings of `integralHypersurfaces_not_zariskiDense` and `eulerian` against LV
lines 2916–2918 and 2941–2943. No sentence follows a source clause by clause. The longest shared runs are
names of objects and hypotheses that can be written one way ("exact tensor filtration of the forgetful
functor", seven words, LS line 2600; "an abelian variety of dimension `n` over", LS line 2206). No table,
figure, list of examples or numerical data is taken over; the two restated source examples carry their
locators and are recomputed in the roadmap's notation (LS Example 8.6 with the flag reversed).

Arrangement: by a count of locator items in the layers, LS has 68 of 100, LV 27, BC 2, Serre 2, Beauville
1. LS's contents are §5 (5.1–5.10), §6 (6.1–6.2), §7, §8, §9 and Appendix A. Layer 0 takes LS 5.2; Layer 1
takes 5.3–5.5 and adds §1.9; Layer 2 takes 5.6–5.10 with LV §2.3 and the roadmap's own §2.11; Layer 3 takes
6.1 with LV §9; Layer 4 takes 6.2 and all of §7; Layers 5 and 6 split §8 with LV §11; Layer 7 is LV
§§10–12; Layer 8 puts Appendix A beside LV §10.2 and Batyrev–Cox, before the applications; Layer 9 is LV
§10.2 with Beauville; Layer 10 takes §9. No run of layers maps one to one onto sections of a source, and
the order of Layers 0–6 is forced: §1.1 needs §§0.3–0.4, §2.1 needs §1.5, §3.1 needs §2.5, §4.4 needs §3.2,
§5.12 needs §4.2 and §6.1 needs §§5.8, 5.12.

Source independence: 22 passages compared with 4 sources (LS, LV, BC, Beauville), none shared; largest
share LS, 68 of 100 locators; contents compared with LS: independent.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3 (sampled target §2.11): settled as uncertified; the text
  was not read. The two statements cited (finiteness of `H¹` of a linear group over a p-adic field; the
  kernel of `H¹(A) → H¹(B)` as orbits on the points of `B/A`) are standard and the Checks of §2.11 were
  recomputed.
- LawrenceVenkateshMethod (listed in the packages index on another pull request's branch): its design
  README could not be read (the listed head returns "not found"). Only its design review is in this
  checkout, `packages/LawrenceVenkateshMethod/reports/REV-DESIGN-LawrenceVenkateshMethod.md`, which rejects
  that design as having no scope of its own; ownership against its text was not checked.
- LV lines for Lemma 11.4 and Lemma 12.1 were not re-read this round; the computation of §7.8 was redone
  independently of the text (table above).
- Supplier statements other than those listed under "Suppliers, gaps, overlaps" were resolved by the
  citation tool and by the earlier rounds, not re-read.

## Source issues

- **Error** in LV at §10.2 before (10.8), printed p. 971: the source says the space of degree-d hypersurfaces in projective n-space has dimension `binomial(n+d, d−1) − 1`, of order `d^(n+1)`; it should be `binomial(n+d, d) − 1`, which is 14 for plane quartics; affects nothing.
- **Error** in LS at §5.8.2 after Definition 5.40, preprint p. 57: the source says that for reductive `G` the parabolic determines the filtration on every representation up to reindexing; it should require conjugacy of the cocharacters in the parabolic, as its preceding paragraph does (`t` and `t⁻¹` on `𝔾_m`); affects nothing.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says a primitive hypersurface is invariant under no translation by a geometric point; it should exclude only nonzero points; affects a stated result.

The other entries of the README's "Source corrections" were recorded by earlier rounds and were not re-read
in this one.

## For the human reviewers

- **Licence.** `sources.toml` records `Serre` (a Springer monograph) as `uncertified` with `licence_class = "none"`; it is cited by section number only at `README.md:1489–1491`, and no text was read.
- **Licence.** The `LV` text was cached from `bimsa.net/doc/publication/2578.pdf` (`licence_class = "institutional"`), a host that is neither author's institution; `README.md:3233–3235` cites the journal and arXiv:1807.02721v3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1a4d0abcbb6983bd60df01cd7aa31e388a6bf052", "job": "REV-PKG-MordellLawrenceVenkateshPartII~9", "model": "fable", "worker": "chris-x91"} -->
