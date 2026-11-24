# Review of SelmerLengthBoundsAndLocalLifting (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 296 changed lines since `74a09b7`. I checked the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels of all 18 sections against the cited papers that could be read legally, the three supplier sections they name and the formal proof's source; no finding remains, so the folder is accepted. Three small corrections and two format notes remain, none blocking: the labels of 3.24 do not say that its even-rank case is this roadmap's own (every Layer 3 statement of the formal proof is in odd rank), the 4.10e label states the range of fields of Kisin–Ren and Pham too narrowly, and several new citations lack locators. One point is left to the humans: the formal proof's repository has no licence file.

## C01 — The 4.10e label says Kisin–Ren classify the lattices only "for `K` unramified over some `ℚ_p(μ_{p^n})`", but Pham's §4.5, which the label cites, takes every `K ⊆ K₀(μ_{p^m})`

A reader comparing this with 4.10e (0), which allows every `K₀ ⊆ K ⊆ K₀(μ_{p^s})`, would conclude that the published classification misses the intermediate fields. It does not. Pham 2023 (arXiv v2, lines 861–862) works "as in [KR09]" under the assumption `K ⊆ K_{0,E}K_∞`, with `m` chosen so that `K ⊆ K_{0,E}(v_m)`. For `E = ℚ_p` and the multiplicative group this is `K ⊆ K₀(μ_{p^m})`. The two conditions differ. For `p = 7`, the cubic subfield of `ℚ_7(μ_7)` lies in `K₀(μ_7)` with `K₀ = ℚ_7`. It is ramified over `ℚ_7` and does not contain `ℚ_7(μ_7)`, so it is unramified over no `ℚ_7(μ_{7^n})`.

The smallest repair is to replace "for `K` unramified over some `ℚ_p(μ_{p^n})`" with "for `K₀ ⊆ K ⊆ K₀(μ_{p^n})` for some `n`". This is needed in the label of 4.10e (line 1727) and in the Kisin–Ren 2009 entry of the References (line 2269). I could not open Kisin–Ren itself, so this rests on Pham's statement of its hypothesis.

## C02 — The labels of 3.24 present the statement for every rank `r` as the formal proof's, but every Layer 3 statement of the formal proof is in odd rank

The new Method label of 3.24 says that, when `T̄ ≅ T̄ ⊗ χ̄_cyc^t`, "the proof uses that the rank is odd" (line 252). The section states (4c) for every `r ≥ 1`. Its route treats both signs `η = ±1`, and `η = −1` occurs only in even rank. Yet the Origin label does not name the even-rank form as this roadmap's own formulation, and 3.24 is missing from the list in the **Labels** paragraph (line 30). That paragraph promises that every wider form is named this way. The untouched parenthetical of (4c) (line 295) says the form here "follows from" `GlobalTheory.ChooseForms.single_field`. That holds only for odd `r`.

How I know: at the formal proof's first commit, `ChooseH` and `single_field` are stated over `D : D7` (`Development/AbelianVarietyTheory/Definitions/NonGaloisDescent/IsDualDualRep.lean`, line 10). The structure `Ranks` of `D7` has `k_even` and `m_even` (`Formalism/LocalRingCardinality/Params.lean`, lines 10–11). The theorem `r_odd (D : D7) : Odd D.R.r` is `Formalism/LocalToGlobal/BesselHermitianTheta/LemmasChr.lean`, line 81. The same `D : D7` binder opens the files cited for 3.22 (2) and 3.23 (`GaloisSideTwistedSelmerAuxiliaryPrimes.lean`, line 27), 3.25 and 3.25a (`Small2.lean`, line 10) and 3.26 (`AdmissibleIndexBoundAllPowers.lean`, line 11). Only the purely algebraic 3.22 (3) and 3.25b (2) are free of it.

The smallest repair is one sentence in the paragraph *Statements of the formal proof* or in **Labels**. For example: "The statements of [FormalProof] cited in Layer 3, except 3.22 (3) and 3.25b (2), are in its setting, where the rank `r` is odd; the forms for even `r` are this roadmap's own." Line 295 would then read "follows, for odd `r`, from".

## C03 — Several sources the new labels cite carry no locator

A provenance label that cannot be checked at a theorem or a section tells a reader less than intended. These have none:

- 3.22: Mazur and Rubin 2005, and Nekovář 2006.
- 3.24: Bertolini and Darmon 1994. The Chebotarev choice is their Lemma 2.21, with Definition 2.22 and Lemma 2.23.
- 3.25: Kurihara 2014.
- 4.9c: Iovita and Marmora 2015, and Benois and Nguyen Quang Do 2002.
- 4.9d: Tate 1967.
- 4.10a: Gee, Liu and Savitt 2015, at §5.4, the proof of Theorem 5.4.1 (arXiv v2); and Chang and Diamond 2011, at Theorem 7.8, with 7.12 and 7.15 (arXiv v2).
- 4.10c and 4.10g: Bloch and Kato 1990, and Fontaine and Laffaille 1982.
- 4.10e: Abhinandan 2024b, at Theorem 1.2 (Theorem 5.5 in the body); and Min 2026.

