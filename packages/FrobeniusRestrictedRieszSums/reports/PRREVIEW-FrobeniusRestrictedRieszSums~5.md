# Review of FrobeniusRestrictedRieszSums (pull request #2920 at cebce56)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** Accepted, with no findings. The identity 1.2, the averaged bound 1.7, the bracket 1.8, the implication 1.9, the sets of 0.8 and the new clause 0.4 (g) hold as stated in the README and in `Suggested.lean`; I rederived each and recomputed every numerical Check. There are seven small corrections and two format notes, none blocking: two statements are narrower than their own routes prove (1.2 in Lean, 1.7 and 1.9 in the coset law), five targets cite the formal proof with no file, two sentences of commentary are inaccurate or ambiguous, and the description and the family index each misdescribe the folder in one place. The humans who approve have four things to decide: the main source is an announced, unrefereed formal proof that could not be read here, so neither its statements, its licence, its wording nor its arrangement were compared.

## C01 — Theorems 1.7 and 1.9 fix the coset law `4 : 3`, although their route proves them for every symmetric coset law and the Conventions say such values appear only in Checks

A consumer who selects tops with another profile `ω₀` (0.7 allows every `ω₀ ∈ (0, 1]`, and the Summary itself gives the general coefficients `(1 − ω₀)/(1 + ω₀(o − 1))`) cannot apply 1.7 or 1.9 as stated, and the paragraph "Constants" (line 82) says "the values of particular constructions appear only in Checks", which the statement of 1.7 (line 930, `ν₀(A₀) = 4/(3o + 1)`) contradicts.

I redid the route of 1.7 with an arbitrary symmetric law `ν` of precision `η_top`: the thick part averages by 1.5 to `b(δ_th/2)Σ_{χ|A₀=1} conj χ(σ_d)χ(τ)G_{χ*}(a_τ/b)`, 1.6 replaces `Σ_τ χ_κ(τ)` by `ν̂(κ)|Φ_top|` at cost `o·η_top·|Φ_top|·x𝔔_x`, and the only property of `ν` used is that `ν̂(κ)` is real. The conclusion is then the same inequality with `𝔜_ν(x) = Σ_κ ν̂(κ) Re G_κ(x)`, and 1.8 and 1.9 follow unchanged. One option: state 1.7 and 1.9 for a symmetric coset law `ν`, and keep `ν₀` as the instance the formal proof states (as 0.4 does for `n ≥ 2`). The other: amend the sentence of the Conventions to say that the law of the tops in 1.7 and 1.9 is the fixed `ν₀`.

## C02 — `frobRieszSum_sub_main` carries three hypotheses that the README says the identity does not need

The README states, beside the theorem (line 811), that the identity "holds for every abelian CM host by the same orthogonality argument", but the Lean headline keeps `hd`, `hsplit` and `hId` (`Suggested.lean`, lines 235–238), and its docstring presents them as part of the statement. An implementer reads them as needed; a consumer with a host outside the class would reprove the identity.

I redid the derivation with the indicator of `g`: by 0.2 (iii) the mean of the indicator over `Fr(n)` is `|G|⁻¹Σ_χ conj χ(g)χ*(n)`, the sums `Σ_{g∉Φ} conj χ(g)` are `|Φ|, −|Φ|, 0` for `χ = 1`, `χ_K` and the others, and the constants left are exactly those of `𝔐`; with the formulas of the Conventions both sides also agree for `a/w < 1`. No step uses ramification. An instance outside the class: `E = ℚ(√−3, √−7)` with `K = ℚ(√−7)` (`3` is ramified in `E` and inert in `K`, `7` is ramified in `K`), where no `d` satisfies `SplitRamification d`. Since the wider form is already asserted as this roadmap's own, the acceptance test could state it (drop the three hypotheses); otherwise one clause in the docstring saying that they are the formal proof's and are not used would do.

## C03 — Targets 1.1, 1.7, 1.8 and 1.9, and the instance of 1.2, cite the formal proof with no file or declaration

The paragraph "Statements of the formal proof" (line 111) says that the hypotheses, ranges and constants of such a target are those of the proof. For 0.2–0.6, 0.8, 1.4 and 1.6 the README names a file and a declaration, so the claim can be checked; for 1.1 (line 802), 1.2 (line 841), 1.7 (line 980), 1.8 (line 1005) and 1.9 (line 1050), which carry the constants `4 : 3`, `26`, `3ε/8`, `1/2 + ε/2` and the cost conditions, it reads "[FormalProof]" only. Give each the file and declaration, as the other targets have.

## C04 — The parenthetical in 1.4 (a) reads as if every real primitive character of conductor dividing `8f_ψ` were an element of `𝔛_n⟨ψ⟩`

