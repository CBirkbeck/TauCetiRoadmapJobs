<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6895591941 -->
Review (claude) of 0a001c2

Verdict: needs_changes

1. **F01** (P2) Arc-stacks of schemes and analytic spaces, and their free motives, are used but never constructed

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:386`: "For `U ⊂ Aⁿ_X` open, with `n` finite, define `ℤmot[U]` as the ball localization of the free derived abelian arc-sheaf on `U`." This is the only definition of a free motive, and `Aⁿ_X` itself is not defined anywhere in the file.

   **Claim.** The README uses, as if constructed:

   - `Aⁿ_X`, `G_m`, `ℙ¹_X`, `ℙⁿ`, `A² ∖ {0}`, `GL_n/G_m^n` as small arc-stacks (§§2.5, 3.3, 5.1, 5.4, 6.2, 8.2);
   - an analytic curve `U` as an arc-sheaf, with `U(C)` and `ℕ[U]` (§§4.2, 4.5, 4.6);
   - "every smooth `K`-analytic space without boundary", for every Banach field `K`, as a small arc-stack over `Marc(K)` (§8.5, line 912);
   - `ℤmot[X]` and `ℤmot[X_C]` for a smooth projective scheme `X` (§§9.1, 9.5, 10.3, 10.5, 11.1), and "the symmetric monoidal functor … sending a smooth `k`-scheme to its Berkovich motive" (§10.6, line 1132).

   **Witness.** No target constructs the functor from schemes or analytic spaces to arc-stacks, and `ℤmot[·]` is defined only for opens of `Aⁿ_X`. `ℙ¹_k` is not such an open, yet lines 695 and 1138 compute `ℤmot[ℙ¹]`. For archimedean `K`, the cited supplier section does not apply: TropicalAndBerkovichArithmetic `README.md:616` says "K is complete nonarchimedean". `roadmaps grep` for "arc-site of Banach", "Banach arc" and "ball-invariant" finds no other owner on main or at the open heads, so this roadmap owns the construction.

   **Exact repair.** Add one target at the end of Layer 2, after §2.6, so that no existing number moves: `### 2.7 Arc-stacks of affine spaces, schemes and analytic spaces`. It should contain the following.

   1. *Affine space and the torus.* Define `Aⁿ_X = X × colim_{r>0} Marc(ℤ⟨T₁, …, T_n⟩_r)`, the increasing union of closed polydiscs, where `ℤ⟨T⟩_r` is the free Banach ring on `n` elements of norm at most `r`. Define `G_m ⊂ A¹` as the open substack `{T ≠ 0}`, the union of the loci `{|T| ≤ r, |T⁻¹| ≤ r}`. Define `ℙⁿ_X` as the gluing of `n + 1` copies of `Aⁿ_X` along the standard charts.
   2. *Schemes.* For a Banach field `K` (nonarchimedean, archimedean or trivially normed) and a locally finite-type `K`-scheme `Y`, define `Y^arc` over `Marc(K)` by gluing the closed substacks of `Aⁿ_K` cut out by the equations of affine charts.
   3. *Analytic spaces.* For nonarchimedean `K` and a `K`-analytic space `U` of TropicalAndBerkovichArithmetic §0.21, define `U^arc` as the colimit of `Marc(A_i)` over its net of affinoid domains. For any Banach field `K`, define a *smooth `K`-analytic arc-stack without boundary* as a small arc-stack over `Marc(K)` that is, locally for open immersions, finitary (§1.4) with finite geometric fibres over some `Aⁿ_K`; this is the notion §8.5 uses, and it covers `K = ℝ, ℂ`.
   4. *Free motives.* For a small arc-stack `f : Y → X`, define `ℤmot[Y] ∈ Deff_mot(X)` as the object corepresenting `M ↦ Γ(Y, f^* M)`, when it exists. It exists for opens of `Aⁿ_X` (§2.5), for finitary `Y` (§1.6 followed by `L_B`), for composites as in §2.6 (where it is `f_♯ ℤ`), and for colimits of such, `ℤmot` taking colimits of arc-stacks over `X` to colimits.

   API, in prose:

   - On a strict `B` over `X`, `Aⁿ_X(B) = X(B) × Bⁿ` and `G_m(B) = B^×`.
   - On a strict `B` over `K`, `Y^arc(B)` is the set of `K`-scheme maps `Spec B → Y`.
   - `Y ↦ Y^arc` preserves fibre products and open immersions, and commutes with extension of the Banach field.
   - For nonarchimedean `K`, `(Y^an)^arc ≃ Y^arc`, with `Y^an` the analytification of TropicalAndBerkovichArithmetic §0.22; a separated analytic space gives an arc-sheaf of sets with closed diagonal.
   - For `Y` smooth over `K`, `Y^arc` is a smooth `K`-analytic arc-stack without boundary; for `Y` proper, `Y^arc → Marc(K)` is proper of finite cohomological dimension.

   Checks:

   - `(Spec K)^arc = Marc(K)` and `(A¹_K)^arc = A¹_{Marc(K)}`. For trivially normed `k` this contains the closed discs of every radius, although `k` has no element of norm strictly between `0` and `1`.
   - `ℤmot[ℙ¹_k] = ℤ ⊕ ℤ(1)[2]`, computed from the two charts as `cofib(ℤmot[G_m] → ℤ ⊕ ℤ)`. A definition restricted to opens of affine space does not cover `ℙ¹`.
   - The closed unit disc `Marc(C⟨T⟩₁)` is an analytic space with boundary. Its inclusion into `A¹_C` is a monomorphism that is not open, hence not finitary (§1.4), and §8.5 shows it is not cohomologically smooth; a definition that admits it is wrong.
   - The doubled-origin line of §4.2 has an arc-stack whose diagonal is not closed, so the separation hypothesis of §4.2 is visible on the arc side.

   Then make these consequential edits:

   - In §2.5, add a sentence that `Aⁿ_X` and `ℤmot[Y]` for general `Y` are those of §2.7.
   - Add §2.7 to the *Needs* lines of §§4.2, 4.5, 5.4, 8.2, 8.5, 9.1, 10.3 and 10.6.
   - In §10.6, name the functor: `X ↦ ℤmot[X^arc]`.
   - In §8.5, replace "every smooth `K`-analytic space without boundary" by "every smooth `K`-analytic arc-stack without boundary (§2.7)".
   - Add "arc-stacks of schemes and analytic spaces" to the Layer 2 entry of Scope and ownership.

   **Repair tested.** Witness `ℙ¹_k`, `k = 𝔽̄_p` with the trivial norm. `ℙ¹^arc` is the pushout of two copies of `A¹_k` along `G_m`, and sections over a pushout are the pullback of sections. Hence `ℤmot[ℙ¹] = cofib(ℤ ⊕ ℤ(1)[1] → ℤ ⊕ ℤ) = ℤ ⊕ ℤ(1)[2]`, which agrees with lines 695 and 1138. On strict `B`, a scheme map `Spec B → ℙ¹` lands chartwise after a clopen decomposition of `M(B)`: a Zariski open containing every closed point of a clopen piece contains the piece, and every maximal ideal of a Banach ring is the kernel of a point. For `K = ℂ` the definition of item 3 gives complex manifolds, which the supplier section does not.

