# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at 47ed7fa)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 120 lines changed since `141d7bd` finds no new defect, and every point of the previous report that can be settled inside this folder is repaired correctly (the request for the auxiliary-place lifting theorem is now stated with the hypotheses of Thorne 2024 Theorem 7.5, the Hecke map of the Steinberg problem in §11.9 is taken from the right supplier section, and the locators in §6.9 are right). The one earlier finding, that this roadmap and its parent supply each other, is on record as settled only by a change to ModularityAndLanglandsExtensions and is not counted here; this README no longer claims to prove any section of the parent. There are no small corrections and no format notes; two points are left for the human reviewers.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01)
- C01 — repaired: "What PotentialAutomorphyInfrastructurePartII must provide (gap:auxiliary-place-reducible-lifting): in Layer 8, beside … (§8.16), its lifting form, Thorne 2024 Theorem 7.5 (th24 p. 44; proof, p. 45)", with full hypotheses.
- C02 — repaired: "for the Steinberg problem `𝒮′_{F_2}` the map `P_{𝒮′_{F_2}} → 𝕋_{F_2}` is the map `η` of the ANT set-up of PotentialAutomorphyInfrastructurePartII Layer 8, with `B = T_{F_2}`"; the *Needs:* line cites it.
- C03 — repaired: "Proposition 6.7 and Corollary 6.6 give its Hecke eigensystem, and Corollary 6.8 (with Lemma 6.9) reduces its Iwahori-spherical local constituents at `ṽ_0`".
- C04 — repaired: the description now says "Five contracts are requests for statements their supplier does not make yet, and the roadmap is conditional on them", names each, and the parent is no longer under Downstream consumers.
- N01 — repaired: "Layer and section numbers are identifiers, not a count: the layers are 6, 9 and 11–14, Layer 6 has the single section §6.9, and Layer 13 has no §13.9".
- N02 — repaired: "for a set `T` of finite places `F(T)` is the maximal abelian extension of `F` of exponent two unramified at every finite place outside `T`, the real places being allowed to ramify".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Request `gap:auxiliary-place-reducible-lifting` (supplier contracts; used in §§11.6, 13.8) | th24 Thm 7.5 (1)–(7) against the sentence; `𝔽_7`, `q_w = 3`, `Φ = diag(1, 2)`; `n = 1` | all seven conditions present (`p ≥ 5` as `l > 3`, `l ∤ n`); eigenvalues `3, 3, 6, 5 ≠ 1`; `n = 1`: `H⁰ = 0` iff `q_w ≢ 1` | equals th24 lines 1965–1983 plus the `l`-power clause of supplier §8.16; supplier has finiteness only, so not already provided |
| §11.9 Hecke maps (changed sketch) | the two Hecke algebras of nt26 p. 23 | `𝕋_{F_2}`: `S(B) = T_{F_2}`, `R = ∅`, `S_a = T′_{F_2}`; `𝕋_{F_3}`: `S(B) = ∅`, `R = T_{F_3}`; `|T_{F_2}|` even | equals nt26 lines 1071–1089; supplier set-up has `η : P₁ → 𝕋₁`, Steinberg at `B`, `|B|` even for even `n` |
| §6.9 proof sketch (changed locators) | th24 statements 6.6–6.9 and proof of 6.11 | 6.6, 6.7: eigensystem of `(ρ_1 ⊗ ψ) ⊕ ρ_2`; 6.8: Iwahori-spherical subquotients `π_n`, `π_{n_1,n_2}`; 6.9: a lemma | equals th24 lines 1602–1690, 1719, 1813–1819 |
| §13.1 definition of `F(T)` (added) | `F = ℚ`, `T = ∅`, `{2}`, `{3}`; `F = ℚ(√3)`, `T = ∅` | `ℚ`; `ℚ(i, √2)`; `ℚ(√−3)`; `ℚ(√3, i) ≠ F` although `h(ℚ(√3)) = 1` | equals nt26 lines 1798–1800 and ArithmeticGaloisDuality §R02.3.5; the clause on real places is needed |
| Opening and Scope: `SP_n` and `n ≤ 5` come from the parent | parent §§1.12, 1.15 at its open head | §1.12 defines the proposition `SP_n`; §1.15 proves `1 ≤ n ≤ 5` | as cited |
| §12.7, §13.6, §13.10, §§14.1–14.3 (a sentence removed from each) | the statement before and after the change | hypotheses (1)–(9) of §12.7 and the conclusions unchanged; only "This proves ModularityAndLanglandsExtensions §…" removed | no statement changed |

