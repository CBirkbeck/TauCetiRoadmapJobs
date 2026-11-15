<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6901794523 -->
Review (claude) of ca1d3f6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §§4.5 and 6.1 drop the smoothness of the model

   **Location.** `README.md:1851` (§4.5) and `README.md:2221` (§6.1): "Let `𝒳` be of finite type over
   `ℤ[S⁻¹]` with smooth geometrically connected generic fibre `X` of dimension `d ≥ 1`."

   **Claim.** The two non-density theorems hold for a Hodge–Deligne system on any finite-type model with
   smooth generic fibre.

   **Witness.** LS lines 3260–3261 (Theorem 7.3) and 3814–3815 (Theorem 8.17) take a smooth model over
   `ℤ[1/S]`. §0.1 (`README.md:588–589`) defines systems only on a smooth model, §3.4 (`README.md:1669–1670`),
   which both routes apply, assumes `𝒳` smooth, and §7.6 (`README.md:2388`) says "smooth of finite type".

   **Repair.** In both places write "Let `𝒳` be smooth of finite type over `ℤ[S⁻¹]` with geometrically
   connected generic fibre `X` of dimension `d ≥ 1`." Tested: with the word added, the hypotheses of §4.5
   and §6.1 are those of §0.1 and §3.4 and of LS Theorems 7.3 and 8.17; the Check "`S` is enlarged only by
   finitely many primes" still applies, since a model smooth over `ℤ[S⁻¹]` stays smooth over `ℤ[S′⁻¹]`.

2. **F02** (P3) §5.4 never introduces its group or its representation

   **Location.** `README.md:1990–1992`: "Let `ρ : G_ℚ → G(ℚ_p)` be crystalline at `p`, pure of integer
   Weil weight `w` on the faithful representation, with image in a Richardson parabolic `P`."

   **Claim.** The hypotheses are stated.

   **Witness.** No sentence of §5.4 says what `G` is, and "the faithful representation" has no antecedent
   (§§5.1–5.3 fix none). LS lines 3465–3468 (Lemma 8.7) fix `G` over `ℚ_p` with reductive identity component
   and an embedding `G ↪ GL_N`; LS lines 3338–3341 state purity outside a finite set of primes.

   **Repair.** Replace the sentence by: "Let `G` be an algebraic group over `ℚ_p` with reductive identity
   component (as in §2.3) and a fixed faithful representation `G → GL_N`. Let `ρ : G_ℚ → G(ℚ_p)` be
   continuous, crystalline at `p` and unramified outside a finite set of primes, such that at every
   unramified prime `ℓ ≠ p` the eigenvalues of Frobenius on the `N`-dimensional representation are Weil
   numbers of one integer weight `w`, and suppose that the image of `ρ` lies in `P(ℚ_p)` for a Richardson
   parabolic `P` of `G` defined over `ℚ_p`." Tested on the section's Checks: for `G = GL₂`, `ρ = H¹` of an
   elliptic curve and `P` a Borel, the hypotheses read as before and the Check (no line of degree `1/2`)
   is unchanged.

3. **F03** (P3) "represents a `ℤ[S⁻¹]`-point exactly when" is ambiguous for non-primitive forms

   **Location.** `README.md:2730–2731`: "an integral form represents a `ℤ[S⁻¹]`-point exactly when
   `HasGoodReductionOutside S F` holds"; the API bullet at `README.md:2749–2750`; the docstring of
   `HasGoodReductionOutside`, `Suggested.lean:90–92`.

   **Claim.** For an integral form, defining an integral point and satisfying the predicate are equivalent.

   **Witness.** `n = d = 2`, `S = {2}`, `F₀ = x₀² + x₁² + x₂²`, `F = 3·F₀`. `[F] = [F₀]` is a `ℤ[1/2]`-point of
   `Y_(2,2)` (modulo odd `p` the partials `2x_i` vanish only at `0`), but `F ≡ 0` modulo 3, so the predicate
   fails for `F`.

   **Repair.** §9.1 statement: "an integral form whose coefficients generate the unit ideal of `ℤ[S⁻¹]` is
   the coordinate vector of a `ℤ[S⁻¹]`-point exactly when `HasGoodReductionOutside S F` holds; every
   `ℤ[S⁻¹]`-point has such a coordinate vector, unique up to a unit of `ℤ[S⁻¹]`, and a form satisfying the
   predicate has such coefficients". Reword the API bullet the same way, and add the Check: "For `S = {2}`
   the form `3(x₀² + x₁² + x₂²)` defines the same rational point as `x₀² + x₁² + x₂²`, an integral point, but
   is zero modulo 3 and fails the predicate; §9.3 is unaffected because `G` is homogeneous." Docstring:
   "A form with this property is a coordinate vector, with coefficients generating the unit ideal, of a
   `ℤ[S⁻¹]`-point of the parameter space, and every such point has one." Tested on the witness: `3·F₀`
   has content 3, not a unit of `ℤ[1/2]`, so the repaired equivalence does not speak of it; `F₀` satisfies
   both sides.

