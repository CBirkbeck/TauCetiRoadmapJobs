# Review of MotivicStructuresInModuliOfCurves (pull request #2437 at dbadd30)

**Verdict:** accepted

No findings. The acceptance is conditional on the nine declared supplier gaps, whose slugs are identical in `design/plan.json` and in the README.

## Verified sound

| Target | Instances tried | Values computed (roadmap ↔ source/library) | Result | Change |
| --- | --- | --- | --- | --- |
| Previous R01: §9.5 *Needs* | line 1406 against WeilConjectures §§1.7–1.8 | now "WeilConjectures, WC.1 (finite groupoid mass, the stack compact-support trace formula and smooth proper transport), WC.5 and WC.6"; all three objects are in WC.1 | repaired | none |
| Same repair in §§1.2, 1.5, 2.7–2.9, 4.6, 9.3 | every *Needs* line naming WC.5 or WC.6 | 0 of 112 *Needs* lines names WC.5 or WC.6 without WC.1 | holds | none |
| §3.4 stable range (sampled) | `k = 2`; Wahl's three ranges | iso for `k ≤ (2g−2)/3`, `2g/3`, `2g/3` (wahl lines 44–53); minimum `(2g−2)/3`; `k = 2` needs `g ≥ 4`, dimension `n + 1` | holds | none |
| §4.3 even genus-two cohomology (sampled) | `(2, 20)`, `r = 6`; `Z ⊂ M̄_{2,20}` | `(1,11) ≺ (2,20)`: `13 ≤ 24`, `11 ≤ 34`, `11 ≤ 12`; `dim Z = 12`, codimension `23 − 12 = 11`, degree 22 | holds | none |
| §5.1 CKgP (sampled) | `ℙ¹`, elliptic curve, test stack `Y` | clp lines 458–462: same quantifier over every `Y`; `[Δ_{ℙ¹}] = [pt × ℙ¹] + [ℙ¹ × pt]` | holds | none |
| §6.4 splitting strata (sampled) | five splitting types | `3+3+4 = 2+4+4 = 2+3+5 = 10 = 5+5 = 4+6`; clp lines 605–616 and canning-larson-genus-seven lines 1026–1031 agree | holds | none |
| §7.2 fibre powers (sampled) | `n = 0, 1`; `x² + y²` over `ℝ` | clp lines 813–817 trivialise only the vector bundle; `n = 1` is §7.1; `dim OG⁺ = 45 − 35 = 10` | holds | none |
| §7.3 Mukai model (sampled) | centre of `Spin₁₀`; `n = 0` | `−1` acts by `−1` on `S⁺`, centre `μ₄`; clp line 855 uses `SO₁₀`; `dim G₀ = 9·7 = 63` | holds | none |
| §8.1 hyperelliptic quotient (sampled) | `g = 4`, `q = 5`; `g` odd | `#G = 480`, `#P₄ = 37500000 = 480·5⁷`; `(q−1)·q(q²−1) = (q²−1)(q²−q)`; arsie-vistoli lines 410, 455, 503 | holds | none |
| §8.4 quadric surfaces (sampled) | `q = 2`; three stabilisers | `q⁴(q²−1)(q−1)`, `2·#PGL₂(𝔽_{q²})`, `2·#PGL₂(𝔽_q)²`; at `q = 2`: 48, 120, 72; bfp lines 561–562 | holds | none |
| §8.12 signed four-point count (sampled) | every `q`, by twisted counts of `M_{0,4}` | `[4(q−2)(q−3) − 12q(q−1) + 8q(q+1)]/24 = 1`, so the count is `#(PGL₂ × PGL₂)(𝔽_q)`; 36 at `q = 2` | holds | none |
| §8.14 twisted sieve terms (sampled) | cone `λ = (2), (2,1), (3)`; `S₃` characters | bfp lines 1461–1474 sum to `#Aut·(table entry)`, remainder 0; `n = 3` characters equal bfp lines 1589–1597 through `q⁷` | holds | none |
| §§8.9–8.11 with §8.3 | `n = 0, 1, 2, 3` | total minus open count of §9.6: `0`; `q²`; `−q⁵ + …`; `−2q⁶ + …`; inside `o(q^{(9+n)/2})` and `Bq⁶ + o(q⁶)` | holds | none |
| §11.1 genus two, degrees 13 and 15 (sampled) | `(a,b) = (9,1), (9,3), (11,1), (10,0)` | `S_{a+3} = S₁₂`; `s₁₆S₁₂(−2) = L²S₁₂`; `s₁₄ = 0`; `H_c^k = 0` for `k ∉ {2,3,4}` (petersen-abelian-surfaces line 146) | holds | none |
| §11.3 basis of `H¹³(M̄_{1,12})` (sampled) | §3.6 sum at `n = 12` | `66 + 11L − 55 = 11 + 11L`; rank `2·11 = 22`; clp lines 1069–1072 | holds | none |
| §3.6 cusp multiplicities | `n = 13, 14, 15`, recomputed | `66 + 429L + 66L²`; `286 + 6006L + 6006L² + 286L³`; `1001 + 53053L + 186263L² + …`; `S₁₆`: 1 | holds | none |
| §12.6 weight-fifteen complex (sampled) | `(0,4)`, `k = 0`; `M̄_{1,2}` two-edge stratum | `ℚ → ℚ³`, cokernel `ℚ² = Gr^W_0 H_c¹`; edge swap acts by `−1` on `det`, summand 0; clp lines 1175–1179 | holds | none |
| §12.8 no `(15,0)` for `g ≥ 2` (sampled) | `g = 3`; `g = 1` | added loop gives vertex `(g−2, ·)` with 3 flags, stable at `g = 3`; fails at `(1,15)`: `S₁₆ ≠ 0`; clp lines 1199–1205 | holds | none |
| §12.10 genus three, `n ≤ 11` (sampled, headline) | `n = 11`, `k = 17` | `d = 17`; boundary degrees `≤ 15`; genus-one factors have `≤ 12 < 15` flags, so no `S₁₆`; clp lines 535–543 | holds | none |
| Headline §9.8, odd vanishing `≤ 9` | base regions `k = 7, 9` | `k = 9`: `(1,≤9), (2,≤7), (3,≤5), (4,≤3)`; genus five out since `2·5 = 10 > 9` | holds | none |
| Headline §§9.5, 9.7 and `stableMass_genus_four` | `q = 1, 2`; rows `n = 0..3` | equal bfp lines 111–117; palindromic; `7965, 47517, 388191, 3955127`; closed − boundary − open `= 0`; `χ = 2, 2, −2, −10` | holds | none |
| §9.9 equivariant counts | `n = 2, 3` | Schur rows sum to §§9.5–9.6; open at `q = 1`: `(2, −6, 0)`; compact − open equals bfp lines 1611–1617 | holds | none |
| `IsStableOfGenus`, `stableMass` | disconnected curve; `(1,1)`; `(0,2)`; `(1,0)` | `PrestableFamily` extends `GeometricallyConnected`, so no disjoint unions; `q + 1`; `0`; `0` | holds | none |
| Headline §§4.9, 4.11, finite generation | `k = 4, 11, 13` | `g′ ≤ 6`; seed `(1,11,11)` inside; `k′ = 13`: genus one `n′ = 13`, genus two `9 ≤ n′ ≤ 13` | holds | none |
| §4.5 filling criterion | `S = RH^*`, `(1,12,11)` | printed hypothesis (clp line 182, `k′ ≤ k − 2`) holds, yet `RH¹¹ = 0 ≠ 22`; corrected form calls `(1,11,11)` | holds | none |
| Headline §§10.2–10.4 | `k = 4, 6, 14` | `g′ < 7`, `n′ ≤ 4` inside `c = 10,10,11,11,7,5`; `6 ≤ (2g−2)/3 ⇔ g ≥ 10`; `k = 14` needs `(7, ≤2)` | holds | none |
| Headline §§12.1–12.2 | degree 13 base cases | `(1,≤13), (2,≤11), (3,≤9), (4,≤7), (5,≤5), (6,≤3)` against `c(g)` leave `(2,11), (1,11), (1,12), (1,13)`; clp line 1018 | holds | none |
| Headline §7.7, genus seven | `n = 0`; `n = 4` | `κ₀ = 12`, `π_*(ψ₁π^*α) = 12α`; `n = 4` claimed on `M°_{7,4}` only | holds | none |
| Headline §12.9 classification | `(1,15)`; `(2,12)` | `S₁₆` occurs at `(1,15)`; `825 + 11 = 836`, `880 > 836`, `891 > 836`; weight of `L^{d−12}S₁₂` is `2d − 13` | holds | none |
| §1.4 Getzler–Kapranov | `Δ(p₁²)`, `Δ(p₂)`; `V(0,3) = ℚ` | `h`, `h`; `MV(0,4)` of dimension 3; `Exp(t) = (1−t)^{−1}` | holds | none |

