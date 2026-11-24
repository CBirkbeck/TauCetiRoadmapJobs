# Review of HermitianFormsAndLattices (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 1243 changed lines since `74a09b7`. It checked every added `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` label, the sections whose statements or routes change (0.2, 1.3, 1.5, 3.4, 4.3, 4.6, 5.3, 5.4, 5.5, 7.2) against `main` and against the sections they now cite, the fifteen seeded sections against Kirschmer, Jacobson, Rapinchuk, the Stacks Project and Li–Zhang, the dependency check and the elaboration of `Suggested.lean`. One finding (P1): two targets of the README on `main` become remarks that no roadmap owns, the Fourier coefficients of the genus average of Hermitian theta series (7.2, whose target is now a case of 6.5(a)) and the clauses of 0.2's reductive structure that ReductiveGroups §9D.1 does not state. There are also two small corrections and one format note, none blocking; the human reviewers' decision on published theorems was applied to 0.2, 3.4 and 5.3, and nothing else is left for a human.

## R01 (P1) — Two targets of the README on `main` become remarks that no roadmap owns: the genus-average coefficients of 7.2, and the clauses of 0.2 that ReductiveGroups §9D.1 does not state

A section of a roadmap on `main` keeps its subject and its items stay planned. Here an implementer reading 7.2, "Siegel's main theorem as a statement on theta series", finds that the only thing to prove is the CM, `2k < n` case of 6.5(a), which mentions no theta series ("a case of 6.5(a)", line 4162). The statement 7.2 proved on `main` (base line 3316), that the genus average `Θ_gen^{(k)}(L)` has `T`-th Fourier coefficient `α_∞(L, T)·∏_v α_v(L, T)`, survives only as "*Remark (the genus average).*" (line 4167). The scope follows suit. "Owned here" replaces "their genus averages (Layer 7)" with "the mean-value identity of 7.2" (line 4279), and "Outside this roadmap" now says Layer 7 "records their genus averages in a remark" (line 4334). So nothing plans that statement any more, although on `main` ThetaLiftsForDefiniteUnitaryGroups took the coefficient from it. No general roadmap states it either: 7.2's own Origin calls the genus-average form "this roadmap's own formulation". The human reviewers' decision on published theorems therefore does not cover it.

0.2 is treated the same way. On `main` its target was "Prove that `U(V)` is connected reductive …" (base line 282). At this head that statement is a remark (line 344), and "Owned here" lists only "the section of `det` and the centre of `U(V)`" (line 4250). Citing ReductiveGroups §9D.1 for a field `E` of characteristic `≠ 2` falls under the decision, because §9D.1 states those clauses in full. The remaining clauses are owned by no roadmap: the cases `E = F × F` and characteristic two, the word outer, and absolute almost simplicity of `SU(V)` for `n ≥ 2`.

The smallest repair is to restore each statement as its section's target. In 7.2, "Prove that the genus average … has … the Fourier coefficient `α_∞(L, T)·∏_v α_v(L, T)`", with "their genus averages" put back in "Owned here" and the "Outside" sentence. The CM mean-value identity can stay in 7.2 as a "*The form of the formal proof.*" paragraph, as 0.2 and 2.5 already do. In 0.2, prove the structure for the cases §9D.1 does not cover and cite §9D.1 for the rest, and name those cases in "Owned here".

## C01 — The Kirschmer §10.1 locator in 5.1's Origin covers integral forms of simply connected groups, not classes of Hermitian lattices

A reader who follows the locator in 5.1's Origin, line 2273, will not find the statement. Kirschmer §10.1 (Kirschmer line 5814–5832) takes `G` absolutely quasi-simple and simply connected with compact archimedean points. Its double cosets `C\G(A)/G(K)` correspond to isomorphism classes of integral group schemes in a genus (Definition 10.1.1). `U(V)` is not simply connected, and the classes there are of group schemes, not of lattices. Borel (1963) alone supports the dictionary; cite it alone, or describe Kirschmer §10.1 as the analogue for integral forms of simply connected groups.

## C02 — The description does not record this roadmap's new supplier or its restated targets

