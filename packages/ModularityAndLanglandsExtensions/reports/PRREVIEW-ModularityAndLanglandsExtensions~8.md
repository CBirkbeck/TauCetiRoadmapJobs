# Review of ModularityAndLanglandsExtensions (pull request #1180 at 183af0c)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: EndoscopicTransferAndUnitaryTraceComparison, now on main, states as its own targets the weighted fundamental lemma, the Mœglin–Waldspurger weighted stabilization, Mok's and Arthur's classifications, the generic inner-form unitary classification and Kim's exterior square, and this roadmap states the same theorems again (§§1.14, 3.2, 3.12, 3.15, 3.16, 3.17), several of them as conditional on a premise that main treats as a theorem. The previous review's finding (supply in both directions with the second part) and its five corrections are repaired, the Sato–Tate route of §4.34 is now complete inside this roadmap and its suppliers, and the fifteen sampled statements agree with their sources where the text could be read. There are two small corrections and four format notes, none blocking; three points are left for the human reviewers.

## R01 (P2) — Seven targets restate theorems that EndoscopicTransferAndUnitaryTraceComparison on main already owns, and the two texts disagree on whether the weighted fundamental lemma is a premise or a theorem

A reader finds the same theorem twice, once as a target of a roadmap on main and once here with the standing line "Assume TWFL together with the [Trace inputs]", and cannot tell which statement an implementer is to prove or which status is intended. A roadmap on main is the earlier owner: the later one cites it or narrows its own statement.