4. **F04** (P3) Three page slips against the cached Lawrence–Sawin text

   Each was read at the cited place (page markers of the LS text: p. 42 from LS line 1895, p. 43 from 1940,
   p. 74 from 3347, p. 75 from 3393, p. 76 from 3442).

   1. `README.md:781–782` (§0.6): "LS, Definition 5.6 and the following discussion, pp. 42–43". The
      definition and its paragraph on the Zariski closure of monodromy are LS lines 1916–1925, all on p. 42;
      Remark 5.7 follows on the same page. Repair: "p. 42".
   2. `README.md:1900–1901` (§5.1): "LS, Definition 8.4, pp. 74–75". The spaces `a_S`, the weight `w_S`, the
      map `ι_(GM)` and `γ_P` are in the paragraph before the definition, LS lines 3382–3396 (pp. 74–75);
      Definition 8.4 itself (LS line 3397) defines the three balance conditions. Repair: "LS, the paragraph
      before Definition 8.4, pp. 74–75".
   3. `README.md:1957` (§5.3): "LS, Definition 8.4 and Example 8.6, pp. 74–76". Definition 8.4 is LS lines
      3397–3411 on p. 75 and Example 8.6 begins at LS line 3417 on p. 75. Repair: "pp. 75–76", as the
      Layer 5 Examples and the Worked examples already have for Example 8.6.

   The other LS locators of the layers (every numbered statement of LS §§5–9 and Appendix A that the README
   cites) agree with the page map.

5. **F05** (P3) Three `*Needs:*` lines list sections the target does not use

   **Location and witness.**

   1. `README.md:1777` (§4.1): "*Needs:* §0.6; MordellLawrenceVenkatesh §0.24; ReductiveGroups Layer 7." The
      statement is about a closed subgroup of `H^I` and the route is Goursat's lemma (LS lines 3082–3106 are
      pure group theory); nothing of §0.6 is used.
   2. `README.md:2132` (§5.9): "*Needs:* §§2.5, 5.1–5.2; ReductiveGroups Layer 7." Statement and route use
      only roots, standard parabolics and the Weyl group.
   3. `README.md:2467` (§7.8): "*Needs:* §2.7; …". The statement is a bound for a hypersurface over `𝔽_q`
      and its route uses eigenvalue multiplicities and a point count; no adjoint profile or `T` occurs.

   **Claim.** Each line lists what the statement and its route need.

   **Repair.** §4.1: "*Needs:* MordellLawrenceVenkatesh §0.24; ReductiveGroups Layer 7." §5.9: "*Needs:*
   ReductiveGroups Layer 7." §7.8: "*Needs:* DeligneWeightsAndPurity §§0.10, 4.3; WeilConjectures Layer WC.5;
   EtaleDualityAndPerverseSheaves §4.3." The layer Dependencies lines need no change. Tested: after the
   edit §4.1 no longer waits for Layer 0, and §§5.9 and 7.8 have no in-roadmap prerequisite.

6. **F06** (P3) A numbered locator into a work the manifest does not record

   **Location.** `README.md:474`: "ClassicalAdicEtaleCohomology §8.2 (proper algebraic comparison, Huber's
   Theorem 3.7.2)".

   **Claim.** Every work cited with a locator is in `sources.toml` and in References.

   **Witness.** `sources.toml` has five entries (`LS`, `LV`, `Beauville`, `BC`, `Serre`); none is Huber, and
   `## References` has none. The theorem number is the supplier's own locator (its §8.2 cites it).

   **Repair.** Write "ClassicalAdicEtaleCohomology §8.2 (proper algebraic comparison)". The supplier keeps
   the locator. Tested: no numbered citation outside the five recorded works remains (a search for
   "Theorem", "Proposition", "Lemma", "Corollary" followed by a number finds only LS, LV, Beauville,
   Batyrev–Cox and Serre).

