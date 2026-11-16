# Review of MotivicStructuresInModuliOfCurves (pull request #2437 at 4143737)

**Verdict:** needs changes

## R01 (P3) — §2.6 applies a cohomological blow-up formula that no *Needs* item supplies

**Location:** `TauCetiRoadmap/MotivicStructuresInModuliOfCurves/README.md:459–461`, §2.6: "apply the blow-up formulas for Chow groups and cohomology"; *Needs:* "SchemeAndStackFoundations Layer 5, §§5.1–5.7 …; MotivesAndAlgebraicCycles §2.6 (Betti cycle maps of smooth projective schemes)".

**Claim:** SchemeAndStackFoundations §5.7 supplies only the Chow decomposition (`chow_blowup_formula`), and MotivesAndAlgebraicCycles §2.6 supplies only cycle maps. Nothing cited supplies the cohomological blow-up decomposition that the route applies, although main already owns it.

**Witness:** EtaleCohomologyFoundations §F.7 (on main) proves `RΓ(Bl_Z X) ≅ RΓ(X) ⊕ ⨁_{1≤i<c} RΓ(Z)(−i)[−2i]` for a smooth centre `Z` of pure codimension `c ≥ 1`, over any field, with rational ℓ-adic coefficients.

**Repair:**
- Append to the *Needs* line of §2.6: "EtaleCohomologyFoundations §F.7 (the blow-up decomposition of ℓ-adic cohomology), with MotivesAndAlgebraicCycles §2.7 (its comparison with rational Betti cohomology)".
- Add "EtaleCohomologyFoundations §F.7" to Layer 2's Dependencies.
- Add a contract `### From TauCetiRoadmap.EtaleCohomologyFoundations` with the text "Consumed: §F.7 (the blow-up decomposition along a smooth centre of pure codimension `c ≥ 1`, rational ℓ-adic coefficients)."

## R02 (P3) — `stableMass` and `IsStableOfGenus` have no API and no Checks

**Location:** `README.md:1393`, §9.5: "The count is the groupoid mass of the Conventions, `stableMass` … which are the pointed prestable curves satisfying `IsStableOfGenus`". The Checks at `README.md:1406–1408` test only the table.

**Claim:** The two definitions that `Suggested.lean:73` and `:84` declare have no API list. They also have no Check that excludes a plausible wrong model: a count of isomorphism classes, or a stability test that admits a two-pointed `ℙ¹`.

**Witness:** Over `𝔽_q`, the mass of the stable one-pointed genus-one curves is `q + 1`, while the number of their isomorphism classes is `2q + O(1)`. A `ℙ¹` marked at `0` and `∞` carries the vector field `z∂_z`, which vanishes at both markings.

**Repair:** Add to §9.5 the API bullet "`stableMass k g n` is the finite groupoid mass of WeilConjectures, WC.1, of the groupoid of stable `n`-pointed curves of genus `g` over `k`." Then add to its Checks:
- "`IsStableOfGenus k 0` holds for `ℙ¹_k` marked at `0, 1, ∞` (`H⁰(T_{ℙ¹}(−3)) = 0`, `h¹(𝒪) = 0`). It fails for `ℙ¹_k` marked at `0, ∞`, where `z∂_z` is a nonzero infinitesimal automorphism."
- "`stableMass 𝔽_q 0 4 = q + 1`. The `q − 2` smooth classes and the three boundary classes all have trivial automorphism group, as in `#M̄_{0,4}(𝔽_q)` of §1.6."
- "`stableMass 𝔽_q 1 1 = q + 1`, while there are `2q + O(1)` isomorphism classes (§1.1, third Check). The weights `1/#Aut` are part of the definition."

## R03 (P3) — §9.5's description of unstable curves misses a case

**Location:** `README.md:1393`: "an unstable connected prestable pointed curve has, after extension to an algebraic closure, a smooth rational component with at most two special points, or is a smooth genus-one curve without markings".

**Claim:** The dichotomy fails in arithmetic genus one without markings. There the irreducible rational curve with one node is unstable, but it has no smooth component and is not a smooth curve.

