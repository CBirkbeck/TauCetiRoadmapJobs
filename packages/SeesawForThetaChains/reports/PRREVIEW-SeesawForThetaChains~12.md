# Review of SeesawForThetaChains (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SeesawForThetaChains/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 157 changed lines since `74a09b7`. The change touches only the README. It adds origin and method labels to the 19 sections, `*Corollary of:*` lines to 6.9 and 6.10, the supplier sections those lines name, and a citation in the route of 6.2c. Thirteen references are added. The new published sources were checked at their locators (Wang, Theorem 4.5; Furusawa–Morimoto, Proposition 3.1; Haan–Kwon, Theorem 4.1), the method labels were checked against the formal proof, and the supplier sections were checked at this head. Nothing mathematical is wrong. Accepted, with three small corrections and two format notes, none blocking: the origin label of 6.13 contradicts the family's own definition, the contract for MetaplecticAutomorphicForms §3.7a (iii) drops a length bound on partitions, and the citation of Haan–Kwon does not give its setting. Nothing is left for a human to decide beyond the standing questions of scope and licence about the formal proof.

## C01 — The origin of 6.13 is labelled "this roadmap's own formulation", but the formal proof states two of its four clauses

The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 57–61) reserves this label for a statement that is neither published nor a statement of the formal proof. A reader who relies on it would conclude that the formal proof has nothing of 6.13. Yet the section cites [FormalProof] for (o) (`GlobalTheory.Core.Mi.EvalAll`) and (a) (`GlobalTheory.Core.Mi.SBes.PerLaw`), derives (b) and (c) from statements of it, and has a method label describing how it proves (b). The Labels paragraph of the Conventions has to explain the exception in a sentence of its own.

6.12, 6.14 and 6.15 are handled consistently with the definition: their label is "particular to this proof", and a clause names the part that is the roadmap's own form. The same would fit here, for example "*Origin:* particular to this proof: the unfolding of a Poincaré series over a Bessel subgroup …, the nearest published result being the classical unfolding of Poincaré series". The sentence of the Labels paragraph about 6.13 could then go.

## C02 — The contract for MetaplecticAutomorphicForms §3.7a (iii) sums over all partitions of ℓ, but the supplier sums over those with at most `min(n, d)` parts

The contract bullet (Exact supplier contracts, From MetaplecticAutomorphicForms) says the degree-`ℓ` polynomials are the vacuum character tensored with a sum of `σ_μ ⊗ σ_μ` over the partitions `μ` of `ℓ`. Read literally with `n = 1`, `ℓ = 2`, that sum contains `σ_{(1,1)}` of `U(1)`, which does not exist. The space it describes, `Sym²(ℂ^d)`, is `σ_{(2)}` alone. MetaplecticAutomorphicForms §3.7a (iii) at this head restricts the sum to partitions with at most `min(n, d)` nonzero parts. Add "with at most `min(n, d)` nonzero parts" to the bullet.

## C03 — Haan–Kwon, Theorem 4.1 is cited as "extreme cases of the exchange" without its setting, which is orthogonal–symplectic and is a nonvanishing criterion

The origin of 6.2d gives the setting of Wang's and of Furusawa–Morimoto's results but not of Haan–Kwon's, and the References describe it only as "extreme cases of the exchange of Fourier–Jacobi and Bessel periods". A reader would look there for an identity of integrals for unitary pairs. HK26 line 1561 is a different statement: for orthogonal groups and symplectic or metaplectic groups, the theta lift is nonzero and generic (the Whittaker–Fourier–Jacobi case) if and only if a Bessel period is nonzero. The unfolding identity appears only in its proof, and the paper defers unitary groups to later work (HK26 lines 486–489). The parenthesis would read "(orthogonal–symplectic and metaplectic pairs, the Whittaker case, as a nonvanishing criterion proved by this unfolding)".

## N01 — Where the change replaced the old markers by `*Sources:*`, the label is now followed by a topic in parentheses and no source

This affects 6.2a (route), 6.3, 6.4, 6.6, 6.10 and 6.13: for example "*Sources:* (Kudla's seesaw)." The works themselves are in the new origin lines. The word could be dropped, or the works named there.

## N02 — The origin labels of 6.3, 6.4, 6.9 and 6.10 name works without a theorem or page

These are Kudla (1984), Mœglin–Vignéras–Waldspurger (1987, chapters only), Howe (1979), Weil (1964), Kashiwara–Vergne (1978) and Gross (1999). By contrast, 6.2a–6.2d give theorem numbers. Would add the locators.

## Verified sound

