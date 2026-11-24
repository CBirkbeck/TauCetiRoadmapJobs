# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at 8d0b573)

**Verdict:** needs changes

**Summary.** The eight new Layer 9 sections (§§9.10a–9.10c, 9.12–9.12c, 9.13) state Kollár's, Angehrn–Siu's and Ein–Lazarsfeld's theorems correctly: every statement and Check I computed holds, and the sampled locators match their sources. Three findings block acceptance. First, these sections make this roadmap a supplier and a consumer of its own Part II at once, so supply between the two now runs both ways. Second, the proof route of the isolated non-klt centre theorem rests on inversion of adjunction, openness of klt and lc in families, and Bertini for pairs, and no section plans any of them. Third, the Angehrn–Siu theorem can be stated at the pins but `Suggested.lean` neither states it nor says why. There are two small corrections and no format notes. The human reviewers have one licence question to decide, about where the Olsson lecture notes are hosted.

## R01 (P2) — The new sections make this roadmap and its Part II supply each other

A Part I that consumes its own Part II, which consumes Part I in turn, has no single direction of supply. Neither roadmap can be built or merged strictly after the other, and the merge order (this roadmap 37th, Part II 283rd) no longer describes the dependence. The new sections cite AlgebraicModuliForArithmeticGeometryPartII §§0.7, 1.5, 1.6, 1.6a, 1.7, 1.7a and 3.3. They do so in the *Needs:* lines of 9.10a, 9.10c, 9.12, 9.12a, 9.12b and 9.12c (README lines 10177, 10243, 10311–10315, 10332–10333, 10372, 10412), in the scope (lines 10568–10572) and in the contract table (line 10710). On main this README cited Part II nowhere. Part II, on main and at this head, cites this roadmap throughout: §1.6 needs §1.6 here (Part II README line 319), §3.4 needs §§1.4–1.5 (line 729), and §§2.1, 2.4 and 2.5 need §§7.3 and 7.6.1 (lines 424, 477, 490). The two sections this pull request adds to Part II also need this roadmap. Part II §1.6a, Kodaira's lemma (line 333), and §1.7a, asymptotic Riemann–Roch (line 402), each need §1.5 here (`hilbertPolynomial`), and §9.12 here needs exactly those two sections. The chain is acyclic section by section (9.12 → Part II §1.6a → §1.5 here), but the supply between the roadmaps runs both ways.

The smallest repair moves the sections that need Part II downstream of it. §§9.10a–9.12c could become a new layer of AlgebraicModuliForArithmeticGeometryPartII, which already owns `ℚ`-Cartier divisors, nefness, bigness, Kleiman's nonnegativity and global generation, and which may cite §§9.4, 9.7 and 9.10 here as it already cites this roadmap. Alternatively they could go to a separate roadmap placed after Part II. §9.13 uses only §§9.4 and 9.10 and can stay. Either way, the *Corollary of:* lines of MultiplierIdealsOfPairsAndPointSeparation follow the sections to their new home.

## R02 (P2) — The route of the isolated non-klt centre theorem uses inputs that no section plans

The route of 9.12 cannot be followed as written: it reaches a non-lc divisor at a singular point and cuts down the minimal centre by results that are neither targets here nor cited supplier sections. 9.12, 9.12a, 9.12b and 9.12c all depend on that route. The route cites Kollár 1997, 7.8, for the claim that the limit divisor at a singular point is not lc (README line 10303). It cites 6.8.1 for cutting down the centre (line 10306), and 6.8.1's proof uses inversion of adjunction 7.5.2 (Kollár, p. 37) and 7.8 again (p. 38). In Kollár these rest on the connectedness theorem 7.4 and on relative vanishing for klt pairs, 2.17.3 (pp. 42–44). The tie-breaking step, and the closing addition of "a general effective `ℚ`-divisor … which preserves klt and lc near `x`", use Bertini for pairs (Kollár 4.8, used at 6.9.1). For ℓ points, 9.12c's route defers to Angehrn–Siu §§7–9, whose limit argument is the analytic counterpart of 7.8 (§§5–6, through the Ohsawa–Takegoshi theorem). The *Needs:* line of 9.12 (lines 10311–10315) names none of these. Searching main and every open roadmap pull request found no roadmap that states inversion of adjunction or openness of klt and lc in families. The only mention is a method label in MultiplierIdealsOfPairsAndPointSeparation, line 282.

