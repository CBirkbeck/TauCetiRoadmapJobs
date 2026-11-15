# Review of HabiroCohomologyFoundationsPartII (pull request #1466 at fefa1f2)

**Verdict:** accepted

Incremental re-review of the 38 lines changed since 61e97fe (19 insertions, 19 deletions, all in `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md`; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder). The change moves ownership of the spherical lifts of perfect p-complete δ-rings to RefinedTraceMethods §6.1 (§0.1 keeps sphericalPerfection, the completed étale lifts and relativeFormalEtaleLift), and updates the pin hashes and five Mathlib line locators. No finding.

## Previous findings

The previous report (at 61e97fe) was an acceptance with no finding, so there is nothing to account for.

## Verified sound

| Statement (changed) | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Supplier contract, README line 90: import of S_B from RefinedTraceMethods §6.1 “Spherical lifts of perfect δ-rings” | supplier README at its open head 91f73dc, lines 2553–2576 | Supplier states: S_B flat over S_p, marking `S_B⊗_{S_p}Hℤ_p≃B`, `Map(S_B,R)≃Hom(B/p,π₀R/p)` for p-complete connective R, full faithfulness, `S_C→S_p` over x ↦ p. Every imported clause is there. | Citation resolves; nothing imported that the supplier does not state. |
| sphericalPerfection route, line 146: `S_{A_∞}` → colimit is an equivalence | A = ℤ_p; A = ℤ_p⟨x⟩; A = 0 | π₀(colim) = π₀(colim ⊗_{S_p} ℤ_p) = A_∞, so the universal property applies at id of A_∞/p; Hom(W(k),W(k)) = Hom(k,k) forces the reduction to be id; connective cofibre with zero ℤ_p-reduction is 0. ℤ_p: colimit S_p; 0: both sides 0. | Route sound; uses only the imported universal property and KU Lemma A.1's colimit. |
| relativeFormalEtaleLift, added sentence, line 148: T = S_p, C perfect gives U_C = S_C | C = ℤ_p; C = `ℤ_p⟨x^{1/p^∞}⟩` | `(S_p⊗_Sℤ)^∧_p` = ℤ_p = A₀; C⊗ᴸ𝔽_p = C/p perfect, so L = 0 mod p, hence completed L = 0; `(S_C⊗_Sℤ)^∧_p` = `S_C⊗_{S_p}ℤ_p` = C, the marking required of U_C. | Hypotheses of the theorem hold; the two lifts agree by the mapping-space equivalence. |
| Check sphericalPerfection at p = 2, 3, line 161 | A = ℤ₂, ℤ₃, 0, ℤ_p⟨x⟩ | π₁S₂ = ℤ/2; π₁S₃ = 0 and π₃S₃ = (ℤ/24)₃ = ℤ/3; π_n(Hℤ_p) = 0 for n > 0. Modulo p, `𝔽_p[x^{1/p^N}]` has exponents in p^{−N}ℤ, so `x^{1/p^{N+1}}` is outside. | Check correct; it excludes Hℤ_p and the identity of S_A. |
| Check “Perfect inputs over the sphere”, line 163 | p = 2, C = `ℤ₂⟨x^{1/2^∞}⟩` | π₁S_C = π₁S₂⊗C = C/2 ≠ 0. π_*(Hℤ⊗_SHℤ) = ℤ, 0, ℤ/2 in degrees 0, 1, 2; C is ℤ-flat, so π₂(HC⊗_Sℤ) = C/2, unchanged by 2-completion; the marking needs a static C. | HC fails the marking, as stated. |
| Check “Specialization map”, line 337, and Moore-tower compatibility, line 336 | x ↦ p and x ↦ 0; α = 2 | Reductions C → ℤ_p differ at x by p ≠ 0 (modulo p they differ at δ(x): δ(p) ≡ 1, δ(0) = 0). `S_C/x^α⊗_{S_C}S_p` = cofib(p^α) = S_p/p^α, against cofib(0) = S_p ⊕ ΣS_p. | Two distinct imported maps; only x ↦ p gives a Moore spectrum. Agrees with the supplier's own Check. |
| quotientLift_perfected, line 323 | B_∞ perfect p-complete | Former “unique p-complete connective E∞-lift” is now the supplier's S_{B_∞}; the supplier's hypothesis (perfect, p-complete δ-ring) is the one stated here. | Same statement, single owner. |
| *Needs:* and Dependencies, lines 170, 343, 404; consumers, line 537 | union of the section lines | §0.1 and §2.1 both name RefinedTraceMethods §6.1 for the perfect lifts; Layer 2 Dependencies now lists §§6.1, 6.9–6.10, 7.6 ⊇ {6.1, 7.6} of §2.1. | Consistent. |
| Pins, lines 61 and 63 | `lake-manifest.json`; seven changed locators | Mathlib 1b1ccf4, Tau Ceti 2fd255d: both equal the manifest. Basic.lean:102 `RingOfIntegers`; Away/Basic.lean:82 `algebraMap_isUnit`; Divisibility/Hom.lean:34 `map_dvd`; Commute/Units.lean:74 `Commute.isUnit_mul_iff`; MvPolynomial/Basic.lean:80; Even.lean:56 (`Even` by `to_additive` on `IsSquare`); Factorization/Defs.lean:51. | All locators hit their declarations at the pin. |

