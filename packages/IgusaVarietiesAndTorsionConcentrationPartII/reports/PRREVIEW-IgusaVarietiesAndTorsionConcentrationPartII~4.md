# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at 880bf70)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the new §11.9 (vanishing off the middle degree for `Sh(V, K)` over a CM field that need not contain an imaginary quadratic field) takes its Galois representations and its local–global comparison from supplier statements that are made only for `F = F⁺𝒦`, so in the generality that is the point of the section these inputs have no owner and no precise contract. Layers 8–10 and §§11.1–11.8 are unchanged in substance since the last review and were checked again without a finding. There are four small corrections and one format note, none blocking. One point is left to the human reviewers: the fourth gap exists only in the README.

The previous review (at 744b2d9) listed no finding, so there was none to check for repair.

## R01 (P2) — For a CM field without an imaginary quadratic subfield, nothing supplies the Galois representation and the comparison at `w̃` that the route of §11.9(1) uses

§11.9 opens with "it need not contain an imaginary quadratic field, and `𝒦` plays no role", and that generality is what §11.9(2) hands on to its consumer. An implementer of §11.9(1) is stuck at two steps of the route. The trace-side step (line 601) runs "the argument of §§9.2–9.6", and the concentration step (line 602) runs §11.5 to attach `ρ̄_φ`. Both need a representation `r_{Π,ℓ}` of rank `N` with prescribed Frobenius polynomials for each `θ`-stable isobaric `Π^n⃗` of the expansion (§9.4, §11.5 step 3), and its Weil–Deligne comparison at the auxiliary place (§9.6).

