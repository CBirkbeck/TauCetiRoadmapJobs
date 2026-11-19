# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at b9017b4)

**Verdict:** needs changes

**Summary.** Changes are needed, for one remaining point of the earlier finding on the character twist. The tame Euler factors of §§4.1 and 4.6, the projection formula of §6.1 and the Check of §4.5 are now correct, and the scalar of §4.3 is the right one; but §4.3 still multiplies that scalar by `L′(η, 0)`, where the Kronecker formula the roadmap imports gives `L′(η⁻¹, 0)` in the roadmap's own convention, and the two differ for a non-real character. There are no small corrections and no format notes. The regulator normalization of §4.2 is left to the human reviewers as before.

## R01 (P2) — In §4.3 the scalar `N(a) − η(σ_a)` goes with `L′(η⁻¹, 0)`, not with `L′(η, 0)` as §§4.2–4.3 read under the Conventions

An implementer who takes `z(η)` from §4.2 ("characterized by r(z(η)) = L′(η, 0)", line 268) with the Conventions' rule `χ(b) = χ(σ_b)` (line 14) and then proves `e(η⁻¹) = (N(a) − η(σ_a)) z_p(η)` (line 287) is proving a false identity whenever `L′(η, 0)` is not real.

The class `e(η⁻¹)` is the trace of `a ζ ⊗ t_p(η⁻¹)`, that is `Σ_τ η⁻¹(τ)·τ(a ζ) ⊗ t`, so its regulator coordinate is `Σ_τ η⁻¹(τ) log|τ(a ζ)|`. Kronecker's formula as imported (NonordinaryCMSpecialValues §2.2, and the last Check of §2.3 here, line 193) reads `Σ_σ χ(σ) log|σ(u)| = (N(a) − χ(a)⁻¹)·L′(χ, 0)` with `χ(a) = χ(σ_a)`; the scalar is forced by `σ_b` acting on the sum by `χ(σ_b)⁻¹`. At `χ = η⁻¹` this is `(N(a) − η(σ_a))·L′(η⁻¹, 0)`: the repaired scalar, which is right, with the L-value of the inverse character. Johnson-Leung–Kings write `L(η, s)` and `η(𝔭)` with `η(b) = η(σ_b)⁻¹` (JLK lines 104–110, 620), which is the same function; the head removed the sentence that named that convention in §4.3 and now attributes it to the source for the scalar only, so `L′(η, 0)` in §4.2, in the Check of §4.3 (line 297) and `η(𝔭)` in `z_p(η)` read in the Conventions' sense. Instance: `K = ℚ(i)` and the cubic character `χ` of conductor `(7)` of the new Check of §4.6. It is the norm of a cubic Dirichlet character `ψ` modulo 7, so `L′(χ, 0) = L′(ψ, 0)·L(ψχ_{−4}, 0) ≈ (0.6992 − 0.1912i)(1 − 1.7321i) ≈ 0.3681 − 1.4022i`, and `L′(χ⁻¹, 0)` is its complex conjugate. Every Check on §§4.2–4.3 uses a quadratic character, where the two agree.

The smallest change: say once in §4.2 that `L(η, s)` and `η(𝔭)` there and in §4.3 are those of the ideal character `b ↦ η(σ_b)⁻¹`, the source's convention; or write `L′(η⁻¹, 0)` and `η⁻¹(𝔭)` in the Conventions' notation. A Check with the cubic value above would pin it.

## Previous findings

- R01 — partly repaired: §§4.1, 4.6 now have `1 − χ(Frob_𝔩)Frob_𝔩⁻¹`, §6.1 the class of `χ⁻¹` on the factor where `Δ` acts by `χ`, §4.3 the scalar `N(a) − η(σ_a)`; the L-value beside that scalar is R01 above.
- R02 — repaired: "J_χ has height two exactly when κ is trivial on Δ", with `ℚ(i)`, `p = 2` (height two) and `p = 3`, `a = (2 + i)` (augmentation 4, unit ideal).
- C01 — repaired: §5.2 now reads "compare NoncommutativeAndEquivariantIwasawa §4.3, the rational CM-curve case".
- N01 — repaired: the three split bullet lists are joined.

## Verified sound

