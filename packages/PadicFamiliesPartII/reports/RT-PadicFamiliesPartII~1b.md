<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12987#issuecomment-6856892412 -->
Red team round 1 pass b (claude) of 5ee4ae5

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.1 copies a convention slip of the source: the degree range of the comparison map contradicts the README's own definition

   **Location.** `packages/PadicFamiliesPartII/README.md:939` and `:941`. Line 939 defines "`X((ε_v)_v)` … on which `deg_v ≥ 1 − ε_v` for `v ∈ I`"; line 941 then says "For `ε_v ∈ [1 − 1/p, 1)` at `v ∈ I` and `ε_v ∈ [2 − 1/p, 2)` at `v ∈ Iᶜ` … the canonical map to `RΓ(X_{K(I,p)}(ε₁), ω^κ(−D))`".

   **Claim.** For ε in that range the degree neighbourhood maps canonically to the Hodge–Tate neighbourhood at level p, and `β_κ` is built from that map.

   **Witness.** `p = 3`, `v ∈ I`, `ε_v = 2/3`: README's `X(ε)` is `{deg_v ≥ 1/3}`. P20 line 4207 defines the neighbourhood as `deg ≥ ε`; P20 line 4237 gives containment in the Hodge–Tate neighbourhood only for `deg ≥ 1 − 1/p = 2/3`, i.e. README's `ε_v ≤ 1/3`.

   BCGP21 line 7472 defines `X((ε_v))` by `deg ∈ [1 − ε_v, 1]`, then lines 7493–7499 use ε as the lower bound of the degree (the convention of P20 §14.1). The README took the definition from the first and the range from the second. Moreover the containment `X(ε) ⊂ X_{K(I,p)}(ε₁)` gives a restriction map *from* the Hodge–Tate neighbourhood, the opposite of "the canonical map to".

   **Repair.** Replace the sentence of line 941 beginning "For `ε_v ∈ [1 − 1/p, 1)`" and the following one ("Composing with the inclusion …") by:

   > For rationals `0 < ε_v ≤ 1/p` at every v (so `deg_v ≥ 1 − 1/p` at `v ∈ I` and `deg_v ≥ 2 − 1/p` at `v ∈ Iᶜ`), `X((ε_v)_v)` is contained in the Hodge–Tate neighbourhood `X_{K(I,p)}(ε₁)`, `ε₁ = (1 − 1/(p−1))_v` (P20 Lemma 14.1.2, p. 92, at each place of I; BCGP21 §6.5.3, p. 155, where the bound is printed in the other convention, see Source issues); the product `∏_{v∈I}U_{v,2} ∏_{v∈Iᶜ}U_{v,1}` is compact on `RΓ(X((ε_v)_v), ω^κ(−D))`, and restriction `RΓ(X_{K(I,p)}(ε₁), ω^κ(−D)) → RΓ(X((ε_v)_v), ω^κ(−D))` is a quasi-isomorphism on finite-slope parts (BCGP21 Lemma 6.5.4, p. 155), so the finite-slope part of `G^†_κ` is that of any such `RΓ(X((ε_v)_v), ω^κ(−D))`. Conversely the forgetful map from `X_{K(I,p^n)}(ε)` lands in `X((ε′_v)_v)` with `ε′_v = (2/n_v)(n_v − ε_v + 1/(p−1))` (P20 Lemma 14.1.1, p. 92, for `v ∈ I`), and `ε′_v → 0` along the admissible tuples with `ε_v = n_v − 1/(p−1)`, `n_v → ∞`. Restriction along these maps followed by the inclusion of sheaves above is compatible with the transitions on both sides and defines `β_κ : G^†_κ → H^†_κ` as a map of filtered colimits.

   Add the negative control to the Checks of §6.1: "At `p = 3`, `ε_v = 2/3` the neighbourhood `{deg_v ≥ 1/3}` is not covered by P20 Lemma 14.1.2, which needs `deg_v ≥ 2/3`; `ε_v = 1/3` is." Tested on the witness: `ε_v = 2/3 > 1/p` is now excluded, `ε_v = 1/3` gives `deg_v ≥ 2/3`, as P20 line 4237 requires. Add the source issue of the last section to the README's own list.