7. **F07** (P3) A Check of §1.6 calls the order a prime

   **Location.** `README.md:1015`: "The order prime `r` is invertible on the model and may differ from the
   cohomological prime `p`."

   **Claim.** `r` is a prime.

   **Witness.** §1.6 takes any `r` invertible on the base and a character of `A[r]`; `r = 4` is allowed, and
   LS line 2256 says "some finite order `r`".

   **Repair.** "The order `r` is invertible on the model; it need not be prime and it is unrelated to the
   cohomological prime `p` (for `p = 5`, a character of order 4 is allowed when 2 is invertible)."

Seven findings: one P2 and six P3. The four repairs of the previous round are complete, `Suggested.lean`
elaborates with `sorry` as its only warning, neither headline is padding, and the dependency check is
clean. No false statement was found. The findings are a dropped smoothness hypothesis in two theorems,
one theorem whose group is never introduced, one ambiguous "exactly when", three page slips, three
`*Needs:*` lines that list sections the target does not use, one locator into a work the manifest lacks,
and one misworded Check. `README.md` below means `packages/MordellLawrenceVenkateshPartII/README.md`.

## Verified sound

### Previous findings (REV-PKG-MordellLawrenceVenkateshPartII~7), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) second owner of §3.3 | `README.md:48–50`: "the codimension consequence of Ax–Schanuel (§3.3; Lawrence–Sawin, Lemma 6.3)"; `README.md:3143–3148`: "LogicAndDefinabilityInNumberTheory §7.6 states the complex period codimension consequence of §3.3 with the Ax–Schanuel theorem … carried as a named hypothesis" | Repaired. Read at the other roadmap's head: its §7.6 does take the Bakker–Tsimerman statement as hypothesis (I-BT). The changed wording (a supplier theorem, not "unconditional") is right: §3.3 rests on gap:period-map-ax-schanuel. |
| F02 (P2) §3.2 integrality | `README.md:1604–1607`: "For a polarized integral Hodge–Deligne system on `X` (§0.2) with differential monodromy group `G_mon` (§0.6) and connected monodromy period orbit `D_mon` (§3.1)"; Check `README.md:1620–1627`; Needs `README.md:1629` | Repaired. The new Check was recomputed (below). |
| F03 (P3) six locators | `README.md:1218` "LV, §2.3 and Lemmas 2.4–2.5, pp. 905–906"; `1641` "p. 964"; `1901` "pp. 984–986"; `2074` "p. 80"; `2167` "p. 81" and "pp. 993–994"; `2613` "pp. 970–971"; `2350` "pp. 993–994" | Repaired; LV §11.6 runs LV lines 3796–3857 (pp. 993–994), LS Lemma 8.14 at LS line 3668 (p. 80), Lemma 8.15 at 3687 (p. 81). The pattern survives in three LS locators: R04. |
| F04 (P3) supplier contracts | `README.md:534–540` (§A3.2), `337–343` (ReductiveGroups Layer 3), `489–491` (DeligneWeightsAndPurity §2.2), `436–442` (PadicHodgeTheory §§4.4, 5.5), `399–406` (ShimuraData §§3.2, 1.3–1.4) | Repaired; each section exists at its supplier's head with the content described. |

### Coverage

