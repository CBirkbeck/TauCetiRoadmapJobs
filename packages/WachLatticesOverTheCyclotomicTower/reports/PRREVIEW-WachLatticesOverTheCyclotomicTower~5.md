# Review of WachLatticesOverTheCyclotomicTower (pull request #2899 at 2a190e3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: every statement, route and Check of 6.4–6.11 and the four headline theorems was recomputed (the ring facts on `π₀` and `X`, heights and labelling, the Sen clauses, the comparison exponent `σ`, `ψ` modulo `p` with its excluded exponents, both polar counts, the counting theorem, the position arithmetic, the cokernel exponents, the carries) and holds, and the locators into Berger 2004, Berger 2008, Wach 1996 and Herr 1998 lead to the statements cited. There are two small corrections and two format notes, none blocking. The human reviewers must decide on scope and licence: 6.6–6.11 rest only on a formal proof announced on 20 November 2026, whose text could not be opened, so its fifty file and declaration locators are unverified.

## C01 — The description names `F` where the roadmap has `F(ζ_p)`, and two suppliers where the roadmap has five

The description says `E` is "containing the images of the embeddings of `F`"; the Summary, the Conventions and the setting of 6.4 (lines 3, 13, 29–31) require the embeddings of `F(ζ_p)`, a stronger hypothesis that every statement shares.

The description also says "The README cites its suppliers, PhiGammaModulesAndIwasawaCohomology and PadicPeriodRings". The supplier contracts and the Dependencies paragraph (lines 812, 836–846) name three more, each used by a route: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1 (labelled weights), PadicHodgeTheory §1.5 (the maps `ι_n` of 6.4 (6)–(7)) and PadicLocalLanglandsForGL2Qp §0.2 (characters of prescribed labelled weights). All three are on main, so nothing about the merge order changes; write `F(ζ_p)` and list the five.

## C02 — The Check on `v_i ≥ 1` in 6.8 points to an element `φ(y)` that the route of 6.7 (4) does not contain

The third Check of 6.8 (line 448) says that for `v_i = 0` "the element `φ(y)` of the route of 6.7 (4) need not lie in `Xφ^*N₀`". That route (lines 373–376) has no `y`; the element meant is `φ(ψ(Xx))`, which lies in `φ^*N₀` and must lie in `X^{1−v}φ^*N₀` for `Xx − φ(ψ(Xx))` to be a `ψ`-zero element of that lattice. For `v ≥ 1` this holds, since `φ^*N₀ ⊂ X^{1−v}φ^*N₀`; for `v = 0` it fails, as the Check says. Write `φ(ψ(Xx))`.

## N01 — Three citations name a paper or a range of sections where a numbered statement exists

For 6.4 (8) (line 141), Wach 1996: the Théorème on p. 380 with Remark a) on p. 381. For `γ − 1` on `ψ`-zero parts and the complex in 6.7 (line 385), Herr 1998: Théorème 3.8 (1), p. 584, and Théorème 2.1, p. 572, in place of "§§2–4". Cherbonnier–Colmez 1999 (lines 385, 858) has no locator at all.

## N02 — The family index and the description say that the family "follows" a source

The index carried by this pull request (index README, line 9) and the description say "The family follows the formal Lean proof". Would "The theorems of the family are those of the formal Lean proof of …" do, with the sentence on generality kept?

## Questions for the author