- **Source locators checked against the text:** about 70 in 11 sources (clp 30, bfp 22, and wahl, madsen-weiss, looijenga-stable, arsie-vistoli, petersen-genus-two, petersen-abelian-surfaces, graber-pandharipande, canning-larson, canning-larson-genus-seven), including all 15 sampled targets. The README flags no locator as unverified.
- **Library declarations opened at the pin:** 6. `PointedPrestableFamily` (`Curves/PointedPrestable/Basic.lean:68`), `PrestableFamily` (`Curves/Prestable.lean:45`), its category (`Curves/PointedPrestable/Category.lean:96`), `PrestableMap.const` (`Curves/StableMaps/Basic.lean:197`), `PrestableMap.infinitesimalAut` (`Curves/StableMaps/Automorphism.lean:321`), `Scheme.genus` (`Cohomology/Genus.lean:64`).
- **Cross-roadmap citations resolved:** about 85 section ids in 21 suppliers, on main or at the open heads; none missing. StableReductionPartII §5.15 does contain the comparison with the equivariant groups, and HabiroNahmSeries §5.1 the augmentation-complete logarithm and exponential.
- **Gate:** every check is 0, `OK`, with `build=0`; nothing changes outside the folder. Dependency check: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0; its only message is the `sorry` warning at 91:8. `#check @` on the three declarations gives the types of signatures.md, no binder lost.
- **Padding probe:** `simp`, `rfl`, `simp [stableMass]`, `norm_num [stableMass, IsStableOfGenus]`, `decide` and `infer_instance` all fail on `stableMass_genus_four`. The seven other headlines are named in the docstring with the missing carriers.
- **Pull request text:** the title and description contradict nothing at this head; the change since the previous review adds no supplier, section or declaration.
- **Duplication:** no other roadmap, on main or open, states tautological rings, the Chow–Künneth property, the Getzler–Kapranov formula, mapping-class stability or these point counts. HomologicalStabilityOfGeneralLinearGroups cites §3.4 here as the owner.

