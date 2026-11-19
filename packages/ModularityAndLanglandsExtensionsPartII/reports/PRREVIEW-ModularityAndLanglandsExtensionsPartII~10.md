# Review of ModularityAndLanglandsExtensionsPartII (pull request #2449 at 6a39600)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 135 lines changed since `285d1db`, and of the pull request's title and description against this head, finds no finding. The new mathematics is correct as written: the self-twist and induced-form CM predicates agree for regular algebraic `π` over a totally real field, with each step at the supplier section cited; the passage from the unitary `π_f` to its regular algebraic twist and back in §§14.4–14.5 has the right exponents; and the reading of `HasQuadraticSelfTwist` as a primitive self-twist matches the pinned Tau Ceti declarations in both directions. There are no small corrections and no format notes; one point remains for the human reviewers.

## Previous findings

- none: the previous report, of `285d1db`, carried no finding, no small correction and no format note of its own, and the five earlier points it listed as repaired (R01, C01–C04) are untouched by this change.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, the two CM predicates agree for `F` totally real, `π` regular algebraic (new) | `π = AI_{L/F}(α)`, `L` totally imaginary; a self-twist by `χ ≠ 1`; a real place split in `E`; weight one | `η_{L/F}∘N_{L/F} = 1`, so `AI(α)⊗η = AI(α)` by the twist law of §R17.4.16; §R17.4.13 gives `π = AI_{E/F}(θ)`; split real place gives reducible `θ_w ⊕ θ_{w′}`, discrete series is irreducible; weight one (`1 ⊕ sgn`) is excluded by regularity | true; both supplier sections say what is cited; §R17.4.13 is stated for unitary `π`, and the text reduces to that case |
| §14.4 sketch, `π_f` regular algebraic in level one (changed; seeded sample) | `k = 12`; odd `k`; `k = 2` | level one has `χ = 1`, so `(−1)^k = 1` and `k` is even; `(k−2)/2 = 5` is an integer; Satake `α_p p^{−(k−1)/2}` has sum `a_p p^{−(k−1)/2}`, product `1`, as §R16.6.1; `k = 2`: no twist | true; nt21 Theorem A (line 57) asks for regular algebraic level-one `π`, which is what is supplied |
| §14.5 sketch, `Sym^n π_f = Sym^n π_alg ⊗ \|det\|^{n(k−2)/2}` (changed) | `n = 1`; `k = 2`; `k = 3`, `n = 1` | `π_f = π_alg ⊗ \|det\|^{(k−2)/2}`, `Sym^n(r⊗μ) = Sym^n r ⊗ μ^n` gives exponent `n(k−2)/2`; `n = 1` returns `π_f`; `k = 2` exponent `0`; `k = 3`: twist `\|det\|^{1/2}`, so unitary `π_f` is not algebraic | true; parameters `(α_p p^{−(k−1)/2})^j (β_p p^{−(k−1)/2})^{n−j} = α_p^j β_p^{n−j} p^{−n(k−1)/2}` |
| §14.5 API, predicate iff `primitiveTwist f ψ` is `f` (new) | forward with `g = f`, `R = N`, `L = NM`; backward; `M = 0` | uniqueness theorem (Twist.lean line 194) needs `R ∣ L`, `N ∣ L`, `M ∣ L`, `g.χ = f.χ·ψ²` at `L`, coefficients off a finite set: all hold since `ψ² = 1`; backward by line 173 at `p` coprime to `N` and `M`; `M = 0` excluded by `0 < M`, giving `NeZero M` | true in both directions |
| §14.5 API, `π_f` CM iff `HasQuadraticSelfTwist f`, weight `k ≥ 1` (changed) | trace only versus trace and determinant; `ψ` imprimitive; `k = 1` | trace: `a_pψ(p) = a_p`; determinant: `χ_f(p)p^{k−1}ψ(p)² = χ_f(p)p^{k−1}`; `ψ ≠ 1` modulo `M` has non-trivial primitive character, so `χ ≠ 1`; §R16.4.4 newform adapter covers `k ≥ 1`, §R16.6.6 gives the class at `k = 1` | true; the determinant coordinate is required by §R16.4.4 and is supplied |
| `HasQuadraticSelfTwist` docstring (changed), against the definition | elaborated type; README §14.5 | type unchanged: `{N} [NeZero N] {k : ℤ} → Newform N k → Prop`; body `0 < M`, `ψ ≠ 1`, `ψ ^ 2 = 1`, `a_p * ψ p = a_p` for `p.Coprime (N * M)`; docstring's "every weight `k ≥ 1`" equals the README bullet | docstring agrees with the README |
| References, nt26 (changed) | publisher's page for the article | Ann. of Math. 203 (2026), no. 1, pp. 283–347, doi 10.4007/annals.2026.203.1.4 | as cited |