Read in full: the README (3219 lines, 11 layers), `Suggested.lean`, `metadata.toml`, `sources.toml`, the
gaps of `design/plan.json`, the previous review and repair report, the maintainer notes, and the overlap,
citation, signature and library-match files. Every layer ends with Examples and Dependencies; every
definition has an API list and at least three Checks (the fewest is three; §2.5 has six). A search of
both files finds no LaTeX delimiter, pull-request number, machine path, round label, `set_option`, Lean
`lemma`, sorry'd data or process word. The six backticked names the README attributes to this roadmap
are the six declarations of `Suggested.lean`.

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Text read | Result |
|---|---|---|
| 0.6 | LS lines 1916–1925 (Definition 5.6, p. 42) | Differential Galois group of `(V_dR, ∇)`; equals the Zariski closure of monodromy by Riemann–Hilbert and regular singularities. Supported; page, R04. |
| 1.1 | LS lines 2054–2069 (Definitions 5.14, 5.16, p. 45) | As the previous round found; unchanged text. Supported. |
| 1.3 | LS lines 2141–2163 (Definition 5.22, Remark 5.23, p. 47) | Unital associative action; `V ⊗_E W` as a coequalizer. Supported; the balanced pairing is the roadmap's own. |
| 1.4 | LS lines 2164–2186 (Definitions 5.24–5.25, Lemma 5.26, pp. 47–48) | Free of finite rank, equivalently equal factor dimensions; rank passes to the other realizations. Supported. |
| 1.6 | LS lines 2256–2260 (Lemma 5.28, p. 49) | Character of finite order `r`, module over the trivial algebra of `ℚ[μ_r]`. Supported; Check wording, R07. |
| 3.4 | LS lines 2979–2999, 3056–3077 (Theorem 6.4, pp. 65–67) | Polarized integral system on a smooth model, `codim Z ≥ dim X`, any number field; Nullstellensatz, norm, Krull. Supported. |
| 4.1 | LS lines 3082–3106 (Lemma 6.5, p. 67) | Relation "pair projection not surjective", equivalence, representatives give a surjection with finite kernel. Supported; the README's exclusion of `SO₂`, `SO₄` is the hypothesis the proof uses (`H/Z` simple). |
| 5.4 | LS lines 3338–3344 (Lemma 8.1, p. 73), 3464–3489 (Lemma 8.7, pp. 76–77) | Average Hodge weight `w/2` over ℚ; associated graded balanced. Supported; hypotheses, R02. |
| 5.9 | LV lines 3723–3724, 3744, 3780–3795 (Lemma 11.4, (11.12), (11.14), pp. 991–993) | `W_PQ`, the two root sets, size `ℓ(w)`. Supported; the inverse map is the listed correction. |
| 6.1 | LS lines 3812–3841 (Theorem 8.17, p. 83) | Both numerical conditions as stated, strong `c`-balance, `t = rank H`. Supported; smooth model, R01. |
| 7.4 | LV lines 3341–3379 (Proposition 10.6, pp. 981–982) | (10.23) non-strict, (10.24) strict, codimension `≥ e`, weight `d/2` on each graded piece. Supported. |
| 8.7 | LV lines 2929–2970 (pp. 970–971) | (10.6), (10.7), (10.8). Supported; the printed parameter dimension is the listed correction. |
| 8.9 | LV lines 2916–2919, 3020–3064 (pp. 970, 973–974) | `∃ n₀`, `D₀(n)`; `d` chosen after `n`; "`n₀ ≈ 60`" is at LV line 2919. Supported. |
| 10.4 | LS lines 3930–3944 (p. 86) | Component of the closure, resolution, spreading out, lifting by properness. Supported; geometric irreducibility is the roadmap's own argument. |
| 10.7 | LS lines 4013–4030 (Corollary 9.3, pp. 87–88) | `H = π⁻¹H′`, `d = d(φ′)·deg π`, finitely many `π`. Supported. |

No locator is flagged by the author as unverified. Also read: LV lines 2843–2903 (§10.1 and Theorem
10.1, pp. 968–970), LV lines 3703–3721 (Proposition 11.3: codimension greater than `e`), LV lines
3865–3941 (Lemma 12.1), LS lines 3259–3270 (Theorem 7.3), LS lines 3109–3137 (Definition 6.6, Example 6.7).

