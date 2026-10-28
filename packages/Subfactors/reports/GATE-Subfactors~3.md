# GATE-Subfactors~3: answers to human review

There is one comment (kim-em, 2026-10-28T19:16:48Z), and it makes five points. The head before repair was `f407ff6`. The first repair commit is `a25db0b4`. The depcheck repair, commit `93a41cf5`, follows from the worker's depcheck finding (three UPWARD lines). A second depcheck repair, commit `dde5aec3`, removes the remaining UPWARD edge to VonNeumannAlgebras (#194, after Subfactors at #189) by moving the von Neumann algebra prerequisites down into a new Layer 0.

## H01 (kim-em) — disputed
The roadmap cannot consume TemperleyLiebOperatorAlgebras A1–A5 while keeping a single direction of supply. Here are the positions in the merge order:
- Subfactors is at #188.
- CategoricalOperatorAlgebras, which consumes Subfactors S1–S2 and S5–S9, is at #220.
- TemperleyLiebOperatorAlgebras is at #221.
- TemperleyLieb is at #242.

So "TemperleyLiebOperatorAlgebras must merge before Subfactors" closes a cycle. The depcheck reported it as `not movable: … consumed by CategoricalOperatorAlgebras (#220), which comes first`.

Following the rule that a notion needed from a later roadmap moves down, `TauCetiRoadmap/Subfactors/README.md` Layer 3 now owns these over ℂ, built from Tau Ceti's presentation:
- the analytic adjoint;
- the normal form and Markov-trace uniqueness;
- Jones–Wenzl projections;
- Jones's positivity theorem;
- positive path models;
- the quotient tower and its C*-tower.

Concretely:
- §§3.1–3.3: "The supplied analytic adjoint / positivity / positive Jones tower" → "The analytic adjoint / Markov uniqueness, Jones–Wenzl projections and Jones's positivity theorem / Positive path models, Jones quotients and their C*-tower".
- The TemperleyLieb and TemperleyLiebOperatorAlgebras supplier blocks are deleted.

## H02 (kim-em) — answered
The cycle is Subfactors §§3.1–3.5 → TemperleyLiebOperatorAlgebras A1–A5. TemperleyLiebOperatorAlgebras A6 → CategoricalOperatorAlgebras CA1a/CA2a, and CategoricalOperatorAlgebras → Subfactors S1–S2, S5–S9 (its README line 95).

