# Review of PadicFamiliesPartII (pull request #2280 at 9138f8f)

**Verdict:** accepted

No finding. Incremental re-review of the 31 lines changed since `c64e881`.

## Previous findings

- R01 — repaired: `README.md:612` "The moduli problem of gap:hilbert-siegel-models is that of the subgroup G of `G₁` … so `p ∤ |Δ|` is a hypothesis of the statements on integral or torsion cohomology of `X_{G₁,…}`"; `:635` and `:1578` follow.
- R02 — repaired: `README.md:7` "So is the intertwining from which those ranges follow … (HigherHidaAndColemanTheory §9.6, item 4; AIP15 Proposition 7.2.3, p. 34 …) … its case `F = ℚ`, `I = {p}` is that item"; `:120`, `:963`, `:1573` agree.
- R03 — repaired: the cuspidal clause is deleted at `README.md:483` and `:496` ("is the analytification of a section of `ω^κ` on `X_Iw × Spec K` (BPS Theorem 5.3.1, HAL p. 31)") and its Check is deleted.
- R04 — repaired: `README.md:15` "HodgeTateAndCanonicalSubgroups §§0.6–0.8, 0.14–0.16, 0.28, 5.1, 5.5, 5.8", "ShimuraCompactifications §§4.1, 4.3, 4.10, 6.12, 6.16–6.17, 7.16, 7.19–7.22, 7.25", "AutomorphicBundles §§5.3, 5.4, 11.16, 12.1, 12.11", "AutomorphicFormsOnReductiveGroups §§6.5–6.6".
- R05 — repaired: the description reads "On main: AdicSpacesPartIII, SchemeAndStackFoundations, SmoothRepresentationsOfLocalGroups and PadicMeasuresIwasawaAlgebras."
- R06 — repaired: `README.md:655` "BCGP21 §4.5, pp. 99–105"; `:690` "BCGP21 §4.2.30, pp. 92–93; Lemma 4.2.31 and Proposition 4.2.33, p. 93".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Layer 4 standing hypotheses, descent from G to `G₁` (`:612`) | `Δ = ℤ/p` on `𝔽_p[Δ]`; `Δ = ℤ/2`, `p = 3`; p inverted | invariants `𝔽_p·N`, augmentation of N is `p = 0`: no summand; `e = (1+σ)/2` idempotent in `ℤ₃[Δ]`; `e = N/|Δ|` exists | hypothesis on the `G₁` side, as BCGP21 lines 2032–2037, 2409–2417, 2765–2769 | none |
| gap:hilbert-siegel-models contract (`:137`) | which group carries the moduli | BCGP21 lines 2032–2035: G has the PEL moduli, `G₁` is of abelian type; lines 2326–2328: the `G₁` space is the quotient | agrees | none |
| §4.2 universal coefficients, descent sentence (`:635`) | `p ∤ |Δ|`; `p | |Δ|` | direct factor of deck invariants; Check at `:651` gives the non-summand `𝔽_p·N ⊂ 𝔽_p[ℤ/p]`; BCGP21 lines 4824, 4849–4851 (p. 99) | agrees | none |
| §5.7 against HigherHidaAndColemanTheory §9.6, item 4 (`:7`, `:120`, `:963`) | `k = 4`; eigenlines `θe = f` | `−3 + 5 = 2 = k − 2`, `0 + 5 = k + 1`; supplier line 1652 has `d1∘U=p^(k+1)U∘d1`, eigenvalue `p^(−k−1)λ`; here `β = p^{−m_v}α`, `m_v = k + 1` | same identity, same direction | none |
| §§2.8–2.9 classicality without the cuspidal clause (`:483`, `:496`) | modular curve; Siegel threefold `k₂ = 3`; `E_k(z) − E_k(pz)` | `s < k − 1`; `s < 0`: none; slope `k − 1` is outside; BPS lines 1331–1337 conclude a section of `ω^κ` only | statement equals the source's | none |
| §2.7 locator "§4.5, HAL p. 26" (`:471`) | printed page of the direction-by-direction extension | BPS lines 1122–1131, printed p. 26: from `]d_i a_i − 1, d_i a_i]` to `[0, d_i a_i]`; §5.1 (line 1282, p. 30) is compactifications | corrected locator is right | none |
| §4.1 locator "§4.1, pp. 75–77" (`:616`) | section bounds | BCGP21 line 3646 (p. 75) to line 3747 (p. 77, start of §4.2) | agrees | none |
| §4.3 and §4.5 page locators (`:655`, `:690`) | headings | BCGP21 line 4852 on p. 99; line 4472 on p. 92; lines 4535 and 4570 on p. 93 | agrees | none |