2. **F02** (P3) The claim that Tau Ceti has no K-theoretic carrier is false at the pin

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/README.md:44`: "Tau Ceti at the pin contributes no Banach-ring site, motivic or K-theoretic carrier."

   **Claim.** The pinned Tau Ceti has no K-theoretic carrier.

   **Witness.** At the pin, `TauCeti.ExactK0` is in `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean` (docstring, line 18). `StableGeneralLinearGroup` and its `elementarySubgroup` are in `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:155` and `:225`. GeneralAlgebraicKTheory's contract consumes `TauCeti.ExactK0`.

   **Exact repair.** Replace the sentence by: "Tau Ceti at the pin has no Banach-ring site, no motivic category and no K-theory spectrum. Its Grothendieck groups (`TauCeti.ExactK0`, TauCeti/CategoryTheory/GrothendieckGroup) and stable general linear group (`StableGeneralLinearGroup`, TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean) enter only through GeneralAlgebraicKTheory." The module docstring of `Suggested.lean` speaks of "the algebraic K-theory spectrum of a ring" and is correct as it stands.

   **Repair tested.** A search of the pinned Mathlib and Tau Ceti for `KTheory`, `AlgebraicK` and `Berkovich` finds no K-theory spectrum and no Berkovich spectrum of a Banach ring, so the replacement sentence holds; the two named carriers exist at the lines given.

3. **F03** (P3) The manifest does not record the published version the References cite

   **Location.** `packages/MotivesAndAlgebraicCyclesPartII/sources.toml:5–20` (entry `Scholze`: `year = 2024`, `arxiv = "2412.03382v3"`, no `doi`, no `venue`), against `README.md:1396`: "J. Amer. Math. Soc. 39 (2026), 697–764".

   **Claim.** The manifest entry records the work as the README cites it.

   **Witness.** The README cites the journal version, and the journal's article page confirms it: volume 39, pages 697–764, DOI `10.1090/jams/1068`. A preprint and its published version are one manifest entry carrying both `arxiv` and `doi`; the entries `CD` and `Bachmann` do this, `Scholze` does not.

   **Exact repair.** In the existing `Scholze` entry, keeping its key, hash and provenance, add `doi = "10.1090/jams/1068"` and `venue = "J. Amer. Math. Soc. 39 (2026), 697-764"`, and set `version_note = "arXiv v3 of 22 January 2026, the version read; locators use its internal pagination, not the journal's"`.

   **Repair tested.** The cached text carries the stamp "arXiv:2412.03382v3 … 22 Jan 2026" (Scholze line 40), so the note is accurate. No README locator changes, because all of them are to arXiv v3.

Three findings: one P2 and two P3; one blocking. Both findings of round 5 are repaired, and the repaired passages survive the adversarial pass. The new findings do not concern the scope of the roadmap. R01 is a missing interface that the headline statements rest on; R02 and R03 are one-sentence corrections. No file of the package was changed by this review.

## Verified sound

### Previous findings

| Round-5 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2): §4.2 lacked separation | README:535: "for a separated smooth connected analytic curve `U` … (separated: its diagonal is a closed immersion, so its underlying space is Hausdorff)"; README:581 adds the same hypothesis to §4.5; README:591 says "these curve models are separated". | Repaired. Recomputed in the table below. |
| F02 (P3): van der Put pagination | README:537 and :1397 and `sources.toml:29`: "Theorem 1.1 (p. 156, proof pp. 156–159), Corollary 1.3 (p. 159)". | Repaired. vanDerPut line 57 (theorem, printed p. 156), line 163 (end of proof, p. 159), line 165 (corollary, p. 159), line 167 (§2 begins). |

No finding of the last repair report was marked not actionable.

**Repair-pattern audit.** I looked for the repaired pattern, an analytic-space hypothesis inherited silently from TropicalAndBerkovichArithmetic, in the rest of the file. §4.4 works with opens of `A¹_C`, which are separated. §5.2 allows nonseparated étale spaces on purpose (Scholze lines 1768–1769). §8.5 is the one further place where the supplier's category does not match the statement, and it is part of R01. The new supplier citation, TropicalAndBerkovichArithmetic §2.16, resolves at its open head: it states existence of triangulations for "every separated quasi-smooth analytic curve over a complete nonarchimedean field", with type-II vertices in the strict case, which is what the contract at README:53 says. §0.22 there gives Hausdorffness for separated proper schemes.

### Principles, shape and policy

- 13 layers, 80 numbered targets, 80 *Needs* lines, 50 Checks blocks, 30 API blocks. Every layer ends with Examples and Dependencies.
- No good-prime shortcut: residue characteristics 2 and 3, archimedean points and the root-free KH variant are all in scope. No algorithm, no sorry'd data, no `set_option`.
- A search of the README for process words, pull-request numbers, machine paths, HTML anchors, LaTeX delimiters, "optional", "deferred" and `lemma` returned nothing.
- The README does not say it follows a source and no layer is named after a source's section.

### Source sample (all 15 seeded targets, read at the locator)

There was no author-flagged unverified locator other than BLR, which is settled as uncertified.

| Target | Lines read | Result |
|---|---|---|
| 0.6 | Scholze 812–814 (Def. 4.3, p. 19), 817–847 (Lemmas 4.4–4.6, pp. 19–20) | Test fields are all algebraically closed Banach fields; uniform completion is in the definition; the profinite-set equivalence needs both rings strict. Agrees. |
| 1.4 | Scholze 1037–1066 (Defs 4.21–4.22, Lemma 4.23, pp. 24–25) | Relative cartesian square over strict colimits; items (i)–(vi) match the API, including both directions of the open-immersion criterion. |
| 1.5 | Scholze 999–1013 (Defs 4.17, 4.19, Cor. 4.18, pp. 23–24) | Agrees. The README reads "all `x ∈ X`" as geometric points; the other reading would give the identity of `Marc(ℝ)` infinite dimension, contradicting Theorem 4.20. |
| 1.6 | Scholze 1067–1091 (Props 4.24–4.25, pp. 25–26) | Left adjoint with projection formula for finitary maps; excision triangle; the `|2|` decomposition. Agrees. |
| 3.4 | Scholze 1444–1448 (Def. 5.18, p. 34) | Archimedean bases allowed; shift `[−1]`; values over `ℂ` and `ℝ`. Agrees. |
| 4.3 | Scholze 1556–1561 (proof of Lemma 6.4, p. 37) | Moduli of degree-zero line bundles with trivializations at the marks, semiabelian, `[p]` surjective. Agrees. BLR not read (uncertified). |
| 5.2 | Scholze 1723–1795 (proof of Thm 7.1, pp. 41–43) | Eventually defined sequences, `Y₁` and `Y₂`, the counts `N` and `N − 1`, vanishing on the base-point summand, nonseparated étale spaces. Agrees. |
| 7.4 | Scholze 2064–2090 (Thm 8.13, pp. 49–50) | Analytic nonarchimedean rings; Postnikov-completeness hypothesis for the rational statement. Agrees. The README states the `K`-version only where §7.1 defines `E_K`; Scholze's own notation for `K(A_{<1})` (lines 1943–1960) has the same root hypothesis. |
| 8.3 | Scholze 2204–2211 (Prop. 9.7, pp. 52–53) | `|p| < 1` on `X`; symmetric monoidal, functorial; the twist is preserved (proof). Agrees. |
| 9.3 | Scholze 2315–2325 (Lemma 10.4, p. 55) | Proper quasi-pro-étale; `f_*` conservative by geometric fibres; Barr–Beck–Lurie; the colimit statement. Agrees. |
| 9.4 | Scholze 2248–2258 (Cor. 10.2, pp. 53–54) | Proper, 0-truncated, locally finite cohomological dimension; rerun of the construction. Agrees. |
| 9.7 | Scholze 2333–2350 (Cor. 10.6, pp. 55–56), 2263–2267 (Prop. 10.3) | qcqs arc-stacks as in Proposition 10.3; only full faithfulness. Agrees. |
| 10.4 | CD 2048–2055 (Thm 5.2.2, p. 44), 1896–1901 (Thm 4.5.2, p. 41); Scholze 2401–2404 | CD's formula is `Hom(ℚ_X, ℚ_X(p)[q]) = Gr^p_γ K_{2p−q}(X)_ℚ` for regular `X`; with `q = −i` it gives `π_i = K_{i+2j}^{(j)}`. Agrees. |
| 11.7 | Scholze 2549–2565 (Thm 11.9, p. 61) | `h_* O ≅ f_* ℤ` as E∞-algebras; the degree-one map is the identity of the value group. Agrees. |
| 12.3 | Scholze 2641–2652 (Prop. 12.3, p. 63) | `n` prime to `p`; overconvergent image; compatibility with pullback, tensor product and proper pushforward. Agrees. |

Also read: Scholze 1485–1572 (Theorems 6.1, 6.3, Lemma 6.4), 1649–1672 (Cor. 6.6, Thm 6.7, Prop. 6.8), 1988–2002 (Thm 8.9, Cor. 8.10), 2095–2125 (Def. 9.1, Thm 9.2), 2395–2419 (Thm 11.1), 2449–2456; vanDerPut 27–75 and 158–170.

### Adversarial table

Computed instances. "Retain" means the test requires no edit.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §4.2, existence of `W` in general | Triangulation `V` of `U`; `x, x′` in disc components at vertices `v, v′`; finite connected subgraph `Γ₀ ∋ v, v′` | Push each edge leaving `Γ₀` to an interior type-II point `e′`. At `e′` the branches are: one into `Γ₀`, one leaving along the edge, the rest open discs; genus `0`. If no edge leaves, `U` is proper and one cuts `{|S| < ρ}` out of a disc component. | The route's `W` exists; retain. |
| §4.2, the closed disc at a boundary point | `U` the open unit disc, `W = {|T| ≤ ρ}` | Complement of `W` in `ℙ¹`: `{|T| > ρ} ∪ {∞}`. Adding `ζ(0, ρ)` and the residue discs `{|T − a| < ρ}`, `|a| = ρ`, gives `{|T| ≥ ρ} ∪ {∞} = {|1/T| ≤ 1/ρ}`. `U′ = {|T| < ρ} ⊂ W ⊂ U`. | Retain. |
| §4.2, nonempty complement | `U = ℙ¹`, `U = E` proper | `W` affinoid has nonempty boundary, so at least one disc is removed: 1 disc in both examples. | Retain. |
| §4.2, negative control | Doubled-origin line, `ϖ = p` | `|pⁿ| = p^{−n} → 0` in both charts; limits `0₁ ≠ 0₂`. | Check is correct. |
| §4.2, elliptic Check | Good-reduction `E`, `W = E ∖ B₁` versus `W = {|R| ≤ σ}` | First: boundary point of genus `1`, in no disc. Second: `X̄ = ℙ¹` (genus `0 ≠ 1`), one complementary disc. | Check is correct. |
| §4.3 | `r = 1`; `ℙ¹` with `{0, ∞}`; `char C = ℓ` | Torus ranks `0` and `1`; coordinate `a/b`; `(t − x)/(t − y)` has values `x/y` at `0` and `1` at `∞`. An extension of a divisible group by a divisible group is divisible, so `[ℓ]` is onto on `C`-points. | Retain. |
| §4.6, curve models | `C′` of topological transcendence degree one | `C′` is the completed algebraic closure of `H(ξ)`, `ξ ∈ ℙ¹`. Each finite extension of `H(ξ)` is `H(η)` for a point `η` of a smooth projective curve over `ℙ¹` (Krasner), and `Marc(H(η))` is the limit of the neighbourhoods of `η`. | The refined route statement holds; retain. |
| §4.8, norm versus pointwise | `ℤ₂` with `‖x‖ = 2^{−⌊v(x)/2⌋}` | `⌊(a + b)/2⌋ ≥ ⌊a/2⌋ + ⌊b/2⌋`; `‖2‖ = 1`; `‖2ⁿ‖^{1/n} → 2^{−1/2}`; points `c^{v}` with `0 ≤ c ≤ 2^{−1/2}`. | Check is correct. |
| §0.6 | Identity of a discrete closed field; `C⟨T⟩₁`; analytic `A` to a discrete field | `S` a point; connected non-profinite spectrum; a topologically nilpotent element maps to norm `0`, so the unit ideal would be generated by zeros. | Retain. |
| §1.4 | `a = 0`; `a = 1`, `r ≤ 1`; `{0} ⊂ [0, 1]` | Whole space; empty (`|1| = 1`); injective, not open. | Retain. |
| §1.5 | Identity of `Marc(ℝ)` | Over the geometric point `ℂ`: `d = 0`. Over `ℝ` itself the group `ℤ/2` has infinite dimension. | Geometric points are the right reading; retain. |
| §3.4 | `ℂ`, `ℝ`, nonarchimedean | `cofib(ℤ → ℤ ⊕ ℤ[1])[−1] = ℤ`; reflection acts by `−1` on `H₁` of the circle; `Ḡ_m[−1]`. | Retain. |
| §3.5 | `T² + T/2 + 4` over `ℂ₂`, `r₁ = 1/4`, `r₂ = 4` | Valuations `(2, −1, 0)`, slopes `−3` and `1`, root norms `1/8` and `2`. `min(4, 1) = 1 < 2 = |a₁|` excludes it; `max = 4` admits it. | Retain the `min`. |
| §5.2 | `N` large, a class in the image of the Tate unit | `p₁ = p₂`, so `p₁^N = p₂` cuts out the `(N − 1)`-th roots of unity. `N − (N − 1) = 1`. On the base point `p₂ = 1`, so `Y₂ = Y₁` and the difference is `0`. | Retain. |
| §5.3 headline | Complex point; empty base | `− ⊗ ℤ` is the identity; `0 → 0`. | Retain. |
| §6.2 | `n = 2` | Antipodal map on `S²`: traces `1 + (−1) = 0`; invariants `ℚ[0]`. | Retain. |
| §6.3 headline | `ℙ²` | Eigenvalues `1, 2, 4`; denominators `(1−2)(1−4) = 3`, `(2−1)(2−4) = −2`, `(4−1)(4−2) = 6`. | Retain. |
| §7.4 | `ℚ_p` | `π₀` and `π₋₁` of `fib(K(ℤ_p) → K(𝔽_p))` are `0`; `π₀ E_KH = ℤ`. The fibre instead gives `ℚ_p^×/(1 + pℤ_p) = ℤ × 𝔽_p^×`. | Retain the cofibre. |
| §7.6 headline | `S = {p}` | `|ℓ| ≥ 1` for `ℓ ≠ p` at every point of `M(C)`; `p` is invertible on `Kmot(C)` when `|p| < 1`. | Retain. |
| §7.7 | `p = 2, 3` | `ℤ[1/p] ∩ ℤ_p = ℤ` in `ℚ_p`. | Retain. |
| §8.1 | `ℤ(−1)` | `M_n = ℤ(n − 1)` for `n ≥ 1`, `M₀ = Hom(ℤ(1), ℤ)`. | Retain. |
| §8.3 | `ℂ_p`; a characteristic-`p` perfectoid field | Characteristics `0 → p`; `μ_n` on both sides for `n` prime to `p`; self-tilt. | Retain. |
| §8.5 | Closed disc | `f_* ℤ = ℤ`; smoothness would force `ℤ(1)[2] = ℤ`, but `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1]`. | Retain "without boundary". |
| §9.3 | `Y = ∅`; `Y = X ⨿ X` | `Mod₀ = 0`; `Mod_{ℤ×ℤ} = Dmot(X)²`. | Retain. |
| §9.4, §9.6 headlines | Two complex points; `[0, 1]` | `D(ℤ)²`; `RΓ(j_! ℤ) = 0` with `j_! ℤ ≠ 0`. | Rigid without compact generation; retain. |
| §9.5 | Elliptic `E` over `𝔽̄_p` | `Hom(ℚ(i)[m], ℚmot[E])` is `K_{m−2i}^{(1−i)}` and `K_{2i−m}^{(i)}`; nonzero only for `m = 2i`, `i = 0, 1`. Tate prediction: `dim End = 2`. Intersection matrix `(0,1,1; 1,0,1; 1,1,0)`, determinant `2`, so `dim ≥ 3`. | Retain. |
| §9.7 | `X = Y = S`; `X = ∅` | Identity; `0 → 0`. | Retain. |
| §10.4, §10.5 headlines | `ℙ¹`, `j = 1`; `Spec k`, `j = 0` | `π_{−2} = K₀^{(1)} = ℚ`, `π₀ = K₂^{(1)} = H⁰(ℙ¹, ℚ(1)) = 0`; `π₀ = ℚ`. | Retain the shift `[−2j]`. |
| §10.2 | `𝔽̄₃`, `n = 2` and `n = 3` | `μ₂ = ℤ/2`, `k^×/k^{×2} = 0`; `Map(M(G_m), ℤ/2) = ℤ/2 ⊕ ℤ/2[−1]`; `x³ − x = t` has no polynomial solution. | Retain. |
| §10.6 headline | `ℙ¹_k` | `ℤ ⊕ ℤ(1)[2]` on both sides, once `ℤmot[ℙ¹_k]` is defined. | Statement sound; its carrier is R01. |
| §11.1 | Pro-torus over `n` prime to `p` | `colim` of multiplication by `n` on `ℤ(−1)[−1]` is `ℤ_{(p)}(−1)[−1]`; `p` is invertible, so `ℚ(−1)[−1]`. | Retain. |
| §11.3 | `R = ℚ[t^{±1}] ×_ℚ ℤ[1/p]` | `R ⊗ ℚ = ℚ[t^{±1}]`, `R ⊗ 𝔽_ℓ = 𝔽_ℓ`, `R ⊗ 𝔽_p = 0`; `Δ(t − 1) = (t−1)⊗(t−1) + (t−1)⊗1 + 1⊗(t−1)` lies in `R ⊗ R`. | Retain. |
| §11.6, §11.8 headline | `A = ℤ/2`, `p = 3`; ring generated by all `t/n` | Degree-`d` part is `ℚ t^d` for `d ≥ 1`; `A ⊗ ℚ = 0`, so the pair is `(ℤ/2, 0) ≠ 0`. | Retain integral underlying objects. |
| §11.7 | Degree-one map | Both sides `ℤ[1/p] ⊕ ℚ(−1)[−1]`; the map is the identity of the value group `ℚ`. | Retain. |
| §12.3 headline | Constant sheaf; `j_!` from the rank-one point; `n = 1` | Specialization `id`; `0 → ℤ/n`; `0 → 0`. | Retain. |
| R02 | Pinned Tau Ceti | `ExactK0` and `StableGeneralLinearGroup` exist. | Fails: R02. |

Rows of the round-5 table that carry computed values were relied on for the targets not listed here.

### Pinned libraries

Content checkout at `1a19c9f`; pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. Opened at the pin:

- `CategoryTheory.GrothendieckTopology` (Mathlib/CategoryTheory/Sites/Grothendieck.lean:72);
- `NormedField` (Mathlib/Analysis/Normed/Field/Basic.lean:155);
- `IsUltrametricDist` (Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47);
- `SSet.Quasicategory` (Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41);
- `continuousCohomology` (Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131);
- `PowerSeries.IsRestricted.subring` (Mathlib/RingTheory/PowerSeries/Restricted.lean:90);
- `Subring.unitClosedBall` (TauCeti/Analysis/Normed/Ring/Ultra.lean:84);
- `TauCeti.unitBallIdeal`, `mem_unitBallIdeal`, `norm_inverse_one_sub`, `norm_inverse_one_sub_sub_one`, `isUnit_unitClosedBall_of_norm_sub_one_lt` (TauCeti/Analysis/Normed/Ring/UnitBall.lean:90, 101, 160, 171, 185);
- `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring` (TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean:115, with `[NormedField K] [IsUltrametricDist K] [CompleteSpace K]` at line 84);
- `TauCeti.cohomologicalDimensionAt`, `strictCohomologicalDimensionAt` (…/CohomologicalDimension/Basic.lean:146, 151), `cohomologicalDimensionAt_le_of_isClosed` (…/ClosedSubgroup.lean:80), `strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one` (…/Strict.lean:181).

All exist with the hypotheses the README states. Neither library has a Berkovich spectrum of a Banach ring, a Banach arc-site, a stable ∞-category of sheaves or a K-theory spectrum.

### Headline theorems, padding and the Lean file

- `lake env lean` on `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. The file has one `import Mathlib`, one module docstring, the namespace, and no declaration.
- The Summary's nine headline families (cancellation; `Kmot` and its Adams splitting; the strict-base K-cofibre; torsion and tilting; six operations; rigidity; the étale comparison; the monodromy equivalence; the overconvergent comparison) are each named in the module docstring with the missing carrier. None is statable at the pins: each needs `Dfin`, `Deff_mot`, `Dmot` or a K-theory spectrum.
- The one-tactic padding probe and the `#check @name` binder audit have no input: there are zero declarations, so nothing was compared and nothing changed.
- No backticked name in the README is presented as a Lean declaration of this roadmap.