How I know. On main, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` has, in its Layer 11:

- §11.0a (line 4293): the twisted weighted fundamental lemma, Mœglin–Waldspurger II §4.4, as a target. Here it is "TWFL", a premise (Conventions, line 39; "The twisted weighted fundamental lemma", line 3167: "Assume TWFL=Mœglin–Waldspurger II.4.4").
- §§11.0b–11.0c (lines 4318, 4332): the local error term and its vanishing, and the global geometric and spectral stabilization `I = Σ i(G̃,G′) SI^{G′}`, from Mœglin–Waldspurger X §§3, 7–8. Here §3.2 (line 1367) says "own weighted distributions/transfer/stabilization" and cites the same pages (MW X §§3.2–3.9, pp. 12–37; §§8.1, 8.5–8.6).
- §§11.0d–11.0e (lines 4349, 4365): Mok's Theorems 2.5.1 and 2.5.2 with Remark 2.5.3. Here §3.12.
- §11.0g (line 4408): Arthur's local packets, pairings, character relations and the tempered partition for symplectic and quasi-split special orthogonal groups (Theorems 1.5.1 and 2.2.1). Here §3.15.
- §11.0h (line 4422): Arthur's multiplicity formula with `m_ψ ∈ {1,2}` (Theorem 1.5.2). Here §3.17.
- §§11.2 and 11.4 (lines 4457, 4505): Kaletha–Mínguez–Shin–White Theorem* 1.6.1 and the generic pure-inner case of Theorem* 1.7.1. Here §3.16.
- §§11.0f and 11.0h (lines 4379, 4426): Kim's exterior square `GL₄ → GL₆` (the `Spin(2m+6)` Levi, Propositions 3.1 and 3.4, Theorem 3.5, the `GL₆` converse theorem with `1 ≤ m ≤ 4`, Theorem 5.3.1, Henniart's completion at every place), and Ramakrishnan's Theorem M in the weak sense. Here the first half of §1.14 states the same construction, and §1.11 states the strong form of Theorem M without naming the weak form on main.

Two sentences of the supplier contracts are false against main as it stands: "The full twisted weighted stabilization of Mœglin–Waldspurger is the extra [§3.2], not an export of that simple comparison" (line 3047) and "The additional weighted transfer and stabilization enter through [§3.2]" (line 3041); §11.0c exports exactly that. The README already imports §11.1 "retaining the symplectic classification contract of §§11.0g–11.0h", but main's §11.0h says of that contract that §§11.0g–11.0h construct it; it is not a list of hypotheses left open for a consumer to discharge.

The smallest change. Cite the owner and keep only what it lacks: (i) replace the statements of §§3.12, 3.15, 3.17 and of the tempered and generic-global part of §3.16 by citations of ET §§11.0d–11.0e, 11.0g, 11.0h, 11.2 and 11.4, keeping here, each with one clause saying how it differs, only what those sections do not state (for instance the `Ψ⁺_unit` localizations of §3.17, the nongeneric inner-form scope of §3.16); (ii) in §3.2 keep the co-tempered packets and intertwining relations of AGIKMS and cite ET §§11.0a–11.0c for the weighted distributions and their stabilization; (iii) in §1.14 cite ET §§11.0f and 11.0h for `∧²` and keep the symmetric fourth power and its cuspidality criterion; in §1.11 say that the all-place form strengthens ET §11.0h's weak transfer; (iv) where a target's only use of "TWFL" is what ET §11.0a states, cite that section instead of assuming the premise, and correct the two contract sentences and the scope line for ET. If the author holds that Mœglin–Waldspurger II.4.4 is not available at ET §11.0a's generality, that is a remark for that roadmap; it is not settled by a second, conditional statement here. The pull-request description's sentence that the fundamental lemma is an unproved input would follow the README.

## C01 — §5.2 still credits Layer 4 with the regular algebraic Hilbert symmetric powers

§5.2 (line 2639) says "Layer4 supplies its stated RA,Hilbert discrete-series,monomial/weight-one cases" and that the known cases "are Layers1,4,5". At this head Layer 4 proves only §4.13 (CM and weight-one forms over ℚ); the regular algebraic Hilbert cases are §1.15 for rank at most five, and every rank is left to the second part by the scope section. The bullet would read: Layer 1 supplies ranks at most five for non-CM regular algebraic Hilbert forms and §4.13 the monomial and weight-one cases.

## C02 — Several `*Needs:*` lines omit sections that the target's own route names

An implementer who orders the work by the `*Needs:*` lines gets a different build order from the one the routes require. Instances: §4.22 (line 2342: route uses §§2.16, 2.32, 2.43 and Moret–Bailly; the line has ET, PAI Layer 2, §2.2, §4.15); §2.17 (route §§2.14, 2.15, 2.2; line: AG2.0 only); §2.39 (route §2.27; line: §2.2); §2.52 (route §§2.6, 2.29, 2.30; line: C-LOCAL-DEFORMATION and PMCS); §4.33 (route §4.21; line: ET only); §4.40 (route §4.38; line: §4.27); §4.42 (route §§4.33, 4.25; line: §4.39 and AL.3); §4.28 has no line. Adding the section numbers the route already names repairs each.

## N01 — "their contracts and hypotheses remain as above" (line 11) points the wrong way: the supplier contracts now stand at the end of the README, so "below".

## N02 — The opening summary is two sentences and states no theorem. Would it state two to four of the headline results with their hypotheses (Sato–Tate for non-CM `E/ℚ`; `SP_n` for `n ≤ 5`; the parallel-weight Ramanujan theorem over CM fields; the odd Artin conjecture over totally real fields) and name the three or four neighbouring roadmaps?

## N03 — `SP′_n` in §4.22 (line 2334) is used once and defined nowhere; one clause ("the all-place statement for every non-CM cuspidal representation essentially square-integrable at infinity") would fix it.

## N04 — In §1.8 the paragraph at line 306 begins in mid-sentence ("the weight-one Artin representation attached to f:"); it reads as a lost heading or lead-in.

## Questions for the author

- §2.31 asks for "`p+1` divisible by `N₂>2n+1`". The source's hypothesis says `N₂` greater than `n`, and three lines later `N₂ > n+1` (cg-2018 lines 4424 and 4429). Is `2n+1` the bound that Barnet-Lamb–Geraghty–Harris–Taylor's Theorem 6.4 needs for a representation of rank `2n`? I did not read that paper.
- §2.20 still writes the automorphic weight and central slope with a plus sign (`+λ_τ`, `+nλ_τ`), where the thesis compares valuations with exponent `−nλ_τ` (qian-thesis-2023 lines 1663–1665). Is this the translation to the convention `HT(ε) = −1` of the Conventions? Geraghty's ordinarity lemma, which would settle it, was not read.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, `d±` (previous C05) | `Sym²H¹`, `n=3,w=2`; `Sym⁴`, `n=5,w=4`; trivial and sign characters | `d+=(3−1)/2=1` = dim of the `−1`-eigenspace, `d−=2`; `Sym⁴`: `d+=3`; characters: 1 and 0 | repaired, true | none |
| 0.2 NT-automorphy | source definition | RAESDC or RAECSDC witness, `ρ≅r_{π,ι}`; source notes wider definitions possible (newton-thorne-hilbert lines 400–407) | agrees | none |
| 0.3 list `H(k,r)` | `(2,1)`, `(3,2)`, `(0,1)` | `[0,−1,2,1]` distinct; `[0,0,4,4]`; `[0,−1,0,−1]`; six differences give `r=2`, `k+r=1`, `k+2r=3`, `k=−1` | true | none |
| 1.4 mod 5 non-solvable | proof of BCGP 10.1.3 | `det=ε⁻¹`, 5 unramified gives `[E(ζ₅):E]=4`; Pilloni–Stroh 2.1.3 needs projective `PSL₂(𝔽₅)` (bcgp-2021 lines 12816–12824; pilloni-stroh-2016 lines 358–367) | agrees; Snowden not read | none |
| 1.9 odd Artin, totally real | Thm 0.3 | totally odd, irreducible, finite image ⇒ weight one, `L` entire (pilloni-stroh-2016 lines 50–54); `A₅` use (bcgp-2021 lines 12810–12814) | agrees | none |
| 1.14 exterior square, `Sym⁴` | roots `(a,b,c,d)`; `(8,4,1,0)`; `V=χ⊕χ` | `det ∧² = (abcd)³`; pair sums `12,9,8,5,4,1` distinct, `(3,2,1,0)` gives `3,3`; `6=5+1` copies of `χ²` | true; `∧²` owned on main | R01 |
| 2.5 weight-zero lifting | `n=2` | `p>n`; HT `{0,1}`; scalar `σ∉G_{F(ζ_p)}`; `Π_v` unramified at `v∣p` or where `ρ,π` both are (bcgnt-2025 lines 1769–1789) | agrees | none |
| 2.7 Conjecture B | `n=2` | `X²−T_{v,1}X+N(v)T_{v,2}`; clauses (1)–(5) incl. boundary vanishing and `Y₀(Q)` projector (cg-2018 lines 3934–3964) | agrees | none |
| 2.21 Galois ordinarity | ACC+ 5.5.2 | imaginary CM, `ι`-ordinary at all `v∣p`, residual decomposed generic and irreducible ⇒ ordinary of weight `λ` (acc-2023 lines 5317–5337); thesis Remark 4.0.4 (qian-thesis-2023 lines 1666–1675) | agrees | none |
| 2.30 exceptional curves | every displayed model and count | `j` maps of `b3,b5,ns3,ns5,s3`; `y²=−3(x⁴+2x³−x²+10x+25)`; genus 2 sextic; `#J(𝔽₇)=40`, `#J(𝔽₁₃)=180`; conics `c=−33,15,12`, `(3,2)`: `9+12+12−33=0`; 37, 89: traces `−4≡1`, `15≡0`, `X²−X+2`, `X²−1` (caraiani-newton-2023 lines 4951–5290) | agrees | humans |
| 2.31 auxiliary prime | bound on `N₂` | README `2n+1`; source `n` and `n+1` | not settled | question |
| 3.2, 3.12, 3.15, 3.16, 3.17 | main's Layer 11 | same theorems and source pages at ET lines 4293–4426, 4457, 4505; `m_ψ=2` only for even orthogonal on both sides | second statements | R01 |
| 3.26 `GSp₄` classification | BCGP §2.9 | six families; general type = cuspidal `Π`, multiplier `ω_π`, `rec` at every place (bcgp-2021 lines 1882–1903); Gee–Taïbi Thm 7.4.1 (gee-taibi-2019 line 1952) | agrees | none |
| 3.27 Xu's formula | Thm 1.1 | `Y`, `X⊋Y`, `α:S_φ→Y`, `S_φ̃=ker α`, sum over `Y/α(S_φ)` and `⟨·,π̃⟩=1`; thesis proof error noted by the source (xu-global lines 50–84) | agrees | none |
| 3.22, 3.32 worked values | `g=2,k=2`; `μ=(3,3;0)`; `c=−3` | infinitesimal character `{1,0,0,0,−1}`, interval `[0,1]`, `4>3`; `τ=(−3/2,−5/2,−7/2,−9/2)`, sum `−12=2w`; differences `−(b−2),−(a−1),−(a+b−3)` | true | none |
| 4.3 eigenvariety | locators; `GL₂`, `diag(9,1)` | Prop 2.11 p.30, (2.18.1) p.35 with `ν=κχι⁻¹δ_B^{−1/2}`, Thms 2.24, 2.27, 2.33 pp.40, 42, 50 (newton-thorne-I lines 1418–2448); `δ_B=1/9`, `δ_B^{−1/2}=3` | agrees | none |
| 4.13 CM and weight one | group orders; `Sym⁶τ` at order 5 | `24=3+12+9`, `48`, `120`; trace `ζ+ζ⁴ = (1+ζ+ζ⁴)+(−1)`; Thm A.1 (newton-thorne-II lines 1289–1292) | agrees | none |
| 4.22 reductions | hypotheses of Prop 6.1 | `p≥5`, `0<r<p`, non-CM RAESDC (newton-thorne-hilbert lines 2127–2134) | agrees | C02 |
| 4.27, 4.40 Bianchi forms, Theorem E | `k=2`; `N𝔭=9` | Fourier expansion with `c(O_F)=1`, `k=2` ↔ trivial `V`; bound `2·9^{1/2}=6` (bcgnt-2025 lines 437–473) | agrees | none |
| 4.39 `ST(π)` | `a=1,2,3,∞` | `SU₂`; `diag(−1,1)` in for `a=2`, out for `a=3`; `U₂`; Lemma 7.2.2 (bcgnt-2025 lines 3433–3449) | agrees | none |
| 4.41 mass estimates | threshold `L₁=(log T)^{−7/15}`; one complex weight 4 | `−1/2+7/15=−1/30`; `1/6−7/30=−1/15`, half is `−1/30`; `P=16`, `R₂=1/2`, `R₃=1/4` | self-consistent | none |
| 4.34 Sato–Tate, route | `m≥1`; `y²=x³−x+1` at 5, 7 | `GL_{m+1}`, `m+1≥2`: each factor entire, nonzero on `Re s≥1`; soluble descent needs irreducibility on `G_{F′}`, given for `ℓ>m`; 7 and 11 affine points, `a₅=−2`, `a₇=−4` | complete within suppliers | none |
| `satoTate_elliptic` (Lean) | `x<2`; one-tactic probe; hypothesis | `0/0=0` on a finite initial segment; `simp`, `rfl`, `infer_instance`, `exact tendsto_const_nhds`, `aesop` all fail; `¬E.HasGeometricCM` is the library predicate | true, not padding | none |
| 5.2 functoriality, known cases | Layer 4 at this head | only §4.13 lifts symmetric powers there | commentary stale | C01 |
| 5.5 descent and globalization | Props A.1, A.2 | pole of `L(s,τ_v,∧²)` at 0, `τ_{v₀}` supercuspidal ⇒ `T` cuspidal, pole at 1, `L(½,T)≠0`; `n=1` excludes the odd Weil representation (gan-ichino-2018 lines 1273–1315) | agrees | none |

