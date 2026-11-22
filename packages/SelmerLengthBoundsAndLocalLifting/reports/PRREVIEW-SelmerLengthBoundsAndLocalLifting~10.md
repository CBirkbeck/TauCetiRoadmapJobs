# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at a640387)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** Accepted: no statement, Check or worked example was found false, and every hypothesis and constant compared with the formal proof (4.9c, 4.9d, 4.10c–4.10g, 3.24–3.25a) agrees with the declaration named. There are three small corrections (the one-embedding form of 4.9d (2) is attributed to a formal statement that asks more; EulerSystemsAndKolyvaginSystems is used but not listed as a supplier; the description names another commit than the README) and three format notes, none blocking. Two questions are left to the human reviewers: the standing of the formal proof as the main source, and its licence.

## C01 — 4.9d (2) is wider than the formal statement it is said to follow from

A reader who opens the declaration to see what is established finds a stronger hypothesis than the README's, and cannot tell that the README's form is the roadmap's own. The parenthesis before 4.9d (line 927) says that (2) "follows from [FormalProof]" `UpperTheory.N.InvariantsKilledOverCyclotomic`. That declaration (`Development/AutomorphicArithmetic/ResidueCharacters/InvariantsKilledOverCyclotomicAlt.lean`) assumes that `0` is a weight at no embedding of `K` (`∀ τ, ¬ IsJumpV … τ 0`) and concludes with the round exponent `20(n + 1)λ_N` only. Clause (2) (lines 937–941) assumes this at one embedding `τ` and gives the exponent `c` of (1) at an embedding above `τ`. The wider form is true: it is the route's step (0), restriction to `K′` and (1), whose formal counterpart `H0at` is stated for one `τ`; I recomputed `c ≤ 2 + 3nλ_N ≤ 20(n + 1)λ_N`.

The smallest change, in the README's own convention for statements of the formal proof: say that [FormalProof] states (2) when `0` is a weight at no embedding, with the exponent `20(n + 1)λ_N`, and that the form for one `τ` with the exponent `c` of (1) is this roadmap's, by step (0) of the route.

## C02 — EulerSystemsAndKolyvaginSystems is used in Layer 3 but is in no *Needs:* line, not in the Dependencies and not in the supplier contracts

An implementer who builds Layer 3 from the supplier contracts does not learn that it uses that roadmap. The README cites it seven times: the lattice Tate dual of its §0.2 (Conventions, line 15), the `p`-ray extension of §1.1 (3.22 (1), line 110), core rank of §0.8 (line 223), §1.6 (b) and §§1.6 (a), 1.23 as comparisons (lines 268, 275), and, as inputs of the route of 3.25a, the `A`-linear dual structure and the biduality of §0.2 with its trace comparison (lines 375, 472). All five sections exist on main with that content (`TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md`, lines 107, 391, 490, 690, 1309), and the roadmap is earlier in the merge order, so the direction is right; only the record is missing.

Add a `### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems` subsection (§0.2: finite self-injective coefficients, the trace comparison and biduality, used in 3.25a; §1.1: the fields `K(q)`, used in 3.22 (1)), and name §0.2 in the *Needs:* line of 3.25a and in the Dependencies of Layer 3.

## C03 — The description names commit `8c90877` for the formal proof and says the README does too; the README names the first commit

The description says: "The names are those of the `src/` tree of the public repository at commit `8c90877ceaa694974526e0aab9aaaf6ea0f5099e` … the References entry of the README says so." At this head the References entry (line 1982) says that the files and declarations are those of the first commit, `40e56bab026552e089d7afcfeff08d2defb9c005`. All 74 file-and-declaration pairs of the README exist at `40e56bab`. Text that would be right: "The names are those of the `src/` tree of the first commit of the public repository, `40e56bab026552e089d7afcfeff08d2defb9c005`, the source as published; the References entry of the README says so."

## N01 — `⌊log_p 2h⌋` is undefined at `h = 0` in 4.10e (1′) and in headline (4) of the Summary

4.9c (2) and 4.9d (2) say `h ≥ 1`; 4.10e (1′) (line 1601) and the Summary do not, and with all weights `0` the exponent contains `⌊log_p 0⌋` (the formal statement uses a logarithm that is `0` there). Would add "`h ≥ 1`"; nothing is lost, since weights in `[0, 0]` lie in `[−1, 1]`.

## N02 — Thirty declarations of the formal proof are cited by name only

For example `GlobalTheory.T.wachModule_uniqueness_characterisation` and `GlobalTheory.T.herrCocycle_poles_frobeniusQ_crystalline` in 4.10e (0), `Formalism.MainNotions.LiftingTheory.coreLiftO_holds` in 4.10c (3), and the `ArcLiftingSetup` and `S9` statements in 4.10d. Each exists at the cited commit, but a reader has to search for its file; the other 74 carry the path.

