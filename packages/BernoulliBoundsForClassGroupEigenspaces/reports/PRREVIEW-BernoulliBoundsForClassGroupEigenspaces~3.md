# Review of BernoulliBoundsForClassGroupEigenspaces (pull request #2896 at 88fe0c8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BernoulliBoundsForClassGroupEigenspaces/`
**Verdict:** needs changes

**Summary.** Changes are needed, for one finding carried over in part from the previous round. Every published result the roadmap uses now has a correct theorem and page locator. But the statements credited to the formal proof still cite only the repository as a whole, with no commit, file or declaration. These are all of Layer 6, 9.5–9.7 and Layers 10–14, including three of the four groups of headline theorems. The other previous findings (the Soulé attribution, the Postnikov supplier, the hypotheses of 9.6) and all earlier small corrections and format notes are repaired. The repairs introduce one new small correction: the new step of the route of 9.8(a) uses Eilenberg–MacLane spectra whose owner is not cited. There are no format notes. The human reviewers still have to decide the scope question (the family's source is a formal proof announced on 20 November 2026).

## R01 (P2) — The statements credited to the formal proof still have no locator: the References cite the whole repository, with no commit, file or declaration.

Ten sections can be checked against no fixed text: all of Layer 6, 9.5–9.7 and Layers 10–14, including the headlines 10.1, 9.7, 13.1 and 14.1. So the constant `16 N^{e+2}(e+1)!` of 10.1(b), the exponent of 9.7 and the hypotheses of 13.1 rest on their route sketches alone. This is the part of the previous R01 that the repair left open.

How I know: the only citation is the References entry `[FormalProof]` (line 654). It says the repository "is the source of the statements of this roadmap that no work in this list states: Layers 6 and 10–14, 9.3 for a general number field, 9.5–9.7, and the forms of 9.2, 9.4 and 9.8 (b)…". No target names `[FormalProof]`, and the entry gives no commit. I opened the repository: `src` has nine top-level directories and a truncated listing, and `src/Supplements/Kernels/MainTheorems.lean` declares four theorems, none of them a statement of this roadmap. Five commits landed on 2026-11-21, so the link without a commit does not name a fixed text.

Smallest change: pin a commit in the References entry. At each target it covers, add the file and the declaration, for example "([FormalProof], `src/…/File.lean`, `declarationName`)". Where a target is stated more generally than the formal proof states it, say so at the target, as HeckeIdealsAndTaylorWilesRelations does at its §10.1 (see the first question below).

## C01 — The new step of the route of 9.8(a) uses the Eilenberg–MacLane spectra `Hπ` and `Hℤ`, but its *Needs* line does not cite where they come from.

The sentence added at lines 331–333 computes the stable homology of `K(π, i)` as `H_t(Hπ; ℤ) ≅ H_t(Hℤ; ℤ) ⊗ π ⊕ Tor(H_{t−1}(Hℤ; ℤ), π)`. The *Needs* line (lines 339–342) cites StableHomotopyKTheory §3.35, which is about Eilenberg–MacLane spaces, not spectra. The spectra `HA` are GeneralizedCohomology G2.7 on main, so an implementer following the *Needs* line does not find them. Adding "GeneralizedCohomology G2.7 (the Eilenberg–MacLane spectra `HA`)" to the *Needs* line of 9.8, to the Layer 9 Dependencies and to the supplier contracts would fix it. The formula itself is correct (computed in the table below).

## Questions for the author

- Does the formal proof state Layer 6 in the generality written here? HeckeIdealsAndTaylorWilesRelations §10.1, at the head of its pull request, says the formal proof has one instance only: `p` odd or `F` totally complex, with no real place in either kernel. Yet 6.17(b)–(c) state the case `ℓ = 2` with real places, and the References credit all of Layer 6 to the formal proof. I could not locate the declarations to check.
- Still open from the previous round: in 6.18(c), does the sum include the characters of `ℓ`-power order, and is `δ` one bound for all `ψ`? In 9.5, are the `j`-cycles integral or with `ℤ/ℓ^ν` coefficients?

## Previous findings

- R01 — partly repaired: locators now stand at 9.1 ("Soulé 1999, Lemma 1, p. 5"), 9.2, 9.3, 9.4, 9.8 and in the References; the formal-proof statements cite "<https://github.com/leanprover-community/riemann-hypothesis>" only (carried as R01 above).
- R02 — repaired: 9.4 now reads "The form stated here, for every `N` and with all primes, is this roadmap's"; 9.8 (b) "is this roadmap's, from 9.4 and (a)"; the Lean docstring credits only Soulé's method.
- R03 — repaired: 9.8 now needs "StableHomotopyKTheory §3.12 …, §§4.21–4.24 …, §§3.18, 3.20 (Postnikov sections and towers) and §3.35 …; AlgebraicTopology §8.3 (the Hurewicz map)"; all resolve on main. The new route step raises C01.
- R04 — repaired: 9.6 (a) has "a homomorphism `v : k^× → ℤ/q`"; (b3) has "a nonempty finite set `J`" and "`div(β)` for some `β ∈ F^×`".
- C01 — repaired: the overview says "the length of its strict form is at most that of `H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`".
- C02 — repaired: 6.17 (d) now says the kernel "lies in `H¹(Gal(F′/F), H⁰(F′, ℚ_ℓ/ℤ_ℓ(−e)))` by HeckeIdealsAndTaylorWilesRelations §10.1(f)".
- C03 — repaired: the description says the pull requests "carry versions of it that differ; they are brought to one text … before they merge".
- N01 — repaired: Quillen's computation is now cited as "GeneralAlgebraicKTheory §§13.8b–13.8c" in 9.6, the Dependencies and the contracts.
- N02 — repaired: the overview says the layer and section numbers "are this roadmap's own and are cited below without a roadmap name"; every ArithmeticKTheory section is cited with its name.
- N03 — repaired: Conventions define "`v_O` … normalized by `v_O(ℓ) = 1`"; the Bott element is now `b_ζ`.
- N04 — repaired: the description prints `H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Overview against 6.17(c) | `ℓ = 2`, `e` even, `F` real | overview: `length Ш¹_str ≤ length H²`; 6.17(c): the same, plus `r₁` for `Ш¹` | agree | none |
| Conventions `v_O` | `O = ℤ_ℓ[ℓ^{1/2}]`, `e_O = 2` | `length_O(O/π)/e_O = 1/2`; `v_O(π) = 1/2` | same units | none |
| 6.17(d) against HeckeIdeals §10.1(f) | `W = ℚ_ℓ/ℤ_ℓ(−e)`, `Σ = S_ℓ`; `ℓ ∤ [F′:F]` | §10.1(f) kernel in `H¹(Gal, W^{G_{F′}})`; that group is killed by `[F′:F]` and by a power of `ℓ`, so it is 0 | cited inclusion exists, vanishing holds | none |
| 9.1 against Soulé 1999 Lemma 1 | `Λ₀ = {(2,0),(0,2)}`, `b = 2`; `Λ₀ = {(1,1)}`, `b = 2` | torsion 4, Lemma 1 gives 4, bound `b²` = 4; torsion 1, Lemma 1 gives `√2`, bound 4 | holds | none |
| 9.2 against Gabber (Soulé 1999 Prop. 3) | complex `ℤ --2--> ℤ`, `k = 0` | `a = 1`, `b = 2`; `H₀ = ℤ/2`, order 2 ≤ `2¹` | holds | none |
| 9.3 addition | Soulé 1999 Props. 1–2 (pp. 3–4); BFEH 2014 Thm. 2.2 (p. 4) | count of Voronoi cells for `ℚ`; Ash's retract, Γ-finite stabilizers, compact quotient | locators correct | none |
| 9.4 published comparison | Soulé Thm. 1: `k ≤ N(N−1)/2`, mod primes `≤ N+1`; BFEH: `L = ℚ(i)`, `m = 2` | BFEH discards orders `≤ max(3, 6) = 6`; README `max(n+1, 2m+2) = 6` | correct | none |
| 9.4 Lean statement | `#check` after elaboration | type unchanged from the previous head; binders `L`, `N`, `m`, `1 ≤ N` explicit | unchanged; earlier probe stands | none |
| 9.6(a) with homomorphism `v` | `g = 1`; `g ⊕ h` | `0 = x^{i−1}v(1)`; `v(det(g⊕h)) = v(det g) + v(det h)` | consistent | none |
| 9.6(b3) with `J ≠ ∅` | `J = {1}`; `ℚ(√−5)`, `𝔟 = (𝔭, 𝔭)`, `𝔭² = (2)`, `β = 2` | `βI(𝔞) = I(𝔟)`, det `β`; `𝒪² ≅ 𝔭 ⊕ 𝔭`, `(det g) = (2)`, rescale by a unit | holds | none |
| 9.6 route, Bott element | degrees | `b_ζ ∈ K₂(F; ℤ/q)`, `{α} ∈ K₁(F)`: product in degree `2E+1`, as `y` | consistent | none |
| 9.8(a) new route step | `t = 1, 2`; `m = 2` | `H₁(Hℤ;ℤ) = 0`, `H₂(Hℤ;ℤ) = ℤ/2` (cofibre of `S → Hℤ`); `H₂(Hπ) = π/2`, killed by 2 | formula right; supplier of `HA` uncited | C01 |
| 9.8(b) published comparison | Soulé Thm. 2 (p. 9), `m = 3` | `K₃(ℤ) = ℤ/48`; `card₈` discards 2 and 3, so value 1 | "modulo the primes `≤ 2m + 2`" correct | none |
| References, Soulé 2003 | BFEH pp. 1–2 | `log card` bound at least `exp(α|D_F|^{1/2})`, "Proposition 4 in loc. cit." (BFEH 2014 lines 47–49) | as described | none |
| `[FormalProof]` locator | repository root, `src/Supplements/Kernels/MainTheorems.lean`, commit list | 9 directories, truncated; 4 theorems, none of this roadmap's; 5 commits on 2026-11-21 | no file, declaration or commit | R01 |
| Lean docstring | Soulé 1999 §2 | §2 is "Homology of `SL_N(ℤ)`" (p. 5); Thm. 1 mod primes `≤ N + 1` | correct | none |

The rows of the previous review for the statements this change leaves untouched stand as in the previous review, of `6b5fd75`.

- Source locators checked against a text: 14. Soule1999: p. 2, Props. 1–2, Lemma 1, Prop. 3, Thm. 1 with its proof on pp. 7–8, Thm. 2 (lines 53–54, 88–166, 175–182, 240–241, 265–272, 313–318, 343–344). BFEH2014: Thm. 1.1, Cor. 1.2, the description of Soulé 2003, Thm. 2.2, Cor. 2.3, §§3.1–3.4 (lines 28–31, 43–49, 54–55, 123–125, 137–138, 140–204). All correct.
- Cross-roadmap citations resolved for the changed text: StableHomotopyKTheory §§3.12, 3.18, 3.20, 3.35, 4.21–4.24, AlgebraicTopology §8.3, GeneralAlgebraicKTheory §§13.8b–13.8c and GeneralizedCohomology G2.7, all on main; HeckeIdealsAndTaylorWilesRelations §10.1(f) at the head of its open pull request. All of them say what is cited.
- Dependency check: `depcheck: 171 roadmaps, 2001 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the full gate shows only the two lines set aside below; every substance check passed.
- Elaboration: `lake env lean` on `Suggested.lean` gives `declaration uses sorry` as its only warning. `#check @…log_log_card_torsion_groupHomology_GL_le` gives the same type as at the previous head, matching 9.4, with no section binder lost.
- No files changed outside the folder since `6b5fd75`; the family index is unchanged.

Overlap check: read HeckeIdealsAndTaylorWilesRelations (open, §10.1), plus StableHomotopyKTheory, GeneralAlgebraicKTheory, AlgebraicTopology and GeneralizedCohomology (main) for the changed citations. The previous reading of UniformWildKernelBounds, KatoEulerSystems, ArithmeticKTheoryPartII and ArithmeticKTheory stands. Shared objects and their owners:
- the restriction-kernel inclusion of 6.17(d): HeckeIdealsAndTaylorWilesRelations §10.1(f), now cited;
- Quillen's computation for finite fields: GeneralAlgebraicKTheory §§13.8b–13.8c, cited;
- the Eilenberg–MacLane spectra: GeneralizedCohomology G2.7, not yet cited (C01).

The tools report no ids that this roadmap cites and an open pull request drops.

Source independence: changed passages only. 9 passages compared with 2 sources: the additions to 9.1, 9.2, 9.3, 9.4 and 9.8, the three References entries and the Lean docstring, against Soule1999 and BFEH2014. None shares more than a standard phrase ("up to small torsion"). The largest share is Soule1999, 12 of about 24 locator occurrences. No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 9 states torsion bounds for the homology and K-theory of rings of integers in the line of Soulé (1999, 2003), later improved by Bayer-Fluckiger, Emery and Houriet (2014). The roadmap supplies UniformWildKernelBounds in a family aimed at the Riemann hypothesis for Dirichlet L-functions. This rests on the README, the family index, Soule1999 and BFEH2014.

## Not verifiable

- Arlettaz 1991, Theorem 1.5 (9.8(a)): recorded as uncertified (paywalled). Soule1999 line 347–348 and BFEH2014 lines 145–146 cite it for the primes of the kernel; neither states the exponent `R_m`.
- Soulé 2003: the README now describes it only through BFEH 2014, and its own text was not read.
- The statements credited to `[FormalProof]`: their declarations could not be located in the repository (R01).
- Whether `Suggested.lean` agrees with a declaration of the formal proof: not checked.

Automatic checks set aside as false positives: the dependency check's note that this roadmap is not yet in the merge order (it is placed after its last supplier); the out-of-folder check on the three family-index files `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/{README.md, Suggested.lean, metadata.toml}`, which are this pull request's own.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–14) names its source as a formal Lean proof announced 2026-11-20. The References (line 654) credit Layers 6, 10–14 and 9.5–9.7 to it alone; no refereed source is cited for them.
- Licence: `Suggested.lean` was not compared with the public formalisation the family index links.
