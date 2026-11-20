# Review of ModularCurves (pull request #2627 at 271d965)

**Verdict:** accepted

**Summary.** Accepted, with no findings, small corrections or format notes. The one finding of the previous review is repaired. §3.3 now uses `IsRigid.of_hom` only for the fixed-pairing frames of `Y(ρ)`, whose forgetful map does land in the naive full-level problem. It refers the rigidity of the naive quotients to §6.2 and gives `[Γ(1)]` as a correct counterexample. The three small corrections and the format note are repaired too: the source sentences no longer say "follows", the `[Γ₀(N)]` rank clause of `exists_relRepData_gammaZero` is correct for every `N`, the description's counts are right, and §2.4 points to JacobianChallenge §§C.1–C.2. The human reviewers have the same three points as last time: KM cannot be read legally, the Provenance section names Apache-2.0 repositories, and the sources manifest omits most of the cited works.

## Previous findings

- R01 — repaired: "Owned here is the corresponding statement for the fixed-pairing frames of `Y(ρ)` … through the morphism of moduli problems that forgets the frame … Rigidity of a naive quotient `[Γ(N)]/H` is not deduced this way … the criterion is §6.2's."
- C01 — repaired: the sixteen openings now read "The sources of this section are KM 1.1.1, 1.2.2 and 1.2.3." and similarly. The Summary says "due to Katz and Mazur", and the only remaining "follows" concerns the layer order and the dependencies (Convention 7).
- C02 — repaired: `exists_relRepData_gammaZero` asks for `n * (∏ p ∈ N.primeFactors, p) = N * (∏ p ∈ N.primeFactors, (p + 1))`, and §9.4 and the module docstring state the rank `N ∏_{p∣N}(1 + 1/p)`.
- C03 — repaired: the description now says "(65 in all, at least one in each of the 62 sections, …)". At this head there are 65 *Needs:* lines in 62 sections.
- N01 — repaired: §2.4, item 2 now cites "(JacobianChallenge §§C.1–C.2)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §3.3, frames of `Y(ρ)` rigid via `IsRigid.of_hom` (changed) | `N = 3`; `N = 2`; pinned `IsRigid.of_hom` | `N=3`: `[−1]` sends `(P,Q,f)` to `(−P,−Q,f) ≠ (P,Q,f)`; `N=2`: fixed, excluded by `N ≥ 3`; pin needs `φ : P ⟶ Q`, and the forgetful `(P,Q,f) ↦ (P,Q)` has that direction | true | none |
| §3.3, quotient clause (changed) | `H = GL₂(ℤ/N)`, `1`, semi-Borel, Borel | `GL₂`: §6.2 item 1 with `d = 1` gives `[Γ(1)]`, fixed by `[−1]`; `1`: `[Γ(N)]`, rigid for `N ≥ 3`; semi-Borel: `[Γ₁(N)]`, rigid for `N ≥ 4`; Borel: `[−1]` fixes `⟨P⟩` | true ("only for suitable `H`") | none |
| `exists_relRepData_gammaZero`, rank clause (changed) | `N = 1, 4, 6, 12, p` | `n = 1`; `2n = 12 ⇒ 6`; `6n = 72 ⇒ 12`; `6n = 144 ⇒ 24`; `pn = p(p+1) ⇒ p+1`; these are the Borel indices; `n` is unique and positive | true | none |
| §9.4, item 7 and the closing sentence (changed) | `N = p`, `N = 4` | `(p²/(p−1))(1 − 1/p²) = p + 1`; `(16/2)(3/4) = 6`; both agree with `N ∏(1 + 1/p)` and the Lean clause | consistent | none |
| §2.4, item 2: JacobianChallenge §§C.1–C.2 (changed) | main README C.2, line 731; open revision; `L = 𝒪([P])` on `E_T` | C.2 states that `s ↦ χ(X_s, F_s)` is locally constant for flat proper families; `χ(L_t) − χ(𝒪_t) = 1` on every fibre; C.1–C.2 also present at the open revision | true | none |
| §10.4 (sample): Mazur II, Cor. 2.3, p. 67 | Mazur1977 line 1579; `N = 5, 11, 13, 37` | Mazur: over `ℤ[1/N]` the cyclic intermediate cover of order `num((N−1)/12)` is étale; README the same; `n = 1, 5, 1, 3`, `|H| = 2, 1, 6, 6` | true | none |
| §10.3 opening: Mazur II §2, Table 1, p. 64 | Mazur1977 lines 1429–1575 | six rows (two each for char `≠ 2, 3`, char `2`, char `3`); README restates them in prose; `A₄` and `S₃` normalisers as on Mazur pp. 65–66 | true; no table reproduced | none |
| §0.2 (sample): SGA 3, Exposé VIIA, §3.3 | SGA3-VIIA line 960, Prop. 3.3.1; `(ℤ/N)_S` | 3.3.1 is Cartier duality for commutative coalgebras in groups; `(ℤ/N)_S ↔ μ_N`, both of rank `N` | true | none |
| Layer 6 opening (samples 6.1, 6.4): Loeffler §§3.6, 3.8 | Loeffler lines 912, 1030, 1063, 1081 | §3.6 is quotients and `Y₀(N)`; §3.8 is `P_H` with relative representability (3.8.2) and the rigidity criterion (3.8.3) | match | none |

