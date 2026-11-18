# Review of ModularityAndLanglandsExtensions (pull request #1180 at 4c191e8)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: §2.52 states the modularity of elliptic curves over imaginary quadratic fields under the hypothesis that `X₀(15)(F)` is finite, and plans the arithmetic of six modular curves in §2.30 to prove it, while EllipticCurveModularityImaginaryQuadratic, a supplier of this roadmap and earlier in the merge order, states the same theorem for every imaginary quadratic field; the README never names that theorem. The previous review's finding (the endoscopic classification stated twice) is repaired, as are its two corrections and four format notes, and the fifteen sampled statements agree with their sources. There are three small corrections and one format note, none blocking; four points are left for the human reviewers.

## R01 (P2) — §2.52 proves, for imaginary quadratic fields with `X₀(15)(F)` finite, a theorem that a supplier earlier in the merge order states for every imaginary quadratic field, and §2.30 exists only to prove it

An implementer who follows the README builds the explicit models, Mordell–Weil groups, residue exclusions and Chabauty arguments of §2.30 (line 964) to reach a special case of a theorem this roadmap can import, and a reader of the overview ("modularity of elliptic curves over some imaginary quadratic fields", line 9) is told that Tau Ceti plans less than it does. One theorem has two owners, at two generalities.

How I know. §2.52 (line 1296) reads "If F is imaginary quadratic with finite `X₀(15)(F)` … every E/F is modular", and line 1298 adds that the individual theorem "uses the arithmetic theorems proved in §2.30". EllipticCurveModularityImaginaryQuadratic, at the head of its open pull request, states as its endpoint `imaginary_quadratic_modularity` (its opening summary and §8.6): for every imaginary quadratic `K` and every elliptic `E/K` there is an isobaric automorphic representation of `GL₂(𝔸_K)` of weight zero realizing `H¹(E)` at every coefficient prime, cuspidal when `E` is geometrically non-CM, with `L(E/K,s)=L(π_E,s−1/2)`. Its scope section says that Caraiani–Newton's exceptional modular-curve analysis "is not used". That roadmap is already a supplier here (§§2.18, 2.23 and 2.29 cite its §§0.2, 0.3, 5.1 and 5.3) and stands before this one in the merge order; but this README cites only those four sections, and its scope paragraph (line 2845) lists what that roadmap owns without the endpoint. The second sentence of §2.52, that 100% of Weierstrass equations over a CM Galois field without `ζ₅` are modular, and the height-density target of §2.29, are in the same position against EllipticCurveModularityImaginaryQuadraticPartII, also earlier in the merge order, whose opening summary states modularity of every elliptic curve over every CM field.

The smallest change. In §2.52 and in the scope section, name EllipticCurveModularityImaginaryQuadratic §8.6 as the owner of modularity over imaginary quadratic fields (and its second part for CM fields), and say in one clause what §2.52 keeps. Two readings are possible and the choice is the author's: (a) §2.52 becomes a citation, and §2.30 stays, if wanted, as the classification of quadratic points on the six curves in its own right, with its last sentence ("give the individual modularity endpoint of §2.52") changed; or (b) §2.52 is kept as Caraiani–Newton's proof by a route independent of the supplier's source, and says so. In either case the overview's "some imaginary quadratic fields" and the "Field and weight boundaries" paragraph (line 3109) would follow.

## C01 — The bound `N₂>2n+1` in §2.31 is not the one at the place cited

A reader who opens the locator finds a different hypothesis. §2.31 (line 1016) gives the special case with "`p+1` divisible by `N₂>2n+1`" and cites the 'extra hypothesis' bullet of Calegari–Geraghty §10; there the integer is "greater than n" (cg-2018 line 4424), and `N₂>n+1` five lines later (line 4429), for `r=Sym^{2n−1}` of rank `2n` (line 4412). The README's bound is the stronger one, so the special case as stated remains true. Either give the source's bound, or say that the larger bound is chosen for the rank-`2n` representation and give the locator that needs it (Barnet-Lamb–Geraghty–Harris–Taylor, Theorem 6.4, which I did not read).

## C02 — §2.13 does not say how it differs from the prescribed-completion theorem of PotentialModularityAndCompatibleSystems §2.20