Line 848 has "`ρ` a real primitive character of conductor dividing `8f_ψ` (a real element of `𝔛_n⟨ψ⟩`)". For `ψ = 1`, `n = 2`, `(q, d) = (3, 71)` the real primitive characters of conductor dividing `8` are `1, χ₋₄, χ₈, χ₋₈`, which would give sixteen real characters of `G`; only `1` and `χ₈ = (2/·)` lie in `𝔛_2` (`ℚ(i) ⊄ E`), giving the eight of the Check at line 877. Clearer: "`ρ` a real element of `𝔛_n⟨ψ⟩` (its conductor divides `8f_ψ`)". The definitions of `c_ex(ψ)` and of the box hypothesis, which range over all such `ρ` on purpose, need no change.

## C05 — "Each condition has a use in Layer 0" (0.9, line 683) lists no use for `v₂(q + 1) ≤ a`, and Layer 0 has none

The list that follows covers every condition of a `(B, a)`-admissible pair except this one; 0.4 (vi) and 0.9 (vi) use `v₂(d + 1)` only, and 0.9 (v) merely restates the bound. Its use is downstream: UniformWildKernelBounds §2.3 bounds the number of places above `q` in `ℚ(μ_{2^∞})` by `2^{v₂(q+1)−1}`. Name that use, or say that this condition is kept for a consumer.

## C06 — The description's account of `Suggested.lean` does not match this head

The description says the file "states 4 headline theorems with `sorry` proofs and 26 definitions with real bodies" and that "its docstring says which other headlines are not statable and which carriers they lack". The file has three theorems (`exists_noRelation`, `frobRieszSum_sub_main`, `cyclicBound_of_frobeniusInequality`) and 25 definitions (the structure `ScaleData` included), and its docstring says that the other targets are steps of the routes and names no headline as not statable. The validation sentence of the description, that the automatic checks all pass except the one on changes outside the folder, is also of an earlier head. Suggested: "`Suggested.lean` states the three headline theorems (0.8, 1.2, 1.9) with `sorry` proofs and 25 definitions with real bodies; its docstring says that the other targets are steps of their routes and are not stated."

## C07 — The family index calls 1.9 an equivalence; the roadmap proves one direction

The entry for this roadmap in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 59) ends "the equivalence of the averaged inequality on a host with the window bound for the cyclic family". Theorem 1.9 derives the bound from the inequality; no target here states a converse. "the implication from the inequality at every translate on a host to the square-root bound for the cyclic family" would describe it.

## N01 — Layer 1 has no 1.3

The subsections run 1.1, 1.2, 1.4, …; other roadmaps cite 1.4–1.9 by number, so a line saying that the number is unused would serve better than renumbering.

## N02 — The display of 1.9 has `4o·x^{1/2+ε}` where its route gives `3o·x^{1/2+ε}`

