# Review of SelmerLengthBoundsAndLocalLifting (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 296 changed lines since `b8f3652`. The folder is the same text as at the head the previous review read; I checked again the `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels of all 18 sections against the nine cited papers that could be read legally and against the supplier sections they name as those now stand, and no finding remains, so the folder is accepted. Three small corrections and two format notes remain from the previous review, none blocking: the labels of 3.24 do not say that the even-rank case is this roadmap's own, the 4.10e label states the range of fields of Kisin–Ren more narrowly than Pham's §4.5 does, and several new citations carry no locator. One point is left to the humans: the licence of the formal proof's repository.

## C01 — The 4.10e label says Kisin–Ren classify the lattices "for `K` unramified over some `ℚ_p(μ_{p^n})`", but Pham's §4.5, which the label cites for this, takes every `K ⊆ K₀(μ_{p^m})`

A reader comparing the label with 4.10e (0), which allows every `K₀ ⊆ K ⊆ K₀(μ_{p^s})`, would conclude that the published classification misses the intermediate fields. Pham 2023 (arXiv v2, lines 861–862) works, "as in [KR09]", under the assumption that `K` lies in the compositum of `K₀` and the Lubin–Tate tower, with `m` chosen so that `K` lies in its `m`-th level; for `E = ℚ_p` and the multiplicative group this is `K ⊆ K₀(μ_{p^m})`. The two ranges differ: for `p = 7` the cubic subfield of `ℚ_7(μ_7)` lies in `K₀(μ_7)` with `K₀ = ℚ_7`, is ramified over `ℚ_7` and does not contain `μ_7`, so it is unramified over no `ℚ_7(μ_{7^n})`.

The smallest repair is to replace "for `K` unramified over some `ℚ_p(μ_{p^n})`" by "for `K₀ ⊆ K ⊆ K₀(μ_{p^n})` for some `n`", in the label of 4.10e (line 1727) and in the Kisin–Ren 2009 entry of the References (line 2269). Kisin–Ren itself could not be opened, so this rests on Pham's statement of its hypothesis.

## C02 — The labels of 3.24 state (4c) for every rank, while the Method label itself says the formal proof uses that the rank is odd

The **Labels** paragraph (lines 26–32) promises that where a section records a wider form as this roadmap's own, its `*Origin:*` label names that form. The Method label of 3.24 says that, when `T̄ ≅ T̄ ⊗ χ̄_cyc^t`, "the proof uses that the rank is odd" (line 252), and that the route here "treats both signs `η = ±1`" (line 256); the section states (4c) for every `r ≥ 1`, and `η = −1` (line 340) is the case the odd-rank argument does not see. Yet the Origin label of 3.24 names no form as this roadmap's own, and 3.24 is absent from the list of such sections in the Labels paragraph, so a reader cannot tell that the even-rank form of (4c) is not a statement of the formal proof.

The smallest repair is one clause at the end of the Origin label of 3.24, for example "The form of (4c) without a parity condition on `r` is this roadmap's own formulation", and `3.24 (4c)` added to the list at line 31. I could not open the formal proof's files in this round, so whether its statement of (4c) is restricted to odd rank or only its proof is rests on the label's own sentence; if the statement is unrestricted there, the label's sentence at line 252 is the one to adjust.

## C03 — Several sources the new labels cite carry no locator

A provenance label that cannot be checked at a theorem or a section tells a reader less than intended. These citations have none, in the label or in the References: Mazur and Rubin 2005 and Nekovář 2006 (3.22); Bertolini and Darmon 1994 for the Chebotarev choices (3.24); Kurihara 2014 (3.25); Iovita and Marmora 2015 and Benois and Nguyen Quang Do 2002 (4.9c); Tate 1967 (4.9d); Gee, Liu and Savitt 2015 and Chang and Diamond 2011 (4.10a); Bloch and Kato 1990 and Fontaine and Laffaille 1982 (4.10c, 4.10g); Abhinandan 2024b and Min 2026 (4.10e).

For Abhinandan 2024b the locator is Theorem 1.2 (Theorem 5.5 in the body; arXiv v2, line 102): the evaluation on the `q`-de Rham prism is an equivalence onto Wach modules. The others would each take a theorem or section number.

## N01 — The *Needs:* line of 4.10b lists PadicHodgeRegulators §1.6, which its route does not use

The paragraph on corollaries (lines 34–41) says that *Needs:* lists what the route needs and that the deduction needs the section the *Corollary of:* line names. The route of 4.10b takes the annihilator from SelmerIwasawaCohomology §2.17 (line 1246), so the entry puts an implementer of that route behind §1.6.