### Adversarial pass (sampled targets, headlines, targets of findings, repaired text)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.4 Check (repaired) | Legendre family at `λ = 0` | local monodromy `[[1, 2], [0, 1]] ≠ I`, in `Γ(2)`; a constant system has trivial monodromy | Sound |
| §0.6 | constant system; finite monodromy `C₂`; `SL₂`-dense | `G_mon = 1`; `G_mon = C₂` (not `1 = G_mon°`); `G_mon = SL₂` of dimension 3, not `GL₂` of dimension 4 | Sound |
| §1.3 | `E = ℚ × ℚ`; involution `ι` | `(V₁, V₂) ⊗_E (W₁, W₂) = (V₁ ⊗ W₁, V₂ ⊗ W₂)`; `B(ev, w) = e·v·ι(w)` against `B(v, ew) = ι(e)·v·ι(w)` | Sound |
| §1.4 | ranks `(2, 2)`, `(1, 3)`; `E = 0` | `N = 2`; total 4 but not equidimensional; no embeddings, every `N` | Sound; `E ≠ 0` needed for uniqueness, as stated |
| §1.6 | `χ` of order 3; order 4 with `p = 5` | coefficient field `ℚ(μ₃)`, ℚ-rank 2; order 4 allowed, not prime | Statement sound; Check wording R07 |
| §1.9 | `Γ = C₃`, `FγF⁻¹ = γ⁻¹`, `e = (2 − γ − γ²)/3` | `e² = (6 − 3γ − 3γ²)/9 = e`; `(γF)² = γγ⁻¹F² = F²` | Sound |
| §2.3 Check | `O(xy)` over `ℚ₃` | `d·r_b·d⁻¹ = r_(a²b)`, `r_c·r_b·r_c = r_(c²/b)`; classes `= ℚ₃^×/ℚ₃^(×2)`, 4 | Sound |
| §2.10 Check | diagonal torus of `GL₃` | ordered set partitions of 3 points: `1 + 6 + 6 = 13` | Sound |
| §3.2 Check (repaired) | `R = [[3/5, −4/5], [4/5, 3/5]]` | `det = 1`, `tr = 6/5`, minimal polynomial `5t² − 6t + 5`, eigenvalues `(3 ± 4i)/5` not integral and not roots of unity; closure `SO(2)`; type `(0,0)` has trivial Mumford–Tate group | Sound |
| §3.3 | `X` a curve, `Z` a point; ambient check | `dim U ≤ (1 + 0) + 1 − (1 + 1) = 0`; `1 ≥ 0 + 1` in `X × D_mon`, `3 ≥ 2 + 3` false in `X × LG(2,4)` | Sound |
| §3.4 | `Z = D_mon`; germ ideal `(xy)` | codimension `0 < d`, preimage `Ω` dense; `x^m ∉ (xy)`, `xy ∈ (xy)` | Sound |
| §4.1 | diagonal `H ⊂ H²`; `H²`; `SO₄` | one class, kernel trivial; two classes; adjoint quotient `PGL₂ × PGL₂` not simple | Sound; Needs line R05 |
| §4.2 | classes `{1,2},{3,4},{5,6},{7,8}`, `σ = (13)(24)(57)(68)` | orbits `{1,3},{2,4},{5,7},{6,8}`, each meets 2 classes; 4-balanced, strongly 2-balanced only | Agrees with LS lines 3133–3137 |
| §§4.5, 6.1 | `𝒳` not smooth | no system exists on it by §0.1; §3.4 does not apply | Hypothesis missing: R01 |
| §5.1 Check | upper Borel of `GL₂`, `μ = diag(t, 1)` | `det(Ad | Lie P) = a/b`, `γ_P = a⁻¹b`, `⟨γ_P, μ⟩ = −1`; `pr(1, 0) = 1/2` | Sound |
| §5.3 | `GL₆`, `2+2+2`; `GL₁₂`, `4+4+4` | block sums `2(a₂−a₁) + 2(a₂−a₀) + 2(a₁−a₀) = 4(a₂−a₀)`, inverse `4(a₀−a₂)`; generic `F¹`: `3+2−6 < 0`, `3+4−6 = 1`, so `(2,1,0) ↦ 8`; `8(a₀−a₂)`, `(1,4,1) ↦ 0` with averages `1/4, 1, 1/4` | Sound |
| §5.4 | `ℚ_p(−1)`; `H¹(E)` | weight 2, de Rham jump `+1 = 2/2`; a line would need degree `1/2` | Sound; hypotheses R02 |
| §5.6 | `𝔾_a`, `ψ = −1`, `r = 2`; `ψ(x, y) = (−x, 2y)` | `u − u = 0`, `v = −u/2`; `u = (2,0)`: `u + ψ(u) = 0`, `ψ(v) − v = (2,0)` for `v = (−1,0)`; `U^(ψ²) = {y = 0}` | Sound |
| §5.9 | `SL₂`, `w = s`; `SL₃`, 3-cycle; general | `{−α} → {−α}`; two elements each, `ℓ = 2`; if `wβ ∈ Σ_(L_P)⁺` then `β = w⁻¹(wβ) > 0`, contradiction; first set `= −Inv(w)` | Sound; Needs line R05 |
| §5.10 | `GL₂`, weights `(1, 0)`, `c = e = 1` | `h = (1, 2, 1)`, `T(1) + T(1) = 2 > B = 1` | Hypothesis fails, as it must |
| §7.4 with §7.6 | `z ≤ h⁰`, `e = d` | `A ≥ h⁰ + d ≥ z + e`; `h⁰/2 + z + e ≤ 3h⁰/2 + d ≤ A + h⁰` | §7.4's hypotheses follow |
| §7.8 | `M = 1`; general `M`, `Q = q^(m/2+1) ≥ 4` | `‖g_1‖² = 19`, `9/19 ≤ 3/4`; `‖g_M‖² = (2M+1)(8M²+8M+3)/3`, ratio `3(2M+1)/(8M²+8M+3) ≤ 3/(4M)`; `|#Y − #ℙ^m| ≤ q^((m+1)j)`; error `≤ 2Q^(4M)·Σ k²16^(1−k) = 2.58·Q^(4M) < 0.29·b²` | Sound; Needs line R05 |
| §8.1 | `(n, d) = (2, 1)` `GL₂`, `GSp₂`, `GO₂`; `(3, 1)` `GO₆` | `4 < 6`; `4 < 6`; `4 < 4` fails; `h⁰ = (18 − 4)/2 + 1 = 8`, `16 < 20` | Sound |
| §§8.2–8.3 | `n = 2, 3` | `β = (1/4, 1/2, 1/4)`, second moment `1/2 = 3/6`; `β = (1/36, 2/9, 1/2, 2/9, 1/36)`, sum 1, second moment `2/3 = 4/6` | Sound |
| §8.4 and `eulerian_central_mass_le_half` | `n = 1, 2, 3, 4, 5` | `2 > 1`; `4 = 4`; `36 = 36`; `488 ≤ 576`; `11420 ≤ 14400`; reference tail `(3/4)·3^(−k)`, bound `(3/2)·Σ(2k−1)3^(−k) = 3/2`, and `(n+1)/6 ≥ 3/2` iff `n ≥ 8` | True; `n ≥ 2` needed |
| §8.7 | `n = 2`; plane quartics | `h ∼ d²/2·(1, 1)`, genus `(d−1)(d−2)/2`; `binomial(6, 4) − 1 = 14` against `binomial(6, 3) − 1 = 19` | Sound |
| §8.9 | `n` fixed, `d → ∞` | `dim Y/h⁰ ∼ (d^n/n!)/(β₀·d^(2n)/2) → 0`; top fraction `c/√n` has sum `≤ √((c/√n)·(n/6)) = O(n^(1/4))` | Sound |
| §9.1 and the Lean definitions | zero form; `3(x₀² + x₁² + x₂²)`, `S = {2}` | `¬ IsSmoothHypersurface 0` proved in Lean on a scratch copy; the same rational point as an integral point, predicate false | Carriers right; wording R03 |
| §9.2 | `(3, 3)`; `(5, 4)`; quadrics | degree at `p = 0` is `−1`, `h = (0, 6, 0)`; `(1 + t + t²)⁶` at `t², t⁶, t^10` is `21, 141, 21`; rank 1 or 0 | Exception exactly `(3, 3)` |
| §9.3 Lean headline | `ℓ·F` with `ℓ ∉ S`; larger `S` | `G` homogeneous, so vanishing at `F₀` and at `ℓF₀` agree; good reduction outside `S` implies it outside `S′ ⊇ S` | Equals non-density; not vacuous |
| §10.4 | `x² − 2y² = 0` | two conjugate lines, `C(ℚ) = {0}`, excluded by density | Sound |
| §10.7 | `E₁ × E₂`, `[2] × id`; general | `|T| = 4`, `d(H) = 4·d(H′)`; `(π*H′)^n = deg π·H′^n`, so `|T|` divides `d(H)` and `T ⊂ A[d(H)]` | Sound |
| §§10.6, 10.9 | `D₁` | `binomial(25, 5)/6 = 53130/6 = 8855`; `8855` divides `17710` | Equality against divisibility right |
| gap:period-map-ax-schanuel | curve with varying and constant elliptic `H¹` | `1 ≥ 0 + 1` | The ambient in the request is the right one |