| Statement | Instances tried | Values computed (README / source or supplier) | Result | Change |
|---|---|---|---|---|
| 6.2a origin: Wang, Theorem 4.5 | Wang's own setting | Wang line 996: integral over `LU(A)\G(A)`; cusp forms (line 434); unitary pairs only in footnote 2 (line 115) / README says the same | agrees | none |
| 6.2b origin: hook-type orbits | `λ′ = [k, 1^a] ↦ [k−1, 1^b]` | Wang §5.2 (line 1118): hook partitions relate Bessel or Fourier–Jacobi periods / README "hook-type orbits of §5.2" | agrees | none |
| 6.2c route: ThetaKernelsForUnitaryDualPairs §3.3b (a), roles exchanged | `V′₀ = V_A ⊥ L`; `V_A = 0` | supplier: "both hold likewise with roles exchanged"; `ω_{V_A⊥L,W₀} = ω_{V_A,W₀} ⊗ ω_{L,W₀}`; `V_A = 0` leaves `ω_{L,W₀}` | agrees | none |
| 6.2d origin: Furusawa–Morimoto, Proposition 3.1 | `dim V = 2n`, `G_n = U(n,n)` | `2n = 2ρ + 1 + dim V_{A′}` with `ρ = n − 1` gives `dim V_{A′} = 1`; `W = ℍ^n`, `W₀ = 0`: FJ is Whittaker | agrees | none |
| 6.2d origin: Haan–Kwon, Theorem 4.1 | `ε = 0, 1`; `k = n+ε−1, n+ε` | HK26 line 1561: orthogonal and metaplectic groups; nonzero and generic iff Bessel period nonzero / README: no setting given | imprecise | C03 |
| 6.1 labels | `ξ = 1`; all periods zero | definition by cases gives `ζ(u,1) = 1`, else `1`; the formal proof only asserts a family exists (6.15 (b)) | agrees | none |
| 6.5 method: `c_G(j)` | the double-step law | formal constant `C₁·C₂·V·W > 0` (four factors); `V`, `W` from the Fourier transform of a box indicator (`hat_box`) | agrees | none |
| 6.6 method: moving `S_j` to the front | `LinkCommutes` | `‖Sφ‖ = r‖φ‖`, `r > 0`, `s ≠ 0`, the same for all tuples / "norms times a positive constant, one nonzero constant" | agrees | none |
| 6.7 origin: chart level `p^{j+1}` versus `p^{2m}` | `1 ≤ j ≤ m − 2` | `j + 1 ≤ m − 1 < 2m`, so `Γ(p^{2m}) ⊂ Γ(p^{j+1})`: the roadmap's containment is the stronger one | agrees | none |
| 6.8 origin and method | `c_V(j)` | six factors `v_cell, s_tv(j), s_tv(j+1), c_Q, c_G, c_T`, each nonzero; the last double step has no `v_cell` | agrees | none |
| 6.9 Corollary of MetaplecticAutomorphicForms §§2.5a (i), 3.7a (iii) | `n = d = 1`; `N = 1`, `ℓ = 0, 1` | `(t,s)` acts on `z^ℓ` by `(ts)^{−ℓ}`, so a central character fixes `ℓ`; `e^{−iθ/2} ≠ e^{−3iθ/2}`; finite sum of products | deduction holds | none |
| 6.9 method: commutation | `comm` of the formal proof | difference orthogonal to all theta functions (`eq_zero_of_orthogonal_theta`), unitarity (`thPair_om_eq`), commutation with superposition | agrees | none |
| §3.7a (iii) contract bullet | `n = d = 2, ℓ = 2`; `n = 1, ℓ = 2` | `10 = 3·3 + 1·1` holds; for `n = 1`: `Sym²ℂ^d = σ_{(2)}` only, `σ_{(1,1)}` of `U(1)` undefined | wording | C02 |
| 6.10 Corollary of AdelicAlgebraicGroups §4.5a | `U(X^h)`, `U = J_ξ` | `A_G` trivial (anisotropic centre); `ι_top·c_P(ξ)/c_P(1) = s(ξ)/s(1)`, a root of unity; `c_P(ξ)/c_P(1) = [J_1:J_ξ]^{−1}·root` | agrees | none |
| 6.12 origin and method | `x = 2, y = 1, S = {2}` | `UnitRatio` holds (`r = 2`), but `2` is no root of unity: the formal form is strictly weaker; reflexivity, product, quotient and power laws are in the file | agrees | none |
| 6.13 origin | the family definition | "own formulation" means neither published nor formal; (o), (a) cited to `EvalAll` and `SBes.PerLaw` of [FormalProof] | contradicts | C01 |
| 6.14 method | the anchor pair `(φ₁, e₀)` | `b(e₀, φ₁) = κ_PF^{−1}‖P_uφ₁‖² ≠ 0` (route) / "pairing a squared `L²` norm" | agrees | none |
| 6.15 method | every rational period zero | formal proof: constant `1`; route: `B_u = 0`; 6.1 sets `ζ := 1` in that case | consistent | none |
| Labels paragraph | 6.1–6.15, 6.2a–6.2d | 19 headings, 19 origin and 19 method lines; corollary lines at 6.9 and 6.10 only | agrees | none |