The rows for the untouched statements stand as in the previous review, of 61e97fe.

- Source locators checked against the text: 2 on changed lines. KU Lemma A.1 (KU line 3902, printed p.87, footer at KU line 3939) states the lift of A → A_∞ and builds it from the Tate-Frobenius colimit; TC 3.4 (TC line 1304, p.31) gives `S_{ℤ_p{x}_∞}`, the tower and the map over x ↦ p. Both support the statements as written. The other seeded targets (§§1.1–4.2) are untouched.
- Library declarations opened at the pin: 12 (the nine named in the table plus Discriminant/Defs.lean:36 and :75, Etale/Basic.lean:205, Smooth/Basic.lean:539, Divisibility/Units.lean:129); `Algebra.Etale` and `Algebra.Smooth` each have exactly the fields formal étaleness/smoothness and finite presentation, as line 63 says.
- Cross-roadmap citations resolved: RefinedTraceMethods §6.1 by its three statement titles (supplier lines 2541, 2553, 2604) and its consumer paragraph (line 4143), which names this roadmap as importing the perfect lifts; no other changed citation.
- Overlap check: read RefinedTraceMethods, HabiroCohomologyFoundations, HabiroRings; spherical lifts of perfect δ-rings are owned by RefinedTraceMethods §6.1 and cited here; sphericalPerfection and relativeFormalEtaleLift are stated only here (search of all open heads and main).
- Gate at this head, run again: every counter 0, `OK`, exit 0. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` exit 0, no diagnostics. The file declares nothing (unchanged), so there is no signature to `#check` and no one-tactic probe; its docstring still names the nine headlines and their missing carriers, and the carrier named for sphericalPerfection (spherical Witt vectors) is still absent at the pins.
- Pull request text against this head: the title, the summary block and the prose agree with the head (a new roadmap; `Suggested.lean` declares nothing; nine headlines; spherical perfection and relative lifts constructed here; RefinedTraceMethods listed as a supplier). The change adds or drops no supplier, section or headline, so nothing is left unstated.
- Source independence: 5 passages compared with 2 sources (changed passages only), none shared beyond forced terms; largest share KU, 77 of 148 locators; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Nothing was unreadable: KU and TC were read at the cited lines; RefinedTraceMethods was read at its open head.

## Source issues

- none

## For the human reviewers

- **Scope.** The three most cited sources (KU, QH, TC; 133 of 148 locators) are recorded in the manifest as 2024–2025 texts by Wagner and Meyer–Wagner; whether they are refereed publications was not checked in this round.