The rows for the untouched statements stand as in the previous review, of `285d1db`.

- Source locators checked against the text: 3 (nt21 Theorem A, line 57; Corollary C, line 71; footnote 1 on p. 2, line 89, the self-twist definition of CM). Seeded sample: §14.4 is the one sampled target in the changed passages; the others are untouched.
- Library declarations opened at the pin: 4, in `TauCeti/NumberTheory/ModularForms/Newforms/Twist.lean`: `primitiveTwistLevel` (line 141), `primitiveTwist` (160), `qExpansion_coeff_primitiveTwist` (173), `level_eq_primitiveTwistLevel_and_coe_eq_primitiveTwist` (194). Each exists under the cited name and states what the README says of it.
- Cross-roadmap citations resolved: GL2AutomorphicRepresentationsAndTransfer §§R16.4.4, R16.4.5, R16.4.6, R16.6.1, R16.6.6, R17.4.13, R17.4.16 and ModularForms §9.2 (main); AutomorphicGaloisRepresentations §§3.15, 7.4, 7.5 and ModularityAndLanglandsExtensions §§1.12, 4.15 (open heads). All exist with the content claimed; §3.15 is the induced-form predicate from a totally imaginary quadratic extension, and §§7.4–7.5 need it.
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The change adds sections of a supplier already named (GL2AutomorphicRepresentationsAndTransfer, on main) and no new supplier; ModularForms, on main, is named in the Scope as the owner of twists.
- Elaboration of `Suggested.lean`: `sorry` at lines 103 and 123 the only warnings; no `set_option`, no sorry'd data. The change is to two docstrings, so the four elaborated types and the one-tactic probe stand as before; no new headline is statable at the pins.
- Pull request text: title and description read against the head; the change removes or renumbers no section, drops no declaration and adds no supplier roadmap, and no sentence is contradicted.
- Automatic checks: all passed; no change outside the roadmap folder.
- Overlap check: read GL2AutomorphicRepresentationsAndTransfer, ModularForms, AutomorphicGaloisRepresentations and ModularityAndLanglandsExtensions for the changed passages; PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems, GlobalGaloisDeformations, LocalGaloisDeformationRings and AutomorphicGaloisRepresentationsPartII stand as read for the earlier reviews; nothing shared: the non-CM condition is owned by GL2AutomorphicRepresentationsAndTransfer §R16.4.6, the CM predicate by AutomorphicGaloisRepresentations §3.15, twists of newforms by ModularForms §9.2 and Tau Ceti, and this roadmap keeps only the coefficient predicate of §14.5 and the comparison.

Source independence: changed passages only: 4 passages compared with 1 source (nt21 p. 2; the comparison of CM predicates and the primitive-twist bullet have no source passage), none shared; largest share nt26, as at the previous count, no locator added to it; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layers 11–13 prove Newton–Thorne 2026 (Theorems 3.2, 4.1, 5.5, 5.9, 6.4, 6.5), symmetric power functoriality for Hilbert modular forms, with Thorne 2024 level raising (Layer 6) and Newton–Thorne 2021 II patching (Layer 9); Layer 14 gives Newton–Thorne 2021 I Theorems A, B, E and II Corollary B. Rests on the sources read.

## Not verifiable

- bbm82 Théorème 3.1.1 and kw09 Proposition 9.3: cited by locator only (untouched by this change).
- The published pagination of nt26, nt21b and nt21 against the arXiv pages the README cites: only the arXiv texts were read; the page range and DOI of nt26 were confirmed on the publisher's page.
- The description's count of earlier review rounds: not something the head shows.

## Source issues

- none

## For the human reviewers

- The board's plan for this roadmap declares 14 requests to suppliers; the README at this head uses 5. The other 9 (among them Deligne–Lusztig transfer, Mœglin's packets, equivariant K-theory of the Steinberg variety) belong to routes the text no longer contains.