- Source locators checked against the text: 5 in 3 sources: Wang (2311.14234v1) Theorem 4.5, footnote 2 and §5.2; Furusawa–Morimoto (2205.09471v2, OCR) Proposition 3.1; Haan–Kwon (2605.04389v2) Theorem 4.1.
- Formal proof, operator's local copy: 10 declarations or proofs opened behind the method labels of 6.3, 6.5, 6.6, 6.7, 6.9, 6.10 and 6.12.
- Cross-roadmap citations resolved at this head:
  - MetaplecticAutomorphicForms §§1.5, 2.5a, 3.7a;
  - AdelicAlgebraicGroups §4.5a;
  - ThetaKernelsForUnitaryDualPairs §§3.3b, 3.45, 3.46, 4.4a (§§3.45 and 3.46 are corollaries of MetaplecticAutomorphicForms §§1.5, 2.5a, 3.7a);
  - DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (a corollary of AdelicAlgebraicGroups §4.5a).
- Record: comparing the README at the merge base with the head, no heading, layer id or section is removed or renumbered; `Suggested.lean` is unchanged; neither decision of the human reviewers bears on this folder.
- Dependency check: 132 roadmaps, 1472 edges, 0 problems; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives no message. It declares nothing, so no `#check` comparison applies. The three headlines (6.2a–6.2d with 6.2, 6.14, 6.15) are named in the docstring as not statable (text unchanged).
- Automatic checks: all pass except the check of files outside the folder; every one of the 119 changed files lies in a folder or family index this pull request owns.
- The pull request's head has moved past `374b9ce` since the review was set; this review reads `374b9ce`.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, ThetaLiftsForDefiniteUnitaryGroups, BesselPoincareSeriesAndGramBounds, GluedTargetAndDivisionInequality and ThetaKernelsForUnitaryDualPairs. The change adds no object owned here. The general facts it cites have one owner each: the Fock model and compact dual pairs belong to MetaplecticAutomorphicForms, and class-set integration to AdelicAlgebraicGroups §4.5a; the family copies are marked as corollaries.

Source independence: changed passages only. 10 passages were compared with 4 sources: the origin lines of 6.2a, 6.2b, 6.2d and 6.2 with Wang and Furusawa–Morimoto, 6.2d with Haan–Kwon, and the method lines of 6.5, 6.6, 6.9 and 6.12 with [FormalProof]. Nothing beyond standard names is shared. The largest share is [FormalProof], 67 of about 80 locators. No layer was added, removed or reordered, so the arrangement was not compared.

Research link: Layer 6 of the chain in Alpöge's formal proof of GRH for Dirichlet L-functions (Announcement, 2026). Its unfolding statements 6.2a–6.2d are unitary forms of the Bessel/Fourier–Jacobi exchange under theta lifts of Wang (2025, Theorem 4.5) and Furusawa–Morimoto (2025, Proposition 3.1), which are used for the global Gan–Gross–Prasad conjecture. This rests on the README overview and the origin labels, and on those two papers as read.

## Not verifiable

- Journal data and printed numbering of Wang (J. Number Theory 271, 2025) and Furusawa–Morimoto (Math. Ann. 391, 2025): only the arXiv versions were read; a web search did not confirm the volume and pages.
- The works named without a locator in the origin labels of 6.3, 6.4, 6.9 and 6.10 (Kudla 1984 and 1994, Harris–Kudla–Sweet 1996, Mœglin–Vignéras–Waldspurger 1987, Howe 1979, Weil 1964, Kashiwara–Vergne 1978, Gross 1999): not opened, there being no locator to check.
- Gan–Gross–Prasad (2012), cited for 6.2c without a locator: fetched (arXiv 0909.2999), but there was no locator to compare.

Automatic checks set aside as false positives: the check of files changed outside the roadmap folder flags the other roadmap folders and the two family indexes that this pull request changes, all of which the review names as the pull request's own.

## Source issues

- none

## For the human reviewers

- Scope: the main source is still [FormalProof], an unrefereed Lean development announced on 20 November 2026 (Announcement). The change adds published sources for 6.2a–6.4, 6.9 and 6.10 (Wang 2025, Furusawa–Morimoto 2025, Kudla 1984, Mœglin–Vignéras–Waldspurger 1987, Gross 1999).
- Licence: the family index (line 20) says the formal proof was published without a licence. This README cites its file paths and declaration names only, with no text.
- Decisions: neither recorded decision applies to this folder, which removes no section and hands none to another roadmap.