Add a target, next to 9.10a or before 9.12, stating these three results with their hypotheses. They are inversion of adjunction (Kollár 1997, Theorem 7.5, with the connectedness Theorem 7.4), openness of klt and lc in a family over a smooth curve (Corollaries 7.6 and 7.8), and klt and lc of general members (Theorem 4.8). Its *Needs:* line should include the local vanishing of 9.10b. Then list the target in the *Needs:* lines of 9.12, 9.12b and 9.12c. If R01 moves these sections, the new target moves with them.

## R03 (P2) — The Angehrn–Siu theorem can be stated at the pins but is neither stated nor named in `Suggested.lean`

`Suggested.lean` is the acceptance test, and its docstring counts the main theorems of each layer's guide as headlines (for example Kawamata–Viehweg vanishing and Kollár–Matsusaka boundedness). The summary now says that Layer 9 develops the Angehrn–Siu and Kollár theorems on global generation and point separation (README lines 59–61). Of these, §9.12c, `angehrnSiuPointSeparation`, needs only a smooth projective variety, an ample line bundle, intersection numbers `(L^d · Z)` and `K_X`. The pinned libraries supply all of them, given two definitions with real bodies. MultiplierIdealsOfPairsAndPointSeparation does exactly this at this head: its `adjoint_separates_points` defines `selfIntersection`, as Euler-characteristic differences, and `canonicalBundle`, as `det Ω_{X/k}`. That file elaborates against the pins with a single `sorry` warning (I ran it). Yet this roadmap's `Suggested.lean`, which this pull request leaves unchanged, neither states §9.12c nor lists it among the headlines that cannot be stated.

State §9.12c in `Suggested.lean`, over `ℂ` as the README has it, with those two definitions. If R01 moves the section, it goes in that roadmap's `Suggested.lean` instead.

## C01 — The docstring of `Suggested.lean` does not name the new Layer 9 theorems that cannot be stated at the pins

The docstring lists Layer 9's non-statable headlines as resolution comparisons, Kawamata–Viehweg vanishing and Kollár–Matsusaka boundedness. It omits the theorems this pull request adds: Nadel vanishing for pairs (9.10c), Kollár's global generation and two-point separation (9.12a–9.12b) and Ein–Lazarsfeld division (9.13). A sentence would fix this. It would say that these need `ℚ`-Weil divisors with the `ℚ`-Cartier condition, discrepancies over all normal birational models, and multiplier ideals of pairs and of ideals, none of which exists at the pins.

## C02 — The description understates which sections of Part II this roadmap now cites

The description says: "AlgebraicModuliForArithmeticGeometry now cites its PartII (§§0.7, 1.6, 1.7)". The head cites §§0.7, 1.5, 1.6, 1.6a, 1.7, 1.7a and 3.3 (README lines 10568–10572 and 10710). Two of these, §§1.6a and 1.7a, are new in this pull request and themselves cite §1.5 of this roadmap. The sentence would be right as: "AlgebraicModuliForArithmeticGeometry now cites its Part II (§§0.7, 1.5–1.7a and 3.3); Part II's new §§1.6a and 1.7a cite §1.5 of AlgebraicModuliForArithmeticGeometry." (R01 asks for a change that would make this sentence obsolete.)

## Previous findings