The description says the pull request "adds no new mathematics to the plan". For this roadmap it names only the docstring of 3.1. It does not say that this roadmap gains PotentialAutomorphyDworkMotivesPartII as a supplier (§0.7, used in 1.5). It also omits that 5.3's target becomes the bound `h_E·N^{[E : ℚ]}`, which is not on `main`, and that 3.4 now states the coherence criterion in dimension one. Nor does it say that 0.2's structure and 7.2's genus average become remarks. A sentence would cover it, for example: "HermitianFormsAndLattices gains PotentialAutomorphyDworkMotivesPartII §0.7 (1.5); 3.4 and 5.3 state the formal proof's forms and cite GeometryOfNumbersAndQuadraticArithmetic §§2a.3 and 2.4.7 for the general statements." Once R01 is repaired, nothing needs to be said about the remarks.

## N01 — Two sentences describe the state of the work rather than the mathematics

The Conventions say a wider form "is proved by the route written here until the theorem named in its `*Corollary of:*` line … is in the library" (line 236). 2.5's Origin says the statement of (f) for `U(V)` "was not located" in Platonov–Rapinchuk, Chapter 7 (line 834). Timeless alternatives would be "the route written here is a proof that does not use the theorem its `*Corollary of:*` line names" and "(f), for `U(V)`, is this roadmap's own formulation".

## Questions for the author

