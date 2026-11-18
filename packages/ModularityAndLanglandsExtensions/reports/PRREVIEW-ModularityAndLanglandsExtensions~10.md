# Review of ModularityAndLanglandsExtensions (pull request #1180 at 123b48a)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 122 lines changed since `4c191e8`, and no finding remains. The previous finding is repaired: §§2.30 and 2.52 are gone, and modularity of elliptic curves over imaginary quadratic and CM fields is left, by name and section, to EllipticCurveModularityImaginaryQuadratic §8.6 and its second part §2.5; the three corrections and the format note are repaired as well, and the new citations of SerreModularityByCompatibleSystems, AutomorphicSpectralTheory §7.1 and AlgebraicModularFormsAndSerreWeights §5.10 resolve. There is one small correction (the pull request's description does not mention the two removed sections, which two other open roadmaps still cite), not blocking; three points are left for the human reviewers.

## C01 — The description does not say that §§2.30 and 2.52 are no longer used, and two open roadmaps still point at them

A reader of the description cannot learn that Caraiani–Newton's theorem and the arithmetic of the exceptional modular curves left this roadmap, and the two roadmaps that hand those subjects to it are left with pointers to nothing. EllipticCurveModularityImaginaryQuadraticPartII, in "Outside this roadmap" (its README lines 1477–1479), places "the exceptional modular-curve analysis of Caraiani–Newton §7" in "ModularityAndLanglandsExtensions §2.30" and the height-density statements in §2.29; EllipticCurveModularityImaginaryQuadratic (its README line 2296) says of §2.29 that "its additional height-density argument remains there". At this head §2.30 does not exist, §2.29 has no density target, and the scope section says, correctly, that the density theorem follows from the second part's §2.5 (every curve over a CM field without `ζ₅` is modular, and singular equations have density zero) and that the curve arithmetic "serves only their first theorem". Nothing is left unowned that a target uses; only the pointers are stale.

The description would be right with one sentence beside the one it already has for 3.12 and 3.15: that section numbers 2.30 and 2.52 are not used, that modularity over imaginary quadratic and CM fields is EllipticCurveModularityImaginaryQuadratic §8.6 and EllipticCurveModularityImaginaryQuadraticPartII §2.5, and that those two roadmaps, which cite §§2.29–2.30 for the density statement and the exceptional curves, should drop those pointers. It could also say that rational Serre modularity and weight-one descent are now cited from SerreModularityByCompatibleSystems (Layers S6–S7), which the prose does not name.

## Previous findings