- The previous review, of an earlier pull request at `e5f9c4c`, raised no finding. The five items it recorded as repaired concern passages this head leaves unchanged, and they still hold: no *Needs:* line cites ComplexComparisonPartII, and the CrystallineCohomology CR.5 citations and the scheme-case sentence of SchemeAndStackFoundations §1.1 are unchanged.

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §1.1 `projectiveBundle`, `integerTwists` | `E=0`; `E=L` invertible | `P(0)=∅`; `P(L)=S`, `O(1)=L`. Stacks Constructions Def. 21.1 p. 45, Lemmas 16.10–16.11 p. 40, Lemma 10.3 p. 18 | Locators and statements agree; none |
| §1.2 `relativeBundleCohomology`, `relativeSerre` | `E=O(1)⊕O` on `P¹`; non-quasi-compact base | `R¹π_*O(−2)=Hom(det E,O)=O(−1)`; Stacks 01XX (`n≥1`), 02O1 needs Noetherian S; README's bound is local | Agree; none |
| §1.7a `coefficientFrobeniusCutoff` | `p=3,N=3,j=2,c=5`; `p=0`, `(a,b)` | exponent 6, coefficient 5; target length 1, value `a+b` | Checks true; no source needed (definition) |
| §3.5 descent comparisons | tags of every locator | 04W8 p. 3; 060V–060X pp. 5–6; 07UB, 07UC p. 19; 0D3C pp. 21–22; 0ADT p. 35; 05Y9–05YC pp. 16–17; 05Y6, 0BL3 pp. 208–209; 0262 p. 12; 02VG, 03C5 p. 39 | All at their locators; none |
| §4.13 fixed-band Hom | Stacks 06NZ, 0CJY; GWZ20 Def. 2.6 | gerbe definition and abelian-band lemma as cited; GWZ banding Def. 2.6 (arXiv numbering) | Agree; Olsson locators not read |
| §4.19 `affineFactorExistence` | `BC₄→BC₂`; identity of `BC₂` | kernel `C₂`, middle `BC₂`; kernel trivial. Borne–Vistoli 2019 Prop. 3.9 p. 8 | Agree; none |
| §4.21 intrinsic band, `CoherentInverse` | restrictions ×2 then ×3 | 1 ↦ 6 by both paths; Johnson–Yau Lemma 6.1.13 printed p. 180, Prop. 6.2.16 p. 184 | Agree; none |
| §4.22 `hopfInclusion_faithfullyFlat`, `affineNormalQuotient` | `k[t^p]⊂k[t]`, char p; `Gₘ→Gₘ`, `t↦t²`; `GL₂/B` | free of rank p; kernel `μ₂`; `P¹`, not affine. Milne v3.00 Thm 6.43 p. 69, Cor. 8.25 p. 105, 8.70–8.77 pp. 119–121, 7.73 p. 92 | Agree; none |
| §4.23 `BooleanCofiltered`, Hom equivalence | empty 2-category; monoid `{1,0}` | BV 2012 Def. 3.2 omits nonemptiness, README adds it; `{1,0}` cofiltered with 2 endomorphisms. Props. 3.7–3.8 p. 6; Bresciani Lemma 2 | Agree; none |
| §7.6 Picard sheaf and splitting | `X=B` | sheaf zero though `Pic(B)≠0`; Stacks Quot 0D25, 0D27, 0D28, 0D29, 0D2B as cited | Agree; none |
| §7.6.2 normalization | Nagata base | Stacks 0BAU, 0BAV, 0BB5: finite type over Nagata is Nagata; normalization finite | Agree; none |
| §8.3 completion, `effectiveVersal_algebraization` | Noetherian stalk | Stacks 05GH (completion Noetherian), 07XH pp. 20–21 (versal, effective, G-ring, limit preserving) | Agree; Matsumura 8.4 not read |
| §9.7 relative embedded resolution | `y=x²` with `E:x=0`, `E:y=0`; `X=E` | transversal, reduced; restricted ideal `(x²)`; excluded pair | Checks true; BM numbering not read |
| §9.10a `pairDiscrepancy` | cusp `y²=x³`, `Δ=cC`; cones over conic, cubic | discrepancies `1−2c, 2−3c, 4−6c, −c`; klt iff `c<5/6` (c=5/6 gives −1); cubic cone −1, conic cone 0 | True; Kollár Defs. 3.3–3.5 pp. 15–17, 3.10–3.13 pp. 18–19 |
| §9.10b `pairMultiplierIdeal` | cusp, `c∈[5/6,1)`; `𝔸²`, `cL` | round-ups `0,0,−1,0`, so `J=𝔪`; `J=O(−⌊c⌋L)`; cubic cone `J=𝔪` | True; Kollár 2.16 p. 13 is this push-forward |
| §9.10c `pairNadelVanishing` | `P²`, `Δ=cL₀`; `c=1`; elliptic curve, `L=O` | `deg(L−K−Δ)=m+3−c>0` iff `m≥−2`; `J=O(−1)`, `m≥−1`; `h¹(O)=1` | True; smooth case equals §9.10 clause with `a=O(−qΔ)`, `c=1/q` |
| §9.12 `isolatedNonKltCentre` | `P¹`, `N=O(a)`, `c₁=1` | hypothesis `a>1`; `D = x + (a−1)y`, `y≠x`, is lc and not klt at x; matches Kollár 6.4 p. 35 | True; route gap is R02 |
| §9.12a `adjointGlobalGeneration` | `P¹`, `a=2,1`; `(P¹,−½p)`, `N=½p+q` | `O(0)` generated; `O(−1)` none; `M=O(−1)` has no section, so Δ must be effective | True; Kollár 5.8 omits effectivity (Source issues) |
| §9.12b `kollarTwoPointSeparation` | `P¹`, `N=O(a)`; `n=2`, `c=5` | `c₁≥2`, `a≥3` iff `O(a−2)` separates; `2/5+2√2/5≈0.966≤1`; `Σ(e+1)=n(n+3)/2` | True; Kollár 5.9 pp. 30–31 |
| §9.12c `angehrnSiuPointSeparation` | `P¹`, `ℓ=2`; `n=2`, `ℓ=3` | threshold 2, `a≥3`; `Σ(d+ℓ−1)=3+4=7=½·2·7`; source `≥½n(n+2r−1)+κ` equals strict form on integers | True; statable (R03) |
| §9.13 `globalDivisionByGenerators` | `P¹`, `x,y`, `k=1`, `ℓ=2`; reduced points | `a=3`: degree 1 equals `x·c₁+y·c₂`; `a=2`: `1∉(x,y)·0`; `I_ℓ=I_Z^{ℓ+1−n}` (ELS proof of 2.2) | True; E–L Prop. 1.2(ii) p. 12 |
| `hilbertSerre` | `A=k[ε]`, one variable; `σ=∅` | lengths 2, `h=2`, `P=2` (deg 0<1); finitely many pieces, `P=0` | True; not one-tactic |
| `coherentDevissage` | `X=Spec k`; `X=∅` | `G=k`, induction by sequences; no irreducible Z, `hzero` gives all | True; matches Stacks dévissage |
| `polynomial_approximation`, `artinApproximation` | `ℚ[t]_(t)`, `z²=1+t`; complete A | solution in `ℚ[[t]]`, none in ring, one in étale `A[z]/(z²−1−t)`; `ψ=φ` | True; matches Stacks 07QZ, 07QY |
| R01 two-way supply | Needs lines of both READMEs | 9.12 → Part II §1.6a (line 333) → §1.5 here; merge order 37 against 283; Part II cited 0 times here on main | Finding R01 |
| R02 unowned route inputs | Kollár 6.7.1, 6.8.3.4, 6.9.1 | uses 7.8, 7.5.2, 4.8.2; grep over main and open heads: no owner | Finding R02 |