It is now broken inside this folder by moving ownership. Subfactors names no supplier later than itself in the merge order (#189): its suppliers are Mathlib, Tau Ceti, CStarAlgebras, FreeProbability and OperatorAlgebraDynamics, and the depcheck reports 0 problems with and without `--movable`.

One overlap remains: TemperleyLiebOperatorAlgebras A1–A5 still plan the same positivity material. Removing it is a repair to that roadmap, outside this folder. That roadmap can consume Subfactors Layer 3 (it comes later), or it can move A6–A7 into a Part II.

## H03 (kim-em) — answered
Confirmed at layer level. TemperleyLiebOperatorAlgebras README line 126 says A1–A5 use neither Subfactors, A6 nor CA1a/CA2a. The merge order is roadmap-level, though, so this does not remove the cycle in H02. That is why the material moves down instead.

## H04 (kim-em) — disputed
`TauCetiRoadmap/Subfactors/Suggested.lean` again states `jonesLoopParameters`, `markovTrace_nonneg_iff` and `markovTrace_nonneg_iff_lt_floor`, with real carriers from Tau Ceti `TauCeti.TemperleyLieb`. Each theorem carries `StarModule ℂ` and the generator-fixing hypothesis `he`, so the star structure is forced to be the analytic adjoint.

The replacement theorem `indexParameter_mem_of_tl_action` stays deleted, for two reasons:
- Its hypothesis `hTL` was the positivity classification itself.
- It quantified over arbitrary `B n`, `ρ`, `σ` with no II₁ factor.

The declarations are `TauCetiRoadmap.Subfactors.*`, a different namespace from TemperleyLiebOperatorAlgebras' declarations.

## H05 (kim-em) — answered
`TauCetiRoadmap/Subfactors/Suggested.lean` builds at the pins (result below). The TemperleyLiebOperatorAlgebras Lean file was not built in this job.

## Notions moved down
These notions moved from TemperleyLieb (#242) into Subfactors Layer 3, over ℂ only:
- the normal form `TL_(n+1) = ι(TL_n) + ι(TL_n)U_nι(TL_n)`;
- Markov-trace uniqueness;
- quantum integers;
- Jones–Wenzl projections with `T_k(f_k) = [k+1]`.

These moved from TemperleyLiebOperatorAlgebras A1–A5 (#221):
- the analytic adjoint, positivity and the pullback criterion;
- the path models;
- `Q_n = TL_n/R_n` and its C*-tower.

Some TemperleyLieb items are no longer used, so nothing was moved for them:
- Layer 4's diagram-basis comparison `presentedTLEquiv`;
- Layer 5's cell modules;
- Layer 6's Goodman–Wenzl ideal theorem;
- Layer 7.

Sufficiency now goes through Wenzl-type path representations on the presentation, identified with `T_n` by Markov uniqueness.

These moved from VonNeumannAlgebras (#194) into a new `TauCetiRoadmap/Subfactors/README.md` Layer 0, stated only as far as Layers 1–10 use them:
- V0–V1, V4 → 0.1: normal functionals, the predual, normal representations, the bicommutant theorem and GNS;
- V10–V11 (modular part) → 0.2: Tomita–Takesaki theory and the standard form, including non-σ-finite M;
- V5–V6 → 0.3: finite factors, uniqueness of the trace, tracial L² and the trace-preserving expectation;
- V8 → 0.4: group von Neumann algebras, tensor products and discrete crossed products;
- V7, V7.Index, V7.GroupApplications → 0.5: coupling dimension, `[M:N]`, `[M:N] ≥ 1`, index one iff equal, restriction of scalars, multiplicativity, `[N ⊗ M_n : N] = n²`, subgroup index;
- V11 (weights) → 0.6: extended positive part, operator-valued weights, spatial derivatives, Haagerup's and Takesaki's theorems and `E⁻¹`;
- V13 → 0.7: the hyperfinite II₁ factor, its uniqueness among separable amenable II₁ factors, and its corners.

Every `*Needs:*`, Dependencies, Conventions and prose citation of VonNeumannAlgebras now cites the Layer 0 subsection, and the `From TauCetiRoadmap.VonNeumannAlgebras` supplier block is deleted. Scope and ownership says why Layer 0 is owned here and leaves the type classification, Connes's invariants and the injective classification to VonNeumannAlgebras, which no layer needs. VonNeumannAlgebras still plans the same material; removing that overlap is a repair to that roadmap, outside this folder. Two locators were corrected on the way: the non-σ-finite standard form in 1.1 had cited Anantharaman–Popa Chapter 8, which treats only tracial algebras, and now cites 0.2; the index range in Conventions is `[1,∞]`, not `[0,∞]` (Anantharaman–Popa, Remark 9.4.10). `Suggested.lean` is unchanged: Layer 0 introduces no headline theorem, and its README bullets carry no backticked name of this roadmap.

## Signature check
`#check @name` for the three declarations was appended temporarily to `Suggested.lean`, elaborated with `lake build TauCetiRoadmap.Subfactors.Suggested`, then removed. The elaborated types:

| Declaration | Elaborated type |
|---|---|
| `jonesLoopParameters` | `Set ℝ` |
| `markovTrace_nonneg_iff` | `∀ {δ : ℝ}, 0 < δ → ∀ (q : ℂˣ) (hq : ↑δ = -(↑q + ↑q⁻¹)) [∀ n, StarRing (TL ℂ ↑δ n)] [∀ n, StarModule ℂ (TL ℂ ↑δ n)], (∀ n i, star (e ↑δ i) = e ↑δ i) → ((∀ n x, 0 ≤ markovTrace q hq (star x * x)) ↔ δ ∈ jonesLoopParameters)` |
| `markovTrace_nonneg_iff_lt_floor` | adds `δ < 2`, `δ ∉ jonesLoopParameters`, a fixed `n` with `StarRing`/`StarModule` instances at that `n`, and ends `↔ n < ⌊π / arccos (δ/2)⌋₊` |

These match README §3.2. No binder was dropped, and nothing changed.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| Markov uniqueness (3.2) | n = 0 → 1; δ = 0 | `φ_1 = δφ_0` on `TL_1 = ℂ` gives `φ_1(1) = δ`; at δ = 0 `φ_(n+1)(ι a) = 0`, `φ_(n+1)(ι(a)U_nι(b)) = φ_n(ba)` | Holds for all δ; Markov condition needs n ≥ 1 (no generator on one strand) | Stated "for n ≥ 1" |
| Quantum integers | δ = 2; δ = 2cos(π/4) | δ=2: [1..4] = 1,2,3,4; δ=√2: [2]=√2, [3]=1, [4]=0 | True | None |
| JW recursion, k = 2 | j = 1 | `f_2 = 1 − ([1]/[2])U_1 = 1 − δ⁻¹U_1`; `T_2(f_2) = δ² − δ⁻¹·δ = δ² − 1 = [3]` | True | Check added |
| Wrong model: coefficient `[j+1]/[j]` | j = 1 | `(1 − δU)² = 1 + (δ³ − 2δ)U`, equal to `1 − δU` iff `δ² = 1` | Excluded by idempotence | Check added |
| JW uniqueness | f, f′ both satisfying the three properties | `ff′ = f(1 + m′) = f`, `ff′ = (1 + m)f′ = f′` | Unique | None |
| `markovTrace_nonneg_iff` | δ = 1, n = 2 | `x = a + be`: `T_2(x†x) = |a|² + 2Re(āb) + |b|² = |a + b|² ≥ 0` | Consistent with 1 = 2cos(π/3) admissible | None |
| same | δ = 1/2 | θ = arccos(1/4) ≈ 1.318, π/θ ≈ 2.38, k = 2; `T_2(f_2) = −3/4` | Fails at level 2 as stated | None |
| same | δ = 0, δ < 0 | δ=0: all forms trivially ≥ 0 but 0 ∉ set; δ<0: `T_1(1) = δ < 0` | Hypothesis δ > 0 needed and present | None |
| `…_lt_floor` | δ just below √2 | k = 3: `[3] = δ² − 1 > 0`, `[4] = δ³ − 2δ < 0` | Positive at n ≤ 2, fails at n = 3 | None |
| same, below level k | n < k | path model on the half-line at level n uses weights `[1..n+1]`, all > 0 since n + 1 ≤ k | Sufficiency below k holds | Route stated |
| Path-model weights (3.3) | δ = 2, n = 2 | paths 0→1→0, 0→1→2: `τ_2(1) = 1·1 + 3·1 = 4 = δ²`; unit weights give `τ_1(1) = 1 ≠ 2` | Weights `[t+1]` forced | Check added |
| Weight eigen-relation | A_(m−1) ends | t = 0: `[0] + [2] = δ[1]`; t = m−2: `[m−2] + [m] = δ[m−1]` with `[m] = 0` | True | None |
| `π_n(U_i)² = δπ_n(U_i)` | s = 0 and s generic | `v = (√[s], √[s+2])`, `|v|² = [s] + [s+2] = δ[s+1]`; s = 0: `v = (0, √δ)` | True | None |
| `ker π_n = R_n` | both inclusions | `x ∈ ker ⇒ T_n(xy) = τ(π(x)π(y)) = 0`; `x ∈ R_n ⇒ τ(π(x)π(x)*) = T_n(xx†) = 0 ⇒ π(x) = 0` | True (τ faithful) | None |
| `R_n = 0` at δ ≥ 2 | n = 3 | `Σ #paths² = 1² + 2² = 5 = catalan 3 ≥ dim TL_3` | Injective | None |
| δ = 1 Check | m = 3, A_2 | one path per level; `f_2 = 1 − e`, `T_2(f_2) = 0`, `T_2(f_2e) = 0` | `f_2 ∈ R_2`, `Q_n = ℂ` | Check reworded |
| δ = √2 Check | A_3 | n = 2 endpoints {0,2}: 1² + 1² = 2; n = 3 endpoint {1} twice: 2² = 4; catalan 3 = 5 | True | None |

## Adversarial pass, Layer 0

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| 0.1 normality | `ℓ^∞(ℕ)`: weighted sum vs Banach limit | weighted sum: `ω(1_[0,n]) = 1 − 2^(−n−1) → 1 = ω(1)`; Banach limit: `0` on each `1_[0,n]`, `1` on `1` | Banach limit not normal | Check added |
| 0.1 GNS | `M₂(ℂ)`, `φ = x₁₁` vs `Tr(diag(1/3,2/3)·)` | null space = zero first column, quotient dim 2; faithful state dim 4 | True | Check added |
| 0.1 bicommutant | upper triangular `T₂` | `T₂′ = ℂ1`, `T₂″ = M₂ ≠ T₂` | `*`-closure needed | Check added |
| 0.2 modular data, convention | `M₂`, `h = diag(1/5,4/5)` | `ΔE₁₂ = (1/5)/(4/5)·E₁₂ = E₁₂/4`; `σ_t(E₁₂) = 4^(−it)E₁₂`; inverse convention gives 4 | Matches Kosaki Example 2.1 | Check added |
| 0.2 faithfulness | `φ = x₁₁` | `Λ(E₂₂) = 0`, `E₂₂ ≠ 0` | S undefined; hypothesis needed and present | Check added |
| 0.2 trace, `M = ℂ` | `h = 1/2`; `M = ℂ` on `ℂ` | `Δ = 1`; `J = conj`, `JMJ = ℂ = M′` | True | Checks added |
| 0.3 trace uniqueness | `M_n` | `τ = Tr/n`, `τ(E₁₁) = 1/n`; `B(ℓ²)` has none | True | Check added |
| 0.3 `E_B` | `D₂ ⊂ M₂`; `ℂ ⊂ M₂` with `x ↦ x₁₁` | `E(E₁₂) = E₁₁E(E₁₂)E₂₂ ∈ D₂ ∩ E₁₁D₂E₂₂ = 0`; vector state sends `E₁₁ ↦ 1 ≠ 1/2 = τ(E₁₁)` | Uniqueness needs τ-preservation | Check added |
| 0.4 covariance | translation action of `S₃`, `g = (12)`, `h = (23)` | correct: `σ_(h⁻¹g)` both sides; swapped: `σ_(g⁻¹h)` vs `σ_(hg)`, `g⁻¹h = (12)(23) ≠ (23)(12) = hg` | Convention pinned | Check added |
| 0.4 ICC | `S₃`, `S_∞`, `ℤ` | `L(S₃) ≅ ℂ⊕ℂ⊕M₂`, dim `1+1+4 = 6`; `L(ℤ) ≅ L^∞(S¹)` | Not factors; `S_∞` ICC | Check, example |
| 0.4 crossed product | `ℓ^∞(ℤ/2) ⋊ ℤ/2` swap vs trivial | `M₂(ℂ)` (factor) vs `ℂ⁴` (abelian), both dim 4 | True | Check added |
| 0.5 dim normalisation | `M_n`, row space | `L²(M_n) = n` rows, dim 1, row dim `1/n`; Tr-normalisation gives 1 | True | Check added |
| 0.5 `n²` law | `N ⊂ N ⊗ M₂` | `[·] = 4`, `τ(e_N) = 1/4` (agrees with 2.1's Check) | True | Check added |
| 0.5 subgroup index | `S₃ ⊃ ⟨(12)⟩`, `S₃ ⊃ {e}` | 3, 6 | True (non-abelian G) | Check added |
| 0.5 multiplicativity | `P ⊆ N ⊆ M`, `[M:N] = ∞` | Exercise 9.15 needs `L²(M)` finite over N | Hypothesis `[M:N] < ∞` added | Stated |
| 0.5 no separability | uncountable `⊗ M₂` (2.1's Check) | `ℓ²(I)` with uncountable I gives dim 4 | Definition works without separability | Stated with `ℓ²(I)` |
| 0.6 spatial derivative | `M = ℂ` on `ℂ²`, `h = diag(1/5,4/5)`; `M = B(K)` | `dφ/dψ′ = h⁻¹ = diag(5, 5/4)`; `= k` for `Tr(k·)` | Matches Kosaki Remark 3.3(ii)–(iii) | Checks added |
| 0.6 minimal index | `ℂ ⊂ M₂`, `E = Tr(h·)` | `Tr(h⁻¹) = 5 + 5/4 = 25/4`; minimum `n² = 4` at `h = 1/2` | Matches Kosaki §3.3 | Check added |
| 0.6 Takesaki, tracial | `(M, τ)`, `N ⊆ M` | `σ^τ = id`, so `σ(N) = N` and `τ|_N` finite | Gives 0.3's `E_N` | Stated |
| 0.7 embedding | `x ↦ diag(x,x)` vs `diag(x,0)` | `τ_4(diag(E₁₁,E₁₁)) = 1/2`; `τ_4(diag(E₁₁,0)) = 1/4` | Unital embedding needed | Check added |
| 0.7 corners | `τ(p) = 1/3` | normalised trace `3τ` on `pRp` | True (Remark 11.2.3) | Check added |
| 0.7 uniqueness hypotheses | `L(F₂)` | separable, non-amenable | Amenability needed | Check added |

## Sources
Penneys, *Unitary Quantum Symmetries Lite*, Chapter 4 (author page) was fetched through the sources service under the id `Penneys-UQSL-Ch4`. The new locators were checked against it:
- Exercises 4.1.2–4.1.3: `Penneys-UQSL-Ch4` lines 23–25, printed p. 141.
- Exercise 4.2.6: line 189, p. 146.
- Exercise 4.3.3 and Lemma 4.3.4: lines 211–216, pp. 146–147.
- Lemma 4.3.8: line 230, p. 147.
- Definition 4.3.10 and Proposition 4.3.14: lines 249 and 289, p. 148.
- Exercises 4.3.15–4.3.16: lines 357–358, p. 149.
- Theorem 4.3.17: line 368, p. 150.
- (TB1)–(TB7): lines 562–607, pp. 154–155.
- Definition 4.5.1 and Facts 4.5.5: lines 733 and 758, pp. 158–159.

Anantharaman–Popa, *An Introduction to II₁ Factors* (author's draft) and Kosaki, *Type III factors and index theory* (author page) were fetched through the sources service under the ids `AnantharamanPopa` and `Kosaki`, and every Layer 0 locator was checked against them:
- `AnantharamanPopa` lines 1439 (Theorem 2.1.3), 1983 (Theorem 2.5.5), 2110 (Corollary 2.5.9), 2145 (Proposition 2.5.12), 2218 (Theorem 2.6.1);
- lines 312 and 570 (Definitions 1.3.3, 1.3.14), 2734 (Proposition 4.1.3), 4228 (Theorem 6.3.5), 4465 (Theorem 7.1.1), 6391 (Theorem 9.1.2);
- lines 385 (Theorem 1.3.6), 447 (Proposition 1.3.9), 2957 and 2988 (Propositions 5.1.2, 5.1.4), 3092 (Proposition 5.2.3);
- lines 5696 and 5724 (Lemma 8.2.1, Proposition 8.2.3, stated for separable spaces), 6157–6181 (Definition 8.5.4, equation (8.6)), 6182, 6196, 6205 (Propositions 8.5.5, 8.6.1, 8.6.2), 6889 and 6899 (Definition 9.4.9, Remark 9.4.10), 7023–7038 (Exercises 9.13–9.15);
- lines 1090 (§1.6), 8294 (Theorem 11.2.2), 8358–8365 (Remark 11.2.3).
- `Kosaki` lines 128–150 and 153–160 (§2.1, Example 2.1), 1052–1124 (§3.1, Remark 3.3 and the properties after it), 1258–1297 (construction of `E⁻¹`), 1461–1478 (§3.3, first example), 3600–3670 (Appendix A §§1–4).

Haagerup's *The standard form of von Neumann algebras* (Math. Scand. 37, 1975) is open, but the copy found is an image-only scan that cannot be read here, so it is not cited; 0.2 cites Kosaki and the 2×2-matrix route instead.

This roadmap folder has no `sources.toml`, and this job may edit only `README.md` and `Suggested.lean`, so the manifest entry was not written here. No text the README cites is missing, and `needs-references.toml` was not written.

## Build and gate
- `lake build TauCetiRoadmap.Subfactors.Suggested`: `Build completed successfully (8981 jobs).` The only warnings are the two `declaration uses 'sorry'` (lines 67 and 82).
- Gate summary: `gate Subfactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck, without and with `--movable`:
  ```
  depcheck: 174 roadmaps, 1176 edges, 0 problem(s)
  depcheck: 174 roadmaps, 1176 edges, 0 problem(s)
  ```
- Signatures: `Suggested.lean` is unchanged in this repair, so the signature table above still holds.

Ownership against open pull requests was checked against the TemperleyLiebOperatorAlgebras, CategoricalOperatorAlgebras, TemperleyLieb and VonNeumannAlgebras checkouts that the brief gives. For Layer 0, the roadmaps on main and earlier in the merge order were searched by object (Tomita, coupling dimension, hyperfinite, standard form, II₁ factor, spatial derivative, group von Neumann algebra, normal state, predual). FreeProbability, OperatorAlgebraDynamics and TypeAHeckeAlgebras use these objects but take them from VonNeumannAlgebras and do not state them, so no earlier owner exists and Layer 0 is owned here. The overlap with TemperleyLiebOperatorAlgebras A1–A5 is recorded in H02.