2. **F02** (P2) §4.7 states derived control for the wrong coefficient; §§6.6–6.7 consume it for `ω^κ`

   **Location.** `packages/PadicFamiliesPartII/README.md:745`: "its derived `δ_κ`-fibre is `e(U^I)RΓ` of the formal mixed-level variety with `Ω^κ(−D)`".

   **Claim.** §4.7 is the control theorem used downstream.

   **Witness.** README line 1026 uses "`M_I ⊗^L_{Λ_I,κ} ℂ_p` (§4.7), the last being `e(U^I)RΓ(X^mult, ω^κ(−D))`". BCGP21 line 5150 has `ω^κ(−D)`. By README line 624, for `k_v − l_v = 2` `Sym²ω_v` has rank 3, the highest-weight quotient rank 1.

   With `Ω^κ` the statement is base change of the universal sheaf (§4.5, second basic property) and does not give what §6.6(1)–(3) and §6.7 use; the proof route of §4.7 ("divisible by p on the highest-weight kernel") already aims at `ω^κ`.

   **Repair.** In line 745 replace "its derived `δ_κ`-fibre is `e(U^I)RΓ` of the formal mixed-level variety with `Ω^κ(−D)`" by:

   > the highest-weight projection `ω^κ → Ω^κ` of §4.2 induces a quasi-isomorphism from `e(U^I)RΓ(𝔛_I, ω^κ(−D))`, the ordinary cohomology of the formal mixed-level variety with the classical coefficient, to the derived fibre `M_I ⊗^L_{Λ_I,κ} ℤ_p` (BCGP21 Theorem 4.6.1(3), p. 105); the fibre with the specialized sheaf `Ω^κ(−D)` is the base change of §4.5 and is not the statement

   and add the Check "For `k_v − l_v = 2` at one `v ∈ I` the kernel of `ω^κ → Ω^κ` has rank 2 at v; control holds because `U^I` is ordinary-nilpotent on its cohomology, not because the sheaves agree." Tested on the witness: rank 3 against rank 1 is now the content of the theorem.

3. **F03** (P2) PadicLocalLanglandsForGL2Qp §0.1 is cited for general Fréchet–Stein algebras, which it does not state

   **Location.** `packages/PadicFamiliesPartII/README.md:11` ("Fréchet–Stein algebras and coadmissible modules in general are PadicLocalLanglandsForGL2Qp §0.1"), `:13`, and `:254` ("§0.1: Fréchet–Stein algebras (an inverse limit of noetherian Banach algebras with flat transition maps) and their coadmissible modules …").

   **Claim.** The supplier section defines the general notion.

   **Witness.** PadicLocalLanglandsForGL2Qp §0.1 at its open head: "For compact `H` and discretely valued `L`, prove that `D(H,L)` is Fréchet–Stein … Define coadmissibility of M by compatible finite modules over these stages". LocallyAnalyticDistributionsPartII §2.5 cites it "(gap:frechet-stein-general)".

   **Repair.** Line 11: replace the clause by "the Fréchet–Stein property of the distribution algebras `D(H, L)` of compact locally analytic groups, here the `D(G_r)`, and their coadmissible modules are PadicLocalLanglandsForGL2Qp §0.1; coadmissibility over the sequence `U(𝔤)_r` is LocallyAnalyticDistributionsPartII §2.5, which carries the general notion as its own supplier contract". Line 13: "Fréchet–Stein distribution algebras `D(H, L)` and their coadmissible modules (PadicLocalLanglandsForGL2Qp §0.1)". Line 254: "§0.1: for compact H, that `D(H, L)` is Fréchet–Stein with noetherian Banach stages and flat transitions, and its coadmissible modules with the abelian and exact finite-stage API; used for the `D(G_r)` of §7.1. That `𝒰(𝔤)` is Fréchet–Stein for the `U(𝔤)_r` and the description of its coadmissible modules are LocallyAnalyticDistributionsPartII §2.5, not this section." The *Needs* line of §7.1 stays.