Two roadmaps state a Moret-Bailly theorem with prescribed local Galois extensions and an avoided field, both citing BLGGT Proposition 3.1.1, and neither names the other. §2.13 (line 695) is the general form over `K/K₀` with `Gal(L′_v/K_v)`-invariant opens; PotentialModularityAndCompatibleSystems §2.20 is the case `K₀=ℚ`, `K` imaginary CM, with the additional conclusion that a finite quotient of `π₁(T)` stays surjective at the point. The `*Needs:*` line of §2.13 cites §§2.8–2.10 and 2.23 of that roadmap, not §2.20. One clause in §2.13 saying that it is the general-base form and that §2.20 there is the CM case with the surjectivity clause would let a reader see that there is one theorem and not two.

## C03 — Cyclic base change and descent are attributed to a section that only compares them at every place

In the supplier contracts (line 3007) the README says "Import strong cyclic base change and descent from §6.24" of EndoscopicTransferAndUnitaryTraceComparison, and §5.11 cites the same section as "cyclic base change". On main that section (its README line 2587) says that base change, descent and the self-twist alternatives are those of AutomorphicSpectralTheory §§7.0a–7.0c and 7.1, and proves that the supplied prime-degree base change matches the local maps at every place. Citing AutomorphicSpectralTheory §7.1 for existence and descent and §6.24 for the all-place compatibility, as PotentialAutomorphyInfrastructure §2.3 does, would send an implementer to the owner.