- R01 — repaired: §§2.30 and 2.52 removed; scope section: "Its §8.6, `imaginary_quadratic_modularity`, proves that every elliptic curve over an imaginary quadratic field is modular … the section numbers 2.30 and 2.52 are not used"; overview and boundaries paragraph follow.
- C01 — repaired: §2.31 now reads "(BLGHT II Thm. 6.4 needs `N₂>m+1` for a representation of rank m, here `m=2n`)" with the locator; the source has `N₂ > n+1` for even rank n (blght-2011 line 1728).
- C02 — repaired: §2.13 ends "PMCS §2.20 is the case `K₀=ℚ` with K imaginary CM, where it also makes L CM and a given finite quotient of `π₁^ét(T)` surjective at P", which is what that section states.
- C03 — repaired: contract reads "Cyclic prime-degree base change, its descent and its fibres are AutomorphicSpectralTheory §7.1 … import from §6.24 their compatibility with the local base-change maps at every place"; six `*Needs:*` lines follow.
- N01 — repaired: §§3.3 and 3.14 now cite "BCGP Lemma 8.3.2, p.247".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.13 Moret–Bailly, with the new comparison | source statement; PMCS §2.20 at its open head | `K^avoid/K/K₀`, both Galois; `L′_{σv}=σL′_v`; invariant opens; `L/K₀` Galois, disjoint, `L_w≅L′_v` (blggt-2014-v4 lines 1824–1835). §2.20: F imaginary CM Galois over ℚ, F′ CM, `f∘P_*` surjective | agrees | none |
| 2.31, bound on `N₂` | rank `m=2n`; `n=1` | Thm 6.4: n even, `l+1=N₁N₂`, `N₂>n+1` (blght-2011 lines 1724–1728, printed p. 47); `m=2n` gives `N₂>2n+1`; `n=1`: `N₂>3`. CG has "greater than n" (cg-2018 line 4424) | README bound is the supplier theorem's | none |
| Scope: CN Thm 1.1 and 1.2 contained in suppliers | ECMIQ §8.6; Part II §2.5; CN statements | §8.6: every imaginary quadratic K, every E/K. §2.5: every CM K with `ζ₅∉K`. CN 1.2: F imaginary CM, Galois over ℚ, `ζ₅∉F`, 100% of equations (caraiani-newton-2023 lines 113–115); singular equations: density 0 | both contained | C01 (description) |
| 2.29, reduced locator | CN §6.1 numbering | Thm 6.1 (line 4513), Cor 6.1.1 (4523), Lemma 6.1.3 (4545), 6.1.4–6.1.7 (4562–4631); the density Cor 6.1.2 (4529) no longer cited | agrees | none |
| 1.3 and boundaries: Serre inputs | four cited ids at the supplier's open head | `S6/strong-form-of-serre-conjecture`, `S7/unramified-residual-representations-arise-in-weight-one` (ℓ odd, distinct Frobenius eigenvalues), `S7/weight-one-descent-from-infinitely-many-primes` (`N′=N` or `5N`), `S7/odd-artin-weight-one-modularity`: all present; supplier leaves KW 10.1(ii) out, so §1.3 owns it | resolves, one owner | none |
| 1.8, 3.30: eigenvalue lifting | AlgebraicModularFormsAndSerreWeights §5.10 on main | DVR O, finite free M, commuting family, nonzero residual eigenvector: lift over a dominating DVR with eigenvalues reducing to the given ones | resolves | none |
| 2.24, 3.30, 4.22, 4.33, 5.11, induction contract: base change | AutomorphicSpectralTheory §7.1 on main | cyclic prime degree; cuspidal iff `π≄π⊗η`; descent of invariant cuspidals; fibre = twists by characters trivial on norms; needs §§7.0a–7.0c | resolves | none |
| 4.33 (BCGNT 7.2.1) | strongly irreducible; induced branch; n odd | CM F, `H_τ={0,m}`, `m≥1`, pure of weight m; CM F′/F Galois over ℚ; induced: summands of dimension ≤2, rank-one term when n odd, i.e. degree `n−1` even (bcgnt-2025 lines 3412–3432) | agrees | none |
| 3.3, 3.14 locator | BCGP | Lemma 8.3.2 (as the previous review read it, bcgp-2021 line 11847) | agrees | none |
| `satoTate_elliptic` | elaboration; signature | unchanged statement; one warning, the `sorry` at line 65; only the module docstring lost "and imaginary-quadratic modularity" | agrees with §4.34 | none |

The rows of the previous review for untouched statements stand as in the previous review, of `4c191e8`.