4. **F04** (P2) Layers 4–6 follow the table of contents of BCGP21 §§4–6

   **Location.** `packages/PadicFamiliesPartII/README.md:584`, `:765`, `:927` (the three layer headings) and `:9` ("the Hilbert higher Coleman families of Boxer–Calegari–Gee–Pilloni 2021 §§4–6 (Layers 4–6)").

   **Witness.** BCGP21 has the largest share of source citations (96 of 243). Pairs: `Layer 4 ↔ §4`, `Layer 5 ↔ §5`, `Layer 6 ↔ §6`; inside, `6.2 ↔ 6.2`, `6.3 ↔ 6.3`, `6.4 ↔ 6.4`, `6.5 ↔ 6.5`, `6.6–6.7 ↔ 6.6`; `5.1 ↔ 5.3–5.4`, `5.2–5.3 ↔ 5.5–5.6`, `5.4 ↔ 5.7`, `5.5–5.9 ↔ 5.8` (BCGP21 lines 56–80).

   Forced by dependency lines: Layer 5 and Layer 6 after §§4.1–4.3 (`*Needs:*` of §5.1, §5.2, §6.1); §6.7 after §4.7. Not forced: Layer 6 does not need Layer 5; §4.4, §4.4a, §4.6 are fixed-weight special-fibre statements that §4.5 does not need; §6.5 needs §§1.3–1.4, not §6.2.

   **Repair.** Reorganise by what the three end theorems (§4.7, §5.8, §6.7) need, across the Siegel and Hilbert cases:

   1. Merge §3.1–§3.3 with §4.4, §4.4a and §4.6 into one layer "Special-fibre ordinary amplitude and the spherical-to-Klingen comparison" (§4.4 already says that `F = ℚ`, `I = {p}` is §3.3). It then cites P20 Proposition 8.2.1 (p. 53) and Proposition 14.9.1 (p. 102) beside BCGP21.
   2. Keep §4.1, §4.2, §4.3, §4.5, §4.7 with §3.4–§3.5 as "Partial-ordinary Hida complexes and derived control", citing P20 Theorem 11.3.1 (p. 71) for the one-variable case.
   3. Split Layer 6: §6.1–§6.4 "Analytic families and the BGG comparison" (AIP15 Propositions 7.2.3 and 7.3.1, pp. 34–35); §6.5 joins the continuation layer after Layer 2 (it reuses §1.3–§1.4; P20 Theorem 14.7.1, p. 99); §6.6–§6.7 form "Ordinary comparison of the three complexes" (P20 Theorem 14.8.1 and Lemma 14.8.2, pp. 100–101).
   4. Layer 5 keeps its content but is placed after the comparison layer or stated as independent of it, and its sections are regrouped as in R05.

   Give the old → new numbering in the README's existing mapping table, and delete from line 9 the phrase "of Boxer–Calegari–Gee–Pilloni 2021 §§4–6".