- The References give [FormalProof] as a repository on GitHub. The one file opened there, at the path cited for 6.4 (1) under the branch `main`, was not found, and the announcement names archives on its author's own site, not this repository ([Announcement] line 53). Which commit or archive do the fifty paths refer to? A pinned commit in the References would let a reader open them.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.4 setting: `π₀`, `X`, `Q = π₀ + p` | `π = ζ − 1`; coefficients of `π^k`; `γ(π) = π + π^p + π^{p+1}` mod `p` | `π₀(ζ−1) = −1 − (p−1) = −p`; coefficient `0` for `k < p−1`, `1/(p−2)! ≡ 1` at `p−1`; `γ(X)/X = 1 − X + …` | holds | none |
| 6.4 (2), (4) heights, labelling; headline (1) | `ℤ_p(−a)`; `n = 2`, `(k₀, k₁) = (5, 0)` | `φ(π^ae) = q^aπ^ae`, `q ≡ X`; `φ(e_{i−1}e) = u_iq^{k_i}e_ie` puts the jump `k_i` on component `i−1` | holds | none |
| 6.4 (1), (3) | invariant basis; `(γ−1)` on it | coefficients in `πO_E[[π]] ∩ O_E[[π₀]] = π₀O_E[[π₀]]`; saturation gives injectivity modulo `λ` | holds | none |
| 6.4 (5) | sharp example of 6.10, `m = 1` | cokernel `ℤ_p[[π]]/(p, π^{p−1}) ≠ 0`, zero after inverting `p` | holds | none |
| 6.4 (6)–(7) | `ℤ_p(−1)`, `d = te_{−1}`; rank one, `n = 2` | `ι_1(πe_{−1}) = (ζ_pe^{t/p} − 1)t^{−1}d`; `Fil⁰ = t^{−1}F_1[[t]]d`; `g_i(ζ_p−1) = 1·1·χ(γ)^{−k_i}` | holds | none |
| 6.4 (8); headline (1) converse | `N = πO_E[[π]]`, `T = O_E` | `φ(N) = qN`, `φ^*N = qN`: heights `(0, 1)`; `(γ−1)π = pπ + … ∉ π²`; `N ≠ O_E[[π]]` | holds | none |
| 6.5 (1), (2), (4) | `ℤ_p(−a)`; graded piece `m` | `(γ−1) = (1+p)^m − 1 = −p·c(m)`, `π₀ ≡ −p`: `ν = c(m)`; direct: `(γ−1)v = aXv`, `∇ = ā` | holds | none |
| 6.5 (3) | `U = {0}`, `s ≤ p`, `s = p+1`; `U = {0, p}`; `s > p` in general | hypothesis holds iff `s ≤ p`; under it `s′ − u ≡ 0` forces `s′ = u` (else `u ± p ∉ [0, s)`) | holds | none |
| 6.6 (1)–(3) | `φe = X^he`; `n = 2`, `h = 60`, `p = 41` | `∇(X^an) = X^a(∇ − a)n`; `m ≤ ⌊h/(p−1)⌋`; `pS_{i−1} = h_i + S_i`; `S = 1.5`, `σ = 1`, `2 ≤ 22` | holds | none |
| 6.7 (1), (2) | trivial family, pair `(1, 0)`; `w = 1` | `p(σ_{i−1}+2) − w_i ≥ σ_i + 1 + p`; `(1, 0)` cocycle, not `d(x)`; bound `sen(N)(−1) = 0`, `∇X^{−1} = X^{−1} + …` | holds | none |
| 6.7 (3a), (3b) | `a = 1, 2, 2−p, 1−p` | `(p−1)a = pm + r`: `m = 0, 1, 2−p, 1−p`; images `X⁰, X¹, X⁰, X^{−1}`; `ψ(X) = 1`, `ψ(X²) = 1 − 0 − 1 = 0` | range exact | none |
| 6.7 (3c) | levels `c = −(p−1), …, p`; `y = 1 − X` | `⌈pc/(p−1)⌉` = `−p, 2−p, …, −1, 0, 2, 3, …, p, p+2`: skips `1−p, 1, p+1`; `(γ−1)y = X² + …` | holds | none |
| 6.7 (4) | `v = 0` against `v ≥ 1` | `1 − v ∈ [2−p, 1]`, `−v ∈ [2−p, −1]` need `1 ≤ v ≤ p−2`; tail exponent `p(σ+3) − 1 − w ≥ v + 1` | holds | C02 wording |
| 6.8 counting theorem | low and high index | high: `(γ−1)c = φg′_{i−1} − (g_i − (γ−1)x_i)`; `p(σ_{i−1}+3) − w_i ≥ v_i + σ_i + 1 + 2p`; `v_i ≤ η_i ≤ p − 7` | holds | none |
| 6.9 position consequences | (P1)–(P5), both types | (P3) gives `p > 7`; window gaps `≤ η + σ + 1 < p`; other intervals inside `[−2σ−2, η+2σ+3]`; `t ≤ η` | holds | none |
| 6.9 (1a)–(1c), (2) | `μ` full summands; `Q = N^max/N^{std}` | piece `X^{−m}N̄`: Sen weight `e + m`, `pm_{i−1} ∈ [s+w−h, s+w]`; `mult_{XQ}(y) = mult_Q(y+1)` | holds | none |
| 6.9 (3), (4); headline (2) | `u = w ± k(p−1)`; `e = 0` | `u ≡ w ∓ k`, inside the excluded range since `σ ≥ k`; `e + j₀ ≤ η < p`; `e = 0`: one unramified line | holds | none |
| 6.9 Checks | `p = 41`: `(100, 26, 80, 2, {66})`, `(100, 20, 85, 1, {99})`; `p ≥ 13`, `U = {p}` | `σ = 2`: `40 < 41`, `34 ∉ [−6, 33]`; `34 < 41`, `14 > 4`, `−66 ∈ [−85, 15]`; `11 < p`, class `(ε−1)/p`, `dim H¹ = 2`, `d = 0` | hold | none |
| 6.10 (1), (2); headline (3) | sharp example, `c = (p−1)p^{m−1}`; `H ≤ p−2` | `C = ℤ_p[[π]]/(p^m, π^c)`; `cost(c−1, c) = 1 + (m−1) = m`; `cost(0, r) = ⌊r/(p−1)⌋ + v_p(⌊r/(p−1)⌋!) = α(r)`; `e_W ≥ cost(0, H) + 3` | holds | none |
| 6.10 (3) | term `p^aπ^{(p−1)U+t}`, `a + U = c_H + 2 + t` | need `2 + (t−U) ≥ (t−U)p/(p−1) − tp/(p−1)²`; right side `≤ t − U`; geometric sum `(p−1)/(p−2)` | holds | none |
| 6.10 (4) | `M = 0`; `M + h ≤ p−2`; `p = s = 3` | `a = 0`, `J = ∅` or `0 < |j| < p`: `e°_U = 0`; `(p−1)(a+1) > M`; `s + v_p(s!) = 4` | holds | none |
| 6.11 (0)–(5); headline (4) | `T ⊂ ℤ_p ⊕ ℤ_p(1−p)`, `a ≡ b` mod `p` | `N(T) = π^{p−1}A⁺v₁ ⊕ A⁺v₂`; carries `−1, +1`; exponents `0, p−1`; residues `{p, −1}`; `det φ = q^{p−1}`; `(p−1)|c| = h` | holds | none |