## N03 — In the second Check of 4.9d, `μ_n` denotes an unramified character

In a section where `μ_{p^s}` and `μ_{lcm(p,N)}` are groups of roots of unity, `V = μ_n ⊕ ℚ_p(1 − k)` (line 971) reads at first as a root-of-unity module. Another letter (the Checks of 4.9c use `μ` for an unramified character, without index) would avoid it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Headline (1); 3.22 | `Hom(O/λ², −)` on `O`; idele kernel in (1); `d = χ′ − χ′∘c` | `n_𝔉 = 1`, cokernel `≤ #k`, matrix `(λ²)`; kernel element is a `p^M`-th power at `𝔭`; `d(cgc⁻¹) = −d(g)` | holds | none |
| Headline (1); 3.23 | `n_Q = 1`, `Φ = ([e] − 1)`, `u` of order `p^m`; `u = 1`; twist by `ψ_u` | `v′(u − 1) = e(O′/ℤ_p)/(p^{m−1}(p − 1))`; infinite; `𝐅(u⁻¹ − 1)` | holds | none |
| 3.24 | tame relation at `p = 2`, `N ≡ 3 (4)`; Greenberg–Wiles count; first-half Frobenius | `N(N−1)/2` odd, extra term `μ(γ)ω₀(γ)`; difference `0` by balance and (H6); eigenvalues `ϑ^{±1} ≠ 1` | holds | none |
| 3.25 | the direction `b`; formal `ResBound`, `Start` | `μ(φ_a) = −1`, `μ(γ_a) = −σβ_a`; degree `≤ 4rR`, `4rR + 2 < p^M` on both sides | holds | none |
| 3.25a | `v_p` of binomials; Check `f = X − λ`, `g = X + λ`; formal `Step`, `Grow` | `M − v_p(k) ≥ ν + 1` for `k < p^{M−ν}`, `= ν` at `p^{M−ν}`; `fg ≡ X² (λ²)`; `N = 2(ν_λ+1)w + 2`, `+2r` | holds | none |
| 3.25b | `u_q = ζ^{p^{e_q}}`; product example; `f = p^{v₀} + X^D` | `v = p^{e_q}/φ(p^k)`; vanishes at `(ζ^{p^i}, ζ)`; `1/2` for `p = 3`, `m = D = v₀ = 1` | holds | none |
| Headline (2); 3.26 | `ν_s`; `p = 2`; size of `Q`; sign of twist; clause 3 | `0` if `[F(μ_p):F] ∤ t_sr_s`; `≥ 1`; `≤ 4R`; `T ⊗ ψ^m = T ⊗ ψ_{u^{−m}}^{−1}`; `v(u_q − 1)` | holds | none |
| 4.9a | `K = ℚ_p`, `V = E`, `η = χ_cyc`; reversed twist | `dim H¹(E(−1)) = 1`, `H¹_f = 0`; `dim H¹_f(E(1)) = 1` | holds | none |
| 4.9b | `F` imaginary quadratic, `V = E(1)`; `V = E` | `2` against `1`; `1 − 1 = 0` | holds | none |
| 4.9c | `c` against formal `cTB`, `cLL`; `a ≥ β + …`; round bound; Check `p = 7`, `N = 91` | identical terms; slack `⌊e/(p−1)⌋ + 1 − e/(p−1) > 0`, `s ≤ 2s+1`; sweep, 0 failures; order `12`, `v_7(24) = 0` | holds | none |
| Headline (3); 4.9d | `c` against formal `c0`; `ℚ_p(u)`; `V = ℚ_p`; (2) | identical; exponent `m + v_p(u)` against `+2`; `ℚ_p/ℤ_p`; `2 + 3nλ_N ≤ 20(n+1)λ_N` | holds | C01, N03 |
| 4.10a | `H¹` rank; `d`; Check `p = 41`, `h_i = 60` | `r[K:ℚ_p]` with `h⁰ = h² = 0`; negative weights of `ρχ_1^{−1}`; `σ_i = ⌊60/40⌋ = 1`, `η_i ≤ 30` | holds | none |
| 4.10b | `I = H¹_f(K, T′)`; `I = 0` | `0 = 0`; coranks `dim H¹ − dim H¹_f` on both sides | holds | none |
| Headline (4); 4.10c | `e` against formal `ePA`; span `p − 1` example; round bounds | `2e_W + e_U`; `cost = 1`, `e°_U = 1`, `e° = 3`, cokernel length `n`; 21,600 cases, 0 failures | holds | none |
| 4.10d | (g)(ii); (4) exponent; size Check; formal `SetCS` | `k ≤ 2v(p)(a + 2gℓ_max)`; 625 points, ratio `≤ 0.969`; `a(11,110) = 29.35`, `64.7 ≤ 95`; (S1), (S2), `p ≥ 11` | holds | none |
| Headline (4); 4.10e | prism identities; `e_s` against formal `ePB`; round bounds; Checks | `Q = Φ_{p^s}(1+π)`, `ι_s(Q) = ξ̃`; identical; `≤ 14Hs` in 49,569 cases, `e_1/h ≤ 17.94`; `13`; `3` and `2` | holds | N01 |
| 4.10f | `4r′ ≤ N²`; exponents; formal `thmT` | `lcm ≤ N²/4`, `N − 1 ≤ N²/4`; `10`, `15`, `35`, `200`; `C(η′N² + N³) < p`, `C(Nr′ + η(N + r′))` | holds | none |
| 4.10g | graph lattice; (2) against formal bound; `U = E` | `Γ ↠ L_X`; `e(rank H¹_f(L_U^†) + rank L_U)`; `2e` | holds | none |