5. **F05** (P2) the proof plan of §5.8 and the statement of §5.9 follow BCGP21's text clause by clause

   **Location.** `packages/PadicFamiliesPartII/README.md:897` ("the kernel is a colimit of finite-dimensional spaces stable under the commuting operators; a nonzero simultaneous eigenvector `(f, g)` with eigenvalues αβ and β gives `f = −βg`, …") and `:909`.

   **Witness.** BCGP21 lines 6535–6543 (proof of Theorem 5.8.6): the same five clauses in the same order; runs shared: "stable under the commuting operators" (5 words), "nonzero simultaneous eigenvector (f, g)" (4). BCGP21 lines 6547–6560 (Remark 5.8.7): README line 909 keeps its sequence of seven clauses.

   **Repair.** Replace the proof route of §5.8 by:

   > A proof route: by §5.5 and §5.6, `Δ ∘ C = U_Iw ∘ Δ`, so `ker Δ` is stable under C and under `U_{w,2}`, which commute and act locally finitely and invertibly on the `U_{w,2}`-ordinary source (§5.6 gives the inverse of C). If `ker Δ ≠ 0`, it contains after extension of scalars a common eigenvector `v = (f, g)`, `Cv = ξv`, `U_{w,2}v = uv`, `ξ, u ≠ 0`. The second coordinate of `Cv = ξv` is `g = −ξ⁻¹f`, so `f ≠ 0`; the first is `U_Kli f = (ξ + ξ⁻¹u)f` (§5.6, last basic property). From `Δ(v) = 0`, `Zf = ξf` on the w-ordinary open, hence `U_Iw f = (U_Kli − Z)f = ξ⁻¹uf` there. So f satisfies the hypotheses of §5.7 with `(α, β) = (ξ⁻¹u, ξ)` and vanishes, a contradiction.

   Tested on `T = 5`, `U = 6`, `ξ = 3`: `α = 2`, `β = 3`, `α + β = 5`, `αβ = 6`.

   Restate §5.9 from the algebra of §5.6 rather than in the order of the remark:

   > Let α ≠ β in `𝔽̄_p^×` and let M be a finite-dimensional subspace of `e(U_{w,2})H⁰(X_{G₁,1}^I, ω²(−D)) ⊗ 𝔽̄_p`, stable under `U_Kli` and `U_{w,2}`, with generalized eigenvalues `α + β` and `αβ`. Prove: (a) the quadratic `X² − U_Kli X + U_{w,2}` splits over the commutative algebra `E ⊂ End(M)` generated by the two operators, with roots `α̃, β̃ ∈ E` reducing to α, β (Hensel, `α − β` being a unit of the local ring E), so `(C − α̃)(C − β̃) = 0` on `M ⊕ M` by §5.6; (b) `M ⊕ M` is the direct sum of the graphs `{(f, −ξ̃⁻¹f)}`, `ξ ∈ {α, β}`, which are the kernels of `C − ξ̃`; (c) on the graph of ξ the doubling map is `f ↦ (1 − ξ̃′U_Iw⁻¹)f`, ξ′ the other root, injective by §5.8 with image killed by `U_Iw − ξ̃` (BCGP21 Remark 5.8.7, p. 135).

6. **F06** (P3) §2.8 needs the later §2.9

   **Location.** `packages/PadicFamiliesPartII/README.md:462`: "*Needs:* §2.7; §2.9; ShimuraCompactifications §7.19, …".

   **Witness.** §2.9 (line 470) is stated after §2.8 and begins "Prove the conclusion of §2.8 when …": each refers to the other.

   **Repair.** Move the dimension-one case before the theorem: renumber the present §2.9 as §2.8 "Continuation over the cusps in dimension one" with its own conclusion stated in full ("f is the analytification of a section of `ω^κ` on `X_Iw × Spec K`"), and the present §2.8 as §2.9 with `*Needs:* §2.7; §2.8; …`; update the summary (line 3), `Suggested.lean` line 11 ("README §2.9, with the dimension-one case §2.8") and the three Checks that cite the numbers. The same pattern, milder, at line 941: §6.1 takes its sheaf inclusion from "the relative BGG resolution of §6.4"; cite it there as HigherHidaAndColemanTheory §6.6 and BCGP21 Proposition 6.4.2 only.

7. **F07** (P3) two locators

   **Location and witness.**

   - `README.md:861`: "BCGP21 the matrix before Theorem 5.8.6, p. 133". The matrix is at BCGP21 lines 6443–6446, before Lemma 5.8.2 on p. 133; Theorem 5.8.6 is on p. 135 (line 6531).
   - `README.md:496`: the divisibility of `T₂′` by p for `r ≥ 1` is cited to "P20 §7.1 and Lemma 7.1.1, pp. 38–40"; it is Lemma 7.1.2 (P20 line 1785, p. 39). Lemma 7.1.1 (line 1721) is the statement for `T₁′`.

   **Repair.** Line 861: "(BCGP21, the matrix before Lemma 5.8.2, p. 133; its invertibility is Lemma 5.8.3(2), p. 133)". Line 496: "(P20 §7.1, Lemmas 7.1.1 and 7.1.2, pp. 38–40; …)"; add Lemma 7.1.2 to the P20 locator of `sources.toml`.

8. **F08** (P3) `N` is used and never defined in Layer 3

   **Location.** `packages/PadicFamiliesPartII/README.md:546` ("For `ℓ ∤ Np`") and `:564` ("unramified outside `Np`", "the prime-to-`Np` Hecke algebra").

   **Witness.** The standing hypotheses (line 492) fix only "neat prime-to-p level `K^p`"; P20 lines 4868–4869 define N as the product of the primes ℓ with `K_ℓ ≠ GSp₄(ℤ_ℓ)`.

   **Repair.** Add to line 492: "N is the product of the primes `ℓ ≠ p` at which `K^p` is not hyperspecial."