**Witness:** The normalization `ℙ¹` has only the node preimages `0, ∞` as special points. The field `z∂_z` descends: on `xy = 0` it is `D(x) = x`, `D(y) = −y`. It is the nonzero infinitesimal automorphism.

**Repair:** Replace the quoted clause with "a component whose normalization is rational with at most two special points (preimages of nodes and markings), or has arithmetic genus one and no markings".

## R04 (P3) — `X_{g,n}` and `X_n` name different objects in Layer 6

**Location:** `README.md:903`, §6.3: "Let `X_{g,n}` parametrize such covers of the fixed line `ℙ¹` … and a basis of `H⁰(ℙ¹, E)`"; `README.md:925`, §6.4: "In `H_{4,7,0}` let `X` be the locus with `E = O(3) ⊕ O(3) ⊕ O(4)`".

**Claim:** At `g = 7`, the scheme of framed covers `X_{7,n}` and the open splitting stratum `X_n` (§§6.6, 6.8, Layer 6 Examples) differ only by a subscript. As a result, "`X_n` has the CKgP" (§6.6) can be read as a statement about either object.

**Witness:** `X_{7,n}` is a `GL₁₃`-torsor over all pointed covers of a fixed line. `X_n ⊂ H_{4,7,n}` is the stratum of covers modulo `PGL₂` with `E = (3, 3, 4)`, as in clp line 605.

**Repair:** Rename the scheme of framed covers `Fr_{g,n}` throughout §6.3: the prose, the route and the last API bullet. Do the same in the EquivariantIntersectionTheory contract (`README.md:76`: "`X_{g,n}` of framed covers, of `ℙ¹ × X_{g,n}` and of the universal curve over `X_{g,n}`"). Keep `X` and `X_n` for the stratum, as CLP does.

## Verified sound