## N01 — §3.3 (lines 1396 and 1415) cites "BCGP 8.3.2" and "proof of Prop. 8.3.2"; the source and §3.14 have Lemma 8.3.2 (bcgp-2021 line 11847, stated on p. 246, proof to p. 248).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.2 NT-automorphy | source definition; `1⊕ε⁻¹`; weight one | RAESDC/RAECSDC witness and `ρ≅r_{π,ι}` (newton-thorne-hilbert lines 400–407); isobaric and non-regular inputs fail | agrees | none |
| 1.12 `SP_n` | `n=1,2,3`; CM input | Conjecture B: every totally real F, non-CM RAC, RAESDC lift (lines 116–118, 589–592); `Sym²` of CM not cuspidal | agrees | none |
| 2.1 potential diagonalizability | `ℓ=5`: `{0,3}`, `{0,4}` | interval `[a,a+ℓ−2]=[0,3]`; Lemma 1.4.3(1),(2) (blggt-2014-v4 lines 1226–1231, 1314–1322) | agrees | none |
| 2.16 PD lifting | `ℓ=2`; d | Thm 4.2.1: ℓ odd, cyclotomic irreducibility, `ℓ≥2(d+1)`, `ζ_ℓ∉F`, ordinary or PD automorphic residual pair (lines 2389–2402) | agrees | none |
| 2.24 p–r switch | conditions (1)–(17) | `m≥2`, `E/ℚ` cyclic degree m, `p,r>2nm+1`, `GU_m(𝔽_{p²})` for `m>2`, `ℚ_{p²}⊂F_v` (bcgnt-2025 lines 3023–3096) | agrees | none |
| 2.29 residual modularity | `p=3`, `p=5` | Props 6.1.5–6.1.6: `det=ε̄_p`, `ζ₅∉F` only at `p=3`; Lemma 6.1.7 ordinary/unramified (caraiani-newton-2023 lines 4574–4634) | agrees | none |
| 2.45 tensor products | `{1,2,4}`, `{1,2,3}` | sums `0,…,7` distinct; `1+2=3` repeats; Cor 5.4.4 with weights `k+1` (blggt-2014-v4 lines 3475–3490) | agrees | none |
| 2.51 Qian Thm 1.4 | bound on l | statement has no bound (qian-2023 lines 77–90); ACC+ 6.1.2(4) has `p>n` (acc-2023 lines 5419–5420) | README adds `l>n` correctly | source issue |
| 3.3 twisted square factors | `GL₂` `diag(α,β)`; orders at 1 | nonvanishing on `Re s=1` (shahidi-1997 lines 64–65); poles only at 0, 1 (belt-square lines 2393–2398); orders `(−1,0)` or `(0,−1)` | agrees | N01 |
| 3.28 non-general type | Yoshida | Lemma 2.9.1 hypotheses and conclusion (bcgp-2021 lines 1909–1915); `|·|^{−3/2}` vs `|·|^{−1/2}`: factor `q_v`; multiplier `ε⁻³r(ω)` | agrees | none |
| 3.30 symplectic pairing | weight `(2,2)`, `t=rs(p−1)` | Lemma 6.9: `a≥b≥2`, lift by 6.4 to `(a+t,b+t)`, 6.8 needs `≥3` (cg-2020 lines 1416–1434); `ε^{−2t}≡1` | agrees; sign theorem not opened | none |
| 4.21 purity, `det=ε^{−m}` | `m=1`, `m≥2` | Thm 6.2.1: imaginary CM, strongly irreducible, `F_n/ℚ` Galois; `m=1` by ACC+ 7.1.12 (bcgnt-2025 lines 2954–2978) | agrees | none |
| 4.24 ACC+ 7.1.13 | `m=0`, `m>0` | pure of weight 1; holomorphic, nonzero on `Re s≥m/2+1` for `m>0`, strongly irreducible (acc-2023 lines 8127–8148) | agrees | none |
| 4.39 `ST(π)` | `a=1,2,3`, infinite order | `SU₂`; `diag(−1,1)`: `(−1)²=1`, `(−1)³≠1`; `ζ₃³=1`; Lemma 7.2.2 (bcgnt-2025 lines 3434–3457) | agrees | none |
| 4.42 Sato–Tate, parallel weight | set `S_π` | Thm 7.2.3; source says "unramified" for `S_π`, README "ramified" (lines 3461–3465) | README right | source issue |
| 4.34 and `satoTate_elliptic` | `y²=x³−x+1` at 5, 7; one-tactic probe | `Δ=−368`; 7, 11 affine points; `a₅=−2`, `a₇=−4`; roots `−1±2i`, `−2±i√3`; `simp`, `rfl`, `infer_instance`, `exact`, `aesop` fail | true, not padding | none |
| 1.15 `SP_n`, `n≤5` | `∧²(Sym³V⊗det⁻¹)`, `V=χ⊕χ` | `6=5+1` copies of `χ²`; tetrahedral `5=3+1+1`; exterior square now ET §§11.0f, 11.0h (read on main) | true | none |
| 1.9 odd Artin | route | Needs §§1.2, 1.8, GL2T R17.5; R17.5.5 and R16.4.4 exist on main | consistent | none |
| 4.38 Ramanujan | weight `(k−2,0)` | HT `{0,k−1}`, modulus `N(v)^{(k−1)/2}`; `N𝔭=9`, `k=2`: bound 6 | true | none |
| 4.22 reductions | Prop 6.1 | `p≥5`, `0<r<p`, conditions (1)–(8), modulus `(8)·{v|∞}` (newton-thorne-hilbert lines 2127–2149) | agrees | none |
| 2.52, 2.30 | supplier's endpoint | every imaginary quadratic K, every E/K; "exceptional modular-curve analysis … is not used" there; merge order: supplier first | second, weaker statement | R01 |
| 2.31 | bound on `N₂` | README `2n+1`; source `n`, then `n+1`; rank `2n` (cg-2018 lines 4412, 4424, 4429) | true, locator differs | C01 |
| 2.13 | PMCS §2.20 | `K₀=ℚ`, K imaginary CM, plus finite-quotient surjectivity; both cite BLGGT 3.1.1 | variant unnamed | C02 |
| Contract for ET §6.24 | section on main | uses AutomorphicSpectralTheory §§7.0a–7.1; proves all-place matching in prime degree | misattributed | C03 |
| Conventions, 2.6, 2.23, 2.30, 4.13, 4.17, 4.18 checks | recomputed | `d+=1`; `Q₈⋊C₃` of order 24; genus `1+14−12=3`; traces `−4`, 15: `X²−X+2`, `X²−1` mod 5; `24`, `48`, `120`; ratio 11; cross-sums 3 | true | none |