Here they come from AutomorphicGaloisRepresentationsPartII AG2.2 «The Caraiani–Scholze discrete normalization» and from gap:unitary-discrete-local-comparison. On main, AG2.2's target (its README, lines 1330–1336) is stated for `Π^S` in the Igusa class of [CS17] Corollary 5.5.5, with the twisting character `|det|^{(n_i−N)/2}(ϖ∘N_{F/𝒦})^{ε(N−n_i)}` and "specified imaginary quadratic `𝒦`"; AG2.7 «Unitary discrete-parameter export» says the same ("Here `F=F⁺·𝒦`"). The gap's own sentence (line 728) is "In the Case 2 setting ([CS17] §5.1) … at every place `w ∤ ℓ` of `F` above a prime split in `𝒦`". In §11.9 there is no `𝒦`, the group is `Res_{F⁺/ℚ}U(V) × T`, the character `ϖ` lives on `F` (part (a) of gap:unitary-torus-igusa-trace) and `Π` lives on `GL_N(𝔸_F)` with no `GL_1(𝔸_𝒦)` factor. The only text covering this case is the sentence added at the end of the gap, "§11.9 needs the same comparison at its place `w̃` for the base-change parameters of `Res_{F⁺/ℚ}U(V)`", which names neither the representations `Π`, nor the Galois representation compared (AG2.2's is not defined here), nor the hypotheses. The Needs line of §11.9 cites "AG2.2" as if it applied.

The smallest change: state the contract for this setting exactly, as a gap on AutomorphicGaloisRepresentationsPartII with its own slug (or as a second, complete sentence of the existing one). For a CM field `F` with `F⁺ ≠ ℚ`, `ϖ` as in part (a) of the torus gap, and each `θ`-stable isobaric `Π^n⃗` on `Res_{F/ℚ}GL_n⃗` (`n⃗ = (N)` or `(n₁, n₂)`) occurring in the spectral expansion of the Igusa class of `G̃`, with `Π = ζ̃_{n⃗,*}(Π^n⃗)` on `GL_N(𝔸_F)`: a continuous semisimple `r_{Π,ℓ}` of rank `N`, unramified outside the places above the primes below `Σ⁺`, `w₀` and `ℓ`, whose geometric Frobenius polynomial at the places above split `v` is the image of `H_v`, and with `WD(r_{Π,ℓ}|_{Gal(F̄_{w̃}/F_{w̃})})^{F-ss} ≅ ι_ℓ⁻¹ rec(Π_{w̃}|det|^{(1−N)/2})`. Then cite that contract in the two bullets and in the Needs line in place of "AG2.2". AG2.3 «Arbitrary regular conjugate-self-dual existence» and AG2.5 «Caraiani’s full away-prime compatibility» give the blocks over any CM field, so the contract may be short; at present §11.9 cites neither.

## C01 — The pull request's description does not say that the roadmap now contains §11.9, a new source and a fourth gap

The description's account of the last layer ends "to give Galois representations for torsion Hecke eigensystems, concentration of the generic part in the middle degree, Theorem 1.1, and its integral and twisted-coefficient forms", and the summary block names only Caraiani–Scholze's Theorems 1.1 and 6.3.1. The head also states [LTXZZ] Proposition D.1.3 and the criterion for cohomological genericity (§11.9), for the Shimura varieties of `Res_{F⁺/ℚ}U(V)` over any CM field with `F⁺ ≠ ℚ`, adds [LTXZZ] to the references, and adds the supplier contract gap:unitary-torus-igusa-trace on EndoscopicTransferAndUnitaryTraceComparison.

A sentence that would be right: "Layer 11 also proves, for the Shimura varieties `Sh(V, K)` of the unitary groups `U(V)` of signature `(N − 1, 1)` at one real place over any CM field with `F⁺ ≠ ℚ`, vanishing off the middle degree at an eigensystem decomposed generic at one split place, and from it cohomological genericity in the sense of the parent's §7.2 (Liu–Tian–Xiao–Zhang–Zhu, Proposition D.1.3 and Corollary D.1.4); this rests on a fourth supplier gap, Shin's Igusa trace identity for `U(V)` times an auxiliary torus."

## C02 — The fourth gap is one slug for three separate statements, and the README attaches it to two different supplier sections

A supplier who reads gap:unitary-torus-igusa-trace (line 719) finds three contracts under one name: (a) a Hecke character of `F` restricting to the quadratic character of `F/F⁺`; (b) Shin's stable trace formula for a PEL datum whose algebra `F × F` is not simple; (c) the stable–twisted identity without similitude factor for test functions that are characteristic functions at the primes below `Σ⁺`. They can be delivered and cited separately, and (a) is elementary. The Needs lines of §11.9 and of Layer 11 attach the gap to "§13.1" (lines 604, 633), while the scope paragraph (line 665) attaches it to "§§6.25 and 8.21".

Would the author split it into three contracts, or at least say in the scope paragraph and in the Needs lines the same thing: which section of the supplier each of (a)–(c) extends (§6.3, §8.21, §6.25)?

## C03 — The route of §11.9 claims the Frobenius polynomial of `ρ̄_φ` at more places than its own trace identity reaches

The concentration step (line 602) says `ρ̄_φ` has Frobenius polynomial `φ(H_v)` "at each place of `F` above a split place `v ∉ Σ⁺` of `F⁺` not above `ℓ`". The trace-side step fixes the test functions at every rational prime below `Σ⁺` to be characteristic functions of compact open subgroups, so the Hecke operators at a place `v ∉ Σ⁺` whose rational prime has another place in `Σ⁺` do not enter the comparison, and the route gives no polynomial there. Nothing stated depends on those places: (1) uses the polynomial only at `w̃`, whose prime `w₀` has no place in `Σ⁺`. The sentence is right with "above a split place `v` whose rational prime has no place in `Σ⁺` and is not `ℓ`".

## C04 — `Suggested.lean` does not name the headline of §11.9 among those it cannot state

The opening overview now presents the vanishing for `Sh(V, K)` and the criterion for cohomological genericity as results of the roadmap, and §11.9(2) carries a proposed Lean name. The module docstring of `Suggested.lean` lists the headlines that are not statable (Layer 11 for `S_K`, Layers 9–10, the auxiliary-pair condition) and does not mention §11.9. Neither statement is statable at the pins: the Shimura varieties `Sh(V, K)`, their étale cohomology and the abstract unitary Hecke algebra `𝕋^{Σ⁺}_N` are absent. One more bullet in the docstring, naming [LTXZZ] Proposition D.1.3 and the criterion of §11.9(2) and these three carriers, would complete the list.

## N01 — Two names in code font are declared nowhere

`IsCohomologicallyGeneric` (line 702, attributed to the parent's §7.2) and `IsCohomologicallyGeneric.of_decomposedGeneric` (line 590) appear in no `Suggested.lean`, in the parent's README (which defines the predicate in prose only) or in the pinned libraries. A reader who searches for them finds nothing. Say that they are proposed names, or write them in prose.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §8.2 smooth proper models | Case 1; Case 2 with `G^ad` isotropic; `d = 0` | `End_B(V) = B^op` division, proper. `(1,2)` at all `τ`, `n = 3`: isotropic, boundary nonempty. Dimension `0`: finite étale | true; CS17 lines 3236, 3281–3292 |
| §8.3 local datum at split `p` | `S_i = {τ, τ′}`, `(1,1)`, `(2,0)`, `n = 2` | Bound `diag(t², t)`: `κ = −3`. `μ_{i,τ}⁻¹`: `κ = −1`. Scalar `p`: valuation `2`; `−3 + 2 = −1`. Average pairs to `½ + ½ = 1 = d` | true; translation needed (CS17 line 4034 omits it) |
| §8.4 Hecke polynomial | `n = 1, 2`; general `i` | `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`. `n = 2`: `X² − T_1X + qT_2`, `e_2 = q·x_1x_2` | true; CS17 lines 4380–4408 |
| §8.5 dual ideal | `n = 2`, `q = 7`, `ℓ = 11`, roots `{1,2}`; exponent at `i = 1, 2` | `(T_1, T_2) = (3, 5)`; dual `(5, 9)`; `X² − 5X + 8`: `7 + 9 = 16 ≡ 5`, `63 ≡ 8`. Exponents `1`, `2` equal `i(n−1)` | true |
| §8.8(a), Lean `infinite_setOf_isCompletelySplitStrongGenericPrime` | `n = 0`; `L` ramified above `p₀`, inertia in `ker r`; `p ≡ p₀` mod `ℓ` | Empty product `1 =` charpoly. New `p` unramified in `L̃ ⊇ L_r`. `p₀ ≢ 0`, so `p ≠ ℓ`, `q_v ≡ q_{v₀}` | true; one-tactic probe fails |
| §8.8(b), Lean `infinite_setOf_isStrongGenericAt_degree_one` | `v₀` of degree `f > 1`; `F = ℚ` | Class in `Gal(L_r(ζ_ℓ)/F)` fixes `r(Frob)` and `q_v` mod `ℓ`; density `#C/[L_r(ζ_ℓ):F] > 0` on degree one | true; one-tactic probe fails |
| §8.9 dimension zero | `ℤ[T]/(T⁴−1)`, `ℓ = 5`, `𝔪 = (5, T−2)` | `i ≡ 2`: on the `−i`-line `T + 2 ↦ 2 − i ≡ 0` mod `5`, nonzero. Ordinary: `ℤ_5 ⊕ ℚ_5`; idempotent: `ℤ_5` | true; Shin09 lines 570–575, 703 |
| §9.2 Newton reduction | `GL_2`, basic class, `J_b = D^×` | Irreducible `Ind ↦ 0`; trivial `= Ind − St ↦ −1_{D^×} ≠ 0` | true; conclusion is for `π^n⃗_p` (CS17 line 3722 prints `π_p`) |
| §9.6 genericity forces `μ`-ordinary | definite `G_ℝ`; `GL_2`, `(1,1)` | One class, statement empty. Ordinary slopes `(−1, 0)`, basic `−½` with `J_b = D^×` | true, on the gap; CS17 lines 3978–4036 |
| §10.1 stable term only | `n = 2`, `n⃗ = (1,1)`, `d_v = 2`; central `γ` | `d_v ∣ m_ie_i`; `deg P_1 = 1`, `2 ∤ 1`. Central: `(X−γ)²`, `e = 1`, `m = 2` | true; CS17 lines 4065–4072, Shin12 line 981 |
| §10.4 Galois representations, Case 1 | `n = 1`; `n = 2` | `X − x`; `X² − q^{1/2}(x_1+x_2)X + q·x_1x_2`, the image of `P_v` | true, on the gap; Shin-BCU lines 13–17, 41–52 are for `B = F` |
| §11.2 Hochschild–Serre | `t̄t = −1`, `e = (1,t)`, `f = (1,−t)/2` | `H(e,e) = 1 + t̄t = 0`, `H(f,f) = (1 + t̄t)/4 = 0`, `H(e,f) = (1 − t̄t)/2 = 1` | true; only "some `j ≤ i`" (CS17 lines 4439–4441 claim more) |
| §11.4 minimal stratum | wholly definite; `κ(𝔪^∨) ≠ 𝔽_ℓ` | One class `b₀`, `H^0` of finite sets. Reduction in one degree gives free cohomology there (Nakayama) | true; CS17 line 4244 |
| §11.5 Galois representations | `q ∈ Ram(ϖ) ∖ (S ∪ {p,ℓ})` | First construction silent at `q`; second with `D = {q}`, `p ≠ q` agrees on density one | true, on the gaps; CS17 lines 4387–4408 |
| §11.6 concentration | `d = 2` example; `d = 0`; dual roots `{7,9}` | Minimal `b` ordinary gives `d_b = 2`, so all contributing `d_{b′} = 2`. `d = 0`: only `H^0`. Ratios `2`, `6` | true; CS17 lines 4409–4416, 4339 |
| §11.7 Theorem 1.1 | `F⁺` real quadratic, `p` split or inert in `F⁺` | Split: `(e,f,g) = (1,1,4)`, four primes asked, pair asks one. Inert: `(1,2,2)` | true; CS17 lines 89–95, 4422–4434 |
| §11.8 integral and twisted forms | `𝔪 ∋ ℓ`; `𝔪_2 ∌ 3`; `V = 𝔽_ℓ`, `K′ = K` | `H^i(ℤ_ℓ)_𝔪/ℓ ↪ H^i(𝔽_ℓ)_𝔪 = 0`. Ordinary localization at `𝔪_2`: `ℚ_3`. (2) is §11.6 | true; CS17 lines 101, 131 |
| §11.9(1) vanishing for `Sh(V, K)` | `N = 1`; `w₀ = ww′`, `w′ ∈ Σ⁺`; `(g₀, g) ↦ (g₀⁻¹g, g₀)`; `x = au` in `𝔸_{F⁺}^× ∩ F^×U^Σ` | Finite set, degree `0`. Level at `w₀` not hyperspecial. Similitude `ν/ν = 1`, inverse `(u,t) ↦ (t, tu)`. `a` real at `∞`, so `a ∈ F⁺`, `η(x) = η(u) = 1` | statement matches LTXZZ lines 10579–10588 with the stronger hypothesis on `w₀`; route: R01, C03 |
| §11.9(2) criterion | one witness, `Σ⁺′ = Σ⁺ ∪ {w}`; infinitely many | `H_w ∉ 𝕋^{Σ⁺′}_N[X]`: (1) silent. Finitely many places above `ℓ` and the primes below `Σ⁺′`: a witness remains | follows from (1); LTXZZ lines 10686–10700 |
| §11.9 predicate | `𝔽_11`, `‖w‖ = 7`: `{1,2}`, `{3,3}` | Ratios `2`, `6 ∉ {1, 7}`. `3·7 = 21 ≡ 10 ≠ 3`, ratio `1` fails | true; LTXZZ lines 10575–10578 |
| §11.9 Galois inputs (R01) | `F` with no imaginary quadratic subfield | AG2.2 normalization uses `ϖ∘N_{F/𝒦}`; gap sentence: places above primes split in `𝒦`. Neither is defined | not supplied |
| Gap (a), character `ϖ` of `F` | `Σ⁺ = Σ⁺_bad` | `η_{F/F⁺}` unramified outside `Σ⁺`; trivial on `𝔸_{F⁺}^× ∩ F^×∏_{w∉Σ⁺}O_{F_w}^×`, so it extends | exists; LTXZZ lines 10602–10604 |

- Source locators checked against the text at this head: 48 (CS17 34, with printed pages computed from the page markers; LTXZZ 8; Shin09 3; Shin-BCU 2; Shin12 1), among them every locator of the fifteen sampled targets.
- Supplier text read at main or at the open head: AutomorphicGaloisRepresentationsPartII AG2.2 (two targets), AG2.7 (three targets); EndoscopicTransferAndUnitaryTraceComparison §§6.3, 6.25, 8.21, 13.1; PELModuli §§M0.2, M0.6, M0.8, M2.8, M4.8, M4.9; the parent's §§0.11, 1.3, 3.17, 4.4, 4.5, 5.1, 7.2, 7.14 and its scope remark; the consumer's citation of §11.9(2).
- Automatic checks at 880bf70: every check passed. Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 83 and 98), nothing else. The 4 elaborated types agree with §§8.7–8.8; no binder lost. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `exact h`) closes neither theorem.
- Declared gaps: the three slugs of the plan agree with the README and were not raised. The fourth, gap:unitary-torus-igusa-trace, is in the README only (C02 and the last section).
- Ownership of §11.9: the parent's scope remark assigns the implication from decomposed genericity to this roadmap, and AutomorphicGaloisRepresentationsPartII «Residual genericity outside finitely many `λ`» assigns the concentration conclusion to "the Igusa/torsion consumer"; no other roadmap, on main or open, states [LTXZZ] Proposition D.1.3.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, SelmerIwasawaCohomologyPartII. Shared objects and owners: the predicate of cohomological genericity and its formal properties, the parent's §7.2 (this roadmap owns the implication from decomposed genericity, §11.9); the local strong-genericity predicate and the weak existence theorem, AG2.7 (this roadmap owns the global finite-realization predicate and its strong existence theorems); `ϖ` on `𝒦`, the stable–twisted identity and Newton reduction, EndoscopicTransferAndUnitaryTraceComparison; the standard indefinite spaces and `Sh(V, K)`, its §13.1; rank-`2n` Hecke algebra, dual ideal and Igusa duality, the parent (the rank-`n` compact forms here are named variants).