Five P2 findings (R01–R05) and three P3 findings (R06–R08). No P1. No finding re-raises a settled one: the repair reports mark nothing `not actionable in this package`.

Dependency check (run on the package README, unchanged by this pass):

    depcheck: 223 roadmaps, 1997 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Verified sound

Counts: 0 declarations in `Suggested.lean` (40 lines read); 65 numbered README sections read (all of Layers 1–9, 1511 lines); about 170 statement locators found at the stated statement number and page in the cached texts (BCGP21 66, BCGP25 75, P20 19, BPS 6, AIP15 3), of which about 45 were read for content; 240 Check bullets read, about 60 recomputed (those with numerical or algebraic content, the rows of the table below; the others are qualitative and were read for consistency only); 123 sibling section citations resolved to a heading at the supplier's current head, 31 of them read for content; 9 pinned declarations opened at the pins.

- **Suggested.lean.** Single `import Mathlib`, one module docstring in the required form, an empty namespace, no `set_option`, no declaration. Every headline theorem of the README summary (§2.8, §3.5, §4.7, §5.8, §6.7, §7.8, §8.6, §9.2–§9.7) is named in the docstring with its missing carriers; none is statable at the pins (no Shimura variety, coherent cohomology of a scheme with supports, or completed cohomology carrier exists there). The §5.6 identities are algebra on free endomorphisms and are rightly kept out. No `#check` comparison was needed: there is no declaration.
- **Pins.** `Module.End` (End.lean:33), `LinearMap.prod` (Prod.lean:95), `LinearMap.coprod` (Prod.lean:199), `Module.End.genEigenspace` (Eigenspace/Basic.lean:72), `Polynomial.aeval` (AlgebraMap.lean:259), `Module.Projective` (Projective.lean:71), `DerivedCategory` (DerivedCategory/Basic.lean:87), `LinearMap.eventually_isCompl_ker_pow_range_pow` (Artinian/Module.lean:307, with `[IsNoetherian R M]`) and `TauCeti.VermaModule` (Verma.lean:195, `U ⧸ vermaIdeal b lam`) are at the stated lines.
- **Suppliers.** Every cited section exists at the supplier's head (open pull requests, main, or the board package for HigherHidaAndColemanTheory, LocallyAnalyticDistributionsPartII and LocallyAnalyticRepresentationsOfLocalGroups, which the `citations.md` leads list only because they are board packages). All suppliers are earlier in the merge order. The 15 gap slugs of the README equal those of `design/plan.json`.
- **Policy.** The pull request changes only the package folder; no pull-request number, process word or `lemma` keyword in the README; every target has a locator; every section has at least three Checks.

Adversarial pass, values computed (statement; instance; values; result):

