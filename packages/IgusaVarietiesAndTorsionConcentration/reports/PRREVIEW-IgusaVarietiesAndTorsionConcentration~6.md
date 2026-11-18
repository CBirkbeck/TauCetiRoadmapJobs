# Review of IgusaVarietiesAndTorsionConcentration (pull request #1090 at 24ecf8d)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 37 lines changed since `25763ac`, and no finding remains. Statement (3) of 3.4 now says upper semicontinuous, in agreement with (4) and with the `GL₂` Check, and 7.2 keeps only the predicate and its formal properties, with the scope section saying that the implication from decomposed genericity is not proved here. The five small corrections and two format notes of the previous report are all made, and the changed locators were read in the sources. There are no small corrections and no format notes; two points stay deferred to other roadmaps, and nothing is left for a human to decide.

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- R02 — repaired: "`(3) x ↦ b(x)` is upper semicontinuous on `|Fℓ_{G,μ}|` for the order of 0.2: for every `b` the set of `x` with `b(x) ≽ b` is closed" (line 1466); the locator notes the source's "lower".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.2 split decomposition indexed by `W` (sampled, changed) | `p` completely split; `F` imaginary quadratic; `F = F⁺F₀` | `[F⁺:ℚ]` places of `F⁺` over `p`, each with two places `w, w^c`; one each gives `[F⁺:ℚ]` factors `GL_{2n}(ℚ_p)`; places over one `𝔭 ⊂ F₀` are such a set | agrees |
| 0.6 pointer to the Check of 0.4 | third Check of 0.4, `n = 1`, `F` imaginary quadratic | `T_{2,v}·T_{2,v^c} = 1` in `𝕋^S`, `U_q` only in the full ring; that Check is the third | agrees |
| 3.4 (3) upper semicontinuity | `GL₂`, `μ = (1, 0)`; (3) against (4) | `{b(x) ≽ ordinary} = ℙ¹(ℚ_p)` closed; `{b(x) ≼ basic} = Ω` open, not closed; cs17 line 1654 prints "lower", lines 1672–1678 have `Fℓ^{≽b}` closed | agrees |
| 3.16 locator for (2) and the stalk formula | cs17 p. 728 | rank-one reduction, `𝒮^b` fibre quasicompact open with the same rank-one points, stalk formula at cs17 lines 3180–3187; Lemma 4.4.2 at line 3159; Theorem 4.4.4 follows at line 3236 | agrees |
| 5.2 Poincaré duality without the removed setting | finite basic leaf, `d_b = 0`; hypotheses used | `RΓ_c = RΓ` finite free in degree 0, dual with no shift; statement uses only smoothness, `ℓ ≠ p`, and the `𝕋^S_full` action defined in 1.7 (`S ⊃ {p, ℓ}` and bad primes) | agrees |
| 6.6a normalization, reciprocal roots | `r = 1, q = 3, U₁ = 2`; `r = 2, q = 2, U = (3, 5)` | `1 − 6X`: reciprocal root `6`, `6/3 = 2`, root of `Y − 2`; `1 − 6X + 40X²`: reciprocal roots `3 ± √−31`, twice `(3 ± √−31)/2`, the roots of `Y² − 3Y + 10` | agrees |
| 7.2 predicate and its *Needs* | `N = 1`; field extension `κ → κ′`; the three suppliers | `N = 1`: no `i ≠ 0`, vacuous; `ker φ` unchanged and `(H ⊗ κ′)_𝔪 = H_𝔪 ⊗ κ′`; ltxzz lines 9474–9483; supplier sections exist on main | agrees |
| Scope paragraph on the implication of 7.2 | ltxzz Definition D.1.2, Proposition D.1.3 and its proof | distinct nonzero roots, no ratio `‖w‖` (lines 9485–9488); `𝔽̄_ℓ`, `F⁺ ≠ ℚ`, `w ∉ Σ⁺ ∪ Σ⁺_ℓ` split (9492–9499); Hodge-type datum `G × T`, its Igusa varieties, modified trace identity (9505–9574) | agrees |
| 7.7 without `F⁺ ≠ ℚ` | `n = 1`, `F` imaginary quadratic; csnc Theorem 1.1 and Remarks 1.6–1.7 | boundary system `ρ₁ε⁻¹ ⊕ ρ₁^{c,∨}`, exponents `1 − 2 = −1` and `0`, reducible; condition (i) is `F⁺ ≠ ℚ` (csnc line 196), Remark 1.7 removes (i) and (ii) (lines 256–258) | agrees |