- Source locators: 74 file-and-declaration pairs and 30 further declaration names of the formal proof found at its first commit `40e56bab`; 26 declarations opened and compared with the README (hypotheses and constants). BS23-FCRYS lines 65 and 665 (Theorem 1.2 is Theorem 5.6, no restriction on `p`). Announcement line 53 (the archive in fourteen parts).
- Library declarations: 19 elaborated with `#check` at the pins, among them `TauCeti.fittingIdeal` (`TauCeti/RingTheory/FittingIdeal/Basic.lean:334`), `Matrix.fittingIdeal_coker_zero_eq_span_det` (`TauCeti/RingTheory/FittingIdeal/Determinant.lean:170`), `TauCeti.ContCohomology.SelmerStructure.selmerGroup` (`…/ContCohomology/SelmerStructure.lean:97`), `ContinuousCohomology.tateShafarevich`, `BDeRham`; no crystalline carrier at either pin.
- Cross-roadmap citations: 17 suppliers resolved, 16 on main and WachLatticesOverTheCyclotomicTower at its open head; §6.9 (1c), (3), (4) and §6.10 (1)–(4) of the latter read against 4.10a and 4.10c; the contents of 12 sections on main read.
- Dependency check: `depcheck: 133 roadmaps, 1482 edges, 0 problem(s)`.
- Automatic checks: all passed. `Suggested.lean` elaborates with no output and declares nothing; its docstring names each headline and the carrier it lacks.
- Description: the folder and its index entry are identical here and at the head of #2954 (`3b7b695`); #2899 is open.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies (open), PhiGammaModulesAndIwasawaCohomology, EulerSystemsAndKolyvaginSystems, PadicHodgeTheory (main). Wach lattices over unramified bases: PhiGammaModulesAndIwasawaCohomology §6.0 and WachLatticesOverTheCyclotomicTower §6.4, cited; lattices at level `s`: this roadmap; the `H¹_f` criterion: AnabelianGeometryAndNonabelianChabauty §4.6, cited; nothing owned twice.

Source independence: 9 passages compared with 3 sources (seven files of the formal proof, which contain no prose, BS23-FCRYS, the announcement), none shared; largest share FormalProof, 85 of 96 source mentions; contents compared with the directory tree of FormalProof: independent (each layer draws on files of several directories, in no common order).

Research link: the two layers are the Selmer-theoretic and `p`-adic Hodge inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026), extending Bloch–Kato 1990, Wach 1996, Berger 2004, Herr 1998 and Bhatt–Scholze; README References and BS23-FCRYS line 65.

## Not verifiable

- Bloch–Kato 1990, §3 and Corollary 3.8.4: no legal copy read; the locator agrees with PadicHodgeRegulators §1.5 on main.
- Wach 1996, Berger 2004, Herr 1998: cited as credits without locators; not opened.
- The proofs of the statements marked "not given here" (4.9c (G), (D1), (D2); 4.10d (3), (4) inputs; 4.10e (0) (U)_s, (H)_s, (E)_s; 4.10f (b), (c)): their Lean statements exist, the proofs were not read.
- The steps (d)–(h) of the route of 4.10d (1) were read, and (g) recomputed; (d), (f), (h) were not rederived.

## Source issues

- none

## For the human reviewers

- Scope: 85 of the README's 96 source mentions are to [FormalProof], a Lean formalization with a four-page announcement and no written, refereed proof; the steps marked "not given here" rest on it alone (README lines 21–24, 1982–1983).
- Licence: the public repository of [FormalProof] states that the source was published without a licence; the README cites file paths and declaration names only, and `Suggested.lean` declares nothing.