The rows for untouched statements stand as in the previous review, of `c64e881`.

- Source locators checked against the text: 14 in the changed passages (BCGP21 12: §3.3, Lemmas 3.5.2–3.5.3, §3.7.2, Proposition 3.8.3, Lemma 3.8.5, §4.1, §4.2.30, Lemma 4.2.31, Proposition 4.2.33, §4.4.2, Proposition 4.4.3, §4.5; BPS 2: §4.5, Theorem 5.3.1); 0 wrong. The sampled targets §4.1 and those touching the diff are covered; the rest of the sample lies in untouched text.
- Cross-roadmap citations resolved: HigherHidaAndColemanTheory §9.6, item 4 (line 1652 at `b82e0be`); the 10 HodgeTateAndCanonicalSubgroups, 6 ShimuraCompactifications and 2 AutomorphicFormsOnReductiveGroups headings named in the changed Scope sentence; PELModuli §M4.5, §M5.4. 0 missing. Every section the Scope sentence lists for the four suppliers of R04 occurs in a contract or *Needs* line (2 to 11 occurrences each).
- Library declarations: none in the changed passages.
- Gate at `9138f8f`: every counter 0, build passed. `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- `lake env lean` on `Suggested.lean`: exit 0, no warning; 0 declarations (unchanged since `c64e881`), so no signature comparison and no one-tactic probe.
- The pull request's title and description were read against this head: no sentence contradicted; the four roadmaps named "On main" are on main; the diff removes no section, headline or supplier.
- Remark: §2.9 has two Checks after the deletion; it is a theorem, not a definition.

Overlap check: read HigherHidaAndColemanTheory at `b82e0be` (§9.6 and its Downstream consumers); AutomorphicBundlesPartII, GSp4NonregularModularityLifting, AlgebraicModularFormsAndSerreWeightsPartII and OverconvergentAutomorphicForms are not touched by the diff and stand as read at `c64e881` (no roadmap on main is listed as close). Shared: the Klingen BGG intertwining for `F = ℚ`, owner HigherHidaAndColemanTheory §9.6, item 4, now cited as such; `C_r`, owner AlgebraicModularFormsAndSerreWeightsPartII §7.5; general analytic coefficient sheaves, owner OverconvergentAutomorphicForms §8.6.

Source independence: changed passages only: 4 passages (`README.md:471`, `:612`, `:635`, `:1578`) compared with 2 sources (BCGP21, BPS), none shared; largest share BCGP21 (92 of 245 locators at `c64e881`, the diff adds five); the diff adds, removes or reorders no layer, so the contents comparison with BCGP21 stands: independent.

## Not verifiable

- The README's Source issues for P20 (Corollary 14.6.2, Proposition 15.2.4.1) and for BCGP21 Lemma 4.6.16: untouched by the diff, not read again at this head.

## Source issues

- **Error** in BCGP21 at Lemma 3.8.5, p. 58: the source says the functions on a finite étale Galois cover split as the base functions plus the augmentation part, for every group; it should be assumed that the group order is invertible on the base; affects a stated result.

## For the human reviewers

- **Scope.** Layers 7–9 rest on BCGP25, arXiv:2502.20645v1, with no journal reference: 90 of the 245 locators (`TauCetiRoadmap/PadicFamiliesPartII/README.md`, References). The other principal sources are published.
- **Licence.** P20 is read from an author PDF and BPS from the HAL deposit; their page conventions are in the References. No passage, table or figure is reused.