- Source locators checked against the text: 15 sampled sections; about 60 locators in Kollár 1997, Angehrn–Siu 1995, Ein–Lazarsfeld 1999, Ein–Lazarsfeld–Smith 2001, ten Stacks chapters, Milne v3.00, Borne–Vistoli 2012 and 2019, Johnson–Yau, Bresciani and GWZ20.
- Library declarations opened at the pins: `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:65` (`canonicalBundle`, curves only) and `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:111` (intersection with curves). The elaborated types of all seven declarations match the README, with no binder lost; the file is unchanged.
- Cross-roadmap citations resolved: AlgebraicModuliForArithmeticGeometryPartII §§0.7, 1.5, 1.6, 1.6a, 1.7, 1.7a, 3.3 at this head; SchemeAndStackFoundations §§2.2, 2.6, 3.4, 4.17 and Layer 5 on main; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 5.6 on main; the family's *Corollary of:* lines.
- Record: the merge-base README against the head shows 0 layers or items removed. Ten lines were rewritten, each extended in place. Eight sections were added.
- Automatic checks: all passed at this head. Dependency check with `--movable`: `depcheck: 131 roadmaps, 1455 edges, 0 problem(s)`. It does not report R01 because both roadmaps are on main.
- Elaboration of `Suggested.lean`: five `sorry` warnings (lines 48, 73, 87, 119, 131), nothing else. The family's `Suggested.lean`, elaborated for R03, gives one `sorry` warning.
- Overlap check: read MultiplierIdealsOfPairsAndPointSeparation, ResolutionOfSingularitiesCharacteristicZero, SchemeAndStackFoundations, StableReductionPartII, FunctionFieldArithmeticPartII, FunctorOfPoints and ComplexComparisonPartII. Owners of shared objects:
  - Algebraic pairs, multiplier ideals of pairs, Nadel vanishing for pairs, point separation and Ein–Lazarsfeld division belong to this roadmap. The family states corollary forms and names this roadmap as owner.
  - Analytic multiplier ideals, Nadel vanishing (C7.17), separation of points (C7.18) and Skoda division (C7.6) belong to ComplexComparisonPartII.
  - Log resolutions come from ResolutionOfSingularitiesCharacteristicZero.
  - `ℚ`-Cartier divisors, nefness, bigness, Kodaira's lemma, Kleiman's nonnegativity and asymptotic Riemann–Roch belong to Part II (R01).