## N02 — The References entry "Abhinandan 2024b" gives no title

Its title is *Prismatic F-crystals and Wach modules* (arXiv:2405.18245v2, line 5).

## Previous findings

- The previous review (at `374b9ce`) raised no finding. Its three small corrections and two format notes concern text this head leaves as it was; they are C01–C03, N01 and N02 above, checked again.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.22 (2)–(3) Method label | functor `Hom(O/λ², −)` on torsion modules | one generator, one relation `λ²`: square `1 × 1`, entry in `𝔪` | holds | none |
| 3.23 Origin, headline (1) | `Φ = (λ²)` on `E/O`; `Φ = (0)` | kernel `λ^{−2}O/O`, length `2 = v(λ²)`; kernel `E/O`, both sides infinite | holds | none |
| 3.24 Origin, Method, (4c) | `η = 1` and `η = −1`; `r` odd, `r` even | Method label: proof uses odd rank; statement: every `r ≥ 1`; Origin names no own form | label incomplete | C02 |
| 3.25 Origin bounds | `r = R = 1`, `e = 1` | degree `≤ 4rR = 4`; `n_Q ≤ 2rR + e = 3`; needs `p^M > 6` | holds | none |
| 3.25a Origin | `ν = 1`, `O = ℤ_p` | `ν_λ = 1`, `𝔞_ν = p²ℤ_p`; (2′) named own in label and in Labels list | holds | none |
| 3.25b Origin (Newton polygon) | `g = p + X` at `ζ_p − 1`, `p ≥ 3`; `p = 2` | `v = min(1, 1/(p−1)) = 1/(p−1)`; at `p = 2` slopes coincide and `g(−2) = 0`, excluded as an edge slope | holds | none |
| 3.26 Origin, headline (2) | `ν_s = 0`; one lattice | bound `ε′·length(O′/p)`; `R` free of `ε′` as the label says | holds | none |
| 4.9a Corollary of AnabelianGeometryAndNonabelianChabauty §4.6 | `V = E`, `η = χ_cyc`, `K = ℚ_p` | `H¹_f(ℚ_p, E(−1)) = 0`: every crystalline extension of `E(χ_cyc)` by `E` splits, as the layer's Example says; §4.6 states the criterion | holds | none |
| 4.9b Corollary of PadicHodgeRegulators §1.5; Method | `V = ℚ_p(1)`; `V = ℚ_p`; kernel of `x ↦ ((1−φ)x, x mod Fil⁰)` | `1 + 0 = 1`; `0 + 1 = 1`; kernel `V ⊗ (B_cris^{φ=1} ∩ B_dR^+) = V` | holds | none |
| 4.9c Origin | sources cited | Cherbonnier–Colmez, Iovita–Marmora, Benois–Nguyen Quang Do not readable; label makes no numerical claim beyond the section | not checked at source | none |
| 4.9d Origin vs Ozeki Thm 2.3 | crystalline characters | theorem is for characters `ψ_i` with an explicit constant `C(d, M, h)` (lines 205–216) | holds | none |
| 4.10a Origin vs Gee–Liu–Savitt 2014 Lemma 9.3 | `ψ₁ ≠ ψ₂`; `ψ₁ = ψ₂` | dimension `|J|`; `|J| + 1` (arXiv v4, lines 2049–2050); README range `≈ p²/4` against `p` | holds | none |
| 4.10b Corollary of PadicHodgeRegulators §1.6 + ArithmeticGaloisDuality §D7.7.1 | `I = H¹_f(K, T′)`; `I = 0` | `0 = 0`; `length(H¹(K, W)/F_W) = length H¹_f(K, T′)`, both infinite when the rank is positive | holds | N01 |
| 4.10c Origin vs Abhinandan Thm 1.2, Čoupek–Gazaki–Marmora Cor 3.16 | `H = 0`; weights `≥ 0`, `K = K₀` | `e ≤ 23·2 = 46`; rational `H^k(S•)[1/p] ≅ H^k_f` (line 112); integral for `i = 0, 1` (lines 1199–1204) | holds | none |
| 4.10d Origin | label against statement | clauses (1)–(4) and own form of (3) named as in the section | holds | none |
| 4.10e Origin vs Pham §4.5 | `E = ℚ_p`, `𝔾_m`; cubic subfield of `ℚ_7(μ_7)` | `Q(u) = [π^m](u)/[π^{m−1}](u) = Φ_{p^m}(1 + u)`; field in Pham's range, outside the label's | label narrower | C01 |
| 4.10f Origin, headline (4) | `N = 2`, `r′ = 1`, `η = 1` | `k = 40(2 + 3) = 200`, no `η′`; Caraiani–Emerton–Gee–Savitt §3.1 title at line 813 | holds | none |
| 4.10g Origin | lifting exponent `e = 0` | loss `p^0 = 1`: pushouts finite, the Fontaine–Laffaille case | holds | none |