### Lean acceptance

`lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content checkout:
exit 0; the only output is `declaration uses sorry` at 69:8 and 106:8. One import, `import Mathlib`.
`#check @name` for all six declarations on a scratch copy, elaborated once:
`eulerian : ℕ → ℕ → ℕ`;
`eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`;
`HypersurfaceMonomial : ℕ → ℕ → Type`;
`IsSmoothHypersurface : {k : Type u_1} → [Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`;
`HasGoodReductionOutside : {n : ℕ} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`; the headline as in
the file. No binder lost; nothing changed. `decide` proves `eulerian 0 0 = 1`, `eulerian 1 0 = 1`,
`eulerian 3 1 = 4`, `eulerian 4 2 = 11`.

One-tactic probe on both sorried theorems, thirteen attempts (`simp`, `rfl`, `infer_instance`, `simp`
with the definitions unfolded, `omega`, `positivity`, `exact Nat.zero_le _`, `aesop`, `exact` with the
witness `G = 1`): none closes. No padding.

Headlines from the Summary: the coefficient non-density theorem (§6.1), the higher-dimensional theorem
with its finiteness clause (§§7.6–7.7) and Shafarevich finiteness (§§10.6, 10.9, 10.10) are named in the
module docstring as not statable, each with the missing carrier, as is §7.8; the hypersurface
non-density (§9.3) and the Eulerian bound (§8.4) are stated. None statable is absent.