- GeometryOfNumbersAndQuadraticArithmetic 2a.1 and 2a.2 name `hermitian_congr_iff_forall_place` and `exists_hermitian_localizations_iff` as their Gram-matrix statements, but at this head only this roadmap's `Suggested.lean` declares them. Are they meant to move there? If so, this file's docstrings for 3.1–3.2 would cite them; if not, that README should not present them as its own. I could not tell, because neither text says which file is to carry the declarations.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 0.2 target: `s_x` section of `det`, centre `U(1)` (changed) | `n = 1`; `n = 2` over `ℚ(i)`, `x = e₁`; `n = 0`; `E = F × F` | `n = 1`: `s_x = id`; `n = 2`: `diag(a, 1)`, det `a`, unitary iff `aā = 1`; `n = 0`: no `x`; split: scalars of `GL₂` ≅ `{(a, a⁻¹)}` | holds | none |
| 0.2 remark (target on `main`) | owner of clauses outside §9D.1 | characteristic two, `E = F × F`, outer, almost simplicity: no "Owned here" entry, no home section | unowned | R01 |
| 1.3 Jacobson (route now GNQA 2.9.3c) | `ℚ(i)/ℚ`: `⟨1⟩, ⟨2⟩, ⟨3⟩` | trace forms `⟨1,1⟩, ⟨2,2⟩, ⟨3,3⟩`; `⟨2,2⟩ ≅ ⟨1,1⟩`, `2 = N(1+i)`; `⟨3,3⟩` misses `1`, so `⟨3⟩ ≇ ⟨1⟩` | agrees with Jacobson p. 267, GNQA 2.9.3c | none |
| 1.4 (seeded) | split `E`, `n = 3`; Kirschmer Def. 2.1.3 (5) | `N(E^×) = F^×`; `H ⊥ ⟨1⟩`, Witt index 1; Kirschmer: determinant trivial when `E` has zero divisors | supported | none |
| 1.5 (now PotentialAutomorphyDworkMotivesPartII §0.7) | `q = 2`, `n = 1, 2` | `#U₁(𝔽₂) = 3 = #{N(x) = 1 in 𝔽₄}`; `#U₂(𝔽₂) = 2·3·3 = 18`; §0.7 gives orthonormal bases | holds | none |
| 2.1 (seeded) | `ℚ₃(i)/ℚ₃`: `⟨1,1⟩`, `⟨1,3⟩` | `−1 ∈ N`: hyperbolic; `−3` odd valuation: anisotropic; Kirschmer Thm 3.2.3, Cor. 3.2.4 (line 995–1015) | supported | none |
| 2.3 (seeded) | split, `n = 3`; `⟨1,1⟩` | Witt index 1, kernel `⟨1⟩`; `GL₃` noncompact; `−1 = N((1,−1))` so `⟨1,1⟩ ≅ H`; MAF §3.2a states `A ⊕ A^∨`, `GL(A)` | supported | none |
| 3.2 (seeded) | `ℚ(√−3)/ℚ`, `n = 2` | only `δ₂` nontrivial, signature `(2,0)`: product `−1`, no space; `⟨1,2⟩`: `δ₂`, `δ₃` both `−1`, product `1`; Kirschmer Rmk 3.4.2 (3) (line 1431–1448) | supported | none |
| 3.4, now `n = 1` (seeded) | `ℚ(i)/ℚ` lines | `⟨1⟩` with `⟨3⟩` at 3: product `−1`, incoherent; also `⟨−1⟩` at ∞: product `1`, equals `⟨−3⟩` (`(−3,−1)₂ = 1`) | holds; GNQA §2a.3 states every `n` | none (decision) |
| 4.2 (seeded) | `ℚ₃(i)`: `⟨1,1⟩`, `⟨1,3⟩` | `O_E²` unimodular; `val det = 1` odd, none; Kirschmer Prop. 3.3.5 (2) gives `⟨1,…,1⟩`, Thm 3.3.6 conjugacy (line 1128–1179) | supported | none |
| 4.3 (now GNQA 2.7.5 (d)) | `ℚ₂(i)/ℚ₂`; characteristic | hyperbolic plane: unimodular, rank 2, no rank-one splitting; residue char 2 and char `≠ 2` force char 0 | holds | none |
| 4.4 (seeded) | `ℚ₃(i)`, `V = ⟨1,3⟩` | `Oe₁ ⊕ Oe₂` norm-maximal (`ϖ⁻¹e₂` has norm `1/3`): unimodular ⊥ `ϖ`-line; Kirschmer L. 3.5.2 one genus; Li–Zhang L. 9.1.1 adjoins `⟨ϖ⟩` | supported | none |
| 4.6 (first two clauses now RG2.3.5a) | `ℚ₃(i)`, `O_E²`; ramified `ℚ₃(√3)` | special fibre `U₂(𝔽₃)`, order `3·4·8 = 96`; ramified case excluded by RG2.3.5a (b) | holds | none |
| 4.10 (seeded) | `E = ℚ(i)`, `j = 2`, `i = 2, 4, 5, 8, 9, 10` | `s = 3, 7, 12, 15, 10, 36` ≤ `i³ = 8, 64, 125, 512, 729, 1000`; ideals of norm 25: `3 ≤ 2²` | holds | none |
| 5.1 Origin | Kirschmer §10.1 | simply connected `G`, compact at ∞; classes of integral forms (line 5814–5832), not lattices of `U(V)` | locator wrong | C01 |
| 5.3 new bound (seeded) | `ℚ(ζ₁₂)/ℚ(√3)`, `N = 1, 2` | `h_E = 1`: `N = 1` bound 1, group trivial (`z = αu`); `N = 2`: `16 ≥ #(O_E/2)^× = 12` | holds | none |
| 5.3 (a)–(c) via GNQA §2.4.7 (seeded) | Kirschmer Thm 5.4.14, Cor. 5.1.4 | 5.4.14: special genera ↔ `(J × E(L))/H`; 5.1.4 needs `dim_K V ≥ 3`, i.e. `n ≥ 2`, as in (b), (c) | supported | none (decision) |
| 5.4 (b), route via GNQA 2.4.7 (c) | `ℚ₃(i)`, `n = 2` | `1 + 1 ≡ −1 mod 3`, so `−1` is a norm; `⟨1,1⟩ ≅ H`, `SU` noncompact | holds | none |
| 5.7 (seeded) | `n = 1`, `ℚ(i)`, `L = ℤ[i]`, `W` trivial | `dim M_W(K_L) = #cls = 1`; mass `1/4`, so (c) needs 4 to divide `[K_L : K]` | consistent | none |
| 5.8 (seeded) | `ℚ(√−15)/ℚ`; `ℚ(ζ₁₂)/ℚ(√3)` | `(2, −15)₃ = −1`, so `⟨1,1⟩ ≇ ⟨1,2⟩`; `∏ η_v(−1) = (−1)^{[F:ℚ]}`, so `[F : ℚ]` even | holds | none |
| 6.0b (seeded) | `n = 1`, `ℚ(i)` | `τ(U(1)) = (4/π)·π·2/4 = 2`; Kirschmer Thm 4.2.3: `τ(G) = 2` for `dim_K E = 2` (line 1871–1874) | consistent | none |
| 6.1 (seeded) | unramified, `n = 1`, `q = 3` | `#U₁(𝔽₃)/q = 4/3 = β^⋆(1)`; Kirschmer Def. 4.2.2 point count (line 1854–1862) | supported | none |
| 6.1a Method count | `n = 1`, field and split | `q^{2n−1}(1 − (s/q)^n)`: `q + 1 = #{N(x) = c}`; `q − 1 = #{ab = c}` | holds | none |
| 6.4b (seeded) | `ℚ(ζ₁₂)/ℚ(√3)`, `U = ⟨1,1⟩`, `n = 16` | `β(⟨1,ϖ²⟩) = 4·(3/2)² = 9`; `β(⟨ϖ,ϖ⟩) = 16·(3/2)(3/4) = 18`; `3m₂ ≤ 5m₂ ≤ 256m₂` | holds | none |
| 7.2 new target (seeded) | `k = 1`, `n = 2, 3`; 6.5(a), MAF §6.4b | `n = 2` excluded by `2k < n`, though 6.5(a) covers it; `n = 3` is a case of 6.5(a) and §6.4b (a) | holds; asks nothing beyond 6.5(a) | R01 |
| 7.2 remark (target on `main`) | `O_E²` over `ℚ(√−3)`, `k = 1` | coefficient of `e(z)` is `r(L, 1) = 2·6 = 12`; owner at this head: none | unowned | R01 |
| 3.1 Lean docstrings (changed) | elaboration | two `sorry` warnings, lines 66 and 113; types unchanged | ok | none |