Source independence: 12 passages compared with 3 sources (CS17, LTXZZ, Shin-BCU), none shared beyond formulas and hypothesis lists the mathematics forces (longest common run with LTXZZ §D.1 is 5 words, the name of the predicate "is decomposed generic at w", LTXZZ line 10576); largest share CS17, 75 of 106 citations; contents compared with CS17: independent (Layer 8 draws on its §§5.1, 5.4, 6.2, 6.3 and introduction, Layer 9 merges §§5.2–5.5, Layer 11 splits the proof in §6.3 and adds LTXZZ §D.1; only Layer 10 ↔ §5.6, its order forced by the Needs lines 10.1 → 10.2 → 10.3 → 10.5 → 10.6).

Research link: Layers 8–11 prove Caraiani–Scholze 2017, Theorems 1.1 and 6.3.1; §11.9 is Proposition D.1.3 of Liu–Tian–Xiao–Zhang–Zhu 2022, which they use as the genericity input for their Beilinson–Bloch–Kato results. Rests on the README's references and on CS17 and LTXZZ as read.

## Not verifiable

- The proof of the claim in [Shin-BCU] Proposition 1.4 that part (c) of gap:unitary-torus-igusa-trace refers to: the cached copy was read only at Theorem 1.1; the claim is cited through LTXZZ lines 10667–10671, which were read.
- [CS17] §5.3, p. 736 (the formula for `g^♯`) and the cohomological weight in Lemma 5.5.1: not opened again this round; neither belongs to a sampled target.