Line 1018 against line 1040 (`Σ_χ |G_{χ*}(x)| ≤ 3o·x^{1/2+ε}` over the `3o` non-kept characters). Both are true; one of the two could be aligned.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.1 API (ii)–(iv) | `ℚ(ζ₈)`, `K = ℚ(i)`; `ℚ(√−3, √−7)`; `ℚ(i)` | `σ₅(i) = i`, `Φ = {σ₁, σ₅}`, `σ₅σ₇ = σ₃`; `f = 2` even; `f = 1` with `E/F` ramified at 2 | holds | none |
| 0.2 (ii), (iii), (v); `frobCoset`, `inertia` | `ℚ(i)`, `p = 2`; `ℚ(ζ₅)`, `p = 5`; `n = 1`, `N′ = 1` | mean of `χ₋₄` over `G` is `0 = χ₋₄(2)`; `1*(5) = 1`; `ZMod 1` filter keeps all units | holds | none |
| 0.3 (b), (c), (e) | `ℚ(√−3, √−7)` with `K = ℚ(√−3)`, then `ℚ(√−7)` | `(−3/7) = 1`; `(−7/3) = −1`, so `D₃ = G ∋ c`; second choice: 3 inert, fails | holds | none |
| 0.4 (i)–(vi) | `(19, 526679)`, `n = 2`; `(3, 71)`, `n = 1`; `(3, 47)` | 526679 prime, `d+1 = 2³3²·5·7·11·19`; class of `d` mod `±1` has order `1,1,2` (71), `1,1,1,2` (47) | holds | none |
| 0.4 (iii) | `ψ` even of conductor 16, 32; `(2/·)`; order 4 mod 5 | `|A| = 4, 4` at `n = 0, 1`; `8` for `n ≤ 3`; `2` at `n = 0`; `16`, `|G| = 64` | holds | none |
| 0.4 (g) | `n = 0`; `p = 2`; general `(M, Q)` | `c` trivial on real `ℚ_n`; odd order in a group of order `2^n` is trivial; `p = 2` excluded by `4 ∣ N` | holds | none |
| 0.5 (i)–(iv) | order 4 mod 5; `ψ = χ₋₄φ` | `𝒦 = {1, ψ, (·/5), ψ³}`; `4o = 16`; `(ψ²)* = (·/5)` of conductor 5, not 20 | holds | none |
| 0.6 (i), (iii)–(v) | first host; `p = 23, 43, 29, 31` | `(−d/p) = −1` four times; `(p/19) = 1, 1, −1, −1`; `yφ = σ_d u₀s′`, place `cσ_d u₀s′` | holds | none |
| 0.7 (i)–(iii′) | Chebyshev at `2(δ|A|)^{1/2}`; `ω₀ = 3/4`; `Σλ = 0` | failure `o·1/(4o) + 1/4 = 1/2`; precision `2(1+1/ω₀)·2/ω₀`; shares `4/(3o+1)`, `3/(3o+1)` | holds | none |
| 0.8, `exists_noRelation` | `M = L = 2`; `M ≤ (4L)^K`; digit bound | `T = {0}`, `1 ≥ exp(−C·0.69)`; `log M ≤ √(3K)·√(log M log L)`; digits `≤ 4L(D−1) < 4LD` | holds | none |
| 0.8a (a), (b) | three points in a window; two in one orbit | both products `< M/4`, congruent mod `M`, so equal; `|s − s′| ≥ M/ord h ≥ M/(4L)` contradicts | holds | none |
| 0.8b (c), (d) | marks `0, 2, 3`; `φ = c`; subsets | mark 3: `e = 1`, mark 0 within 3 positions, fails; `N = 2`, both marked; removal keeps property | holds | none |
| 0.9 (i)–(vi) | `(19, 526679)`, `(3, 71)`, `(3, 23)`, `(3, 359)`, `(3, 47)`, `(11, 7)` | `B < 13, 5, 5, 7`; `(B, 4)`; `11 ∤ 8`; `8p ∣ d+1` gives `d > 4B − 1` | holds; one unlisted condition | C05 |
| 1.1 (iii), (iv) | constant weights; `ℚ(i)` | `ℛ − 𝔐 = w₀(G₁ − G_{χ_K})(a/w₀)`; `(L′/L)(1, χ₋₄) = 0.245610` | holds | none |
| 1.2, `frobRieszSum_sub_main` | indicator of `g`; `a/w < 1`; host with no `d` | character sums `|Φ|, −|Φ|, 0`; constant `+a(L′/L)(1, χ_K)`; both sides agree below 1 | holds; split hypotheses unused | C02 |
| 1.4 (a), (b) | `(3, 71)`, `n = 2`; `α = 31/50` | 8 real characters (literal reading 16); `31/150 > 1/5`, `19/150 > 1/8` | holds | C04 |
| 1.5 | `χ` nontrivial on `A₀`; mean over `A` | sum over `A₀` is `0`; over `A` only 4 characters survive | holds | none |
| 1.6 | `ω₀ = 3/4`; `ω₀ = 1` | `ν̂ = (4 − 3)/(3o+1)`; `0` | holds | none |
| 1.7 | thick and thin pairs; general symmetric `ν` | Lipschitz cost `3(x+1)(ϑ+1)`; `(x−1)/(2x) ≥ 1/3`; weight `2f`; coefficient `4o + o²η_top x` | holds, also for every symmetric `ν` | C01 |
| 1.8 | four bracket terms | `2x^{1/2+ε}`, `2`, `4x^{1/2+13ε/8}`, `2x^{1/2+9ε/8}`; `20/26^{4/3} = 0.26`, `9 ≤ 26` | holds | none |
| 1.9, `cyclicBound_of_frobeniusInequality` | `ψ = 1`; `C′ < 0`; `B₀`, `N_c` below caps | `𝔜 ≤ x^{1/2+(C+3)ε} + 3o·x^{1/2+ε}`; vacuous for `C′ < 0`; right side monotone in `B₀ + N_c` | holds; threshold free of the host | C01, N02 |