- Source locators checked against the text: 26 (Kirschmer Def. 2.1.3, Thm 2.1.4, Def. 2.3.3, Thm 3.2.3, Cor. 3.2.4, Thm 3.3.3, Prop. 3.3.5, Thm 3.3.6, Rmk 3.4.2 (3), L. 3.5.2, 3.5.3, Def. 4.2.2, Thm 4.2.3, 4.2.4, L. 4.2.5, Prop. 4.2.7, L. 4.2.9, Cor. 5.1.4, Thm 5.4.14, §10.1; Jacobson, Theorem and (7), p. 267; Rapinchuk Thm 2.3, p. 12; Stacks Def. 10.121.5, L. 10.121.6, 10.121.7; Li–Zhang L. 9.1.1).
- Library declarations opened at the pins: Mathlib `groupCohomology.exists_div_of_norm_eq_one` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:134`); Tau Ceti `ZLattice.exists_basis_gauge_le` (`TauCeti/Algebra/Module/ZLattice/GaugeBasis.lean:68`).
- Cross-roadmap citations resolved at this head, 40 in all: GeometryOfNumbersAndQuadraticArithmetic 2.2.6, 2.4.7, 2.4.8, 2.5.7, 2.7.4–2.7.7, 2.9.2, 2.9.3, 2.9.3a–c, 2.9.4a–b, 2.9.6, 2a.1–2a.5, 3.2.8, 3.2.9, 4.4.13; ReductiveGroups §9D.1; ReductiveGroupsPartII §RG2.3.5a; AdelicAlgebraicGroups §§1.5a, 3.4a, 4.1a, 4.2a, 4.5a; MetaplecticAutomorphicForms §§3.2a, 6.4b; AutomorphicFormsOnReductiveGroups §7.5; FiniteGroupInvariants §10.2a; ThetaSeries 9.1–9.2; PotentialAutomorphyDworkMotivesPartII §0.7 (on `main`, unchanged).
- Record comparison: no layer or heading is removed, retitled or added. The general clauses of 3.4 and 5.3 move to GeometryOfNumbersAndQuadraticArithmetic §§2a.3 and 2.4.7, which state them in full (decision). 1.3, 1.5 and 4.3 keep their statements and cite their homes. 0.2 and 7.2 are R01.
- Consumers: ThetaLiftsForDefiniteUnitaryGroups at this head cites 0.2 only for `s_x` (its line 3275) and reroutes its use of 7.2 to 6.5 (b) with 7.1 (a). Open pull request #3036 still carries `main`'s text of that roadmap, citing 7.2; the description orders #3036 before this pull request.
- Labels: every section carries `*Origin:*`, and every section except the definitions 0.1, 1.0 and 1.7 carries `*Method of the formal proof:*`, as the Labels paragraph says. The six "none" methods are 1.3, 1.5, 3.3, 4.3, 4.6 and 6.1b; all 34 `*Corollary of:*` lines resolve.
- Automatic checks: every check passed. Dependency check output: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`. Elaboration: `lake env lean` on `Suggested.lean` gives only the two `sorry` warnings. The three declarations are unchanged apart from docstrings, and their elaborated types keep every binder.
- Overlap check: read OrbitMeasuresOnAdelicGroups, ThetaLiftsForDefiniteUnitaryGroups, IntegralLattices and GeometryOfNumbersAndQuadraticArithmetic. Landherr's theorem and the general Hermitian theory of Layers 1–4 and 6.1 are owned by GeometryOfNumbersAndQuadraticArithmetic and cited here through `*Corollary of:*` lines; `τ(G_m) = 1` and quotient measures are owned by OrbitMeasuresOnAdelicGroups. IntegralLattices shares nothing, and ThetaLiftsForDefiniteUnitaryGroups only consumes.