| Target | Instances tried | Values computed (roadmap ↔ source/library) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 open and boundary counts | hypothesis `≼` against BFP's `≺` | bfp Prop. 4.2, line 341, p. 1331, uses strict `≺`; `≼` adds `M̄_{g,n}`, and subtraction then gives `M_{g,n}`; Cor. 9.5, line 1278, p. 1353 | holds | none |
| §2.6 Keel | `M̄_{0,4}`, `M̄_{0,5}` | `b₂ = 5`, ten divisors of rank 5; keel lines 20–27 (p. 545), 180 (p. 549), 227–238 (p. 550), Thm 1 line 476 (p. 556) | holds | R01 |
| §4.3 even genus two | `(2, 20)` at `r = 6`; `r = 11` | clp Prop. 2.6 "k ≤ 10", line 309, p. 7; Cor. 2.7, line 319, p. 8; GP Thm 2, line 101: codim `23 − 12 = 11` | holds | none |
| §5.1 CKgP | point, `ℙ¹`, elliptic `E` | clp Def. 4.1, lines 458–462, p. 11: same quantifier over `Y`; `E` fails through the `H¹ ⊗ H¹` part of the diagonal | holds | none |
| §5.3 pure cohomology algebraic | `𝔾_m`, `ℙ¹` minus three points | clp Lemma 4.3, line 478, pp. 11–12; Rem. 4.4, line 517; `A⁰ → W₀H⁰ = ℚ`, `W₂H²(𝔾_m) = 0` | holds | none |
| §5.4 known ranges | `c(1..4)`; `(1,10)`, `(1,11)` | clp Table 1, line 534: `∞,10,10,11,11,7,5,3`; CL Thm 6.1 (p. 17), Lemma 9.9 (p. 33); `2d − 11 = 9`, then `11` | holds | none |
| §6.4 splitting strata | degree sums | `(3,3,4)`, `(2,4,4)`, `(2,3,5)` each sum to `10 = g + 3`; `F` is `(5,5)` or `(4,6)`; clp lines 605–616, pp. 14–15 | holds | R04 |
| §8.1 binary forms | `g = 4`, `q = 5`; parity of `g` | `#G(𝔽₅) = 480`; `4(5¹⁰ − 5⁸) = 37500000 = 480·78125`; AV Cor. 4.7 (line 503), Prop. 4.4 (line 452); bfp p. 1332 | holds | none |
| §8.13 four or more singularities | `n ≤ 2`; `n = 3` | bfp Prop. 8.8, line 1001, p. 1346: `o(q^{(9+n)/2})` and `Bq⁶ + o(q⁶)`; types (A)–(D), lines 1044–1047 | holds | none |
| §10.5 degree-fourteen realization | `M̄_{0,10}` | clp Cor. 6.2, line 992, p. 23: `⊕L^{d−7}`; `d = 7` gives `H⁰ = ℚ` | holds | none |
| §10.7 oriented complex | `(0,3)`, `(0,4)` at `k = 0`, two-edge stratum of `M̄_{1,2}` | `ker α = 0`; `ℚ³/ℚ = ℚ² = Gr^W_0 H_c¹(M_{0,4})`; edge swap acts by `−1` on `det`; clp-h11 lines 414–444, pp. 10–11 | holds | none |
| §11.7 891-row matrix | family sums | `891`; rank `≥ 495 + 330 = 825`; 66 relations with coefficients `1/24`, `1/12`: clp lines 1104–1115, pp. 26–27 | holds | none |
| §12.3 complementary odd degrees | weights | `2(d − 12) + 11 = 2d − 13`; clp Cor. 7.2 (line 1023, p. 24), Cor. 7.11 (line 1151, p. 28) | holds | none |
| §12.5 degree fifteen in genus two | `(2, 12)` | clp Lemma 8.1, line 1165, p. 28; the README routes through the §12.4 splitting | holds | none |
| §12.8 no type `(15,0)` | `g = 1`; `g = 3` | `S₁₆^{15,0} ≠ 0` at `(1,15)`; at `g = 3` the loop leaves a genus-one vertex with three flags; clp lines 1186–1199, Fig. 3 | holds | none |
| Headline §9.8 | `k = 9` base region; `(5,0)` | `max(8, 6+n) ≤ 9` gives `n ≤ 3`; without §2.2 the bound is `2g − 1 = 9`, so `(5,0)` would enter | holds | none |
| Headline §9.5, `stableMass_genus_four` | `n = 0..3`; `q = 2` | bfp Thm 1.4 (lines 111–117) equals the Lean coefficients; `#M̄₄(𝔽₂) = 7965`; closed − §9.4 − §9.6 `= 0` in every row | holds | R02, R03 |
| `IsStableOfGenus` | `ℙ¹` with 3 and 2 marks; nodal cubic, `n = 0` | `H⁰(O(−1)) = 0`; `z∂_z ≠ 0` twice; nodes étale-local (`Node/Relative.lean:227`), so non-split nodes count | definition right, prose incomplete | R03 |
| Headline §9.7 | `(1,9)`, `(2,7)` at `n = 3`; `n = 5` | inside `c(1) = c(2) = 10`; `(1,11) ≼ (4,5)` since `13 = 13` | holds | none |
| Headline §§4.9, 4.11 | `k′ = 4`; `(1,11,11)`; `(1,10,11)` | `g′ < 7`; `1 < 17.5`, `11 ≤ 11`, `11 ≥ 11`; `10 < 11`, so outside | holds | none |
| Headline §§10.2–10.4 | `(6,4)`; `k = 14` | `4 ≤ c(6) = 5` via §6.9; `(7,0)`, `(7,1)`, `(7,2)` need §7.7; at `g = 8`, `16 > 14` | holds | none |
| Headline §§12.1–12.2 | base pairs, `k = 13` | `(1,≤13)`, `(2,≤11)`, `(3,≤9)`, `(4,≤7)`, `(5,≤5)`, `(6,≤3)` against `c` leave `(1,11)`, `(1,12)`, `(1,13)`, `(2,11)`; clp line 1018 | holds | none |
| Headline §7.7 | `n = 0` | `π_*(ψ₁·π^*α) = κ₀α`, `κ₀ = 2·7 − 2 = 12` | holds | none |
| Headline §12.9 | `(1,15)`, `(2,12)` | `S₁₆ ⊂ H¹⁵(M̄_{1,15})`; `825 + 11 = 836`; `825 + 55 = 880 > 836` | holds | none |
| Headline §12.10 | flag bounds at `n = 11` | two genus-one vertices carry `≤ n + 4 − r ≤ 15 < 22` flags; `2d − 6 = 16 > 14` at `(3,5)` | holds | none |
| §9.4 conditional hypothesis | `n = 2, 3` | hypothesis polynomials equal the §9.6 rows `n = 1, 2`; bfp Prop. 9.6, lines 1298–1305, matches the table | holds | none |
| §6.9 genera five and six | `f = 4` | `4f − 2g + 1 = 7`, `5`; canning-larson Lemmas 10.9–10.14, lines 2005–2060, pp. 38–39 | holds | R04 |