- Source locators checked against the text: 2 (Announcement lines 53 and 125: the archive of the formal proof, and the normalised sum `Σ Λ(n)(X/n − 1)₊ − X log X + (1 + γ)X` of the Conventions). The 15 file locators into [FormalProof] could not be opened.
- Library declarations opened at the pinned Mathlib: 20, among them `NumberField/CMField.lean:542`, `Cyclotomic/Galois.lean:133, 188, 214`, `Cyclotomic/Ideal.lean:398`, `Behrend.lean:163, 176, 246`, `StrictConvexSpace.lean:161`, `IntegralDomain.lean:226`, `Variance.lean:398, 424`, `Bochner/Basic.lean:1169`, `JacobiSymbol.lean:311, 321, 423`, `Bertrand.lean:225`. The pinned Tau Ceti has no declaration of the objects of `Suggested.lean` (its `artinMap` and `inertia` are local class field theory and representation theory).
- Cross-roadmap citations resolved: on main, ClassFieldTheory Layers 7, 12, 13, 14 and W.5 (nine names), ArithmeticGaloisRepresentations §2.3, AnalyticNumberTheoryPartI §§0.30, 0.34, 0.34a, 2.18a, IntegralIwasawaTheory §0.2, ZerosOfLFunctions §6.3, ShimuraVarieties §5.1, Chebotarev Layers 4, 8.1, 11.1, Multiquadratic Layer 1; at open heads, QuasiRiemannHypothesis §5.4, RiemannHypothesisStatementsAndConsequences §§8.4a, 8.8a, 10.3, RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i, QuadraticTwistSelectionOverPrimes §§2.7c, 2.7d, ThetaChainsAndFrobeniusPrimeSums §§10.6, 10.7, GluedTargetAndDivisionInequality §8.23, UniformWildKernelBounds §2.3. The statements used (the identity of §8.8a with its term `D_f`, §1.4h (a), (b′), (c′), §1.4i (b), (b′), the group `X(K)` of §5.4) say what this README takes from them.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`; no upward or cyclic edge. No change outside the folder and the family index.
- Elaboration of `Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 109, 232, 365), nothing else. One import, no `set_option`, no sorried data.
- One-tactic probe on a copy: none of the three theorems closes with `rfl`, `simp` or `infer_instance`. `#check @name` on the theorems and the `ScaleData` declarations: every binder of the README statement is present; nothing changed.
- Headlines: the Summary names three (1.2, 1.9, 0.8); all three are stated, and the docstring names none as not statable, correctly.
- Numerical Checks recomputed: 30 Legendre symbols, the primality of 526679, 71 and 359, four factorisations of `d + 1`, the orders of 71, 47 and 526679 modulo `2^{n+2}` up to sign for `n ≤ 4`, and `(L′/L)(1, χ₋₄)`.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, QuadraticTwistSelectionOverPrimes, LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups, RieszSumsOverPrimesAndExceptionalZeros (open) and QuadraticCharactersAndReduction (main); nothing shared. The open roadmaps list the hosts, tops, thick sets, admissible pairs and `ℛ`, `𝔐` as not owned and cite this roadmap; the Frobenius-restricted inequality is owned by ThetaChainsAndFrobeniusPrimeSums §§10.3–10.5 and is a hypothesis here; the Riesz remainder is owned by RiemannHypothesisStatementsAndConsequences §8.4a and cited here.

Source independence: 6 passages compared with 1 source (Announcement), none shared beyond the formula of `G_1`, which the mathematics forces; largest share [FormalProof], 20 of 25 in-text source citations (15 with a file); contents of [FormalProof] could not be read: wording and arrangement not tested (from the cited paths alone, 0.4 and 0.5 each draw on both of its top-level trees).

Research link: 1.9 is the analytic frame of the proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026): chains of theta lifts of length `√X` for the normalised von Mangoldt sum (Announcement lines 32–38, 125; README Summary). 0.8 extends Behrend (1946) and Ruzsa (1993); 1.4 rests on Landau–Page. Rests on the README and the Announcement.

## Not verifiable

- [FormalProof] (all its locators, in 0.2–0.6, 0.8, 1.1, 1.2, 1.4, 1.6–1.9 and the Conventions): the repository the References name is on a host the sources service does not classify; the archive the Announcement names (line 53) is not a text it reads.
- Behrend 1946: the publisher's page refused the request (HTTP 403).
- Ruzsa 1993: the journal's page is on a host the sources service does not classify.
- Washington (ch. 3, 14), Neukirch, Davenport (ch. 19–20), Chebyshev 1852: books cited at chapter level for standard facts; not fetched. Their statements were checked through the routes.

## Source issues

- none

## For the human reviewers

- Scope: targets 1.1 and 1.7–1.9 rest on [FormalProof] alone, a Lean formalisation announced on 20 November 2026 (Announcement, 4 pages), with no written exposition; no refereed source states them.
- Licence: docstrings of `Suggested.lean` say five definitions are "as in [FormalProof]" (lines 77, 88, 100, 136, 149). The repository's licence and the agreement of names and statements could not be read.
- Licence: the References give a GitHub repository for [FormalProof]; the Announcement (line 53) gives a 14-part archive on the author's page. Which was read is not said.
- Not tested: [FormalProof], 20 of 25 source citations, could not be read; wording and arrangement were not compared with it.
- Scope: the third Check of 1.4 (line 880) rests on AnalyticNumberTheoryPartI §0.34 on main, an unconditional exclusion of Landau–Siegel zeros; no target here depends on it.
