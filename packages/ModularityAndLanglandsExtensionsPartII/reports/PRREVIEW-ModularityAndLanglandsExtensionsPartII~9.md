# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at 285d1db)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 21 lines changed since `bd1490f`, and of the pull request's title and description against this head, finds no finding. The four small corrections of the previous review are repaired: the twist reducing the essentially conjugate self-dual case of §13.12 to the conjugate self-dual one is now in the proof sketch with its suppliers, and its exponents are right; the pointer for general Bianchi forms goes to §4.33 of ModularityAndLanglandsExtensions; the module docstring of `Suggested.lean` names the four headline theorems that are not statable; and the description agrees with the parent roadmap at its head. There are no small corrections and no format notes; one point remains for the human reviewers.

## Previous findings

- R01 — repaired: settled at `bd1490f` and still so; the parent's Scope at its head says of `SP_n` for every `n` "no target here uses it" and that Theorem 6.5, the holomorphy and the entireness "are not targets of this roadmap".
- C01 — repaired: the description now reads "ModularityAndLanglandsExtensions states none of the theorems proved here and uses none of them", and lists §§13.11–13.13 and 14.6 as consequences that roadmap does not own; this is what its Scope says.
- C02 — repaired: §13.12, sketch: "A RAECSDC `(π, χ)` is twisted to this case (nt26 p. 50): an algebraic character `ψ` of `E` with `ψψ^c = (χ ∘ N_{E/E⁺})^{−1}`"; *Needs:* gains PotentialAutomorphyInfrastructurePartII §§0.8, 0.11.
- C03 — repaired: "General Bianchi forms instead use the potential route of ModularityAndLanglandsExtensions §4.33", which at that roadmap's head is the potential automorphy of symmetric powers of rank-two systems over CM fields.
- C04 — repaired: the docstring's "Not statable at the pins" list has two new bullets, for §§13.11–13.13 and for §14.6, each naming the missing carriers.

The previous report had no format note.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §13.12, the twist in the sketch (changed) | convention `π^c ≅ π^∨ ⊗ (χ∘N∘det)`; `n = 2`; sign of the exponent | `(π⊗ψ)^c ≅ (π⊗ψ)^∨ ⊗ (χ∘N·ψψ^c)∘det`, trivial iff `ψψ^c = (χ∘N)^{−1}`; `Sym^{n−1}(π⊗ψ) = Sym^{n−1}π ⊗ ψ^{n−1}`, so the untwist is `ψ^{1−n}`; `n = 2` returns `π` | correct; agrees with nt26 lines 2368–2371 (RACSDC case first, general case by twisting) |
| §13.12, suppliers of the twist (changed) | PotentialAutomorphyInfrastructurePartII §0.8, §0.11 at its open head | §0.8 route: `(π ⊗ (ψ_𝔸∘det), χ·ψ_𝔸|_{𝔸_{F⁺}^×})` is polarized, with `ψψ^c = ψ|_{𝔸_{F⁺}^×}∘N`; §0.11(1): `θ` with `θθ^c = χ|G_F` for imaginary CM `F` | both exist and say what is cited; "not induced from a quadratic extension" is twist-invariant |
| §13.12, pointer for Bianchi forms (changed) | ModularityAndLanglandsExtensions §4.33, §4.42 at its open head | §4.33: purity and potential automorphy of symmetric powers of rank-two systems over CM fields; §4.42: Sato–Tate | §4.33 is the statement meant |
| Docstring bullet on §14.6 (changed) | `n = 1`, `n = 0`; non-CM `E/ℚ` against the second stated theorem | newform of `E`: weight `2 ≥ 2`, no quadratic self-twist iff non-CM; stated theorem needs `n ≥ 1`, covering §14.6's `n ≥ 2`; `n = 0` gives `ζ`, excluded | the bullet's "consequence away from the conductor" is true |
| Description, the five requests | README supplier contracts | five "must provide" paragraphs: PotentialAutomorphyInfrastructurePartII, GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra, FiniteFlatGroupsAndIntegralPadicHodgeTheory, CompletedCohomologyAndLocalGlobalCompatibility; the middle three are on main | description agrees |
| Description, the Lean file | `Suggested.lean` at this head | 2 definitions with bodies, 2 theorems on `HeckeRing.GL2.Newform`; `DirichletCharacter ℂ M` in `HasQuadraticSelfTwist`; 3 files in the folder | description agrees |

The rows for the untouched statements stand as in the previous review, of `bd1490f`.

- Source locators checked against the text: 1 (nt26 Theorem 6.5(2) and its proof, p. 50, lines 2361–2371). Seeded sample: §13.12 is the one sampled target in the changed passages; the others are untouched.
- Cross-roadmap citations resolved: PotentialAutomorphyInfrastructurePartII §§0.8, 0.11 and its conventions for RAECSDC (open head); ModularityAndLanglandsExtensions §§4.22, 4.33, 4.42 and its Scope paragraph (open head). All exist with the content claimed.
- Dependency check: `depcheck: 210 roadmaps, 2260 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The change adds no supplier: PotentialAutomorphyInfrastructurePartII was one already, earlier in the merge order.
- Elaboration of `Suggested.lean`: `sorry` at lines 101 and 120 the only warnings; no `set_option`, no sorry'd data. The change is to the module docstring only, so the four elaborated types (compared again with §§14.4 and 14.5: same hypotheses) and the one-tactic probe stand as before. No new headline is statable at the pins.
- Pull request text: title and description read sentence by sentence against the head (a new roadmap of three files, five requests, the `p = 2` suppliers of §§9.4 and 12.4, the relation to the parent, the consumers); no sentence contradicted, no change left unstated.
- Automatic checks: all passed; no change outside the roadmap folder.
- Overlap check: read PotentialAutomorphyInfrastructurePartII and ModularityAndLanglandsExtensions again at their heads for the changed passages; OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings and AutomorphicGaloisRepresentationsPartII stand as read for the earlier reviews; nothing shared: the theorems of §§13.10–13.13 and 14.1–14.6 are owned here and disowned by ModularityAndLanglandsExtensions, which owns `SP_n` as a statement, `n ≤ 5` and the reductions of §4.22.

Source independence: changed passages only: 2 passages compared with 1 source (nt26; the docstring bullets have no source passage), none shared; largest share nt26 (49 of 91 locator citations at the previous count, one added); no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 11–13 prove Newton–Thorne 2026 (Theorems 3.2, 4.1, 5.5, 5.9, 6.4, 6.5), symmetric power functoriality for Hilbert modular forms, with Thorne 2024 level raising (Layer 6) and Newton–Thorne 2021 II patching (Layer 9); Layer 14 gives Newton–Thorne 2021 I Theorems A, B, E and II Corollary B. Rests on the sources read.

## Not verifiable

- Clozel–Harris–Taylor 2008, Lemma 4.1.4, which nt26 cites for the twist: not read; the README takes the character from PotentialAutomorphyInfrastructurePartII §0.11 instead, which was read.
- bbm82 Théorème 3.1.1 and kw09 Proposition 9.3: cited by locator only (untouched by this change).
- The published pagination of nt26, nt21b and nt21: the README cites the arXiv pages, which is what was read.
- The description's count of earlier review rounds: not something the head shows.

## Source issues

- none

## For the human reviewers

- The board's plan for this roadmap declares 14 requests to suppliers; the README at this head uses 5. The other 9 (among them Deligne–Lusztig transfer, Mœglin's packets, equivariant K-theory of the Steinberg variety) belong to routes the text no longer contains.
