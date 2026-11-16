<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17981#issuecomment-6908486914 -->
Red team round 2 pass a (claude) of d677463

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the route of §7.4(a) follows CaptainSude26's prescription paragraph sentence by sentence

   - **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1525-1534`: "At
     a place `u` of `F⁺` above `2`, `3` or `5` prescribe a finite Galois extension of `F⁺_u` containing,
     for every place `w` of `F` above `u`, the field `F_w` … prescribe the trivial extension, and `ℝ` at
     every real place".
   - **Claim.** The route is in the roadmap's own words.
   - **Witness.** CaptainSude26 lines 550–551, 556 and 560–562: the same three sentences in the same
     order (a finite Galois local extension containing the fields for every place above `u`; the trivial
     extension at the retained places and `ℝ` at real places; the lemma gives the extension "with these
     completions", then the composite, solvable Galois and CM, then the intersection). Longest shared run:
     5 consecutive words; further runs of 4, 4 and 3.
   - **Repair.** Replace lines 1525–1534, from "At a place `u` of `F⁺` above `2`, `3` or `5` prescribe"
     to "with `L ∩ F_avoid = F`.", by:

     > Fix the local targets first. For a place `u` of `F⁺` of residue characteristic `2`, `3` or `5`
     > let `N_u/F⁺_u` be a finite Galois extension large enough that, for each `w | u` in `F`, it contains
     > `F_w` and the field cut out by `ρ̄|G_{F_w}`, contains `√−1` when `u | 2`, and when `u | 5` contains
     > the five-division fields over `F_w` of one curve with good ordinary and one with good supersingular
     > reduction (EllipticCurves Layer 4). Put `N_u = F⁺_u` for `u` under a place of `Σ` or over `q₀`, and
     > `N_u = ℝ` for `u` real. The definitions do not clash: a place under `Σ` has residue characteristic
     > other than `2, 3, 5`, and if it lies over `q₀` both rules give `F⁺_u`. Let `D` be the Galois closure
     > of `F_avoid` over `F⁺`. GL2ModularityLifting §1.7 (CHT08, Lemma 4.1.2), applied over `F⁺` to the
     > fields `N_u` and to `D`, yields a soluble Galois `L⁺/F⁺` whose completion at each place over `u` is
     > `N_u` and which is linearly disjoint from `D` over `F⁺`. All real completions of `L⁺` are `ℝ`, so
     > `L⁺` is totally real and `L = L⁺F` is CM; `L/F` is Galois and `Gal(L/F)` embeds in the soluble
     > group `Gal(L⁺/F⁺)`; and
     > `L ∩ F_avoid = F`, since `D ⊇ F` and `L⁺` are linearly disjoint over `F⁺`.

     In the next sentence (line 1535) replace "this is the prescribed field, which contains `F_w`" by
     "this is `N_u`, which contains `F_w`". Tested on the instances of the round-1 finding: for `Σ = ∅`
     the text gives the parent's `solvable_preparation`; for `v | 11` in `Σ`, `N_u = F⁺_u` gives
     `L_{w'} = F_v`, ramification index one, so residual inertia `U` is kept.

2. **F02** (P2) the paragraph of §5.3 on the places of `P` follows CaptainSude26 clause by clause

   - **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1153-1161`: "For
     `v ∈ P` and `σ ∈ I_v`, local reciprocity sends `σ` to a unit `u ∈ O_{F_v}^×`; the coefficient module
     is trivial on `Iw_v`, so the torus operators … makes it a point of the local problem at `v`."
   - **Claim.** The route is in the roadmap's own words.
   - **Witness.** CaptainSude26 lines 335–341: the same six clauses in the same order (inertia to a unit
     by local reciprocity; trivial coefficient at Iwahori level, operators equal to one; the polynomial is
     `(X − 1)²`; the identity for `ρ(σ)`; transfer to the quotient ring; over a possibly nonreduced ring
     it is a point of the local condition). Longest shared run: 4 consecutive words. The round-1 passes
     compared lines 299–314 only.
   - **Repair.** Replace lines 1153–1161, from "What `P` adds is this." to "makes it a point of the local
     problem at `v`.", by:

     > What `P` adds is one verification: at each `v ∈ P` the Hecke-valued representation satisfies
     > §3.4(i), that is, `tr ρ(σ) = 2` and `det ρ(σ) = 1` in `T_{χ,Q}/J_{χ,Q}` for every `σ ∈ I_v`. Both
     > are identities between elements of a ring, so it is enough to have them over the neat-level Hecke
     > algebra with torus operators, modulo a nilpotent ideal, and to push them along the ring maps and
     > the finitely many nilpotent quotients by which CrystallineLocalGlobalCompatibilityCM §8.6 reaches
     > `K^P(Q)`. At neat level the inertial comparison writes the characteristic polynomial of `ρ(σ)` as
     > the torus polynomial `P_{v,σ}`, whose coefficients are built from the operators of `diag(u, 1)` and
     > `diag(1, u)`, with `u ∈ O_{F_v}^×` the unit that local reciprocity attaches to `σ`. Both matrices
     > lie in `K_v = Iw_v` and the coefficient module carries the trivial character at `v`, so each
     > operator is the identity and `P_{v,σ} = (X − 1)²`. Since §3.4 is stated for every object of
     > `CNL_O`, reduced or not, the two identities are all the local problem at `v` asks.

     Tested against the first Check of §5.3: with the character `χ_v⁻¹(a/d)` in place of the trivial one
     the two operators are `χ_v(u)^{∓1}` and the polynomial is `(X − χ_v(u))(X − χ_v(u)⁻¹)`, as there.

3. **F03** (P3) "test place" is used in §6.1 and defined nowhere

   - **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1251-1252` ("choice
     of test places") and `:1258` ("five and every rational prime under a test place split completely").
   - **Claim.** The preparation makes the primes under the "test places" split in `E`.
   - **Witness.** The term occurs in the README only at these two places. The cited supplier,
     CrystallineLocalGlobalCompatibilityCM §9.11, calls the set "a finite set `V` of auxiliary places as
     in the proof of [AKT23, Thm. A.14]"; CN23 lines 4455–4463 give its three defining properties.
   - **Repair.** At lines 1251–1252 replace "choice of test places;" by "choice of the finite set `V` of
     auxiliary places of that section, at which `ρ` and `π` are unramified, which contains every place
     above one witness prime of decomposed genericity and, for each extension `L' ≠ F` of `F` inside the
     field cut out by `ρ̄`, a place not split in `L'`;". At line 1258 replace "every rational prime under a
     test place" by "every rational prime under a place of `V`". Tested: a Galois `F'/F` in which `V`
     splits keeps `ρ̄(G_{F'}) = ρ̄(G_F)` and the witness, which is what line 1275–1276 uses.

4. **F04** (P3) §7.5(a) uses the parent's §4.2 and its `*Needs:*` line omits it

   - **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1577-1581` ("by
     the switch-parameter property (S3) the image of `G_D` contains the geometric monodromy … they
     generate `SL₂(𝔽₅)`") and the `*Needs:*` line `:1595-1597` ("§§6.5, 7.1, 7.2, 7.4, 0.3").
   - **Claim.** (S3) gives the image on the mod-five representation of `A_t`.
   - **Witness.** (S3) and (S2) are stated for the residual systems `V_θ` (lines 156–162), not for
     `A_t[5]`. The passage to `A_t` is the parent's §4.2 `cubic_character_elliptic`
     (`V_η ≅ H¹(A_t)|G_F`), which §2.1 cites for the same step (line 600) and §7.5 does not.
   - **Repair.** In line 1580 replace "(the parent's §7.1 with coefficient `3`);" by "(the parent's §7.1
     with coefficient `3`) on the reduction of `V_η`, which the parent's §4.2 `cubic_character_elliptic`
     identifies with the mod-five representation of `H¹(A_t)|G_F`, the dual of `A_t[5]`;". In the
     `*Needs:*` line replace "§§6.5, 7.1, 7.2, 7.4, 0.3" by "§§4.2, 6.5, 7.1, 7.2, 7.4, 0.3". The Layer 7
     Dependencies already list §4.2. Tested: with the citation, the image of `G_K` on `A_t[5]` contains a
     subgroup of order `120` and lies in `SL₂(𝔽₅)` because `ε̄₅` is trivial on `G_K`, so it is `SL₂(𝔽₅)`.

Round 2. Four new findings: two P2 (wording that follows the unlicensed source CaptainSude26 clause by
clause, one of them in text written by the round-1 repair) and two P3 (an undefined term, an incomplete
`*Needs:*` line). No P1. All six round-1 findings are repaired. The declared gap
`gap:acc-torsion-inertial-comparison` is precise, minimal and declared with the same slug in
`packages/EllipticCurveModularityImaginaryQuadraticPartII/design/plan.json` and in the README; it is
not raised.

## Round-1 findings at this head

| Earlier finding | State | Witness at `d677463` (`packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md`) |
|---|---|---|
| 1a/F01 (P3), irreducibility of `ad⁰` unowned | repaired | Lines 983–987: "which is `M` because `M` is absolutely irreducible: … `Sym² V` is absolutely irreducible for `SL₂(𝔽₅)` by its §7.8"; `*Needs:*` line 1001 and Dependencies line 1062 carry "§§7.2, 7.8"; contract bullet lines 399–400. Checked against ArithmeticGaloisRepresentations §7.2 (`ad⁰ ≅ (Sym² ρ)^∨ ⊗ Dρ`) and §7.8 (`Sym^a` absolutely irreducible for `SL₂(F)`, `0 ≤ a ≤ p − 1`). |
| 1a/F02 (P3), non-CM in §8.1 from an unowned fact | repaired | Lines 1637–1638: "`A_t` is geometrically non-CM by the last clause of (S2), `t` being a switch parameter (the parent's §7.4(3))"; `*Needs:*` line 1646 and Dependencies line 1668 name the parent's §7.4. |
| 1b/F01 (P2), switch parameter defined by its production | repaired | Lines 149–171: (S1) the §6.5 open property, (S2) the residual and non-CM conclusions, (S3) the image of `G_D`; four Checks at lines 175–191. (S1)–(S3) agree with the parent's §6.5 `local_type_opens` and §7.4 clauses 1–3 and API. |
| 1b/F02 (P2), §7.4 cited statements the parent does not make | repaired (mathematics); new wording finding S01 | Lines 1507–1519 state (a) and (b); the route, lines 1521–1546, uses GL2ModularityLifting §1.7 over `F⁺` and the named §0.2–0.3 targets. (a) recomputed below. |
| 1b/F03 (P3), "width-three" | repaired | No occurrence of "width" in the README; heading line 1397 "7.1 The multiplicative degeneration of type I₃". |
| 1b/F04 (P2), §7.1(b)–(c) followed the source | repaired | Lines 1402–1412 are organised by the quotient's special fibre (components `E'/w`, `Z/w`, dual graph, thicknesses two and one, one blow-up). |

No repair introduced a mathematical error. The repair of 1b/F02 introduced the wording of S01.

## The adversarial pass (computed values)

`Suggested.lean` has no declaration (one module docstring, `import Mathlib`, an empty namespace, no
`sorry`, no `set_option`), so the declaration table is empty and `#check @name` has no subject. The
rows are the README's statements: 27 bold targets and the Conventions.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, tame relation | `q_v = 7, 11`, `U` over `𝔽₅` | `U⁷ = [[1,2],[0,1]]`, `7⁻¹ = 3`, `U¹¹ = U` | as stated | none |
| Conventions, `Ad(U)` and trace form | basis `e, h, f` | `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram determinant `−2` | as stated | none |
| Switch parameter (S1)–(S3) | CM `A_t`; open near `R_*` above 3; opens above `q ∤ 3p` | `[[1,3],[0,1]][[1,0],[3,1]] = [[0,3],[3,1]]`, reverse `[[1,3],[3,0]]`; `v₀(1/j) = 3v₀(s) + c > 0` | definition determines its object; (S1) independent of (S2), (S3) | none |
| 1.1(a),(b) | `S = ∅`; `S = {1,2}`; `ℚ(i) ⊂ ℚ(ζ₂₀)`; `ℚ(2^(1/3))(ζ₃)`; subfield `ℚ(√5)` | `L = K` twice; `(ℤ/5)ˣ` cyclic, middle field `ℚ(i,√5)`; `S₃`, `c₁c₂` a 3-cycle; totally real, does not contain `K` | true; the containment of `K` is needed | none |
| 1.2 | `K = F`; `1 ⊕ 1` over `𝔽₃`, `q = 2`; over `ℚ(ζ₃)` | ratio `1 ≠ 2 = 2⁻¹`; split primes `≡ 1`, ratio `1 = q` | true; converse false | none |
| Layer 1 example `K₆₀` | `{1, 29} ⊂ (ℤ/60)ˣ` | `29 ≡ 1 (4)`, `≡ −1 (15)`, `≡ 4 (5)`, `≡ 2 (3)`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = K₆₀(ζ₅) = ℚ(ζ₆₀)` | none |
| 2.1 | `K₆₀`; imaginary quadratic `K` | parent §5.3 hypothesis `ζ₅ ∉ L` holds at `L = K₆₀`, fails at `L = F` | true | none |
| 2.2 | the three rows | residual inputs: pair `(3,p)`, pair `(p,3)`, `V₁` modulo `p`; `χ_(h(t))² = 1` | each row has its (S2) clause | none |
| 2.3 | `q_v = 4, a = 4`; `z = i`; split multiplicative | `(T − 2)²`, unitary roots `1, 1`; `diag(i, −i)`; `(1 − T)⁻¹` against `((1 − T)(1 − 4T))⁻¹` | true | none |
| 2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | quadratic subfields of `ℚ(ζ₈)`: `i, √2, √−2`; sum, induction, induction | true | none |
| 2.5, 8.1 | `ℚ(ζ₅)`, `K₆₀`, `ℚ(i,√5)`, imaginary quadratic | `(ℤ/2)²` has no cyclic quotient of order 4; `[ℚ(ζ₅):ℚ] = 4 > 2` | branches as stated | none |
| 3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `2/3 = 3/2 = 4`; `1 ∈ ad⁰` | true; `2 ∈ kˣ` needed | none |
| 3.2 | `𝔽₅`, `𝔽₇`, `𝔽₃`; order-3 subgroup | norms `5 + 10N + 10N²`, `7 + 21N + 35N²`, `3 + 3N + N² = N²`; `N²f = −2e`; index `24` | bijective at 5 only | none |
| 3.3 | `Φ = [[a,b],[0,d]]`; `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`; ramification index 5 | `ΦUΦ⁻¹ = [[1,a/d],[0,1]]`; `M² = [[4,1],[4,0]]`, `M³ = 1`, `Φ² = 1`, `ΦMΦ = M²`; `U⁵ = 1` | definition and non-examples hold | none |
| 3.4 | `N = [[a,b],[−a²/b,−a]]`; `τⁿ`; `q_v = 11`; `(1+εf)U`, `(1+εh)U`; `[[ζ₅,1],[0,ζ₅⁻¹]]` | `tr N = det N = 0`; `det(1 + nN) = 1`; `11·12² = 1584`; traces `2 + ε`, `2`; `(i) ⇔ (ii) ⇔` kernel flag of LocalGaloisDeformationRings §2.3 | 3 free parameters `a, b − 1, z − [z̄]` | none |
| 3.5 | `q ≡ 1`, `q ≡ 2 (5)`; `p = 3` | `M^(I_v) = ke`, `φe = q_v e`; `Z¹` of dimension 4, `B¹` of dimension 2; `C(p,3) ≡ 0` iff `p ≥ 5` | (a)–(d) true; `p ≥ 5` in (d) needed | none |
| 4.1 | no protected place; inertia of order 2; `𝔽₇` | `Hom(Gal(C_N/F), M^(SL₂)) = 0`; restriction zero; `H¹ = 0` | true | none |
| 4.2 | `g = diag(2,3)`; Borel subgroup; `r = 0` | eigenvalues `4, 1, 4`; `Ad(Uᵀ)e = e − h − f`, `Ad(Uᵀ)²e = e − 2h − 4f`, determinant `2`; `κ(γσ₀) = κ(γ) + κ(σ₀)` | true | none |
| 4.3 | `(d,t,r) = (2,1,6)`, `(2,3,10)` | `g = 0`; `g = 6`, `14 + 6 = 20 = r + 4t − d`, `22 = r + 4t` | agrees with the formula of CrystallineLocalGlobalCompatibilityCM §9.3 | none |
| 5.1 | `d = 40`: degrees `(8,8,24)`, `5 × 8`; `d = 36` | `24 > 20`, `8 < 20`; `24 > 20`; `8 + 8 = 16 < 18` forces degree 8, `8 ∤ 36` | Checks true | none |
| 5.2, 5.4 | `d = 40, t = 10, R = ∅` | `1 + 10·11 = 111 = 1 + 3t + 2d`; `g = 111 − 120 − 1 + 10 = 0`; `dim S_∞ = 151` | deficit `40 = l₀` | none |
| 5.3 | `q_w = 11`; `𝔽₅[ε]` | indices `12`, `60`; `det diag(1+ε, 1−ε) = 1`; ACC23 §3.1 hypotheses on `R ∪ P ∪ Q` met by (i) and §4.2 | true given the gap | S02 (wording) |
| 6.1 | `(p_b, p_c) = (109, 2617)`; `E = ℚ(√31,√59,√71)`; Hilbert symbols | `2617` prime (no factor up to 47), `≡ 1 (436)`; both `≡ −1 (11)`; `−436 ≡ 4 (11)`; residues `1,4,1 (5)` and `9,4,5 (11)`; product formula `−1` | Checks true | S03 |
| 6.2 | `𝔽₂₅`, `μ² = 2`, `γ = diag(1,2)`; determinant of order 4 | `det(μγ) = −1`, `(μγ)² = diag(2,3)`, order `240`, both kernels of index `120`; `120 < 240` | `ζ₅ ∈ F` not implied by failure of (4) | none |
| 7.1 | node orbits; four fixed points | `2P₀ + 2rT' = c₀` has one `r` mod 3; `p_a = 0 + 0 + 2 − 1 = 1`; three fixed nodes give `p_a = 2`; `z₁z₂ = s²`; `2 + 1 = 3` | type `I₃` | none |
| 7.2, 7.3 | `v(s) = 1, 5, 7`; non-split | `3, 15, 21`; `[[1,3],[0,1]]`, trivial; Frobenius `−1` times a unipotent | true | none |
| 7.4(a),(b) | `Σ = ∅`; `u` split or inert; place of `Σ` over `q₀`; `y² = x³ − x`, `y² = x³ + 1` over `𝔽₅` | `L_{w'} = L⁺_{u'}F_w`; both prescriptions trivial; `8` points, trace `−2`; `6` points, trace `0` | true | S01 (wording) |
| 7.5 | transvections with entry `±3` | group of order `120` inside `SL₂(𝔽₅)`; `q₀ ≠ q` since `A_t[5]` is ramified at `v` | true | S04 |

Dependency check, run on the README at this head:

    depcheck: 251 roadmaps, 2399 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Verified sound

- **Declarations read:** 0 (none exist). Headline theorems: 2.5, 6.2 and 8.1. None is statable at the
  pins: neither Mathlib (`1b1ccf4`) nor Tau Ceti (`2fd255d`) has automorphic forms or representations,
  Weil–Deligne representations or potentially semistable representations (searched by object in both
  source trees, no file). The module docstring names all three and what each lacks. Nothing is
  padding.
- **Targets read:** 27 of 27; every line of the README (1718) and of `Suggested.lean` (50).
- **Checks tested:** 108 Check bullets and 8 Examples paragraphs; every numerical or structural one
  recomputed (table above); none false, vacuous or a restatement. The five definitions (switch
  parameter, protected, the unipotent-inertia condition, protected prepared datum, `𝒮^P_χ`) each have
  three or more discriminating Checks.
- **Pinned declarations checked:** 17, all present with the cited files and hypotheses
  (`NumberField.IsCMField`, `IsCMField.of_isAbelianGalois`, `IsCyclotomicExtension.Rat.isCMField` with
  `∃ n ∈ S, 2 < n`, `NumberField.isTotallyComplex_of_algebra`, `Matrix.SpecialLinearGroup.toGL`,
  `groupCohomology.map`, `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`, `Matrix.SL2.commutator_eq_top`
  with `a ≠ 0`, `a² ≠ 1`, `WeierstrassCurve.localPolynomial`, `LFunction`, `LSeries`,
  `continuousCohomology`, `NumberField.AdeleRing`, `ModularForm.L`, Tau Ceti `eulerCharacteristic_mixed`,
  `tateDualityPairing_perfect_mixed`, `WeierstrassCurve.tateModuleGaloisRepresentation`). Mathlib's
  CM-field file has no statement on composita or intermediate fields.
- **Sibling citations checked:** 22 roadmaps, about 95 section, layer or name citations, each resolved
  at the cited roadmap's current text. Read for hypotheses: the parent's §0.2, §0.3, §1.1, §2.1, §2.3,
  §4.2, §5.2, §5.3, §6.5, §6.6, §7.1, §7.2, §7.4, §8.1–8.4 and its boundaries section;
  CrystallineLocalGlobalCompatibilityCM §8.6, §8.7, §9.1, §9.3, §9.7, §9.11;
  PotentialAutomorphyInfrastructure §2.1, §2.3, §2.5; GL2ModularityLifting §1.7;
  ArithmeticGaloisRepresentations §6.3, §7.2, §7.7, §7.8, §7.9 (with `adZeroRep` in its Lean file);
  MordellLawrenceVenkatesh §1.3, §1.4; ShimuraVarieties §5.6; LocalGaloisDeformationRings §2.3, §2.5,
  §2.8, §2.21; GlobalGaloisDeformations §3.6, §5.6; AutomorphicGaloisRepresentationsPartII AG2.7;
  ModularityAndLanglandsExtensions §2.29. The other cited sections resolve by heading.
- **Locators verified:** 58 line or page locators, all pointing at the stated result: CaptainSude26 24
  (read in full, 720 lines), LeHung26 10, CN23 14, ACC23 5, AKT23 1, CHT08 1, MilneCM 1 block of three
  results, OpenAI26 2 blocks.
- **Declared gap.** No roadmap states ACC23 Theorem 3.1.1 today (PotentialAutomorphyInfrastructure
  lists it as an AG2.5 input, AutomorphicGaloisRepresentationsPartII does not state it); the contract,
  README lines 343–359, matches ACC23 lines 2309–2355 hypothesis by hypothesis.
- **Ownership.** Searched by object on main and at the open heads: no other roadmap plans the protected
  condition, the lifting theorem at five with residual image `SL₂(𝔽₅)`, or modularity over all CM
  fields; no `Suggested.lean` uses this namespace. Theorem 1.1(b) is an instance of
  MordellLawrenceVenkatesh §1.4 and cites it.
- **Policy.** The pull request changes only the package folder (8 files); no pull-request numbers or
  process words in the README or the docstring; 27 targets, 27 `*Needs:*` lines, each target with a
  locator; no `lemma`, `set_option`, `#eval` or algorithm.

## Not verifiable

- The truth of Theorems 5.4 and 6.2 beyond the counts and local computations above: they rest on the
  declared gap and on the contracts of CrystallineLocalGlobalCompatibilityCM §§9.6–9.10, and no
  refereed source states them.
- §7.1(b)–(d) and §7.2(a): the existence of the parent's nodal model over `O_{K₁}[1/n₀]` and the
  convergence of the Tate-parameter series were not recomputed; only the quotient, genus and thickness
  arithmetic was.
- §7.4(b): the compatibility of the added opens at `Σ` with the parent's `seed_modular` was checked on
  the statements (its conditions sit above 2 and 3 and on thin sets); AKT23 §9 was not reopened.
- OpenAI26: only the pages of Proposition 9.3, Lemma 9.4 and §9.4 were located.
- No Lean was run: the pass is read-only and the file has no declaration.

## Source issues

- **Error** in CaptainSude26 at Notation, p. 2 (lines 63–66): the source says decomposed generic means Frobenius eigenvalue ratio outside `{1, q, q⁻¹}` and that this agrees with CN23 Definition 2.1.27; it should be that the cited definition excludes only the ratios `q` and `q⁻¹`, so the source's condition is stronger; affects nothing.
- **Gap** in LeHung26 at Lemma 5.1, p. 9 (lines 357–360): the source says descent along an abelian extension of CM fields goes one cyclic step at a time; it should note that every intermediate field is CM, which cyclic base change between CM fields requires; affects the proof.

Source independence: 26 passages compared with 5 sources (CaptainSude26, LeHung26, CN23, ACC23, MilneCM), two following CaptainSude26 clause by clause (S01, S02), none shared verbatim beyond runs of 5 words; largest share CaptainSude26, 24 of 61 source citations in Layers 1–8; contents compared with CaptainSude26 (its §3 is split over Layers 3 and 4, its §4 is Layer 5, the proof of its Proposition 5.2 is split over Layers 6 and 7, its §6 is Layer 2 and precedes them, Layer 1 has no counterpart; the order of Layers 3 to 7 is forced by the `*Needs:*` lines 4←3, 5←3–4, 6←5, 7←6): independent.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 and Layers 3–7 rest on CaptainSude26, a pseudonymous unrefereed manuscript (`sources.toml`, its `version_note`); Theorem 2.5 on LeHung26, a discussion draft. No refereed source states these headlines.
- **Licence.** CaptainSude26 has no stated licence (README line 1699; `sources.toml` class `author-page`, a file on a code-hosting site). S01 and S02 concern passages that track its wording.
- **Licence.** LeHung26 is read from `hexagonmath.org`, classed `open-repository` and described as CC BY 4.0 (README line 1690); I could not classify the host. OpenAI26 is read from a code repository with no licence recorded.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d6774637a2bbb85b1ddefa7391d1231333cbcc79", "job": "RT-EllipticCurveModularityImaginaryQuadraticPartII~2a", "model": "fable", "worker": "chris-x26"} -->