### Library declarations opened at the pins

`Mathlib/RingTheory/Filtration.lean:432` (`Ideal.iInf_pow_eq_bot_of_isLocalRing`, with
`[IsNoetherianRing R] [IsLocalRing R] (h : I ≠ ⊤)`); `Mathlib/Data/Finsupp/Weight.lean` (`Finsupp.degree`);
`Mathlib/RingTheory/Regular/RegularSequence.lean:147`;
`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154`;
`TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188`;
`TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `Morphism.lean:77`, `Strictness.lean:110, 118, 131`,
`Abelian.lean:33`; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `LineBundle/Ample.lean:71`;
`CartierDivisor/Basic.lean:127`; `CartierDivisor/Effective/Basic.lean:45`;
`IntersectionNumber/Basic.lean:111`; `LineBundle/Degree.lean:74, 130`. All exist as cited. Neither pinned
library has Eulerian numbers or a descent count of permutations (the only "Eulerian" hits are Eulerian
walks of graphs).

### Suppliers, gaps, overlaps

All 31 supplier roadmaps were opened at main or at their open heads and every cited section id was
resolved against a heading or, for three, a named paragraph: SheafConvolutionOnAbelianVarieties §8.2 is
the paragraph "8.2 Character generic in every conjugate"; ArithmeticGaloisRepresentations §1.11 contains
"Complete reducibility and closed tuples"; ClassicalAdicEtaleCohomology §8.2 contains the proper
algebraic comparison. Chebotarev Layer 10 is "Dirichlet-density Chebotarev";
AbelianSchemesAndArithmeticModuliPartII Layer B3 contains the mixed Kuga uniformization and Ax–Schanuel
sections (B3.1, B3.3). `roadmaps resolve` reports no unresolved citation and no unresolved Lean name.

The seven gap slugs agree, supplier, section and sentence, between `design/plan.json` and the README
(compared mechanically). Each names one supplier section and lists its statements with hypotheses. None
is already provided: ClassicalArithmeticCompletion §2.56 states unimodality and mentions log-concavity
only as an alternative route, and has no variance or limit law for descents; ShimuraData has no
normality statement for monodromy; AbelianSchemesAndArithmeticModuliPartII §B2.4 is for geometric origin
and no roadmap states Ax–Schanuel for period maps (the only other mention is the hypothesis of
LogicAndDefinabilityInNumberTheory §7.6); PadicHodgeTheory has no Hodge-cocharacter statement for the
Galois image and no relative comparison with the F-isocrystal. An acceptance would be conditional on
all seven.

Dependency check (the prescribed command):

```text
depcheck: 239 roadmaps, 2267 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. LogicAndDefinabilityInNumberTheory, later in the order, is named in
Downstream consumers only.

Duplication by object: a search of main and of every open roadmap pull request finds no other
declaration named `IsSmoothHypersurface`, `HypersurfaceMonomial` or `eulerian_central_mass_le_half`;
`HasGoodReductionOutside` occurs in the README of HeightsRationalPointsAndObstructions for curves, in
its own namespace; FiniteGroupInvariants has an unrelated `eulerian`. "Hodge–Deligne" and "semibalanced"
occur in no other roadmap except LogicAndDefinabilityInNumberTheory §7.6. The overlap file lists no
pull request changing this roadmap, no dropped id and no revision-only id.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh,
GaloisSectionsPadicPeriodMaps (and LogicAndDefinabilityInNumberTheory §7.6); character sheaves,
convolution monodromy, exceptional degrees and Lawrence–Sawin §§2–4 with Appendices B–C —
SheafConvolutionOnAbelianVarieties; Lie–Goursat, Faltings's lemma, residue disks, the Lagrangian period
variety — MordellLawrenceVenkatesh; Eulerian numbers — ClassicalArithmeticCompletion; the
period-codimension consequence of Ax–Schanuel — this roadmap §3.3, restated downstream with a
hypothesis; nothing shared with GaloisSectionsPadicPeriodMaps.

### Maintainer notes

1. Arrangement: confirmed independent (below); no edit since has moved the layers.
2. Worked instances without a locator: refuted at this head; the restatements carry "(LS, Example 6.7,
   p. 68)" at `README.md:1877` and "(LS, Example 8.6, pp. 75–76)" at `README.md:2205–2206` and `3156–3157`.