### Duplication, suppliers and order

- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The earlier `Perf.Spd` lead is the supplier's name in DiamondsAndVStacks §D6.1.
- Resolved by reading the cited roadmap now:
  - EnhancedDerivedSheaves on main: all 21 cited declaration names occur, and §§E0.4, E1.3, E2.1–E2.7, E3.2, E3.4, E5:abstract.1–5, E5:presentability.2–4, E5:descent, E5:animation.1 exist. `IsCompactMorphism` at line 1734 defines weakly compact, compact and strongly compact maps, as §0.1 uses.
  - TropicalAndBerkovichArithmetic at its open head: all 25 cited sections exist.
  - AnalyticStacks at its open head: §§0.4–0.6, 0.9–0.10, 1.1–1.5; its consumer paragraph assigns the operator identification to this roadmap.
  - Sections also opened in SchemeKTheoryOperations (§§2.6, 3.8, 6.4, 6.8, 6.11, Layer 5), KTheoryFiniteLocalFields (§§1.5, 1.6, 2.1, 6.5), GeneralAlgebraicKTheory (§§3.2, 8.3, 8.10, 10.10, 13.4, 13.5, 13.8c), RefinedTraceMethods (§§4.10, 4.20), MotivicEtaleKTheory (§2.2), DiamondEtaleCohomology (§§C0.19, C4.5, C6.1, C9.8) and AnabelianGeometryAndNonabelianChabauty (target "Generalized Jacobian of a reduced boundary").