Source independence: changed passages only; the 1090 added lines were compared mechanically (runs of 7 words) with 6 sources (Kirschmer, Jacobson, Rapinchuk, Cho, Li–Zhang, Stacks), and 21 passages were read beside their locators; nothing is shared beyond forced mathematical phrases and bibliographic titles; largest share Kirschmer, 47 of about 210 source citations; contents not compared, because the change adds, removes or reorders no layer.

Research link: Layers 5–7 are the Hermitian mass formula, local densities and Siegel's main theorem (Shimura 1964, 1997; Gan–Hanke–Yu 2001; Weil 1965) used by the family's theta lifts on definite unitary groups in Alpöge's 2026 formal proof of GRH for Dirichlet L-functions; README overview and Kirschmer 2016, Chapter 4.

## Not verifiable

- Weil (1965), cited for 6.0a, 6.0b, 6.5 and 7.2: the DOI resolves only to a paywalled page; Weil (1961) has no open copy.
- Gross (1999), cited for 5.5 and 5.7: paywalled.
- Braun (1941), Landherr (1936), Kudla (1997), Shimura (1964, 1997), Jacobowitz (1962), Scharlau (1985), Platonov–Rapinchuk (1994, 2023), Gan–Yu (2000), Gan–Hanke–Yu (2001), Hironaka (1998), Tits (1979), Satake (1963), Nikulin (1980), Banaszczyk (1993), Cassels (1959), Serre (2007), Borel (1963): not opened; the seeded clauses that rest on them were checked through Kirschmer or the home sections only.
- 2.3's primary sources (Gan–Takeda 2016, Gan–Qiu–Takeda): checked only through MetaplecticAutomorphicForms §3.2a.
- The `*Method of the formal proof:*` labels and the 3.1 docstring's claim about the formal proof: the formalisation was not opened.

## Source issues

- **Misprint** in Kirschmer at Corollary 5.1.4 (2), p. 74: the source says some lattice of the special genus of `L` agrees with `L` away from `p`, which `M = L` satisfies trivially; it should say that every class in the special genus contains such a lattice, as its proof shows; affects nothing.

## For the human reviewers

- The decision on published theorems in the general roadmaps was applied. 3.4's criterion for every `n` and 5.3's clauses (a)–(c) cite GeometryOfNumbersAndQuadraticArithmetic §§2a.3 and 2.4.7, and 0.2's structure for a field of characteristic `≠ 2` cites ReductiveGroups §9D.1; each of these states its part in full at this head.