- Source locators read at the text: 14 (Berger-Wach-2004 lines 397, 477, 528, 608, 628, 764, 807, 853; Berger-2008 lines 411, 786; Wach-1996 lines 229, 246; Herr-1998 lines 376, 810), all supporting the statement cited; 50 file locators into [FormalProof] not read.
- Library declarations opened at the pins: `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` 42), `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` 166), `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean` 112), `BDeRhamPlus`, `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean` 75, 88), `Module.End.maxGenEigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean` 557), `TauCeti.continuousLocalCyclotomicCharacter` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean` 54); no file of either library mentions Wach modules, `B_cris` or crystalline representations.
- Cross-roadmap citations resolved: 33 sections on main (PhiGammaModulesAndIwasawaCohomology §§0.1, 1.0, 2.2, 2.4, 2.5, 3.1, 3.4–3.6, 5.6a, 6.0–6.3, 7.2a and its Conventions; PadicPeriodRings §§4.1–4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P5a, P7.1, P7.2, 4.6, 4.12, 5.11; PadicHodgeTheory §§1.5, 4.4, 5.2, 6.2; PadicLocalLanglandsForGL2Qp §0.2; LocalGaloisDeformationRings §§1.6, 1.13, 6.11; SelmerIwasawaCohomology §§4.8–4.10; PrismaticCohomologyPartIII §§7.21, 7.24, 7.25) and 11 consumer sections at the open heads of the family; contents compared for §6.0, §1.5, §4.4, §R07.P7.1 and §0.2.
- Dependency check: `depcheck: 171 roadmaps, 1993 edges, 0 problem(s)`; no upward or cyclic edge. Nothing changes outside the folder except the three files of the family index.
- Elaboration of `Suggested.lean`: no message; it declares nothing, so there is no signature to compare and no one-tactic probe to run. The four headlines all need the Wach lattice `N(T)`, which neither pin has; the docstring names each with its missing carriers.
- The automatic checks all passed at this head.

Overlap check: read SelmerLengthBoundsAndLocalLifting, PhiGammaModulesAndIwasawaCohomology, PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory, LengthBoundsInPadicFamilies, CongruenceModulesOfThetaLifts; nothing shared. Wach modules, their uniqueness and filtered reduction: PhiGammaModulesAndIwasawaCohomology §6.0. Lattices at finite levels of the tower over ramified bases, with their uniqueness clause: SelmerLengthBoundsAndLocalLifting §4.10e (0), a different object from the level-one lattices over `F` owned here (6.4 (7), (8)); each README says so. The six family roadmaps are not among the checkouts supplied and were read at their open heads through the roadmap tools.

Source independence: 19 passages compared with 4 sources, none shared (the sources are in French and no passage is a clause-by-clause translation); largest share FormalProof, 50 of 67 locators, text and layout not readable; contents compared with Berger-Wach-2004 (the next largest, 11): independent, the eight sections map onto none of its four chapters.

Research link: Wach modules of crystalline representations (Wach 1996; Berger 2004) and Herr's complexes (Herr 1998); 6.10 (2) extends Berger 2004, Proposition IV.1.3. The family's other roadmaps use 6.4–6.11 towards the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge (2026). Rests on the README and the texts read.

## Not verifiable

- [FormalProof]: the fifty file paths and declaration names cited in 6.4–6.11 (the only source of 6.6, 6.8, 6.9 and 6.11). The repository named in the References is in no class of host the source service reads, and the one path tried was not found there.
- Cherbonnier–Colmez 1999 and Fontaine 1990: not among the texts held; cited without locators, for standard facts (`ψ` and `γ − 1` on `ψ`-zero parts; étale `(φ,Γ)`-modules).

## Source issues

- none

## For the human reviewers

- **Scope.** 6.6–6.11 (lattice families, counting theorem, position data and residual bound, carries) cite only [FormalProof], announced 20 November 2026 with no written proof ([Announcement] lines 45–49); no refereed source states them. 6.4, 6.5, 6.10 (2) have refereed sources.
- **Licence.** The licence of the [FormalProof] repository could not be read. The README cites fifty of its file paths and declaration names; `Suggested.lean` declares nothing, so no Lean is adapted from it.
- **Not tested.** [FormalProof] has the largest share of the locators (50 of 67); its text and file layout could not be read, so wording and arrangement were not compared with it.