| Statement | Instance | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 degree range | supersingular curve over `W(F̄_p)` | torsion points of valuation `1/(p²−1)`, Oort–Tate `v(a) = 1/(p+1)` | holds, matches HodgeTateAndCanonicalSubgroups §0.6 |
| §1.2 `n_i` | `(d,a) = (1,1)`, `(1,2)` type C; `d=a=b=1` type A | 1, 3, 1 | holds |
| §1.3 strictness | modular curve, degree `1/(p+1)` | image has degree `p/(p+1)` | strict, holds |
| §1.4 | `η = ν`; `n = 0`, `ν = 1/2`, `η = 1/4` | `N = 0`; `N > (1/4)/ε` | holds |
| §2.1 region | `(n,c,s) = (3,4,0)`, `(3,3,0)`, `(3,4,1/2)` | `ε < 1/4`; none; `ε < 1/8` | holds |
| §2.4 path identity | `N = 2` | `U∘T₀ = {GG, GB}`, `T₁ = {BG}`, `R₂ = {BB}` | holds |
| §2.6 path sums | bad part 0; coefficient of `T_j` | `α^{−N}α^{N−1−j} = α^{−j−1}` | holds |
| §2.8 | Siegel, `κ = (6,6)`, `(6,3)` | slopes `< 3`; none | holds, BPS line 1117 |
| §3.1 generic formula | degrees | `(p+1)(1+p+p²+p³) = (p+p²+p³+p⁴) + (1+p+p²+p³)`; 30 at `p = 2` | holds, P20 line 1689 |
| §3.1 divisibility | `k + r ≥ 2` | P20 line 1721: `k + 2r ≥ 2 + r` | holds |
| §3.2, §3.3 thresholds | `p = 2, 3` | `p² + p = 6, 12`; `k > p+1` | holds, P20 lines 2263, 2402, 2427 |
| §3.4 spin polynomial | `(q,T₀,T₁,T₂) = (1,1,4,4)` | `1 − 4X + 6X² − 4X³ + X⁴` | holds |
| §3.5 components | `p = 5`; `p = 2` | 4; 1 | holds |
| §4.4a polygons | `p = 3`, `k_v = 4`, `(α,β) = (1/3, 3)` | valuations `(−1,1,2,4)`, sum 6 = `2(k_v−1)`; Hodge `(0,0,3,3)` | holds |
| §4.6 congruence | `n = 0`, `p = 3`, one place | `4f − 3f = f ∉ 3A_κ` | `n ≥ 1` needed, as stated |
| §4.6 injectivity | kernel K | `f = pg`, `eg = g`, `e(U)ιg = 0` by flatness, `K = pK` | holds for `r > |Jᶜ|` |
| §4.6 dévissage | `C ≥ p + 2` | `k′_w ≥ 2 + C + p − 1 ≥ 2p + 3` | holds |
| §4.7 fibre | `k_v − l_v = 2` | rank 3 against rank 1 | **R02** |
| §5.1 | `l = 2, 3, 1` | `U_Iw + Z`; `U_Iw + pZ`; `pU_Iw + Z` | holds |
| §5.3 types | exponent of A | source `K_D ⊗ ω⁻¹ ⊗ A^{1−p} = L`, target `L ⊗ A^{p−1}` | holds |
| §5.4 types | `p = 3` | `1 − p² = −8`; `p(p²−1) = 24`; `1 − p³ = −26` | holds |
| §5.6 identity | general T, U, no commutation | `C² − diag(T)C + diag(U) = (0, 0)`; `CD = DC = 1` | holds |
| §5.6 | `T = 5`, `U = 6` | `C(2,3) = (28, −2)`; roots 2, 3 | holds |
| §5.8 equivariance | — | `Δ(C(f,g)) = U_Iw f + U_Iw Zg` | holds |
| §5.9 | root α | `Δ ι_α f = (1 − β̃U_Iw⁻¹)f`, killed by `U_Iw − α̃` | holds |
| §6.1 analyticity | `p = 3`, χ of order 3 | trivial on `1 + 9ℤ₃`, `χ(4) ≠ 1`; analytic iff `u > 1` | holds |
| §6.1 comparison map | `p = 3`, `ε_v = 2/3` | `deg ≥ 1/3` against required `deg ≥ 2/3` | **R01** |
| §6.4 direction | `θ = (d/dz)^m`, `U : z ↦ pz` | `θ(f(pz)) = p^m(θf)(pz)`; AIP15 line 1520 | README's direction holds |
| §6.4 thresholds | gap 3, gap 2 | `−3 + 4 = 1 > 0`; `−3 + 3 = 0` | holds |
| §6.5 polynomial | `P = X² + 2X + 1`, `U = −1` | `Q = −X − 2`, `UQ(U) = 1` | holds |
| §6.5 thresholds | `(2,2)`, `(5,2)` | 1, −2, 1; 4, 1 | holds, BCGP21 line 7531 |
| §6.6 inequalities | `(1,2), (1,1), (1,1)` | `−1 < 0 = 0` | holds |
| §6.7 Euler identity | — | `χ_s − χ_t = −a − b` | holds |
| §7.8 Sen values | `λ = (1,1;2)`, `(1,1;−2)` | `−2,−2,−3,−3`; `0,0,−1,−1`; sum `−6 − 2w` | holds, BCGP25 line 4719 |
| §8.1 slopes | lengths 0, 1 | `−(2,2;w)`, `(0,−2;−w)` against `−(1,1;w)` | holds, BCGP25 line 4744 |
| §8.3 weights | `η = (0,−1;1)` | `⟨η,β^∨⟩ = 0`, `⟨λ,β^∨⟩ = −1`, `λ − η = (1,2;w−1)`, parity for w even | holds |
| §8.5 torsion | `E[T]/(T−a)²` | `0 → S → S → E`, last map 0 | holds |
| §9.3 weights | `ν = (0,−2)` | `(5,3), (5,1), (2,−2), (0,−2)` | holds |
| §9.5 duality | `κ = (5,3)`, `(5,1)` | `(0,−2)`, `(2,−2)`; lengths sum to 3 | holds |
| §9.7 choice of r | `p = 2`, `p = 3` | `r = 7`: order 3; `r = 7` fails, `r = 11`: order 5 | holds, BCGP25 line 7654 |

