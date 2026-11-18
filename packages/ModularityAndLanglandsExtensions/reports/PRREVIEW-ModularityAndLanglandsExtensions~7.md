# Review of ModularityAndLanglandsExtensions (pull request #1180 at 73b52a7)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: since the last repair, the proofs of tensor-product functoriality lifting (§4.23) and of `SP_n` for all n (§4.30) are placed in ModularityAndLanglandsExtensionsPartII, a roadmap later in the merge order that itself imports this one, so the two supply each other and everything routed through §4.30 (including the route written for the Sato–Tate acceptance theorem) cannot be completed inside this roadmap and its suppliers. The fifteen sampled statements agree with their sources where the text could be read. There are five small corrections and one format note, none blocking; two points are left for the human reviewers.

## R01 (P1) — §4.23 and §4.30 are proved only in a later roadmap that imports this one, so supply runs in both directions

An implementer of this roadmap cannot finish §4.23 or §4.30, nor §§4.9, 4.12, 4.20, 4.29, 4.35–4.37 which reduce to §4.30, from this README and its suppliers: the inputs their routes use are targets of ModularityAndLanglandsExtensionsPartII only, and that roadmap in turn needs this one first.

How I know. Seven proof routes at this head point into Part II: §4.9 (line 2196, "ModularityAndLanglandsExtensionsPartII §14.1"), §4.12 (line 2206, §14.2(1)), §4.20 (line 2341, §14.2(2)), §4.23 (lines 2381 and 2383, §12.7 "with the symmetric-power patching of its Layer 9", and §§13.5–13.6), §4.29 (line 2484, §14.3) and §4.30 (line 2496, §13.10 and "Thorne's `p`-adic level raising (ModularityAndLanglandsExtensionsPartII §6.9)"). The merge order has this roadmap at line 210 and Part II at line 305. Part II (open pull request #2449, `TauCetiRoadmap/ModularityAndLanglandsExtensionsPartII/README.md` lines 2089–2093 at its head 141d7bd) says it "owns the proofs of the theorems that ModularityAndLanglandsExtensions states in §4.23 … and §4.30", and its supplier contract (lines 2182–2202) imports §§0.2, 1.7, 1.10–1.12, 1.15, 2.1, 2.13, 2.16, 2.25, 4.1, 4.2, 4.13, 4.15, 4.22 from here. So each roadmap is a supplier of the other, and the same theorems are stated in both (Part II §§12.7, 13.5–13.6, 13.10, 14.1–14.3).

The `*Needs:*` line of §4.30 (line 2500) lists §§1.12, 1.15, 4.15, 4.22, 4.23 only. The route needs more: in the source the step from the two residual witnesses to automorphy of `Sym^{p+r−1}` (Proposition 6.3, newton-thorne-hilbert lines 2311–2334) applies Thorne's level raising and a residually reducible automorphy lifting theorem, and neither is a target here (the level raising is Part II §6.9; §4.2 is not cited). Likewise §4.23 lost its `*Needs:*` entry for the symmetric-power lifting theorem when §4.11 was deleted, while its route still uses that patching (now "Layer 9" of Part II). The scope section still says "Layer4 owns tensor lifting/auxiliary curves" (line 3025) and neither it nor the supplier contracts mention Part II.

The smallest change that restores one direction is to move ownership, in either of two ways. (a) Hand the statements to Part II, which already restates them: keep here the definition of `SP_n` (§1.12), the cases `n ≤ 5` (§1.15), the one-prime criterion (§4.15) and the reductions (§4.22); delete from here the theorem of §4.23, §4.30 and the targets that are specialisations or consequences of §4.30 (§§4.9, 4.12, 4.20, 4.29, 4.35–4.37), listing them under "Scope and ownership" as stated by Part II; and route §4.34 through §§2.39–2.40 and §4.14 (see C01), so that the acceptance theorem stays provable here. (b) Or keep the statements and state the missing inputs as targets of this roadmap (the level raising, the residually reducible lifting step, the patching behind §4.23), with complete `*Needs:*` lines and no citation of Part II. Under either choice no sentence of this README cites Part II.

## C01 — The route of §4.34 and its `*Needs:*` line name different inputs

The route (line 2549) obtains entireness and nonvanishing from §4.29 and AL.3 and then applies §4.14; the `*Needs:*` line (line 2553) lists AL.3, §2.40 and EllipticCurveModularity R29.6, with neither §4.29 nor §4.14 nor the `SU₂` input of CompactGroups, and the contract "From EllipticCurveModularity, Layer R29.6" (line 3249) again says the purpose is "to apply NT non-CM symmetric powers". An implementer cannot tell which proof is planned. The README's own remark that "Potential automorphy with Brauer nonvanishing already suffices" is right, and that route stays inside this roadmap: write the route as §2.39, §2.40 (meromorphic continuation and nonvanishing on `Re s ≥ 1` by Brauer induction) and §4.14, and list §2.39, §2.40, §4.14 and CompactGroups Layers 5–6 in `*Needs:*`.

## C02 — The non-CM hypothesis of `satoTate_elliptic` is hand-built although Tau Ceti has the predicate, and the README misnames the ring

`Suggested.lean` (lines 65–66) states non-CM as surjectivity of `Int.castRingHom` onto `TauCeti.Isogeny.Hom` of the base change to ℂ, and §4.34 calls this "Tau Ceti's geometric endomorphism ring `TauCeti.Isogeny.Hom`". At the pin the geometric endomorphism ring is `WeierstrassCurve.GeometricEnd` (endomorphisms over `SeparableClosure F`, `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/ComplexMultiplication.lean` line 94) and geometric CM is `WeierstrassCurve.HasGeometricCM` (line 100). The statement as written is true (endomorphisms over ℚ̄ and over ℂ agree), but that agreement is an extra theorem between the hypothesis and the library's notion. Would the hypothesis be `¬ E.HasGeometricCM`, with the import of that module? If ℂ is kept on purpose, the README sentence would say "the endomorphism ring of the base change to ℂ" and that it equals `E.GeometricEnd`.

## C03 — Three locators do not land where the text says

In §2.20 the heading and the locator read "Qian Lemma 4.3", and the reference entry for [Qian] says locators use arXiv v1; there Lemma 4.3 (p. 25, qian-2023 line 1237) is the enormous-image and decomposed-generic lemma. The Steinberg-and-ordinarity statement is Lemma 4.0.3 of the thesis (pp. 64–65, qian-thesis-2023 lines 1632–1665), which I checked and which supports §2.20; the heading would name the thesis lemma, or say "published Lemma 4.3". In §2.9, "[Qian], §3, Lemmas 3.1–3.10, pp.9–21": §3 begins on p. 10 (qian-2023 line 441). In §2.40 the sentence "BLGGT 5.4.2: (1) … (2) … (3) …" lists the three parts of Corollary 5.4.3 (blggt-2014-v4 lines 3457–3466); 5.4.2 only supplies the assumptions, so "under the assumptions of BLGGT 5.4.2, Corollary 5.4.3 gives".

## C04 — The description no longer describes how symmetric powers are proved

The description says "everything else named in the README is a consumer, not a prerequisite" and that symmetric powers "follow Newton–Thorne's induction on the rank". At this head the README names ModularityAndLanglandsExtensionsPartII seven times as the place where §§4.23 and 4.30 are proved (R01), which is neither a supplier in the description's lists nor a consumer. After R01 is repaired the text would say which of the two holds, for instance "the proof of `SP_n` for all n is the subject of ModularityAndLanglandsExtensionsPartII; this roadmap states `SP_n`, proves it for n ≤ 5 and proves Sato–Tate by potential automorphy".

## C05 — `d±` in the Conventions is not defined, and read as eigenspace dimensions the displayed formula is wrong on the README's own example

For `Sym²H¹(E)` the Conventions give trace 1 and determinant −1 for complex conjugation, so the `+1`-eigenspace has dimension 2. The displayed formula `d± = (n ± (−1)^(w/2+(n−1)/2) det(R)(c))/2` with `n=3`, `w=2` gives `d+ = (3 + (+1)(−1))/2 = 1`. The formula is right only if `d±` counts the exchanged pairs plus the middle line according to whether `c` acts there by `±(−1)^{w/2}` (here `c=+1=−(−1)¹`, so the middle line counts towards `d−`, matching the `Γ_ℝ(s)` chosen two lines later). Say that in one clause where `d±` is introduced.

## N01 — Two names in code font are attributed to suppliers that do not use them

`GSp4ClassificationInputs` (§§3.9, 3.30 and the contracts) is cited as part of EndoscopicTransferAndUnitaryTraceComparison §11.1, which on main speaks of "the symplectic classification contract of §§11.0g–11.0h" and has no such name; `CoefficientRobbaModule.etaleEquivalence` (§4.3) is cited from LocalGaloisDeformationRings §0.4, where it does not occur. A reader who searches for them finds nothing: write them in prose, or cite the supplier's own wording.

## Questions for the author

- In §2.20, "constant automorphic weight `+λ_τ=M(a_τ)`, central slope `+nλ_τ`": the thesis proof writes the weight as `(−λ_τ)` in Geraghty's notation and compares valuations with exponent `−nλ_τ` (qian-thesis-2023 lines 1650–1665). Is the sign in the README the translation to the BLGGT convention of the Conventions section? I could not settle it without Geraghty's Lemma 5.2, which I did not read.
- §4.23, second paragraph, weakens Newton–Thorne's hypothesis "`SP_{r−1}`, `SP_r`, `SP_{r+1}`" (newton-thorne-hilbert lines 2076–2079) to "`SP_{r−1}` if `r>1`". For `r=1` the conclusion is automorphy of `ϕ_p r̄_π`, which holds without any `SP`; is that the reason, and would the sentence say so, since `SP_0` is not defined in §1.12?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.7 projective image condition | `(p,a,n)=(7,1,3)`, `(5,1,·)`, `(2,3,4)` | `7>max(5,5)`; `5>5` false; `8>max(5,7)=7`. Source: `p^a>max(5,2n−1)`, sandwich (newton-thorne-II lines 218–222) | agrees | none |
| 1.9 odd Artin over totally real fields | source Thm 0.3 | totally odd, irreducible, finite image ⇒ weight-one cuspidal eigenform, `L` entire (pilloni-stroh-2016 lines 50–54); BCGP use for `A₅` over `𝔽₉` (bcgp-2021 lines 12809–12812) | agrees | none |
| 1.15 `SP_n`, `n≤5` | `n=1,2,3` | `Sym⁰`=trivial, `Sym¹=π`, `Sym²` Gelbart–Jacquet; source "cases n ≤ 5 known" (newton-thorne-hilbert lines 132, 2336) | agrees | none |
| 2.5 weight-zero lifting | `n=2` | HT `{0,1}`; `p>n`; `Π_v` unramified at `v∣p` or where `ρ,π` both unramified (bcgnt-2025 lines 1769–1789) | agrees | none |
| 2.9 Dwork eigenrealizations | shift of all `a_i` by `b` | `χ` multiplied by `(∏ξ_i)^b=1`; `H₀`, `T₀` as in qian-2023 lines 451–461 | agrees | page in C03 |
| 2.20 Steinberg and ordinarity | thesis Lemma 4.0.3 | maximal nilpotent `N` ⇒ Steinberg by Varma; HT `(λ_τ,…,λ_τ+n−1)` (qian-thesis-2023 lines 1632–1665) | agrees with thesis | heading in C03; sign question |
| 2.26 BLGGT 4.5.1 | hypotheses list | `l_i≥2(d_i+1)`, `ζ_{l_i}∉F`, PD, `r̄|G_{F(ζ)}` irreducible; output (i)–(iv) (blggt-2014-v4 lines 2700–2727) | agrees | none |
| 2.46 BLGGT 5.5.3 | `s=1` | pure, extremely regular, totally odd, polarizable ⇒ sum of irreducible strictly pure systems (lines 3837–3841) | agrees | none |
| 2.47 Dwork fibre at `l′` | proof of Thm 1.1 | ACC+ 6.1.2 at `p=l′`, then Lemma 3.10(4) at `v(t)<0` (qian-2023 lines 1216–1232) | agrees; README keeps `ss` | none |
| 3.9 `GSp₄` six families | `S_ψ` list | 1, `C₂`, 1, `C₂`, `C₂`, 1; `ε_ψ` nontrivial only in (d) (gee-taibi-2019 lines 1737–1754); general type as bcgp-2021 lines 1895–1903 | agrees | N01 |
| 3.13 extended parameters | `SL₂`: Klein-four in `SO₃`; dihedral | centraliser `V₄`, `S_ϱ=(ℤ/2)²`, packet 4; dihedral non-quadratic: `S_ϱ=ℤ/2` (kss-2021 lines 357–365 for the definition) | agrees | none |
| 3.30 symplectic pairing | weight `(2,2)`, `t=rs(p−1)` | `ε^{−2t}≡1` mod p since `(p−1)∣t`; source route (cg-2020 lines 1416–1434) | agrees | N01 |
| 4.17 completed `Λ(Sym^n E,s)` | `n=0,1,2,4`; conductor 11, `s=2` | `γ₀=Γ_ℝ(s)`; `γ₁=Γ_ℂ(s)`; `γ₂=Γ_ℝ(s)Γ_ℂ(s)`; `n=4`: `Γ(s/2−1)`; ratio `11^{2/2}=11` (martin-watkins-2006 lines 342–353) | agrees | none |
| 4.25 Serre's criterion | ST trivial; `C₂` | trivial character: pole of `ζ_F^S`, PNT; source: continuation, holomorphic and nonzero on `Re s=1` (bcgnt-2025 lines 3474–3482) | agrees | none |
| 4.34 Sato–Tate, README Checks | `y²=x³−x+1` at 5, 7, 23; `E′` | `Δ=−368=−2⁴·23`; 7 and 11 affine points, `a₅=−2`, `a₇=−4`; roots `−1±2i`, `−2±i√3`; `Δ′=5¹²Δ` | all true | none |
| `satoTate_elliptic` (Lean) | `x<2`; non-CM hypothesis; one-tactic probe | card 0 gives `0/0=0`, limit unaffected; `Hom` = zero or unital maps, a ring (`Hom/Ring.lean` line 208); `simp`, `rfl`, `infer_instance`, `exact tendsto_const_nhds` all fail | true, not padding | C02 |
| 4.30 `SP_n` for all n | `n=6,7,8` | `(p,r)=(5,1),(5,2),(5,3)`; needs `SP_{r±1}`, `SP_r`, `SP_{p−r}`, all `<n`; source Thm 6.4 and Prop. 6.3 (newton-thorne-hilbert lines 2311–2340) | statement agrees; route unowned | R01 |
| 4.23 tensor lifting | `r=1,2` | weights `{0,1}+{0,2}=[0,1,2,3]`; `{0,1}+{0,1}=[0,1,1,2]` repeats; nine hypotheses of Thm 4.1 (lines 1183–1202) | statement agrees; route unowned | R01 |
| 4.22 reductions | conditions (1)–(8) | each matched to Prop. 6.1 (lines 2127–2149); `S` is the set, not a superset | agrees | none |
| 4.33, 4.38, 4.42 | BCGNT 7.2.1, 7.1.1, 7.2.3 | `H_τ={0,m}`, pure of weight m; induced branch splits into rank ≤2 (bcgnt-2025 lines 3412–3432, 3385–3387, 3461–3473) | agrees | none |
| Conventions: `Sym^mH`, gamma factors | `m=2`; `q=9` | det `ε^{−3}`, c: trace 1, det −1, `Γ_ℝ(s)Γ_ℂ(s)`; `9^{3/2}=27`, `27²=729` | true | `d±` in C05 |

- Source locators checked against the text: 24, in 13 sources (bcgnt-2025, newton-thorne-hilbert, newton-thorne-II, blggt-2014-v4, qian-2023, qian-thesis-2023, bcgp-2021, pilloni-stroh-2016, kedlaya-ant-2025, kss-2021, cg-2020, gee-taibi-2019, martin-watkins-2006).
- Library declarations opened at the pin: `TauCeti.Isogeny.Hom` (`Hom/Basic.lean` line 106), its ring instance (`Hom/Ring.lean` line 208), `WeierstrassCurve.GeometricEnd` and `HasGeometricCM` (`Hom/ComplexMultiplication.lean` lines 94, 100), Mathlib `WeierstrassCurve.minimal`, `reduction`, `HasGoodReduction` (`EllipticCurve/Reduction.lean` lines 300, 317, 324), `localPolynomial` (`EllipticCurve/LFunction.lean` line 42), `Matrix.charpolyRev`, `Matrix.ProjGenLinGroup`, `tateModuleGaloisRepresentation`.
- Cross-roadmap citations resolved: Part II at its head (§§6.9, 9, 12.7, 13.5–13.6, 13.10, 14.1–14.3 exist); ET §11.1, LGD §0.4, GL2T R16.4.4 and R17.5.5, ArithmeticGaloisRepresentations §7.10 on main; no open roadmap cites a section this head removed (§§4.4–4.8, 4.10–4.11, 4.31–4.32).
- Dependency check output: `depcheck: 218 roadmaps, 2391 edges, 0 problem(s)`. It reports nothing for the Part II citations, which stand in proof-route sentences and not in `*Needs:*` lines or contracts.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: one warning, the `sorry` at line 64. The three elaborated signatures were compared with §4.34; no binder lost.
- No change outside the roadmap folder against the base.
- Read in full: the Conventions, Layers 0–1, the sampled targets, the whole symmetric-power chain of Layer 4 (§§4.9–4.43), the scope and the contracts. The targets of Layers 2, 3 and 5 outside the sample were read at the level of statement, locator and `*Needs:*` only.
- Overlap check: read ModularityAndLanglandsExtensionsPartII, AutomorphicGaloisRepresentationsPartII (AG2.6 contract), EndoscopicTransferAndUnitaryTraceComparison §11.1, LocalGaloisDeformationRings §0.4, GL2AutomorphicRepresentationsAndTransfer R16–R17; shared: the theorems of §§4.23, 4.30 and their rational corollaries, stated here and proved (and restated) in Part II — no single owner, R01. Nothing else shared.

Source independence: 16 passages compared with 13 sources, none shared beyond theorem statements the mathematics forces (longest run about 7 words, §4.36 against newton-thorne-hilbert line 2362); largest share blggt-2014-v4, 21 of 153 locators; contents compared with blggt-2014-v4: independent (its results appear in §§2.13–2.46 interleaved with five other sources and out of its order, e.g. 4.5.1 before 4.4.1). dmw-2009 could not be read.

Research link: §§4.30 and 4.35 are Newton–Thorne's symmetric power functoriality for Hilbert modular forms (2022 preprint, Annals 2026); §§4.33, 4.38, 4.42 are Boxer–Calegari–Gee–Newton–Thorne's Ramanujan and Sato–Tate theorems over CM fields (2023); Layer 2 is Barnet-Lamb–Gee–Geraghty–Taylor (2014). Rests on the README's references and the texts read.

## Not verifiable

- dmw-2009 (§4.17, finite Weil–Deligne factors and conductors): the public journal copy is on a host the sources service places in no licence class; not read.
- The published version of qian-2023 (Invent. Math. 231, p. 1273, cited in §2.20): paywalled; the arXiv and thesis texts were read instead.
- ACC+ Theorem 6.1.2, hypothesis (5) (§2.47) and Geraghty's ordinarity lemmas (§2.20): not opened.
- NT I and Clozel–Thorne locators kept in §§4.9, 4.12, 4.20, 4.22: not opened this round.

## Source issues

- **Misprint** in bcgnt-2025 at Theorem 7.2.3, p. 70: the source says `S_π` is the set of finite places where π is unramified and then uses `v ∉ S_π`; it should be the places where π is ramified; affects nothing.
- **Error** in kedlaya-ant-2025 at §24.4, printed p. 134: the source says E has complex multiplication when its only endomorphisms are multiplication by integers; it should be when it has endomorphisms other than these; affects nothing.
- **Misprint** in kedlaya-ant-2025 at Conjecture 24.3, printed p. 134: the source bounds the number of i with `N(x_i) ≤ c`; it should be the number of i with `N(x_i) = n`, for every n; affects nothing.
- **Misprint** in bcgp-2021 at the proof of Proposition 10.1.3, p. 266: the source writes the mod 3 representation with projective image `A₅` as a representation of `G_F`; it should be of `G_E`, the quadratic extension; affects nothing.
- **Misprint** in newton-thorne-hilbert at Corollary 6.2(2), p. 49: the source says "each place v|p of F"; it should be of E, the field over which π′ lives; affects nothing.

## For the human reviewers

- Licence: dmw-2009 is linked in the README to a PDF on the publisher's archive host (README reference "dmw-2009"); the sources service puts that host in no licence class, so its status was not settled and the text was not read.
- Reuse: §1.2 (README line 168) says its separation of cofinite Hecke agreement from all-place matching follows the API pattern of the Imperial College London FLT project; no declaration of `Suggested.lean` is taken from that repository.