- Declared gaps: the nine slugs agree between the README and `design/plan.json`, each with a named supplier. None is provided today: EnhancedDerivedSheaves on main has no Breen–Deligne resolution, no fracture square, no covering-dimension statement and no replete Postnikov theorem; SchemeKTheoryOperations has no homotopy K-theory; KTheoryFiniteLocalFields §6.5 treats local fields, not `O_C`.
- The overlap report lists no conflicting head, no dropped id and no revision-only id.
- Ownership against open pull requests was checked with `roadmaps grep` at the open heads, by object: "Berkovich moti", "ball-invariant", "Banach arc", "arc-site of Banach", `Dmot(`, "strictly totally disconnected Banach", "motivic nearby", "rigid-analytic motiv". The first matches only bibliography lines and the supplier's own sections; the others match nothing.

Dependency check output:

```text
depcheck: 245 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Overlap check: read ArcTopologyAndDescent, AnalyticStacks, DiamondEtaleCohomology, EnhancedDerivedSheaves, VStackSheavesAndLisseCategories, DiamondsAndVStacks, AdicSpacesPartIV; nothing shared. ArcTopologyAndDescent owns the scheme arc-site and this roadmap the Banach arc-site; AnalyticStacks hands the monodromy-operator identification to this roadmap and owns the comodule description.

### Copyright and arrangement

- **Wording.** 24 passages were set beside the source at the locator: the 15 sampled targets and §§4.5, 4.6, 4.7, 4.8, 4.9, 7.6, 7.7, 8.1, 8.4. The longest shared runs are lists of hypotheses that can be written one way: 8 words in §12.3 against Scholze line 2646, and 6 words in §9.7 against Scholze line 2342. No sentence or proof plan reproduces the source.
- **Arrangement.** Scholze's sections 2–12 against the layers: `Layer 0 ↔ §§2–3 and parts of §4`, `Layer 1 ↔ §4`, `Layers 2–3 ↔ §5`, `Layer 4 ↔ §6`, `Layer 5 ↔ §7 and Cor. 8.1–8.2`, `Layers 6–7 ↔ §8`, `Layer 8 ↔ §9`, `Layer 9 ↔ §10`, `Layers 10–11 ↔ §11 with CD and Bachmann`, `Layer 12 ↔ §12`. This is not one to one: there are three splits, one merge and two transfers. The order 0 < 1 < … < 6 and 8 < 9 < 10 < 11 is forced by the *Dependencies* lines. Layers 7 and 8 are parallel (7 needs 6; 8 needs 5), and Layer 12 needs only Layers 0, 4 and 9.
- **Reuse.** No table, figure or list of exercises is taken over. The nine corrections are the roadmap's own computations.

Source independence: 24 passages compared with 3 sources (Scholze, CD, vanDerPut), none shared beyond forced hypothesis lists; largest share Scholze, 94 of 111 locators; contents compared with Scholze: independent (order forced by dependencies except the free placement of Layers 7, 8 and 12).

## Not verifiable

- BLR §9.2 (Proposition 3, Example 8, Proposition 10): settled as uncertified; not read and not requested. The proof input of §4.3 was read in Scholze.
- The nine supplier gaps are contracts for future work. Their declaration, owner, hypotheses and present absence from the supplier were checked; their truth was not.
- Sections of suppliers other than those listed under "Resolved by reading" were resolved mechanically by `roadmaps resolve` and by the round-5 table, not reread line by line.

## Source issues

- **Error** in Scholze at proof of Proposition 5.19, p. 35 (Scholze line 1471): the source says the coefficient bound is the maximum of the two radii bounds; it should be their minimum, as `T² + T/2 + 4` over `ℂ₂` shows; affects the proof.
- **Error** in Scholze at Theorem 11.1, p. 57 (Scholze line 2399): the source says the rational mapping spectrum is the weight-`j` Adams piece of K-theory; it should carry the shift `[−2j]`, as CD formula (5.2.2.a) requires; affects a stated result.
- **Misprint** in Scholze at the construction before Definition 11.3, p. 58 (Scholze line 2453): the source says the induced map runs from `f_* ℤ` to `g_* ℤ`; it should run from `g_* ℤ` to `f_* ℤ`, by adjunction; affects the proof.
- **Gap** in Scholze at Definition 4.19, p. 24 (Scholze line 1011): the source says the dimension of a map is a supremum over all points of the base; it should say geometric points, or the identity of `Marc(ℝ)` has infinite dimension; affects nothing.

The remaining entries of the round-5 list were not rechecked against the text in this round and are not repeated.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0a001c25098e728334c146fb94902977d1ea66d1", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~6", "model": "fable", "worker": "chris-x55"} -->