Adding the locators given here, and those of the texts I could not open, would make each label checkable.

## N01 — The *Needs:* line of 4.10b now lists PadicHodgeRegulators §1.6, which its route does not use

The convention paragraph (lines 34–41) says that *Needs:* lists what the route needs and that the deduction needs the *Corollary of:* section. The route of 4.10b takes the annihilator from SelmerIwasawaCohomology §2.17 (line 1246). The entry is harmless, but it puts an implementer of the route behind §1.6.

## N02 — The References entry "Abhinandan 2024b" gives no title

Its title is *Prismatic F-crystals and Wach modules* (arXiv:2405.18245).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.22 (1) Origin, Gras–Munnier | one place; group of exponent `p^M` | `Frob^a = 1`, `p ∤ a` ⇒ `Frob = 1`: split completely, as the label and the References entry say | holds | none |
| 3.22 (2)–(3) Method | `Hom(O/λ², −)` on `O` | `n_𝔉 = 1`; relations `1 ≤ n_𝔉`; matrix `(λ²)`, entry in `𝔪` | holds | none |
| 3.23 Origin, headline (1) | `Φ = diag(λ², 1)`; `Φ = ([e] − 1)`, `u` of order `p^m` | kernel length `2 = v′(λ²)`; `e(O′/ℤ_p)/(p^{m−1}(p − 1))`; `u = 1` infinite | holds | none |
| 3.24 Origin, Method, (4c) | `dim U = 1`, alternating; `r = 2` with `η = −1`; formal `D7` | corank `1 = e`; even `r` outside formal setting (`r_odd`) | label incomplete | C02 |
| 3.25 Origin vs Bertolini–Darmon 3.18, 3.21 | `k = 1` | null space of `⟨,⟩₁` is `Sel^(2)` (line 825); `Λ = #Ш·Λ^der` (line 946) | holds | none |
| 3.25 Origin bounds | `r = R = 1` | degree `≤ 4`, `n_Q ≤ 2 + e`, `p^M > 6` | holds | none |
| 3.25a Origin | `ν = 1`, `O = ℤ_p` | `ν_λ = 1`, `𝔞_ν = p²ℤ_p`; (2′) named own | holds | none |
| 3.25b Origin (Newton polygon) | `g = p + X`, `x = ζ_p − 1`, `p ≥ 3` | `v(p) = 1 > 1/(p−1) = v(x)`: minimum once, `v(g(x)) = 1/(p−1)` | holds | none |
| 3.26 Origin, headline (2) | `[F(μ_p):F] ∤ t_sr_s`; `p = 2` | `ν_s = 0`, bound `ε′·length(O′/p)`; `ν_s ≥ 1` at `p = 2` | holds | none |
| 4.9a Corollary of AGNC §4.6; Method | `K = ℚ_p`, `V = E`, `η = χ_cyc`; formal `blochKato_ext_all` | `dim H¹(E(−1)) = 1`, `H¹_f = 0`; `finrank V₁ = finrank V₀ + 1` | holds | none |
| 4.9b Corollary of PHR §1.5; Method | `V = ℚ_p(1)`; `V = ℚ_p` | `1 + 0 = 1` (units); `0 + 1 = 1` (unramified line); kernel of `x ↦ ((1−φ)x, x mod Fil⁰)` is `V` | holds | none |
| 4.9c Origin vs Cherbonnier–Colmez IV.2.1 | `e = 0`, `U = {0}`, `s = 1` | `exp*` over `K_m` (line 875); `c = 9` against `0` needed (Check) | holds | none |
| 4.9d Origin, headline (3) | `V = ℚ_p(1)`, `K = ℚ_p`, `p` odd | `c = 2 + 3 = 5`; `H⁰(ℚ_p, ℚ_p/ℤ_p(1)) = 0` | holds | none |
| 4.10a Origin vs GLS 2014 Lemma 9.3 | `1 ≤ b₁ − b₂ ≤ p`; `p = 41` | dimension `|J|` or `|J| + 1`; README range `≈ p²/4 = 420` against `41` | holds | none |
| 4.10b Corollary of PHR §1.6 + AGD D7.7.1 | `T′ ⊂ V^*(1)`; `V = E(1)`, `I = 0` | dual quotient `V/T = W`; defect `2 − 1 = 1 = dim H¹_f(ℚ_p, E)` | holds | N01 |
| 4.10c Origin vs Abhinandan Thm 1.2, ČGM Cor 3.16 | weights `≥ 0`, `K = K₀`; `H = 0` | rational (line 112), integral for nonnegative weights (line 1204); `e ≤ 46` | holds | none |
| 4.10d Origin | `p ≥ 5`; (3) for small `E` | own reduction at lines 1456–1458 | holds | none |
| 4.10e Origin vs Pham §4.5 | `Q(u) = Φ_{p^m}(1+u)` against `φ^{s−1}(q)`; cubic subfield of `ℚ_7(μ_7)` | equal at `m = s`; in Pham's range, outside the label's | label narrower | C01 |
| 4.10f Origin, headline (4) | `N = 2`, `r′ = 1`, `η = 1` | `k = 40(2 + 3) = 200`, no `η′` | holds | none |
| 4.10g Origin | Fontaine–Laffaille range, `e = 0` | length bound `e·(…) = 0` | holds | none |