- Source locators checked against the text: 31, in 14 sources (bcgnt-2025, newton-thorne-hilbert, newton-thorne-II, newton-thorne-I, bcgp-2021, pilloni-stroh-2016, cg-2018, acc-2023, qian-2023, qian-thesis-2023, caraiani-newton-2023, gee-taibi-2019, xu-global, gan-ichino-2018).
- Library declarations opened at the pin: `WeierstrassCurve.GeometricEnd` and `HasGeometricCM` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean` lines 94, 100); the three elaborated signatures compared with §4.34, no binder lost.
- Cross-roadmap citations resolved: ET §§11.0g, 11.0h, 11.1 and LGD §0.4 and ArithmeticGaloisRepresentations §7.10 on main; PAI §§2.3, 2.12, 2.26, 5.22–5.23, PMCS §§1.15–1.17, 1.21–1.22, 2.23, 8.6, EllipticCurveModularityImaginaryQuadratic §5.1, CompactGroups §§E.2–E.4 and Layers 5–6 at their heads; the second part's §§12.7, 13.5–13.6, 13.10, 14.1–14.3 exist, and it cites no section this head removed.
- Dependency check: `depcheck: 215 roadmaps, 2346 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: one warning, the `sorry` at line 65. No change outside the roadmap folder.
- Previous review: R01 repaired (no proof route cites the second part; §§4.9, 4.12, 4.20, 4.23, 4.29–4.32, 4.35–4.37 are gone and the scope section names the second part as a consumer); C01 repaired (§4.34 route and `*Needs:*` agree); C02 repaired (`¬ E.HasGeometricCM`); C03 repaired (§2.20 heading, §2.9 pages, §2.40 "Corollary 5.4.3"); C04 repaired (description); C05 repaired (`d±` defined as an eigenspace dimension); N01 repaired (both names removed).
- The whole README was read: Conventions, Layers 0–5, scope, contracts.
- Overlap check: read ModularityAndLanglandsExtensionsPartII, AutomorphicGaloisRepresentationsPartII, PotentialAutomorphyInfrastructurePartII, PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems (open); EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer, LocalGaloisDeformationRings (main); also SatoTateGroups, BianchiModularForms, EllipticCurveModularityImaginaryQuadratic. Shared: weighted stabilization, Mok, Arthur local and global classification, KMSW, Kim's `∧²` — owner EndoscopicTransferAndUnitaryTraceComparison on main (R01). `SP_n` for every n — owner the second part, which cites §§1.12, 1.15, 4.15, 4.22 here. BLGGT potential automorphy, potential diagonalizability, §4.1, §4.2 — owner this roadmap (PotentialAutomorphyInfrastructurePartII cites them). `ST(π)`, Serre's criterion, §§4.26–4.27, 4.40 — owner this roadmap (SatoTateGroups and BianchiModularForms cite them). Fargues–Scholze carriers — owner AG2.6. The Gelbart–Jacquet lift — owner GL2T R17.4.13, cited.