## Source issues

- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747, and Corollary 5.6.3, printed p. 750: the source defines `S_i` through `ι_p ∘ τ` with `ι_p` from `ℚ̄_p` to `ℂ`, a composite that is not defined; it should be `ι_p⁻¹ ∘ τ`; affects nothing.
- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747: the source states the vanishing for the base change `BC^p`; it should be `BC^S`, the base change outside `S` that its proof uses; affects a stated result.
- **Misprint** in CS17 at Lemma 5.4.3, printed p. 741: the source states the conclusion for `Red^b_n⃗(π_p)`; it should be for the representation `π^n⃗_p` of the hypothesis; affects nothing.
- **Misprint** in CS17 at Theorem 6.3.1(1), printed p. 757: the source writes the similitude factor of `G(ℚ_q)` and of `T_{i,v}` as `ℚ_p^×` and `ℤ_p^×`; it should be `ℚ_q^×` and `ℤ_q^×`; affects nothing.
- **Misprint** in CS17 at §5.6, printed p. 749: the source cites Lemma 6.4 of Shin's 2011 paper for the extension from acceptable functions; it should be Lemma 6.4 of Shin's 2009 paper on Igusa varieties; affects nothing.
- **Error** in CS17 at §5.1, printed p. 730: the source says the unitary PEL datum always gives a Shimura datum in the sense of its §2.1; it should exclude signatures definite at every place in rank at least two, where the adjoint real group is compact; affects the proof.
- **Gap** in CS17 at the proof of Theorem 5.5.7, printed p. 748: the source identifies `B(G_i, μ_i⁻¹)` with `B(GL_n/F_{𝔭_i}, μ_{i,τ}⁻¹)` directly; it should first translate by a central power of `p` when `S_i` contains embeddings of signature `(n, 0)`; affects the proof.
- **Gap** in CS17 at the proof of Theorem 6.3.1, printed p. 758: the source deduces nonvanishing at infinite level in the same least degree from Hochschild–Serre; it should claim only some degree at most that one, since `K_p` is hyperspecial, not pro-`p`; affects the proof.
- **Misprint** in CS17 at Remark 6.3.3, printed p. 758: the source says a single embedding has `p_τq_τ ≠ 0`; it should be the two embeddings `τ₀` and `τ₀c`, of which one lies over the chosen place of `𝒦`; affects nothing.
- **Gap** in LTXZZ at Proposition D.1.3, printed p. 365, and its proof, printed p. 366: the source assumes only that `w` lies outside `Σ⁺` and the places above `ℓ`, and then takes the level at every place above `w₀` to be hyperspecial; it should assume that no place above the rational prime `w₀` lies in `Σ⁺`, or treat the other case; affects the proof.

## For the human reviewers

- The fourth gap, gap:unitary-torus-igusa-trace (README line 719, supplier EndoscopicTransferAndUnitaryTraceComparison), is not in the `gaps` list of `design/plan.json`, which has three; the supplier has therefore not been told of it.
- The README cites [LTXZZ] by the published pages (Invent. Math. 228 (2022), 107–375); the package's `sources.toml` has no entry for it. The published text was read from an institutional open copy.