- Source locators checked against the text: 9 (Pham §4.5, Def. 4.17, Prop. 4.18; Ozeki Thm 2.3; Abhinandan 2024 Thm 1.2; Čoupek–Gazaki–Marmora Cor. 3.16; Gee–Liu–Savitt 2014 Lemma 9.3; Caraiani–Emerton–Gee–Savitt §3.1; Abhinandan 2024b Thm 1.2; Min 2026 abstract; Fontaine–Laffaille 1982 title page).
- Cross-roadmap citations resolved at this head: AnabelianGeometryAndNonabelianChabauty §4.6 (the target on the Bloch–Kato subgroups), PadicHodgeRegulators §§1.5 and 1.6, ArithmeticGaloisDuality §D7.7.1, WachLatticesOverTheCyclotomicTower §6.10, NewtonPolygons §§2.1–2.3 (on `main` §2.1 has no heading left, but that roadmap keeps the number and maps it to `PowerSeries.newtonPolygon` and `Polynomial.newtonPolygon`, so the citation holds).
- Record: the README has the same 2 layers and 18 sections as at the merge base; no heading removed or renamed, 18 Origin labels, 18 Method labels, 3 Corollary lines.
- Dependency check: `depcheck: 129 roadmaps, 1446 edges, 0 problem(s)`.
- Automatic checks: every check passed.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output; the file is unchanged by the pull request, imports only Mathlib and declares nothing (its docstring says no headline is statable at the pins), so there is no signature to compare and no one-tactic probe to run.
- Description: its part 2 (section numbers unchanged; each section carries `*Origin:*` and `*Method of the formal proof:*`) agrees with this folder's change; it names no change of this folder that the head lacks.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts and LengthBoundsInPadicFamilies (main) and InertAnticyclotomicCMMainConjecture (open); nothing shared. The change adds no object: the three *Corollary of:* lines point at the owners of the general theorems (AnabelianGeometryAndNonabelianChabauty §4.6, PadicHodgeRegulators §§1.5–1.6).

Source independence: changed passages only; 9 passages compared with 9 sources, none shared beyond the standard phrase "Breuil–Kisin modules with descent data" of one section title; largest share FormalProof, 89 mentions in the README (not opened in this round), then Bloch–Kato 1990 (not readable); arrangement not compared (no layer added, removed or reordered).

Research link: Layers 3 and 4 are the Selmer-theoretic and `p`-adic Hodge inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); they extend Bloch–Kato 1990, Bertolini–Darmon 1994 and Mazur–Rubin 2005, and Wach lattices and prismatic `F`-crystals (Pham 2023, Abhinandan 2024). Rests on the README's References and on Pham §4.5.

## Not verifiable

- Bloch–Kato 1990, §3, Prop. 3.8, Cor. 3.8.4 (4.9a, 4.9b, 4.10b, 4.10c, 4.10g): no legal copy found by the sources service.
- Kisin–Ren 2009, Thm 0.1 and §2.2 (4.10e), and Iovita–Marmora 2015 (4.9c): the publisher's host is in no licence class.
- Cherbonnier–Colmez 1999, Thm IV.2.1 (4.9c): the publisher's host is in no licence class.
- Gras–Munnier 1998, Thm 1.1 (3.22), Kurihara 2014 (3.25), Nekovář 2006 (3.22), Tate 1967 (4.9d): no legal copy found.
- Mazur–Rubin 2005 (3.22) and Benois–Nguyen Quang Do 2002 (4.9c): paywalled only.
- Bertolini–Darmon 1994, Thms 3.18 and 3.21 (3.25): the DOI did not resolve.
- The formal proof's Lean files (all Method labels): the host of the repository's raw files is in no licence class for the sources service, so the labels were read against the README's own statements only.
- Gee–Liu–Savitt 2014 was read in arXiv v4; its published numbering was not compared.

## Source issues

- none

## For the human reviewers

- Licence: the Method labels describe proofs of the formal proof's repository (`leanprover-community/riemann-hypothesis`, commit `40e56bab`), whose licence I could not read in this round; the labels are prose and reuse no code.
- Not tested: the source with the largest share of mentions, [FormalProof], could not be opened in this round, so the wording of the Method labels was not compared with it.
- The two recorded decisions were not needed for this folder: it removes or renumbers no section.