Source independence: 15 passages compared with 11 sources, none copied; the theorem statements of §§4.13, 4.19 and 4.33 follow their sources' statements clause by clause with shared runs of at most 8 words (bcgnt-2025 line 2898), which I read as forced by the mathematics and report to the human reviewers; largest share blggt-2014-v4, 21 of 144 locator lines; contents compared with blggt-2014-v4: independent (its results stand in §§2.1–2.46 interleaved with nine other sources and out of its order, 3.3.1 after 4.2.1, 4.4.1 after 4.5.1, 5.4.3 after 5.4.6).

Research link: §4.34 is Sato–Tate for non-CM `E/ℚ` by potential automorphy (Allen et al. 2023, Cor. 7.2.4; Barnet-Lamb–Gee–Geraghty–Taylor 2014); §§4.33, 4.38, 4.42 are Boxer–Calegari–Gee–Newton–Thorne 2023; §2.52 is Caraiani–Newton 2023; §§1.12, 4.22 feed Newton–Thorne's symmetric power functoriality (2022). Rests on the README's references and the texts read.

## Not verifiable

- Snowden, Theorem 7.2.1 and (A1)–(A2) (§1.4): not in the texts held; the "finitely many lifts" clause was not checked.
- Arthur 2004 and the published pagination of Gee–Taïbi (§3.26): only the arXiv text of Gee–Taïbi was read.
- Wang and Kim's quintic-induction paper (§4.13), Harder 1987 (§§4.26–4.27), Ichino–Lapid–Mao (§5.5), Emerton, Nakamura and Hellmann–Schraen (§4.3), Dieulefait–Guerberoff–Pacetti and Box (§2.30), Clozel–Thorne and Thorne 2024 (§§4.16, 4.22): not opened.
- The README's three statements that a source misprints (Henniart's exponent in §1.14, Wang's `+6` in §4.13, Qian's `ℤ[1/2N]` in §2.50): those texts were not read.
- dmw-2009 (§4.17): not read, as in the previous round.