3. Licence remarks: carried to the last section.

### Copyright, wording and arrangement

Wording was compared at the 15 sampled locators and at seven further passages: §4.2 against LS lines
3109–3119; §5.1 against LS lines 3382–3396; §7.6 against LV lines 2885–2903; §7.8 against LV lines
3865–3869; §10.4's route against LS lines 3930–3944; the docstring of
`integralHypersurfaces_not_zariskiDense` against LV lines 2916–2918; the docstring of `eulerian` against
LV lines 2941–2943. No sentence follows a source clause by clause; the longest shared runs are names of
objects and hypotheses of under ten words ("smooth proper morphism", "index classes"). No table, figure,
list of examples or numerical data is taken over; the two restated source examples (LS Examples 6.7 and
8.6) carry their locators and are recomputed in the roadmap's own notation.

Arrangement: LS has §5 (5.1–5.10), §6 (6.1–6.2), §7, §8, §9 and Appendix A. Layer 0 takes LS 5.2;
Layer 1 takes 5.3–5.5 and adds §1.9; Layer 2 takes 5.6 and 5.8–5.10, with LV §2.3 and the roadmap's own
§2.11; Layer 3 takes 6.1 with LV §9; Layer 4 takes 6.2 and all of §7; Layers 5 and 6 split §8 with LV
§11; Layer 7 is LV §§10–12; Layer 8 puts Appendix A beside LV §10.2 and Batyrev–Cox, before the
applications; Layer 10 takes §9. Thirteen LS subsections become eight layers and six layers carry LV
material, so no run of layers maps one to one onto sections of a source. The order of Layers 0–6 is
forced by the Needs lines: §1.1 needs §§0.3–0.4, §2.1 needs §1.5, §3.1 needs §2.5, §4.4 needs §3.2,
§5.12 needs §4.2 and §6.1 needs §§5.8, 5.12.

Source independence: 22 passages compared with 2 sources (LS, LV), none shared; largest share LS, 85 of
118 locator items in the layers; contents compared with LS: independent.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3: settled as uncertified; the text was not read.
- LawrenceVenkateshMethod (a board package on another pull request's branch, listed in the packages
  index): its README is not in this checkout and the read of its head returned nothing, so ownership
  against it was not checked. By its name it overlaps the base roadmap MordellLawrenceVenkatesh.
- Beauville and Batyrev–Cox were not re-read this round; §§8.6 and 9.2 are untouched since the previous
  round read them (BC lines 1341–1347, Beauville lines 84–89 and 129–136).
- Supplier statements were resolved by heading and, for about twenty of them, by reading the cited
  paragraph; the remaining contract descriptions rest on the earlier rounds' reading.

## Source issues

- **Error** in LV at §10.2 before (10.8), printed p. 971: the source says the space of degree-d hypersurfaces in projective n-space has dimension `binomial(n+d, d−1) − 1`, of order `d^(n+1)`; it should be `binomial(n+d, d) − 1`, which is 14 for plane quartics; affects nothing.
- **Misprint** in LV at Lemma 11.4, end of the proof, printed p. 993: the source says the maps `w` and its inverse are the mutually inverse bijections of (11.17); it should be `x ↦ −w(x)` and `x ↦ −w⁻¹(x)`, as part (iii) says; affects nothing.
- **Gap** in LV at Lemma 12.1, printed pp. 995–996: the source says the bound holds with the point-count cutoff at exponent `N`; it should be at `2N`, since the kernel has frequencies up to `2N`; affects a stated result.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says a primitive hypersurface is invariant under no translation by a geometric point; it should exclude only nonzero points; affects a stated result.

The other entries of the README's "Source corrections" were recorded by earlier rounds and were not
re-read in this one.

## For the human reviewers

- **Licence.** `sources.toml` records `Serre` (a Springer monograph) as `uncertified` with `licence_class = "none"`; it is cited by section number only at `README.md:1483–1485`, and no text was read.
- **Licence.** The `LV` text was cached from `bimsa.net/doc/publication/2578.pdf` (`licence_class = "institutional"`), a host that is neither author's institution; `README.md:3211–3213` cites the journal and arXiv:1807.02721v3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ca1d3f6fd08517f640fa928e50a6d59fa8057a0c", "job": "REV-PKG-MordellLawrenceVenkateshPartII~8", "model": "fable", "worker": "chris-x88"} -->