The rows for statements the diff does not touch stand as in the previous review, of `7ee0648`.

- Source locators checked against the text: Mazur 1977, II §2 Table 1 (p. 64) and Cor. 2.3 (p. 67), read on Numdam; SGA 3, Exposé VIIA, Prop. 3.3.1, read at the re-edition's page; Loeffler §§3.6 and 3.8.
- Library declarations opened at the pins: Tau Ceti `AlgebraicGeometry/ModularCurve/ModuliProblem.lean` 296 (`IsRigid.of_hom`); Mathlib `AlgebraicGeometry/Morphisms/FlatRank.lean` 89 (`Scheme.Hom.finrank`).
- Cross-roadmap citations resolved: JacobianChallenge §§C.1–C.2 on main and at its open revision; §6.2's quotient-rigidity criterion (README line 2890), which the new §3.3 sentence points to.
- Automatic checks: every check passed, so none was set aside. Dependency check: `depcheck: 200 roadmaps, 2217 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 32 `declaration uses sorry` warnings and nothing else. The elaborated type of `exists_relRepData_gammaZero` keeps `N` and `[NeZero N]` and matches §9.4. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) fails on it.
- Description against this head: 65 *Needs:* lines, two of them inline in §§7.1 and 7.3, with two each in §§0.9, 7.1 and 7.3; 132 Checks in 48 lists; 62 sections. The `Suggested.lean` changes against main are the removed KM 5.3.4 core, the rank clause and the docstring lines the description lists.
- Changes outside the folder: none.

Overlap check: read JacobianChallenge (main and open revision) for the changed citation. SchemeAndStackFoundations (main and open revisions), PurityForFlatCohomology and GroupSchemesOverABase are the closest roadmaps, and no open pull request drops an id this roadmap cites or changes this roadmap. The change moves no ownership, so the shared objects keep the owners the previous review gave: ModularCurves for finite locally free group schemes, Cartier duality and the Grassmannian of subgroup schemes; SchemeAndStackFoundations §§0.12–0.14 for henselisation of pairs; JacobianChallenge for line bundles and curve cohomology; AlgebraicModuliForArithmeticGeometry §1.3 for the coherent Grassmannian.

Source independence: changed passages only. 6 passages (the §3.3 ownership sentence, the §9.4 rank sentence, the openings of §§0.2, 10.3, 10.4 and Layer 6) were compared with 3 sources (Mazur 1977, SGA 3 VIIA, Loeffler). No shared wording beyond forced phrases of at most 2 consecutive words ("cyclic of", Mazur1977 line 1581). Largest share: KM, about 202 of about 400 locators, unchanged. The diff adds, removes or reorders no layer, so the contents comparison with KM's chapter structure stands as before: independent.

Research link: Layers 3–9 build Katz–Mazur's First Main Theorem and regularity theorems, which Conrad (2007) and Česnavičius (2017) extend to compactified moduli stacks over `ℤ`. Layer 10 is the curve geometry of Mazur's Eisenstein-ideal paper (1977, Ch. II §§1–2; Cor. 2.3 read this round). This rests on the README and on Conrad, Česnavičius and Mazur as read.

## Not verifiable

- Katz–Mazur (1985): no legal copy. The KM locators in the reworded openings of the sampled §§1.2, 2.1, 2.2, 2.4, 4.1, 6.1, 6.4, 7.1, 7.3, 8.6, 9.2 and 10.1 were not checked.
- Katz, *Serre–Tate local moduli*, Theorem 1.2.1 (Layer 7 opening, samples 7.1 and 7.3): publisher copy only.
- Deligne–Rapoport II.1 (Layer 1 opening, sample 1.2): publisher copy only.
- Igusa, *Fiber systems of Jacobian varieties III*, §2 (Layer 6 opening): not opened.

## Source issues

- none

## For the human reviewers

- Not tested: KM, the source with the largest share of locators (about 202 of 400), has no legal copy. The wording and arrangement checks were made against its chapter structure as cited, not against its text.
- Licence: the Provenance section (README lines 4674–4704) names the author's AINTLIB repository and two other Apache-2.0 Lean repositories as proof-architecture material. `Suggested.lean` was not compared with them.
- The package's `sources.toml` records 8 works. KM, Česnavičius, Deligne–Rapoport, Mazur, EGM, Katz and SGA 3 are cited throughout but not recorded. Mazur (1977) is open on Numdam, and SGA 3 is on its re-edition's page.