- Source locators checked against the text: Pham §4.5, Def 4.17, Prop 4.18 (lines 852–878); GLS 2014 Lemma 9.3 (arXiv v4, line 2049); Cherbonnier–Colmez Th. IV.2.1 (line 875); Abhinandan 2024 Thm 1.2 (line 111); ČGM Cor 3.16 (line 1199); Bertolini–Darmon Thms 3.18, 3.21 and Lemma 2.21 (lines 816, 943, 325); Ozeki Thm 2.3 (line 209); CEGS §3.1 (line 813); Chang–Diamond Thm 7.8; GLS 2015 §5.4; Abhinandan 2024b Thm 1.2; Min 2026 abstract; Fontaine–Laffaille title page.
- Formal proof at `40e56bab`: `ChooseH`, `SpanOdd`, `SpanTwo` (`IsDualDualRep.lean`), `single_field`, `abs_odd`, `abs_two` (`ExistsElementsSelmerFormsSmallCorank.lean`), `ExtCrys` in section `Lit` of `RamifiedCoefficientChains.lean`, proved by `blochKato_ext_all`, `r_odd`, `Ranks`. The Method labels of 3.24 and 4.9a agree with them.
- Cross-roadmap citations resolved: AnabelianGeometryAndNonabelianChabauty §4.6 at the head (unchanged by the pull request); PadicHodgeRegulators §§1.5, 1.6 on main; ArithmeticGaloisDuality §D7.7.1 at the head.
- Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`.
- Automatic checks: all pass except `outside-folder` (118 files), which are the pull request's own folders named in this review's scope. Nothing outside them changes.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output. The file is unchanged and declares nothing.
- Description: this roadmap appears only in the table of published results (Step 7), consistent with the head. The family index entry now reads "Selmer presentations over group rings", which matches Layer 3.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts and LengthBoundsInPadicFamilies (main), InertAnticyclotomicCMMainConjecture (open), and searched the open heads for twist selection, lifting with loss and Selmer presentations. Nothing shared. The new *Corollary of:* lines point at their owners (AnabelianGeometryAndNonabelianChabauty §4.6, PadicHodgeRegulators §§1.5–1.6).

Source independence: changed passages only; 12 passages compared with 10 sources, none shared beyond the six-word section title of CEGS §3.1; largest share FormalProof, 89 mentions in the README, against 9 for Bloch–Kato, the source the new labels cite most (5 mentions, not readable); arrangement not compared (no layer added, removed or reordered).

Research link: Layers 3 and 4 are the Selmer-theoretic and `p`-adic Hodge inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026). They extend Bloch–Kato 1990, Mazur–Rubin 2005 and Bertolini–Darmon 1994 (determinants and derived pairings), and Wach 1996, Berger 2004, Pham 2023 and Bhatt–Scholze (Wach lattices and prismatic `F`-crystals). This rests on the README's References, Pham §4.5 and Bertolini–Darmon §3.

## Not verifiable

- Bloch–Kato 1990, §3, Prop. 3.8, Cor. 3.8.4 (4.9a, 4.9b, 4.10b, 4.10c, 4.10g): no legal copy found by the sources service.
- Kisin–Ren 2009, Thm 0.1, §2.2 (4.10e): the publisher's host is in no licence class and the EMIS mirrors returned 503 or refused the connection.
- Gras–Munnier 1998, Théorème 1.1 (3.22): no legal copy found.
- Mazur–Rubin 2005 (3.22): paywalled, and nothing on the author's preprint page could be fetched.
- Nekovář 2006 (3.22), Kurihara 2014 (3.25) and Iovita–Marmora 2015 (4.9c): no legal copy found.
- Benois–Nguyen Quang Do 2002 (4.9c) and Tate 1967 (4.9d): paywalled only.
- The Method label of 4.10b (an inequality with an arbitrary pairing) names no declaration, and I did not find one in the formal proof.
- Gee–Liu–Savitt 2014 was read in arXiv v4. Its JAMS numbering was not compared.

Automatic checks set aside as false positives: the check of files outside the folder flagged 118 files of the other roadmap folders this pull request carries, which belong to it by its scope.

## Source issues

- none

## For the human reviewers

- Licence: the formal proof's repository has no licence file at commit `40e56bab`. The new Method labels describe its proofs in prose and reuse none of its code.
- The two recorded decisions do not apply to this folder: it removes or renumbers no section.