- **Previous findings, all repaired.**
  - R01: `Suggested.lean:91` states `stableMass_genus_four`.
  - R02: `README.md:844` reads "each `D_i` is identified with an open substack of `M_{1,n−1}`"; the longest run it shares with canning-larson lines 1049–1052 is six words.
  - R03: §6.9 is split off, and Layer 5's Dependencies no longer list Layer 6.
  - R04: §2.5 adds the genus-zero hypothesis and §9.4 is conditional, so no cycle remains.
  - R05: `README.md:376` reads "§9.3, proof of Proposition 9.6, p. 1354".
  - R06: the description lists the end theorems and states what `Suggested.lean` declares.
- **Locators checked against the text:** about 60, all from the 15 sampled targets, in clp, bfp, canning-larson, keel, clp-h11, av, gp, petersen-genus-two, gk, cfp and petersen-genus-one. Seven of the README's "Corrections to the sources" were also confirmed in the text.
- **Library declarations opened at the pins:** 16. In Tau Ceti:
  - `PointedPrestableFamily` (`PointedPrestable/Basic.lean:68`) and its `Hom` over `S` (`Category.lean:96`);
  - `PrestableFamily`, geometrically connected (`Prestable.lean:45`);
  - `AtWorstNodalOfRelativeDimensionOne` (`Node/Relative.lean:227`);
  - `PrestableMap.const` (`StableMaps/Basic.lean:197`) and `infinitesimalAut` (`Automorphism.lean:321`);
  - `Scheme.genus` (`Genus.lean:64`), `spinPlus` (`HalfSpin/Basic.lean:119`), `repRing` (`RepresentationRing/Basic.lean:106`), and the `DualGraph` files.

  In Mathlib: `Skeleton` (`Skeletal.lean:114`), `Pseudofunctor.IsStack` (`IsStack.lean:49`), `quadraticChar_sum_zero` (`Basic.lean:239`), and the level-one `CuspForm` lemmas.
- **Cross-roadmap citations:** all cited sections of 21 roadmaps resolved, on main or at the open heads. StableReductionPartII §5.15 states the Edidin–Graham comparison, and its §7.11 leaves the tautological rings to this roadmap. SchemeAndStackFoundations §5.7 contains `chow_blowup_formula`.
- **Gate and dependency check:** every gate check is 0, `OK`. The dependency check prints `depcheck: 254 roadmaps, 2400 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- **Elaboration:** `lake env lean` on Suggested.lean exits 0, with the `sorry` warning at line 91 as its only message. `#check @IsStableOfGenus` and `#check @stableMass` give the types in signatures.md, with no binder lost; the README's "every finite field" matches `[Field k] [Finite k]`. The probe `simp [stableMass]` leaves the `finsum` goal, so the theorem is not padding.
- **Recomputed with exact rationals:**
  - closed − boundary − open `= 0` for `n = 0..3`;
  - the sieve sums against §9.6 differ only by `q²`, by terms of degree at most five, and by `−2q⁶ + …`, all within the stated precisions;
  - the unmarked quotients are `½(q⁹ − q⁶) ± ½(q + 1) + O(1/q)`;
  - the §9.9 dimensions, palindromes and `q = 1` values;
  - the §9.10 traces reproduce the §9.6 row `n = 2` and the transposition count of §9.9;
  - the §3.6 sums at `n = 12, 13`.