## Source issues

- **Misprint** in bcgnt-2025 at Theorem 3.2.1, p. 36: the source says the output representation has "weight λ", with no λ in the statement; it should be weight 0; affects nothing.
- **Misprint** in bcgnt-2025 at Theorem 7.2.3, p. 70: the source says `S_π` is the set of finite places where π is unramified and then uses `v ∉ S_π`; it should be the places where π is ramified; affects nothing.
- **Misprint** in bcgp-2021 at the proof of Proposition 10.1.3, p. 266: the source writes the mod 3 representation with projective image `A₅` as a representation of `G_F`; it should be of `G_E`; affects nothing.
- **Misprint** in pilloni-stroh-2016 at the proof of Proposition 2.1.3, p. 10: the source concludes modularity of the restriction to `G_F`; it should be to `G_L`, the soluble extension over which the elliptic curve lives; affects nothing.
- **Gap** in bcgp-2021 at §2.9, p. 38: the source lets S be any finite set of places in the pole condition; it should contain the archimedean places and the ramification of Π and χ; affects nothing.
- **Misprint** in cg-2018 at §10, p. 97: the source bounds `N₂` below by `n` in the extra hypothesis and by `n+1` three lines later; it should be one bound in both; affects nothing.

## For the human reviewers

- Scope: §2.30 asks for explicit models, point counts, Mordell–Weil groups and Chabauty exclusions of six modular curves; the source obtained them with Magma (caraiani-newton-2023 lines 4946–4948, 5134). Whether these are roadmap targets or large computations is yours to decide.
- Wording: the statements of §§4.13, 4.19, 4.33 track their sources' theorem statements clause by clause (newton-thorne-II line 1289; bcgnt-2025 lines 2898, 3412), longest shared run 8 words; I treated them as forced by the mathematics.
- Reuse: §1.2 (README line 168) says its separation of cofinite Hecke agreement from all-place matching follows the API pattern of the Imperial College London FLT project; no declaration of `Suggested.lean` is taken from it.