The rows for the untouched statements stand as in the previous review, of `25763ac`.

- Source locators checked against the text: 6, in cs17 published (Proposition 3.5.7, Corollary 3.5.9, the argument on p. 728), csnc (Theorem 1.1, Remarks 1.6 and 1.7, p. 6) and ltxzz (Definitions D.1.1, D.1.2, Proposition D.1.3 and its proof, arXiv v3 pp. 171–173).
- Library declarations opened at the pins: none; the change touches no library name and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: EndoscopicTransferAndUnitaryTraceComparison §13.1 (standard definite and one-place-indefinite spaces, the abelian-type `Sh(V, K)` of `Res_{F⁺/ℚ}U(V)`, line 5044 of its README on main), ShimuraVarieties §6.7 (canonical models of abelian type, line 1897, on main), SmoothRepresentationsOfLocalGroups SR.1 (Hecke algebras over rings, line 1042, on main); the sections the new consumers sentence attributes to IgusaVarietiesAndTorsionConcentrationPartII, PotentialAutomorphyInfrastructure and SelmerIwasawaCohomologyPartII were matched against those roadmaps at their open heads.
- The small corrections and format notes of the previous report: C01 made (5.2 at line 2014, 7.7 at line 2130 and the Summary), C03 made (line 1662), C04 made (lines 2044, 2050, 2051), C05 made (line 79), N01 made (line 215), N02 made (line 2299); C02 is D02. No phrase of the removed trace-comparison setting remains in the README.
- Dependency check: `depcheck: 200 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks at this head: all passed. `lake env lean` on `Suggested.lean`: no output. The file declares nothing, so there is no signature to compare and no one-tactic probe to run. No file is changed outside the folder.
- The pull request's title and description were read against this head: no sentence is contradicted, and the change since `25763ac` removes or renumbers no section and no declaration.

Overlap check: read IgusaVarietiesAndTorsionConcentrationPartII, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII (scope sentences bearing on the change); shared: the Shimura varieties `Sh(V, K)` of `Res_{F⁺/ℚ}U(V)` (owner EndoscopicTransferAndUnitaryTraceComparison §13.1 with ShimuraVarieties §6.7, cited); the compact concentration theorem (owner Part II, which cites 4.5, 5.1, 5.2, 5.5 here); the remaining shared objects as in the previous review.

Source independence: changed passages only; 6 passages compared with 3 sources (cs17, csnc, ltxzz), none shared; largest share csnc, as in the previous review (81 of about 204 locators); the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: Layer 7 states Koshikawa's local and global generic vanishing (2021), which removes the hypotheses of Caraiani–Scholze (2017, 2019) and is the input to Caraiani–Newton (2023) for modularity over imaginary quadratic fields and to potential automorphy over CM fields (Allen et al., 2023); rests on kos21, cn23 and the README.

## Not verifiable

- The published pagination of ltxzz (Definition D.1.2 and Proposition D.1.3 on p. 365, the proof on pp. 366–368): only the arXiv version was read, where they are on its pp. 171–173.
- kos21 was not reopened for the indexing of the split decomposition in 0.2; the statement was computed directly.
- The description's generated `depends-on` and `merge-order` blocks are outside the check of the text.

Automatic checks set aside as false positives: the lead that the citation "IntegralHeckeAndGaloisDeterminants Layer 3" in the *Needs* line of 5.1 resolves nowhere; the line reads "Layer 3a", a layer that exists on main.

## Source issues

- **Misprint** in cs17 at Proposition 3.5.7(1), p. 689: the source says the Newton map on the flag variety is lower semicontinuous; it should be upper semicontinuous for the order of its p. 677, as its Corollary 3.5.9 has the upper unions closed; affects a stated result.

## For the human reviewers

- none