## Not verifiable

- The three board-package suppliers (HigherHidaAndColemanTheory, LocallyAnalyticDistributionsPartII, LocallyAnalyticRepresentationsOfLocalGroups) were read in this board checkout, which may lag the heads of their own pull requests.
- Ownership against open pull requests was checked only on the 190 sibling checkouts and the tool index; the overlap list names GSp4NonregularModularityLifting as the closest roadmap and its text was not read line by line.
- BPS Propositions 3.1.1–3.2.1, 4.3.7–4.5.8 and 5.2.1–5.2.4 were checked for location only, not for the content of their proofs; likewise BCGP21 Lemmas 6.5.12–6.5.28 and BCGP25 §3.6 (the proof of Proposition 3.6.15, on which §8.3 says the route is not complete).
- The README's corrections to P20 Proposition 15.2.4.1, P20 Corollary 14.6.2 and BCGP21 Proposition 4.6.19 (its own Source issues) were not recomputed.
- BP26 was not opened: the README cites it only through HigherHidaAndColemanTheory.
- No Lean was elaborated: the brief gives no Lean command, and the file has no declaration.

Source independence: 12 passages compared with 5 sources, 2 shared (R05: BCGP21 lines 6535–6543 and 6547–6560); largest share BCGP21, 96 of 243 source citations; contents compared with BCGP21: Layers 4–6 map onto its §§4–6 (R04), the other layers independent.

## Source issues

- **Error** in BCGP21 at §6.5.3 and Lemma 6.5.4, p. 155: the source says the neighbourhoods defined in §6.5.2 by degree at least `1 − ε` are compared with the Hodge–Tate ones for ε at least `1 − 1/p`; it should be degree at least `1 − 1/p`, that is ε at most `1/p` in the convention of §6.5.2; affects a stated result.
- **Misprint** in BCGP21 at §6.4, proof of Corollary 6.4.3, p. 154: the source says the operator applied after the differential equals `p^{k_v−l_v+1}` times the differential applied after the operator; it should be the reverse order, as in AIP15 Proposition 7.2.3; affects the proof.
- **Gap** in BCGP21 at Proposition 6.6.2, pp. 165–166: the source says the Euler characteristics agree without localization, while its proof invokes Theorem 3.10.1(2), stated for a non-Eisenstein ideal; it should carry that localization or another argument; affects a stated result.
- **Misprint** in BCGP25 at Remark 4.10.7, p. 107: the source says the degree-zero term of the Serre-dual complex has weight `(1,1;−w)`; it should be `(2,2;−w)`, as in §4.10.8 on the same page; affects nothing.
- **Misprint** in BCGP25 at the choice of r before Lemma 7.3.8, p. 167: the source says r is not 1 modulo p and not 1 modulo 4 if p is 2; it should split by cases, the first condition being for odd p; affects nothing.

## For the human reviewers

- **Scope.** BCGP25 (arXiv:2502.20645v1), the only source of Layers 7–9, is a 2025 preprint; `sources.toml` records no journal for it. The other five sources are published.
- **Licence.** P20 and BP26 were read from the author's page (`licence_class = "author-page"` in `sources.toml`); page locators for P20 are those of that PDF, not of the journal.
- **Not tested.** Wording was not compared for §8.3 against BCGP25 §3.6 (pp. 63–67), nor for §§2.3–2.7 against BPS §4 beyond the statements listed above.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5ee4ae5d317a31d69a62bd8430dd34d673c58d8a", "job": "RT-PadicFamiliesPartII~1b", "model": "fable", "worker": "chris-x15"} -->