Overlap check: read VirtualFundamentalClassPartII, StableReductionPartII, AlgebraicGromovWittenTheory, WeilConjectures, CanonicalModelsAndGonality (open), StableReduction, EquivariantIntersectionTheory, AnalyticStableMaps (main). Shared objects and owners: the stacks `M̄_{g,n}`, clutching, cotangent lines and the Hodge bundle, StableReductionPartII (§7.11 leaves tautological rings to this roadmap); Vistoli's Chow groups, VirtualFundamentalClass; groupoid mass, traces and the sieve, WeilConjectures; equivariant Chow groups, EquivariantIntersectionTheory; gonality bound and canonical models, CanonicalModelsAndGonality. Kresch's Chow groups have no owner and are requested through gap:stack-rational-chow.

Source independence: 20 passages compared with 10 sources side by side, and an 8-word-run scan of the whole README and `Suggested.lean` against the 25 cached texts; outside bibliography titles the longest shared run is 13 words, the hypothesis of clp Lemma 4.3 (clp line 478), and the rest are stock phrases. Largest share clp, about 94 of 214 locators; contents compared with clp: independent (Layers 4–7 and 10–12 keep the order the *Needs* lines force, §§5.4 → 6.2 → 6.8 → 7.7 → 10.4 → 12.2, and none has the scope of one section of clp; Layers 0–3, 8 and 9 come from other sources). The tables of §§8.9–8.11 and 8.14 are sums the roadmap forms; bfp prints the individual terms.