- Source independence: 12 passages compared with 8 sources, none shared beyond wording the mathematics forces (the conclusion clauses of Kollár 6.4). Largest share: the Stacks project, about 345 of roughly 600 citation lines. The layers do not follow Stacks' chapter order. The new sections' order (§3, then 2.16, then §6, then 5.8–5.9) differs from Kollár's, and the *Needs:* lines force it. Result: independent.
- Research link: The new Layer 9 sections are Kollár 1997 (Theorems 2.16, 5.8, 5.9, 6.4), Angehrn–Siu 1995 (Theorem 0.3) and Ein–Lazarsfeld 1999 (Proposition 1.2). These are the effective freeness and point-separation results on Fujita's conjecture and the geometric effective Nullstellensatz. The earlier layers supply the representability tools that the arithmetic moduli roadmaps use. This rests on the README and on the sources I read.

## Not verifiable

- Olsson's Math 274 lecture notes (§§4.12–4.13, Lemma 31.3, Remark 31.5): the sources service could not classify the host as an author's page, so the notes were not read.
- Lazarsfeld 2004, 9.1.22, 9.2.19, 9.4.17 and §9.3 (9.10b, 9.10c): a Springer book behind a paywall.
- Kollár–Mori 1998, §2.3 (9.10a): a Cambridge book behind a paywall.
- Matsumura, *Commutative Ring Theory*, Theorem 8.4 (§8.3): a book behind a paywall.
- Bierstone–Milman 1997, Theorems 12.2 and 12.4 and Lemmas 12.5, 12.7–12.8, pp. 292–295 (§9.7): the open preprint alg-geom/9508005v2 numbers differently, and the Inventiones version is behind a paywall.
- Printed pages of Bresciani (p. 135) and Groechenig–Wyss–Ziegler (pp. 514–515): read in their arXiv versions, whose theorem numbers agree with the citations.

## Source issues

- **Error** in kollar_pairs (Kollár, Singularities of pairs, arXiv v2) at Theorems 5.8 and 5.9, pp. 30–31: the theorems are stated for any klt pair, and Definition 3.5 allows a non-effective Δ. Yet the proof uses Theorem 2.16, which needs Δ effective, and `(P¹, −½p)` with `N=½p+q` refutes 5.8. They should assume Δ effective; affects a stated result.
- **Gap** in kollar_pairs at Theorem 2.16, p. 13: the theorem is stated for normal proper X, but its proof applies Theorem 2.3, stated for smooth projective varieties, to a log resolution of X, which need not be projective. It should assume X projective or cite vanishing on smooth proper varieties; affects the proof.
- **Misprint** in bv_nori_gerbe (Borne–Vistoli, The Nori fundamental gerbe, arXiv v5) at Definition 3.2, p. 4: the definition omits nonemptiness, although the next sentence equates such 2-categories with cofiltered posets. It should require I nonempty; affects nothing.

## For the human reviewers

- Licence: Olsson's Math 274 notes, cited in about 240 lines of §§4.12–4.13 and elsewhere, are served from stacky.net, the site of the note-taker Anton Geraschenko. The sources service could not classify the host, so those locators were not checked.