- **Gaps and libraries:** the nine gap slugs are identical in `design/plan.json` and the README. The pinned libraries contain no tautological ring, modular operad, CKgP or groupoid mass.

Overlap check: I read VirtualFundamentalClassPartII, StableReductionPartII, AlgebraicGromovWittenTheory, WeilConjectures and CanonicalModelsAndGonality (open), and StableReduction, EquivariantIntersectionTheory and AnalyticStableMaps (main). Each shared object has one owner, and this roadmap cites it:
- pointed stacks, clutching, cotangent lines, the Hodge bundle and the Edidin–Graham comparison: StableReductionPartII;
- masses, twists and the sieve: WeilConjectures;
- the hyperelliptic presentation: EquivariantIntersectionTheory §3.3;
- dual graphs and stability: StableReduction, Layers 1 and 3;
- gonality and canonical models: CanonicalModelsAndGonality.

VirtualFundamentalClassPartII widens Vistoli's groups and states no tautological object. The other two roadmaps share nothing with this one.

Source independence: I compared 22 passages with 11 sources: the 15 sampled locators side by side, plus §§1.4, 5.3, 5.4, 7.2, 7.4, 8.1 and 9.9–9.10. An 8-word-run scan covered the README and Suggested.lean against all 25 cached texts. Apart from titles, the longest shared runs are 12 words (clp line 824) and 10 words (canning-larson-genus-seven line 260), both forced statements. The largest share is clp, about 110 of 260 locators. I compared the contents with clp and bfp:
- Layers 4, 5, 6–7, 10 and 11–12 take up CLP §§2–3, 4, 5, 6 and 7–8.
- §§8.4–8.13 take up BFP §§6–8.

The *Needs* lines force these orders (§6.2←§5.4, §10.4←§7.7, §11.1←§10.9, §12.1←§11.10; §8.5←§8.4, §§8.9–8.11←§§8.5, 8.7, 8.8). The scopes differ: Layers 0–3 and 9 are interleaved, and CLP-H11 and Canning–Larson §10 are added. Result: independent.

## Not verifiable

- harer: settled as uncertified; the virtual cohomological dimension was read only as bfp recalls it (lines 228–231).
- mukai: settled as uncertified; the genus-seven linear-section theorem was read only as clp §5.3 recalls it.
- clp Figure 2: the family sizes `132, 11, 132, 220, 66, 66, 132, 66, 66` are in an image, and the text extraction has only the caption (clp line 1058).

## Source issues

- **Gap** in clp at proof of Lemma 8.2, p. 28: the source says vanishing of `Gr^W_{15}H_c^{15}` follows from `2g − 2 + n > 15` or CKgP; it should also use `2g > 15` for `n ≤ 1`, covering `(8, 0)`, `(8, 1)`; affects the proof.
- **Misprint** in clp at proof of Lemma 7.3, p. 27: the source says the symbols `M_{ij}` span a representation induced from `S₁₀`; it should be `S₁₀ × S₂`, of dimension `66`; affects nothing.
- **Misprint** in clp at the sentence before Lemma 7.10, p. 27: the source says Lemma 3.2(a); it should be Lemma 3.2, which has no parts; affects nothing.
- **Misprint** in clp at the first sentence of the proof of Theorem 1.5(3), §6.2, p. 23: the source says even `k ≥ 14`; it should be even `k ≤ 14`, as the theorem states; affects nothing.
- **Misprint** in bfp at the opening of §9, p. 1351: the source cites the Getzler–Kapranov formula as [GK98, Th. 8.3]; it should be Th. 8.13, as cited in §9.3; affects nothing.
- **Misprint** in bfp at Corollary 3.2, p. 1330: the source says the conclusion concerns `M̄_{g,n}`; it should be `M̄_{4,n}`; affects nothing.
- **Misprint** in bfp at §10.1, p. 1355: the source says the coefficient `−11` multiplies `q⁴`; it should multiply `q³`, as in Theorem 1.5, p. 1326; affects nothing.

## For the human reviewers

- none