## Not verifiable

- harer-vcd (§2.1, the virtual cohomological dimension): settled as uncertified, no text; the bounds agree with their restatement at bfp lines 226–231.
- mukai (§7.3, the genus-seven linear-section theorem): settled as uncertified, no text; checked only as recalled at clp lines 833–854.
- clp Figure 2 (§11.7, the 891 graphs and the coefficients `1/24`, `1/12`): the figure is an image and is not in the extracted text; the family sizes sum to 891 and the count of relations is 66.

## Source issues

- **Error** in clp at Lemma 2.1, hypothesis (2.2), pp. 4–5: the source says only smaller triples of degree at most `k − 2` are required; it should also require same-degree triples with fewer markings, since `RH^*` at `(1, 12, 11)` satisfies the printed form; affects a stated result.
- **Gap** in clp at the sentence before Corollary 2.7, p. 7: the source says Lemma 2.1 applied to the tautological system gives the corollary; it should treat the triple `(1, 11, 11)`, where the hypothesis fails; affects the proof.
- **Misprint** in clp at §5.3.1, before Lemma 5.8, p. 18: the source says the pulled-back quadratic bundle is the direct sum of `U` and its dual; it should be an extension of the dual by `U`; affects nothing.
- **Gap** in clp at the proof of Lemma 5.10, p. 19: the source says the orthogonal Grassmann bundle is a product over strata where the vector bundle is trivial; it should trivialise the quadratic form as well; affects the proof.
- **Error** in clp at equations (5.10)–(5.11), p. 20: the source says the half-spin representation gives a vector bundle on `BSO₁₀` and the quotient by `SO₁₀` is the pentagonal locus; it should use `Spin₁₀` and the quotient by `PSO₁₀`; affects the proof.
- **Gap** in clp at the proof of Lemma 8.2, p. 28: the source says the pairs with `2g − 2 + n ≤ 15` have the Chow–Künneth property; it should use `2g > 15` for `n ≤ 1`, since `(8, 0)` and `(8, 1)` are not in Table 1; affects the proof.
- **Misprint** in bfp at Corollary 3.2, p. 1330: the source says the conclusion concerns an arbitrary pair `(g, n)`; it should concern genus four with the same `n`; affects nothing.
- **Misprint** in bfp at the proof of Proposition 3.1, p. 1330: the source says the error term has exponent `md/2`; it should be `ms/2`, as in the hypothesis; affects nothing.
- **Misprint** in bfp at the opening of §9, p. 1351: the source cites the Getzler–Kapranov formula as Theorem 8.3; it should be Theorem 8.13, as on pp. 1353–1354; affects nothing.
- **Misprint** in bfp at §10.1, p. 1355: the source says the coefficient `−11` of the open count with three markings multiplies `q⁴`; it should multiply `q³`, as in Theorem 1.5; affects nothing.
- **Error** in canning-larson-genus-seven at Remark 2.3, pp. 6–7: the source says the covers of a fixed line form a scheme whose quotient is the Hurwitz stack; it should be a stack, since bielliptic covers have automorphisms over the line; affects nothing.

## For the human reviewers

- **Licence.** `kannan` (References, arXiv:2602.09117, version 2) is a 2026 preprint with no published version; it is cited only in §9.1 and the Corrections, for a misprint in Gorsky's quotient-genus formula.