- Source locators checked against the text: 6, in 4 sources (blggt-2014-v4, blght-2011, caraiani-newton-2023, bcgnt-2025), plus cg-2018 line 4424 for the comparison.
- Cross-roadmap citations resolved: on main, AutomorphicSpectralTheory §§7.0a–7.0c and 7.1, AlgebraicModularFormsAndSerreWeights §5.10; at open heads, SerreModularityByCompatibleSystems Layers S6–S7 and four target ids, EllipticCurveModularityImaginaryQuadratic §§5.3 and 8.6, EllipticCurveModularityImaginaryQuadraticPartII §2.5, PotentialModularityAndCompatibleSystems §2.20. All four are earlier in the merge order.
- Leftovers searched in the README: no mention remains of §2.30, §2.52, `X₀(15)` outside the scope sentence, the height-density argument, the former Serre supplier or its R27.6, the abbreviation IG, EffectiveDiophantineMethods or ArithmeticStatisticsPartI; no link label is left without a use.
- Dependency check: `depcheck: 200 roadmaps, 2224 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: `sorry` the only warning. No change outside the roadmap folder.
- Library declarations: none newly opened; the diff changes no Lean statement, and the three elaborated signatures are those the previous review compared with §4.34.
- Overlap check: read ModularityAndLanglandsExtensionsPartII, PotentialAutomorphyInfrastructurePartII, PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems, LocalLanglandsCorrespondenceForG2 (open, as in the previous review; PotentialModularityAndCompatibleSystems §2.20 again); AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main); also EllipticCurveModularityImaginaryQuadratic, its second part and SerreModularityByCompatibleSystems. Shared: modularity of elliptic curves over imaginary quadratic and CM fields — owner EllipticCurveModularityImaginaryQuadratic §8.6 and its second part §2.5, now cited (the stale pointers back are C01). Moret-Bailly with prescribed completions — general base here (§2.13), CM case with surjectivity in PotentialModularityAndCompatibleSystems §2.20, each now distinguished. Cyclic base change and descent — owner AutomorphicSpectralTheory §7.1. Rational Serre modularity and odd Artin over ℚ — owner SerreModularityByCompatibleSystems; Khare–Wintenberger 10.1(ii) — owner this roadmap (§1.3). The other shared objects stand as in the previous review.

Source independence: changed passages only; 4 passages compared with 4 sources (§2.13 with blggt-2014-v4, §2.31 with blght-2011 and cg-2018, the scope sentence with caraiani-newton-2023), none copied; no layer added, removed or reordered, so the arrangement was not compared again (previous review: largest share blggt-2014-v4, contents independent).

Research link: §4.34 is Sato–Tate for non-CM `E/ℚ` by potential automorphy (Allen et al. 2023, Cor. 7.2.4; Barnet-Lamb–Gee–Geraghty–Taylor 2014); §§4.33, 4.38, 4.42 are Boxer–Calegari–Gee–Newton–Thorne 2025; §§1.12, 4.22 feed Newton–Thorne 2026. Rests on the README's references and the texts read.

## Not verifiable

- Bellaïche–Chenevier, Theorem 1.2 (§3.30): not opened; as in the previous review.
- Kaletha–Mínguez–Shin–White (§3.16), the locators "(3.6.3)" and "Theorem* 2.6.2": not checked; as in the previous review.
- Snowden (§1.4), Arthur's book (§§3.4, 3.8, 3.17), Atobe–Gan–Ichino–Kaletha–Mínguez–Shin (§3.2), Xu (§§3.19, 3.27), Marshall (§4.41), Harder (§4.26), Emerton, Nakamura and Hellmann–Schraen (§4.3), Clozel–Thorne and Thorne 2024 (§§4.16, 4.22), Geraghty's ordinarity normalization (§2.20): not opened; untouched by this change.
- The preprint behind EllipticCurveModularityImaginaryQuadratic §8.6 and its second part §2.5: not read; only the two roadmaps' statements were.

## Source issues

- **Gap** in qian-2023 at Theorem 1.4, p. 2: the source says the prime l is arbitrary; it should require `l>n`, as hypothesis (4) of the lifting theorem its proof applies does; affects a stated result.
- **Misprint** in bcgnt-2025 at Theorem 7.2.3, p. 70: the source says `S_π` is the set of finite places where π is unramified and then uses `v ∉ S_π`; it should be the places where π is ramified; affects nothing.
- **Misprint** in cg-2018 at §10, p. 97: the source bounds `N₂` below by `n` in the extra hypothesis and by `n+1` five lines later, for a representation of rank `2n`; it should be `2n+1`, the bound of the theorem it applies (blght-2011 line 1728); affects nothing.
- **Gap** in bcgp-2021 at §2.9, p. 38: the source lets S be any finite set of places in the pole condition; it should contain the archimedean places and the ramification of Π and χ; affects nothing.

## For the human reviewers

- Scope: Caraiani–Newton's refereed theorem is no longer stated here; modularity over imaginary quadratic and CM fields is left to EllipticCurveModularityImaginaryQuadratic §8.6 and its second part §2.5, which rest on a preprint in a public code repository dated 4 October 2026.
- Wording: the statements of §§4.19, 4.22 and 4.33 track their sources' theorem statements clause by clause (bcgnt-2025 lines 2898, 3412; newton-thorne-hilbert line 2127), longest shared run 8 words; treated as forced by the mathematics.
- Reuse: §1.2 (README line 174) says its separation of cofinite Hecke agreement from all-place matching follows the API pattern of the Imperial College London FLT project; no declaration of `Suggested.lean` is taken from it.
