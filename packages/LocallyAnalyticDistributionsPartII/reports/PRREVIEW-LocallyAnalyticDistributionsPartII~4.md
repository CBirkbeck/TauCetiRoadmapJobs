# Review of LocallyAnalyticDistributionsPartII (pull request #2283 at d658fa3)

**Verdict:** accepted

Incremental re-review of the 20 lines changed since `0411614`. No finding.

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- R01 — repaired: `README.md:32` now reads “K is any complete discretely valued extension of ℚ_p … When L is used, ℚ_p ⊆ L ⊆ K and L/ℚ_p is finite”; the Cohen-ring Check is at `README.md:434`.
- R02 — repaired: `README.md:310` now reads “g any finite-dimensional E-Lie algebra. Choose a bracket-stable o_E-lattice g₀”; germ duality and congruence-subgroup comparisons (`README.md:314–316`) carry the algebraic-group hypothesis; nonalgebraic Check at `README.md:328`.
- R03 — repaired: `README.md:212` now uses “The Banach space c₀(ℕ, K) of sequences tending to zero, with the supremum norm” and the constant system M_n = c₀(ℕ, K).
- R04 — repaired: `README.md:255` now cites “§3.7 Definition, Lemma and Corollary, pp. 14–17”.

## Verified sound

| Statement | Instances tried | Computed value | Comparison value | Result / change |
| --- | --- | --- | --- | --- |
| Convention 1 (fields) | K = Frac of Cohen ring of 𝔽₃(t); K = ℚ₃(√3) | v(3) = 1, residue transcendence degree 1; e = 2 | both complete, discretely valued, characteristic 0 | Both admitted; no remaining ℂ_p requirement in the README |
| §1.4 Check, Banach negative control | c₀(ℕ, ℚ₃), partial sums Σ_{i≤N} 3ⁱe_i | tail norm 3^{−(N+1)} → 0; limit (3ⁱ) ∈ c₀ | A_n = K: K ⊗_K c₀ = c₀, transitions identity; e_i independent | Banach, coherent-looking, not finitely generated: control discriminates |
| §2.1 locator | AW13 §3.7 | Lemma at AW13 lines 755–762 (p. 16); Corollary at lines 767–769 (p. 17) | cited pp. 14–17 | Agrees |
| §2.5 definition at general g | SCHM13 lines 196–228 | arbitrary finite-dimensional Lie algebra, PBW sup-norms, Propositions 3.2.1 and 3.2.3 | README: any finite-dimensional E-Lie algebra with bracket-stable lattice | Source supports the generality |
| §2.5 rational-radius lattice | r = \|a\|, a ∈ E′; a = π_E^{−j} | \|a⁻¹x\|_r = r⁻¹·r = 1; [a⁻¹x, a⁻¹y] = a⁻¹·(a⁻¹[x,y]), \|a⁻¹\| ≤ 1 | at r_j: a⁻¹g₀ = π_E^j g₀, the stage of the preceding sentence | Unit ball and bracket-stability agree |
| §2.5 nonalgebraic Check | [x,y]=y, [x,z]=αz, α²=10 in ℤ₃ | 10 ≡ 1 mod 3 so α exists, \|α\| = 1; Jacobi sum = −α[y,z] + [z,y] = 0; \|[x,z]\|_r = r | r ≤ r² for r ≥ 1; toral subalgebras have dimension ≤ 1, torus weights would give rational ratio, but α ∉ ℚ | Lattice bracket-stable, norms submultiplicative, algebra not algebraic |
| §2.5 *Needs* line | abelian g = E·x, g = 0 | envelope = entire series; E | neither uses a group or §1.1 | “§1.1 (the algebraic-group comparisons only)” is accurate |
| §3.6 Cohen-ring Check | C strict Cohen ring of 𝔽₃(t) | uniformiser 3, so K′ = K, [K:K′] = 1, e = 1 | K ⊗_K K[[G]] = K[[G]]; residue field of ℂ₃ is 𝔽̄₃, algebraic over 𝔽₃, t transcendental | Identity comparison; no valued embedding into ℂ₃ |

Rows for untouched statements stand as in the previous review, of `0411614`.

- Source locators checked against the text: 3 (AW13 lines 755–769; SCHM13 lines 196–230; AW14 lines 634–637). Of the seeded sample, §1.4 and §2.1 fall in changed passages and were checked; no locator is flagged unverified.
- Statements of `Suggested.lean` changed: 0; its docstring line on the envelope (`Suggested.lean:48`) is consistent with the general §2.5. Elaboration with `lake env lean`: 2 `sorry` warnings, nothing else.
- Cross-roadmap citations in changed passages: 1 (DeformationAndDerivedPatchingAlgebra §1.10, strict Cohen rings of a characteristic-p field, covers 𝔽₃(t)); internal references resolved: Source corrections item 13 (`README.md:781`), §§1.1, 1.4, 2.1.
- Gate at `d658fa3`: every check 0, `OK`; worker's targeted build passes.
- Dependency check: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull-request text: the description states the general coefficient field, the general Lie algebra of §2.5 and the algebraic-group hypothesis on the germ and congruence-subgroup comparisons; new folder, 911 insertions, 4 declarations, no outside-folder change. No sentence contradicted by the head.
- Deferred D01/D02 re-read: RelativeFarguesFontainePartII §8.4 at its open head (`README.md:1763`) still constructs the general Fréchet–Stein interface.

Overlap check: read LocallyAnalyticRepresentationsOfLocalGroups, LieHighestWeight, LocallyAnalyticDistributions, CompletedCohomologyPartII, PadicFamiliesPartII (as in the previous review; the change adds no object); nothing newly shared. The general Fréchet–Stein interface remains recorded as D01/D02. No second copy, conflicting head or dropped cited id.

Source independence: changed passages only: 5 passages compared with 3 sources (SCHM13, AW13, AW14), none shared; largest share FU24, unchanged from the previous review; no layer added, removed or reordered, so contents not compared again: independent.

## Not verifiable

- SCH11: settled uncertified; not cited by the changed passages.
- DDMS99, FROM03, MR01, DG70: settled waived; not cited by the changed passages.

## Source issues

- **Error** in SCHM13 at proof of Proposition 3.2.1, p. 6, line 213: the source says every chosen PBW basis gives submultiplicative norms for all r>1; it should be a basis with integral structure constants, or radii sufficiently large; affects the proof.
- **Gap** in SCHM13 at the remark following Proposition 3.2.3, p. 6, line 230: the source says every single-radius completion is noetherian and flat; it should be justified beyond p^ℚ, or restricted to radii in p^ℚ; affects a stated result.

## For the human reviewers

- BCGP25 is an arXiv preprint (`TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:792`); FROM03 is an unpublished, waived primary text. The envelope and Frommer assertions also cite refereed SCHM13, ST02 and KOH07.
- The legal-text exceptions SCH11, DDMS99, FROM03, MR01 and DG70 retain their settled uncertified/waived status; their original wording and printed locators were not independently certified.