The rows for the untouched statements stand as in the previous review, of `141d7bd`; the change touches neither `Suggested.lean` nor any hypothesis of a target.

- Source locators checked against the text: 7 in the changed passages (th24 Corollary 6.6, Proposition 6.7, Corollary 6.8, Lemma 6.9, Theorem 7.5 with p. 44 and proof p. 45; nt26 p. 23; nt26 p. 38); all at the cited places.
- Cross-roadmap citations resolved in the changed passages: PotentialAutomorphyInfrastructurePartII "The ANT set-up", §3.10 (its Check excluding Steinberg choices) and §8.16 at its open head; ArithmeticGaloisDuality §R02.3.5 on main; ModularityAndLanglandsExtensions §§1.12, 1.15, 4.2 at its open head.
- No citation of the parent's §§4.9, 4.12, 4.20, 4.23, 4.29, 4.30, 4.34–4.37 remains in the README; the parent's head still routes those sections through §§12.7, 13.10, 14.2, 14.3 here (D01).
- Requests to suppliers: 5 used, each with its sentence "What … must provide" under the supplier; the three suppliers the description says are on main (GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra, FiniteFlatGroupsAndIntegralPadicHodgeTheory) are.
- Dependency check: `depcheck: 216 roadmaps, 2335 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean`: `sorry` at lines 93 and 112 the only warnings; the file is unchanged since `141d7bd`, the four elaborated types equal §§14.4–14.5, no binder lost; no `set_option`, no sorry'd data.
- Automatic checks: all passed; no change outside the roadmap folder. Title and description read against this head: nothing contradicted, nothing a reader needs left unstated.
- Overlap check: read PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, ModularityAndLanglandsExtensions, PotentialModularityAndCompatibleSystems, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings, GL2AutomorphicRepresentationsAndTransfer (scopes as read for the previous review; the changed passages against the first and third again); shared: `SP_n` for all `n`, tensor functoriality lifting and the endpoints over `ℚ` with ModularityAndLanglandsExtensions, owner this roadmap once the parent drops them (D01); nothing else shared.

Source independence: changed passages only: 5 passages compared with 2 sources (th24, nt26), none shared beyond a list of hypotheses and a one-line definition that can be written one way; largest share nt26, as in the previous review (43 of 83 locators, plus the two the change adds); no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 11–13 prove Newton–Thorne 2026 (Theorems 3.2, 4.1, 5.5, 5.9, 6.4), symmetric power functoriality for Hilbert modular forms, with Thorne 2024 level raising (Layer 6) and Newton–Thorne 2021 II patching (Layer 9); Layer 14 gives Newton–Thorne 2021 I Theorems A, B, E. Rests on the sources read.

## Not verifiable

- bbm82 Théorème 3.1.1 and kw09 Proposition 9.3: cited by locator only, texts not readable.
- The published pagination of nt26 (Ann. of Math. 203): the README cites the arXiv v2 pages, which is what was read.
- The content of supplier sections other than those named above was not read again in this round.

## Source issues

- none

## For the human reviewers

- The parent ModularityAndLanglandsExtensions, at its open head, still states §§4.9, 4.12, 4.20, 4.23, 4.29, 4.30 and routes them through §§12.7, 13.10, 14.2, 14.3 here; this acceptance leaves that to the parent's pull request, as the description says.
- The board's plan for this roadmap declares 14 requests to suppliers; the README at this head uses 5. The other 9 (among them Deligne–Lusztig transfer, Mœglin's packets, equivariant K-theory of the Steinberg variety) belong to routes the text no longer contains.