- Source locators checked against the text: 42, in 12 sources (newton-thorne-hilbert, blggt-2014-v4, bcgnt-2025, acc-2023, qian-2023, caraiani-newton-2023, shahidi-1997, belt-square, bcgp-2021, cg-2020, cg-2018, kmsw-2014).
- Library declarations opened at the pin: 11 elaborated with `#check` (`WeierstrassCurve.HasGeometricCM`, `GeometricEnd`, `Matrix.charpolyRev`, `Matrix.reverse_charpoly`, `Matrix.eval_charpolyRev`, `Matrix.ProjGenLinGroup` with `mk` and `map`, `Matrix.ProjectiveSpecialLinearGroup.toPGL`, `Polynomial.eval₂_reverse_mul_pow`, `WeierstrassCurve.Affine.Point`); 9 read in the Tau Ceti source (`TateModule/Galois.lean` lines 80, 188; `TateModule/Determinant.lean` line 52; `Newforms/Satake.lean` lines 91, 108, 272, 323; `SpecificGroups/Heisenberg.lean` line 58; `Hermite/Function/Oscillator.lean` line 96).
- Cross-roadmap citations resolved: on main, EndoscopicTransferAndUnitaryTraceComparison §§4.7, 4.10, 5.2, 6.18, 6.24–6.29, 10.33, 11.0a–11.0h, 11.1–11.4, 13.3, ArithmeticGaloisRepresentations §7.10, LocalGaloisDeformationRings §§0.4, 6.8, F.2.5, GL2AutomorphicRepresentationsAndTransfer R16.4.4, R17.4.13, R17.5.5, AutomorphicGaloisRepresentationsPartII AG2.6; at open heads, EllipticCurveModularityImaginaryQuadratic §§0.2, 0.3, 5.1, 5.3 with the six names cited, PotentialModularityAndCompatibleSystems §§1.15–1.17, 1.21–1.22, 2.8–2.10, 2.23, PotentialAutomorphyInfrastructure §§2.3, 2.12, 2.26, 5.22–5.23.
- Dependency check: `depcheck: 213 roadmaps, 2324 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: one warning, the `sorry` at line 65. The three elaborated signatures were compared with §4.34; no binder is lost. No change outside the roadmap folder. The pull request's title and description agree with the head.
- Previous review: R01 repaired (§§3.12 and 3.15 are gone and mapped in the scope section; §3.2 opens "The weighted fundamental lemma … are EndoscopicTransferAndUnitaryTraceComparison §§11.0a–11.0c"; §§1.11, 1.14, 3.16, 3.17 keep only what those sections leave out; "are not premises here" in the Conventions; the two contract sentences now name §11.0c). C01 repaired ("§1.15 supplies ranks at most five … §4.13 the CM and weight-one cases"). C02 repaired (the eight `*Needs:*` lines name their routes' sections). N01–N04 repaired ("in the supplier contracts below"; the overview states four theorems; `SP′_n` is defined; "**Weight-one realization.**"). Of its two questions, the sign in §2.20 is now explained in the text and the bound in §2.31 is C01.
- The whole README was read: overview, Conventions, Layers 0–5, scope, contracts, references.
- Overlap check: read ModularityAndLanglandsExtensionsPartII, PotentialAutomorphyInfrastructurePartII, PotentialModularityAndCompatibleSystems, PotentialAutomorphyInfrastructure, LocalLanglandsCorrespondenceForG2 (open); AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main); also EllipticCurveModularityImaginaryQuadratic and its second part, PotentialAutomorphyDworkMotivesPartII, AutomorphyLiftingBeyondTaylorWiles, SatoTateGroups, BianchiModularForms, TwistedAutomorphicDescents, AbelianSurfacesModularity. Shared: modularity of elliptic curves over imaginary quadratic and CM fields — owner EllipticCurveModularityImaginaryQuadratic and its second part (R01). Moret-Bailly with prescribed completions — general form here, CM case with surjectivity in PotentialModularityAndCompatibleSystems §2.20 (C02). Weighted stabilization, Mok, Arthur, Kaletha–Mínguez–Shin–White, Kim's exterior square — owner EndoscopicTransferAndUnitaryTraceComparison, now cited. `SP_n` in every rank — owner the second part, which cites §§1.12, 1.15, 4.15, 4.22. Potential diagonalizability, BLGGT lifting, §§4.1–4.2 — owner this roadmap (PotentialAutomorphyInfrastructurePartII cites them). Dwork projector and paired sheaf §§2.9, 2.14, `ST(π)`, Serre's criterion, §§4.26–4.27, 4.40–4.41, Xu's packets — owner this roadmap; the later roadmaps cite them.

Source independence: 19 passages compared with 11 sources, none copied; §§4.19, 4.22 and 4.33 follow their sources' theorem statements clause by clause, with shared runs of at most 8 words, which I read as forced by the mathematics and report to the human reviewers; largest share blggt-2014-v4, 22 of 141 locator lines; contents compared with blggt-2014-v4: independent (its results stand in §§2.1–2.46 among ten other sources and out of its order: 4.2.1 before 3.3.1, 4.5.1 before 4.4.1, 5.4.6 before 5.4.3, 5.5.2 before 5.4.4).

Research link: §4.34 is Sato–Tate for non-CM `E/ℚ` by potential automorphy (Allen et al. 2023, Cor. 7.2.4; Barnet-Lamb–Gee–Geraghty–Taylor 2014); §§4.33, 4.38, 4.42 are Boxer–Calegari–Gee–Newton–Thorne 2025; §2.52 is Caraiani–Newton 2023; §§1.12, 4.22 feed Newton–Thorne 2026. Rests on the README's references and the texts read.

## Not verifiable

- Bellaïche–Chenevier, Theorem 1.2 (§3.30): not opened; only Calegari–Geraghty's use of it was read.
- Barnet-Lamb–Geraghty–Harris–Taylor, Theorem 6.4 (§2.31): not read, so the bound a rank-`2n` representation needs is not settled.
- Kaletha–Mínguez–Shin–White (§3.16): Theorem* 1.7.1 was located (kmsw-2014 line 3759); the locators "(3.6.3)" and "Theorem* 2.6.2" for its two local inputs were not checked.
- Snowden (§1.4), Arthur's book (§§3.4, 3.8, 3.17), Atobe–Gan–Ichino–Kaletha–Mínguez–Shin (§3.2), Xu (§§3.19, 3.27), Marshall (§4.41), Harder (§4.26), Emerton, Nakamura and Hellmann–Schraen (§4.3), Dieulefait–Guerberoff–Pacetti and Box (§2.30), Clozel–Thorne and Thorne 2024 (§§4.16, 4.22), Geraghty's ordinarity normalization (§2.20): not opened in this round.
- EllipticCurveModularityImaginaryQuadraticPartII: only its opening summary was read for R01.

## Source issues

- **Gap** in qian-2023 at Theorem 1.4, p. 2: the source says the prime l is arbitrary; it should require `l>n`, as hypothesis (4) of the lifting theorem its proof applies does; affects a stated result.
- **Misprint** in bcgnt-2025 at Theorem 7.2.3, p. 70: the source says `S_π` is the set of finite places where π is unramified and then uses `v ∉ S_π`; it should be the places where π is ramified; affects nothing.
- **Misprint** in cg-2018 at §10, p. 97: the source bounds `N₂` below by `n` in the extra hypothesis and by `n+1` five lines later; it should be one bound in both; affects nothing.
- **Gap** in bcgp-2021 at §2.9, p. 38: the source lets S be any finite set of places in the pole condition; it should contain the archimedean places and the ramification of Π and χ; affects nothing.

## For the human reviewers

- Scope: the supplier theorem that R01 names rests on a preprint held in a public code repository, dated 4 October 2026 (EllipticCurveModularityImaginaryQuadratic, References); whether §2.52 stays as the refereed route is yours to decide.
- Scope: §2.30 asks for explicit models, point counts, Mordell–Weil groups and Chabauty exclusions of six modular curves; the source obtained them by machine computation (caraiani-newton-2023 line 71). Whether these are roadmap targets is yours to decide.
- Wording: the statements of §§4.19, 4.22 and 4.33 track their sources' theorem statements clause by clause (bcgnt-2025 lines 2898, 3412; newton-thorne-hilbert line 2127), longest shared run 8 words; I treated them as forced by the mathematics.
- Reuse: §1.2 (README line 174) says its separation of cofinite Hecke agreement from all-place matching follows the API pattern of the Imperial College London FLT project; no declaration of `Suggested.lean` is taken from it.