| Statement | Instances tried | Computed on one side | Computed on the other / wrong model | Result; change |
|---|---|---|---|---|
| §4.1 Check, Euler factor of the twist | `T = O_p(χ)(1)`, `χ = 1`, `χ(Frob) = ζ_3` | `T^* = O_p(χ⁻¹)`, `Frob⁻¹` acts by `χ(Frob)`: `1 − χ(Frob)Frob⁻¹`; at `χ = 1`, `1 − Frob⁻¹` | §1.1 rule `g ↦ χ(g)⁻¹g` on `1 − Frob⁻¹` gives the same; opposite twist `1 − ζ_3⁻¹Frob⁻¹` | Agree; none |
| §4.3 scalar and identity | relation `(N(b) − σ_b)·a ζ = (N(a) − σ_a)·b ζ` on `Σ η⁻¹(τ)τ(a ζ)`; quadratic `η`, `a = (5)`; cubic `χ` mod 7 | `σ_b` acts by `η(σ_b)`: scalar `N(a) − η(σ_a)`, augmentation of `s_a(η⁻¹)`; quadratic: `24·R/3 = 8R` | Kronecker at `χ = η⁻¹` gives `L′(η⁻¹, 0)`; cubic: `0.3681 − 1.4022i` against its conjugate | Scalar right, L-value convention unstated; R01 |
| §4.5 Check at `χ = 1` | `ℚ(i)`, `p = 2`; `ℚ(i)`, `p = 3`, `a = (2 + i)` | `ℤ_2[i]^×/μ_4 ≅ ℤ_2²`, `Δ = 1`, quotient `ℤ_2`, height 2 | `p = 3`: `Δ = 𝔽_9^×/μ_4`, norm onto `𝔽_3^×`, `κ(δ) − 1 = −2` unit; `5 − 1 = 4` unit | True; none |
| §4.6 definition and new Check | `ℚ(i)`, `p = 3`, `χ = x ↦ x^16` on `(O_K/7)^×`, `𝔩 = (2 + i)` | `i^16 = 1`; `(2+i)² = 3+4i`, `⁴ = 3i`, `⁸ = 5`, `¹⁶ = 4`, of order 3 mod 7 | `1 − ζ_3γ⁻¹` vanishes at `γ ↦ ζ_3`, `1 − ζ_3⁻¹γ⁻¹` at `γ ↦ ζ_3⁻¹`; augmentations `1 − ζ_3^{±1}` non-units | True; none |
| §6.1 projection to a regular factor | factor where `Δ` acts by `χ`; `N(a) − σ_a`, `1 − Frob⁻¹` | images `N(a) − χ(σ_a)[σ_a]= s_a(χ⁻¹)` and `1 − χ⁻¹(Frob)Frob⁻¹` | §4.6 factor for `χ⁻¹`: `1 − χ⁻¹(Frob)Frob⁻¹`; JLK reaches `Λ(χ)` by `p_{χ⁻¹}` (JLK line 1499) | Agree; none |
| §1.5 locator sentence | JLK Lemma 4.3 | determinant of the supported complex stated at JLK lines 869–871 | — | Supported; none |

The rows for untouched statements stand as in the previous review, of `953523b`.

- Source locators checked against the text: 6, all in JLK (lines 104–110, 617–620, 731, 869–871, 1025–1030, 1498–1511); each at the stated place.
- Seeded sample: only §4.1 falls in the changed passages; its Check was recomputed (first row).
- Cross-roadmap citations resolved: EulerSystemsAndKolyvaginSystems, the Euler polynomial `P(Fr_q⁻¹ | T^*; x)` with `T^* = Hom_O(T, O(1))`, on main; NonordinaryCMSpecialValues §2.2, Kronecker's formula with the factor `N(a) − χ(a)⁻¹`, at its open head.
- Dependency check output: `depcheck: 199 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. `Suggested.lean` elaborates with no output and exit code 0; it has no declaration, so no signature comparison and no one-tactic probe applies, and its module docstring names each headline and the carrier it lacks.
- Pull request text: title and description read against the head; the change touches nothing they state. No file outside the folder is changed.
- Numerical value in R01: `L′(ψ, 0) = −(1/2)Σ ψ(a) log|1 − ζ_7^a|` and `L(ψχ_{−4}, 0) = −(1/28)Σ a·ψχ_{−4}(a)`, computed in floating point.

Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures, InertAnticyclotomicCMMainConjecture, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology, EulerSystemsCyclotomicMainConjecture and NoncommutativeAndEquivariantIwasawa, as in the previous review; the change moves no ownership. Owners: zeta morphism and CM module structure, KatoEulerSystems; theta functions, standard elliptic units, zeta element and reciprocity law, NonordinaryCMSpecialValues; formulation of Kato's conjecture, ModularIwasawaMainConjectures; Rubin's two-variable theorem for a rational CM curve at ordinary `p ≥ 5`, NoncommutativeAndEquivariantIwasawa §4.3; units of every modulus, the module `z`, the character-wise and equivariant equalities and the CM descent, this roadmap. Nothing has two owners.

Source independence: changed passages only; 5 passages compared with 1 source (JLK), none shared; largest share Kato, 33 of about 98 locators; contents compared with Kato §15 in the previous review: independent, and the change adds, removes or reorders no layer.

Research link: Layer 8 is Theorem 2.6 of Burungale–Tian (2025), resting on Kato (2004) §15, Johnson-Leung–Kings (2011) and Rubin (1991); Layer 5 supplies Castella–Grossi–Lee–Skinner (2022). Rests on the README's sources, read at BT lines 208–218 and CGLS lines 394–836.

## Not verifiable

- The proof of the Tamagawa number statement at `p = 2` (§4.2) goes through Itakura §3.1 by JLK line 432; no legal copy was found.
- Whether Johnson-Leung–Kings' own factors are consistent in their inverse-Artin action was not decided; the README only says how they read in its convention, which is what was checked.

## Source issues

- none

## For the human reviewers

- JLK lines 394–397 state that the ordinary-norm regulator is needed for the 2-part; the README (§4.2, line 267) replaces it by the squared norm. The class-number computation supports the README; Itakura's proof at `p = 2` was not readable.
- The README corrects four printed statements of its sources (JLK (6), (17), Proposition 3.3(4); BT Theorem 2.1) and now writes the Euler factors of §§4.3, 4.6 in a character convention inverse to JLK's print. Each was recomputed on one example, not proved in general.
